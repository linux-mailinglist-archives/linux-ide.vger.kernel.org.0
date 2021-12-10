Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08D446FB53
	for <lists+linux-ide@lfdr.de>; Fri, 10 Dec 2021 08:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237527AbhLJHdA (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 10 Dec 2021 02:33:00 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:34856 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237538AbhLJHcy (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 10 Dec 2021 02:32:54 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 9DD8E2110B;
        Fri, 10 Dec 2021 07:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1639121358; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u7WX2v42H3fftmvUv74aYHSRjCtnlMEjom60Hp8J1VM=;
        b=L9OLXbzE3cI12tz76Pi5SWXOSh9Xfi5nQ0GAdKfdNGHa78dbJnvK2o1D3m1wu90dX0K6GA
        Mx6eAoQZHFmKfUV7b10+IYegwkLKavuG1mNvkuJq8VS2I/iB7PPkT16qxhCJ+KHycln6h5
        iv+QqG/s7VQdMJTBTJUPGjFZrD6b6Hg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1639121358;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u7WX2v42H3fftmvUv74aYHSRjCtnlMEjom60Hp8J1VM=;
        b=acozJKqXsq5ElZzVfsJr15QK7H/aG6YiooYDmu7UpwDD+VtfrgN/CzJ5swXxjer4MZ/AZI
        sOqlophIlmzuJjBA==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
        by relay2.suse.de (Postfix) with ESMTP id 94E2AA3B9B;
        Fri, 10 Dec 2021 07:29:18 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
        id 7C41D5192031; Fri, 10 Dec 2021 08:29:18 +0100 (CET)
From:   Hannes Reinecke <hare@suse.de>
To:     Damien LeMoal <damien.lemoal@wdc.com>
Cc:     linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 08/68] libata: tracepoints for bus-master DMA
Date:   Fri, 10 Dec 2021 08:28:05 +0100
Message-Id: <20211210072905.15666-9-hare@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211210072905.15666-1-hare@suse.de>
References: <20211210072905.15666-1-hare@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Add tracepoints for bus-master DMA and taskfile related functions.
That allows us to drop the relevant DPRINTK() calls.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/ata_piix.c          |   8 +-
 drivers/ata/libata-core.c       |   6 ++
 drivers/ata/libata-sff.c        |  44 ++++++-----
 drivers/ata/libata-trace.c      |  18 +++++
 drivers/ata/pata_arasan_cf.c    |   3 +
 drivers/ata/pata_octeon_cf.c    |  18 ++---
 drivers/ata/pata_pdc202xx_old.c |   2 -
 drivers/ata/pata_sil680.c       |   1 -
 drivers/ata/sata_dwc_460ex.c    |  71 ++----------------
 drivers/ata/sata_nv.c           |  12 +--
 drivers/ata/sata_rcar.c         |   2 -
 include/trace/events/libata.h   | 125 ++++++++++++++++++++++++++++++++
 12 files changed, 199 insertions(+), 111 deletions(-)

diff --git a/drivers/ata/ata_piix.c b/drivers/ata/ata_piix.c
index eb6bf30bd2e3..27b0d903f91f 100644
--- a/drivers/ata/ata_piix.c
+++ b/drivers/ata/ata_piix.c
@@ -77,6 +77,7 @@
 #include <scsi/scsi_host.h>
 #include <linux/libata.h>
 #include <linux/dmi.h>
+#include <trace/events/libata.h>
 
 #define DRV_NAME	"ata_piix"
 #define DRV_VERSION	"2.13"
@@ -816,10 +817,15 @@ static int piix_sidpr_set_lpm(struct ata_link *link, enum ata_lpm_policy policy,
 
 static bool piix_irq_check(struct ata_port *ap)
 {
+	unsigned char host_stat;
+
 	if (unlikely(!ap->ioaddr.bmdma_addr))
 		return false;
 
-	return ap->ops->bmdma_status(ap) & ATA_DMA_INTR;
+	host_stat = ap->ops->bmdma_status(ap);
+	trace_ata_bmdma_status(ap, host_stat);
+
+	return host_stat & ATA_DMA_INTR;
 }
 
 #ifdef CONFIG_PM_SLEEP
diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 80af26ea04b8..4a1e61d46d29 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -6569,3 +6569,9 @@ void ata_print_version(const struct device *dev, const char *version)
 	dev_printk(KERN_DEBUG, dev, "version %s\n", version);
 }
 EXPORT_SYMBOL(ata_print_version);
+
+EXPORT_TRACEPOINT_SYMBOL_GPL(ata_tf_load);
+EXPORT_TRACEPOINT_SYMBOL_GPL(ata_exec_command);
+EXPORT_TRACEPOINT_SYMBOL_GPL(ata_bmdma_setup);
+EXPORT_TRACEPOINT_SYMBOL_GPL(ata_bmdma_start);
+EXPORT_TRACEPOINT_SYMBOL_GPL(ata_bmdma_status);
diff --git a/drivers/ata/libata-sff.c b/drivers/ata/libata-sff.c
index 4cc7c0606e06..76bd87691978 100644
--- a/drivers/ata/libata-sff.c
+++ b/drivers/ata/libata-sff.c
@@ -18,7 +18,7 @@
 #include <linux/module.h>
 #include <linux/libata.h>
 #include <linux/highmem.h>
-
+#include <trace/events/libata.h>
 #include "libata.h"
 
 static struct workqueue_struct *ata_sff_wq;
@@ -409,12 +409,6 @@ void ata_sff_tf_load(struct ata_port *ap, const struct ata_taskfile *tf)
 		iowrite8(tf->hob_lbal, ioaddr->lbal_addr);
 		iowrite8(tf->hob_lbam, ioaddr->lbam_addr);
 		iowrite8(tf->hob_lbah, ioaddr->lbah_addr);
-		VPRINTK("hob: feat 0x%X nsect 0x%X, lba 0x%X 0x%X 0x%X\n",
-			tf->hob_feature,
-			tf->hob_nsect,
-			tf->hob_lbal,
-			tf->hob_lbam,
-			tf->hob_lbah);
 	}
 
 	if (is_addr) {
@@ -423,18 +417,10 @@ void ata_sff_tf_load(struct ata_port *ap, const struct ata_taskfile *tf)
 		iowrite8(tf->lbal, ioaddr->lbal_addr);
 		iowrite8(tf->lbam, ioaddr->lbam_addr);
 		iowrite8(tf->lbah, ioaddr->lbah_addr);
-		VPRINTK("feat 0x%X nsect 0x%X lba 0x%X 0x%X 0x%X\n",
-			tf->feature,
-			tf->nsect,
-			tf->lbal,
-			tf->lbam,
-			tf->lbah);
 	}
 
-	if (tf->flags & ATA_TFLAG_DEVICE) {
+	if (tf->flags & ATA_TFLAG_DEVICE)
 		iowrite8(tf->device, ioaddr->device_addr);
-		VPRINTK("device 0x%X\n", tf->device);
-	}
 
 	ata_wait_idle(ap);
 }
@@ -494,8 +480,6 @@ EXPORT_SYMBOL_GPL(ata_sff_tf_read);
  */
 void ata_sff_exec_command(struct ata_port *ap, const struct ata_taskfile *tf)
 {
-	DPRINTK("ata%u: cmd 0x%X\n", ap->print_id, tf->command);
-
 	iowrite8(tf->command, ap->ioaddr.command_addr);
 	ata_sff_pause(ap);
 }
@@ -505,6 +489,7 @@ EXPORT_SYMBOL_GPL(ata_sff_exec_command);
  *	ata_tf_to_host - issue ATA taskfile to host controller
  *	@ap: port to which command is being issued
  *	@tf: ATA taskfile register set
+ *	@tag: tag of the associated command
  *
  *	Issues ATA taskfile register set to ATA host controller,
  *	with proper synchronization with interrupt handler and
@@ -514,9 +499,12 @@ EXPORT_SYMBOL_GPL(ata_sff_exec_command);
  *	spin_lock_irqsave(host lock)
  */
 static inline void ata_tf_to_host(struct ata_port *ap,
-				  const struct ata_taskfile *tf)
+				  const struct ata_taskfile *tf,
+				  unsigned int tag)
 {
+	trace_ata_tf_load(ap, tf);
 	ap->ops->sff_tf_load(ap, tf);
+	trace_ata_exec_command(ap, tf, tag);
 	ap->ops->sff_exec_command(ap, tf);
 }
 
@@ -768,6 +756,7 @@ static void atapi_send_cdb(struct ata_port *ap, struct ata_queued_cmd *qc)
 	case ATAPI_PROT_DMA:
 		ap->hsm_task_state = HSM_ST_LAST;
 		/* initiate bmdma */
+		trace_ata_bmdma_start(ap, &qc->tf, qc->tag);
 		ap->ops->bmdma_start(qc);
 		break;
 #endif /* CONFIG_ATA_BMDMA */
@@ -1376,7 +1365,7 @@ unsigned int ata_sff_qc_issue(struct ata_queued_cmd *qc)
 		if (qc->tf.flags & ATA_TFLAG_POLLING)
 			ata_qc_set_polling(qc);
 
-		ata_tf_to_host(ap, &qc->tf);
+		ata_tf_to_host(ap, &qc->tf, qc->tag);
 		ap->hsm_task_state = HSM_ST_LAST;
 
 		if (qc->tf.flags & ATA_TFLAG_POLLING)
@@ -1388,7 +1377,7 @@ unsigned int ata_sff_qc_issue(struct ata_queued_cmd *qc)
 		if (qc->tf.flags & ATA_TFLAG_POLLING)
 			ata_qc_set_polling(qc);
 
-		ata_tf_to_host(ap, &qc->tf);
+		ata_tf_to_host(ap, &qc->tf, qc->tag);
 
 		if (qc->tf.flags & ATA_TFLAG_WRITE) {
 			/* PIO data out protocol */
@@ -1418,7 +1407,7 @@ unsigned int ata_sff_qc_issue(struct ata_queued_cmd *qc)
 		if (qc->tf.flags & ATA_TFLAG_POLLING)
 			ata_qc_set_polling(qc);
 
-		ata_tf_to_host(ap, &qc->tf);
+		ata_tf_to_host(ap, &qc->tf, qc->tag);
 
 		ap->hsm_task_state = HSM_ST_FIRST;
 
@@ -2745,8 +2734,11 @@ unsigned int ata_bmdma_qc_issue(struct ata_queued_cmd *qc)
 	case ATA_PROT_DMA:
 		WARN_ON_ONCE(qc->tf.flags & ATA_TFLAG_POLLING);
 
+		trace_ata_tf_load(ap, &qc->tf);
 		ap->ops->sff_tf_load(ap, &qc->tf);  /* load tf registers */
+		trace_ata_bmdma_setup(ap, &qc->tf, qc->tag);
 		ap->ops->bmdma_setup(qc);	    /* set up bmdma */
+		trace_ata_bmdma_start(ap, &qc->tf, qc->tag);
 		ap->ops->bmdma_start(qc);	    /* initiate bmdma */
 		ap->hsm_task_state = HSM_ST_LAST;
 		break;
@@ -2754,7 +2746,9 @@ unsigned int ata_bmdma_qc_issue(struct ata_queued_cmd *qc)
 	case ATAPI_PROT_DMA:
 		WARN_ON_ONCE(qc->tf.flags & ATA_TFLAG_POLLING);
 
+		trace_ata_tf_load(ap, &qc->tf);
 		ap->ops->sff_tf_load(ap, &qc->tf);  /* load tf registers */
+		trace_ata_bmdma_setup(ap, &qc->tf, qc->tag);
 		ap->ops->bmdma_setup(qc);	    /* set up bmdma */
 		ap->hsm_task_state = HSM_ST_FIRST;
 
@@ -2795,13 +2789,14 @@ unsigned int ata_bmdma_port_intr(struct ata_port *ap, struct ata_queued_cmd *qc)
 	if (ap->hsm_task_state == HSM_ST_LAST && ata_is_dma(qc->tf.protocol)) {
 		/* check status of DMA engine */
 		host_stat = ap->ops->bmdma_status(ap);
-		VPRINTK("ata%u: host_stat 0x%X\n", ap->print_id, host_stat);
+		trace_ata_bmdma_status(ap, host_stat);
 
 		/* if it's not our irq... */
 		if (!(host_stat & ATA_DMA_INTR))
 			return ata_sff_idle_irq(ap);
 
 		/* before we do anything else, clear DMA-Start bit */
+		trace_ata_bmdma_stop(ap, &qc->tf, qc->tag);
 		ap->ops->bmdma_stop(qc);
 		bmdma_stopped = true;
 
@@ -2870,6 +2865,7 @@ void ata_bmdma_error_handler(struct ata_port *ap)
 		u8 host_stat;
 
 		host_stat = ap->ops->bmdma_status(ap);
+		trace_ata_bmdma_status(ap, host_stat);
 
 		/* BMDMA controllers indicate host bus error by
 		 * setting DMA_ERR bit and timing out.  As it wasn't
@@ -2881,6 +2877,7 @@ void ata_bmdma_error_handler(struct ata_port *ap)
 			thaw = true;
 		}
 
+		trace_ata_bmdma_stop(ap, &qc->tf, qc->tag);
 		ap->ops->bmdma_stop(qc);
 
 		/* if we're gonna thaw, make sure IRQ is clear */
@@ -2914,6 +2911,7 @@ void ata_bmdma_post_internal_cmd(struct ata_queued_cmd *qc)
 
 	if (ata_is_dma(qc->tf.protocol)) {
 		spin_lock_irqsave(ap->lock, flags);
+		trace_ata_bmdma_stop(ap, &qc->tf, qc->tag);
 		ap->ops->bmdma_stop(qc);
 		spin_unlock_irqrestore(ap->lock, flags);
 	}
diff --git a/drivers/ata/libata-trace.c b/drivers/ata/libata-trace.c
index 08e001303a82..8a929e4414dc 100644
--- a/drivers/ata/libata-trace.c
+++ b/drivers/ata/libata-trace.c
@@ -38,6 +38,24 @@ libata_trace_parse_status(struct trace_seq *p, unsigned char status)
 	return ret;
 }
 
+const char *
+libata_trace_parse_host_stat(struct trace_seq *p, unsigned char host_stat)
+{
+	const char *ret = trace_seq_buffer_ptr(p);
+
+	trace_seq_printf(p, "{ ");
+	if (host_stat & ATA_DMA_INTR)
+		trace_seq_printf(p, "INTR ");
+	if (host_stat & ATA_DMA_ERR)
+		trace_seq_printf(p, "ERR ");
+	if (host_stat & ATA_DMA_ACTIVE)
+		trace_seq_printf(p, "ACTIVE ");
+	trace_seq_putc(p, '}');
+	trace_seq_putc(p, 0);
+
+	return ret;
+}
+
 const char *
 libata_trace_parse_eh_action(struct trace_seq *p, unsigned int eh_action)
 {
diff --git a/drivers/ata/pata_arasan_cf.c b/drivers/ata/pata_arasan_cf.c
index 63f39440a9b4..24c3d5e1fca3 100644
--- a/drivers/ata/pata_arasan_cf.c
+++ b/drivers/ata/pata_arasan_cf.c
@@ -39,6 +39,7 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
+#include <trace/events/libata.h>
 
 #define DRIVER_NAME	"arasan_cf"
 #define TIMEOUT		msecs_to_jiffies(3000)
@@ -703,9 +704,11 @@ static unsigned int arasan_cf_qc_issue(struct ata_queued_cmd *qc)
 	case ATA_PROT_DMA:
 		WARN_ON_ONCE(qc->tf.flags & ATA_TFLAG_POLLING);
 
+		trace_ata_tf_load(ap, &qc->tf);
 		ap->ops->sff_tf_load(ap, &qc->tf);
 		acdev->dma_status = 0;
 		acdev->qc = qc;
+		trace_ata_bmdma_start(ap, &qc->tf, qc->tag);
 		arasan_cf_dma_start(acdev);
 		ap->hsm_task_state = HSM_ST_LAST;
 		break;
diff --git a/drivers/ata/pata_octeon_cf.c b/drivers/ata/pata_octeon_cf.c
index cdc95eb2b2cb..1fe756af3268 100644
--- a/drivers/ata/pata_octeon_cf.c
+++ b/drivers/ata/pata_octeon_cf.c
@@ -19,7 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <scsi/scsi_host.h>
-
+#include <trace/events/libata.h>
 #include <asm/byteorder.h>
 #include <asm/octeon/octeon.h>
 
@@ -514,20 +514,14 @@ static void octeon_cf_exec_command16(struct ata_port *ap,
 {
 	/* The base of the registers is at ioaddr.data_addr. */
 	void __iomem *base = ap->ioaddr.data_addr;
-	u16 blob;
+	u16 blob = 0;
 
-	if (tf->flags & ATA_TFLAG_DEVICE) {
-		VPRINTK("device 0x%X\n", tf->device);
+	if (tf->flags & ATA_TFLAG_DEVICE)
 		blob = tf->device;
-	} else {
-		blob = 0;
-	}
 
-	DPRINTK("ata%u: cmd 0x%X\n", ap->print_id, tf->command);
 	blob |= (tf->command << 8);
 	__raw_writew(blob, base + 6);
 
-
 	ata_wait_idle(ap);
 }
 
@@ -541,12 +535,10 @@ static void octeon_cf_dma_setup(struct ata_queued_cmd *qc)
 	struct octeon_cf_port *cf_port;
 
 	cf_port = ap->private_data;
-	DPRINTK("ENTER\n");
 	/* issue r/w command */
 	qc->cursg = qc->sg;
 	cf_port->dma_finished = 0;
 	ap->ops->sff_exec_command(ap, &qc->tf);
-	DPRINTK("EXIT\n");
 }
 
 /**
@@ -699,6 +691,7 @@ static irqreturn_t octeon_cf_interrupt(int irq, void *dev_instance)
 			if (!sg_is_last(qc->cursg)) {
 				qc->cursg = sg_next(qc->cursg);
 				handled = 1;
+				trace_ata_bmdma_start(ap, &qc->tf, qc->tag);
 				octeon_cf_dma_start(qc);
 				continue;
 			} else {
@@ -798,8 +791,11 @@ static unsigned int octeon_cf_qc_issue(struct ata_queued_cmd *qc)
 	case ATA_PROT_DMA:
 		WARN_ON(qc->tf.flags & ATA_TFLAG_POLLING);
 
+		trace_ata_tf_load(ap, &qc->tf);
 		ap->ops->sff_tf_load(ap, &qc->tf);  /* load tf registers */
+		trace_ata_bmdma_setup(ap, &qc->tf, qc->tag);
 		octeon_cf_dma_setup(qc);	    /* set up dma */
+		trace_ata_bmdma_start(ap, &qc->tf, qc->tag);
 		octeon_cf_dma_start(qc);	    /* initiate dma */
 		ap->hsm_task_state = HSM_ST_LAST;
 		break;
diff --git a/drivers/ata/pata_pdc202xx_old.c b/drivers/ata/pata_pdc202xx_old.c
index 0c5cbcd28d0d..b99849095853 100644
--- a/drivers/ata/pata_pdc202xx_old.c
+++ b/drivers/ata/pata_pdc202xx_old.c
@@ -38,8 +38,6 @@ static int pdc2026x_cable_detect(struct ata_port *ap)
 static void pdc202xx_exec_command(struct ata_port *ap,
 				  const struct ata_taskfile *tf)
 {
-	DPRINTK("ata%u: cmd 0x%X\n", ap->print_id, tf->command);
-
 	iowrite8(tf->command, ap->ioaddr.command_addr);
 	ndelay(400);
 }
diff --git a/drivers/ata/pata_sil680.c b/drivers/ata/pata_sil680.c
index 43215a664b96..81238e097fe2 100644
--- a/drivers/ata/pata_sil680.c
+++ b/drivers/ata/pata_sil680.c
@@ -212,7 +212,6 @@ static void sil680_set_dmamode(struct ata_port *ap, struct ata_device *adev)
 static void sil680_sff_exec_command(struct ata_port *ap,
 				    const struct ata_taskfile *tf)
 {
-	DPRINTK("ata%u: cmd 0x%X\n", ap->print_id, tf->command);
 	iowrite8(tf->command, ap->ioaddr.command_addr);
 	ioread8(ap->ioaddr.bmdma_addr + ATA_DMA_CMD);
 }
diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.c
index 338c2e50f759..6cdce9d00ed7 100644
--- a/drivers/ata/sata_dwc_460ex.c
+++ b/drivers/ata/sata_dwc_460ex.c
@@ -34,6 +34,7 @@
 #include <linux/phy/phy.h>
 #include <linux/libata.h>
 #include <linux/slab.h>
+#include <trace/events/libata.h>
 
 #include "libata.h"
 
@@ -297,35 +298,6 @@ static const char *get_prot_descript(u8 protocol)
 	}
 }
 
-static const char *get_dma_dir_descript(int dma_dir)
-{
-	switch ((enum dma_data_direction)dma_dir) {
-	case DMA_BIDIRECTIONAL:
-		return "bidirectional";
-	case DMA_TO_DEVICE:
-		return "to device";
-	case DMA_FROM_DEVICE:
-		return "from device";
-	default:
-		return "none";
-	}
-}
-
-static void sata_dwc_tf_dump(struct ata_port *ap, struct ata_taskfile *tf)
-{
-	dev_vdbg(ap->dev,
-		"taskfile cmd: 0x%02x protocol: %s flags: 0x%lx device: %x\n",
-		tf->command, get_prot_descript(tf->protocol), tf->flags,
-		tf->device);
-	dev_vdbg(ap->dev,
-		"feature: 0x%02x nsect: 0x%x lbal: 0x%x lbam: 0x%x lbah: 0x%x\n",
-		tf->feature, tf->nsect, tf->lbal, tf->lbam, tf->lbah);
-	dev_vdbg(ap->dev,
-		"hob_feature: 0x%02x hob_nsect: 0x%x hob_lbal: 0x%x hob_lbam: 0x%x hob_lbah: 0x%x\n",
-		tf->hob_feature, tf->hob_nsect, tf->hob_lbal, tf->hob_lbam,
-		tf->hob_lbah);
-}
-
 static void dma_dwc_xfer_done(void *hsdev_instance)
 {
 	unsigned long flags;
@@ -553,6 +525,7 @@ static irqreturn_t sata_dwc_isr(int irq, void *dev_instance)
 		 * active tag.  It is the tag that matches the command about to
 		 * be completed.
 		 */
+		trace_ata_bmdma_start(ap, &qc->tf, tag);
 		qc->ap->link.active_tag = tag;
 		sata_dwc_bmdma_start_by_tag(qc, tag);
 
@@ -980,9 +953,6 @@ static void sata_dwc_exec_command_by_tag(struct ata_port *ap,
 {
 	struct sata_dwc_device_port *hsdevp = HSDEVP_FROM_AP(ap);
 
-	dev_dbg(ap->dev, "%s cmd(0x%02x): %s tag=%d\n", __func__, tf->command,
-		ata_get_cmd_descript(tf->command), tag);
-
 	hsdevp->cmd_issued[tag] = cmd_issued;
 
 	/*
@@ -1005,12 +975,9 @@ static void sata_dwc_bmdma_setup(struct ata_queued_cmd *qc)
 {
 	u8 tag = qc->hw_tag;
 
-	if (ata_is_ncq(qc->tf.protocol)) {
-		dev_dbg(qc->ap->dev, "%s: ap->link.sactive=0x%08x tag=%d\n",
-			__func__, qc->ap->link.sactive, tag);
-	} else {
+	if (!ata_is_ncq(qc->tf.protocol))
 		tag = 0;
-	}
+
 	sata_dwc_bmdma_setup_by_tag(qc, tag);
 }
 
@@ -1037,12 +1004,6 @@ static void sata_dwc_bmdma_start_by_tag(struct ata_queued_cmd *qc, u8 tag)
 		start_dma = 0;
 	}
 
-	dev_dbg(ap->dev,
-		"%s qc=%p tag: %x cmd: 0x%02x dma_dir: %s start_dma? %x\n",
-		__func__, qc, tag, qc->tf.command,
-		get_dma_dir_descript(qc->dma_dir), start_dma);
-	sata_dwc_tf_dump(ap, &qc->tf);
-
 	if (start_dma) {
 		sata_dwc_scr_read(&ap->link, SCR_ERROR, &reg);
 		if (reg & SATA_DWC_SERROR_ERR_BITS) {
@@ -1067,13 +1028,9 @@ static void sata_dwc_bmdma_start(struct ata_queued_cmd *qc)
 {
 	u8 tag = qc->hw_tag;
 
-	if (ata_is_ncq(qc->tf.protocol)) {
-		dev_dbg(qc->ap->dev, "%s: ap->link.sactive=0x%08x tag=%d\n",
-			__func__, qc->ap->link.sactive, tag);
-	} else {
+	if (!ata_is_ncq(qc->tf.protocol))
 		tag = 0;
-	}
-	dev_dbg(qc->ap->dev, "%s\n", __func__);
+
 	sata_dwc_bmdma_start_by_tag(qc, tag);
 }
 
@@ -1084,16 +1041,6 @@ static unsigned int sata_dwc_qc_issue(struct ata_queued_cmd *qc)
 	struct ata_port *ap = qc->ap;
 	struct sata_dwc_device_port *hsdevp = HSDEVP_FROM_AP(ap);
 
-#ifdef DEBUG_NCQ
-	if (qc->hw_tag > 0 || ap->link.sactive > 1)
-		dev_info(ap->dev,
-			 "%s ap id=%d cmd(0x%02x)=%s qc tag=%d prot=%s ap active_tag=0x%08x ap sactive=0x%08x\n",
-			 __func__, ap->print_id, qc->tf.command,
-			 ata_get_cmd_descript(qc->tf.command),
-			 qc->hw_tag, get_prot_descript(qc->tf.protocol),
-			 ap->link.active_tag, ap->link.sactive);
-#endif
-
 	if (!ata_is_ncq(qc->tf.protocol))
 		tag = 0;
 
@@ -1110,11 +1057,9 @@ static unsigned int sata_dwc_qc_issue(struct ata_queued_cmd *qc)
 		sactive |= (0x00000001 << tag);
 		sata_dwc_scr_write(&ap->link, SCR_ACTIVE, sactive);
 
-		dev_dbg(qc->ap->dev,
-			"%s: tag=%d ap->link.sactive = 0x%08x sactive=0x%08x\n",
-			__func__, tag, qc->ap->link.sactive, sactive);
-
+		trace_ata_tf_load(ap, &qc->tf);
 		ap->ops->sff_tf_load(ap, &qc->tf);
+		trace_ata_exec_command(ap, &qc->tf, tag);
 		sata_dwc_exec_command_by_tag(ap, &qc->tf, tag,
 					     SATA_DWC_CMD_ISSUED_PEND);
 	} else {
diff --git a/drivers/ata/sata_nv.c b/drivers/ata/sata_nv.c
index 3c70405a0b80..06d381b9764e 100644
--- a/drivers/ata/sata_nv.c
+++ b/drivers/ata/sata_nv.c
@@ -31,6 +31,7 @@
 #include <scsi/scsi_host.h>
 #include <scsi/scsi_device.h>
 #include <linux/libata.h>
+#include <trace/events/libata.h>
 
 #define DRV_NAME			"sata_nv"
 #define DRV_VERSION			"3.5"
@@ -1434,8 +1435,6 @@ static unsigned int nv_adma_qc_issue(struct ata_queued_cmd *qc)
 
 	writew(qc->hw_tag, mmio + NV_ADMA_APPEND);
 
-	DPRINTK("Issued tag %u\n", qc->hw_tag);
-
 	return 0;
 }
 
@@ -2013,19 +2012,17 @@ static unsigned int nv_swncq_issue_atacmd(struct ata_port *ap,
 	if (qc == NULL)
 		return 0;
 
-	DPRINTK("Enter\n");
-
 	writel((1 << qc->hw_tag), pp->sactive_block);
 	pp->last_issue_tag = qc->hw_tag;
 	pp->dhfis_bits &= ~(1 << qc->hw_tag);
 	pp->dmafis_bits &= ~(1 << qc->hw_tag);
 	pp->qc_active |= (0x1 << qc->hw_tag);
 
+	trace_ata_tf_load(ap, &qc->tf);
 	ap->ops->sff_tf_load(ap, &qc->tf);	 /* load tf registers */
+	trace_ata_exec_command(ap, &qc->tf, qc->hw_tag);
 	ap->ops->sff_exec_command(ap, &qc->tf);
 
-	DPRINTK("Issued tag %u\n", qc->hw_tag);
-
 	return 0;
 }
 
@@ -2037,8 +2034,6 @@ static unsigned int nv_swncq_qc_issue(struct ata_queued_cmd *qc)
 	if (qc->tf.protocol != ATA_PROT_NCQ)
 		return ata_bmdma_qc_issue(qc);
 
-	DPRINTK("Enter\n");
-
 	if (!pp->qc_active)
 		nv_swncq_issue_atacmd(ap, qc);
 	else
@@ -2083,6 +2078,7 @@ static int nv_swncq_sdbfis(struct ata_port *ap)
 	u8 lack_dhfis = 0;
 
 	host_stat = ap->ops->bmdma_status(ap);
+	trace_ata_bmdma_status(ap, host_stat);
 	if (unlikely(host_stat & ATA_DMA_ERR)) {
 		/* error when transferring data to/from memory */
 		ata_ehi_clear_desc(ehi);
diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
index 9005833ab02f..b4994d182eda 100644
--- a/drivers/ata/sata_rcar.c
+++ b/drivers/ata/sata_rcar.c
@@ -436,8 +436,6 @@ static void sata_rcar_tf_read(struct ata_port *ap, struct ata_taskfile *tf)
 static void sata_rcar_exec_command(struct ata_port *ap,
 				   const struct ata_taskfile *tf)
 {
-	DPRINTK("ata%u: cmd 0x%X\n", ap->print_id, tf->command);
-
 	iowrite32(tf->command, ap->ioaddr.command_addr);
 	ata_sff_pause(ap);
 }
diff --git a/include/trace/events/libata.h b/include/trace/events/libata.h
index 2394fc2b2831..acb9a4fc18ed 100644
--- a/include/trace/events/libata.h
+++ b/include/trace/events/libata.h
@@ -151,6 +151,9 @@
 const char *libata_trace_parse_status(struct trace_seq*, unsigned char);
 #define __parse_status(s) libata_trace_parse_status(p, s)
 
+const char *libata_trace_parse_host_stat(struct trace_seq *, unsigned char);
+#define __parse_host_stat(s) libata_trace_parse_host_stat(p, s)
+
 const char *libata_trace_parse_eh_action(struct trace_seq *, unsigned int);
 #define __parse_eh_action(a) libata_trace_parse_eh_action(p, a)
 
@@ -299,6 +302,128 @@ DEFINE_EVENT(ata_qc_complete_template, ata_qc_complete_done,
 	     TP_PROTO(struct ata_queued_cmd *qc),
 	     TP_ARGS(qc));
 
+TRACE_EVENT(ata_tf_load,
+
+	TP_PROTO(struct ata_port *ap, const struct ata_taskfile *tf),
+
+	TP_ARGS(ap, tf),
+
+	TP_STRUCT__entry(
+		__field( unsigned int,	ata_port )
+		__field( unsigned char,	cmd	)
+		__field( unsigned char,	dev	)
+		__field( unsigned char,	lbal	)
+		__field( unsigned char,	lbam	)
+		__field( unsigned char,	lbah	)
+		__field( unsigned char,	nsect	)
+		__field( unsigned char,	feature	)
+		__field( unsigned char,	hob_lbal )
+		__field( unsigned char,	hob_lbam )
+		__field( unsigned char,	hob_lbah )
+		__field( unsigned char,	hob_nsect )
+		__field( unsigned char,	hob_feature )
+		__field( unsigned char,	proto	)
+	),
+
+	TP_fast_assign(
+		__entry->ata_port	= ap->print_id;
+		__entry->proto		= tf->protocol;
+		__entry->cmd		= tf->command;
+		__entry->dev		= tf->device;
+		__entry->lbal		= tf->lbal;
+		__entry->lbam		= tf->lbam;
+		__entry->lbah		= tf->lbah;
+		__entry->hob_lbal	= tf->hob_lbal;
+		__entry->hob_lbam	= tf->hob_lbam;
+		__entry->hob_lbah	= tf->hob_lbah;
+		__entry->feature	= tf->feature;
+		__entry->hob_feature	= tf->hob_feature;
+		__entry->nsect		= tf->nsect;
+		__entry->hob_nsect	= tf->hob_nsect;
+	),
+
+	TP_printk("ata_port=%u proto=%s cmd=%s%s " \
+		  " tf=(%02x/%02x:%02x:%02x:%02x:%02x/%02x:%02x:%02x:%02x:%02x/%02x)",
+		  __entry->ata_port,
+		  show_protocol_name(__entry->proto),
+		  show_opcode_name(__entry->cmd),
+		  __parse_subcmd(__entry->cmd, __entry->feature, __entry->hob_nsect),
+		  __entry->cmd, __entry->feature, __entry->nsect,
+		  __entry->lbal, __entry->lbam, __entry->lbah,
+		  __entry->hob_feature, __entry->hob_nsect,
+		  __entry->hob_lbal, __entry->hob_lbam, __entry->hob_lbah,
+		  __entry->dev)
+);
+
+DECLARE_EVENT_CLASS(ata_exec_command_template,
+
+	TP_PROTO(struct ata_port *ap, const struct ata_taskfile *tf, unsigned int tag),
+
+	TP_ARGS(ap, tf, tag),
+
+	TP_STRUCT__entry(
+		__field( unsigned int,	ata_port )
+		__field( unsigned int,	tag	)
+		__field( unsigned char,	cmd	)
+		__field( unsigned char,	feature	)
+		__field( unsigned char,	hob_nsect )
+		__field( unsigned char,	proto	)
+	),
+
+	TP_fast_assign(
+		__entry->ata_port	= ap->print_id;
+		__entry->tag		= tag;
+		__entry->proto		= tf->protocol;
+		__entry->cmd		= tf->command;
+		__entry->feature	= tf->feature;
+		__entry->hob_nsect	= tf->hob_nsect;
+	),
+
+	TP_printk("ata_port=%u tag=%d proto=%s cmd=%s%s",
+		  __entry->ata_port, __entry->tag,
+		  show_protocol_name(__entry->proto),
+		  show_opcode_name(__entry->cmd),
+		  __parse_subcmd(__entry->cmd, __entry->feature, __entry->hob_nsect))
+);
+
+DEFINE_EVENT(ata_exec_command_template, ata_exec_command,
+	     TP_PROTO(struct ata_port *ap, const struct ata_taskfile *tf, unsigned int tag),
+	     TP_ARGS(ap, tf, tag));
+
+DEFINE_EVENT(ata_exec_command_template, ata_bmdma_setup,
+	     TP_PROTO(struct ata_port *ap, const struct ata_taskfile *tf, unsigned int tag),
+	     TP_ARGS(ap, tf, tag));
+
+DEFINE_EVENT(ata_exec_command_template, ata_bmdma_start,
+	     TP_PROTO(struct ata_port *ap, const struct ata_taskfile *tf, unsigned int tag),
+	     TP_ARGS(ap, tf, tag));
+
+DEFINE_EVENT(ata_exec_command_template, ata_bmdma_stop,
+	     TP_PROTO(struct ata_port *ap, const struct ata_taskfile *tf, unsigned int tag),
+	     TP_ARGS(ap, tf, tag));
+
+TRACE_EVENT(ata_bmdma_status,
+
+	TP_PROTO(struct ata_port *ap, unsigned int host_stat),
+
+	TP_ARGS(ap, host_stat),
+
+	TP_STRUCT__entry(
+		__field( unsigned int,	ata_port )
+		__field( unsigned int,	tag	)
+		__field( unsigned char,	host_stat )
+	),
+
+	TP_fast_assign(
+		__entry->ata_port	= ap->print_id;
+		__entry->host_stat	= host_stat;
+	),
+
+	TP_printk("ata_port=%u host_stat=%s",
+		  __entry->ata_port,
+		  __parse_host_stat(__entry->host_stat))
+);
+
 TRACE_EVENT(ata_eh_link_autopsy,
 
 	TP_PROTO(struct ata_device *dev, unsigned int eh_action, unsigned int eh_err_mask),
-- 
2.29.2

