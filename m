Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEB9146D86D
	for <lists+linux-ide@lfdr.de>; Wed,  8 Dec 2021 17:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhLHQhC (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 8 Dec 2021 11:37:02 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:37754 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237044AbhLHQgo (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 8 Dec 2021 11:36:44 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id E861B1FE23;
        Wed,  8 Dec 2021 16:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1638981181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+p+o+fQWekWOpE3MHtc5A7R+7swokSvXQwCwJd3a5JA=;
        b=pqfxMuXP3ig2bmfsjLqAaEpPmD9YoTjt6cOIA6QS5+veISmP2q5yLjJpyElbpzTO4m3YnS
        PAqgTxWoCCn0WNavn3MxqccvLCVtX4sQzX8/uqO634OLdZQ1JdiZ92gKAkSXI4TuhPqCZh
        9bXynZst2E2sCKGjTFl8z2xPd7C98c0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1638981181;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+p+o+fQWekWOpE3MHtc5A7R+7swokSvXQwCwJd3a5JA=;
        b=7eLXNzp9rBZs66nbuhXLwJQQhBI1oeUbj8/5SkkYQfl2cQVZNih9DfcelNcmqyh2Nopoo7
        zeGs62DDOPZmD1BQ==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
        by relay2.suse.de (Postfix) with ESMTP id E5B72A3BC2;
        Wed,  8 Dec 2021 16:33:00 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
        id E2C475191FB9; Wed,  8 Dec 2021 17:33:00 +0100 (CET)
From:   Hannes Reinecke <hare@suse.de>
To:     Damien LeMoal <damien.lemoal@wdc.com>
Cc:     linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 46/73] libata: drop ata_msg_ctl()
Date:   Wed,  8 Dec 2021 17:32:28 +0100
Message-Id: <20211208163255.114660-47-hare@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211208163255.114660-1-hare@suse.de>
References: <20211208163255.114660-1-hare@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The one caller have been converted to dynamic debugging.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/libata-core.c | 7 ++-----
 include/linux/libata.h    | 2 --
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index ff7e82be0a94..691dfa1f01c5 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -1809,9 +1809,6 @@ int ata_dev_read_id(struct ata_device *dev, unsigned int *p_class,
 	int may_fallback = 1, tried_spinup = 0;
 	int rc;
 
-	if (ata_msg_ctl(ap))
-		ata_dev_dbg(dev, "%s: ENTER\n", __func__);
-
 retry:
 	ata_tf_init(dev, &tf);
 
@@ -5384,9 +5381,9 @@ struct ata_port *ata_port_alloc(struct ata_host *host)
 
 #if defined(ATA_VERBOSE_DEBUG)
 	/* turn on all debugging levels */
-	ap->msg_enable = 0x003F;
+	ap->msg_enable = 0x001F;
 #elif defined(ATA_DEBUG)
-	ap->msg_enable = ATA_MSG_DRV | ATA_MSG_INFO | ATA_MSG_CTL | ATA_MSG_WARN;
+	ap->msg_enable = ATA_MSG_DRV | ATA_MSG_INFO | ATA_MSG_WARN;
 #else
 	ap->msg_enable = ATA_MSG_DRV | ATA_MSG_WARN;
 #endif
diff --git a/include/linux/libata.h b/include/linux/libata.h
index a3f35735fd27..fc7f64646e5b 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -77,7 +77,6 @@ enum {
 	ATA_MSG_PROBE	= 0x0004,
 	ATA_MSG_WARN	= 0x0008,
 	ATA_MSG_MALLOC	= 0x0010,
-	ATA_MSG_CTL	= 0x0020,
 };
 
 #define ata_msg_drv(p)    ((p)->msg_enable & ATA_MSG_DRV)
@@ -85,7 +84,6 @@ enum {
 #define ata_msg_probe(p)  ((p)->msg_enable & ATA_MSG_PROBE)
 #define ata_msg_warn(p)   ((p)->msg_enable & ATA_MSG_WARN)
 #define ata_msg_malloc(p) ((p)->msg_enable & ATA_MSG_MALLOC)
-#define ata_msg_ctl(p)    ((p)->msg_enable & ATA_MSG_CTL)
 
 static inline u32 ata_msg_init(int dval, int default_msg_enable_bits)
 {
-- 
2.29.2

