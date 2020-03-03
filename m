Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE8AC1772B3
	for <lists+linux-ide@lfdr.de>; Tue,  3 Mar 2020 10:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbgCCJjz (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 3 Mar 2020 04:39:55 -0500
Received: from mx2.suse.de ([195.135.220.15]:47868 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728278AbgCCJjt (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 3 Mar 2020 04:39:49 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 3249AB24B;
        Tue,  3 Mar 2020 09:39:42 +0000 (UTC)
From:   Hannes Reinecke <hare@suse.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Tejun Heo <tj@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 36/40] libata-core: move DPRINTK to ata debugging
Date:   Tue,  3 Mar 2020 10:38:09 +0100
Message-Id: <20200303093813.18523-37-hare@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200303093813.18523-1-hare@suse.de>
References: <20200303093813.18523-1-hare@suse.de>
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Replace all DPRINTK calls with the ata_XXX_dbg functions.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/ata/libata-core.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 695974d0c634..394545d3d8d9 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -2061,7 +2061,7 @@ unsigned int ata_read_log_page(struct ata_device *dev, u8 log,
 	unsigned int err_mask;
 	bool dma = false;
 
-	DPRINTK("read log page - log 0x%x, page 0x%x\n", log, page);
+	ata_dev_dbg(dev, "read log page - log 0x%x, page 0x%x\n", log, page);
 
 	/*
 	 * Return error without actually issuing the command on controllers
@@ -2097,7 +2097,7 @@ unsigned int ata_read_log_page(struct ata_device *dev, u8 log,
 		goto retry;
 	}
 
-	DPRINTK("EXIT, err_mask=%x\n", err_mask);
+	ata_dev_dbg(dev, "EXIT, err_mask=%x\n", err_mask);
 	return err_mask;
 }
 
@@ -3560,7 +3560,7 @@ static int ata_dev_set_mode(struct ata_device *dev)
 			dev_err_whine = " (device error ignored)";
 	}
 
-	DPRINTK("xfer_shift=%u, xfer_mode=0x%x\n",
+	ata_dev_dbg(dev, "xfer_shift=%u, xfer_mode=0x%x\n",
 		dev->xfer_shift, (int)dev->xfer_mode);
 
 	if (!(ehc->i.flags & ATA_EHI_QUIET) ||
@@ -4814,7 +4814,7 @@ static unsigned int ata_dev_set_xfermode(struct ata_device *dev)
 	unsigned int err_mask;
 
 	/* set up set-features taskfile */
-	DPRINTK("set features - xfer mode\n");
+	ata_dev_dbg(dev, "set features - xfer mode\n");
 
 	/* Some controllers and ATAPI devices show flaky interrupt
 	 * behavior after setting xfer mode.  Use polling instead.
@@ -4836,7 +4836,7 @@ static unsigned int ata_dev_set_xfermode(struct ata_device *dev)
 	/* On some disks, this command causes spin-up, so we need longer timeout */
 	err_mask = ata_exec_internal(dev, &tf, NULL, DMA_NONE, NULL, 0, 15000);
 
-	DPRINTK("EXIT, err_mask=%x\n", err_mask);
+	ata_dev_dbg(dev, "EXIT, err_mask=%x\n", err_mask);
 	return err_mask;
 }
 
@@ -4862,7 +4862,8 @@ unsigned int ata_dev_set_feature(struct ata_device *dev, u8 enable, u8 feature)
 	unsigned long timeout = 0;
 
 	/* set up set-features taskfile */
-	DPRINTK("set features - SATA features\n");
+	ata_dev_dbg(dev, "set features - SATA features enable %u feature %u\n",
+		    enable, feature);
 
 	ata_tf_init(dev, &tf);
 	tf.command = ATA_CMD_SET_FEATURES;
@@ -4876,7 +4877,7 @@ unsigned int ata_dev_set_feature(struct ata_device *dev, u8 enable, u8 feature)
 			  ata_probe_timeout * 1000 : SETFEATURES_SPINUP_TIMEOUT;
 	err_mask = ata_exec_internal(dev, &tf, NULL, DMA_NONE, NULL, 0, timeout);
 
-	DPRINTK("EXIT, err_mask=%x\n", err_mask);
+	ata_dev_dbg(dev, "EXIT, err_mask=%x\n", err_mask);
 	return err_mask;
 }
 EXPORT_SYMBOL_GPL(ata_dev_set_feature);
@@ -4904,7 +4905,8 @@ static unsigned int ata_dev_init_params(struct ata_device *dev,
 		return AC_ERR_INVALID;
 
 	/* set up init dev params taskfile */
-	DPRINTK("init dev params \n");
+	ata_dev_dbg(dev, "init dev params heads %u sectors %u\n",
+		    heads, sectors);
 
 	ata_tf_init(dev, &tf);
 	tf.command = ATA_CMD_INIT_DEV_PARAMS;
@@ -4920,7 +4922,7 @@ static unsigned int ata_dev_init_params(struct ata_device *dev,
 	if (err_mask == AC_ERR_DEV && (tf.feature & ATA_ABORTED))
 		err_mask = 0;
 
-	DPRINTK("EXIT, err_mask=%x\n", err_mask);
+	ata_dev_dbg(dev, "EXIT, err_mask=%x\n", err_mask);
 	return err_mask;
 }
 
-- 
2.16.4

