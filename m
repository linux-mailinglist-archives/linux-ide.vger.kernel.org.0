Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E67C612EF4
	for <lists+linux-ide@lfdr.de>; Mon, 31 Oct 2022 03:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbiJaC07 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 30 Oct 2022 22:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiJaC0y (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 30 Oct 2022 22:26:54 -0400
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFE55FB7
        for <linux-ide@vger.kernel.org>; Sun, 30 Oct 2022 19:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1667183214; x=1698719214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x509jXSJnwObswBV4jpE+8MByFyOsaKwegxIAG6rrnw=;
  b=U2WEc/kDHIocmCi+TT6SucVfhUulx8rcxeUpsv7jMFcyJuq6Nncs0WxI
   rw0GFZX22+7vLg9LOQLFQwUUe4TApsAcigcPSNtxaIQwTcEZuvGKtrspO
   UYh+baYBU0g8nTA9UUXQEPAkHX+kE5xXQdYZYTAlQcHnf5h4Je8jQV32I
   nCBAl+m4b5T5GaJH+QG0Xcme4uQx3595k/a5pgrmkoozaKz0cSpY9Z4ld
   x0s71YqEXhpg8VRKONLwInkRbmwMVEe18nRjFvlTwVnuk18PqloyrTvMK
   MQgyOA+yOmBeEuK1ua5aMo3cVXdHhJMY0dqwfkO91FxlR0IbX05wGiJ9g
   g==;
X-IronPort-AV: E=Sophos;i="5.95,227,1661788800"; 
   d="scan'208";a="215446862"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 31 Oct 2022 10:26:53 +0800
IronPort-SDR: l0UInz6i1x5MlCS52ZpwtOcS+Brg+gQPTIVpXGqesjiHuz/GzdMfxSZy6BguXP1zHDGzazWExb
 aEYSLdd/sO+C8bybiOjjRTmFypWwFeDdGXuHg0WsShuTFdnKzZISupDH8KSLwRLNBop2XaD9HT
 RIhVeX9rw8Gkj/glwhEEc8J+MUFKZO6Y3LUq5kJoxcxTDbus6tVD9bPXCbRGSPRch85U1j7gnR
 T0zer6SaSRol8rIyiGF/Jnx86Tb/RJylqMBqeIEvYJnnjcdf8LRXO4a2C1+vrjXxhxkK1agRL4
 HRAfbaaZW2Ys/BV1j0AYL6f2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Oct 2022 18:46:09 -0700
IronPort-SDR: gPVC/fx3FjvJdOZBEAVwczdO9pjY//WRt68ZrGrubZzfzm/jCvboe/HGdwRlrp4NpCmLSrANAl
 JJF+Lr55eIznAUFCFV0lI34DMYowHCVyEJEe96GozOyJoYRzB5xNNKhP1I5SBF6IXuX+edpIC4
 6JcS47bFF0p0hMTthJoE/97wHO/cX4YBZmuRZuW1a91g5j5yHzA9gPNAfyv76H7nQzhgDO0chZ
 vx6Jc05iG1HGSH7fIgyHgZE5EVqVkAo2xdnTplDrbJBW0x81J2Vl+vuHftEBPXh4NCtjj36k2i
 Gdk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Oct 2022 19:26:53 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4N0xqc6sP3z1Rwrq
        for <linux-ide@vger.kernel.org>; Sun, 30 Oct 2022 19:26:52 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1667183212; x=1669775213; bh=x509jXSJnwObswBV4j
        pE+8MByFyOsaKwegxIAG6rrnw=; b=YAFV5fp8lJOT0VeNeX9BA9njCCn+gKbWzE
        Ffky99BX1JpbHVdf+8WLdA9mgjAIkUhYEKXE8b4LF+C/xGbf1hOWueVC0JXKbMIW
        6rA0BFsxZ+J2zSe3F9UNJKcYCLkvXfnBksCuDiobdsvIL0XxMprVOexZoKfjk3H4
        WravlJWJWi10YLKck5t0ZyYT2iQdBG1joj6di/ZbOaGr/R25c/d4zIAYdzQZt688
        gvKCnXzm75enss1+LIMh4acDxSebiNAdysTyIIHzOw+ZDRg7bc5Cxjhf2ZkG+BCf
        Y3jMyWz1JwAltD+Wlq9oE38DvlaolHHgX8iN+WKAxTH+8nyUAXHA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 4a8NoOeiy96p for <linux-ide@vger.kernel.org>;
        Sun, 30 Oct 2022 19:26:52 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4N0xqZ0PWXz1RvLy;
        Sun, 30 Oct 2022 19:26:49 -0700 (PDT)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org, linux-block@vger.kernel.org,
        Jens Axboe <axboe@kernel.dk>
Cc:     "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Hannes Reinecke <hare@suse.de>
Subject: [PATCH v4 2/7] ata: libata: Introduce ata_ncq_supported()
Date:   Mon, 31 Oct 2022 11:26:37 +0900
Message-Id: <20221031022642.352794-3-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031022642.352794-1-damien.lemoal@opensource.wdc.com>
References: <20221031022642.352794-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Introduce the inline helper function ata_ncq_supported() to test if a
device supports NCQ commands. The function ata_ncq_enabled() is also
rewritten using this new helper function.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 include/linux/libata.h | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/include/linux/libata.h b/include/linux/libata.h
index af4953b95f76..58651f565b36 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -1690,21 +1690,35 @@ extern struct ata_device *ata_dev_next(struct ata=
_device *dev,
 	     (dev) =3D ata_dev_next((dev), (link), ATA_DITER_##mode))
=20
 /**
- *	ata_ncq_enabled - Test whether NCQ is enabled
- *	@dev: ATA device to test for
+ *	ata_ncq_supported - Test whether NCQ is supported
+ *	@dev: ATA device to test
  *
  *	LOCKING:
  *	spin_lock_irqsave(host lock)
  *
  *	RETURNS:
- *	1 if NCQ is enabled for @dev, 0 otherwise.
+ *	true if @dev supports NCQ, false otherwise.
  */
-static inline int ata_ncq_enabled(struct ata_device *dev)
+static inline bool ata_ncq_supported(struct ata_device *dev)
 {
 	if (!IS_ENABLED(CONFIG_SATA_HOST))
 		return 0;
-	return (dev->flags & (ATA_DFLAG_PIO | ATA_DFLAG_NCQ_OFF |
-			      ATA_DFLAG_NCQ)) =3D=3D ATA_DFLAG_NCQ;
+	return (dev->flags & (ATA_DFLAG_PIO | ATA_DFLAG_NCQ)) =3D=3D ATA_DFLAG_=
NCQ;
+}
+
+/**
+ *	ata_ncq_enabled - Test whether NCQ is enabled
+ *	@dev: ATA device to test
+ *
+ *	LOCKING:
+ *	spin_lock_irqsave(host lock)
+ *
+ *	RETURNS:
+ *	true if NCQ is enabled for @dev, false otherwise.
+ */
+static inline bool ata_ncq_enabled(struct ata_device *dev)
+{
+	return ata_ncq_supported(dev) && !(dev->flags & ATA_DFLAG_NCQ_OFF);
 }
=20
 static inline bool ata_fpdma_dsm_supported(struct ata_device *dev)
--=20
2.38.1

