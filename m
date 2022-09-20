Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49D265BE357
	for <lists+linux-ide@lfdr.de>; Tue, 20 Sep 2022 12:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbiITKgJ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 20 Sep 2022 06:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbiITKfw (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 20 Sep 2022 06:35:52 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C67267330B;
        Tue, 20 Sep 2022 03:34:03 -0700 (PDT)
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MWyTD3QMTz67v9b;
        Tue, 20 Sep 2022 18:29:20 +0800 (CST)
Received: from lhrpeml500003.china.huawei.com (7.191.162.67) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 12:34:01 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhrpeml500003.china.huawei.com (7.191.162.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 11:33:58 +0100
From:   John Garry <john.garry@huawei.com>
To:     <damien.lemoal@opensource.wdc.com>, <jejb@linux.ibm.com>,
        <martin.petersen@oracle.com>, <hare@suse.de>, <hch@lst.de>
CC:     <linux-ide@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <brking@us.ibm.com>,
        John Garry <john.garry@huawei.com>
Subject: [PATCH RFC 4/6] ata: libata-scsi: Add ata_scsi_setup_sdev()
Date:   Tue, 20 Sep 2022 18:27:08 +0800
Message-ID: <1663669630-21333-5-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1663669630-21333-1-git-send-email-john.garry@huawei.com>
References: <1663669630-21333-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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

Add a function to setup the sdev associated with an ata_device.

Currently in libata to create the sdev we call __scsi_add_device() to
create the sdev and execute the scan. However if we want to move to a
2-step process where we allocate the sdev early in the port probe, then
we need a separate function just to allocate the sdev.

We add a ata_port_operations callback .setup_scsi_device for when the
driver needs a custom setup. This is essentially for libsas, which does
not use the same options for sdev parent and id.

Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/ata/libata-scsi.c | 25 +++++++++++++++++++++++++
 drivers/ata/libata.h      |  1 +
 include/linux/libata.h    |  2 ++
 3 files changed, 28 insertions(+)

diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
index 29e2f55c6faa..88f39ab10a92 100644
--- a/drivers/ata/libata-scsi.c
+++ b/drivers/ata/libata-scsi.c
@@ -4257,6 +4257,31 @@ static void ata_scsi_assign_ofnode(struct ata_device *dev, struct ata_port *ap)
 }
 #endif
 
+int ata_scsi_setup_sdev(struct ata_device *dev)
+{
+	u64 lun = 0;
+	int channel = 0;
+	uint id = 0;
+	struct ata_link *link = dev->link;
+	struct ata_port *ap = link->ap;
+	struct Scsi_Host *shost = ap->scsi_host;
+	struct device *parent = &shost->shost_gendev;
+	struct scsi_device *sdev;
+
+	if (ap->ops->setup_scsi_device)
+		return ap->ops->setup_scsi_device(dev);
+
+	if (ata_is_host_link(link))
+		id = dev->devno;
+	else
+		channel = link->pmp;
+	sdev = scsi_get_dev(parent, channel, id, lun);
+	if (!sdev)
+		return -ENODEV;
+	dev->sdev = sdev;
+	return 0;
+}
+
 void ata_scsi_scan_host(struct ata_port *ap, int sync)
 {
 	int tries = 5;
diff --git a/drivers/ata/libata.h b/drivers/ata/libata.h
index 98bc8649c63f..ca6c3e0f81ea 100644
--- a/drivers/ata/libata.h
+++ b/drivers/ata/libata.h
@@ -113,6 +113,7 @@ extern struct ata_device *ata_scsi_find_dev(struct ata_port *ap,
 					    const struct scsi_device *scsidev);
 extern int ata_scsi_add_hosts(struct ata_host *host,
 			      struct scsi_host_template *sht);
+extern int ata_scsi_setup_sdev(struct ata_device *dev);
 extern void ata_scsi_scan_host(struct ata_port *ap, int sync);
 extern int ata_scsi_offline_dev(struct ata_device *dev);
 extern void ata_scsi_set_sense(struct ata_device *dev,
diff --git a/include/linux/libata.h b/include/linux/libata.h
index 698032e5ef2d..67aa1d7d909b 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -968,6 +968,8 @@ struct ata_port_operations {
 	void (*phy_reset)(struct ata_port *ap);
 	void (*eng_timeout)(struct ata_port *ap);
 
+	int (*setup_scsi_device)(struct ata_device *dev);
+
 	/*
 	 * ->inherits must be the last field and all the preceding
 	 * fields must be pointers.
-- 
2.35.3

