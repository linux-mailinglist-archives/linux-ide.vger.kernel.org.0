Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDB725210
	for <lists+linux-ide@lfdr.de>; Tue, 21 May 2019 16:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbfEUObV (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 21 May 2019 10:31:21 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:39301 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbfEUObV (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 21 May 2019 10:31:21 -0400
X-Originating-IP: 90.88.22.185
Received: from localhost.localdomain (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr [90.88.22.185])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7F693240028;
        Tue, 21 May 2019 14:31:15 +0000 (UTC)
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
Subject: [PATCH v4 05/10] ata: ahci: mvebu: Add a parameter to a platform data callback
Date:   Tue, 21 May 2019 16:30:18 +0200
Message-Id: <20190521143023.31810-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190521143023.31810-1-miquel.raynal@bootlin.com>
References: <20190521143023.31810-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Before using the ahci_mvebu.c driver with Armada 8k hardware (right
now it is using the ahci_platform.c generic driver), let's add a
'struct device' pointer to the argument list of the
->plat_config() callback. This parameter will be used by the A8k's
callback.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/ata/ahci_mvebu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/ata/ahci_mvebu.c b/drivers/ata/ahci_mvebu.c
index 43bb2db59698..507ee7c5437c 100644
--- a/drivers/ata/ahci_mvebu.c
+++ b/drivers/ata/ahci_mvebu.c
@@ -29,7 +29,7 @@
 #define AHCI_WINDOW_SIZE(win)	(0x68 + ((win) << 4))
 
 struct ahci_mvebu_plat_data {
-	int (*plat_config)(struct ahci_host_priv *hpriv);
+	int (*plat_config)(struct ahci_host_priv *hpriv, struct device *dev);
 	unsigned int host_flags;
 };
 
@@ -67,7 +67,8 @@ static void ahci_mvebu_regret_option(struct ahci_host_priv *hpriv)
 	writel(0x80, hpriv->mmio + AHCI_VENDOR_SPECIFIC_0_DATA);
 }
 
-static int ahci_mvebu_armada_380_config(struct ahci_host_priv *hpriv)
+static int ahci_mvebu_armada_380_config(struct ahci_host_priv *hpriv,
+					struct device *dev)
 {
 	const struct mbus_dram_target_info *dram;
 	int rc = 0;
@@ -83,7 +84,8 @@ static int ahci_mvebu_armada_380_config(struct ahci_host_priv *hpriv)
 	return rc;
 }
 
-static int ahci_mvebu_armada_3700_config(struct ahci_host_priv *hpriv)
+static int ahci_mvebu_armada_3700_config(struct ahci_host_priv *hpriv,
+					 struct device *dev)
 {
 	u32 reg;
 
@@ -162,7 +164,7 @@ static int ahci_mvebu_resume(struct platform_device *pdev)
 	struct ahci_host_priv *hpriv = host->private_data;
 	const struct ahci_mvebu_plat_data *pdata = hpriv->plat_data;
 
-	pdata->plat_config(hpriv);
+	pdata->plat_config(hpriv, &pdev->dev);
 
 	return ahci_platform_resume_host(&pdev->dev);
 }
@@ -205,7 +207,7 @@ static int ahci_mvebu_probe(struct platform_device *pdev)
 
 	hpriv->stop_engine = ahci_mvebu_stop_engine;
 
-	rc = pdata->plat_config(hpriv);
+	rc = pdata->plat_config(hpriv, &pdev->dev);
 	if (rc)
 		goto disable_resources;
 
-- 
2.19.1

