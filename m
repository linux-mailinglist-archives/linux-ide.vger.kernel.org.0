Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1710E47BAD6
	for <lists+linux-ide@lfdr.de>; Tue, 21 Dec 2021 08:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233355AbhLUHWz (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 21 Dec 2021 02:22:55 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:52634 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbhLUHWp (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 21 Dec 2021 02:22:45 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 3E9EF21903;
        Tue, 21 Dec 2021 07:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1640071362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T/PKxryrqcuMlNxJgUAzfvj0Ekclq23bNEY7yxAqFhk=;
        b=eDBDA8Nlvr9CPrDCOiCiANcbQtOMnzNNdapwdMj0Kr6RdFC0UQmF87TUov5ehgyLOghVaf
        H1yMNwmbQWNvv7ec3QnuIQFm1lqENFHAaPZD02OHtNMj6Wk0LPk1TEPQoKGYbgfInys+5S
        suK6AmFRMqA10TTD+6x72LpJnveUwcA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1640071362;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T/PKxryrqcuMlNxJgUAzfvj0Ekclq23bNEY7yxAqFhk=;
        b=KJ/FGjp7czbnrXU/miflLTItUwWS/MvZQH9MXhCPWKJoAmqQ5cM1x6EPLBMoPtSn/Mkzm8
        sQ6e5pWtt9RgZkDA==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
        by relay2.suse.de (Postfix) with ESMTP id 396A4A3BA5;
        Tue, 21 Dec 2021 07:22:42 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
        id 3793E51923B6; Tue, 21 Dec 2021 08:22:42 +0100 (CET)
From:   Hannes Reinecke <hare@suse.de>
To:     Damien LeMoal <damien.lemoal@wdc.com>
Cc:     linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 34/68] sata_fsl: convert VPRINTK() calls to ata_port_dbg()
Date:   Tue, 21 Dec 2021 08:20:57 +0100
Message-Id: <20211221072131.46673-35-hare@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211221072131.46673-1-hare@suse.de>
References: <20211221072131.46673-1-hare@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/sata_fsl.c | 74 +++++++++++++++++-------------------------
 1 file changed, 29 insertions(+), 45 deletions(-)

diff --git a/drivers/ata/sata_fsl.c b/drivers/ata/sata_fsl.c
index ea8a81529c34..22d5d87bbcaf 100644
--- a/drivers/ata/sata_fsl.c
+++ b/drivers/ata/sata_fsl.c
@@ -406,7 +406,8 @@ static inline unsigned int sata_fsl_tag(struct ata_port *ap,
 	return tag;
 }
 
-static void sata_fsl_setup_cmd_hdr_entry(struct sata_fsl_port_priv *pp,
+static void sata_fsl_setup_cmd_hdr_entry(struct ata_port *ap,
+					 struct sata_fsl_port_priv *pp,
 					 unsigned int tag, u32 desc_info,
 					 u32 data_xfer_len, u8 num_prde,
 					 u8 fis_len)
@@ -424,7 +425,7 @@ static void sata_fsl_setup_cmd_hdr_entry(struct sata_fsl_port_priv *pp,
 	pp->cmdslot[tag].ttl = cpu_to_le32(data_xfer_len & ~0x03);
 	pp->cmdslot[tag].desc_info = cpu_to_le32(desc_info | (tag & 0x1F));
 
-	VPRINTK("cda=0x%x, prde_fis_len=0x%x, ttl=0x%x, di=0x%x\n",
+	ata_port_dbg(ap, "cda=0x%x, prde_fis_len=0x%x, ttl=0x%x, di=0x%x\n",
 		pp->cmdslot[tag].cda,
 		pp->cmdslot[tag].prde_fis_len,
 		pp->cmdslot[tag].ttl, pp->cmdslot[tag].desc_info);
@@ -450,8 +451,6 @@ static unsigned int sata_fsl_fill_sg(struct ata_queued_cmd *qc, void *cmd_desc,
 	dma_addr_t indirect_ext_segment_paddr;
 	unsigned int si;
 
-	VPRINTK("SATA FSL : cd = 0x%p, prd = 0x%p\n", cmd_desc, prd);
-
 	indirect_ext_segment_paddr = cmd_desc_paddr +
 	    SATA_FSL_CMD_DESC_OFFSET_TO_PRDT + SATA_FSL_MAX_PRD_DIRECT * 16;
 
@@ -459,9 +458,6 @@ static unsigned int sata_fsl_fill_sg(struct ata_queued_cmd *qc, void *cmd_desc,
 		dma_addr_t sg_addr = sg_dma_address(sg);
 		u32 sg_len = sg_dma_len(sg);
 
-		VPRINTK("SATA FSL : fill_sg, sg_addr = 0x%llx, sg_len = %d\n",
-			(unsigned long long)sg_addr, sg_len);
-
 		/* warn if each s/g element is not dword aligned */
 		if (unlikely(sg_addr & 0x03))
 			ata_port_err(qc->ap, "s/g addr unaligned : 0x%llx\n",
@@ -472,7 +468,6 @@ static unsigned int sata_fsl_fill_sg(struct ata_queued_cmd *qc, void *cmd_desc,
 
 		if (num_prde == (SATA_FSL_MAX_PRD_DIRECT - 1) &&
 		    sg_next(sg) != NULL) {
-			VPRINTK("setting indirect prde\n");
 			prd_ptr_to_indirect_ext = prd;
 			prd->dba = cpu_to_le32(indirect_ext_segment_paddr);
 			indirect_ext_segment_sz = 0;
@@ -484,9 +479,6 @@ static unsigned int sata_fsl_fill_sg(struct ata_queued_cmd *qc, void *cmd_desc,
 		prd->dba = cpu_to_le32(sg_addr);
 		prd->ddc_and_ext = cpu_to_le32(data_snoop | (sg_len & ~0x03));
 
-		VPRINTK("sg_fill, ttl=%d, dba=0x%x, ddc=0x%x\n",
-			ttl_dwords, prd->dba, prd->ddc_and_ext);
-
 		++num_prde;
 		++prd;
 		if (prd_ptr_to_indirect_ext)
@@ -523,14 +515,6 @@ static enum ata_completion_errors sata_fsl_qc_prep(struct ata_queued_cmd *qc)
 
 	ata_tf_to_fis(&qc->tf, qc->dev->link->pmp, 1, (u8 *) &cd->cfis);
 
-	VPRINTK("Dumping cfis : 0x%x, 0x%x, 0x%x\n",
-		cd->cfis[0], cd->cfis[1], cd->cfis[2]);
-
-	if (qc->tf.protocol == ATA_PROT_NCQ) {
-		VPRINTK("FPDMA xfer,Sctor cnt[0:7],[8:15] = %d,%d\n",
-			cd->cfis[3], cd->cfis[11]);
-	}
-
 	/* setup "ACMD - atapi command" in cmd. desc. if this is ATAPI cmd */
 	if (ata_is_atapi(qc->tf.protocol)) {
 		desc_info |= ATAPI_CMD;
@@ -546,10 +530,10 @@ static enum ata_completion_errors sata_fsl_qc_prep(struct ata_queued_cmd *qc)
 	if (qc->tf.protocol == ATA_PROT_NCQ)
 		desc_info |= FPDMA_QUEUED_CMD;
 
-	sata_fsl_setup_cmd_hdr_entry(pp, tag, desc_info, ttl_dwords,
+	sata_fsl_setup_cmd_hdr_entry(ap, pp, tag, desc_info, ttl_dwords,
 				     num_prde, 5);
 
-	VPRINTK("SATA FSL : xx_qc_prep, di = 0x%x, ttl = %d, num_prde = %d\n",
+	ata_port_dbg(ap, "SATA FSL : di = 0x%x, ttl = %d, num_prde = %d\n",
 		desc_info, ttl_dwords, num_prde);
 
 	return AC_ERR_OK;
@@ -562,7 +546,7 @@ static unsigned int sata_fsl_qc_issue(struct ata_queued_cmd *qc)
 	void __iomem *hcr_base = host_priv->hcr_base;
 	unsigned int tag = sata_fsl_tag(ap, qc->hw_tag, hcr_base);
 
-	VPRINTK("xx_qc_issue called,CQ=0x%x,CA=0x%x,CE=0x%x,CC=0x%x\n",
+	ata_port_dbg(ap, "CQ=0x%x,CA=0x%x,CE=0x%x,CC=0x%x\n",
 		ioread32(CQ + hcr_base),
 		ioread32(CA + hcr_base),
 		ioread32(CE + hcr_base), ioread32(CC + hcr_base));
@@ -572,10 +556,10 @@ static unsigned int sata_fsl_qc_issue(struct ata_queued_cmd *qc)
 	/* Simply queue command to the controller/device */
 	iowrite32(1 << tag, CQ + hcr_base);
 
-	VPRINTK("xx_qc_issue called, tag=%d, CQ=0x%x, CA=0x%x\n",
+	ata_port_dbg(ap, "tag=%d, CQ=0x%x, CA=0x%x\n",
 		tag, ioread32(CQ + hcr_base), ioread32(CA + hcr_base));
 
-	VPRINTK("CE=0x%x, DE=0x%x, CC=0x%x, CmdStat = 0x%x\n",
+	ata_port_dbg(ap, "CE=0x%x, DE=0x%x, CC=0x%x, CmdStat = 0x%x\n",
 		ioread32(CE + hcr_base),
 		ioread32(DE + hcr_base),
 		ioread32(CC + hcr_base),
@@ -616,7 +600,7 @@ static int sata_fsl_scr_write(struct ata_link *link,
 		return -EINVAL;
 	}
 
-	VPRINTK("xx_scr_write, reg_in = %d\n", sc_reg);
+	ata_link_dbg(link, "reg_in = %d\n", sc_reg);
 
 	iowrite32(val, ssr_base + (sc_reg * 4));
 	return 0;
@@ -640,7 +624,7 @@ static int sata_fsl_scr_read(struct ata_link *link,
 		return -EINVAL;
 	}
 
-	VPRINTK("xx_scr_read, reg_in = %d\n", sc_reg);
+	ata_link_dbg(link, "reg_in = %d\n", sc_reg);
 
 	*val = ioread32(ssr_base + (sc_reg * 4));
 	return 0;
@@ -652,18 +636,18 @@ static void sata_fsl_freeze(struct ata_port *ap)
 	void __iomem *hcr_base = host_priv->hcr_base;
 	u32 temp;
 
-	VPRINTK("xx_freeze, CQ=0x%x, CA=0x%x, CE=0x%x, DE=0x%x\n",
+	ata_port_dbg(ap, "CQ=0x%x, CA=0x%x, CE=0x%x, DE=0x%x\n",
 		ioread32(CQ + hcr_base),
 		ioread32(CA + hcr_base),
 		ioread32(CE + hcr_base), ioread32(DE + hcr_base));
-	VPRINTK("CmdStat = 0x%x\n",
+	ata_port_dbg(ap, "CmdStat = 0x%x\n",
 		ioread32(host_priv->csr_base + COMMANDSTAT));
 
 	/* disable interrupts on the controller/port */
 	temp = ioread32(hcr_base + HCONTROL);
 	iowrite32((temp & ~0x3F), hcr_base + HCONTROL);
 
-	VPRINTK("in xx_freeze : HControl = 0x%x, HStatus = 0x%x\n",
+	ata_port_dbg(ap, "HControl = 0x%x, HStatus = 0x%x\n",
 		ioread32(hcr_base + HCONTROL), ioread32(hcr_base + HSTATUS));
 }
 
@@ -676,7 +660,7 @@ static void sata_fsl_thaw(struct ata_port *ap)
 	/* ack. any pending IRQs for this controller/port */
 	temp = ioread32(hcr_base + HSTATUS);
 
-	VPRINTK("xx_thaw, pending IRQs = 0x%x\n", (temp & 0x3F));
+	ata_port_dbg(ap, "pending IRQs = 0x%x\n", (temp & 0x3F));
 
 	if (temp & 0x3F)
 		iowrite32((temp & 0x3F), hcr_base + HSTATUS);
@@ -685,7 +669,7 @@ static void sata_fsl_thaw(struct ata_port *ap)
 	temp = ioread32(hcr_base + HCONTROL);
 	iowrite32((temp | DEFAULT_PORT_IRQ_ENABLE_MASK), hcr_base + HCONTROL);
 
-	VPRINTK("xx_thaw : HControl = 0x%x, HStatus = 0x%x\n",
+	ata_port_dbg(ap, "HControl = 0x%x, HStatus = 0x%x\n",
 		ioread32(hcr_base + HCONTROL), ioread32(hcr_base + HSTATUS));
 }
 
@@ -747,7 +731,7 @@ static int sata_fsl_port_start(struct ata_port *ap)
 
 	ap->private_data = pp;
 
-	VPRINTK("CHBA = 0x%x, cmdentry_phys = 0x%x\n",
+	ata_port_dbg(ap, "CHBA = 0x%x, cmdentry_phys = 0x%x\n",
 		pp->cmdslot_paddr, pp->cmdentry_paddr);
 
 	/* Now, update the CHBA register in host controller cmd register set */
@@ -764,9 +748,9 @@ static int sata_fsl_port_start(struct ata_port *ap)
 	temp = ioread32(hcr_base + HCONTROL);
 	iowrite32((temp | HCONTROL_ONLINE_PHY_RST), hcr_base + HCONTROL);
 
-	VPRINTK("HStatus = 0x%x\n", ioread32(hcr_base + HSTATUS));
-	VPRINTK("HControl = 0x%x\n", ioread32(hcr_base + HCONTROL));
-	VPRINTK("CHBA  = 0x%x\n", ioread32(hcr_base + CHBA));
+	ata_port_dbg(ap, "HStatus = 0x%x\n", ioread32(hcr_base + HSTATUS));
+	ata_port_dbg(ap, "HControl = 0x%x\n", ioread32(hcr_base + HCONTROL));
+	ata_port_dbg(ap, "CHBA  = 0x%x\n", ioread32(hcr_base + CHBA));
 
 	return 0;
 }
@@ -806,9 +790,8 @@ static unsigned int sata_fsl_dev_classify(struct ata_port *ap)
 
 	temp = ioread32(hcr_base + SIGNATURE);
 
-	VPRINTK("raw sig = 0x%x\n", temp);
-	VPRINTK("HStatus = 0x%x\n", ioread32(hcr_base + HSTATUS));
-	VPRINTK("HControl = 0x%x\n", ioread32(hcr_base + HCONTROL));
+	ata_port_dbg(ap, "HStatus = 0x%x\n", ioread32(hcr_base + HSTATUS));
+	ata_port_dbg(ap, "HControl = 0x%x\n", ioread32(hcr_base + HCONTROL));
 
 	tf.lbah = (temp >> 24) & 0xff;
 	tf.lbam = (temp >> 16) & 0xff;
@@ -961,7 +944,7 @@ static int sata_fsl_softreset(struct ata_link *link, unsigned int *class,
 	cfis = (u8 *) &pp->cmdentry->cfis;
 
 	/* device reset/SRST is a control register update FIS, uses tag0 */
-	sata_fsl_setup_cmd_hdr_entry(pp, 0,
+	sata_fsl_setup_cmd_hdr_entry(ap, pp, 0,
 		SRST_CMD | CMD_DESC_RES | CMD_DESC_SNOOP_ENABLE, 0, 0, 5);
 
 	tf.ctl |= ATA_SRST;	/* setup SRST bit in taskfile control reg */
@@ -1011,8 +994,9 @@ static int sata_fsl_softreset(struct ata_link *link, unsigned int *class,
 	 * using ATA signature D2H register FIS to the host controller.
 	 */
 
-	sata_fsl_setup_cmd_hdr_entry(pp, 0, CMD_DESC_RES | CMD_DESC_SNOOP_ENABLE,
-				      0, 0, 5);
+	sata_fsl_setup_cmd_hdr_entry(ap, pp, 0,
+				     CMD_DESC_RES | CMD_DESC_SNOOP_ENABLE,
+				     0, 0, 5);
 
 	tf.ctl &= ~ATA_SRST;	/* 2nd H2D Ctl. register FIS */
 	ata_tf_to_fis(&tf, pmp, 0, cfis);
@@ -1042,8 +1026,8 @@ static int sata_fsl_softreset(struct ata_link *link, unsigned int *class,
 
 		*class = sata_fsl_dev_classify(ap);
 
-		VPRINTK("ccreg = 0x%x\n", ioread32(hcr_base + CC));
-		VPRINTK("cereg = 0x%x\n", ioread32(hcr_base + CE));
+		ata_port_dbg(ap, "ccreg = 0x%x\n", ioread32(hcr_base + CC));
+		ata_port_dbg(ap, "cereg = 0x%x\n", ioread32(hcr_base + CE));
 	}
 
 	return 0;
@@ -1248,8 +1232,8 @@ static void sata_fsl_host_intr(struct ata_port *ap)
 		return;
 	}
 
-	VPRINTK("Status of all queues :\n");
-	VPRINTK("done_mask/CC = 0x%x, CA = 0x%x, CE=0x%x,CQ=0x%x,apqa=0x%llx\n",
+	ata_port_dbg(ap, "Status of all queues :\n");
+	ata_port_dbg(ap, "done_mask/CC = 0x%x, CA = 0x%x, CE=0x%x,CQ=0x%x,apqa=0x%llx\n",
 		done_mask,
 		ioread32(hcr_base + CA),
 		ioread32(hcr_base + CE),
-- 
2.29.2

