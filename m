Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D76E5B3FB2
	for <lists+linux-ide@lfdr.de>; Fri,  9 Sep 2022 21:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbiIITgd (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 9 Sep 2022 15:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbiIITgc (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 9 Sep 2022 15:36:32 -0400
Received: from mail.baikalelectronics.com (mail.baikalelectronics.com [87.245.175.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B23CC2AE33;
        Fri,  9 Sep 2022 12:36:30 -0700 (PDT)
Received: from mail (mail.baikal.int [192.168.51.25])
        by mail.baikalelectronics.com (Postfix) with ESMTP id 456C9DBA;
        Fri,  9 Sep 2022 22:40:18 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.com 456C9DBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baikalelectronics.ru; s=mail; t=1662752418;
        bh=Y7WwfSNSVFN6DsOTitXYalfVMtQs4BD5nZyMmYc6YaA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References:From;
        b=byxrOwQKUSaVkjsY4+AShszBhf69GjL1+2IvIB5D3rPggLK/WnHarHbIsqRDb/qJL
         v65ZQgcyp8TqHRghsBnurbKX4Gkz5K1GLJ1/vw6t+7isZHVguQHRSp4IyyBQuryDax
         Ux6u2YsIn4Qth1RKZoM0uLNVvwF+i0CBjbn2+vZU=
Received: from localhost (192.168.168.10) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 9 Sep 2022 22:36:29 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        <linux-ide@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v8 01/23] dt-bindings: ata: ahci-platform: Move dma-coherent to sata-common.yaml
Date:   Fri, 9 Sep 2022 22:35:59 +0300
Message-ID: <20220909193621.17380-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20220909193621.17380-1-Sergey.Semin@baikalelectronics.ru>
References: <20220909193621.17380-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Seeing doubtfully any SATA device working without embedded DMA engine
let's permit the device nodes being equipped with the dma-coherent
property in case if the platform is capable of cache-coherent DMAs.

As a side-effect we can drop the explicit dma-coherent property definition
from the particular device schemas. Currently it concerns the Broadcom
SATA AHCI controller only.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changelog v2:
- This is a new patch created after rebasing v1 onto the 5.18-rc3 kernel.

Changelog v4:
- Move the dma-coherent property to the sata-common.yaml schema instead
  of removing it.
- Remove the Hannes' rb tag.
---
 Documentation/devicetree/bindings/ata/ahci-platform.yaml  | 2 --
 Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml | 2 --
 Documentation/devicetree/bindings/ata/sata-common.yaml    | 2 ++
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/ata/ahci-platform.yaml b/Documentation/devicetree/bindings/ata/ahci-platform.yaml
index c146ab8e14e5..9304e4731965 100644
--- a/Documentation/devicetree/bindings/ata/ahci-platform.yaml
+++ b/Documentation/devicetree/bindings/ata/ahci-platform.yaml
@@ -87,8 +87,6 @@ properties:
     description:
       regulator for AHCI controller
 
-  dma-coherent: true
-
   phy-supply:
     description:
       regulator for PHY power
diff --git a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
index 235a93ac86b0..4ee74df8e58a 100644
--- a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
+++ b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
@@ -41,8 +41,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  dma-coherent: true
-
 if:
   properties:
     compatible:
diff --git a/Documentation/devicetree/bindings/ata/sata-common.yaml b/Documentation/devicetree/bindings/ata/sata-common.yaml
index 7ac77b1c5850..cb88d3e25e73 100644
--- a/Documentation/devicetree/bindings/ata/sata-common.yaml
+++ b/Documentation/devicetree/bindings/ata/sata-common.yaml
@@ -31,6 +31,8 @@ properties:
   "#size-cells":
     const: 0
 
+  dma-coherent: true
+
 patternProperties:
   "^sata-port@[0-9a-e]$":
     description: |
-- 
2.37.2

