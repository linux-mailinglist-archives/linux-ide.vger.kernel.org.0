Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 467AD507460
	for <lists+linux-ide@lfdr.de>; Tue, 19 Apr 2022 18:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354965AbiDSQog (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 19 Apr 2022 12:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355085AbiDSQoV (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 19 Apr 2022 12:44:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AF423BF4;
        Tue, 19 Apr 2022 09:41:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9650C61821;
        Tue, 19 Apr 2022 16:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB721C385AC;
        Tue, 19 Apr 2022 16:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650386497;
        bh=1O9MwmD3q7Efw0mNmt0vC0FIYvsOfssGwGwAEKA5gxM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RW3t/f0q/W5/dnzfcrtw0I9fhLVY23FDmAPpcSaaDuKEEcmTyf0OhUuVzov6xRtSg
         8/90KOb8nyH780wMfnvX+HRQ5KfSJ/tj7EytVv1D4e3RaGfAVpd8MdgrryyRnQz5sl
         tAEHgpltGQpLFkNQV4TvKayphCQEulsFlQIA0f/Mf+RpqX1pdKuTMDiDkHI/8Hxyi7
         CH4LD6+/aasnihfkDYTekh2dNU8/QkAcdXp4RO1bzn7uBOscXcQCaZqzuz/GBYaM0s
         q1fLwEh5+e7KJuaGDQ6KO7+wX/GqQHM1/twbQraNRso9SVmFpc0j+LKZPWKG4wAyPe
         xamlnDN1RvfFw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     robert.jarzmik@free.fr, linux-arm-kernel@lists.infradead.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Paul Parsons <lost.distance@yahoo.com>,
        Tomas Cech <sleep_walker@suse.com>,
        Sergey Lapin <slapin@ossfans.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
        patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        alsa-devel@alsa-project.org
Subject: [PATCH 21/48] ARM: pxa: eseries: use gpio lookup for audio
Date:   Tue, 19 Apr 2022 18:37:43 +0200
Message-Id: <20220419163810.2118169-22-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The three eseries machines have very similar drivers for audio, all
using the mach/eseries-gpio.h header for finding the gpio numbers.

Change these to use gpio descriptors to avoid the header file
dependency.

I convert the _OFF gpio numbers into GPIO_ACTIVE_LOW ones for
consistency here.

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/eseries.c | 32 ++++++++++++++++++++++++++++++++
 sound/soc/pxa/e740_wm9705.c | 35 ++++++++++++++++++-----------------
 sound/soc/pxa/e750_wm9705.c | 31 ++++++++++++++-----------------
 sound/soc/pxa/e800_wm9712.c | 31 ++++++++++++++-----------------
 4 files changed, 78 insertions(+), 51 deletions(-)

diff --git a/arch/arm/mach-pxa/eseries.c b/arch/arm/mach-pxa/eseries.c
index a8b6483ff665..2643a2a72408 100644
--- a/arch/arm/mach-pxa/eseries.c
+++ b/arch/arm/mach-pxa/eseries.c
@@ -24,6 +24,7 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/memblock.h>
+#include <linux/gpio/machine.h>
 
 #include <video/w100fb.h>
 
@@ -520,6 +521,16 @@ static struct platform_device e740_audio_device = {
 	.id		= -1,
 };
 
+static struct gpiod_lookup_table e740_audio_gpio_table = {
+	.dev_id = "e740-audio",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa",  GPIO_E740_WM9705_nAVDD2, "Audio power",  GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-pxa",  GPIO_E740_AMP_ON, "Output amp",  GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-pxa",  GPIO_E740_MIC_ON, "Mic amp", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 /* ----------------------------------------------------------------------- */
 
 static struct platform_device *e740_devices[] __initdata = {
@@ -540,6 +551,7 @@ static void __init e740_init(void)
 			"UDCCLK", &pxa25x_device_udc.dev),
 	eseries_get_tmio_gpios();
 	gpiod_add_lookup_table(&e7xx_gpio_vbus_gpiod_table);
+	gpiod_add_lookup_table(&e740_audio_gpio_table);
 	platform_add_devices(ARRAY_AND_SIZE(e740_devices));
 	pxa_set_ac97_info(NULL);
 	pxa_set_ficp_info(&e7xx_ficp_platform_data);
@@ -716,6 +728,15 @@ static struct platform_device e750_tc6393xb_device = {
 	.resource      = eseries_tmio_resources,
 };
 
+static struct gpiod_lookup_table e750_audio_gpio_table = {
+	.dev_id = "e750-audio",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa",  GPIO_E750_HP_AMP_OFF, "Output amp",  GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("gpio-pxa",  GPIO_E750_SPK_AMP_OFF, "Mic amp", GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
 static struct platform_device e750_audio_device = {
 	.name		= "e750-audio",
 	.id		= -1,
@@ -740,6 +761,7 @@ static void __init e750_init(void)
 			"GPIO11_CLK", NULL),
 	eseries_get_tmio_gpios();
 	gpiod_add_lookup_table(&e7xx_gpio_vbus_gpiod_table);
+	gpiod_add_lookup_table(&e750_audio_gpio_table);
 	platform_add_devices(ARRAY_AND_SIZE(e750_devices));
 	pxa_set_ac97_info(NULL);
 	pxa_set_ficp_info(&e7xx_ficp_platform_data);
@@ -935,6 +957,15 @@ static struct platform_device e800_tc6393xb_device = {
 	.resource      = eseries_tmio_resources,
 };
 
+static struct gpiod_lookup_table e800_audio_gpio_table = {
+	.dev_id = "e800-audio",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa",  GPIO_E800_HP_AMP_OFF, "Output amp",  GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("gpio-pxa",  GPIO_E800_SPK_AMP_ON, "Mic amp", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static struct platform_device e800_audio_device = {
 	.name		= "e800-audio",
 	.id		= -1,
@@ -959,6 +990,7 @@ static void __init e800_init(void)
 			"GPIO11_CLK", NULL),
 	eseries_get_tmio_gpios();
 	gpiod_add_lookup_table(&e800_gpio_vbus_gpiod_table);
+	gpiod_add_lookup_table(&e800_audio_gpio_table);
 	platform_add_devices(ARRAY_AND_SIZE(e800_devices));
 	pxa_set_ac97_info(NULL);
 }
diff --git a/sound/soc/pxa/e740_wm9705.c b/sound/soc/pxa/e740_wm9705.c
index f922be7e0016..4e0e9b778d4c 100644
--- a/sound/soc/pxa/e740_wm9705.c
+++ b/sound/soc/pxa/e740_wm9705.c
@@ -7,17 +7,19 @@
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
 
 #include <linux/platform_data/asoc-pxa.h>
-#include <mach/eseries-gpio.h>
 
 #include <asm/mach-types.h>
 
+static struct gpio_desc *gpiod_output_amp, *gpiod_input_amp;
+static struct gpio_desc *gpiod_audio_power;
+
 #define E740_AUDIO_OUT 1
 #define E740_AUDIO_IN  2
 
@@ -25,9 +27,9 @@ static int e740_audio_power;
 
 static void e740_sync_audio_power(int status)
 {
-	gpio_set_value(GPIO_E740_WM9705_nAVDD2, !status);
-	gpio_set_value(GPIO_E740_AMP_ON, (status & E740_AUDIO_OUT) ? 1 : 0);
-	gpio_set_value(GPIO_E740_MIC_ON, (status & E740_AUDIO_IN) ? 1 : 0);
+	gpiod_set_value(gpiod_audio_power, !status);
+	gpiod_set_value(gpiod_output_amp, (status & E740_AUDIO_OUT) ? 1 : 0);
+	gpiod_set_value(gpiod_input_amp, (status & E740_AUDIO_IN) ? 1 : 0);
 }
 
 static int e740_mic_amp_event(struct snd_soc_dapm_widget *w,
@@ -116,36 +118,35 @@ static struct snd_soc_card e740 = {
 	.fully_routed = true,
 };
 
-static struct gpio e740_audio_gpios[] = {
-	{ GPIO_E740_MIC_ON, GPIOF_OUT_INIT_LOW, "Mic amp" },
-	{ GPIO_E740_AMP_ON, GPIOF_OUT_INIT_LOW, "Output amp" },
-	{ GPIO_E740_WM9705_nAVDD2, GPIOF_OUT_INIT_HIGH, "Audio power" },
-};
-
 static int e740_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &e740;
 	int ret;
 
-	ret = gpio_request_array(e740_audio_gpios,
-				 ARRAY_SIZE(e740_audio_gpios));
+	gpiod_input_amp  = devm_gpiod_get(&pdev->dev, "Mic amp", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(gpiod_input_amp);
+	if (ret)
+		return ret;
+	gpiod_output_amp  = devm_gpiod_get(&pdev->dev, "Output amp", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(gpiod_output_amp);
+	if (ret)
+		return ret;
+	gpiod_audio_power = devm_gpiod_get(&pdev->dev, "Audio power", GPIOD_OUT_HIGH);
+	ret = PTR_ERR_OR_ZERO(gpiod_audio_power);
 	if (ret)
 		return ret;
 
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret) {
+	if (ret)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
 			ret);
-		gpio_free_array(e740_audio_gpios, ARRAY_SIZE(e740_audio_gpios));
-	}
 	return ret;
 }
 
 static int e740_remove(struct platform_device *pdev)
 {
-	gpio_free_array(e740_audio_gpios, ARRAY_SIZE(e740_audio_gpios));
 	return 0;
 }
 
diff --git a/sound/soc/pxa/e750_wm9705.c b/sound/soc/pxa/e750_wm9705.c
index 308828cd736b..7a1e0d8bfd11 100644
--- a/sound/soc/pxa/e750_wm9705.c
+++ b/sound/soc/pxa/e750_wm9705.c
@@ -7,24 +7,25 @@
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
 
 #include <linux/platform_data/asoc-pxa.h>
-#include <mach/eseries-gpio.h>
 
 #include <asm/mach-types.h>
 
+static struct gpio_desc *gpiod_spk_amp, *gpiod_hp_amp;
+
 static int e750_spk_amp_event(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
 {
 	if (event & SND_SOC_DAPM_PRE_PMU)
-		gpio_set_value(GPIO_E750_SPK_AMP_OFF, 0);
+		gpiod_set_value(gpiod_spk_amp, 1);
 	else if (event & SND_SOC_DAPM_POST_PMD)
-		gpio_set_value(GPIO_E750_SPK_AMP_OFF, 1);
+		gpiod_set_value(gpiod_spk_amp, 0);
 
 	return 0;
 }
@@ -33,9 +34,9 @@ static int e750_hp_amp_event(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
 {
 	if (event & SND_SOC_DAPM_PRE_PMU)
-		gpio_set_value(GPIO_E750_HP_AMP_OFF, 0);
+		gpiod_set_value(gpiod_hp_amp, 1);
 	else if (event & SND_SOC_DAPM_POST_PMD)
-		gpio_set_value(GPIO_E750_HP_AMP_OFF, 1);
+		gpiod_set_value(gpiod_hp_amp, 0);
 
 	return 0;
 }
@@ -100,35 +101,31 @@ static struct snd_soc_card e750 = {
 	.fully_routed = true,
 };
 
-static struct gpio e750_audio_gpios[] = {
-	{ GPIO_E750_HP_AMP_OFF, GPIOF_OUT_INIT_HIGH, "Headphone amp" },
-	{ GPIO_E750_SPK_AMP_OFF, GPIOF_OUT_INIT_HIGH, "Speaker amp" },
-};
-
 static int e750_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &e750;
 	int ret;
 
-	ret = gpio_request_array(e750_audio_gpios,
-				 ARRAY_SIZE(e750_audio_gpios));
+	gpiod_hp_amp  = devm_gpiod_get(&pdev->dev, "Headphone amp", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(gpiod_hp_amp);
+	if (ret)
+		return ret;
+	gpiod_spk_amp  = devm_gpiod_get(&pdev->dev, "Speaker amp", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(gpiod_spk_amp);
 	if (ret)
 		return ret;
 
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret) {
+	if (ret)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
 			ret);
-		gpio_free_array(e750_audio_gpios, ARRAY_SIZE(e750_audio_gpios));
-	}
 	return ret;
 }
 
 static int e750_remove(struct platform_device *pdev)
 {
-	gpio_free_array(e750_audio_gpios, ARRAY_SIZE(e750_audio_gpios));
 	return 0;
 }
 
diff --git a/sound/soc/pxa/e800_wm9712.c b/sound/soc/pxa/e800_wm9712.c
index d74fcceef687..a39c494127cf 100644
--- a/sound/soc/pxa/e800_wm9712.c
+++ b/sound/soc/pxa/e800_wm9712.c
@@ -7,7 +7,7 @@
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -15,15 +15,16 @@
 
 #include <asm/mach-types.h>
 #include <linux/platform_data/asoc-pxa.h>
-#include <mach/eseries-gpio.h>
+
+static struct gpio_desc *gpiod_spk_amp, *gpiod_hp_amp;
 
 static int e800_spk_amp_event(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
 {
 	if (event & SND_SOC_DAPM_PRE_PMU)
-		gpio_set_value(GPIO_E800_SPK_AMP_ON, 1);
+		gpiod_set_value(gpiod_spk_amp, 1);
 	else if (event & SND_SOC_DAPM_POST_PMD)
-		gpio_set_value(GPIO_E800_SPK_AMP_ON, 0);
+		gpiod_set_value(gpiod_spk_amp, 0);
 
 	return 0;
 }
@@ -32,9 +33,9 @@ static int e800_hp_amp_event(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
 {
 	if (event & SND_SOC_DAPM_PRE_PMU)
-		gpio_set_value(GPIO_E800_HP_AMP_OFF, 0);
+		gpiod_set_value(gpiod_hp_amp, 1);
 	else if (event & SND_SOC_DAPM_POST_PMD)
-		gpio_set_value(GPIO_E800_HP_AMP_OFF, 1);
+		gpiod_set_value(gpiod_hp_amp, 0);
 
 	return 0;
 }
@@ -100,35 +101,31 @@ static struct snd_soc_card e800 = {
 	.num_dapm_routes = ARRAY_SIZE(audio_map),
 };
 
-static struct gpio e800_audio_gpios[] = {
-	{ GPIO_E800_SPK_AMP_ON, GPIOF_OUT_INIT_HIGH, "Headphone amp" },
-	{ GPIO_E800_HP_AMP_OFF, GPIOF_OUT_INIT_HIGH, "Speaker amp" },
-};
-
 static int e800_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &e800;
 	int ret;
 
-	ret = gpio_request_array(e800_audio_gpios,
-				 ARRAY_SIZE(e800_audio_gpios));
+	gpiod_hp_amp  = devm_gpiod_get(&pdev->dev, "Headphone amp", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(gpiod_hp_amp);
+	if (ret)
+		return ret;
+	gpiod_spk_amp  = devm_gpiod_get(&pdev->dev, "Speaker amp", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(gpiod_spk_amp);
 	if (ret)
 		return ret;
 
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret) {
+	if (ret)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
 			ret);
-		gpio_free_array(e800_audio_gpios, ARRAY_SIZE(e800_audio_gpios));
-	}
 	return ret;
 }
 
 static int e800_remove(struct platform_device *pdev)
 {
-	gpio_free_array(e800_audio_gpios, ARRAY_SIZE(e800_audio_gpios));
 	return 0;
 }
 
-- 
2.29.2

