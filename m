Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21497151EB3
	for <lists+linux-ide@lfdr.de>; Tue,  4 Feb 2020 17:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbgBDQ4Q (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 4 Feb 2020 11:56:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:34820 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727439AbgBDQ4O (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 4 Feb 2020 11:56:14 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 95DAAB21E;
        Tue,  4 Feb 2020 16:56:05 +0000 (UTC)
From:   Hannes Reinecke <hare@suse.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Bartolomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 45/46] libata: remove references to ATA_DEBUG
Date:   Tue,  4 Feb 2020 17:55:46 +0100
Message-Id: <20200204165547.115220-46-hare@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200204165547.115220-1-hare@suse.de>
References: <20200204165547.115220-1-hare@suse.de>
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

All instances are gone.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/libata-core.c | 2 --
 include/linux/libata.h    | 5 -----
 2 files changed, 7 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 0f1682a55b54..9c05177e09c2 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -6034,8 +6034,6 @@ struct ata_port *ata_port_alloc(struct ata_host *host)
 #if defined(ATA_VERBOSE_DEBUG)
 	/* turn on all debugging levels */
 	ap->msg_enable = 0x00FF;
-#elif defined(ATA_DEBUG)
-	ap->msg_enable = ATA_MSG_DRV | ATA_MSG_WARN | ATA_MSG_ERR;
 #else
 	ap->msg_enable = ATA_MSG_DRV | ATA_MSG_ERR | ATA_MSG_WARN;
 #endif
diff --git a/include/linux/libata.h b/include/linux/libata.h
index 1012aed05187..06d6a3e18e18 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -38,22 +38,17 @@
  * compile-time options: to be removed as soon as all the drivers are
  * converted to the new debugging mechanism
  */
-#undef ATA_DEBUG		/* debugging output */
 #undef ATA_VERBOSE_DEBUG	/* yet more debugging output */
 #undef ATA_IRQ_TRAP		/* define to ack screaming irqs */
 #undef ATA_NDEBUG		/* define to disable quick runtime checks */
 
 
 /* note: prints function name for you */
-#ifdef ATA_DEBUG
 #ifdef ATA_VERBOSE_DEBUG
 #define VPRINTK(fmt, args...) printk(KERN_ERR "%s: " fmt, __func__, ## args)
 #else
 #define VPRINTK(fmt, args...)
 #endif	/* ATA_VERBOSE_DEBUG */
-#else
-#define VPRINTK(fmt, args...)
-#endif	/* ATA_DEBUG */
 
 #define ata_print_version_once(dev, version)			\
 ({								\
-- 
2.16.4

