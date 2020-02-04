Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1826E151EAA
	for <lists+linux-ide@lfdr.de>; Tue,  4 Feb 2020 17:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbgBDQ4O (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 4 Feb 2020 11:56:14 -0500
Received: from mx2.suse.de ([195.135.220.15]:34868 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727416AbgBDQ4K (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 4 Feb 2020 11:56:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 3C3C9B1DC;
        Tue,  4 Feb 2020 16:56:05 +0000 (UTC)
From:   Hannes Reinecke <hare@suse.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Bartolomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.com>,
        Hannes Reinecke <hare@suse.de>
Subject: [PATCH 31/46] pata_octeon_cf: move DPRINTK to VPRINTK
Date:   Tue,  4 Feb 2020 17:55:32 +0100
Message-Id: <20200204165547.115220-32-hare@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200204165547.115220-1-hare@suse.de>
References: <20200204165547.115220-1-hare@suse.de>
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Hannes Reinecke <hare@suse.com>

Move the remaining DPRINTK statement in the interrupt handler to
VPRINTK. It'll be converted later with the remaining VPRINTK
calls.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/pata_octeon_cf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/pata_octeon_cf.c b/drivers/ata/pata_octeon_cf.c
index 9527216e59b9..f262120f4615 100644
--- a/drivers/ata/pata_octeon_cf.c
+++ b/drivers/ata/pata_octeon_cf.c
@@ -671,7 +671,7 @@ static irqreturn_t octeon_cf_interrupt(int irq, void *dev_instance)
 
 	spin_lock_irqsave(&host->lock, flags);
 
-	DPRINTK("ENTER\n");
+	VPRINTK("ENTER\n");
 	for (i = 0; i < host->n_ports; i++) {
 		u8 status;
 		struct ata_port *ap;
@@ -725,7 +725,7 @@ static irqreturn_t octeon_cf_interrupt(int irq, void *dev_instance)
 		}
 	}
 	spin_unlock_irqrestore(&host->lock, flags);
-	DPRINTK("EXIT\n");
+	VPRINTK("EXIT\n");
 	return IRQ_RETVAL(handled);
 }
 
-- 
2.16.4

