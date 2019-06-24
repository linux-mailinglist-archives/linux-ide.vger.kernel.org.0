Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0CCD502D1
	for <lists+linux-ide@lfdr.de>; Mon, 24 Jun 2019 09:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727659AbfFXHMj (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 24 Jun 2019 03:12:39 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51612 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727426AbfFXHMj (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 24 Jun 2019 03:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Fd6/74AF0X3eTyOWo8Zb9Xda3L8naA4smyuTxufCqg4=; b=rKp1y6CwnRpabRB7m8+NeUDiDe
        OgDFK6r4GOYrdgnrPGeDbCGTKYf1UIvHBT0XRViRlBCITYks7yQ0qgGRhXf4M0DWlyxhzIq9CzJ+B
        pdwUWAkf222pyjP2SyaxS7f7MstDGY63eV0ch1H2CR/szQuBCYJfa2VyyfPA3kYvRIK9y4urlhsEU
        PN3F/XI5f37eSGi4pimX2vlCUX+9fmLf0AYOoqisMxqkfMidA6PXdvvM6XVzugAH2O7VPx6YZlyiI
        Lhsdd6eiz5e9S4I7Y0sPgTXc9izEyyTz12ahOa5qpowwgBnIDyqcIw6AE94M135Dg2QjcQbBzabRT
        wFSrihAg==;
Received: from 213-225-6-159.nat.highway.a1.net ([213.225.6.159] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hfJ9Z-0002fk-R7; Mon, 24 Jun 2019 07:12:38 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mikael Pettersson <mikpelinux@gmail.com>
Cc:     linux-ide@vger.kernel.org
Subject: [PATCH 4/8] sata_mv: use dma_set_mask_and_coherent
Date:   Mon, 24 Jun 2019 09:12:20 +0200
Message-Id: <20190624071224.24019-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624071224.24019-1-hch@lst.de>
References: <20190624071224.24019-1-hch@lst.de>
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

