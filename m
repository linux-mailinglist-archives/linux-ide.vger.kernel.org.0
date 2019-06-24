Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44E08502D4
	for <lists+linux-ide@lfdr.de>; Mon, 24 Jun 2019 09:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbfFXHMp (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 24 Jun 2019 03:12:45 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51640 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727426AbfFXHMo (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 24 Jun 2019 03:12:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=TdCl/oDVI89S+qI5duF+DZkYvd5hH4nStemyoIKDngo=; b=MsEjbbVm0I4qnOjtSTFdgfbhHM
        +JhvaKnbt7FpVAJu5DOEPZ+B3U8fZ/k5TlRiiTCf+7al42toYG8CnBS1gsmmYFRl/W3T/rjXNf3VE
        NzPyG25lvaMJEMEPhaRixe7Sy256ZWdTSuMltEfUei6aUN/k0mHGJUZhtnzUzROL0K5N8RQZPYqrb
        CZpjRsI/ueHtZDXQoxvc0qqg0wHXhpCwUbWklvDu6yBQfKQbzcnUsKIWSRZmHUjLbABjN6jH6Yco5
        5NJ0+AadM9fLAJDZUtHsBd5tTMUVGiWBlUp5rHjP1l/jmxhOEs2GG3BIfdsSvzSffcQQZdjLylt9z
        u/KxAJaQ==;
Received: from 213-225-6-159.nat.highway.a1.net ([213.225.6.159] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hfJ9e-0002gZ-TN; Mon, 24 Jun 2019 07:12:43 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mikael Pettersson <mikpelinux@gmail.com>
Cc:     linux-ide@vger.kernel.org
Subject: [PATCH 6/8] sata_qstor: use dma_set_mask_and_coherent
Date:   Mon, 24 Jun 2019 09:12:22 +0200
Message-Id: <20190624071224.24019-7-hch@lst.de>
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
 drivers/ata/sata_qstor.c | 34 +++++++---------------------------
 1 file changed, 7 insertions(+), 27 deletions(-)

diff --git a/drivers/ata/sata_qstor.c b/drivers/ata/sata_qstor.c
index 7ec0c216a6a6..5e44bdce9a23 100644
--- a/drivers/ata/sata_qstor.c
+++ b/drivers/ata/sata_qstor.c
@@ -538,33 +538,13 @@ static void qs_host_init(struct ata_host *host, unsigned int chip_id)
 static int qs_set_dma_masks(struct pci_dev *pdev, void __iomem *mmio_base)
 {
 	u32 bus_info = readl(mmio_base + QS_HID_HPHY);
-	int rc, have_64bit_bus = (bus_info & QS_HPHY_64BIT);
-
-	if (have_64bit_bus &&
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
+	int dma_bits = (bus_info & QS_HPHY_64BIT) ? 64 : 32;
+	int rc;
+
+	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(dma_bits));
+	if (rc)
+		dev_err(&pdev->dev, "%d-bit DMA enable failed\n", dma_bits);
+	return rc;
 }
 
 static int qs_ata_init_one(struct pci_dev *pdev,
-- 
2.20.1

