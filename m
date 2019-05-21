Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCD325206
	for <lists+linux-ide@lfdr.de>; Tue, 21 May 2019 16:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbfEUOa6 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 21 May 2019 10:30:58 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:46089 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbfEUOa6 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 21 May 2019 10:30:58 -0400
X-Originating-IP: 90.88.22.185
Received: from localhost.localdomain (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr [90.88.22.185])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 845F224001D;
        Tue, 21 May 2019 14:30:47 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jens Axboe <axboe@kernel.dk>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, linux-ide@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Baruch Siach <baruch@tkos.co.il>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 01/10] ata: libahci: Ensure the host interrupt status bits are cleared
Date:   Tue, 21 May 2019 16:30:14 +0200
Message-Id: <20190521143023.31810-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190521143023.31810-1-miquel.raynal@bootlin.com>
References: <20190521143023.31810-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

ahci_multi_irqs_intr_hard() is going to be used as interrupt handler
to support SATA per-port interrupts. The current logic is to check and
clear the SATA port interrupt status register only. To avoid spurious
IRQs and interrupt storms, it will be needed to clear the port
interrupt bit in the host interrupt status register as well.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/ata/libahci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
index 692782dddc0f..9db6f488db59 100644
--- a/drivers/ata/libahci.c
+++ b/drivers/ata/libahci.c
@@ -1912,7 +1912,10 @@ static void ahci_port_intr(struct ata_port *ap)
 static irqreturn_t ahci_multi_irqs_intr_hard(int irq, void *dev_instance)
 {
 	struct ata_port *ap = dev_instance;
+	struct ata_host *host = ap->host;
+	struct ahci_host_priv *hpriv = host->private_data;
 	void __iomem *port_mmio = ahci_port_base(ap);
+	void __iomem *mmio = hpriv->mmio;
 	u32 status;
 
 	VPRINTK("ENTER\n");
@@ -1924,6 +1927,8 @@ static irqreturn_t ahci_multi_irqs_intr_hard(int irq, void *dev_instance)
 	ahci_handle_port_interrupt(ap, port_mmio, status);
 	spin_unlock(ap->lock);
 
+	writel(BIT(ap->port_no), mmio + HOST_IRQ_STAT);
+
 	VPRINTK("EXIT\n");
 
 	return IRQ_HANDLED;
-- 
2.19.1

