Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E91F484D57
	for <lists+linux-ide@lfdr.de>; Wed,  5 Jan 2022 06:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237438AbiAEFRv (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 5 Jan 2022 00:17:51 -0500
Received: from rap-us.hgst.com ([199.255.44.250]:47165 "EHLO
        usg-ed-osssrv.wdc.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S237436AbiAEFRu (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 5 Jan 2022 00:17:50 -0500
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JTHmt3h3Mz1VSkW
        for <linux-ide@vger.kernel.org>; Tue,  4 Jan 2022 21:17:50 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1641359870; x=1643951871; bh=ApWjs4nGLtIcwRuvbU
        q0kKARavXHG0Qi145cnmKhtvE=; b=bepVeKoMRsHPVH2v4rLgRSkDqSo4zCeGTA
        TT8YXGY+sweUsDjnBK7YSnljjOZvb/yOSNfTtAjCR/pWedS75GVVr84Yl/5m7Dsq
        KJVQ8GHdH3cMhyM28w3WnmczGskn9qOW3Hcclh6uNofZS+h47n5h9L9u6Q1umGLl
        vr//wWCZa0qMOMp3EDWG5t+7sxyNeSuo3LkYdThVElo9xLzmiRx2RXAGMql3sX7U
        mH29Q2pRyo7rADrlXuqQeAQ+wmbXwbYO9BgJLgIsTNUvcPcVaYYNDrzw2rOvBDW/
        uv3AJ9NtalfAd/vibOR6vrohLU7VoEWbEZsQOPDH1gr73xufrydA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id XIgbYZlgTgeE for <linux-ide@vger.kernel.org>;
        Tue,  4 Jan 2022 21:17:50 -0800 (PST)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JTHms5WMbz1VSkY;
        Tue,  4 Jan 2022 21:17:49 -0800 (PST)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org
Cc:     Hannes Reinecke <hare@suse.de>
Subject: [PATCH v3 14/22] ata: pata_ftide010: add compile test support
Date:   Wed,  5 Jan 2022 14:17:27 +0900
Message-Id: <20220105051735.1871177-15-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105051735.1871177-1-damien.lemoal@opensource.wdc.com>
References: <20220105051735.1871177-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Add Kconfig dependendy on COMPILE_TEST to allow compile tests with
configs that do not enable ARM.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index daf57a4e8196..1b18de61e8df 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -702,7 +702,7 @@ config PATA_EP93XX
 config PATA_FTIDE010
 	tristate "Faraday Technology FTIDE010 PATA support"
 	depends on OF
-	depends on ARM
+	depends on ARM || COMPILE_TEST
 	depends on SATA_GEMINI
 	help
 	  This option enables support for the Faraday FTIDE010
--=20
2.31.1

