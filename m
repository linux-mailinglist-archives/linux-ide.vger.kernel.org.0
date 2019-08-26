Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B65FB9CDA7
	for <lists+linux-ide@lfdr.de>; Mon, 26 Aug 2019 12:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730306AbfHZK5i (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 26 Aug 2019 06:57:38 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45536 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730199AbfHZK5i (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 26 Aug 2019 06:57:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=aw+7XU6MuWjQxjWW7Mcc3DHxkBoO7y4+DXCT2jzxFyQ=; b=RLpxBcVE+wYXs5oh77wwmGmLjH
        2J8cDb6skQOjz6cjd+acSto+E3Nz0S8FOCOmgHnk7Rd5EDxO6aFa5trC1Ewy1ZgdtlG0Vbdn7uk5V
        tX4LE0UFbvO8pY5kGv6ltip+W8ZJjA5o+6Sd2N0/XApk6jt+D+9Y3yKmRrIvIcgyb/Iul7vqc2LF2
        Ngpv8uWb0SqDXUbpWbqC9Ewez1ygFAnlKFLgwpvu2WbXVELNHFZTvY5z6JKEFwAX/hjnhrneLKNpf
        rRfONCm0pWhdfELMiagOIEct8B5mfppexbPvSoUCdHglg9s/zRjojBtJqaFyxpWEtQU7GMDTQ6Nfj
        pQkfyLjg==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i2Cgq-0007fo-RM; Mon, 26 Aug 2019 10:57:37 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mikael Pettersson <mikpelinux@gmail.com>
Cc:     linux-ide@vger.kernel.org
Subject: [PATCH 3/8] pdc_adma: use dma_set_mask_and_coherent
Date:   Mon, 26 Aug 2019 12:57:20 +0200
Message-Id: <20190826105725.19405-4-hch@lst.de>
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
 drivers/ata/pdc_adma.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/ata/pdc_adma.c b/drivers/ata/pdc_adma.c
index c5bbb07aa7d9..cb490531b62e 100644
--- a/drivers/ata/pdc_adma.c
+++ b/drivers/ata/pdc_adma.c
@@ -572,23 +572,6 @@ static void adma_host_init(struct ata_host *host, unsigned int chip_id)
 		adma_reset_engine(host->ports[port_no]);
 }
 
-static int adma_set_dma_masks(struct pci_dev *pdev, void __iomem *mmio_base)
-{
-	int rc;
-
-	rc = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
-	if (rc) {
-		dev_err(&pdev->dev, "32-bit DMA enable failed\n");
-		return rc;
-	}
-	rc = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
-	if (rc) {
-		dev_err(&pdev->dev, "32-bit consistent DMA enable failed\n");
-		return rc;
-	}
-	return 0;
-}
-
 static int adma_ata_init_one(struct pci_dev *pdev,
 			     const struct pci_device_id *ent)
 {
@@ -619,9 +602,11 @@ static int adma_ata_init_one(struct pci_dev *pdev,
 	host->iomap = pcim_iomap_table(pdev);
 	mmio_base = host->iomap[ADMA_MMIO_BAR];
 
-	rc = adma_set_dma_masks(pdev, mmio_base);
-	if (rc)
+	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (rc) {
+		dev_err(&pdev->dev, "32-bit DMA enable failed\n");
 		return rc;
+	}
 
 	for (port_no = 0; port_no < ADMA_PORTS; ++port_no) {
 		struct ata_port *ap = host->ports[port_no];
-- 
2.20.1

