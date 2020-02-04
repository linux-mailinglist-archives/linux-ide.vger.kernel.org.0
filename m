Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15902151EBC
	for <lists+linux-ide@lfdr.de>; Tue,  4 Feb 2020 17:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbgBDQ4U (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 4 Feb 2020 11:56:20 -0500
Received: from mx2.suse.de ([195.135.220.15]:34866 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727434AbgBDQ4O (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 4 Feb 2020 11:56:14 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 872B3B20A;
        Tue,  4 Feb 2020 16:56:05 +0000 (UTC)
From:   Hannes Reinecke <hare@suse.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Bartolomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.com>,
        Hannes Reinecke <hare@suse.de>
Subject: [PATCH 42/46] libata: remove DPRINTK() macro
Date:   Tue,  4 Feb 2020 17:55:43 +0100
Message-Id: <20200204165547.115220-43-hare@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200204165547.115220-1-hare@suse.de>
References: <20200204165547.115220-1-hare@suse.de>
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Hannes Reinecke <hare@suse.com>

No users left, remove it.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 include/linux/libata.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/libata.h b/include/linux/libata.h
index c7ffe6fb39f1..e2578d87d931 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -46,14 +46,12 @@
 
 /* note: prints function name for you */
 #ifdef ATA_DEBUG
-#define DPRINTK(fmt, args...) printk(KERN_ERR "%s: " fmt, __func__, ## args)
 #ifdef ATA_VERBOSE_DEBUG
 #define VPRINTK(fmt, args...) printk(KERN_ERR "%s: " fmt, __func__, ## args)
 #else
 #define VPRINTK(fmt, args...)
 #endif	/* ATA_VERBOSE_DEBUG */
 #else
-#define DPRINTK(fmt, args...)
 #define VPRINTK(fmt, args...)
 #endif	/* ATA_DEBUG */
 
-- 
2.16.4

