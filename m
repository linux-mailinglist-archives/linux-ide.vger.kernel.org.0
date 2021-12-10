Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B877646FB72
	for <lists+linux-ide@lfdr.de>; Fri, 10 Dec 2021 08:29:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237668AbhLJHdT (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 10 Dec 2021 02:33:19 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:35092 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237592AbhLJHdA (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 10 Dec 2021 02:33:00 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id EF30D2113A;
        Fri, 10 Dec 2021 07:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1639121358; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cJOvM5cGCIp+rdub/IzM/SYg0TtdZveoHHjlOgQhUQ0=;
        b=V1ire5Wtx+oq/kCwUzGTF7geFEIwhqNo5x5Lxbb/r2tMRbct387h+PtWOM1x7WvEaT3EYv
        gLSTrQt6jks6AHwS1KP2slxmFeKs0HWaROL2ZWoerelnd19gjxvlY+8xg5k7+nFblfd3jW
        3pCaVl9wi8vr/gO8vpHnhnUWZ22d01Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1639121358;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cJOvM5cGCIp+rdub/IzM/SYg0TtdZveoHHjlOgQhUQ0=;
        b=GN8SjUEPezZT2bbhr5jEJY8rP6Hzmpz0Or+CzfeUGJqC7Eb++pNTnsDP9LLIEKwOFuPYP7
        LDkzv7Ukxb6S53Dg==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
        by relay2.suse.de (Postfix) with ESMTP id EB91FA3BBA;
        Fri, 10 Dec 2021 07:29:18 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
        id E8EA2519206B; Fri, 10 Dec 2021 08:29:18 +0100 (CET)
From:   Hannes Reinecke <hare@suse.de>
To:     Damien LeMoal <damien.lemoal@wdc.com>
Cc:     linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 37/68] sata_sx4: add module parameter 'dimm_test'
Date:   Fri, 10 Dec 2021 08:28:34 +0100
Message-Id: <20211210072905.15666-38-hare@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211210072905.15666-1-hare@suse.de>
References: <20211210072905.15666-1-hare@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Add module parameter 'dimm_test' to enable DIMM testing during startup.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/sata_sx4.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/ata/sata_sx4.c b/drivers/ata/sata_sx4.c
index 85e72c81a1de..5d7913644dfc 100644
--- a/drivers/ata/sata_sx4.c
+++ b/drivers/ata/sata_sx4.c
@@ -78,6 +78,9 @@
 #define DRV_NAME	"sata_sx4"
 #define DRV_VERSION	"0.12"
 
+static int dimm_test;
+module_param(dimm_test, int, 0644);
+MODULE_PARM_DESC(dimm_test, "Enable DIMM test during startup (1 = enabled)");
 
 enum {
 	PDC_MMIO_BAR		= 3,
@@ -211,10 +214,8 @@ static unsigned int pdc20621_i2c_read(struct ata_host *host,
 				      u32 device, u32 subaddr, u32 *pdata);
 static int pdc20621_prog_dimm0(struct ata_host *host);
 static unsigned int pdc20621_prog_dimm_global(struct ata_host *host);
-#ifdef ATA_VERBOSE_DEBUG
 static void pdc20621_get_from_dimm(struct ata_host *host,
 				   void *psource, u32 offset, u32 size);
-#endif
 static void pdc20621_put_to_dimm(struct ata_host *host,
 				 void *psource, u32 offset, u32 size);
 static void pdc20621_irq_clear(struct ata_port *ap);
@@ -575,7 +576,6 @@ static void pdc20621_pop_hdma(struct ata_queued_cmd *qc)
 	pp->hdma_cons++;
 }
 
-#ifdef ATA_VERBOSE_DEBUG
 static void pdc20621_dump_hdma(struct ata_queued_cmd *qc)
 {
 	struct ata_port *ap = qc->ap;
@@ -585,14 +585,10 @@ static void pdc20621_dump_hdma(struct ata_queued_cmd *qc)
 	dimm_mmio += (port_no * PDC_DIMM_WINDOW_STEP);
 	dimm_mmio += PDC_DIMM_HOST_PKT;
 
-	printk(KERN_ERR "HDMA[0] == 0x%08X\n", readl(dimm_mmio));
-	printk(KERN_ERR "HDMA[1] == 0x%08X\n", readl(dimm_mmio + 4));
-	printk(KERN_ERR "HDMA[2] == 0x%08X\n", readl(dimm_mmio + 8));
-	printk(KERN_ERR "HDMA[3] == 0x%08X\n", readl(dimm_mmio + 12));
+	ata_port_dbg(ap, "HDMA 0x%08X 0x%08X 0x%08X 0x%08X\n",
+		     readl(dimm_mmio), readl(dimm_mmio + 4),
+		     readl(dimm_mmio + 8), readl(dimm_mmio + 12));
 }
-#else
-static inline void pdc20621_dump_hdma(struct ata_queued_cmd *qc) { }
-#endif /* ATA_VERBOSE_DEBUG */
 
 static void pdc20621_packet_start(struct ata_queued_cmd *qc)
 {
@@ -938,7 +934,6 @@ static void pdc_sata_setup_port(struct ata_ioports *port, void __iomem *base)
 }
 
 
-#ifdef ATA_VERBOSE_DEBUG
 static void pdc20621_get_from_dimm(struct ata_host *host, void *psource,
 				   u32 offset, u32 size)
 {
@@ -988,7 +983,6 @@ static void pdc20621_get_from_dimm(struct ata_host *host, void *psource,
 		memcpy_fromio(psource, dimm_mmio, size / 4);
 	}
 }
-#endif
 
 
 static void pdc20621_put_to_dimm(struct ata_host *host, void *psource,
@@ -1301,8 +1295,7 @@ static unsigned int pdc20621_dimm_init(struct ata_host *host)
 		return 1;
 	}
 
-#ifdef ATA_VERBOSE_DEBUG
-	{
+	if (dimm_test) {
 		u8 test_parttern1[40] =
 			{0x55,0xAA,'P','r','o','m','i','s','e',' ',
 			'N','o','t',' ','Y','e','t',' ',
@@ -1316,19 +1309,20 @@ static unsigned int pdc20621_dimm_init(struct ata_host *host)
 
 		pdc20621_put_to_dimm(host, test_parttern1, 0x10040, 40);
 		pdc20621_get_from_dimm(host, test_parttern2, 0x40, 40);
-		printk(KERN_ERR "%x, %x, %s\n", test_parttern2[0],
+		dev_info(host->dev, "DIMM test pattern 1: %x, %x, %s\n", test_parttern2[0],
 		       test_parttern2[1], &(test_parttern2[2]));
 		pdc20621_get_from_dimm(host, test_parttern2, 0x10040,
 				       40);
-		printk(KERN_ERR "%x, %x, %s\n", test_parttern2[0],
-		       test_parttern2[1], &(test_parttern2[2]));
+		dev_info(host->dev, "DIMM test pattern 2: %x, %x, %s\n",
+			 test_parttern2[0],
+			 test_parttern2[1], &(test_parttern2[2]));
 
 		pdc20621_put_to_dimm(host, test_parttern1, 0x40, 40);
 		pdc20621_get_from_dimm(host, test_parttern2, 0x40, 40);
-		printk(KERN_ERR "%x, %x, %s\n", test_parttern2[0],
-		       test_parttern2[1], &(test_parttern2[2]));
+		dev_info(host->dev, "DIMM test pattern 3: %x, %x, %s\n",
+			 test_parttern2[0],
+			 test_parttern2[1], &(test_parttern2[2]));
 	}
-#endif
 
 	/* ECC initiliazation. */
 
-- 
2.29.2

