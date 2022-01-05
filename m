Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A225484D58
	for <lists+linux-ide@lfdr.de>; Wed,  5 Jan 2022 06:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237446AbiAEFR5 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 5 Jan 2022 00:17:57 -0500
Received: from rap-us.hgst.com ([199.255.44.250]:17649 "EHLO
        usg-ed-osssrv.wdc.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S237436AbiAEFRv (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 5 Jan 2022 00:17:51 -0500
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JTHmv27Z0z1VSkY
        for <linux-ide@vger.kernel.org>; Tue,  4 Jan 2022 21:17:51 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1641359871; x=1643951872; bh=s1yNq1LVKHCNwJnQ0S
        hnnFhL75J75rOA/Ls0ZS/fQ20=; b=EG5tKvjpHmoFDxiRg9PMuzetTr2N11A4eO
        WuPHz+26Jh99pSuJxNGJX0hDNOo/kpV2Cjl/pwW00WHLzMQXqjtFKmm8L+Gpiuvk
        6TJqzCoTXWY5thUBC+T1qBdEfgHfUULc/L4gg+1GHwYcyG6g27DAhtkRmCFyuRHM
        9K5QObNtWs43BUh93LLTz1Zhp7Nr5ni7SZ7pYwS3i11JF9kUhMP4lHKUYF886fiX
        DYeeGpJxI0DDzBBxuDcxgDYCKK8dQh6rd8gohMix8SuOSSJOexICsBwoaLqtSzzO
        Gc2IunfItD/W8E0kuwbAiG+7slbXdaleTrNC6Pi7ZzEYx994Ragw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id wx3Kgy_oftYJ for <linux-ide@vger.kernel.org>;
        Tue,  4 Jan 2022 21:17:51 -0800 (PST)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JTHmt3mM6z1VSkZ;
        Tue,  4 Jan 2022 21:17:50 -0800 (PST)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org
Cc:     Hannes Reinecke <hare@suse.de>
Subject: [PATCH v3 15/22] ata: pata_imx: add compile test support
Date:   Wed,  5 Jan 2022 14:17:28 +0900
Message-Id: <20220105051735.1871177-16-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105051735.1871177-1-damien.lemoal@opensource.wdc.com>
References: <20220105051735.1871177-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Add Kconfig dependendy on COMPILE_TEST to allow compile tests with
configs that do not enable ARCH_MXC.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index 1b18de61e8df..e4e4460cb1fe 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -765,7 +765,7 @@ config PATA_ICSIDE
=20
 config PATA_IMX
 	tristate "PATA support for Freescale iMX"
-	depends on ARCH_MXC
+	depends on ARCH_MXC || COMPILE_TEST
 	select PATA_TIMINGS
 	help
 	  This option enables support for the PATA host available on Freescale
--=20
2.31.1

