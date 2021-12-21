Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB0E647BADA
	for <lists+linux-ide@lfdr.de>; Tue, 21 Dec 2021 08:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbhLUHW4 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 21 Dec 2021 02:22:56 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:52636 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231951AbhLUHWp (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 21 Dec 2021 02:22:45 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 391E621902;
        Tue, 21 Dec 2021 07:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1640071362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oIuXxAQkPBNVdBIj7LFlYTr68xCImrWSftyEwnOY5pw=;
        b=OKGE4H9CJvTTsnE5bpFf0wCp6lQJGd6iKIysxBEa+CTtuxSrkGkFct/YJrLbK4KXBBjPJl
        HebVvGcTGZiss7GmExwEQ9Mfzw+WkDsDkqp4jRxk1+otI/O2Jp8FgciiXpzy4o5op1830x
        VB+L64ERJ4jcUG1Mxwmb2PB/tsCsNjg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1640071362;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oIuXxAQkPBNVdBIj7LFlYTr68xCImrWSftyEwnOY5pw=;
        b=Z1Oy5lNy40aOo9ZRbt5CBUIPcC/YUNWxgVgHCkxNZ/VjLrY5g6Fh8hFGJsVaW3tKTuj2FW
        S67qEulEy/yV1oAw==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
        by relay2.suse.de (Postfix) with ESMTP id 33CBCA3BA4;
        Tue, 21 Dec 2021 07:22:42 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
        id 31B2951923B4; Tue, 21 Dec 2021 08:22:42 +0100 (CET)
From:   Hannes Reinecke <hare@suse.de>
To:     Damien LeMoal <damien.lemoal@wdc.com>
Cc:     linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 33/68] sata_nv: drop pointless VPRINTK() calls and convert remaining ones
Date:   Tue, 21 Dec 2021 08:20:56 +0100
Message-Id: <20211221072131.46673-34-hare@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211221072131.46673-1-hare@suse.de>
References: <20211221072131.46673-1-hare@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Quite some information from the VPRINTK() is already covered by
tracepoints, so remove the pointless calls and convert the remaining
ones to structured logging.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/sata_nv.c | 38 ++++++++++++++------------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/ata/sata_nv.c b/drivers/ata/sata_nv.c
index 06d381b9764e..7f14d0d31057 100644
--- a/drivers/ata/sata_nv.c
+++ b/drivers/ata/sata_nv.c
@@ -809,7 +809,7 @@ static int nv_adma_check_cpb(struct ata_port *ap, int cpb_num, int force_err)
 	struct nv_adma_port_priv *pp = ap->private_data;
 	u8 flags = pp->cpb[cpb_num].resp_flags;
 
-	VPRINTK("CPB %d, flags=0x%x\n", cpb_num, flags);
+	ata_port_dbg(ap, "CPB %d, flags=0x%x\n", cpb_num, flags);
 
 	if (unlikely((force_err ||
 		     flags & (NV_CPB_RESP_ATA_ERR |
@@ -1101,8 +1101,6 @@ static int nv_adma_port_start(struct ata_port *ap)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	u16 tmp;
 
-	VPRINTK("ENTER\n");
-
 	/*
 	 * Ensure DMA mask is set to 32-bit before allocating legacy PRD and
 	 * pad buffers.
@@ -1191,7 +1189,6 @@ static void nv_adma_port_stop(struct ata_port *ap)
 	struct nv_adma_port_priv *pp = ap->private_data;
 	void __iomem *mmio = pp->ctl_block;
 
-	VPRINTK("ENTER\n");
 	writew(0, mmio + NV_ADMA_CTL);
 }
 
@@ -1253,8 +1250,6 @@ static void nv_adma_setup_port(struct ata_port *ap)
 	void __iomem *mmio = ap->host->iomap[NV_MMIO_BAR];
 	struct ata_ioports *ioport = &ap->ioaddr;
 
-	VPRINTK("ENTER\n");
-
 	mmio += NV_ADMA_PORT + ap->port_no * NV_ADMA_PORT_SIZE;
 
 	ioport->cmd_addr	= mmio;
@@ -1375,8 +1370,6 @@ static enum ata_completion_errors nv_adma_qc_prep(struct ata_queued_cmd *qc)
 	if (qc->tf.protocol == ATA_PROT_NCQ)
 		ctl_flags |= NV_CPB_CTL_QUEUE | NV_CPB_CTL_FPDMA;
 
-	VPRINTK("qc->flags = 0x%lx\n", qc->flags);
-
 	nv_adma_tf_to_cpb(&qc->tf, cpb->tf);
 
 	if (qc->flags & ATA_QCFLAG_DMAMAP) {
@@ -1401,8 +1394,6 @@ static unsigned int nv_adma_qc_issue(struct ata_queued_cmd *qc)
 	void __iomem *mmio = pp->ctl_block;
 	int curr_ncq = (qc->tf.protocol == ATA_PROT_NCQ);
 
-	VPRINTK("ENTER\n");
-
 	/* We can't handle result taskfile with NCQ commands, since
 	   retrieving the taskfile switches us out of ADMA mode and would abort
 	   existing commands. */
@@ -1414,7 +1405,6 @@ static unsigned int nv_adma_qc_issue(struct ata_queued_cmd *qc)
 
 	if (nv_adma_use_reg_mode(qc)) {
 		/* use ATA register mode */
-		VPRINTK("using ATA register mode: 0x%lx\n", qc->flags);
 		BUG_ON(!(pp->flags & NV_ADMA_ATAPI_SETUP_COMPLETE) &&
 			(qc->flags & ATA_QCFLAG_DMAMAP));
 		nv_adma_register_mode(qc->ap);
@@ -1866,12 +1856,12 @@ static void nv_swncq_host_init(struct ata_host *host)
 
 	/* enable swncq */
 	tmp = readl(mmio + NV_CTL_MCP55);
-	VPRINTK("HOST_CTL:0x%X\n", tmp);
+	dev_dbg(&pdev->dev, "HOST_CTL:0x%X\n", tmp);
 	writel(tmp | NV_CTL_PRI_SWNCQ | NV_CTL_SEC_SWNCQ, mmio + NV_CTL_MCP55);
 
 	/* enable irq intr */
 	tmp = readl(mmio + NV_INT_ENABLE_MCP55);
-	VPRINTK("HOST_ENABLE:0x%X\n", tmp);
+	dev_dbg(&pdev->dev, "HOST_ENABLE:0x%X\n", tmp);
 	writel(tmp | 0x00fd00fd, mmio + NV_INT_ENABLE_MCP55);
 
 	/*  clear port irq */
@@ -2101,7 +2091,7 @@ static int nv_swncq_sdbfis(struct ata_port *ap)
 	ata_qc_complete_multiple(ap, ata_qc_get_active(ap) ^ done_mask);
 
 	if (!ap->qc_active) {
-		DPRINTK("over\n");
+		ata_port_dbg(ap, "over\n");
 		nv_swncq_pp_reinit(ap);
 		return 0;
 	}
@@ -2116,12 +2106,12 @@ static int nv_swncq_sdbfis(struct ata_port *ap)
 		 */
 		lack_dhfis = 1;
 
-	DPRINTK("id 0x%x QC: qc_active 0x%llx,"
-		"SWNCQ:qc_active 0x%X defer_bits %X "
-		"dhfis 0x%X dmafis 0x%X last_issue_tag %x\n",
-		ap->print_id, ap->qc_active, pp->qc_active,
-		pp->defer_queue.defer_bits, pp->dhfis_bits,
-		pp->dmafis_bits, pp->last_issue_tag);
+	ata_port_dbg(ap, "QC: qc_active 0x%llx,"
+		     "SWNCQ:qc_active 0x%X defer_bits %X "
+		     "dhfis 0x%X dmafis 0x%X last_issue_tag %x\n",
+		     ap->qc_active, pp->qc_active,
+		     pp->defer_queue.defer_bits, pp->dhfis_bits,
+		     pp->dmafis_bits, pp->last_issue_tag);
 
 	nv_swncq_fis_reinit(ap);
 
@@ -2161,7 +2151,7 @@ static void nv_swncq_dmafis(struct ata_port *ap)
 	__ata_bmdma_stop(ap);
 	tag = nv_swncq_tag(ap);
 
-	DPRINTK("dma setup tag 0x%x\n", tag);
+	ata_port_dbg(ap, "dma setup tag 0x%x\n", tag);
 	qc = ata_qc_from_tag(ap, tag);
 
 	if (unlikely(!qc))
@@ -2229,9 +2219,9 @@ static void nv_swncq_host_interrupt(struct ata_port *ap, u16 fis)
 
 	if (fis & NV_SWNCQ_IRQ_SDBFIS) {
 		pp->ncq_flags |= ncq_saw_sdb;
-		DPRINTK("id 0x%x SWNCQ: qc_active 0x%X "
+		ata_port_dbg(ap, "SWNCQ: qc_active 0x%X "
 			"dhfis 0x%X dmafis 0x%X sactive 0x%X\n",
-			ap->print_id, pp->qc_active, pp->dhfis_bits,
+			pp->qc_active, pp->dhfis_bits,
 			pp->dmafis_bits, readl(pp->sactive_block));
 		if (nv_swncq_sdbfis(ap) < 0)
 			goto irq_error;
@@ -2257,7 +2247,7 @@ static void nv_swncq_host_interrupt(struct ata_port *ap, u16 fis)
 				goto irq_exit;
 
 			if (pp->defer_queue.defer_bits) {
-				DPRINTK("send next command\n");
+				ata_port_dbg(ap, "send next command\n");
 				qc = nv_swncq_qc_from_dq(ap);
 				nv_swncq_issue_atacmd(ap, qc);
 			}
-- 
2.29.2

