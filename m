Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 982115240BF
	for <lists+linux-ide@lfdr.de>; Thu, 12 May 2022 01:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349175AbiEKXTA (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 11 May 2022 19:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349159AbiEKXS5 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 11 May 2022 19:18:57 -0400
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com [87.245.175.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D4BAC18AABB;
        Wed, 11 May 2022 16:18:29 -0700 (PDT)
Received: from mail.baikalelectronics.ru (unknown [192.168.51.25])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 99C9ABBF;
        Thu, 12 May 2022 02:19:14 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.ru 99C9ABBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baikalelectronics.ru; s=mail; t=1652311154;
        bh=oH7lfkiEYXF2C7OEv0pADf3awSH8hsOXvowsTPSKNLA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References:From;
        b=gPiW5hE3R095SmqX+nL20u14WSh95gs8dvA2ssxH8Jau9dbucdemg3V4FJiZC8b42
         BhyzQxrPEcjGvafdSfRna6PIvKSslcLndjEq+hcqFHBK0q2TjoH8mygTI1mDK2Wo9a
         hqCnwBS8d75rKLwg3vDa3uhXu0kKGUB/+0x2mPTA=
Received: from localhost (192.168.53.207) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 12 May 2022 02:18:27 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jens Axboe <axboe@kernel.dk>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>, <linux-ide@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 11/23] ata: libahci_platform: Introduce reset assertion/deassertion methods
Date:   Thu, 12 May 2022 02:17:58 +0300
Message-ID: <20220511231810.4928-12-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20220511231810.4928-1-Sergey.Semin@baikalelectronics.ru>
References: <20220511231810.4928-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Currently the ACHI-platform library supports only the assert and deassert
reset signals and ignores the platforms with self-deasserting reset lines.
That prone to having the platforms with self-deasserting reset method
misbehaviour when it comes to resuming from sleep state after the clocks
have been fully disabled. For such cases the controller needs to be fully
reset all over after the reference clocks are enabled and stable,
otherwise the controller state machine might be in an undetermined state.

The best solution would be to auto-detect which reset method is supported
by the particular platform and use it implicitly in the framework of the
ahci_platform_enable_resources()/ahci_platform_disable_resources()
methods. Alas it can't be implemented due to the AHCI-platform library
already supporting the shared reset control lines. As [1] says in such
case we have to use only one of the next methods:
+ reset_control_assert()/reset_control_deassert();
+ reset_control_reset()/reset_control_rearm().
If the driver had an exclusive control over the reset lines we could have
been able to manipulate the lines with no much limitation and just used
the combination of the methods above to cover all the possible
reset-control cases. Since the shared reset control has already been
advertised and couldn't be changed with no risk to breaking the platforms
relying on it, we have no choice but to make the platform drivers to
determine which reset methods the platform reset system supports.

In order to implement both types of reset control support we suggest to
introduce the new AHCI-platform flag: AHCI_PLATFORM_RST_TRIGGER, which
when passed to the ahci_platform_get_resources() method together with the
AHCI_PLATFORM_GET_RESETS flag will indicate that the reset lines are
self-deasserting thus the reset_control_reset()/reset_control_rearm() will
be used to control the reset state. Otherwise the
reset_control_deassert()/reset_control_assert() methods will be utilized.

[1] Documentation/driver-api/reset.rst

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Changelog v2:
- Convert the ahci_platform_assert_rsts() method to returning int status
  (@Damien).
- Fix some grammar mistakes in the ahci_platform_deassert_rsts() doc
  (@Damien).
---
 drivers/ata/ahci.h             |  1 +
 drivers/ata/libahci_platform.c | 50 ++++++++++++++++++++++++++++++----
 include/linux/ahci_platform.h  |  5 +++-
 3 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/drivers/ata/ahci.h b/drivers/ata/ahci.h
index c3770a19781b..7d834deefeb9 100644
--- a/drivers/ata/ahci.h
+++ b/drivers/ata/ahci.h
@@ -340,6 +340,7 @@ struct ahci_host_priv {
 	bool			got_runtime_pm; /* Did we do pm_runtime_get? */
 	unsigned int		n_clks;
 	struct clk_bulk_data	*clks;		/* Optional */
+	unsigned int		f_rsts;
 	struct reset_control	*rsts;		/* Optional */
 	struct regulator	**target_pwrs;	/* Optional */
 	struct regulator	*ahci_regulator;/* Optional */
diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platform.c
index f7f9cac10cb1..f5ee2f9d014b 100644
--- a/drivers/ata/libahci_platform.c
+++ b/drivers/ata/libahci_platform.c
@@ -150,6 +150,44 @@ void ahci_platform_disable_clks(struct ahci_host_priv *hpriv)
 }
 EXPORT_SYMBOL_GPL(ahci_platform_disable_clks);
 
+/**
+ * ahci_platform_deassert_rsts - Deassert/trigger platform resets
+ * @hpriv: host private area to store config values
+ *
+ * This function deasserts or triggers all the reset lines found for
+ * the AHCI device.
+ *
+ * RETURNS:
+ * 0 on success otherwise a negative error code
+ */
+int ahci_platform_deassert_rsts(struct ahci_host_priv *hpriv)
+{
+	if (hpriv->f_rsts & AHCI_PLATFORM_RST_TRIGGER)
+		return reset_control_reset(hpriv->rsts);
+
+	return reset_control_deassert(hpriv->rsts);
+}
+EXPORT_SYMBOL_GPL(ahci_platform_deassert_rsts);
+
+/**
+ * ahci_platform_assert_rsts - Assert/rearm platform resets
+ * @hpriv: host private area to store config values
+ *
+ * This function asserts or rearms (for self-deasserting resets) all
+ * the reset controls found for the AHCI device.
+ *
+ * RETURNS:
+ * 0 on success otherwise a negative error code
+ */
+int ahci_platform_assert_rsts(struct ahci_host_priv *hpriv)
+{
+	if (hpriv->f_rsts & AHCI_PLATFORM_RST_TRIGGER)
+		return reset_control_rearm(hpriv->rsts);
+
+	return reset_control_assert(hpriv->rsts);
+}
+EXPORT_SYMBOL_GPL(ahci_platform_assert_rsts);
+
 /**
  * ahci_platform_enable_regulators - Enable regulators
  * @hpriv: host private area to store config values
@@ -247,18 +285,18 @@ int ahci_platform_enable_resources(struct ahci_host_priv *hpriv)
 	if (rc)
 		goto disable_regulator;
 
-	rc = reset_control_deassert(hpriv->rsts);
+	rc = ahci_platform_deassert_rsts(hpriv);
 	if (rc)
 		goto disable_clks;
 
 	rc = ahci_platform_enable_phys(hpriv);
 	if (rc)
-		goto disable_resets;
+		goto disable_rsts;
 
 	return 0;
 
-disable_resets:
-	reset_control_assert(hpriv->rsts);
+disable_rsts:
+	ahci_platform_assert_rsts(hpriv);
 
 disable_clks:
 	ahci_platform_disable_clks(hpriv);
@@ -285,7 +323,7 @@ void ahci_platform_disable_resources(struct ahci_host_priv *hpriv)
 {
 	ahci_platform_disable_phys(hpriv);
 
-	reset_control_assert(hpriv->rsts);
+	ahci_platform_assert_rsts(hpriv);
 
 	ahci_platform_disable_clks(hpriv);
 
@@ -478,6 +516,8 @@ struct ahci_host_priv *ahci_platform_get_resources(struct platform_device *pdev,
 			rc = PTR_ERR(hpriv->rsts);
 			goto err_out;
 		}
+
+		hpriv->f_rsts = flags & AHCI_PLATFORM_RST_TRIGGER;
 	}
 
 	/*
diff --git a/include/linux/ahci_platform.h b/include/linux/ahci_platform.h
index fd964e6a68d6..3418980b0341 100644
--- a/include/linux/ahci_platform.h
+++ b/include/linux/ahci_platform.h
@@ -26,6 +26,8 @@ struct clk *
 ahci_platform_find_clk(struct ahci_host_priv *hpriv, const char *con_id);
 int ahci_platform_enable_clks(struct ahci_host_priv *hpriv);
 void ahci_platform_disable_clks(struct ahci_host_priv *hpriv);
+int ahci_platform_deassert_rsts(struct ahci_host_priv *hpriv);
+int ahci_platform_assert_rsts(struct ahci_host_priv *hpriv);
 int ahci_platform_enable_regulators(struct ahci_host_priv *hpriv);
 void ahci_platform_disable_regulators(struct ahci_host_priv *hpriv);
 int ahci_platform_enable_resources(struct ahci_host_priv *hpriv);
@@ -44,6 +46,7 @@ int ahci_platform_resume_host(struct device *dev);
 int ahci_platform_suspend(struct device *dev);
 int ahci_platform_resume(struct device *dev);
 
-#define AHCI_PLATFORM_GET_RESETS	0x01
+#define AHCI_PLATFORM_GET_RESETS	BIT(0)
+#define AHCI_PLATFORM_RST_TRIGGER	BIT(1)
 
 #endif /* _AHCI_PLATFORM_H */
-- 
2.35.1

