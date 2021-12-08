Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9112D46D867
	for <lists+linux-ide@lfdr.de>; Wed,  8 Dec 2021 17:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237027AbhLHQg4 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 8 Dec 2021 11:36:56 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:37884 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237036AbhLHQgl (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 8 Dec 2021 11:36:41 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id AE9821FE19;
        Wed,  8 Dec 2021 16:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1638981180; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=blHxTHASdShcDS68QjmW2iURnMqPfvw+I17evoNK+xg=;
        b=JgQZSc2p2NrPAwLbU9aFqvymZsLZJCdAqTXVQeeQyfBeCdgiSdRwsu2O+lrAgTcEc/wOev
        r+mGn1FQGvvYgjevraPM3MXb8neCKUDUmyFkAfExEPPOg0a2AQYZeIfcPtKkh9sCoTbibh
        tqhJdUbRSQdpw14IpW3t7uXrWfS4JyQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1638981180;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=blHxTHASdShcDS68QjmW2iURnMqPfvw+I17evoNK+xg=;
        b=xpBuLBYeebO3RXtZWOZ+KEPaVR45AlepwbpOl4svFwsgC80CN1amKKJA6pHZyxGZi1fVE7
        3jgmL3HCKrtS/kCA==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
        by relay2.suse.de (Postfix) with ESMTP id ABA6EA3BB6;
        Wed,  8 Dec 2021 16:33:00 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
        id A85D75191FA5; Wed,  8 Dec 2021 17:33:00 +0100 (CET)
From:   Hannes Reinecke <hare@suse.de>
To:     Damien LeMoal <damien.lemoal@wdc.com>
Cc:     linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 36/73] sata_qstor: Drop pointless VPRINTK() calls
Date:   Wed,  8 Dec 2021 17:32:18 +0100
Message-Id: <20211208163255.114660-37-hare@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211208163255.114660-1-hare@suse.de>
References: <20211208163255.114660-1-hare@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/sata_qstor.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/ata/sata_qstor.c b/drivers/ata/sata_qstor.c
index 2b4ccdca71c6..db62c07f820f 100644
--- a/drivers/ata/sata_qstor.c
+++ b/drivers/ata/sata_qstor.c
@@ -252,9 +252,6 @@ static unsigned int qs_fill_sg(struct ata_queued_cmd *qc)
 		len = sg_dma_len(sg);
 		*(__le32 *)prd = cpu_to_le32(len);
 		prd += sizeof(u64);
-
-		VPRINTK("PRD[%u] = (0x%llX, 0x%X)\n", si,
-					(unsigned long long)addr, len);
 	}
 
 	return si;
@@ -268,8 +265,6 @@ static enum ata_completion_errors qs_qc_prep(struct ata_queued_cmd *qc)
 	u64 addr;
 	unsigned int nelem;
 
-	VPRINTK("ENTER\n");
-
 	qs_enter_reg_mode(qc->ap);
 	if (qc->tf.protocol != ATA_PROT_DMA)
 		return AC_ERR_OK;
@@ -304,8 +299,6 @@ static inline void qs_packet_start(struct ata_queued_cmd *qc)
 	struct ata_port *ap = qc->ap;
 	u8 __iomem *chan = qs_mmio_base(ap->host) + (ap->port_no * 0x4000);
 
-	VPRINTK("ENTER, ap %p\n", ap);
-
 	writeb(QS_CTR0_CLER, chan + QS_CCT_CTR0);
 	wmb();                             /* flush PRDs and pkt to memory */
 	writel(QS_CCF_RUN_PKT, chan + QS_CCT_CFF);
@@ -435,14 +428,10 @@ static irqreturn_t qs_intr(int irq, void *dev_instance)
 	unsigned int handled = 0;
 	unsigned long flags;
 
-	VPRINTK("ENTER\n");
-
 	spin_lock_irqsave(&host->lock, flags);
 	handled  = qs_intr_pkt(host) | qs_intr_mmio(host);
 	spin_unlock_irqrestore(&host->lock, flags);
 
-	VPRINTK("EXIT\n");
-
 	return IRQ_RETVAL(handled);
 }
 
-- 
2.29.2

