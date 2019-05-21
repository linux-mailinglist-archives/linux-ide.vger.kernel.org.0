Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57E6625213
	for <lists+linux-ide@lfdr.de>; Tue, 21 May 2019 16:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbfEUOb1 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 21 May 2019 10:31:27 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:37345 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbfEUOb0 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 21 May 2019 10:31:26 -0400
X-Originating-IP: 90.88.22.185
Received: from localhost.localdomain (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr [90.88.22.185])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 44638240012;
        Tue, 21 May 2019 14:31:19 +0000 (UTC)
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
Subject: [PATCH v4 06/10] dt-bindings: ata: Update ahci_mvebu bindings
Date:   Tue, 21 May 2019 16:30:19 +0200
Message-Id: <20190521143023.31810-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190521143023.31810-1-miquel.raynal@bootlin.com>
References: <20190521143023.31810-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Update bindings with the already in use Armada 8k compatible.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/ata/ahci-platform.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/ata/ahci-platform.txt b/Documentation/devicetree/bindings/ata/ahci-platform.txt
index 80261e2845b0..a1e6a3a27ee3 100644
--- a/Documentation/devicetree/bindings/ata/ahci-platform.txt
+++ b/Documentation/devicetree/bindings/ata/ahci-platform.txt
@@ -17,6 +17,7 @@ Required properties:
   - "ibm,476gtr-ahci"
   - "marvell,armada-380-ahci"
   - "marvell,armada-3700-ahci"
+  - "marvell,armada-8k-ahci"
   - "snps,dwc-ahci"
   - "snps,spear-ahci"
   - "generic-ahci"
-- 
2.19.1

