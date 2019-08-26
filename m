Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9858F9CDAB
	for <lists+linux-ide@lfdr.de>; Mon, 26 Aug 2019 12:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730607AbfHZK5t (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 26 Aug 2019 06:57:49 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45586 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730199AbfHZK5t (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 26 Aug 2019 06:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=5P9OJMQBpjh/JbEPN7KqyuH8XEueLo9qdNAdvA71jxs=; b=mJb7YrCv67SEw0j+KM1xF0LVMH
        plZBeARmuLpSIU5wW1COoGYjBQzlg+uMBbGxaNgEnSvWiDcAAEqfLCSXHF9trnhT+nvewcPSg89Z6
        jB/qJM8U/nOAQwPPcHxfff62+cKTlucunanLQ0viM4STqI5C3fO/yNYLG/1/H+KWpiFisPCB0XJ/J
        KPdbW0JH07YICIaNGH3MFI39VGrTy8S/1ZiFeT0y81MzufuVLQDx1TbkF0EesvGQyrP+EtGmaPVt+
        6D/5/vrHpX93KZLtvaTQTtrZABClhNx1JE2H6sBjiPlA420HfLgLER0mXvIwnjlo/7jscAnm1KNAM
        uenuPi4A==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i2Ch1-0007iK-M0; Mon, 26 Aug 2019 10:57:48 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mikael Pettersson <mikpelinux@gmail.com>
Cc:     linux-ide@vger.kernel.org
Subject: [PATCH 7/8] sata_sil24: use dma_set_mask_and_coherent
Date:   Mon, 26 Aug 2019 12:57:24 +0200
Message-Id: <20190826105725.19405-8-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826105725.19405-1-hch@lst.de>
References: <20190826105725.19405-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Use the dma_set_mask_and_coherent helper to set the DMA mask.  Rely
on the relatively recent change that setting a larger than required
mask will never fail to avoid the need for the boilerplate 32-bit
fallback code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/ata/sata_sil24.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/ata/sata_sil24.c b/drivers/ata/sata_sil24.c
index 98aad8206921..7bef82de53ca 100644
--- a/drivers/ata/sata_sil24.c
+++ b/drivers/ata/sata_sil24.c
@@ -1301,28 +1301,10 @@ static int sil24_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	host->iomap = iomap;
 
 	/* configure and activate the device */
-	if (!dma_set_mask(&pdev->dev, DMA_BIT_MASK(64))) {
-		rc = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(64));
-		if (rc) {
-			rc = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
-			if (rc) {
-				dev_err(&pdev->dev,
-					"64-bit DMA enable failed\n");
-				return rc;
-			}
-		}
-	} else {
-		rc = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
-		if (rc) {
-			dev_err(&pdev->dev, "32-bit DMA enable failed\n");
-			return rc;
-		}
-		rc = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
-		if (rc) {
-			dev_err(&pdev->dev,
-				"32-bit consistent DMA enable failed\n");
-			return rc;
-		}
+	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (rc) {
+		dev_err(&pdev->dev, "DMA enable failed\n");
+		return rc;
 	}
 
 	/* Set max read request size to 4096.  This slightly increases
-- 
2.20.1

