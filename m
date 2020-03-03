Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFE4F1772A3
	for <lists+linux-ide@lfdr.de>; Tue,  3 Mar 2020 10:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbgCCJjs (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 3 Mar 2020 04:39:48 -0500
Received: from mx2.suse.de ([195.135.220.15]:47750 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728216AbgCCJjq (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 3 Mar 2020 04:39:46 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id B9FCDB202;
        Tue,  3 Mar 2020 09:39:41 +0000 (UTC)
From:   Hannes Reinecke <hare@suse.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Tejun Heo <tj@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 14/40] sata_sx4: move DPRINTK to VPRINTK
Date:   Tue,  3 Mar 2020 10:37:47 +0100
Message-Id: <20200303093813.18523-15-hare@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200303093813.18523-1-hare@suse.de>
References: <20200303093813.18523-1-hare@suse.de>
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

All other logging instances in this functions are with VPRINTK,
so follow suit.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/ata/sata_sx4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/sata_sx4.c b/drivers/ata/sata_sx4.c
index 2c7b30c5ea3d..e99d9f5139f9 100644
--- a/drivers/ata/sata_sx4.c
+++ b/drivers/ata/sata_sx4.c
@@ -755,7 +755,7 @@ static inline unsigned int pdc20621_host_intr(struct ata_port *ap,
 	} else if (qc->tf.protocol == ATA_PROT_NODATA) {
 
 		status = ata_sff_busy_wait(ap, ATA_BUSY | ATA_DRQ, 1000);
-		DPRINTK("BUS_NODATA (drv_stat 0x%X)\n", status);
+		VPRINTK("BUS_NODATA (drv_stat 0x%X)\n", status);
 		qc->err_mask |= ac_err_mask(status);
 		ata_qc_complete(qc);
 		handled = 1;
-- 
2.16.4

