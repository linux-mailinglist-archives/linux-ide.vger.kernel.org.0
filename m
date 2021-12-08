Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 406B946D844
	for <lists+linux-ide@lfdr.de>; Wed,  8 Dec 2021 17:33:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236980AbhLHQgg (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 8 Dec 2021 11:36:36 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:40592 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236986AbhLHQgd (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 8 Dec 2021 11:36:33 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 343AA218A8;
        Wed,  8 Dec 2021 16:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1638981180; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=guj2UR5vKirIlF9+Qz6dEoinMFy402H0ko1UHj2ZONA=;
        b=E5ulomoeSy73sjse6+HRSigsGg9OM3hPl7Yg+zAIH7pQvR8BB2W9UeBdL7Fc5ESDdoxMgg
        /x7vza8hAkRDu0nT2ctmLPg3A9U7xW4NDqif8/doiC+cUI6CU+UiZQO8xE5bJ8h4onHrgH
        AIO2AOHGov0FZBOEb1SaqqXdTushpxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1638981180;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=guj2UR5vKirIlF9+Qz6dEoinMFy402H0ko1UHj2ZONA=;
        b=1vAQ1cLDKmN0hHPrWNh/kBOUtilw9ceJVbF9KlzdNyCA7RvtVkxvRmq3CGmSv/U9zzWSuu
        kPCUxd80AIcIVHCw==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
        by relay2.suse.de (Postfix) with ESMTP id 2A449A3B97;
        Wed,  8 Dec 2021 16:32:59 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
        id DE0175191F63; Wed,  8 Dec 2021 17:32:59 +0100 (CET)
From:   Hannes Reinecke <hare@suse.de>
To:     Damien LeMoal <damien.lemoal@wdc.com>
Cc:     linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 03/73] libata: move ata_dump_id() to dynamic debugging
Date:   Wed,  8 Dec 2021 17:31:45 +0100
Message-Id: <20211208163255.114660-4-hare@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211208163255.114660-1-hare@suse.de>
References: <20211208163255.114660-1-hare@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Use ata_dev_dbg() to print out the information in ata_dump_id()
and remove the ata_msg_probe() conditional.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/ata/libata-core.c | 38 ++++++++++----------------------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 6cac413caf83..6b8c6be65458 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -1387,6 +1387,7 @@ static int ata_hpa_resize(struct ata_device *dev)
 
 /**
  *	ata_dump_id - IDENTIFY DEVICE info debugging output
+ *	@dev: device from which the information is fetched
  *	@id: IDENTIFY DEVICE page to dump
  *
  *	Dump selected 16-bit words from the given IDENTIFY DEVICE
@@ -1396,32 +1397,14 @@ static int ata_hpa_resize(struct ata_device *dev)
  *	caller.
  */
 
-static inline void ata_dump_id(const u16 *id)
-{
-	DPRINTK("49==0x%04x  "
-		"53==0x%04x  "
-		"63==0x%04x  "
-		"64==0x%04x  "
-		"75==0x%04x  \n",
-		id[49],
-		id[53],
-		id[63],
-		id[64],
-		id[75]);
-	DPRINTK("80==0x%04x  "
-		"81==0x%04x  "
-		"82==0x%04x  "
-		"83==0x%04x  "
-		"84==0x%04x  \n",
-		id[80],
-		id[81],
-		id[82],
-		id[83],
-		id[84]);
-	DPRINTK("88==0x%04x  "
-		"93==0x%04x\n",
-		id[88],
-		id[93]);
+static inline void ata_dump_id(struct ata_device *dev, const u16 *id)
+{
+	ata_dev_dbg(dev,
+		"49==0x%04x  53==0x%04x  63==0x%04x  64==0x%04x  75==0x%04x\n"
+		"80==0x%04x  81==0x%04x  82==0x%04x  83==0x%04x  84==0x%04x\n"
+		"88==0x%04x  93==0x%04x\n",
+		id[49], id[53], id[63], id[64], id[75], id[80],
+		id[81], id[82], id[83], id[84], id[88], id[93]);
 }
 
 /**
@@ -2673,8 +2656,7 @@ int ata_dev_configure(struct ata_device *dev)
 	/* find max transfer mode; for printk only */
 	xfer_mask = ata_id_xfermask(id);
 
-	if (ata_msg_probe(ap))
-		ata_dump_id(id);
+	ata_dump_id(dev, id);
 
 	/* SCSI only uses 4-char revisions, dump full 8 chars from ATA */
 	ata_id_c_string(dev->id, fwrevbuf, ATA_ID_FW_REV,
-- 
2.29.2

