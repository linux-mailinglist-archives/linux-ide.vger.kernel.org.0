Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3609D583D2D
	for <lists+linux-ide@lfdr.de>; Thu, 28 Jul 2022 13:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236715AbiG1LVW (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 28 Jul 2022 07:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236005AbiG1LTs (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 28 Jul 2022 07:19:48 -0400
Received: from mail.baikalelectronics.com (unknown [87.245.175.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B41066759F;
        Thu, 28 Jul 2022 04:19:28 -0700 (PDT)
Received: from mail (mail.baikal.int [192.168.51.25])
        by mail.baikalelectronics.com (Postfix) with ESMTP id DA78E16CC;
        Thu, 28 Jul 2022 14:21:48 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.com DA78E16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baikalelectronics.ru; s=mail; t=1659007308;
        bh=GmRmzWevY9P0garDpWjcm8TYUHRVAknKpAHcK4Qdzts=;
        h=From:To:CC:Subject:Date:In-Reply-To:References:From;
        b=K9pGcQQaG8IWryN/fxPebNyI1YUEOcErAObxCCus43hHo+qmu17S/lW6DSVlA+28s
         QWVFQphVsCgU88ykvliWtq5RaKQwpmd57smWhaVgXVajEdt3OKy5/mH/ZJ0/c3drao
         Xjsy5KKeQfy8Bb0MjyP1xBkHQfU1UM6kESRLBpus=
Received: from localhost (192.168.53.207) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 28 Jul 2022 14:19:23 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        <linux-ide@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH RESEND v6 11/23] dt-bindings: ata: ahci: Add platform capability properties
Date:   Thu, 28 Jul 2022 14:18:52 +0300
Message-ID: <20220728111905.12427-12-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20220728111905.12427-1-Sergey.Semin@baikalelectronics.ru>
References: <20220728111905.12427-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,T_SPF_PERMERROR
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

In case if the platform doesn't have BIOS or a comprehensive firmware
installed then the HBA capability flags will be left uninitialized. As a
good alternative we suggest to define the DT-properties with the AHCI
platform capabilities describing all the HW-init flags of the
corresponding capability register. Luckily there aren't too many of them.
SSS - Staggered Spin-up support and MPS - Mechanical Presence Switch
support determine the corresponding feature availability for the whole HBA
by means of the "hba-cap" property. Each port can have the "hba-port-cap"
property initialized indicating that the port supports some of the next
functionalities: HPCP - HotPlug capable port, MPSP - Mechanical Presence
Switch attached to a port, CPD - Cold Plug detection, ESP - External SATA
Port (eSATA), FBSCP - FIS-based switching capable port.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changelog v4:
- Fix some misspelling in the patch log.
- Convert the boolean properties to the bitfield properties. (@Rob)
- Remove Hannes' rb tag due to the patch content change.

Changelog v5:
- Dual-licese the include/dt-bindings/ata/ahci.h file. (@Rob)
---
 .../devicetree/bindings/ata/ahci-common.yaml  | 16 +++++++++++++++
 .../bindings/ata/ahci-platform.yaml           | 10 ++++++++++
 include/dt-bindings/ata/ahci.h                | 20 +++++++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 include/dt-bindings/ata/ahci.h

diff --git a/Documentation/devicetree/bindings/ata/ahci-common.yaml b/Documentation/devicetree/bindings/ata/ahci-common.yaml
index 12a97b56226f..94d72aeaad0f 100644
--- a/Documentation/devicetree/bindings/ata/ahci-common.yaml
+++ b/Documentation/devicetree/bindings/ata/ahci-common.yaml
@@ -58,6 +58,14 @@ properties:
   phy-names:
     const: sata-phy
 
+  hba-cap:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description:
+      Bitfield of the HBA generic platform capabilities like Staggered
+      Spin-up or Mechanical Presence Switch support. It can be used to
+      appropriately initialize the HWinit fields of the HBA CAP register
+      in case if the system firmware hasn't done it.
+
   ports-implemented:
     $ref: '/schemas/types.yaml#/definitions/uint32'
     description:
@@ -101,6 +109,14 @@ $defs:
       target-supply:
         description: Power regulator for SATA port target device
 
+      hba-port-cap:
+        $ref: '/schemas/types.yaml#/definitions/uint32'
+        description:
+          Bitfield of the HBA port-specific platform capabilities like Hot
+          plugging, eSATA, FIS-based Switching, etc (see AHCI specification
+          for details). It can be used to initialize the HWinit fields of
+          the PxCMD register in case if the system firmware hasn't done it.
+
     required:
       - reg
 
diff --git a/Documentation/devicetree/bindings/ata/ahci-platform.yaml b/Documentation/devicetree/bindings/ata/ahci-platform.yaml
index 15be98e0385b..e19cf9828e68 100644
--- a/Documentation/devicetree/bindings/ata/ahci-platform.yaml
+++ b/Documentation/devicetree/bindings/ata/ahci-platform.yaml
@@ -111,6 +111,8 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/berlin2q.h>
+    #include <dt-bindings/ata/ahci.h>
+
     sata@f7e90000 {
         compatible = "marvell,berlin2q-ahci", "generic-ahci";
         reg = <0xf7e90000 0x1000>;
@@ -119,15 +121,23 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
+        hba-cap = <HBA_SMPS>;
+
         sata0: sata-port@0 {
             reg = <0>;
+
             phys = <&sata_phy 0>;
             target-supply = <&reg_sata0>;
+
+            hba-port-cap = <(HBA_PORT_FBSCP | HBA_PORT_ESP)>;
         };
 
         sata1: sata-port@1 {
             reg = <1>;
+
             phys = <&sata_phy 1>;
             target-supply = <&reg_sata1>;
+
+            hba-port-cap = <(HBA_PORT_HPCP | HBA_PORT_MPSP | HBA_PORT_FBSCP)>;
         };
     };
diff --git a/include/dt-bindings/ata/ahci.h b/include/dt-bindings/ata/ahci.h
new file mode 100644
index 000000000000..77997b35612c
--- /dev/null
+++ b/include/dt-bindings/ata/ahci.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause */
+/*
+ * This header provides constants for most AHCI bindings.
+ */
+
+#ifndef _DT_BINDINGS_ATA_AHCI_H
+#define _DT_BINDINGS_ATA_AHCI_H
+
+/* Host Bus Adapter generic platform capabilities */
+#define HBA_SSS		(1 << 27)
+#define HBA_SMPS	(1 << 28)
+
+/* Host Bus Adapter port-specific platform capabilities */
+#define HBA_PORT_HPCP	(1 << 18)
+#define HBA_PORT_MPSP	(1 << 19)
+#define HBA_PORT_CPD	(1 << 20)
+#define HBA_PORT_ESP	(1 << 21)
+#define HBA_PORT_FBSCP	(1 << 22)
+
+#endif
-- 
2.35.1

