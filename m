Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6126C502CF
	for <lists+linux-ide@lfdr.de>; Mon, 24 Jun 2019 09:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727586AbfFXHMe (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 24 Jun 2019 03:12:34 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51588 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727426AbfFXHMd (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 24 Jun 2019 03:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=qEtWmI88RiyaP/sTKR3fvS150WdddPM7l8bkWy4ssys=; b=C5gekisNTa+t0IydIplXsDHv0H
        dQ8ULlNXE2xNjzYUTsfOFigpkLCu5zqBXAx0LR3PeR06gYqPeVk/1oMMxYCMrFPq98uXvxE8wXWI+
        8WBo2GVCWlC8V2YxugmV3avaeqUSuyyQanyvFejTLVXyY4p+FR9GrrCJuRnvKQJRR2SvTCWW9Dn1F
        2cIlUO+ZmsckRvmIrXxwW7HlC1IVBaVM+RBoKqIrdaltR1UIN/JKmkV+llY/6le5UDBDPc1zGkHX+
        rkiER7r+7bTODYKqKIwo08/7Rh+5V8RHef91UmWgGil6h+Hg9lEDmtTkjYzwTjZkCY/ynXoOf1Nsn
        rEKwxNdQ==;
Received: from 213-225-6-159.nat.highway.a1.net ([213.225.6.159] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hfJ9U-0002ea-Ij; Mon, 24 Jun 2019 07:12:32 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mikael Pettersson <mikpelinux@gmail.com>
Cc:     linux-ide@vger.kernel.org
Subject: [PATCH 2/8] ahci: use dma_set_mask_and_coherent
Date:   Mon, 24 Jun 2019 09:12:18 +0200
Message-Id: <20190624071224.24019-3-hch@lst.de>
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
 drivers/ata/ahci.c | 33 ++++++++-------------------------
 1 file changed, 8 insertions(+), 25 deletions(-)

diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
index f7652baa6337..ad840f20f8e2 100644
--- a/drivers/ata/ahci.c
+++ b/drivers/ata/ahci.c
@@ -901,40 +901,23 @@ static int ahci_pci_device_resume(struct device *dev)
 
 static int ahci_configure_dma_masks(struct pci_dev *pdev, int using_dac)
 {
+	const int dma_bits = using_dac ? 64 : 32;
 	int rc;
 
 	/*
 	 * If the device fixup already set the dma_mask to some non-standard
 	 * value, don't extend it here. This happens on STA2X11, for example.
+	 *
+	 * XXX: manipulating the DMA mask from platform code is completely
+	 * bogus, platform code should use dev->bus_dma_mask instead..
 	 */
 	if (pdev->dma_mask && pdev->dma_mask < DMA_BIT_MASK(32))
 		return 0;
 
-	if (using_dac &&
-	    !dma_set_mask(&pdev->dev, DMA_BIT_MASK(64))) {
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
-	return 0;
+	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(dma_bits));
+	if (rc)
+		dev_err(&pdev->dev, "DMA enable failed\n");
+	return rc;
 }
 
 static void ahci_pci_print_info(struct ata_host *host)
-- 
2.20.1

