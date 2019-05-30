Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 018B4301FA
	for <lists+linux-ide@lfdr.de>; Thu, 30 May 2019 20:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbfE3SdG (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 30 May 2019 14:33:06 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37288 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbfE3SdF (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 30 May 2019 14:33:05 -0400
Received: by mail-wr1-f68.google.com with SMTP id h1so4848909wro.4
        for <linux-ide@vger.kernel.org>; Thu, 30 May 2019 11:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i+fbKH+QRnELtlpYWFUy8Jdd0mJnh8a8uAbFeHwRVMA=;
        b=oXbU4Luzy8UM4Ng+sOrLgWH57zPl3lAL5sIztfh4pGvMlQhww+9gkM6Sb8PrFuk57y
         yQsF76BPHvwzKpHzvsQ02UABCQa9qVQO0hmx9/zcmhEGgS5lQevr5nVTZs6BsYBtw1U7
         nJy8P2FJG8Xqedy88WHafV/gfyTA753Inj/obSPwb7kYMcLsRD5A3N2jYvRjbESTPE2B
         J6qMNHSHgncJd/I296eSMOqz81GfJbyzOYC06m+xzSneUugdF2tTLwQoy62C7+j0nn4k
         CqBvNp5knSqf257TBWxNDklWrff21HnnjeSmWMdAglYmoqkpIfna5AyOJuooS8gdnNDI
         9wlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i+fbKH+QRnELtlpYWFUy8Jdd0mJnh8a8uAbFeHwRVMA=;
        b=T0BMo+lhZilmQnkuKcQ27F53nRVmZha/gkaOid9lLDckFbKKQKbVuAuMR8ECB9lWc1
         bA/WIJ+Ds5VwNllNajNasap+AOv8z+wwxTGCEvGDyaS8foj9TBTSwY7vjd0Ko9Hg0/d9
         q6cxIfry2p2Ho33Z35yScUSPX+7Z7lVHPYHggUoLci/KcH5z/QPPEEtuCWx5GgQMP77S
         XP7PslL1VFZss7fos3j/++tJyf83sojzz/Og4cP5am+407MPup3ByD6jzIVr3YYnf8uF
         oXbxjgeIKhjzTM5w1ievs3ZTMFb0hp8wuGpPMDD7APHJDKpYYYCBm6QcHVLXZ92JS/ob
         6Lww==
X-Gm-Message-State: APjAAAX2wlXYtNDMxxeczufwKhoB1POwCocnmuof4ap3wwx5G9HcTmYi
        SImeAxEFfhadbFo1Kb6nhz2F2Q==
X-Google-Smtp-Source: APXvYqxPYvjBtKtbgbBKON51cl8AMHp0sDo9I66LXlyv4myIknYdQs95HcS0Cr9tw6cRN6pzoFdYxQ==
X-Received: by 2002:adf:dece:: with SMTP id i14mr3591614wrn.138.1559241183808;
        Thu, 30 May 2019 11:33:03 -0700 (PDT)
Received: from localhost.localdomain (catv-89-135-96-219.catv.broadband.hu. [89.135.96.219])
        by smtp.gmail.com with ESMTPSA id p17sm4278811wrq.95.2019.05.30.11.33.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 30 May 2019 11:33:02 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jens Axboe <axboe@kernel.dk>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-ide@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Egor Starkov <egor.starkov@ge.com>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v4] ata: ahci-imx: Covert to use GPIO descriptor
Date:   Thu, 30 May 2019 20:32:58 +0200
Message-Id: <20190530183258.2818-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

This converts the i.MX AHCI driver to use a GPIO descriptor
instead of parsing the device tree by itself.

This driver is quite obviously device tree only, and the
GPIO line is treated as optional, so let's keep it as
optional.

None of the device trees in the kernel use this GPIO
facility today, so it is hard to test.

Cc: Egor Starkov <egor.starkov@ge.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Rebase on v5.2-rc1 and resend.
- If this keeps being missed I guess I'll just apply it to
  the GPIO tree.
ChangeLog v2->v3:
- Rebase on v5.1-rc1 and resend.
ChangeLog v1->v2:
- Drop the "clkreq had been initialized" message
- The message indicated several users on the same GPIO line,
  so set the GPIO as GPIOD_FLAGS_BIT_NONEXCLUSIVE so we can
  have more than one consumer of the same GPIO line
---
 drivers/ata/ahci_imx.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
index b00799d208f5..2fa704e56bed 100644
--- a/drivers/ata/ahci_imx.c
+++ b/drivers/ata/ahci_imx.c
@@ -22,8 +22,8 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/ahci_platform.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
 #include <linux/libata.h>
@@ -111,7 +111,7 @@ struct imx_ahci_priv {
 	struct clk *phy_pclk0;
 	struct clk *phy_pclk1;
 	void __iomem *phy_base;
-	int clkreq_gpio;
+	struct gpio_desc *clkreq_gpiod;
 	struct regmap *gpr;
 	bool no_device;
 	bool first_time;
@@ -991,7 +991,6 @@ static struct scsi_host_template ahci_platform_sht = {
 
 static int imx8_sata_probe(struct device *dev, struct imx_ahci_priv *imxpriv)
 {
-	int ret;
 	struct resource *phy_res;
 	struct platform_device *pdev = imxpriv->ahci_pdev;
 	struct device_node *np = dev->of_node;
@@ -1044,20 +1043,12 @@ static int imx8_sata_probe(struct device *dev, struct imx_ahci_priv *imxpriv)
 	}
 
 	/* Fetch GPIO, then enable the external OSC */
-	imxpriv->clkreq_gpio = of_get_named_gpio(np, "clkreq-gpio", 0);
-	if (gpio_is_valid(imxpriv->clkreq_gpio)) {
-		ret = devm_gpio_request_one(dev, imxpriv->clkreq_gpio,
-					    GPIOF_OUT_INIT_LOW,
-					    "SATA CLKREQ");
-		if (ret == -EBUSY) {
-			dev_info(dev, "clkreq had been initialized.\n");
-		} else if (ret) {
-			dev_err(dev, "%d unable to get clkreq.\n", ret);
-			return ret;
-		}
-	} else if (imxpriv->clkreq_gpio == -EPROBE_DEFER) {
-		return imxpriv->clkreq_gpio;
-	}
+	imxpriv->clkreq_gpiod = devm_gpiod_get_optional(dev, "clkreq",
+				GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	if (IS_ERR(imxpriv->clkreq_gpiod))
+		return PTR_ERR(imxpriv->clkreq_gpiod);
+	if (imxpriv->clkreq_gpiod)
+		gpiod_set_consumer_name(imxpriv->clkreq_gpiod, "SATA CLKREQ");
 
 	return 0;
 }
-- 
2.20.1

