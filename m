Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7EF76005BC
	for <lists+linux-ide@lfdr.de>; Mon, 17 Oct 2022 05:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbiJQDWp (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 16 Oct 2022 23:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232193AbiJQDWX (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 16 Oct 2022 23:22:23 -0400
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5021F4DB0D
        for <linux-ide@vger.kernel.org>; Sun, 16 Oct 2022 20:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1665976942; x=1697512942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3O2DopF+MAK2Mx8ruuGInQ2SFsIiGXlyPCLzDG43pXY=;
  b=Nmp6mcUo2E0Om8i8fi8CkV7Ig5SQ/mqtpAWi/rN7uUB+Bx06TNznwsCk
   tzDx5E6Vz4Umg8x2tfPDXv5v354PxdEfoImzls9Y1K3Icvmo+SLSd/nJP
   BEvaVjiUewKlgdHGPQchPgeWg0fwM4WVQRyMiu6uCk9fvN4c0s61KZppN
   QLFPU+k9Iln+vfOEKM5KQz3azpNKWuiu/UdAqKK700bbPhgRfEaLj6aK2
   H3CPxMe3BeONw98i/fP/iUSy83CW7wV/6EZ1nJLocQrHgk4RGNf87NmDe
   SaqtLXOPDPOQv7QzBInDFSFRdktr8Kk4qSXWcvJGSDBuzMrAkU+s/qU0w
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; 
   d="scan'208";a="213974803"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 11:22:19 +0800
IronPort-SDR: 6ROkKT314a7hQ+RSeiMN38/+20YqkKO0ZSrRo5bY8NCx1ZOLGxvedWp8UXFDR2LFK3xuvCHQrk
 DOLMOoPNGkwLvWFh6tXDVCFlnFrM9FbYsUMp4YEZC18toD3N4DzzumyaAtVjg8Qg0sCRDajzt2
 zESO0AoPB51lVCXIIzkXd2YQmElxpFoJp01Gr3F2uaLUicumbzVXLwxJuJKTrWh4i0+ATU6ycV
 FI21djqfJGhYGwSV7YNtOjfNbRI9lssqjtaN0JAjBnMHbyoK1mDRtaJ9bHZk50M1I1r0se6xKN
 li0COonay5qLfJRqxXz2fL1q
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2022 19:41:52 -0700
IronPort-SDR: 2H9gqxn3z1Qr44jwJ9o0vbICKQ0o5FHdc1YTiebG4j66Du6Whth20MRlIwzekpG45gBf65LSzg
 xw9LDtdNpZ4WPbRcEsKxch0jPksJ5E4PLCXgFZ9pb3P1VCQZvzrwBK241fzaBmOoLJxGIqAEtZ
 1bOcLWx72WG+GkFe5VVbIzfhygdSQwDfCuwcOtYyY5snJwWZzM6MgAmqBEuKCg6qBtJI6MHGwr
 VJxFsx+9LYx/KWIiRC6vK3HDLIn5D/n8860RpPCl2p9v5BOhbA3iCY+72Mj6MjzB6TB8nx/YIT
 h+0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2022 20:22:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MrMk3189rz1Rwtm
        for <linux-ide@vger.kernel.org>; Sun, 16 Oct 2022 20:22:19 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1665976938; x=1668568939; bh=3O2DopF+MAK2Mx8ruu
        GInQ2SFsIiGXlyPCLzDG43pXY=; b=RCynmvaL5zaWltinvB5z52t6rBCY9W5gCi
        I/WilDl2DGdnhoXb2YGFg5XIov6R+Ol0M6DceWpYVEH2Tv1IuBzay406j/ynho5y
        nV/DiJh8OIHodf5bQSBmYOWs1YzHXjqmP1jBk4VTjj3KBtq7wSo76FAjBBtT6sbb
        80b4VARwiTG7RBJEohD55a0aiocQGPxThs+XhoxfpHzPrnfy4izukCbLh8lb2K1A
        9d3r4bv6IS/NAsXcUEeEnNjHm34zgIICA4ZmdLej0DJZWuMW7D4CcMnNPFzcCKQ2
        LwEWZnqct5bx/RE5OjD3Uj0gfpabPCE/LlhBfIuypslx/2mhu9bA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id QQe41IZzvfc2 for <linux-ide@vger.kernel.org>;
        Sun, 16 Oct 2022 20:22:18 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MrMk123nCz1RvLy;
        Sun, 16 Oct 2022 20:22:17 -0700 (PDT)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        linux-renesas-soc@vger.kernel.org,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 6/6] ata: ahci_qoriq: Fix compilation warning
Date:   Mon, 17 Oct 2022 12:22:05 +0900
Message-Id: <20221017032205.2210188-7-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017032205.2210188-1-damien.lemoal@opensource.wdc.com>
References: <20221017032205.2210188-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

When compiling with clang and W=3D1, the following warning is generated:

drivers/ata/ahci_qoriq.c:283:22: error: cast to smaller integer type
'enum ahci_qoriq_type' from 'const void *'
[-Werror,-Wvoid-pointer-to-enum-cast]
                qoriq_priv->type =3D (enum ahci_qoriq_type)of_id->data;
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix this by using a cast to unsigned long to match the "void *" type
size of of_id->data.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 drivers/ata/ahci_qoriq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/ahci_qoriq.c b/drivers/ata/ahci_qoriq.c
index 6cd61842ad48..9cf9bf36a874 100644
--- a/drivers/ata/ahci_qoriq.c
+++ b/drivers/ata/ahci_qoriq.c
@@ -280,7 +280,7 @@ static int ahci_qoriq_probe(struct platform_device *p=
dev)
 		return -ENOMEM;
=20
 	if (of_id)
-		qoriq_priv->type =3D (enum ahci_qoriq_type)of_id->data;
+		qoriq_priv->type =3D (unsigned long)of_id->data;
 	else
 		qoriq_priv->type =3D (enum ahci_qoriq_type)acpi_id->driver_data;
=20
--=20
2.37.3

