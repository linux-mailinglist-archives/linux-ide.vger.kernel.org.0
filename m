Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C536E47BAEC
	for <lists+linux-ide@lfdr.de>; Tue, 21 Dec 2021 08:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234899AbhLUHXE (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 21 Dec 2021 02:23:04 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:55962 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232628AbhLUHWu (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 21 Dec 2021 02:22:50 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 60B431F3C9;
        Tue, 21 Dec 2021 07:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1640071362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pzNQoMpMnThk+4+XrWAXw6owNte8YWfqfNXCaIOfUeQ=;
        b=F05GxciPc6YNBAmxPY6dym2h0vROr6xLfVfZkkrnNEhP/N5hdzZDUbJchZaMUbrxt/Fih+
        YD9MncIUp7Gfe/oM08lNPIkK7Y0JbIy5V/9Ulcx+C9q3JkY1KsKJ2bOWd7IUuUg6MPITiq
        W3GBsJjHv6pcDJgmk8aAjGsvrCCvPbA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1640071362;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pzNQoMpMnThk+4+XrWAXw6owNte8YWfqfNXCaIOfUeQ=;
        b=QbC3OF8ZEXRDsuM0kX3Id7rP3FHVH90Ww+/h2M1lcOM+C/K6Y4VLwZPp/pL5aa9MBTMNmp
        cZ3/o6036bUHNJAg==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
        by relay2.suse.de (Postfix) with ESMTP id 5BCE3A3BAB;
        Tue, 21 Dec 2021 07:22:42 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
        id 59F1D51923C4; Tue, 21 Dec 2021 08:22:42 +0100 (CET)
From:   Hannes Reinecke <hare@suse.de>
To:     Damien LeMoal <damien.lemoal@wdc.com>
Cc:     linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 41/68] libata: drop ata_msg_warn()
Date:   Tue, 21 Dec 2021 08:21:04 +0100
Message-Id: <20211221072131.46673-42-hare@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211221072131.46673-1-hare@suse.de>
References: <20211221072131.46673-1-hare@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The WARN level was always enabled, so drop ata_msg_warn().

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/libata-core.c | 19 ++++++++-----------
 include/linux/libata.h    |  2 --
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 207d19822ef9..e2fdaf83655a 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -1571,9 +1571,8 @@ unsigned ata_exec_internal_sg(struct ata_device *dev,
 			else
 				ata_qc_complete(qc);
 
-			if (ata_msg_warn(ap))
-				ata_dev_warn(dev, "qc timeout (cmd 0x%x)\n",
-					     command);
+			ata_dev_warn(dev, "qc timeout (cmd 0x%x)\n",
+				     command);
 		}
 
 		spin_unlock_irqrestore(ap->lock, flags);
@@ -1932,9 +1931,8 @@ int ata_dev_read_id(struct ata_device *dev, unsigned int *p_class,
 	return 0;
 
  err_out:
-	if (ata_msg_warn(ap))
-		ata_dev_warn(dev, "failed to IDENTIFY (%s, err_mask=0x%x)\n",
-			     reason, err_mask);
+	ata_dev_warn(dev, "failed to IDENTIFY (%s, err_mask=0x%x)\n",
+		     reason, err_mask);
 	return rc;
 }
 
@@ -2683,8 +2681,7 @@ int ata_dev_configure(struct ata_device *dev)
 
 		rc = atapi_cdb_len(id);
 		if ((rc < 12) || (rc > ATAPI_CDB_LEN)) {
-			if (ata_msg_warn(ap))
-				ata_dev_warn(dev, "unsupported CDB len\n");
+			ata_dev_warn(dev, "unsupported CDB len %d\n", rc);
 			rc = -EINVAL;
 			goto err_out_nosup;
 		}
@@ -5342,11 +5339,11 @@ struct ata_port *ata_port_alloc(struct ata_host *host)
 
 #if defined(ATA_VERBOSE_DEBUG)
 	/* turn on all debugging levels */
-	ap->msg_enable = 0x000F;
+	ap->msg_enable = 0x0007;
 #elif defined(ATA_DEBUG)
-	ap->msg_enable = ATA_MSG_DRV | ATA_MSG_INFO | ATA_MSG_WARN;
+	ap->msg_enable = ATA_MSG_DRV | ATA_MSG_INFO;
 #else
-	ap->msg_enable = ATA_MSG_DRV | ATA_MSG_WARN;
+	ap->msg_enable = ATA_MSG_DRV;
 #endif
 
 	mutex_init(&ap->scsi_scan_mutex);
diff --git a/include/linux/libata.h b/include/linux/libata.h
index 8bde38e3debd..5a4a23d38c08 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -75,13 +75,11 @@ enum {
 	ATA_MSG_DRV	= 0x0001,
 	ATA_MSG_INFO	= 0x0002,
 	ATA_MSG_PROBE	= 0x0004,
-	ATA_MSG_WARN	= 0x0008,
 };
 
 #define ata_msg_drv(p)    ((p)->msg_enable & ATA_MSG_DRV)
 #define ata_msg_info(p)   ((p)->msg_enable & ATA_MSG_INFO)
 #define ata_msg_probe(p)  ((p)->msg_enable & ATA_MSG_PROBE)
-#define ata_msg_warn(p)   ((p)->msg_enable & ATA_MSG_WARN)
 
 static inline u32 ata_msg_init(int dval, int default_msg_enable_bits)
 {
-- 
2.29.2

