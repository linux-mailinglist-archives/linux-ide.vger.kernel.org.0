Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66EF6151EA2
	for <lists+linux-ide@lfdr.de>; Tue,  4 Feb 2020 17:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbgBDQ4K (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 4 Feb 2020 11:56:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:34824 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727387AbgBDQ4J (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 4 Feb 2020 11:56:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 0C61AB1B9;
        Tue,  4 Feb 2020 16:56:05 +0000 (UTC)
From:   Hannes Reinecke <hare@suse.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Bartolomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 16/46] ahci_qorig: drop DPRINTK() calls in reset
Date:   Tue,  4 Feb 2020 17:55:17 +0100
Message-Id: <20200204165547.115220-17-hare@suse.de>
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
 drivers/ata/ahci_qoriq.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/ata/ahci_qoriq.c b/drivers/ata/ahci_qoriq.c
index a330307d3201..711cf94c3d08 100644
--- a/drivers/ata/ahci_qoriq.c
+++ b/drivers/ata/ahci_qoriq.c
@@ -96,8 +96,6 @@ static int ahci_qoriq_hardreset(struct ata_link *link, unsigned int *class,
 	int rc;
 	bool ls1021a_workaround = (qoriq_priv->type == AHCI_LS1021A);
 
-	DPRINTK("ENTER\n");
-
 	hpriv->stop_engine(ap);
 
 	/*
@@ -139,8 +137,6 @@ static int ahci_qoriq_hardreset(struct ata_link *link, unsigned int *class,
 
 	if (online)
 		*class = ahci_dev_classify(ap);
-
-	DPRINTK("EXIT, rc=%d, class=%u\n", rc, *class);
 	return rc;
 }
 
-- 
2.16.4

