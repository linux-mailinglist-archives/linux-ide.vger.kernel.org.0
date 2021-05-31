Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44E0395F8A
	for <lists+linux-ide@lfdr.de>; Mon, 31 May 2021 16:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233227AbhEaOMa (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 31 May 2021 10:12:30 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3354 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232385AbhEaOKc (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 31 May 2021 10:10:32 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FtxrM6B7nz67Sq;
        Mon, 31 May 2021 22:05:07 +0800 (CST)
Received: from dggema755-chm.china.huawei.com (10.1.198.197) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 22:08:50 +0800
Received: from huawei.com (10.90.53.225) by dggema755-chm.china.huawei.com
 (10.1.198.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 31
 May 2021 22:08:49 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <axboe@kernel.dk>
CC:     <linux-ide@vger.kernel.org>
Subject: [PATCH -next] ata: sata_rcar: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
Date:   Mon, 31 May 2021 22:22:48 +0800
Message-ID: <20210531142248.29944-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggema755-chm.china.huawei.com (10.1.198.197)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Using pm_runtime_resume_and_get is more appropriate
for simplifing code

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/ata/sata_rcar.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
index 44b0ed8f6bb8..0934870388de 100644
--- a/drivers/ata/sata_rcar.c
+++ b/drivers/ata/sata_rcar.c
@@ -989,11 +989,9 @@ static int sata_rcar_resume(struct device *dev)
 	void __iomem *base = priv->base;
 	int ret;
 
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		pm_runtime_put(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	if (priv->type == RCAR_GEN3_SATA) {
 		sata_rcar_init_module(priv);
@@ -1017,11 +1015,9 @@ static int sata_rcar_restore(struct device *dev)
 	struct ata_host *host = dev_get_drvdata(dev);
 	int ret;
 
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		pm_runtime_put(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	sata_rcar_setup_port(host);
 
-- 
2.17.1

