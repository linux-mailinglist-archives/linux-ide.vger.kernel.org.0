Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA8D465791
	for <lists+linux-ide@lfdr.de>; Wed,  1 Dec 2021 21:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353123AbhLAU4G (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 1 Dec 2021 15:56:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353207AbhLAUzP (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 1 Dec 2021 15:55:15 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523F0C061574;
        Wed,  1 Dec 2021 12:51:53 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id m15so24861552pgu.11;
        Wed, 01 Dec 2021 12:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GdmpBt4ZMaQPlphX/YwHQCI3dJfnkXTHjhvZr2zwqGI=;
        b=mA5gNYgQjHOsA/42VuhtN8dwIDpMsZCTfSyP3+oTfuZkTP9Eh2RLeOpJxiZkaAslfM
         MGttHUKWuasYkEnvsrRYsCXMgS26a1vEvWoWr+5oMgUL+/fo5lBqHNgJC7j0zmTn+gZZ
         6pl6wEB9J+yw01ClXgV/u4bUfYhfKbOnbfeiQ0mWJWBPG14qOEbivhSmpG2ZtzAZlVLy
         LpD6u0/61ghzHrDXgOcj2ZNOQL16rf9IbBzdHePA/VoXXMh1c/eDQZgt7EveOYvgDrGi
         QfXJFG3uYxw6I6JzdzrH9t7gSYm/6euZ7Yxx9ZR0b6YW73k2hqLcTlf4WUELAYmomiz3
         +PFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GdmpBt4ZMaQPlphX/YwHQCI3dJfnkXTHjhvZr2zwqGI=;
        b=D9BvCqeo2U833cB52kufU0P7qdBdQRUmg8y1afhFlL6yrhzoWRXrlMCqiM6+Ilh1FX
         TP/620GCzJr5nNTLdKYSj7f3yxzhftVXEMObtlwwUkbESfhCL5KAVpamuxUqtcnVcw+2
         xPM12jycccFAfv7cFl+v/HuenioVH+k3+976+p/EvQmhgP/RyKRjI+WAI88xhq7DmL80
         ntfzcwuGtVt1M/5AddOZaXQ9GkHSoA0iCxE4DNGAeXquxXfL1unyNpGNDieKlOZnOKIH
         gXIb44t9vNAcCR9Ci/E3of4GuKf8uGFLlfTcet3wnEzioXgygZK42rmNKYPuioEjvZpp
         NO+w==
X-Gm-Message-State: AOAM5319NX5g9Ao9RfykaaYVdGRqXxAOHIYSK4D42lTUcRTdWl/p8UFV
        LDJ2JtNP5wCR6F1j5u8foX9BaRqlPA4=
X-Google-Smtp-Source: ABdhPJy3iQxxjxCAI1LN4YwbWIk+vv2mASskJumumarNaJb8fgQIIsq4PEeD75P4CL31rTFEUQ7SGw==
X-Received: by 2002:a05:6a00:a8b:b0:44d:ef7c:94b9 with SMTP id b11-20020a056a000a8b00b0044def7c94b9mr8512534pfl.36.1638391912387;
        Wed, 01 Dec 2021 12:51:52 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id p20sm729117pfw.96.2021.12.01.12.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 12:51:51 -0800 (PST)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE), Gregory Fong <gregory.0xf0@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Markus Mayer <mmayer@broadcom.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Cooper <alcooperx@gmail.com>,
        Doug Berger <opendmb@gmail.com>,
        linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and
        Parallel ATA drivers)), linux-kernel@vger.kernel.org (open list),
        linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE),
        linux-mmc@vger.kernel.org (open list:MULTIMEDIA CARD (MMC), SECURE
        DIGITAL (SD) AND...),
        linux-pwm@vger.kernel.org (open list:PWM SUBSYSTEM),
        linux-crypto@vger.kernel.org (open list:HARDWARE RANDOM NUMBER
        GENERATOR CORE),
        linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
        linux-pm@vger.kernel.org (open list:THERMAL),
        linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 07/14] dt-bindings: interrupt-controller: Convert BCM7120 L2 to YAML
Date:   Wed,  1 Dec 2021 12:51:03 -0800
Message-Id: <20211201205110.41656-8-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201205110.41656-1-f.fainelli@gmail.com>
References: <20211201205110.41656-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Convert the Broadcom BCM7120 Level 2 interrupt controller Device Tree
binding to YAML to help with validation.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../brcm,bcm7120-l2-intc.txt                  |  88 -------------
 .../brcm,bcm7120-l2-intc.yaml                 | 123 ++++++++++++++++++
 2 files changed, 123 insertions(+), 88 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.txt
deleted file mode 100644
index addd86b6ca2f..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.txt
+++ /dev/null
@@ -1,88 +0,0 @@
-Broadcom BCM7120-style Level 2 interrupt controller
-
-This interrupt controller hardware is a second level interrupt controller that
-is hooked to a parent interrupt controller: e.g: ARM GIC for ARM-based
-platforms. It can be found on BCM7xxx products starting with BCM7120.
-
-Such an interrupt controller has the following hardware design:
-
-- outputs multiple interrupts signals towards its interrupt controller parent
-
-- controls how some of the interrupts will be flowing, whether they will
-  directly output an interrupt signal towards the interrupt controller parent,
-  or if they will output an interrupt signal at this 2nd level interrupt
-  controller, in particular for UARTs
-
-- has one 32-bit enable word and one 32-bit status word
-
-- no atomic set/clear operations
-
-- not all bits within the interrupt controller actually map to an interrupt
-
-The typical hardware layout for this controller is represented below:
-
-2nd level interrupt line		Outputs for the parent controller (e.g: ARM GIC)
-
-0 -----[ MUX ] ------------|==========> GIC interrupt 75
-          \-----------\
-                       |
-1 -----[ MUX ] --------)---|==========> GIC interrupt 76
-          \------------|
-                       |
-2 -----[ MUX ] --------)---|==========> GIC interrupt 77
-          \------------|
-                       |
-3 ---------------------|
-4 ---------------------|
-5 ---------------------|
-7 ---------------------|---|===========> GIC interrupt 66
-9 ---------------------|
-10 --------------------|
-11 --------------------/
-
-6 ------------------------\
-                           |===========> GIC interrupt 64
-8 ------------------------/
-
-12 ........................ X
-13 ........................ X 		(not connected)
-..
-31 ........................ X
-
-Required properties:
-
-- compatible: should be "brcm,bcm7120-l2-intc"
-- reg: specifies the base physical address and size of the registers
-- interrupt-controller: identifies the node as an interrupt controller
-- #interrupt-cells: specifies the number of cells needed to encode an interrupt
-  source, should be 1.
-- interrupts: specifies the interrupt line(s) in the interrupt-parent controller
-  node, valid values depend on the type of parent interrupt controller
-- brcm,int-map-mask: 32-bits bit mask describing how many and which interrupts
-  are wired to this 2nd level interrupt controller, and how they match their
-  respective interrupt parents. Should match exactly the number of interrupts
-  specified in the 'interrupts' property.
-
-Optional properties:
-
-- brcm,irq-can-wake: if present, this means the L2 controller can be used as a
-  wakeup source for system suspend/resume.
-
-- brcm,int-fwd-mask: if present, a bit mask to configure the interrupts which
-  have a mux gate, typically UARTs. Setting these bits will make their
-  respective interrupt outputs bypass this 2nd level interrupt controller
-  completely; it is completely transparent for the interrupt controller
-  parent. This should have one 32-bit word per enable/status pair.
-
-Example:
-
-irq0_intc: interrupt-controller@f0406800 {
-	compatible = "brcm,bcm7120-l2-intc";
-	interrupt-parent = <&intc>;
-	#interrupt-cells = <1>;
-	reg = <0xf0406800 0x8>;
-	interrupt-controller;
-	interrupts = <0x0 0x42 0x0>, <0x0 0x40 0x0>;
-	brcm,int-map-mask = <0xeb8>, <0x140>;
-	brcm,int-fwd-mask = <0x7>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.yaml
new file mode 100644
index 000000000000..e0c6dce40d13
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm7120-l2-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM7120-style Level 2 interrupt controller
+
+maintainers:
+  - Florian Fainelli <f.fainelli@gmail.com>
+
+description: >
+  This interrupt controller hardware is a second level interrupt controller that
+  is hooked to a parent interrupt controller: e.g: ARM GIC for ARM-based
+  platforms. It can be found on BCM7xxx products starting with BCM7120.
+
+  Such an interrupt controller has the following hardware design:
+
+  - outputs multiple interrupts signals towards its interrupt controller parent
+
+  - controls how some of the interrupts will be flowing, whether they will
+    directly output an interrupt signal towards the interrupt controller parent,
+    or if they will output an interrupt signal at this 2nd level interrupt
+    controller, in particular for UARTs
+
+  - has one 32-bit enable word and one 32-bit status word
+
+  - no atomic set/clear operations
+
+  - not all bits within the interrupt controller actually map to an interrupt
+
+  The typical hardware layout for this controller is represented below:
+
+  2nd level interrupt line		Outputs for the parent controller (e.g: ARM GIC)
+
+  0 -----[ MUX ] ------------|==========> GIC interrupt 75
+            \-----------\
+                         |
+  1 -----[ MUX ] --------)---|==========> GIC interrupt 76
+            \------------|
+                         |
+  2 -----[ MUX ] --------)---|==========> GIC interrupt 77
+            \------------|
+                         |
+  3 ---------------------|
+  4 ---------------------|
+  5 ---------------------|
+  7 ---------------------|---|===========> GIC interrupt 66
+  9 ---------------------|
+  10 --------------------|
+  11 --------------------/
+
+  6 ------------------------\
+                            |===========> GIC interrupt 64
+  8 ------------------------/
+
+  12 ........................ X
+  13 ........................ X 		(not connected)
+  ..
+  31 ........................ X
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: brcm,bcm7120-l2-intc
+
+  reg:
+    description: >
+      Specifies the base physical address and size of the registers
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupts: true
+
+  "brcm,int-map-mask":
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: >
+      32-bits bit mask describing how many and which interrupts are wired to
+      this 2nd level interrupt controller, and how they match their respective
+      interrupt parents. Should match exactly the number of interrupts
+      specified in the 'interrupts' property.
+
+  brcm,irq-can-wake:
+    type: boolean
+    description: >
+      If present, this means the L2 controller can be used as a wakeup source
+      for system suspend/resume.
+
+  brcm,int-fwd-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      if present, a bit mask to configure the interrupts which have a mux gate,
+      typically UARTs. Setting these bits will make their respective interrupt
+      outputs bypass this 2nd level interrupt controller completely; it is
+      completely transparent for the interrupt controller parent. This should
+      have one 32-bit word per enable/status pair.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+
+examples:
+  - |
+    irq0_intc: interrupt-controller@f0406800 {
+      compatible = "brcm,bcm7120-l2-intc";
+      interrupt-parent = <&intc>;
+      #interrupt-cells = <1>;
+      reg = <0xf0406800 0x8>;
+      interrupt-controller;
+      interrupts = <0x0 0x42 0x0>, <0x0 0x40 0x0>;
+      brcm,int-map-mask = <0xeb8>, <0x140>;
+      brcm,int-fwd-mask = <0x7>;
+    };
-- 
2.25.1

