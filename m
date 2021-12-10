Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A3A46FB7C
	for <lists+linux-ide@lfdr.de>; Fri, 10 Dec 2021 08:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237542AbhLJHd1 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 10 Dec 2021 02:33:27 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:34976 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237609AbhLJHdG (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 10 Dec 2021 02:33:06 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 116F1212B6;
        Fri, 10 Dec 2021 07:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1639121359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=V0+5y7qIu8Fzzyh/g7WRf+Thw1t7FQj6cv0nWXxjoJ4=;
        b=C6Me5a4bxNdj82XLNWW4UUsM19Fgh/gl2xA9xHO2u43nSU9M+dpAygakfJGoEOJlOo9mJ4
        637gWzA5cwBIINmMMBABOJxRB7uHaG3gv3ts2FT92zK8UE+JG5XrZlpwkOEs7SUN2hbFbl
        8sdZl3ClEOoDjA069VkQzwfnUcWqkVc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1639121359;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=V0+5y7qIu8Fzzyh/g7WRf+Thw1t7FQj6cv0nWXxjoJ4=;
        b=jmYfomFR3mV4VSctzS3aXpektUYO28cusI/xhiUh9PAZdzWseNAXxOuT0EZk58T1MgdPdm
        tk0+YIkZlbiJggBQ==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
        by relay2.suse.de (Postfix) with ESMTP id 0A3A8A3BC0;
        Fri, 10 Dec 2021 07:29:19 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
        id 076D05192077; Fri, 10 Dec 2021 08:29:19 +0100 (CET)
From:   Hannes Reinecke <hare@suse.de>
To:     Damien LeMoal <damien.lemoal@wdc.com>
Cc:     linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 43/68] libata: drop ata_msg_info()
Date:   Fri, 10 Dec 2021 08:28:40 +0100
Message-Id: <20211210072905.15666-44-hare@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211210072905.15666-1-hare@suse.de>
References: <20211210072905.15666-1-hare@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Convert the sole caller to ata_dev_deb() and remove the definition.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/libata-core.c | 10 +++-------
 include/linux/libata.h    |  2 --
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index c7faf71163e9..874853429d9c 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -2525,8 +2525,8 @@ int ata_dev_configure(struct ata_device *dev)
 	char modelbuf[ATA_ID_PROD_LEN+1];
 	int rc;
 
-	if (!ata_dev_enabled(dev) && ata_msg_info(ap)) {
-		ata_dev_info(dev, "%s: ENTER/EXIT -- nodev\n", __func__);
+	if (!ata_dev_enabled(dev)) {
+		ata_dev_dbg(dev, "no device\n");
 		return 0;
 	}
 
@@ -5326,11 +5326,7 @@ struct ata_port *ata_port_alloc(struct ata_host *host)
 
 #if defined(ATA_VERBOSE_DEBUG)
 	/* turn on all debugging levels */
-	ap->msg_enable = 0x0003;
-#elif defined(ATA_DEBUG)
-	ap->msg_enable = ATA_MSG_DRV | ATA_MSG_INFO;
-#else
-	ap->msg_enable = ATA_MSG_DRV;
+	ap->msg_enable = 0x0001;
 #endif
 
 	mutex_init(&ap->scsi_scan_mutex);
diff --git a/include/linux/libata.h b/include/linux/libata.h
index bce3b50112c0..9895414492cb 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -73,11 +73,9 @@
 
 enum {
 	ATA_MSG_DRV	= 0x0001,
-	ATA_MSG_INFO	= 0x0002,
 };
 
 #define ata_msg_drv(p)    ((p)->msg_enable & ATA_MSG_DRV)
-#define ata_msg_info(p)   ((p)->msg_enable & ATA_MSG_INFO)
 
 static inline u32 ata_msg_init(int dval, int default_msg_enable_bits)
 {
-- 
2.29.2

