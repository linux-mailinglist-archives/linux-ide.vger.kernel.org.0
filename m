Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71BE460C8DF
	for <lists+linux-ide@lfdr.de>; Tue, 25 Oct 2022 11:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbiJYJvn (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 25 Oct 2022 05:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231704AbiJYJui (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 25 Oct 2022 05:50:38 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4698015ECD4;
        Tue, 25 Oct 2022 02:48:51 -0700 (PDT)
Received: from frapeml100006.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MxRrH0jvFz67bC8;
        Tue, 25 Oct 2022 17:45:19 +0800 (CST)
Received: from lhrpeml500003.china.huawei.com (7.191.162.67) by
 frapeml100006.china.huawei.com (7.182.85.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 25 Oct 2022 11:48:49 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhrpeml500003.china.huawei.com (7.191.162.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 25 Oct 2022 10:48:44 +0100
From:   John Garry <john.garry@huawei.com>
To:     <axboe@kernel.dk>, <damien.lemoal@opensource.wdc.com>,
        <jejb@linux.ibm.com>, <martin.petersen@oracle.com>,
        <jinpu.wang@cloud.ionos.com>, <hare@suse.de>, <bvanassche@acm.org>,
        <hch@lst.de>, <ming.lei@redhat.com>, <niklas.cassel@wdc.com>
CC:     <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-ide@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linuxarm@huawei.com>, John Garry <john.garry@huawei.com>
Subject: [PATCH RFC v3 13/22] scsi: scsi_transport_sas: Allocate end device target id in the rphy alloc
Date:   Tue, 25 Oct 2022 18:18:07 +0800
Message-ID: <1666693096-180008-14-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1666693096-180008-1-git-send-email-john.garry@huawei.com>
References: <1666693096-180008-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500003.china.huawei.com (7.191.162.67)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Currently the per-end device target id is allocated when adding the rphy,
which is when we execute the scan of the target.

However it will be useful to have the target id allocated earlier when
allocating the rphy for the end device. For libata we want to move to a
scheme of allocating the sdev early in the probe process and then later
executing the scan (for that target). As such, users of would libata would
require that the target id allocated earlier here (before the scan).

Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/scsi/scsi_transport_sas.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/scsi_transport_sas.c b/drivers/scsi/scsi_transport_sas.c
index da075dfc7cd0..c03e88990264 100644
--- a/drivers/scsi/scsi_transport_sas.c
+++ b/drivers/scsi/scsi_transport_sas.c
@@ -1433,6 +1433,7 @@ static void sas_rphy_initialize(struct sas_rphy *rphy)
 struct sas_rphy *sas_end_device_alloc(struct sas_port *parent)
 {
 	struct Scsi_Host *shost = dev_to_shost(&parent->dev);
+	struct sas_host_attrs *sas_host = to_sas_host_attrs(shost);
 	struct sas_end_device *rdev;
 
 	rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
@@ -1455,6 +1456,10 @@ struct sas_rphy *sas_end_device_alloc(struct sas_port *parent)
 	sas_rphy_initialize(&rdev->rphy);
 	transport_setup_device(&rdev->rphy.dev);
 
+	mutex_lock(&sas_host->lock);
+	rdev->rphy.scsi_target_id = sas_host->next_target_id++;
+	mutex_unlock(&sas_host->lock);
+
 	return &rdev->rphy;
 }
 EXPORT_SYMBOL(sas_end_device_alloc);
@@ -1500,6 +1505,17 @@ struct sas_rphy *sas_expander_alloc(struct sas_port *parent,
 }
 EXPORT_SYMBOL(sas_expander_alloc);
 
+static bool sas_rphy_valid_tproto_end_device(struct sas_rphy *rphy)
+{
+	struct sas_identify *identify = &rphy->identify;
+
+	if (identify->device_type != SAS_END_DEVICE)
+		return false;
+
+	return (identify->target_port_protocols &
+	    (SAS_PROTOCOL_SSP | SAS_PROTOCOL_STP | SAS_PROTOCOL_SATA));
+}
+
 /**
  * sas_rphy_add  -  add a SAS remote PHY to the device hierarchy
  * @rphy:	The remote PHY to be added
@@ -1529,16 +1545,9 @@ int sas_rphy_add(struct sas_rphy *rphy)
 
 	mutex_lock(&sas_host->lock);
 	list_add_tail(&rphy->list, &sas_host->rphy_list);
-	if (identify->device_type == SAS_END_DEVICE &&
-	    (identify->target_port_protocols &
-	     (SAS_PROTOCOL_SSP | SAS_PROTOCOL_STP | SAS_PROTOCOL_SATA)))
-		rphy->scsi_target_id = sas_host->next_target_id++;
-	else if (identify->device_type == SAS_END_DEVICE)
-		rphy->scsi_target_id = -1;
 	mutex_unlock(&sas_host->lock);
 
-	if (identify->device_type == SAS_END_DEVICE &&
-	    rphy->scsi_target_id != -1) {
+	if (sas_rphy_valid_tproto_end_device(rphy)) {
 		int lun;
 
 		if (identify->target_port_protocols & SAS_PROTOCOL_SSP)
@@ -1672,8 +1681,7 @@ static int sas_user_scan(struct Scsi_Host *shost, uint channel,
 
 	mutex_lock(&sas_host->lock);
 	list_for_each_entry(rphy, &sas_host->rphy_list, list) {
-		if (rphy->identify.device_type != SAS_END_DEVICE ||
-		    rphy->scsi_target_id == -1)
+		if (!sas_rphy_valid_tproto_end_device(rphy))
 			continue;
 
 		if ((channel == SCAN_WILD_CARD || channel == 0) &&
-- 
2.35.3

