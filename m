Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB3B3612EBB
	for <lists+linux-ide@lfdr.de>; Mon, 31 Oct 2022 02:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbiJaBxx (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 30 Oct 2022 21:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiJaBxl (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 30 Oct 2022 21:53:41 -0400
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C92FB9FFB
        for <linux-ide@vger.kernel.org>; Sun, 30 Oct 2022 18:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1667181220; x=1698717220;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UJ2YDLRMJY8D+U3UMEWNGFNsOs4kdiG/fA81vw5BF8c=;
  b=lTa7ktWNxgRWoilSvWAF5KxwayhNfEf/72tY63LjoAjP5RIOKVoJ0OQI
   W8cO9Tv8NElq0quXIYzd5c4/pL/TBSk+vNrHLnB7MkiJv21PP/LCU7F4e
   86H6xlgljPFNWhbeYOAZ/t4zRy9jWgzhK7vu8cNCNkQn+nAUSimvKTP9j
   R1o1y2C9WTYdmtknEEU2EMvxmZiGNsxrzw+GRDakWl6L+EkgjHeKBdVhV
   Hm2pE2/etDkCXL5CJkL/QvKcRg7WKlsI9d0Nvf+AL6VXvG7FK6H+qdkO3
   Ujia+uR2PdNg69CUbfAkhTlsfZmMhvNoTK+Q2MWr3gchgdysQ6OQu2hTS
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,227,1661788800"; 
   d="scan'208";a="213387069"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 31 Oct 2022 09:53:40 +0800
IronPort-SDR: q4lELh6Na5fRKGVcDCCF6fMSpdov0erKBQJP53ar41VY5JiYBR5BqX1Qgex1xHQFTnNoRYmzdV
 PRTcCksm0LCBQAMPzJCJg8mQRQPMphJ3R9WmAJ+8bWJhldBlBXej6XLYFLc5sKWDKPI8kbPWXd
 N1maYmkyli9gZZTlBw+tjCKIm51SjSCtdVn0R5xC5pCoAkSzf+49VzaaT/9/1FCTQVtXLMGuVf
 qI5KiyXxYQmQ1bp7PMcaM4E5EJPSeUmdBd/VxOAGnlYtvLeJHMC0mAJRNfA17ROGoj2bt3lybs
 LoRxEpYKYADm9JCeOnSduvzM
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Oct 2022 18:12:56 -0700
IronPort-SDR: mPrL/kYwUy6TSZYiByPjwW/h8dCC77ivjB41t8+qezyljyXhQLDw50VhsStEGIe9doz/bAlTZ8
 8xLdFmXK9oW+K6Xk5ahFRbjyvv69NMpAIubWf9j2Xo0ZoQS/Ic9JnCzryKnkuT8a1qwtJ8J1by
 pg96E+gKT+c8CMr3mWMrMBr2vqUAow3OT1umvMEm2rSQZTduh8taX48gtWIptx3hcihc56qY8C
 yRkwY2ynRX8OY8wuI33ujNs+0N9di2nMPzzpCUWp/atBZ9/dhQ7TN6cv5YayxozJNNy16DhQ9a
 UxA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Oct 2022 18:53:40 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4N0x5H47r5z1RwtC
        for <linux-ide@vger.kernel.org>; Sun, 30 Oct 2022 18:53:39 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1667181219; x=1669773220; bh=UJ2YDLRMJY8D+U3UME
        WNGFNsOs4kdiG/fA81vw5BF8c=; b=UNYjMawhOkNOP2gG5OPTLYYABQvZl1a2iK
        Wm7FxIwdF2L3qvcm5xLXvHbBwh3jtc08uXgTefqk8+LLD2dSrTmF8PWo3UKtMz78
        d9eixrgIKTeUsrXSLvSQS9ptu81swdZafatcwsNoW8oKgwpVHApo+9++EtbbEYfg
        /tMRikht0jte8WxA/9RCUCa4SE68Y3Y5VzV5Y0lHODeNIE40tkitvWV5RGlL/XPI
        tVwKVyK6mOy+GrSkcjVzUbs1XAZRP9J42CpY0G0BDYdh7J9SnmO3nTdNfz1iM1QE
        hueK0y0/DH254S2P0jqQ0uLQCeB6y39/H7364cFHTJnQNpQ9zqzg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Osf6v9cCqhhP for <linux-ide@vger.kernel.org>;
        Sun, 30 Oct 2022 18:53:39 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4N0x5F6m03z1RvTp;
        Sun, 30 Oct 2022 18:53:37 -0700 (PDT)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org, linux-block@vger.kernel.org,
        Jens Axboe <axboe@kernel.dk>
Cc:     "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Hannes Reinecke <hare@suse.de>
Subject: [PATCH v4 5/7] ata: libata: Fix FUA handling in ata_build_rw_tf()
Date:   Mon, 31 Oct 2022 10:53:27 +0900
Message-Id: <20221031015329.141954-6-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031015329.141954-1-damien.lemoal@opensource.wdc.com>
References: <20221031015329.141954-1-damien.lemoal@opensource.wdc.com>
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

If a user issues a write command with the FUA bit set for a device with
NCQ support disabled (that is, the device queue depth was set to 1), the
LBA 48 command WRITE DMA FUA EXT must be used. However,
ata_build_rw_tf() ignores this and first tests if LBA 28 can be used
based on the write command sector and number of blocks. That is, for
small FUA writes at low LBAs, ata_rwcmd_protocol() will cause the write
to fail.

Fix this by preventing the use of LBA 28 for any FUA write request.

Given that the WRITE MULTI FUA EXT command is marked as obsolete iin the
ATA specification since ACS-3 (published in 2013), remove the
ATA_CMD_WRITE_MULTI_FUA_EXT command from the ata_rw_cmds array.

Finally, since the block layer should never issue a FUA read
request, warn in ata_build_rw_tf() if we see such request.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 drivers/ata/libata-core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 30adae16efff..83bea8591b08 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -552,7 +552,7 @@ static const u8 ata_rw_cmds[] =3D {
 	0,
 	0,
 	0,
-	ATA_CMD_WRITE_MULTI_FUA_EXT,
+	0,
 	/* pio */
 	ATA_CMD_PIO_READ,
 	ATA_CMD_PIO_WRITE,
@@ -693,6 +693,10 @@ int ata_build_rw_tf(struct ata_queued_cmd *qc, u64 b=
lock, u32 n_block,
 	tf->flags |=3D ATA_TFLAG_ISADDR | ATA_TFLAG_DEVICE;
 	tf->flags |=3D tf_flags;
=20
+	/* We should never get a FUA read */
+	WARN_ON_ONCE((tf->flags & ATA_TFLAG_FUA) &&
+		     !(tf->flags & ATA_TFLAG_WRITE));
+
 	if (ata_ncq_enabled(dev)) {
 		/* yay, NCQ */
 		if (!lba_48_ok(block, n_block))
@@ -727,7 +731,8 @@ int ata_build_rw_tf(struct ata_queued_cmd *qc, u64 bl=
ock, u32 n_block,
 	} else if (dev->flags & ATA_DFLAG_LBA) {
 		tf->flags |=3D ATA_TFLAG_LBA;
=20
-		if (lba_28_ok(block, n_block)) {
+		/* We need LBA48 for FUA writes */
+		if (!(tf->flags & ATA_TFLAG_FUA) && lba_28_ok(block, n_block)) {
 			/* use LBA28 */
 			tf->device |=3D (block >> 24) & 0xf;
 		} else if (lba_48_ok(block, n_block)) {
@@ -742,9 +747,10 @@ int ata_build_rw_tf(struct ata_queued_cmd *qc, u64 b=
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
2.38.1

