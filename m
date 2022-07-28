Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42F0A583D09
	for <lists+linux-ide@lfdr.de>; Thu, 28 Jul 2022 13:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236603AbiG1LTo (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 28 Jul 2022 07:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236209AbiG1LTZ (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 28 Jul 2022 07:19:25 -0400
Received: from mail.baikalelectronics.com (unknown [87.245.175.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4663D67167;
        Thu, 28 Jul 2022 04:19:23 -0700 (PDT)
Received: from mail (mail.baikal.int [192.168.51.25])
        by mail.baikalelectronics.com (Postfix) with ESMTP id BD17216D4;
        Thu, 28 Jul 2022 14:21:42 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.com BD17216D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baikalelectronics.ru; s=mail; t=1659007302;
        bh=cwjTY+UXbYCa95/dq1KpC5+URj+jwo1L4bVykF4JcuI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References:From;
        b=DSnIkPYNU4qrE4k7eAwl2CMky7QwCgRh0MzmI1TGjPldyht4RMjMSpWtOdQxFa+I9
         FNTgUqMt8DLyw76XL+NFDreMkdZHfOocrDJ4RDdVGiYEgYYeJVaXIMVxQV3/Gh5MGT
         zDb+4NsnyCZd0VG8iT1hcPzQ+AkEq0yD6IURlTvE=
Received: from localhost (192.168.53.207) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 28 Jul 2022 14:19:17 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>, <linux-ide@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH RESEND v6 06/23] ata: libahci_platform: Convert to using platform devm-ioremap methods
Date:   Thu, 28 Jul 2022 14:18:47 +0300
Message-ID: <20220728111905.12427-7-Sergey.Semin@baikalelectronics.ru>
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

Currently the IOMEM AHCI registers space is mapped by means of the
two functions invocation: platform_get_resource() is used to get the very
first memory resource and devm_ioremap_resource() is called to remap that
resource. Device-managed kernel API provides a handy wrapper to perform
the same in single function call: devm_platform_ioremap_resource().

While at it seeing many AHCI platform drivers rely on having the AHCI CSR
space marked with "ahci" name let's first try to find and remap the CSR
IO-mem with that name and only if it fails fallback to getting the very
first registers space platform resource.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Hannes Reinecke <hare@suse.de>

---

Changelog v2:
- Check whether there is "ahci" reg resource before using the
  devm_platform_ioremap_resource_byname() method in order to prevent a
  false error message printed in the log (@Damien)
- Slightly update the patch title due to the change above and to be more
  specific about what the platform device managed methods are utilized
  for.
---
 drivers/ata/libahci_platform.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platform.c
index 32495ae96567..1e9e825d6cc5 100644
--- a/drivers/ata/libahci_platform.c
+++ b/drivers/ata/libahci_platform.c
@@ -402,8 +402,14 @@ struct ahci_host_priv *ahci_platform_get_resources(struct platform_device *pdev,
 
 	devres_add(dev, hpriv);
 
-	hpriv->mmio = devm_ioremap_resource(dev,
-			      platform_get_resource(pdev, IORESOURCE_MEM, 0));
+	/*
+	 * If the DT provided an "ahci" named resource, use it. Otherwise,
+	 * fallback to using the default first resource for the device node.
+	 */
+	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "ahci"))
+		hpriv->mmio = devm_platform_ioremap_resource_byname(pdev, "ahci");
+	else
+		hpriv->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hpriv->mmio)) {
 		rc = PTR_ERR(hpriv->mmio);
 		goto err_out;
-- 
2.35.1

