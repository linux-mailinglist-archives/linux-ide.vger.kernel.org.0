Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C22A484041
	for <lists+linux-ide@lfdr.de>; Tue,  4 Jan 2022 11:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbiADK6s (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 4 Jan 2022 05:58:48 -0500
Received: from rap-us.hgst.com ([199.255.44.250]:3642 "EHLO
        usg-ed-osssrv.wdc.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230097AbiADK6r (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 4 Jan 2022 05:58:47 -0500
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JSqNl4wB6z1VSkW
        for <linux-ide@vger.kernel.org>; Tue,  4 Jan 2022 02:58:47 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1641293927; x=1643885928; bh=kBJtz1rigrxYlXVUBu
        2zvTuqNDZF345Clzjqy7IR1Nw=; b=A/GbrTdyAHM0s2qjGmyzEIq+rLR5bJvY25
        nkstp3pnJ1qZvfBHkGKeJ+QPre2XP/v9lsiCbS1jlmPLCDgI7S51A70O7L37iZ0J
        SG9uKR5eDHMGV9iONYAooqA2W2W9CYjsYnzxYQTULKs2OsqkcUHU9qMY2TPDNw/u
        ulA3lC4kVkINMZ+tExfq2cktmUzq2gjEL9xQkMKp52d/rQGVQiaFNvd2RYcW9498
        FmK8y0FCFnbIvxsIvGSrjMNFu2BQpwZTlOenNKeonZOMKCj7R2uvZWZBBpK0Hhi/
        Ma88WMt5PVe5etG54ilo2uNPMGSKCWTTVEAWWdVac6AysAow965g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id lM8IhM8_atBw for <linux-ide@vger.kernel.org>;
        Tue,  4 Jan 2022 02:58:47 -0800 (PST)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JSqNk4wDZz1VSjC
        for <linux-ide@vger.kernel.org>; Tue,  4 Jan 2022 02:58:46 -0800 (PST)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org
Subject: [PATCH v2 02/22] ata: ahci_brcm: add compile test support
Date:   Tue,  4 Jan 2022 19:58:23 +0900
Message-Id: <20220104105843.1730172-3-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104105843.1730172-1-damien.lemoal@opensource.wdc.com>
References: <20220104105843.1730172-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Add Kconfig dependendy on COMPILE_TEST to allow compile tests with
configs that do not enable ARCH_BRCMSTB, BMIPS_GENERIC or ARCH_BCM_XXX.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 drivers/ata/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index 80bad7cba631..3bf38a328851 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -163,7 +163,7 @@ config SATA_AHCI_PLATFORM
 config AHCI_BRCM
 	tristate "Broadcom AHCI SATA support"
 	depends on ARCH_BRCMSTB || BMIPS_GENERIC || ARCH_BCM_NSP || \
-		   ARCH_BCM_63XX
+		   ARCH_BCM_63XX || COMPILE_TEST
 	select SATA_HOST
 	help
 	  This option enables support for the AHCI SATA3 controller found on
--=20
2.31.1

