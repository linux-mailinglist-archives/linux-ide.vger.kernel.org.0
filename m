Return-Path: <linux-ide+bounces-2999-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE822A210DF
	for <lists+linux-ide@lfdr.de>; Tue, 28 Jan 2025 19:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2278188341B
	for <lists+linux-ide@lfdr.de>; Tue, 28 Jan 2025 18:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6B81DFE34;
	Tue, 28 Jan 2025 18:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="na5TgR7E"
X-Original-To: linux-ide@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6586C1DE883;
	Tue, 28 Jan 2025 18:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738088520; cv=none; b=kermLJdDC24Le3ErYD6irVjlVppoB0LGp2wMFAJrZ3IkIFVrO+e26loZ382p7+h3bSFGtrCGxBmpEQTbjFsLjsYZsJE6G1gZiaAo0XU0s3tEp2z9RGVl62deOq30BvJ+XFtCJlhthNX7NU4FUalG85Os61NSCQrpTsgnwV+TXJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738088520; c=relaxed/simple;
	bh=iIQzJX8f/eC7FsZxb8QYjCqjWvaS61qp8B1ScA7VBzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rGbFyLdyJO4u4d6QE2PfIcfikahDBI58RaeUMFPFoTssOtEfHwchjnv+CvWigWDuOmpmY62udc6yyE6lP7RA0wRWk2Lx3OcjZiJ224UijUaEdEQWnxSHJOVaRT4Zwd+MQiDWBWM9mStmaPk0lKb37X2gv3E4m/GnazdduPVMarU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=na5TgR7E; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from eahariha-devbox.internal.cloudapp.net (unknown [40.91.112.99])
	by linux.microsoft.com (Postfix) with ESMTPSA id A5F412037178;
	Tue, 28 Jan 2025 10:21:57 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A5F412037178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1738088517;
	bh=Wadsy2NxJXxqQ+ZbhJ1ZiEC/4XRrTap5C0/XqtGuMu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=na5TgR7ElKwogZ/k+Z0ybAln+R1AMEzKcOKd3gVcuZRiyqr/iXkxm5sB4wdMicFT8
	 5cV0NYPUXQT7qjedQEwyZQIdf7RjebrBopNTxrugtd5gFZqW8w6LS7rzpaEmz3HAP1
	 6iPQpwjqyuRZVEMFlWOaUeR52txcp6jerxVEtbhM=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Date: Tue, 28 Jan 2025 18:21:47 +0000
Subject: [PATCH 02/16] scsi: lpfc: convert timeouts to secs_to_jiffies()
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-converge-secs-to-jiffies-part-two-v1-2-9a6ecf0b2308@linux.microsoft.com>
References: <20250128-converge-secs-to-jiffies-part-two-v1-0-9a6ecf0b2308@linux.microsoft.com>
In-Reply-To: <20250128-converge-secs-to-jiffies-part-two-v1-0-9a6ecf0b2308@linux.microsoft.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Yaron Avizrat <yaron.avizrat@intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
 James Smart <james.smart@broadcom.com>, 
 Dick Kennedy <dick.kennedy@broadcom.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Dongsheng Yang <dongsheng.yang@easystack.cn>, Jens Axboe <axboe@kernel.dk>, 
 Xiubo Li <xiubli@redhat.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Carlos Maiolino <cem@kernel.org>, 
 "Darrick J. Wong" <djwong@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Frank Li <Frank.Li@nxp.com>, 
 Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Selvin Xavier <selvin.xavier@broadcom.com>, 
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>
Cc: cocci@inria.fr, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-sound@vger.kernel.org, linux-btrfs@vger.kernel.org, 
 ceph-devel@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-ide@vger.kernel.org, linux-xfs@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-nvme@lists.infradead.org, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-rdma@vger.kernel.org, 
 Easwar Hariharan <eahariha@linux.microsoft.com>
X-Mailer: b4 0.14.2

Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
secs_to_jiffies().  As the value here is a multiple of 1000, use
secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplication.

This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci with
the following Coccinelle rules:

@depends on patch@
expression E;
@@

-msecs_to_jiffies
+secs_to_jiffies
(E
- * \( 1000 \| MSEC_PER_SEC \)
)

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/scsi/lpfc/lpfc_init.c  |  4 ++--
 drivers/scsi/lpfc/lpfc_scsi.c  | 12 +++++-------
 drivers/scsi/lpfc/lpfc_sli.c   | 24 +++++++++---------------
 drivers/scsi/lpfc/lpfc_vport.c |  2 +-
 4 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index bcadf11414c8a41d6fc99d03586d55c26d0a6a0f..783ba9c6a81cdc560b8c901d383c3c4d55eedbc7 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -3361,8 +3361,8 @@ lpfc_block_mgmt_io(struct lpfc_hba *phba, int mbx_action)
 		/* Determine how long we might wait for the active mailbox
 		 * command to be gracefully completed by firmware.
 		 */
-		timeout = msecs_to_jiffies(lpfc_mbox_tmo_val(phba,
-				phba->sli.mbox_active) * 1000) + jiffies;
+		timeout = secs_to_jiffies(lpfc_mbox_tmo_val(phba,
+				phba->sli.mbox_active)) + jiffies;
 	}
 	spin_unlock_irqrestore(&phba->hbalock, iflag);
 
diff --git a/drivers/scsi/lpfc/lpfc_scsi.c b/drivers/scsi/lpfc/lpfc_scsi.c
index 055ed632c14df51376126a285df728269ca1da6c..f0158fc00f783239db615b0978b6785de064535f 100644
--- a/drivers/scsi/lpfc/lpfc_scsi.c
+++ b/drivers/scsi/lpfc/lpfc_scsi.c
@@ -5645,9 +5645,8 @@ lpfc_abort_handler(struct scsi_cmnd *cmnd)
 	 * cmd_flag is set to LPFC_DRIVER_ABORTED before we wait
 	 * for abort to complete.
 	 */
-	wait_event_timeout(waitq,
-			  (lpfc_cmd->pCmd != cmnd),
-			   msecs_to_jiffies(2*vport->cfg_devloss_tmo*1000));
+	wait_event_timeout(waitq, (lpfc_cmd->pCmd != cmnd),
+			   secs_to_jiffies(2*vport->cfg_devloss_tmo));
 
 	spin_lock(&lpfc_cmd->buf_lock);
 
@@ -5911,7 +5910,7 @@ lpfc_chk_tgt_mapped(struct lpfc_vport *vport, struct fc_rport *rport)
 	 * If target is not in a MAPPED state, delay until
 	 * target is rediscovered or devloss timeout expires.
 	 */
-	later = msecs_to_jiffies(2 * vport->cfg_devloss_tmo * 1000) + jiffies;
+	later = secs_to_jiffies(2 * vport->cfg_devloss_tmo) + jiffies;
 	while (time_after(later, jiffies)) {
 		if (!pnode)
 			return FAILED;
@@ -5957,7 +5956,7 @@ lpfc_reset_flush_io_context(struct lpfc_vport *vport, uint16_t tgt_id,
 		lpfc_sli_abort_taskmgmt(vport,
 					&phba->sli.sli3_ring[LPFC_FCP_RING],
 					tgt_id, lun_id, context);
-	later = msecs_to_jiffies(2 * vport->cfg_devloss_tmo * 1000) + jiffies;
+	later = secs_to_jiffies(2 * vport->cfg_devloss_tmo) + jiffies;
 	while (time_after(later, jiffies) && cnt) {
 		schedule_timeout_uninterruptible(msecs_to_jiffies(20));
 		cnt = lpfc_sli_sum_iocb(vport, tgt_id, lun_id, context);
@@ -6137,8 +6136,7 @@ lpfc_target_reset_handler(struct scsi_cmnd *cmnd)
 			wait_event_timeout(waitq,
 					   !test_bit(NLP_WAIT_FOR_LOGO,
 						     &pnode->save_flags),
-					   msecs_to_jiffies(dev_loss_tmo *
-							    1000));
+					   secs_to_jiffies(dev_loss_tmo));
 
 			if (test_and_clear_bit(NLP_WAIT_FOR_LOGO,
 					       &pnode->save_flags))
diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index 3fd9723cd271c8a024b6f34e583668e973404e6f..3ccc444c018c51f7c78a8acdb9d12ead8697fbcb 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -9504,8 +9504,7 @@ lpfc_sli_issue_mbox_s3(struct lpfc_hba *phba, LPFC_MBOXQ_t *pmbox,
 			goto out_not_finished;
 		}
 		/* timeout active mbox command */
-		timeout = msecs_to_jiffies(lpfc_mbox_tmo_val(phba, pmbox) *
-					   1000);
+		timeout = secs_to_jiffies(lpfc_mbox_tmo_val(phba, pmbox));
 		mod_timer(&psli->mbox_tmo, jiffies + timeout);
 	}
 
@@ -9629,8 +9628,7 @@ lpfc_sli_issue_mbox_s3(struct lpfc_hba *phba, LPFC_MBOXQ_t *pmbox,
 						       drvr_flag);
 			goto out_not_finished;
 		}
-		timeout = msecs_to_jiffies(lpfc_mbox_tmo_val(phba, pmbox) *
-							1000) + jiffies;
+		timeout = secs_to_jiffies(lpfc_mbox_tmo_val(phba, pmbox)) + jiffies;
 		i = 0;
 		/* Wait for command to complete */
 		while (((word0 & OWN_CHIP) == OWN_CHIP) ||
@@ -9756,9 +9754,8 @@ lpfc_sli4_async_mbox_block(struct lpfc_hba *phba)
 	 * command to be gracefully completed by firmware.
 	 */
 	if (phba->sli.mbox_active)
-		timeout = msecs_to_jiffies(lpfc_mbox_tmo_val(phba,
-						phba->sli.mbox_active) *
-						1000) + jiffies;
+		timeout = secs_to_jiffies(lpfc_mbox_tmo_val(phba,
+						phba->sli.mbox_active)) + jiffies;
 	spin_unlock_irq(&phba->hbalock);
 
 	/* Make sure the mailbox is really active */
@@ -9881,8 +9878,7 @@ lpfc_sli4_wait_bmbx_ready(struct lpfc_hba *phba, LPFC_MBOXQ_t *mboxq)
 		}
 	}
 
-	timeout = msecs_to_jiffies(lpfc_mbox_tmo_val(phba, mboxq)
-				   * 1000) + jiffies;
+	timeout = secs_to_jiffies(lpfc_mbox_tmo_val(phba, mboxq)) + jiffies;
 
 	do {
 		bmbx_reg.word0 = readl(phba->sli4_hba.BMBXregaddr);
@@ -13159,7 +13155,7 @@ lpfc_sli_issue_iocb_wait(struct lpfc_hba *phba,
 	retval = lpfc_sli_issue_iocb(phba, ring_number, piocb,
 				     SLI_IOCB_RET_IOCB);
 	if (retval == IOCB_SUCCESS) {
-		timeout_req = msecs_to_jiffies(timeout * 1000);
+		timeout_req = secs_to_jiffies(timeout);
 		timeleft = wait_event_timeout(done_q,
 				lpfc_chk_iocb_flg(phba, piocb, LPFC_IO_WAKE),
 				timeout_req);
@@ -13275,8 +13271,7 @@ lpfc_sli_issue_mbox_wait(struct lpfc_hba *phba, LPFC_MBOXQ_t *pmboxq,
 	/* now issue the command */
 	retval = lpfc_sli_issue_mbox(phba, pmboxq, MBX_NOWAIT);
 	if (retval == MBX_BUSY || retval == MBX_SUCCESS) {
-		wait_for_completion_timeout(&mbox_done,
-					    msecs_to_jiffies(timeout * 1000));
+		wait_for_completion_timeout(&mbox_done, secs_to_jiffies(timeout));
 
 		spin_lock_irqsave(&phba->hbalock, flag);
 		pmboxq->ctx_u.mbox_wait = NULL;
@@ -13336,9 +13331,8 @@ lpfc_sli_mbox_sys_shutdown(struct lpfc_hba *phba, int mbx_action)
 		 * command to be gracefully completed by firmware.
 		 */
 		if (phba->sli.mbox_active)
-			timeout = msecs_to_jiffies(lpfc_mbox_tmo_val(phba,
-						phba->sli.mbox_active) *
-						1000) + jiffies;
+			timeout = secs_to_jiffies(lpfc_mbox_tmo_val(phba,
+						phba->sli.mbox_active)) + jiffies;
 		spin_unlock_irq(&phba->hbalock);
 
 		/* Enable softirqs again, done with phba->hbalock */
diff --git a/drivers/scsi/lpfc/lpfc_vport.c b/drivers/scsi/lpfc/lpfc_vport.c
index 3d70cc5175730b31eeaf46c89d65c0dc09367d44..cc56a73343195a263c307fab6870a0012899060a 100644
--- a/drivers/scsi/lpfc/lpfc_vport.c
+++ b/drivers/scsi/lpfc/lpfc_vport.c
@@ -246,7 +246,7 @@ static void lpfc_discovery_wait(struct lpfc_vport *vport)
 	 * fabric RA_TOV value and dev_loss tmo.  The driver's
 	 * devloss_tmo is 10 giving this loop a 3x multiplier minimally.
 	 */
-	wait_time_max = msecs_to_jiffies(((phba->fc_ratov * 3) + 3) * 1000);
+	wait_time_max = secs_to_jiffies((phba->fc_ratov * 3) + 3);
 	wait_time_max += jiffies;
 	start_time = jiffies;
 	while (time_before(jiffies, wait_time_max)) {

-- 
2.43.0


