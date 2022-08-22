Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B97559C6A4
	for <lists+linux-ide@lfdr.de>; Mon, 22 Aug 2022 20:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237674AbiHVSjS (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 22 Aug 2022 14:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233736AbiHVSi2 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 22 Aug 2022 14:38:28 -0400
Received: from mail.baikalelectronics.com (mail.baikalelectronics.com [87.245.175.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8E0FF48E93;
        Mon, 22 Aug 2022 11:37:58 -0700 (PDT)
Received: from mail (mail.baikal.int [192.168.51.25])
        by mail.baikalelectronics.com (Postfix) with ESMTP id 586D5DA7;
        Mon, 22 Aug 2022 21:41:04 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.com 586D5DA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baikalelectronics.ru; s=mail; t=1661193664;
        bh=myqzeuvlhSkEkWvveUPqP8w454z2w6eavNE689Q06zI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References:From;
        b=Txw7hhTFNFBJUGPiOXIFWhBGimAJMu25IxAtYs+505ee8lXoEXWDVLv7AxSdUqp1M
         NTSL20UhR1vce5YX6thoKU61RFRXEj2dHXVY/1kTHCQF8h0ddheqUW8dHa2ecufjWD
         srmSzmM1nVVAz1v++wxlu1OmnABJvc4Ri+zCf6tM=
Received: from localhost (192.168.168.10) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 22 Aug 2022 21:37:49 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>,
        Serge Semin <fancer.lancer@gmail.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        <linux-ide@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH v7 22/23] ata: ahci-dwc: Add Baikal-T1 AHCI SATA interface support
Date:   Mon, 22 Aug 2022 21:37:27 +0300
Message-ID: <20220822183728.24434-23-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20220822183728.24434-1-Sergey.Semin@baikalelectronics.ru>
References: <20220822183728.24434-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

It's almost fully compatible DWC AHCI SATA IP-core derivative except the
reference clocks source, which need to be very carefully selected. In
particular the DWC AHCI SATA PHY can be clocked either from the pads
ref_pad_clk_{m,p} or from the internal wires ref_alt_clk_{m,n}. In the
later case the clock signal is generated from the Baikal-T1 CCU SATA PLL.
The clocks source is selected by means of the ref_use_pad wire connected
to the CCU SATA reference clock CSR.

In normal situation it would be much more handy to use the internal
reference clock source, but alas we haven't managed to make the AHCI
controller working well with it so far. So it's preferable to have the
controller clocked from the external clock generator and fallback to the
internal clock source only as a last resort. Other than that the
controller is full compatible with the DWC AHCI SATA IP-core.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Hannes Reinecke <hare@suse.de>

---

Changelog v2:
- Rename 'syscon' property to 'baikal,bt1-syscon'.
- Change the local objects prefix from 'dwc_ahci_' to 'ahci_dwc_',
  from 'bt1_ahci_' to 'ahci_bt1_'. (@Damien)

Changelog v4:
- Convert ahci_bt1_plat to being statically defined. (@kbot)
- Drop Baikal-T1 syscon reference relying on the clock controller
  and the platform setup having the proper clock source selected. (@Rob)
---
 drivers/ata/Kconfig    |  1 +
 drivers/ata/ahci_dwc.c | 55 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index 2bd743995ab5..c8f9cf564b95 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -179,6 +179,7 @@ config AHCI_DM816
 config AHCI_DWC
 	tristate "Synopsys DWC AHCI SATA support"
 	select SATA_HOST
+	select MFD_SYSCON if (MIPS_BAIKAL_T1 || COMPILE_TEST)
 	help
 	  This option enables support for the Synopsys DWC AHCI SATA
 	  controller implementation.
diff --git a/drivers/ata/ahci_dwc.c b/drivers/ata/ahci_dwc.c
index 44a9bb7696ab..03a1af1c2b1f 100644
--- a/drivers/ata/ahci_dwc.c
+++ b/drivers/ata/ahci_dwc.c
@@ -13,10 +13,12 @@
 #include <linux/kernel.h>
 #include <linux/libata.h>
 #include <linux/log2.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/regmap.h>
 
 #include "ahci.h"
 
@@ -90,6 +92,20 @@
 #define AHCI_DWC_PORT_PHYCR		0x74
 #define AHCI_DWC_PORT_PHYSR		0x78
 
+/* Baikal-T1 AHCI SATA specific registers */
+#define AHCI_BT1_HOST_PHYCR		AHCI_DWC_HOST_GPCR
+#define AHCI_BT1_HOST_MPLM_MASK		GENMASK(29, 23)
+#define AHCI_BT1_HOST_LOSDT_MASK	GENMASK(22, 20)
+#define AHCI_BT1_HOST_CRR		BIT(19)
+#define AHCI_BT1_HOST_CRW		BIT(18)
+#define AHCI_BT1_HOST_CRCD		BIT(17)
+#define AHCI_BT1_HOST_CRCA		BIT(16)
+#define AHCI_BT1_HOST_CRDI_MASK		GENMASK(15, 0)
+
+#define AHCI_BT1_HOST_PHYSR		AHCI_DWC_HOST_GPSR
+#define AHCI_BT1_HOST_CRA		BIT(16)
+#define AHCI_BT1_HOST_CRDO_MASK		GENMASK(15, 0)
+
 struct ahci_dwc_plat_data {
 	unsigned int pflags;
 	unsigned int hflags;
@@ -106,6 +122,39 @@ struct ahci_dwc_host_priv {
 	u32 dmacr[AHCI_MAX_PORTS];
 };
 
+static int ahci_bt1_init(struct ahci_host_priv *hpriv)
+{
+	struct ahci_dwc_host_priv *dpriv = hpriv->plat_data;
+	int ret;
+
+	/* APB, application and reference clocks are required */
+	if (!ahci_platform_find_clk(hpriv, "pclk") ||
+	    !ahci_platform_find_clk(hpriv, "aclk") ||
+	    !ahci_platform_find_clk(hpriv, "ref")) {
+		dev_err(&dpriv->pdev->dev, "No system clocks specified\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Fully reset the SATA AXI and ref clocks domain to ensure the state
+	 * machine is working from scratch especially if the reference clocks
+	 * source has been changed.
+	 */
+	ret = ahci_platform_assert_rsts(hpriv);
+	if (ret) {
+		dev_err(&dpriv->pdev->dev, "Couldn't assert the resets\n");
+		return ret;
+	}
+
+	ret = ahci_platform_deassert_rsts(hpriv);
+	if (ret) {
+		dev_err(&dpriv->pdev->dev, "Couldn't de-assert the resets\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static struct ahci_host_priv *ahci_dwc_get_resources(struct platform_device *pdev)
 {
 	struct ahci_dwc_host_priv *dpriv;
@@ -416,9 +465,15 @@ static struct ahci_dwc_plat_data ahci_dwc_plat = {
 	.pflags = AHCI_PLATFORM_GET_RESETS,
 };
 
+static struct ahci_dwc_plat_data ahci_bt1_plat = {
+	.pflags = AHCI_PLATFORM_GET_RESETS | AHCI_PLATFORM_RST_TRIGGER,
+	.init = ahci_bt1_init,
+};
+
 static const struct of_device_id ahci_dwc_of_match[] = {
 	{ .compatible = "snps,dwc-ahci", &ahci_dwc_plat },
 	{ .compatible = "snps,spear-ahci", &ahci_dwc_plat },
+	{ .compatible = "baikal,bt1-ahci", &ahci_bt1_plat },
 	{},
 };
 MODULE_DEVICE_TABLE(of, ahci_dwc_of_match);
-- 
2.35.1

