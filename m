Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86EFC151EB4
	for <lists+linux-ide@lfdr.de>; Tue,  4 Feb 2020 17:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbgBDQ4Q (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 4 Feb 2020 11:56:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:34824 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727407AbgBDQ4K (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 4 Feb 2020 11:56:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 29788B1CD;
        Tue,  4 Feb 2020 16:56:05 +0000 (UTC)
From:   Hannes Reinecke <hare@suse.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Bartolomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 20/46] sata_sil24: drop DPRINTK() calls in reset
Date:   Tue,  4 Feb 2020 17:55:21 +0100
Message-Id: <20200204165547.115220-21-hare@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200204165547.115220-1-hare@suse.de>
References: <20200204165547.115220-1-hare@suse.de>
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Reset is now logged with tracepoints, so the DPRINTK() calls can
be dropped.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/sata_sil24.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/ata/sata_sil24.c b/drivers/ata/sata_sil24.c
index 2373cf5d8d14..48e2b3ec2afd 100644
--- a/drivers/ata/sata_sil24.c
+++ b/drivers/ata/sata_sil24.c
@@ -653,8 +653,6 @@ static int sil24_softreset(struct ata_link *link, unsigned int *class,
 	const char *reason;
 	int rc;
 
-	DPRINTK("ENTER\n");
-
 	/* put the port into known state */
 	if (sil24_init_port(ap)) {
 		reason = "port not ready";
@@ -679,7 +677,6 @@ static int sil24_softreset(struct ata_link *link, unsigned int *class,
 	sil24_read_tf(ap, 0, &tf);
 	*class = ata_port_classify(ap, &tf);
 
-	DPRINTK("EXIT, class=%u\n", *class);
 	return 0;
 
  err:
-- 
2.16.4

