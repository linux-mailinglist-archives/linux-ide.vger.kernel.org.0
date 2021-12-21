Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3B347BACB
	for <lists+linux-ide@lfdr.de>; Tue, 21 Dec 2021 08:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232548AbhLUHWt (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 21 Dec 2021 02:22:49 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:55882 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232115AbhLUHWo (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 21 Dec 2021 02:22:44 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id C4AA71F3B9;
        Tue, 21 Dec 2021 07:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1640071361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r3s6DbGGHTpY/WaogD82asF1WPOP7Ca6Apy04KrCc0E=;
        b=hQH8RF11arM60X3LabfbrZv0/3/iRdqbKGhWyvK2CIL26DNGHue4gwFheB3X9zcXYlSUyt
        7V+p2zRhU3Q7TcrgLV/MrHoSaeujQst7Szp6Q8+0E3AXDZI92OWhyWiqXFgAuQiRzEyU87
        hwyNTDNrxQSPnomJOoOK1Secg55kzhw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1640071361;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r3s6DbGGHTpY/WaogD82asF1WPOP7Ca6Apy04KrCc0E=;
        b=GKeXKZ0+7NQbhsfUpL+Tt8PSPMxDoRKS3aAdv1KqmesA76Y2tAseMAFPn1zDi99uz7CpMQ
        0G+qMg0nFOXU0XDA==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
        by relay2.suse.de (Postfix) with ESMTP id BFAFEA3B8D;
        Tue, 21 Dec 2021 07:22:41 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
        id BE7E05192384; Tue, 21 Dec 2021 08:22:41 +0100 (CET)
From:   Hannes Reinecke <hare@suse.de>
To:     Damien LeMoal <damien.lemoal@wdc.com>
Cc:     linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 09/68] libata-sff: tracepoints for HSM state machine
Date:   Tue, 21 Dec 2021 08:20:32 +0100
Message-Id: <20211221072131.46673-10-hare@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211221072131.46673-1-hare@suse.de>
References: <20211221072131.46673-1-hare@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Add tracepoints for the HSM state machine and drop DPRINTK calls

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/libata-sff.c      |  20 ++----
 drivers/ata/libata-trace.c    |  29 ++++++++
 include/trace/events/libata.h | 125 ++++++++++++++++++++++++++++++++++
 3 files changed, 161 insertions(+), 13 deletions(-)

diff --git a/drivers/ata/libata-sff.c b/drivers/ata/libata-sff.c
index 76bd87691978..b544bdc6d0a3 100644
--- a/drivers/ata/libata-sff.c
+++ b/drivers/ata/libata-sff.c
@@ -668,7 +668,7 @@ static void ata_pio_sector(struct ata_queued_cmd *qc)
 	page = nth_page(page, (offset >> PAGE_SHIFT));
 	offset %= PAGE_SIZE;
 
-	DPRINTK("data %s\n", qc->tf.flags & ATA_TFLAG_WRITE ? "write" : "read");
+	trace_ata_sff_pio_transfer_data(qc, offset, qc->sect_size);
 
 	/*
 	 * Split the transfer when it splits a page boundary.  Note that the
@@ -738,7 +738,7 @@ static void ata_pio_sectors(struct ata_queued_cmd *qc)
 static void atapi_send_cdb(struct ata_port *ap, struct ata_queued_cmd *qc)
 {
 	/* send SCSI cdb */
-	DPRINTK("send cdb\n");
+	trace_atapi_send_cdb(qc, 0, qc->dev->cdb_len);
 	WARN_ON_ONCE(qc->dev->cdb_len < 12);
 
 	ap->ops->sff_data_xfer(qc, qc->cdb, qc->dev->cdb_len, 1);
@@ -809,7 +809,7 @@ static int __atapi_pio_bytes(struct ata_queued_cmd *qc, unsigned int bytes)
 	/* don't cross page boundaries */
 	count = min(count, (unsigned int)PAGE_SIZE - offset);
 
-	DPRINTK("data %s\n", qc->tf.flags & ATA_TFLAG_WRITE ? "write" : "read");
+	trace_atapi_pio_transfer_data(qc, offset, count);
 
 	/* do the actual data transfer */
 	buf = kmap_atomic(page);
@@ -991,8 +991,7 @@ int ata_sff_hsm_move(struct ata_port *ap, struct ata_queued_cmd *qc,
 	WARN_ON_ONCE(in_wq != ata_hsm_ok_in_wq(ap, qc));
 
 fsm_start:
-	DPRINTK("ata%u: protocol %d task_state %d (dev_stat 0x%X)\n",
-		ap->print_id, qc->tf.protocol, ap->hsm_task_state, status);
+	trace_ata_sff_hsm_state(qc, status);
 
 	switch (ap->hsm_task_state) {
 	case HSM_ST_FIRST:
@@ -1193,8 +1192,7 @@ int ata_sff_hsm_move(struct ata_port *ap, struct ata_queued_cmd *qc,
 		}
 
 		/* no more data to transfer */
-		DPRINTK("ata%u: dev %u command complete, drv_stat 0x%x\n",
-			ap->print_id, qc->dev->devno, status);
+		trace_ata_sff_hsm_command_complete(qc, status);
 
 		WARN_ON_ONCE(qc->err_mask & (AC_ERR_DEV | AC_ERR_HSM));
 
@@ -1251,7 +1249,7 @@ EXPORT_SYMBOL_GPL(ata_sff_queue_pio_task);
 
 void ata_sff_flush_pio_task(struct ata_port *ap)
 {
-	DPRINTK("ENTER\n");
+	trace_ata_sff_flush_pio_task(ap);
 
 	cancel_delayed_work_sync(&ap->sff_pio_task);
 
@@ -1268,9 +1266,6 @@ void ata_sff_flush_pio_task(struct ata_port *ap)
 	spin_unlock_irq(ap->lock);
 
 	ap->sff_pio_task_link = NULL;
-
-	if (ata_msg_ctl(ap))
-		ata_port_dbg(ap, "%s: EXIT\n", __func__);
 }
 
 static void ata_sff_pio_task(struct work_struct *work)
@@ -1467,8 +1462,7 @@ static unsigned int __ata_sff_port_intr(struct ata_port *ap,
 {
 	u8 status;
 
-	VPRINTK("ata%u: protocol %d task_state %d\n",
-		ap->print_id, qc->tf.protocol, ap->hsm_task_state);
+	trace_ata_sff_port_intr(qc, hsmv_on_idle);
 
 	/* Check whether we are expecting interrupt in this state */
 	switch (ap->hsm_task_state) {
diff --git a/drivers/ata/libata-trace.c b/drivers/ata/libata-trace.c
index 8a929e4414dc..e0e4d0d5a100 100644
--- a/drivers/ata/libata-trace.c
+++ b/drivers/ata/libata-trace.c
@@ -155,6 +155,35 @@ libata_trace_parse_qc_flags(struct trace_seq *p, unsigned int qc_flags)
 	return ret;
 }
 
+const char *
+libata_trace_parse_tf_flags(struct trace_seq *p, unsigned int tf_flags)
+{
+	const char *ret = trace_seq_buffer_ptr(p);
+
+	trace_seq_printf(p, "%x", tf_flags);
+	if (tf_flags) {
+		trace_seq_printf(p, "{ ");
+		if (tf_flags & ATA_TFLAG_LBA48)
+			trace_seq_printf(p, "LBA48 ");
+		if (tf_flags & ATA_TFLAG_ISADDR)
+			trace_seq_printf(p, "ISADDR ");
+		if (tf_flags & ATA_TFLAG_DEVICE)
+			trace_seq_printf(p, "DEV ");
+		if (tf_flags & ATA_TFLAG_WRITE)
+			trace_seq_printf(p, "WRITE ");
+		if (tf_flags & ATA_TFLAG_LBA)
+			trace_seq_printf(p, "LBA ");
+		if (tf_flags & ATA_TFLAG_FUA)
+			trace_seq_printf(p, "FUA ");
+		if (tf_flags & ATA_TFLAG_POLLING)
+			trace_seq_printf(p, "POLL ");
+		trace_seq_putc(p, '}');
+	}
+	trace_seq_putc(p, 0);
+
+	return ret;
+}
+
 const char *
 libata_trace_parse_subcmd(struct trace_seq *p, unsigned char cmd,
 			  unsigned char feature, unsigned char hob_nsect)
diff --git a/include/trace/events/libata.h b/include/trace/events/libata.h
index acb9a4fc18ed..fcb8fde39614 100644
--- a/include/trace/events/libata.h
+++ b/include/trace/events/libata.h
@@ -148,6 +148,15 @@
 		ata_class_name(ATA_DEV_ZAC_UNSUP),	\
 		ata_class_name(ATA_DEV_NONE))
 
+#define ata_sff_hsm_state_name(state)	{ state, #state }
+#define show_sff_hsm_state_name(val)				\
+    __print_symbolic(val,				\
+		ata_sff_hsm_state_name(HSM_ST_IDLE),	\
+		ata_sff_hsm_state_name(HSM_ST_FIRST),	\
+		ata_sff_hsm_state_name(HSM_ST),		\
+		ata_sff_hsm_state_name(HSM_ST_LAST),	\
+		ata_sff_hsm_state_name(HSM_ST_ERR))
+
 const char *libata_trace_parse_status(struct trace_seq*, unsigned char);
 #define __parse_status(s) libata_trace_parse_status(p, s)
 
@@ -163,6 +172,9 @@ const char *libata_trace_parse_eh_err_mask(struct trace_seq *, unsigned int);
 const char *libata_trace_parse_qc_flags(struct trace_seq *, unsigned int);
 #define __parse_qc_flags(f) libata_trace_parse_qc_flags(p, f)
 
+const char *libata_trace_parse_tf_flags(struct trace_seq *, unsigned int);
+#define __parse_tf_flags(f) libata_trace_parse_tf_flags(p, f)
+
 const char *libata_trace_parse_subcmd(struct trace_seq *, unsigned char,
 				      unsigned char, unsigned char);
 #define __parse_subcmd(c,f,h) libata_trace_parse_subcmd(p, c, f, h)
@@ -558,6 +570,119 @@ DEFINE_EVENT(ata_link_reset_end_template, ata_slave_postreset,
 	     TP_PROTO(struct ata_link *link, unsigned int *class, int rc),
 	     TP_ARGS(link, class, rc));
 
+DECLARE_EVENT_CLASS(ata_sff_hsm_template,
+
+	TP_PROTO(struct ata_queued_cmd *qc, unsigned char status),
+
+	TP_ARGS(qc, status),
+
+	TP_STRUCT__entry(
+		__field( unsigned int,	ata_port )
+		__field( unsigned int,	ata_dev	)
+		__field( unsigned int,	tag	)
+		__field( unsigned int,	qc_flags )
+		__field( unsigned int,	protocol )
+		__field( unsigned int,	hsm_state )
+		__field( unsigned char,	dev_state )
+	),
+
+	TP_fast_assign(
+		__entry->ata_port	= qc->ap->print_id;
+		__entry->ata_dev	= qc->dev->link->pmp + qc->dev->devno;
+		__entry->tag		= qc->tag;
+		__entry->qc_flags	= qc->flags;
+		__entry->protocol	= qc->tf.protocol;
+		__entry->hsm_state	= qc->ap->hsm_task_state;
+		__entry->dev_state	= status;
+	),
+
+	TP_printk("ata_port=%u ata_dev=%u tag=%d proto=%s flags=%s task_state=%s dev_stat=0x%X",
+		  __entry->ata_port, __entry->ata_dev, __entry->tag,
+		  show_protocol_name(__entry->protocol),
+		  __parse_qc_flags(__entry->qc_flags),
+		  show_sff_hsm_state_name(__entry->hsm_state),
+		  __entry->dev_state)
+);
+
+DEFINE_EVENT(ata_sff_hsm_template, ata_sff_hsm_state,
+	TP_PROTO(struct ata_queued_cmd *qc, unsigned char state),
+	TP_ARGS(qc, state));
+
+DEFINE_EVENT(ata_sff_hsm_template, ata_sff_hsm_command_complete,
+	TP_PROTO(struct ata_queued_cmd *qc, unsigned char state),
+	TP_ARGS(qc, state));
+
+DEFINE_EVENT(ata_sff_hsm_template, ata_sff_port_intr,
+	TP_PROTO(struct ata_queued_cmd *qc, unsigned char state),
+	TP_ARGS(qc, state));
+
+DECLARE_EVENT_CLASS(ata_transfer_data_template,
+
+	TP_PROTO(struct ata_queued_cmd *qc, unsigned int offset, unsigned int count),
+
+	TP_ARGS(qc, offset, count),
+
+	TP_STRUCT__entry(
+		__field( unsigned int,	ata_port )
+		__field( unsigned int,	ata_dev	)
+		__field( unsigned int,	tag	)
+		__field( unsigned int,	flags	)
+		__field( unsigned int,	offset	)
+		__field( unsigned int,	bytes	)
+	),
+
+	TP_fast_assign(
+		__entry->ata_port	= qc->ap->print_id;
+		__entry->ata_dev	= qc->dev->link->pmp + qc->dev->devno;
+		__entry->tag		= qc->tag;
+		__entry->flags		= qc->tf.flags;
+		__entry->offset		= offset;
+		__entry->bytes		= count;
+	),
+
+	TP_printk("ata_port=%u ata_dev=%u tag=%d flags=%s offset=%u bytes=%u",
+		  __entry->ata_port, __entry->ata_dev, __entry->tag,
+		  __parse_tf_flags(__entry->flags),
+		  __entry->offset, __entry->bytes)
+);
+
+DEFINE_EVENT(ata_transfer_data_template, ata_sff_pio_transfer_data,
+	     TP_PROTO(struct ata_queued_cmd *qc, unsigned int offset, unsigned int count),
+	     TP_ARGS(qc, offset, count));
+
+DEFINE_EVENT(ata_transfer_data_template, atapi_pio_transfer_data,
+	     TP_PROTO(struct ata_queued_cmd *qc, unsigned int offset, unsigned int count),
+	     TP_ARGS(qc, offset, count));
+
+DEFINE_EVENT(ata_transfer_data_template, atapi_send_cdb,
+	     TP_PROTO(struct ata_queued_cmd *qc, unsigned int offset, unsigned int count),
+	     TP_ARGS(qc, offset, count));
+
+DECLARE_EVENT_CLASS(ata_sff_template,
+
+	TP_PROTO(struct ata_port *ap),
+
+	TP_ARGS(ap),
+
+	TP_STRUCT__entry(
+		__field( unsigned int,	ata_port )
+		__field( unsigned char,	hsm_state )
+	),
+
+	TP_fast_assign(
+		__entry->ata_port	= ap->print_id;
+		__entry->hsm_state	= ap->hsm_task_state;
+	),
+
+	TP_printk("ata_port=%u task_state=%s",
+		  __entry->ata_port,
+		  show_sff_hsm_state_name(__entry->hsm_state))
+);
+
+DEFINE_EVENT(ata_sff_template, ata_sff_flush_pio_task,
+	     TP_PROTO(struct ata_port *ap),
+	     TP_ARGS(ap));
+
 #endif /*  _TRACE_LIBATA_H */
 
 /* This part must be outside protection */
-- 
2.29.2

