Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C92483EC5
	for <lists+linux-ide@lfdr.de>; Tue,  4 Jan 2022 10:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbiADJFS (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 4 Jan 2022 04:05:18 -0500
Received: from rap-us.hgst.com ([199.255.44.250]:39134 "EHLO
        usg-ed-osssrv.wdc.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229917AbiADJFQ (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 4 Jan 2022 04:05:16 -0500
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JSmsm15wHz1VSkc
        for <linux-ide@vger.kernel.org>; Tue,  4 Jan 2022 01:05:16 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1641287115; x=1643879116; bh=SCvkBYdKfuGT2m+IA4
        iyaRLSez8GFuNXeAdrXDqLwwM=; b=L2mr8v53+JuchXFmAph5+3BkjxlW2iAqyW
        03HXqJhMWG/DS8ii3jH4xs3ERnQHxNOv4O1lMieIsqPG6rVnlynV5xN5jw5xBU/Y
        Y5Pgoajsqktvo79+9CaPmYk+S+IQterrvv4yS6XcW1D49Ics+fH4iTwNRGrpc3Pp
        2QdWVGX5vRNE8C93/W54N+Oa+P3OtIuVTag6IDbc7kFcEGNnL3ZFG91t5bpAtgAS
        /Btni1TqKm/bTRakOHiHtBzSLzNhZQHujhh6PhrXXfuWM5S2Ixgd0UrQtaiCvPMp
        ciUkEJaV3/aYmWvqzL1seG8mQDZZMs574x9u3qDGneVJEEi558lA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Z24EOWu8YjdH for <linux-ide@vger.kernel.org>;
        Tue,  4 Jan 2022 01:05:15 -0800 (PST)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JSmsl3cVnz1VSjC
        for <linux-ide@vger.kernel.org>; Tue,  4 Jan 2022 01:05:15 -0800 (PST)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org
Subject: [PATCH 09/21] ata: ahci_tegra: add compile test support
Date:   Tue,  4 Jan 2022 18:04:56 +0900
Message-Id: <20220104090508.1592589-10-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104090508.1592589-1-damien.lemoal@opensource.wdc.com>
References: <20220104090508.1592589-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Add Kconfig dependendy on COMPILE_TEST to allow compile tests with
configs that do not enable ARCH_TEGRA.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 drivers/ata/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index db3f65ae1ed5..9def63c7e9ad 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -263,7 +263,7 @@ config AHCI_SUNXI
=20
 config AHCI_TEGRA
 	tristate "NVIDIA Tegra AHCI SATA support"
-	depends on ARCH_TEGRA
+	depends on ARCH_TEGRA || COMPILE_TEST
 	select SATA_HOST
 	help
 	  This option enables support for the NVIDIA Tegra SoC's
--=20
2.31.1

