Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6945151EA3
	for <lists+linux-ide@lfdr.de>; Tue,  4 Feb 2020 17:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbgBDQ4G (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 4 Feb 2020 11:56:06 -0500
Received: from mx2.suse.de ([195.135.220.15]:34590 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727376AbgBDQ4G (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 4 Feb 2020 11:56:06 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 8485FAF10;
        Tue,  4 Feb 2020 16:56:04 +0000 (UTC)
From:   Hannes Reinecke <hare@suse.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Bartolomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>,
        Hannes Reinecke <hare@suse.com>
Subject: [PATCH 01/46] libata: drop BPRINTK()
Date:   Tue,  4 Feb 2020 17:55:02 +0100
Message-Id: <20200204165547.115220-2-hare@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200204165547.115220-1-hare@suse.de>
References: <20200204165547.115220-1-hare@suse.de>
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

No users, drop it.

Signed-off-by: Hannes Reinecke <hare@suse.com>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 include/linux/libata.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/libata.h b/include/linux/libata.h
index a36bdcb8d9e9..bd78646f88a0 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -57,8 +57,6 @@
 #define VPRINTK(fmt, args...)
 #endif	/* ATA_DEBUG */
 
-#define BPRINTK(fmt, args...) if (ap->flags & ATA_FLAG_DEBUGMSG) printk(KERN_ERR "%s: " fmt, __func__, ## args)
-
 #define ata_print_version_once(dev, version)			\
 ({								\
 	static bool __print_once;				\
-- 
2.16.4

