Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D39F04B3BF4
	for <lists+linux-ide@lfdr.de>; Sun, 13 Feb 2022 16:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236669AbiBMPKm (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 13 Feb 2022 10:10:42 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236662AbiBMPKl (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 13 Feb 2022 10:10:41 -0500
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3BEE5BD0B
        for <linux-ide@vger.kernel.org>; Sun, 13 Feb 2022 07:10:35 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru B7D6920981AD
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
Subject: [PATCH v2 1/2] ata: libata-sff: refactor ata_sff_set_devctl()
Date:   Sun, 13 Feb 2022 18:10:31 +0300
Message-ID: <20220213151032.4694-2-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20220213151032.4694-1-s.shtylyov@omp.ru>
References: <20220213151032.4694-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Commit 41dec29bcb05 ("libata: introduce sff_set_devctl() method") left some
clumsy checks surrounding calls to ata_sff_set_devctl() which Jeff Garzik
suggested to factor out...  and I never followed up. :-(

At last, refactor ata_sff_set_devctl() to include the repetitive checks and
return a 'bool' result indicating if the device control register exists or
not.

While at it, further update the 'kernel-doc' comment -- the device control
register has never been a part of the taskfile, despite what Jeff and co.
think! :-)

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/ata/libata-sff.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/ata/libata-sff.c b/drivers/ata/libata-sff.c
index 546b1f73ede5..3fb5bd4de50c 100644
--- a/drivers/ata/libata-sff.c
+++ b/drivers/ata/libata-sff.c
@@ -265,20 +265,26 @@ EXPORT_SYMBOL_GPL(ata_sff_wait_ready);
  *	@ap: port where the device is
  *	@ctl: value to write
  *
- *	Writes ATA taskfile device control register.
+ *	Writes ATA device control register.
  *
- *	Note: may NOT be used as the sff_set_devctl() entry in
- *	ata_port_operations.
+ *	RETURN:
+ *	true if the register exists, false if not.
  *
  *	LOCKING:
  *	Inherited from caller.
  */
-static void ata_sff_set_devctl(struct ata_port *ap, u8 ctl)
+static bool ata_sff_set_devctl(struct ata_port *ap, u8 ctl)
 {
-	if (ap->ops->sff_set_devctl)
+	if (ap->ops->sff_set_devctl) {
 		ap->ops->sff_set_devctl(ap, ctl);
-	else
+		return true;
+	}
+	if (ap->ioaddr.ctl_addr) {
 		iowrite8(ctl, ap->ioaddr.ctl_addr);
+		return true;
+	}
+
+	return false;
 }
 
 /**
@@ -357,8 +363,6 @@ static void ata_dev_select(struct ata_port *ap, unsigned int device,
  */
 void ata_sff_irq_on(struct ata_port *ap)
 {
-	struct ata_ioports *ioaddr = &ap->ioaddr;
-
 	if (ap->ops->sff_irq_on) {
 		ap->ops->sff_irq_on(ap);
 		return;
@@ -367,8 +371,7 @@ void ata_sff_irq_on(struct ata_port *ap)
 	ap->ctl &= ~ATA_NIEN;
 	ap->last_ctl = ap->ctl;
 
-	if (ap->ops->sff_set_devctl || ioaddr->ctl_addr)
-		ata_sff_set_devctl(ap, ap->ctl);
+	ata_sff_set_devctl(ap, ap->ctl);
 	ata_wait_idle(ap);
 
 	if (ap->ops->sff_irq_clear)
@@ -1662,8 +1665,7 @@ void ata_sff_freeze(struct ata_port *ap)
 	ap->ctl |= ATA_NIEN;
 	ap->last_ctl = ap->ctl;
 
-	if (ap->ops->sff_set_devctl || ap->ioaddr.ctl_addr)
-		ata_sff_set_devctl(ap, ap->ctl);
+	ata_sff_set_devctl(ap, ap->ctl);
 
 	/* Under certain circumstances, some controllers raise IRQ on
 	 * ATA_NIEN manipulation.  Also, many controllers fail to mask
@@ -2061,10 +2063,8 @@ void ata_sff_postreset(struct ata_link *link, unsigned int *classes)
 		return;
 
 	/* set up device control */
-	if (ap->ops->sff_set_devctl || ap->ioaddr.ctl_addr) {
-		ata_sff_set_devctl(ap, ap->ctl);
+	if (ata_sff_set_devctl(ap, ap->ctl))
 		ap->last_ctl = ap->ctl;
-	}
 }
 EXPORT_SYMBOL_GPL(ata_sff_postreset);
 
-- 
2.26.3

