Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0BCF9CDA8
	for <lists+linux-ide@lfdr.de>; Mon, 26 Aug 2019 12:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730387AbfHZK5l (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 26 Aug 2019 06:57:41 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45548 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730199AbfHZK5l (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 26 Aug 2019 06:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Fd6/74AF0X3eTyOWo8Zb9Xda3L8naA4smyuTxufCqg4=; b=n2TS9C7kkTc63lFYwSHUb0XCyQ
        /USz/MWUt0//0Pv3cFYi6rTU9DLemdzFnBQuDswmU6Ud6E/HMAxO9rQA29sYBya9ffV7iRzZDG9mq
        IvQrNTs2IfmaUgpR74CM0R85lZWhC2xlbx36iwDir3I4jCwNjXPzhjqzpymguLSwireep/8PG/NFK
        6UYZqtOZsZt7UrRlaGRCH50/CJ8b5kOEVFTU4b73YzXZpAkMXF+sBH6dt3qCkpCZ8DMFD1fQ+DxmF
        2mJoX5quKE7tJmjUA3wKy0WcPHyq8cJZxfGTG4uSa8E7fgO6vogMFf2W5Rb1XuJYO+NFeMbBr0lno
        ilrdiFRg==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i2Cgt-0007gc-HJ; Mon, 26 Aug 2019 10:57:39 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mikael Pettersson <mikpelinux@gmail.com>
Cc:     linux-ide@vger.kernel.org
Subject: [PATCH 4/8] sata_mv: use dma_set_mask_and_coherent
Date:   Mon, 26 Aug 2019 12:57:21 +0200
Message-Id: <20190826105725.19405-5-hch@lst.de>
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
 drivers/ata/sata_mv.c | 38 ++++----------------------------------
 1 file changed, 4 insertions(+), 34 deletions(-)

diff --git a/drivers/ata/sata_mv.c b/drivers/ata/sata_mv.c
index da585d2bded6..ad385a113391 100644
--- a/drivers/ata/sata_mv.c
+++ b/drivers/ata/sata_mv.c
@@ -4314,38 +4314,6 @@ static struct pci_driver mv_pci_driver = {
 
 };
 
-/* move to PCI layer or libata core? */
-static int pci_go_64(struct pci_dev *pdev)
-{
-	int rc;
-
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
-	}
-
-	return rc;
-}
-
 /**
  *      mv_print_info - Dump key info to kernel log for perusal.
  *      @host: ATA host to print info about
@@ -4430,9 +4398,11 @@ static int mv_pci_init_one(struct pci_dev *pdev,
 	host->iomap = pcim_iomap_table(pdev);
 	hpriv->base = host->iomap[MV_PRIMARY_BAR];
 
-	rc = pci_go_64(pdev);
-	if (rc)
+	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (rc) {
+		dev_err(&pdev->dev, "DMA enable failed\n");
 		return rc;
+	}
 
 	rc = mv_create_dma_pools(hpriv, &pdev->dev);
 	if (rc)
-- 
2.20.1

