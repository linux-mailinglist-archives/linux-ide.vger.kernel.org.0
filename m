Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1518502D2
	for <lists+linux-ide@lfdr.de>; Mon, 24 Jun 2019 09:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727661AbfFXHMm (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 24 Jun 2019 03:12:42 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51624 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727660AbfFXHMm (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 24 Jun 2019 03:12:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=2SW7FyzWGvCwukocO+k5/OIwaKHAOtc4xqaw4s7g9kE=; b=u+lhAhw/+C8zMgY+nk8q8V4lGK
        W4VrRzUdFuXqhOcLpgUUZr1QKtsY3n5uRJtRoKPU4gAfypjW1tCpwOgUMvgcFQiHvfM2aOwcrClmz
        hY/nDcpCwEw4yf+9UWHYM8+21z3CHBlyXs4yWoUE7p7f1MdyjpqgOdtxKAwpUaW7XCEYIqXUo/2Tv
        osxMV3yBG6/Pa4xnojN6HbHevWqZActALxCbZuLhFOZTJDqr64qYejHs1/xuSfhr+ac0RDFwjTjgp
        Gxv95kfqlHurzy8E2b8BKPHyzpU5o+8I48fv3Q8kEo7amgTeuX13C4olYduJhnjAB6wvNUO4L9/Id
        nHZ2xvtQ==;
Received: from 213-225-6-159.nat.highway.a1.net ([213.225.6.159] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hfJ9c-0002gD-Cv; Mon, 24 Jun 2019 07:12:40 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mikael Pettersson <mikpelinux@gmail.com>
Cc:     linux-ide@vger.kernel.org
Subject: [PATCH 5/8] sata_nv: use dma_set_mask_and_coherent
Date:   Mon, 24 Jun 2019 09:12:21 +0200
Message-Id: <20190624071224.24019-6-hch@lst.de>
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
 drivers/ata/sata_nv.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/ata/sata_nv.c b/drivers/ata/sata_nv.c
index 54bfab15c74a..194cb167d359 100644
--- a/drivers/ata/sata_nv.c
+++ b/drivers/ata/sata_nv.c
@@ -1122,14 +1122,10 @@ static int nv_adma_port_start(struct ata_port *ap)
 
 	/*
 	 * Now that the legacy PRD and padding buffer are allocated we can
-	 * try to raise the DMA mask to allocate the CPB/APRD table.
+	 * raise the DMA mask to allocate the CPB/APRD table.
 	 */
-	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
-	if (rc) {
-		rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
-		if (rc)
-			return rc;
-	}
+	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+
 	pp->adma_dma_mask = *dev->dma_mask;
 
 	mem = dmam_alloc_coherent(dev, NV_ADMA_PORT_PRIV_DMA_SZ,
-- 
2.20.1

