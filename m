Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D68246D884
	for <lists+linux-ide@lfdr.de>; Wed,  8 Dec 2021 17:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbhLHQi7 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 8 Dec 2021 11:38:59 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:37898 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237095AbhLHQhB (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 8 Dec 2021 11:37:01 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 7BEE41FE38;
        Wed,  8 Dec 2021 16:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1638981181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t3U77zRixbknUWyT3Y4ox9jHewaGOcy+Gkww4xxZZ9s=;
        b=WMwVDek0YoybFd1vl8/KDC/W0B7oiXBjTYjdsJWABnITgRjCUgWKvSQG05IZWrPS1jSUDK
        U5Rx0vLtPMEP9oVPNszo9Kdbs+cwzV2F61V7HeidB8mcqp6QXhWOcy8byzH02+t0gsTgSx
        e5Jy4QdV+bkXAAVnLsPP8rPPaTRQLSQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1638981181;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t3U77zRixbknUWyT3Y4ox9jHewaGOcy+Gkww4xxZZ9s=;
        b=NkpR1eScy8bK5GR8WvCjezxB+m4gwc8koNen95gw/MaD7jE0lMyqA+FT1Yr3AdPIc1Vv9/
        rfP0Mw0KmvePslCA==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
        by relay2.suse.de (Postfix) with ESMTP id 79D3FA3BDC;
        Wed,  8 Dec 2021 16:33:01 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
        id 768355191FEB; Wed,  8 Dec 2021 17:33:01 +0100 (CET)
From:   Hannes Reinecke <hare@suse.de>
To:     Damien LeMoal <damien.lemoal@wdc.com>
Cc:     linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 71/73] pata_hpt3x2n: convert pr_err() calls
Date:   Wed,  8 Dec 2021 17:32:53 +0100
Message-Id: <20211208163255.114660-72-hare@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211208163255.114660-1-hare@suse.de>
References: <20211208163255.114660-1-hare@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Convert pr_err() calls to dev_err()

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/sata_gemini.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/sata_gemini.c b/drivers/ata/sata_gemini.c
index f793564f3d78..440a63de20d0 100644
--- a/drivers/ata/sata_gemini.c
+++ b/drivers/ata/sata_gemini.c
@@ -253,12 +253,12 @@ static int gemini_sata_bridge_init(struct sata_gemini *sg)
 
 	ret = clk_prepare_enable(sg->sata0_pclk);
 	if (ret) {
-		pr_err("failed to enable SATA0 PCLK\n");
+		dev_err(dev, "failed to enable SATA0 PCLK\n");
 		return ret;
 	}
 	ret = clk_prepare_enable(sg->sata1_pclk);
 	if (ret) {
-		pr_err("failed to enable SATA1 PCLK\n");
+		dev_err(dev, "failed to enable SATA1 PCLK\n");
 		clk_disable_unprepare(sg->sata0_pclk);
 		return ret;
 	}
-- 
2.29.2

