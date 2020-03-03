Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC81D1772B6
	for <lists+linux-ide@lfdr.de>; Tue,  3 Mar 2020 10:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728280AbgCCJjz (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 3 Mar 2020 04:39:55 -0500
Received: from mx2.suse.de ([195.135.220.15]:47714 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728270AbgCCJjt (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 3 Mar 2020 04:39:49 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 1F4BEB242;
        Tue,  3 Mar 2020 09:39:42 +0000 (UTC)
From:   Hannes Reinecke <hare@suse.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Tejun Heo <tj@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 35/40] sata_fsl: move DPRINTK to ata debugging
Date:   Tue,  3 Mar 2020 10:38:08 +0100
Message-Id: <20200303093813.18523-36-hare@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200303093813.18523-1-hare@suse.de>
References: <20200303093813.18523-1-hare@suse.de>
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Replace all DPRINTK calls with the standard logging functions.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/ata/sata_fsl.c | 90 ++++++++++++++++++++++++++------------------------
 1 file changed, 46 insertions(+), 44 deletions(-)

diff --git a/drivers/ata/sata_fsl.c b/drivers/ata/sata_fsl.c
index 5d48e1d223fa..730f6701052c 100644
--- a/drivers/ata/sata_fsl.c
+++ b/drivers/ata/sata_fsl.c
@@ -311,10 +311,12 @@ static void fsl_sata_set_irq_coalescing(struct ata_host *host,
 	intr_coalescing_ticks = ticks;
 	spin_unlock_irqrestore(&host->lock, flags);
 
-	DPRINTK("interrupt coalescing, count = 0x%x, ticks = %x\n",
-			intr_coalescing_count, intr_coalescing_ticks);
-	DPRINTK("ICC register status: (hcr base: 0x%x) = 0x%x\n",
-			hcr_base, ioread32(hcr_base + ICC));
+	dev_dbg(host->dev,
+		"%s: interrupt coalescing, count = 0x%x, ticks = %x\n",
+		__func__, intr_coalescing_count, intr_coalescing_ticks);
+	dev_dbg(host->dev,
+		"%s: ICC register status: (hcr base: 0x%x) = 0x%x\n",
+		__func__, hcr_base, ioread32(hcr_base + ICC));
 }
 
 static ssize_t fsl_sata_intr_coalescing_show(struct device *dev,
@@ -385,18 +387,19 @@ static ssize_t fsl_sata_rx_watermark_store(struct device *dev,
 	return strlen(buf);
 }
 
-static inline unsigned int sata_fsl_tag(unsigned int tag,
+static inline unsigned int sata_fsl_tag(struct ata_port *ap,
+					unsigned int tag,
 					void __iomem *hcr_base)
 {
 	/* We let libATA core do actual (queue) tag allocation */
 
 	if (unlikely(tag >= SATA_FSL_QUEUE_DEPTH)) {
-		DPRINTK("tag %d invalid : out of range\n", tag);
+		ata_port_dbg(ap, "tag %d invalid : out of range\n", tag);
 		return 0;
 	}
 
 	if (unlikely((ioread32(hcr_base + CQ)) & (1 << tag))) {
-		DPRINTK("tag %d invalid : in use!!\n", tag);
+		ata_port_dbg(ap, "tag %d invalid : in use!!\n", tag);
 		return 0;
 	}
 
@@ -508,7 +511,7 @@ static enum ata_completion_errors sata_fsl_qc_prep(struct ata_queued_cmd *qc)
 	struct sata_fsl_port_priv *pp = ap->private_data;
 	struct sata_fsl_host_priv *host_priv = ap->host->private_data;
 	void __iomem *hcr_base = host_priv->hcr_base;
-	unsigned int tag = sata_fsl_tag(qc->hw_tag, hcr_base);
+	unsigned int tag = sata_fsl_tag(ap, qc->hw_tag, hcr_base);
 	struct command_desc *cd;
 	u32 desc_info = CMD_DESC_RES | CMD_DESC_SNOOP_ENABLE;
 	u32 num_prde = 0;
@@ -557,7 +560,7 @@ static unsigned int sata_fsl_qc_issue(struct ata_queued_cmd *qc)
 	struct ata_port *ap = qc->ap;
 	struct sata_fsl_host_priv *host_priv = ap->host->private_data;
 	void __iomem *hcr_base = host_priv->hcr_base;
-	unsigned int tag = sata_fsl_tag(qc->hw_tag, hcr_base);
+	unsigned int tag = sata_fsl_tag(ap, qc->hw_tag, hcr_base);
 
 	VPRINTK("xx_qc_issue called,CQ=0x%x,CA=0x%x,CE=0x%x,CC=0x%x\n",
 		ioread32(CQ + hcr_base),
@@ -586,7 +589,7 @@ static bool sata_fsl_qc_fill_rtf(struct ata_queued_cmd *qc)
 	struct sata_fsl_port_priv *pp = qc->ap->private_data;
 	struct sata_fsl_host_priv *host_priv = qc->ap->host->private_data;
 	void __iomem *hcr_base = host_priv->hcr_base;
-	unsigned int tag = sata_fsl_tag(qc->hw_tag, hcr_base);
+	unsigned int tag = sata_fsl_tag(qc->ap, qc->hw_tag, hcr_base);
 	struct command_desc *cd;
 
 	cd = pp->cmdentry + tag;
@@ -850,7 +853,7 @@ static int sata_fsl_hardreset(struct ata_link *link, unsigned int *class,
 			goto try_offline_again;
 	}
 
-	DPRINTK("hardreset, controller off-lined\n");
+	ata_port_dbg(ap, "hardreset, controller off-lined\n");
 	VPRINTK("HStatus = 0x%x\n", ioread32(hcr_base + HSTATUS));
 	VPRINTK("HControl = 0x%x\n", ioread32(hcr_base + HCONTROL));
 
@@ -880,7 +883,7 @@ static int sata_fsl_hardreset(struct ata_link *link, unsigned int *class,
 		goto err;
 	}
 
-	DPRINTK("hardreset, controller off-lined & on-lined\n");
+	ata_port_dbg(ap, "controller off-lined & on-lined\n");
 	VPRINTK("HStatus = 0x%x\n", ioread32(hcr_base + HSTATUS));
 	VPRINTK("HControl = 0x%x\n", ioread32(hcr_base + HCONTROL));
 
@@ -962,7 +965,7 @@ static int sata_fsl_softreset(struct ata_link *link, unsigned int *class,
 	tf.ctl |= ATA_SRST;	/* setup SRST bit in taskfile control reg */
 	ata_tf_to_fis(&tf, pmp, 0, cfis);
 
-	DPRINTK("Dumping cfis : 0x%x, 0x%x, 0x%x, 0x%x\n",
+	ata_port_dbg(ap, "Dumping cfis : 0x%x, 0x%x, 0x%x, 0x%x\n",
 		cfis[0], cfis[1], cfis[2], cfis[3]);
 
 	/*
@@ -970,7 +973,7 @@ static int sata_fsl_softreset(struct ata_link *link, unsigned int *class,
 	 * other commands are active on the controller/device
 	 */
 
-	DPRINTK("@Softreset, CQ = 0x%x, CA = 0x%x, CC = 0x%x\n",
+	ata_port_dbg(ap, "CQ = 0x%x, CA = 0x%x, CC = 0x%x\n",
 		ioread32(CQ + hcr_base),
 		ioread32(CA + hcr_base), ioread32(CC + hcr_base));
 
@@ -983,15 +986,17 @@ static int sata_fsl_softreset(struct ata_link *link, unsigned int *class,
 	if (temp & 0x1) {
 		ata_port_warn(ap, "ATA_SRST issue failed\n");
 
-		DPRINTK("Softreset@5000,CQ=0x%x,CA=0x%x,CC=0x%x\n",
+		ata_port_dbg(ap, "Softreset@5000,CQ=0x%x,CA=0x%x,CC=0x%x\n",
 			ioread32(CQ + hcr_base),
 			ioread32(CA + hcr_base), ioread32(CC + hcr_base));
 
 		sata_fsl_scr_read(&ap->link, SCR_ERROR, &Serror);
 
-		DPRINTK("HStatus = 0x%x\n", ioread32(hcr_base + HSTATUS));
-		DPRINTK("HControl = 0x%x\n", ioread32(hcr_base + HCONTROL));
-		DPRINTK("Serror = 0x%x\n", Serror);
+		ata_port_dbg(ap,
+			     "HStatus = 0x%x HControl = 0x%x Serror = 0x%x\n",
+			     ioread32(hcr_base + HSTATUS),
+			     ioread32(hcr_base + HCONTROL),
+			     Serror);
 		goto err;
 	}
 
@@ -1049,7 +1054,7 @@ static int sata_fsl_softreset(struct ata_link *link, unsigned int *class,
 static void sata_fsl_error_handler(struct ata_port *ap)
 {
 
-	DPRINTK("in xx_error_handler\n");
+	ata_port_dbg(ap, "ENTER\n");
 	sata_pmp_error_handler(ap);
 
 }
@@ -1092,7 +1097,7 @@ static void sata_fsl_error_intr(struct ata_port *ap)
 	if (unlikely(SError & 0xFFFF0000))
 		sata_fsl_scr_write(&ap->link, SCR_ERROR, SError);
 
-	DPRINTK("error_intr,hStat=0x%x,CE=0x%x,DE =0x%x,SErr=0x%x\n",
+	ata_port_dbg(ap, "hStat=0x%x,CE=0x%x,DE =0x%x,SErr=0x%x\n",
 		hstatus, cereg, ioread32(hcr_base + DE), SError);
 
 	/* handle fatal errors */
@@ -1109,7 +1114,7 @@ static void sata_fsl_error_intr(struct ata_port *ap)
 
 	/* Handle PHYRDY change notification */
 	if (hstatus & INT_ON_PHYRDY_CHG) {
-		DPRINTK("SATA FSL: PHYRDY change indication\n");
+		ata_port_dbg(ap, "PHYRDY change indication\n");
 
 		/* Setup a soft-reset EH action */
 		ata_ehi_hotplugged(ehi);
@@ -1130,7 +1135,7 @@ static void sata_fsl_error_intr(struct ata_port *ap)
 		 */
 		abort = 1;
 
-		DPRINTK("single device error, CE=0x%x, DE=0x%x\n",
+		ata_port_dbg(ap, "single device error, CE=0x%x, DE=0x%x\n",
 			ioread32(hcr_base + CE), ioread32(hcr_base + DE));
 
 		/* find out the offending link and qc */
@@ -1235,12 +1240,12 @@ static void sata_fsl_host_intr(struct ata_port *ap)
 	}
 
 	if (unlikely(SError & 0xFFFF0000)) {
-		DPRINTK("serror @host_intr : 0x%x\n", SError);
+		ata_port_dbg(ap, "serror @host_intr : 0x%x\n", SError);
 		sata_fsl_error_intr(ap);
 	}
 
 	if (unlikely(hstatus & status_mask)) {
-		DPRINTK("error interrupt!!\n");
+		ata_port_dbg(ap, "error interrupt!!\n");
 		sata_fsl_error_intr(ap);
 		return;
 	}
@@ -1258,17 +1263,15 @@ static void sata_fsl_host_intr(struct ata_port *ap)
 		/* clear CC bit, this will also complete the interrupt */
 		iowrite32(done_mask, hcr_base + CC);
 
-		DPRINTK("Status of all queues :\n");
-		DPRINTK("done_mask/CC = 0x%x, CA = 0x%x, CE=0x%x\n",
-			done_mask, ioread32(hcr_base + CA),
-			ioread32(hcr_base + CE));
+		ata_port_dbg(ap, "Status of all queues: done_mask/CC = 0x%x, CA = 0x%x, CE=0x%x\n",
+			     done_mask, ioread32(hcr_base + CA),
+			     ioread32(hcr_base + CE));
 
 		for (i = 0; i < SATA_FSL_QUEUE_DEPTH; i++) {
 			if (done_mask & (1 << i))
-				DPRINTK
-				    ("completing ncq cmd,tag=%d,CC=0x%x,CA=0x%x\n",
-				     i, ioread32(hcr_base + CC),
-				     ioread32(hcr_base + CA));
+				ata_port_dbg(ap, "completing ncq cmd,tag=%d,CC=0x%x,CA=0x%x\n",
+					     i, ioread32(hcr_base + CC),
+					     ioread32(hcr_base + CA));
 		}
 		ata_qc_complete_multiple(ap, ata_qc_get_active(ap) ^ done_mask);
 		return;
@@ -1277,16 +1280,16 @@ static void sata_fsl_host_intr(struct ata_port *ap)
 		iowrite32(1, hcr_base + CC);
 		qc = ata_qc_from_tag(ap, ATA_TAG_INTERNAL);
 
-		DPRINTK("completing non-ncq cmd, CC=0x%x\n",
-			 ioread32(hcr_base + CC));
+		ata_port_dbg(ap, "completing non-ncq cmd, CC=0x%x\n",
+			     ioread32(hcr_base + CC));
 
 		if (qc) {
 			ata_qc_complete(qc);
 		}
 	} else {
 		/* Spurious Interrupt!! */
-		DPRINTK("spurious interrupt!!, CC = 0x%x\n",
-			ioread32(hcr_base + CC));
+		ata_port_dbg(ap, "spurious interrupt!!, CC = 0x%x\n",
+			     ioread32(hcr_base + CC));
 		iowrite32(done_mask, hcr_base + CC);
 		return;
 	}
@@ -1305,7 +1308,7 @@ static irqreturn_t sata_fsl_interrupt(int irq, void *dev_instance)
 	interrupt_enables = ioread32(hcr_base + HSTATUS);
 	interrupt_enables &= 0x3F;
 
-	DPRINTK("interrupt status 0x%x\n", interrupt_enables);
+	ata_port_dbg(ap, "interrupt status 0x%x\n", interrupt_enables);
 
 	if (!interrupt_enables)
 		return IRQ_NONE;
@@ -1359,14 +1362,14 @@ static int sata_fsl_init_controller(struct ata_host *host)
 	iowrite32((temp & ~0x3F), hcr_base + HCONTROL);
 
 	/* Disable interrupt coalescing control(icc), for the moment */
-	DPRINTK("icc = 0x%x\n", ioread32(hcr_base + ICC));
+	ata_port_dbg(ap, "icc = 0x%x\n", ioread32(hcr_base + ICC));
 	iowrite32(0x01000000, hcr_base + ICC);
 
 	/* clear error registers, SError is cleared by libATA  */
 	iowrite32(0x00000FFFF, hcr_base + CE);
 	iowrite32(0x00000FFFF, hcr_base + DE);
 
- 	/*
+	/*
 	 * reset the number of command complete bits which will cause the
 	 * interrupt to be signaled
 	 */
@@ -1378,8 +1381,9 @@ static int sata_fsl_init_controller(struct ata_host *host)
 	 * callback, that should also initiate the OOB, COMINIT sequence
 	 */
 
-	DPRINTK("HStatus = 0x%x\n", ioread32(hcr_base + HSTATUS));
-	DPRINTK("HControl = 0x%x\n", ioread32(hcr_base + HCONTROL));
+	ata_port_dbg(ap, "HStatus = 0x%x HControl = 0x%x\n",
+		     ioread32(hcr_base + HSTATUS),
+		     ioread32(hcr_base + HCONTROL));
 
 	return 0;
 }
@@ -1458,9 +1462,7 @@ static int sata_fsl_probe(struct platform_device *ofdev)
 		iowrite32(temp | TRANSCFG_RX_WATER_MARK, csr_base + TRANSCFG);
 	}
 
-	DPRINTK("@reset i/o = 0x%x\n", ioread32(csr_base + TRANSCFG));
-	DPRINTK("sizeof(cmd_desc) = %d\n", sizeof(struct command_desc));
-	DPRINTK("sizeof(#define cmd_desc) = %d\n", SATA_FSL_CMD_DESC_SIZE);
+	ata_port_dbg(ap, "@reset i/o = 0x%x\n", ioread32(csr_base + TRANSCFG));
 
 	host_priv = kzalloc(sizeof(struct sata_fsl_host_priv), GFP_KERNEL);
 	if (!host_priv)
-- 
2.16.4

