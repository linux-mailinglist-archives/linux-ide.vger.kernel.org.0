Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE66D25205
	for <lists+linux-ide@lfdr.de>; Tue, 21 May 2019 16:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbfEUOav (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 21 May 2019 10:30:51 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:57895 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbfEUOav (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 21 May 2019 10:30:51 -0400
X-Originating-IP: 90.88.22.185
Received: from localhost.localdomain (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr [90.88.22.185])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3FF9C240006;
        Tue, 21 May 2019 14:30:26 +0000 (UTC)
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
Subject: [PATCH v4 00/10] Enable per-port SATA interrupts and drop a hack in the IRQ subsystem
Date:   Tue, 21 May 2019 16:30:13 +0200
Message-Id: <20190521143023.31810-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hello,

Some time ago, when the initial support for Armada CP110 was
contributed, the SATA core was not able to handle per-port
interrupts. Despite the hardware reality, the device tree only
represents one main interrupt for the two ports. Having both SATA
ports enabled at the same time has been achieved by a hack in the ICU
driver(1) that faked the use of the two interrupts, no matter which
SATA port was in use.

Now that the SATA core is ready to handle more than one interrupt,
this series adds support for it in the libahci_platform code. The
CP110 device tree must be updated to reflect the two SATA ports
available and their respective interrupts. To do not break DT backward
compatibility, the ahci_platform driver now embeds a special quirk
which checks if the DT is valid (only for A8k compatible) and, if
needed, creates the two missing sub-nodes, and assign them the
relevant "reg" and "interrupts" properties, before removing the main
SATA node "interrupts" one.


Thanks,
Miquèl

(1) The ICU is an irqchip aggregating the CP110 (south-bridge)
interrupts into MSIs for the AP806 (north-bridge).

Changes in v4
=============
* Rebase on top of v5.2-rc1
* s/ARM64/arm64/ in the DT change commit title.

Changes in v3
=============
* Removed useless locking when acking the SATA host IRQ_STAT bit.
* As spotted by Hans, do not enable the AHCI_HFLAG_MULTI_MSI flag only
  if more than one port is enabled, DTs might declare only one
  interrupt and have multiple ports. Added Hans' Reviewed-by tag.
* Added Rob's Reviewed-by tags.
* Added explicit references to the 'Device Tree' being the culprit
  for the hacks which are being treated in patch "ata: ahci: mvebu:
  Add support for A8k legacy bindings" as suggested by Marc.
* Modified all DTs to avoid enabling/disabling the SATA ports
  independently, which does not work. Either both ports are enabled, or
  none. Tested on MacchiatoBin that all three availabe ports on the
  board are functional.

Changes in v2
=============
* In the AHCI world, the 'irq' is now an '*irqs' array, I ensured it
  is allocated even when not using *_platform drivers.
* Moved the whole logic from the generic ahci_platform.c driver to the
  Marvell's ahci_mvebu.c driver.
* Dropped the whole DT manipulation quirk.
* Instead used a hack to configure both interrupts when using the
  deprecated bindings, this hack is a8k specific but there is a flag
  that is passed to the core during the ahci_platform_get_resources()
  to indicate that the number of ports must be forced to 2 no matter
  the number of child nodes.
* The A8k based Clearfog-GT actually uses the SATA IP (Baruch's info)
  so do not remove the SATA node from the DT. Instead, change the DTS
  to fit the new bindings (the board only uses the second port at
  offset 1).
* Added bindings documentation about the A8k AHCI compatible (existing
  in DTs, missing in the doc).
* SATA Sub-nodes representing ports already are documented, I just
  added a mention that they can also have an interrupts property which
  is mutually exclusive with the root SATA node.


Miquel Raynal (9):
  ata: libahci: Ensure the host interrupt status bits are cleared
  ata: ahci: Support per-port interrupts
  dt-bindings: ata: Update ahci bindings with possible per-port
    interrupts
  ata: ahci: mvebu: Rename a platform data flag
  ata: ahci: mvebu: Add a parameter to a platform data callback
  dt-bindings: ata: Update ahci_mvebu bindings
  ata: ahci: mvebu: Support A8k compatible
  ata: ahci: mvebu: Add support for A8k legacy DT bindings
  irqchip/irq-mvebu-icu: Remove the double SATA ports interrupt hack

Thomas Petazzoni (1):
  arm64: dts: marvell: armada-cp110: Switch to per-port SATA interrupts

 .../devicetree/bindings/ata/ahci-platform.txt |  7 ++
 arch/arm64/boot/dts/marvell/armada-cp110.dtsi | 13 +++-
 drivers/ata/acard-ahci.c                      |  2 +-
 drivers/ata/ahci.c                            |  8 ++-
 drivers/ata/ahci.h                            |  3 +-
 drivers/ata/ahci_mvebu.c                      | 61 +++++++++++++---
 drivers/ata/libahci.c                         |  7 +-
 drivers/ata/libahci_platform.c                | 70 ++++++++++++++++---
 drivers/ata/sata_highbank.c                   |  2 +-
 drivers/irqchip/irq-mvebu-icu.c               | 18 -----
 include/linux/ahci_platform.h                 |  1 +
 11 files changed, 148 insertions(+), 44 deletions(-)

-- 
2.19.1

