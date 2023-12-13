Return-Path: <linux-ide+bounces-110-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 717B980E5FF
	for <lists+linux-ide@lfdr.de>; Tue, 12 Dec 2023 09:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97F321C20BD0
	for <lists+linux-ide@lfdr.de>; Tue, 12 Dec 2023 08:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5936D56B7E;
	Tue, 12 Dec 2023 08:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCcbILFs"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1A74C3A9
	for <linux-ide@vger.kernel.org>; Tue, 12 Dec 2023 08:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5660EC3278A;
	Tue, 12 Dec 2023 08:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702369326;
	bh=m5SQvsz1vhRXNtl3JSUfWJRem/gUR0HGkRHb/F5Ra/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VCcbILFsDOuv4LiKU8YJW+ycPcd/SRNdAPbxN2799cY3zE0B05Al40bzoB07DuFPT
	 5I+lOcrcARNMgcQL+1QIgJO/jGe8lkIrFt9KkdhTX18PL/L8BDK/e32VGPxtmSc109
	 EMRggfmgv8yn2HtsoZ2G2v0uM2Ah+79MzS4JzQZNWXzkyTFfREZedMBL97uU5cUmsr
	 UJQ2JJ+Rfxle9U6PMGDhDanK5aSC197KxHWTJJt4NU2bPAohn5eAVp5IqSmsKazIsr
	 7Tdsmf+oRtKf9qptGTMK7jwcr+xmQ0pS9saFXZJjbyFTv9zJKXSlgJ7tiMOjBFMHgm
	 Ch9yBjcx7UF5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4628EC4167D;
	Tue, 12 Dec 2023 08:22:06 +0000 (UTC)
From:
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Tue, 12 Dec 2023 11:20:53 +0300
Subject: [PATCH v6 36/40] ata: pata_ep93xx: remove legacy pinctrl use
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231212-ep93xx-v6-36-c307b8ac9aa8@maquefel.me>
References: <20231212-ep93xx-v6-0-c307b8ac9aa8@maquefel.me>
In-Reply-To: <20231212-ep93xx-v6-0-c307b8ac9aa8@maquefel.me>
To: Hartley Sweeten <hsweeten@visionengravers.com>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Damien Le Moal <dlemoal@kernel.org>, 
 Nikita Shubin <nikita.shubin@maquefel.me>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-ide@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.13-dev-e3e53
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702369322; l=6137;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=fcGoDtjMaCymQOqZ9xZV3x0EFLV2n2MxDeTkBga5QNs=; =?utf-8?q?b=3Dh3AzSery0ME/?=
 =?utf-8?q?p2ZlhFfk6hnbCeiKj4zMZODVsHinLp3/1h3YIDz7pHDxLAQcpoIuB3Qh/cnh2ONr?=
 qfToS2nJBrt7I35kx20WFYEF0g71yTuTot3Zzk2z7pPsLfuNlBAL
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received:
 by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
Reply-To: <nikita.shubin@maquefel.me>

From: Nikita Shubin <nikita.shubin@maquefel.me>

Drop legacy acquire/release since we are using pinctrl for this now.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Acked-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 arch/arm/mach-ep93xx/core.c       | 72 ---------------------------------------
 drivers/ata/pata_ep93xx.c         | 29 +++++-----------
 include/linux/soc/cirrus/ep93xx.h |  4 ---
 3 files changed, 8 insertions(+), 97 deletions(-)

diff --git a/arch/arm/mach-ep93xx/core.c b/arch/arm/mach-ep93xx/core.c
index 4ddf1a4cba33..9c6154bb37b5 100644
--- a/arch/arm/mach-ep93xx/core.c
+++ b/arch/arm/mach-ep93xx/core.c
@@ -779,78 +779,6 @@ void __init ep93xx_register_ide(void)
 	platform_device_register(&ep93xx_ide_device);
 }
 
-int ep93xx_ide_acquire_gpio(struct platform_device *pdev)
-{
-	int err;
-	int i;
-
-	err = gpio_request(EP93XX_GPIO_LINE_EGPIO2, dev_name(&pdev->dev));
-	if (err)
-		return err;
-	err = gpio_request(EP93XX_GPIO_LINE_EGPIO15, dev_name(&pdev->dev));
-	if (err)
-		goto fail_egpio15;
-	for (i = 2; i < 8; i++) {
-		err = gpio_request(EP93XX_GPIO_LINE_E(i), dev_name(&pdev->dev));
-		if (err)
-			goto fail_gpio_e;
-	}
-	for (i = 4; i < 8; i++) {
-		err = gpio_request(EP93XX_GPIO_LINE_G(i), dev_name(&pdev->dev));
-		if (err)
-			goto fail_gpio_g;
-	}
-	for (i = 0; i < 8; i++) {
-		err = gpio_request(EP93XX_GPIO_LINE_H(i), dev_name(&pdev->dev));
-		if (err)
-			goto fail_gpio_h;
-	}
-
-	/* GPIO ports E[7:2], G[7:4] and H used by IDE */
-	ep93xx_devcfg_clear_bits(EP93XX_SYSCON_DEVCFG_EONIDE |
-				 EP93XX_SYSCON_DEVCFG_GONIDE |
-				 EP93XX_SYSCON_DEVCFG_HONIDE);
-	return 0;
-
-fail_gpio_h:
-	for (--i; i >= 0; --i)
-		gpio_free(EP93XX_GPIO_LINE_H(i));
-	i = 8;
-fail_gpio_g:
-	for (--i; i >= 4; --i)
-		gpio_free(EP93XX_GPIO_LINE_G(i));
-	i = 8;
-fail_gpio_e:
-	for (--i; i >= 2; --i)
-		gpio_free(EP93XX_GPIO_LINE_E(i));
-	gpio_free(EP93XX_GPIO_LINE_EGPIO15);
-fail_egpio15:
-	gpio_free(EP93XX_GPIO_LINE_EGPIO2);
-	return err;
-}
-EXPORT_SYMBOL(ep93xx_ide_acquire_gpio);
-
-void ep93xx_ide_release_gpio(struct platform_device *pdev)
-{
-	int i;
-
-	for (i = 2; i < 8; i++)
-		gpio_free(EP93XX_GPIO_LINE_E(i));
-	for (i = 4; i < 8; i++)
-		gpio_free(EP93XX_GPIO_LINE_G(i));
-	for (i = 0; i < 8; i++)
-		gpio_free(EP93XX_GPIO_LINE_H(i));
-	gpio_free(EP93XX_GPIO_LINE_EGPIO15);
-	gpio_free(EP93XX_GPIO_LINE_EGPIO2);
-
-
-	/* GPIO ports E[7:2], G[7:4] and H used by GPIO */
-	ep93xx_devcfg_set_bits(EP93XX_SYSCON_DEVCFG_EONIDE |
-			       EP93XX_SYSCON_DEVCFG_GONIDE |
-			       EP93XX_SYSCON_DEVCFG_HONIDE);
-}
-EXPORT_SYMBOL(ep93xx_ide_release_gpio);
-
 /*************************************************************************
  * EP93xx ADC
  *************************************************************************/
diff --git a/drivers/ata/pata_ep93xx.c b/drivers/ata/pata_ep93xx.c
index 3f33916c2d23..83c2a0162cb0 100644
--- a/drivers/ata/pata_ep93xx.c
+++ b/drivers/ata/pata_ep93xx.c
@@ -652,13 +652,13 @@ static int ep93xx_pata_dma_init(struct ep93xx_pata_data *drv_data)
 	 * start of new transfer.
 	 */
 	drv_data->dma_rx_channel = dma_request_chan(dev, "rx");
-	if (IS_ERR(drv_data->dma_rx_channel)) {
+	if (PTR_ERR_OR_ZERO(drv_data->dma_rx_channel)) {
 		ret = PTR_ERR(drv_data->dma_rx_channel);
 		return dev_err_probe(dev, ret, "rx DMA setup failed");
 	}
 
 	drv_data->dma_tx_channel = dma_request_chan(&pdev->dev, "tx");
-	if (IS_ERR(drv_data->dma_tx_channel)) {
+	if (PTR_ERR_OR_ZERO(drv_data->dma_tx_channel)) {
 		ret = PTR_ERR(drv_data->dma_tx_channel);
 		dev_err_probe(dev, ret, "tx DMA setup failed");
 		goto fail_release_rx;
@@ -923,28 +923,18 @@ static int ep93xx_pata_probe(struct platform_device *pdev)
 	void __iomem *ide_base;
 	int err;
 
-	err = ep93xx_ide_acquire_gpio(pdev);
-	if (err)
-		return err;
-
 	/* INT[3] (IRQ_EP93XX_EXT3) line connected as pull down */
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		err = irq;
-		goto err_rel_gpio;
-	}
+	if (irq < 0)
+		return irq;
 
 	ide_base = devm_platform_get_and_ioremap_resource(pdev, 0, &mem_res);
-	if (IS_ERR(ide_base)) {
-		err = PTR_ERR(ide_base);
-		goto err_rel_gpio;
-	}
+	if (IS_ERR(ide_base))
+		return PTR_ERR(ide_base);
 
 	drv_data = devm_kzalloc(&pdev->dev, sizeof(*drv_data), GFP_KERNEL);
-	if (!drv_data) {
-		err = -ENOMEM;
-		goto err_rel_gpio;
-	}
+	if (!drv_data)
+		return -ENOMEM;
 
 	drv_data->pdev = pdev;
 	drv_data->ide_base = ide_base;
@@ -1003,8 +993,6 @@ static int ep93xx_pata_probe(struct platform_device *pdev)
 
 err_rel_dma:
 	ep93xx_pata_release_dma(drv_data);
-err_rel_gpio:
-	ep93xx_ide_release_gpio(pdev);
 	return err;
 }
 
@@ -1016,7 +1004,6 @@ static void ep93xx_pata_remove(struct platform_device *pdev)
 	ata_host_detach(host);
 	ep93xx_pata_release_dma(drv_data);
 	ep93xx_pata_clear_regs(drv_data->ide_base);
-	ep93xx_ide_release_gpio(pdev);
 }
 
 static const struct of_device_id ep93xx_pata_of_ids[] = {
diff --git a/include/linux/soc/cirrus/ep93xx.h b/include/linux/soc/cirrus/ep93xx.h
index fc4a2f9d4729..da8bdfc36526 100644
--- a/include/linux/soc/cirrus/ep93xx.h
+++ b/include/linux/soc/cirrus/ep93xx.h
@@ -37,15 +37,11 @@ struct ep93xx_regmap_adev {
 	container_of((_adev), struct ep93xx_regmap_adev, adev)
 
 #ifdef CONFIG_ARCH_EP93XX
-int ep93xx_ide_acquire_gpio(struct platform_device *pdev);
-void ep93xx_ide_release_gpio(struct platform_device *pdev);
 int ep93xx_i2s_acquire(void);
 void ep93xx_i2s_release(void);
 unsigned int ep93xx_chip_revision(void);
 
 #else
-static inline int ep93xx_ide_acquire_gpio(struct platform_device *pdev) { return 0; }
-static inline void ep93xx_ide_release_gpio(struct platform_device *pdev) {}
 static inline int ep93xx_i2s_acquire(void) { return 0; }
 static inline void ep93xx_i2s_release(void) {}
 static inline unsigned int ep93xx_chip_revision(void) { return 0; }

-- 
2.41.0


