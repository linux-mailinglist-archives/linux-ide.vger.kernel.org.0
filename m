Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A97A620939
	for <lists+linux-ide@lfdr.de>; Tue,  8 Nov 2022 06:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233357AbiKHF4J (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 8 Nov 2022 00:56:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233387AbiKHFz5 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 8 Nov 2022 00:55:57 -0500
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A674331221
        for <linux-ide@vger.kernel.org>; Mon,  7 Nov 2022 21:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1667886956; x=1699422956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WB7NEHrkve32a+KNZp5b6r13nV5v7Yd/VdIsBGzIuYo=;
  b=MoWDcIGW1gc0XdIJG6W/fDeuwGRrvxDv3qbHuFy3e6IIQvq0qHg3ojsE
   FUmfY1WtI2M+wQJqjCTDMy0UKveThdzVFsq+empVRMuGajqVodduDqU2O
   Jg4Qs/ytPb52zT0hNSYSFct5lGs5DdI7L6ptvKVvwYAwA3bMMLFfOCk1p
   0nGs7B8SGp6erm608P4tjfgtupZDc6W8yuHZLeq5A+GDQSZueG3DK6hIX
   cDDuzdBlhU1qUYaZEsUKoiHiu49JuO3eq2HYLJ2iZyMqK8RbqDYNDXwAu
   ZnHWyCE92YoFJgZV5iz3XCOPOzMgg/yZKfqQiPwYh5CEQfVO5p8b7mk65
   g==;
X-IronPort-AV: E=Sophos;i="5.96,145,1665417600"; 
   d="scan'208";a="327831372"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2022 13:55:56 +0800
IronPort-SDR: cgMW61mBq2/D+f6O8YvoyfSKmiYkgrDeg3LoauDWkcISFxGLZVm8flIuwUyaBjhKBccWvB/Q1u
 Gt6HBGJ81iRquN9gzvqLOgR72hKnVGEVpqmkdKnLQgnjfAOeGvdqzd++UEYQczBsxl+dz1K0Pu
 p1qXABcSMVc1izmo/puaon3PCYgg/746jWMxWrsHMgGd1Eio9r81fdzy+2qZoNXkWSN5uQRmaL
 zjzDJIZLH2qzH9YcmXpqURp6+1S2tIMs3Kw/3qIF/FGzJPtTrOQ/NQBEoHLkKCaibUzFZgSvD8
 uVE=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Nov 2022 21:15:02 -0800
IronPort-SDR: 0vuBXzq1B2NKvOv7tbJb8yv0ojtYDq0aQqWMz+aYWqGhj7j4RWW9ejwRm5xKTPPlI6kPF3xCu8
 1rOZ8/KlU+xpPPe9NSy3JOJHYDC5AS+lGfTTtwBuMYdhPGMEqZ8ci1BPBdJTueGRBbD2+SxXOu
 MxJaYY1E76smEF4CETdFU/CVzK5oTzgBGcJ9QrNq8fIza6OQ4MPbyzvfKdzrL7/a49CPZkxuYm
 iarVZDTXOqPwSn3BEM2tjvNic8MUsG1GxlWgyHkIPdYEeBbtVQN6leIkOS6w7aYXPdKpTIZ3uo
 FSs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Nov 2022 21:55:57 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4N5y5771ggz1Rwtl
        for <linux-ide@vger.kernel.org>; Mon,  7 Nov 2022 21:55:55 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1667886955; x=1670478956; bh=WB7NEHrkve32a+KNZp
        5b6r13nV5v7Yd/VdIsBGzIuYo=; b=KGypXn7j48rFHt04x5hD9ULEX/b+BiuOHB
        jUNwX1cyEwqQ0/a1hTXe2NnlgUolfpstk82kCBPmyO3fKzODUW8JZX65fR/VR4bz
        lIxYt/14qWhBUddOVQnhLAmRsrSdnzd/+1HtFaDzYmwSYmT1ZDVYGOnOJZDnVs3c
        d3zkxJFB5Peoy7bJMYvmlL5RytFEFoG/Mo/91SZvv+DvtBd8sotDPAIN88ikPWIy
        rm1ut986yuBC6W1U+JkMxKmjXr6J6zBFakrGCozc3bljzUpPPXSNL9V7P9LrXpDF
        MoCjBQRDrv5JG7IhLwfS0vhQLXIyv02fJL1BbgRNr9QvIJJCJ5NA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 02TrOk17GfOo for <linux-ide@vger.kernel.org>;
        Mon,  7 Nov 2022 21:55:55 -0800 (PST)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4N5y562Y3Lz1RvLy;
        Mon,  7 Nov 2022 21:55:54 -0800 (PST)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org, linux-block@vger.kernel.org,
        Jens Axboe <axboe@kernel.dk>
Cc:     "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v6 6/7] ata: libata: blacklist FUA support for known buggy drives
Date:   Tue,  8 Nov 2022 14:55:43 +0900
Message-Id: <20221108055544.1481583-7-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221108055544.1481583-1-damien.lemoal@opensource.wdc.com>
References: <20221108055544.1481583-1-damien.lemoal@opensource.wdc.com>
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

Thread [1] reported back in 2012 problems with enabling FUA for 3
different drives. Add these drives to ata_device_blacklist[] to mark
them with the ATA_HORKAGE_NO_FUA flag. To be conservative and avoid
problems on old systems, the model number for the three new entries
are defined as to widely match all drives in the same product line.

[1]: https://lore.kernel.org/lkml/CA+6av4=3Duxu_q5U_46HtpUt=3DFSgbh3pZuAE=
Y54J5_xK=3DMKWq-YQ@mail.gmail.com/

Suggested-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/ata/libata-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 2b66fe529d81..97ade977b830 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -4133,6 +4133,9 @@ static const struct ata_blacklist_entry ata_device_=
blacklist [] =3D {
=20
 	/* Buggy FUA */
 	{ "Maxtor",		"BANC1G10",	ATA_HORKAGE_NO_FUA },
+	{ "WDC*WD2500J*",	NULL,		ATA_HORKAGE_NO_FUA },
+	{ "OCZ-VERTEX*",	NULL,		ATA_HORKAGE_NO_FUA },
+	{ "INTEL*SSDSC2CT*",	NULL,		ATA_HORKAGE_NO_FUA },
=20
 	/* End Marker */
 	{ }
--=20
2.38.1

