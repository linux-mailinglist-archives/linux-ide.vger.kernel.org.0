Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2024860F17C
	for <lists+linux-ide@lfdr.de>; Thu, 27 Oct 2022 09:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234604AbiJ0Hur (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 27 Oct 2022 03:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234105AbiJ0Hug (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 27 Oct 2022 03:50:36 -0400
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87F3431ED8
        for <linux-ide@vger.kernel.org>; Thu, 27 Oct 2022 00:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1666857035; x=1698393035;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C5yJyhePYxsNYU/KxjGPb37qYT2kTpfWoe11NGqOEYs=;
  b=H8hgaWR+i+cuAAbKnoM6twExWCL4z7T4ZrB5emTOe4cWKGueRDzCLRuj
   ke7teikXwRvOTopdO1k8i5OA8JhrWjnRUbxFCeb/xvVW0uf7TRotPSn79
   CRT3mWwkd4PmBlxSxtf58QjQfuXGARqyUKPOTOKzNKkv2o8YMdW+2RvPH
   tA2PtzBRWo2n1SZ6zK600lgVlDoRXNQrIZ1XbSG5Mk8cthk45aR5QMC+O
   H2ESM+cob/GxQ5BdnQmbQCZ07PpYxxLcLGZEJKL5RLH9KbOV1uUqlsEGu
   0YC14B8R4BM7yzSJot7PI9HkW1CgSQAqiwhRycVp2iCg93fyplxc7ofe4
   A==;
X-IronPort-AV: E=Sophos;i="5.95,217,1661788800"; 
   d="scan'208";a="214853400"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 27 Oct 2022 15:50:32 +0800
IronPort-SDR: KoCdwhRGL7XVcTlY19urfWub7CtgUBPMwVxUApK+gV6CPS5qYakXbNtxf8oXt2y1UY7mcNWHhI
 msze7AH5+oRva+t5J4CHZFSP0Pp2BBbxJxv75U3t4rx0HERiBZfXOVttx51Z8gvx7On0XhUPr7
 Xh0C/cBow0cidY4KQpx7a5m1ybiAHHqN96Vr/902eByh21KWaXyPIGSYL20ZYeEXWLpmgwKtv5
 xRuich1cms2uli6kNxc906xmALCHMpGL6ANYIsSQ1OulnPu9jbKqWjCtisbEJKpf6EAVgatH3u
 pkcNNfQYQ5hQ4Km43s0Clrry
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Oct 2022 00:09:53 -0700
IronPort-SDR: VFDzwpmPZQ7TICK9XJrm6hqEkidRSWswspYrAV0kWXFRFz+p12FusWEAmvxP18/wh/qN9udoDW
 00h/oHjelD3Cr9JvCimyb0s9pWk62PM66OhEYB/mEPQHcvbM+sMmKYn5TSEPVWc/o9Yp3h86vX
 xRh6JTO1dijuYITQd/OkpVgxdxeW9gAQiS0pX2mhtvjnflJSJwnevujJT+W1nfvdG3O3tV3Ynb
 Jpx0VnfwjTTEz/MOvASwtkD3NKTEYTzuEj/ohnxaVKMMhSLsCC3NwNcFFju4RBr85DSUV5j83U
 QAc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Oct 2022 00:50:33 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MydBw4NvYz1Rwrq
        for <linux-ide@vger.kernel.org>; Thu, 27 Oct 2022 00:50:32 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1666857032; x=1669449033; bh=C5yJyhePYxsNYU/Kxj
        GPb37qYT2kTpfWoe11NGqOEYs=; b=lvCQSmZZkCEGRV2a5dCmJrxaK4p2cW/JSB
        Mfn5ljlu2NuoItJaCc55nZmoHp3GIN6wNdnCcFr2WA0huNV0+dXkV83f7f5zjKZr
        ppjryvdlSfOFhTjXM3QuqcS5EAEPjNJ1lsQ4tZJtdjjErEpvlTOj53/dyhky1baF
        nxU2BKepNKdf9feFllRlW+1JODUuXeHb2uBAYgmFWBL9qMpJKRDNLE6Jz5iItAuI
        AH6NxceVt3mYLbfNetpBtE0gKJLIkhKUIXkGkzlpPTX7MnP4pLIgP4xiCtju3DM7
        vdbv6gykxw0p9s7O7gr9s0HZH1FYvntgRddks3B3LXWW+t2ZgTrw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id UFpLAxVvG30I for <linux-ide@vger.kernel.org>;
        Thu, 27 Oct 2022 00:50:32 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MydBv4WXTz1RvLy;
        Thu, 27 Oct 2022 00:50:31 -0700 (PDT)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org,
        "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>
Cc:     Hannes Reinecke <hare@suse.de>
Subject: [PATCH v3 4/6] ata: libata: Fix FUA handling in ata_build_rw_tf()
Date:   Thu, 27 Oct 2022 16:50:24 +0900
Message-Id: <20221027075026.240017-5-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027075026.240017-1-damien.lemoal@opensource.wdc.com>
References: <20221027075026.240017-1-damien.lemoal@opensource.wdc.com>
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

If a user issues a write command with the FUA bit set for a device with
NCQ support disabled (that is, the device queue depth was set to 1), the
LBA 48 command WRITE DMA FUA EXT must be used. However,
ata_build_rw_tf() ignores this and first test if LBA 28 can be used.
That is, for small FUA writes at low LBAs, ata_rwcmd_protocol() will
cause the write to fail.

Fix this by preventing the use of LBA 28 for any FUA write request.
While at it, also early test if the request is a FUA read and fail these
requests for the NCQ-disabled case instead of relying on
ata_rwcmd_protocol() returning an error.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 drivers/ata/libata-core.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 81b20ffb1554..fea06f41f371 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -725,9 +725,21 @@ int ata_build_rw_tf(struct ata_queued_cmd *qc, u64 b=
lock, u32 n_block,
 		    class =3D=3D IOPRIO_CLASS_RT)
 			tf->hob_nsect |=3D ATA_PRIO_HIGH << ATA_SHIFT_PRIO;
 	} else if (dev->flags & ATA_DFLAG_LBA) {
+		bool lba28_ok;
+
+		if (tf->flags & ATA_TFLAG_FUA) {
+			/* FUA reads are not defined */
+			if (!(tf->flags & ATA_TFLAG_WRITE))
+				return -EINVAL;
+			/* We need LBA48 / WRITE DMA FUA EXT for FUA writes */
+			lba28_ok =3D false;
+		} else {
+			lba28_ok =3D lba_28_ok(block, n_block);
+		}
+
 		tf->flags |=3D ATA_TFLAG_LBA;
=20
-		if (lba_28_ok(block, n_block)) {
+		if (lba28_ok) {
 			/* use LBA28 */
 			tf->device |=3D (block >> 24) & 0xf;
 		} else if (lba_48_ok(block, n_block)) {
@@ -742,9 +754,10 @@ int ata_build_rw_tf(struct ata_queued_cmd *qc, u64 b=
lock, u32 n_block,
 			tf->hob_lbah =3D (block >> 40) & 0xff;
 			tf->hob_lbam =3D (block >> 32) & 0xff;
 			tf->hob_lbal =3D (block >> 24) & 0xff;
-		} else
+		} else {
 			/* request too large even for LBA48 */
 			return -ERANGE;
+		}
=20
 		if (unlikely(!ata_set_rwcmd_protocol(dev, tf)))
 			return -EINVAL;
--=20
2.37.3

