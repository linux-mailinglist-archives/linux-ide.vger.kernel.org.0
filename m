Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC6EF2EA247
	for <lists+linux-ide@lfdr.de>; Tue,  5 Jan 2021 02:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbhAEBBL (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 4 Jan 2021 20:01:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:39206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728350AbhAEBBK (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Mon, 4 Jan 2021 20:01:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5DB522B2C;
        Tue,  5 Jan 2021 01:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609808417;
        bh=LugGHd7ltLq+WkkwWzw7146Hilpdqkmwi/xui8yO2Co=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LyP6tsI26EVMtzOiJRm0y3OrdB/+mBoB3eoqnMMXwrBrTM78eHCYzSd9Ck0vavExK
         ci17VF4k6ocCGPNYlThhFUcO66v0inDRgC67k1f4hxovLXdK4RzfM+b4b7WlgUXbvL
         FnJJS6EQLRSnRTRTXshrMLiO2qNLJ1YiL23ztqxErYzYbg6JCm2fDVaBJybhDjOpOE
         0CkO4MW9nY6VbUSTdk/sZqAMGkvwoR5Yl2E08Wtp+FQUodIAk6xw0QKiOEwkm8qm2b
         ichOY2Y8oYVD5bcSdBV+AdaQ+qkKeOgo3AizGoCSsf+tBHlYRjWB7MTG1krWo4rSHV
         NK96Ki1swO+6g==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Bart Van Assche <bvanassche@acm.org>,
        "David S . Miller" <davem@davemloft.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Can Guo <cang@codeaurora.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Ming Lei <ming.lei@redhat.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>,
        Jens Axboe <axboe@kernel.dk>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Sasha Levin <sashal@kernel.org>, linux-ide@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 3/6] scsi: ide: Do not set the RQF_PREEMPT flag for sense requests
Date:   Mon,  4 Jan 2021 20:00:09 -0500
Message-Id: <20210105010012.3954626-3-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105010012.3954626-1-sashal@kernel.org>
References: <20210105010012.3954626-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Bart Van Assche <bvanassche@acm.org>

[ Upstream commit 96d86e6a80a3ab9aff81d12f9f1f2a0da2917d38 ]

RQF_PREEMPT is used for two different purposes in the legacy IDE code:

 1. To mark power management requests.

 2. To mark requests that should preempt another request. An (old)
    explanation of that feature is as follows: "The IDE driver in the Linux
    kernel normally uses a series of busywait delays during its
    initialization. When the driver executes these busywaits, the kernel
    does nothing for the duration of the wait. The time spent in these
    waits could be used for other initialization activities, if they could
    be run concurrently with these waits.

    More specifically, busywait-style delays such as udelay() in module
    init functions inhibit kernel preemption because the Big Kernel Lock is
    held, while yielding APIs such as schedule_timeout() allow
    preemption. This is true because the kernel handles the BKL specially
    and releases and reacquires it across reschedules allowed by the
    current thread.

    This IDE-preempt specification requires that the driver eliminate these
    busywaits and replace them with a mechanism that allows other work to
    proceed while the IDE driver is initializing."

Since I haven't found an implementation of (2), do not set the PREEMPT flag
for sense requests. This patch causes sense requests to be postponed while
a drive is suspended instead of being submitted to ide_queue_rq().

If it would ever be necessary to restore the IDE PREEMPT functionality,
that can be done by introducing a new flag in struct ide_request.

Link: https://lore.kernel.org/r/20201209052951.16136-4-bvanassche@acm.org
Cc: David S. Miller <davem@davemloft.net>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Can Guo <cang@codeaurora.org>
Cc: Stanley Chu <stanley.chu@mediatek.com>
Cc: Ming Lei <ming.lei@redhat.com>
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ide/ide-atapi.c | 1 -
 drivers/ide/ide-io.c    | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/drivers/ide/ide-atapi.c b/drivers/ide/ide-atapi.c
index 0e6bc631a1caf..215558c947def 100644
--- a/drivers/ide/ide-atapi.c
+++ b/drivers/ide/ide-atapi.c
@@ -213,7 +213,6 @@ void ide_prep_sense(ide_drive_t *drive, struct request *rq)
 	sense_rq->rq_disk = rq->rq_disk;
 	sense_rq->cmd_flags = REQ_OP_DRV_IN;
 	ide_req(sense_rq)->type = ATA_PRIV_SENSE;
-	sense_rq->rq_flags |= RQF_PREEMPT;
 
 	req->cmd[0] = GPCMD_REQUEST_SENSE;
 	req->cmd[4] = cmd_len;
diff --git a/drivers/ide/ide-io.c b/drivers/ide/ide-io.c
index 3a234701d92c4..7f34dc49c9b5f 100644
--- a/drivers/ide/ide-io.c
+++ b/drivers/ide/ide-io.c
@@ -531,11 +531,6 @@ void do_ide_request(struct request_queue *q)
 		 * above to return us whatever is in the queue. Since we call
 		 * ide_do_request() ourselves, we end up taking requests while
 		 * the queue is blocked...
-		 * 
-		 * We let requests forced at head of queue with ide-preempt
-		 * though. I hope that doesn't happen too much, hopefully not
-		 * unless the subdriver triggers such a thing in its own PM
-		 * state machine.
 		 */
 		if ((drive->dev_flags & IDE_DFLAG_BLOCKED) &&
 		    ata_pm_request(rq) == 0 &&
-- 
2.27.0

