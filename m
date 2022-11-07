Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2B3B61E7FA
	for <lists+linux-ide@lfdr.de>; Mon,  7 Nov 2022 01:50:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbiKGAun (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 6 Nov 2022 19:50:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbiKGAui (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 6 Nov 2022 19:50:38 -0500
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E47C752
        for <linux-ide@vger.kernel.org>; Sun,  6 Nov 2022 16:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1667782233; x=1699318233;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sJYwO2YFLt4950BGsnhd04xfiHD38rnFysO3T/X3rW4=;
  b=jFeAeGZK4eSF4uWY235FHaE1Fyz7I1U9unZH5n7BayzbdIieDj3aYcUW
   RtAHBjcEYwMHj08ULOdVd4ttsq/fyeszh6LRvaGft2oSj5f4cw0FUGWwE
   DlkyOa3TPDcKBQ4q/YgUyhC5FMbaFaj9rOhKm9JttWjhNoDFraPTiHpoP
   cqLP7JP8VMulhMprGmkO+plEOw3i9tOY3HLkH5BcS+9DCabnUdHMNx8G1
   8IdZShV+Cp0JQJalf+yY/PxLe8W6azegSPPnJZS02XAe41Q7iqooFjYqH
   hgpSZ0WYLz2RzVc4QLUC0jgcjr2HqsRP7UUeFZPgsO4ft6a5zazR0uoH5
   g==;
X-IronPort-AV: E=Sophos;i="5.96,143,1665417600"; 
   d="scan'208";a="215958491"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2022 08:50:33 +0800
IronPort-SDR: G+F2LV634xVRmqlcNHvTvztok6NqHgJ0t1GCtqWGg5hzycnXj+0VDOyD1aXXfINdMdYhaZQqRG
 ouoIKzZPxGq0oh3JlXQ0eyGQQuTWPNSoVWGCnYpzYFiYMgz5e86XZKdsu7sQbqGxNWlfz4zkB2
 Qkq2Ac76cZCcRqa+XyUE5kilxF0eFAtWLYCKaK3986CK81HluCFYQsf3XWjl/Uhuf3QgwemCmD
 b2YuLvCyU6oIHGtAsMdcH/9+AOLqEAbbPatnuN/pv/C46q5UsLwBTaoD/vmGigdL7QR/4gmaaZ
 MpM=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Nov 2022 16:09:40 -0800
IronPort-SDR: AhK7qqbX+BL55dkPW2/CCx2+vvXm+FCuRrFHOT92hgLSICrTL78+99MANJ0qfAa+eb44Z1xGrR
 SK2BRhlFrX2zPd1kJJTbWDSQ0rqluSUlL+HXpEmvP7tZfc9PjGQDSNvxwaVw4eO+T++OSXddu3
 05Clf70fTJUy/y45tBFlb+B21UcZcCm8z4Pz+lyPe/yb0y8WdrrO3UgMB+gcPlqJ4rgZgheIkS
 BC0+K6fO7AAiVX21626tuZq1LmlRpUobYtTfcVVXMsfy14TizRyXjqDen4WBQi40HkNK98/7xt
 tRM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Nov 2022 16:50:33 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4N5CMD3Vt5z1RwqL
        for <linux-ide@vger.kernel.org>; Sun,  6 Nov 2022 16:50:32 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1667782231; x=1670374232; bh=sJYwO2YFLt4950BGsn
        hd04xfiHD38rnFysO3T/X3rW4=; b=ZsS6mpUyPxvThlR659m6Oi6780OUpp5tGn
        KFFs5z2fljlimQLwMi0kqCBSN9fZJvO0mM2lHIWsWnsBnhZeliRHkLcRfA+B17bh
        A+8ule6deIPoLPYCwueVAoOWe6c2IgGgKFaVU/bbPkzJFf6gP2UiIiy5gaJASTRB
        aw5ivMIcdMdyYkdKMmv8ijzH5U/f5je39JdWarwPminIzY6r3dmtlj4Kg2hGIigA
        i4aryZG16lfvIyXsQFkXVmXXXCMaUrB9GZS9P32BL4HClXLO26k7FLAexrC+AaAO
        n/K/KMTYmK0/5V4F5z2fv9HI9bXyHmHtLKV6XWl0LH+qAWRlhytQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 1aAtwM18OqFs for <linux-ide@vger.kernel.org>;
        Sun,  6 Nov 2022 16:50:31 -0800 (PST)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4N5CMB65D2z1RvLy;
        Sun,  6 Nov 2022 16:50:30 -0800 (PST)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org, linux-block@vger.kernel.org,
        Jens Axboe <axboe@kernel.dk>
Cc:     "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v5 6/7] ata: libata: blacklist FUA support for known buggy drives
Date:   Mon,  7 Nov 2022 09:50:20 +0900
Message-Id: <20221107005021.1327692-7-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107005021.1327692-1-damien.lemoal@opensource.wdc.com>
References: <20221107005021.1327692-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
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
---
 drivers/ata/libata-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 83bea8591b08..29042665c550 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -4137,6 +4137,9 @@ static const struct ata_blacklist_entry ata_device_=
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

