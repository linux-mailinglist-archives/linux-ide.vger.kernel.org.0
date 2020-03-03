Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 398701772AF
	for <lists+linux-ide@lfdr.de>; Tue,  3 Mar 2020 10:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbgCCJjv (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 3 Mar 2020 04:39:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:47728 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728271AbgCCJjs (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 3 Mar 2020 04:39:48 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 20B2CB246;
        Tue,  3 Mar 2020 09:39:42 +0000 (UTC)
From:   Hannes Reinecke <hare@suse.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Tejun Heo <tj@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 32/40] sata_qstor: move DPRINTK to VPRINTK
Date:   Tue,  3 Mar 2020 10:38:05 +0100
Message-Id: <20200303093813.18523-33-hare@suse.de>
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
 drivers/ata/sata_qstor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/sata_qstor.c b/drivers/ata/sata_qstor.c
index ef00ab644afb..579a8a8f12ba 100644
--- a/drivers/ata/sata_qstor.c
+++ b/drivers/ata/sata_qstor.c
@@ -374,7 +374,7 @@ static inline unsigned int qs_intr_pkt(struct ata_host *host)
 			struct qs_port_priv *pp = ap->private_data;
 			struct ata_queued_cmd *qc;
 
-			DPRINTK("SFF=%08x%08x: sCHAN=%u sHST=%d sDST=%02x\n",
+			VPRINTK("SFF=%08x%08x: sCHAN=%u sHST=%d sDST=%02x\n",
 					sff1, sff0, port_no, sHST, sDST);
 			handled = 1;
 			if (!pp || pp->state != qs_state_pkt)
-- 
2.16.4

