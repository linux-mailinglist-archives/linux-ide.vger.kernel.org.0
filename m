Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4DB151EC3
	for <lists+linux-ide@lfdr.de>; Tue,  4 Feb 2020 17:56:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbgBDQ4V (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 4 Feb 2020 11:56:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:34988 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727441AbgBDQ4O (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 4 Feb 2020 11:56:14 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 94D51B21B;
        Tue,  4 Feb 2020 16:56:05 +0000 (UTC)
From:   Hannes Reinecke <hare@suse.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Bartolomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.com>,
        Hannes Reinecke <hare@suse.de>
Subject: [PATCH 44/46] libata: kill ATA_MSG_CTL
Date:   Tue,  4 Feb 2020 17:55:45 +0100
Message-Id: <20200204165547.115220-45-hare@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200204165547.115220-1-hare@suse.de>
References: <20200204165547.115220-1-hare@suse.de>
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Hannes Reinecke <hare@suse.com>

All instances had been converted to ata_XXX_dbg() anyway, so
the conditional is pointless anyway.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/libata-core.c | 5 ++---
 include/linux/libata.h    | 2 --
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index a81e7006e73f..0f1682a55b54 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -1858,8 +1858,7 @@ int ata_dev_read_id(struct ata_device *dev, unsigned int *p_class,
 	int may_fallback = 1, tried_spinup = 0;
 	int rc;
 
-	if (ata_msg_ctl(ap))
-		ata_dev_dbg(dev, "%s: ENTER\n", __func__);
+	ata_dev_dbg(dev, "ENTER\n");
 
 retry:
 	ata_tf_init(dev, &tf);
@@ -6036,7 +6035,7 @@ struct ata_port *ata_port_alloc(struct ata_host *host)
 	/* turn on all debugging levels */
 	ap->msg_enable = 0x00FF;
 #elif defined(ATA_DEBUG)
-	ap->msg_enable = ATA_MSG_DRV | ATA_MSG_CTL | ATA_MSG_WARN | ATA_MSG_ERR;
+	ap->msg_enable = ATA_MSG_DRV | ATA_MSG_WARN | ATA_MSG_ERR;
 #else
 	ap->msg_enable = ATA_MSG_DRV | ATA_MSG_ERR | ATA_MSG_WARN;
 #endif
diff --git a/include/linux/libata.h b/include/linux/libata.h
index cab7aa3f0ed0..1012aed05187 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -73,7 +73,6 @@ enum {
 	ATA_MSG_PROBE	= 0x0004,
 	ATA_MSG_WARN	= 0x0008,
 	ATA_MSG_MALLOC	= 0x0010,
-	ATA_MSG_CTL	= 0x0020,
 	ATA_MSG_INTR	= 0x0040,
 	ATA_MSG_ERR	= 0x0080,
 };
@@ -82,7 +81,6 @@ enum {
 #define ata_msg_probe(p)  ((p)->msg_enable & ATA_MSG_PROBE)
 #define ata_msg_warn(p)   ((p)->msg_enable & ATA_MSG_WARN)
 #define ata_msg_malloc(p) ((p)->msg_enable & ATA_MSG_MALLOC)
-#define ata_msg_ctl(p)    ((p)->msg_enable & ATA_MSG_CTL)
 #define ata_msg_intr(p)   ((p)->msg_enable & ATA_MSG_INTR)
 #define ata_msg_err(p)    ((p)->msg_enable & ATA_MSG_ERR)
 
-- 
2.16.4

