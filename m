Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAE401772B1
	for <lists+linux-ide@lfdr.de>; Tue,  3 Mar 2020 10:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727531AbgCCJjv (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 3 Mar 2020 04:39:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:47720 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728273AbgCCJjs (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 3 Mar 2020 04:39:48 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 242EFB127;
        Tue,  3 Mar 2020 09:39:42 +0000 (UTC)
From:   Hannes Reinecke <hare@suse.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Tejun Heo <tj@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 31/40] sata_rcar: move DPRINTK to VPRINTK
Date:   Tue,  3 Mar 2020 10:38:04 +0100
Message-Id: <20200303093813.18523-32-hare@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200303093813.18523-1-hare@suse.de>
References: <20200303093813.18523-1-hare@suse.de>
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Move the remaining DPRINTK statement in the interrupt handler to
VPRINTK. It'll be converted later with the remaining VPRINTK
calls.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/ata/sata_rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
index 0925a0564cc5..f65741b5ca20 100644
--- a/drivers/ata/sata_rcar.c
+++ b/drivers/ata/sata_rcar.c
@@ -679,7 +679,7 @@ static void sata_rcar_serr_interrupt(struct ata_port *ap)
 	if (!serror)
 		return;
 
-	DPRINTK("SError @host_intr: 0x%x\n", serror);
+	VPRINTK("SError @host_intr: 0x%x\n", serror);
 
 	/* first, analyze and record host port events */
 	ata_ehi_clear_desc(ehi);
-- 
2.16.4

