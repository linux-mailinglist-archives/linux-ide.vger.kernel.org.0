Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC2326D777
	for <lists+linux-ide@lfdr.de>; Thu, 17 Sep 2020 11:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgIQJRJ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 17 Sep 2020 05:17:09 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:37700 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726180AbgIQJRG (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Thu, 17 Sep 2020 05:17:06 -0400
X-Greylist: delayed 906 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 05:17:05 EDT
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 844EF178D89699724417;
        Thu, 17 Sep 2020 17:01:57 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 17:01:53 +0800
From:   Qilong Zhang <zhangqilong3@huawei.com>
To:     <axboe@kernel.dk>
CC:     <linux-ide@vger.kernel.org>
Subject: [PATCH -next] ata: ahci_brcm: use devm_platform_ioremap_resource_byname
Date:   Thu, 17 Sep 2020 17:08:40 +0800
Message-ID: <20200917090840.107802-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Zhang Qilong <zhangqilong3@huawei.com>

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/ata/ahci_brcm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
index 49f7acbfcf01..13cdc45695f9 100644
--- a/drivers/ata/ahci_brcm.c
+++ b/drivers/ata/ahci_brcm.c
@@ -431,7 +431,6 @@ static int brcm_ahci_probe(struct platform_device *pdev)
 	const char *reset_name = NULL;
 	struct brcm_ahci_priv *priv;
 	struct ahci_host_priv *hpriv;
-	struct resource *res;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -445,8 +444,7 @@ static int brcm_ahci_probe(struct platform_device *pdev)
 	priv->version = (enum brcm_ahci_version)of_id->data;
 	priv->dev = dev;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "top-ctrl");
-	priv->top_ctrl = devm_ioremap_resource(dev, res);
+	priv->top_ctrl = devm_platform_ioremap_resource_byname(pdev, "top-ctrl");
 	if (IS_ERR(priv->top_ctrl))
 		return PTR_ERR(priv->top_ctrl);
 
-- 
2.17.1

