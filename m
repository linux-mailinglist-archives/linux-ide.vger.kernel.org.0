Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8FD54AFF61
	for <lists+linux-ide@lfdr.de>; Wed,  9 Feb 2022 22:46:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbiBIVqj (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 9 Feb 2022 16:46:39 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:58810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233726AbiBIVqf (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 9 Feb 2022 16:46:35 -0500
Received: from mxout02.lancloud.ru (mxout02.lancloud.ru [45.84.86.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21949C1DC049
        for <linux-ide@vger.kernel.org>; Wed,  9 Feb 2022 13:46:38 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 0F5DA20C097C
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
Subject: [PATCH 3/3] ata: sata_rcar: make sata_rcar_ata_devchk() return 'bool'
Date:   Thu, 10 Feb 2022 00:46:30 +0300
Message-ID: <20220209214630.13340-4-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20220209214630.13340-1-s.shtylyov@omp.ru>
References: <20220209214630.13340-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

sata_rcar_ata_devchk() returns 1 if a device is present, 0 if not --
the 'bool' type clearly fits better here than 'unsigned int'...

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/ata/sata_rcar.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
index be8bfefed663..20263c1113df 100644
--- a/drivers/ata/sata_rcar.c
+++ b/drivers/ata/sata_rcar.c
@@ -283,8 +283,7 @@ static void sata_rcar_dev_select(struct ata_port *ap, unsigned int device)
 	ata_sff_pause(ap);	/* needed; also flushes, for mmio */
 }
 
-static unsigned int sata_rcar_ata_devchk(struct ata_port *ap,
-					 unsigned int device)
+static bool sata_rcar_ata_devchk(struct ata_port *ap, unsigned int device)
 {
 	struct ata_ioports *ioaddr = &ap->ioaddr;
 	u8 nsect, lbal;
@@ -304,9 +303,9 @@ static unsigned int sata_rcar_ata_devchk(struct ata_port *ap,
 	lbal  = ioread32(ioaddr->lbal_addr);
 
 	if (nsect == 0x55 && lbal == 0xaa)
-		return 1;	/* found a device */
+		return true;	/* found a device */
 
-	return 0;		/* nothing found */
+	return false;		/* nothing found */
 }
 
 static int sata_rcar_wait_after_reset(struct ata_link *link,
-- 
2.26.3

