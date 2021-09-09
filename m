Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 033A5405199
	for <lists+linux-ide@lfdr.de>; Thu,  9 Sep 2021 14:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353311AbhIIMhN (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 9 Sep 2021 08:37:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:39522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1354239AbhIIMaR (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Thu, 9 Sep 2021 08:30:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51EC861B3F;
        Thu,  9 Sep 2021 11:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631188355;
        bh=R5DxAoygujqDzBMuS+3iVJzTamDZS/jf4GHwAfptkMg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vNyMfprS0NaKjZfPS3sasZwIXnS7gsdghlw8ro7upvlFhDtH3HoIevwjrshQKwFU/
         8g134M8D8JhS/n6EmrgtF4jRmou6Zk4LD55N39Q1hN+BKB+sOE39WXLYjjkfuPnwHz
         ZboIKz9kBs01yi6QFxCkZgmZ7NFlKGjtj9q5eO/24/NREWc3geeU0eC+O+fGsF258Q
         7+LkP53Y3NJf+gipJLjRTWn+5NFsFCpm8fX1N25GfrlDbkbjaHQeH49w3/6sw4K9mD
         36EOz19ANU2hBJ84+vUnvzaq6FPghCYnTH9OjJAACfqkynJ/RgeoyvSV02IAUTCI1j
         1ibT+KOav5peA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>,
        linux-ide@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 060/176] ata: sata_dwc_460ex: No need to call phy_exit() befre phy_init()
Date:   Thu,  9 Sep 2021 07:49:22 -0400
Message-Id: <20210909115118.146181-60-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115118.146181-1-sashal@kernel.org>
References: <20210909115118.146181-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[ Upstream commit 3ad4a31620355358316fa08fcfab37b9d6c33347 ]

Last change to device managed APIs cleaned up error path to simple phy_exit()
call, which in some cases has been executed with NULL parameter. This per se
is not a problem, but rather logical misconception: no need to free resource
when it's for sure has not been allocated yet. Fix the driver accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/20210727125130.19977-1-andriy.shevchenko@linux.intel.com
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ata/sata_dwc_460ex.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.c
index 9dcef6ac643b..982fe9112532 100644
--- a/drivers/ata/sata_dwc_460ex.c
+++ b/drivers/ata/sata_dwc_460ex.c
@@ -1249,24 +1249,20 @@ static int sata_dwc_probe(struct platform_device *ofdev)
 	irq = irq_of_parse_and_map(np, 0);
 	if (irq == NO_IRQ) {
 		dev_err(&ofdev->dev, "no SATA DMA irq\n");
-		err = -ENODEV;
-		goto error_out;
+		return -ENODEV;
 	}
 
 #ifdef CONFIG_SATA_DWC_OLD_DMA
 	if (!of_find_property(np, "dmas", NULL)) {
 		err = sata_dwc_dma_init_old(ofdev, hsdev);
 		if (err)
-			goto error_out;
+			return err;
 	}
 #endif
 
 	hsdev->phy = devm_phy_optional_get(hsdev->dev, "sata-phy");
-	if (IS_ERR(hsdev->phy)) {
-		err = PTR_ERR(hsdev->phy);
-		hsdev->phy = NULL;
-		goto error_out;
-	}
+	if (IS_ERR(hsdev->phy))
+		return PTR_ERR(hsdev->phy);
 
 	err = phy_init(hsdev->phy);
 	if (err)
-- 
2.30.2

