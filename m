Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD52761861
	for <lists+linux-ide@lfdr.de>; Tue, 25 Jul 2023 14:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbjGYMaq (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 25 Jul 2023 08:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbjGYMaq (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 25 Jul 2023 08:30:46 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3DC710FA
        for <linux-ide@vger.kernel.org>; Tue, 25 Jul 2023 05:30:40 -0700 (PDT)
Received: from dggpemm100010.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R9GWK4Tf2ztRlJ;
        Tue, 25 Jul 2023 20:27:25 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm100010.china.huawei.com (7.185.36.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 20:30:38 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 25 Jul
 2023 20:30:38 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-ide@vger.kernel.org>
CC:     <s.shtylyov@omp.ru>, <dlemoal@kernel.org>, <robh@kernel.org>,
        <yangyingliang@huawei.com>
Subject: [PATCH] ata: pata_octeon_cf: fix error return code in octeon_cf_probe()
Date:   Tue, 25 Jul 2023 20:28:09 +0800
Message-ID: <20230725122809.521331-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The 'rv' will be set to 0 after calling of_property_read_reg(),
return correct error code in the error path.

Fixes: d0b2461678b1 ("ata: Use of_property_read_reg() to parse "reg"")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/ata/pata_octeon_cf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/pata_octeon_cf.c b/drivers/ata/pata_octeon_cf.c
index ff538b858928..6b46e20b3830 100644
--- a/drivers/ata/pata_octeon_cf.c
+++ b/drivers/ata/pata_octeon_cf.c
@@ -893,12 +893,12 @@ static int octeon_cf_probe(struct platform_device *pdev)
 	cs0 = devm_ioremap(&pdev->dev, res_cs0->start,
 				   resource_size(res_cs0));
 	if (!cs0)
-		return rv;
+		return -EINVAL;
 
 	/* allocate host */
 	host = ata_host_alloc(&pdev->dev, 1);
 	if (!host)
-		return rv;
+		return -ENOMEM;
 
 	ap = host->ports[0];
 	ap->private_data = cf_port;
-- 
2.25.1

