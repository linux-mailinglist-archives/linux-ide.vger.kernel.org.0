Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4752261E7F0
	for <lists+linux-ide@lfdr.de>; Mon,  7 Nov 2022 01:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbiKGAu2 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 6 Nov 2022 19:50:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbiKGAu1 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 6 Nov 2022 19:50:27 -0500
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6ECFBF6E
        for <linux-ide@vger.kernel.org>; Sun,  6 Nov 2022 16:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1667782226; x=1699318226;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4V2Rz9TG67q8oD35wKvWjqMf6Te/5DihZHiUpOsyzqE=;
  b=nOcVW9Mz0faLjnFydlx12Icldii9Nzk0uvX3X6LPKCQYPUpaRCvDbNRl
   N2Wgp9tjBwxBLX/6d8IjtBzqYMYKtq+9Hxe2NXaeY4jCxPLJ8h/4edPmq
   Bjszq82qOEL0R/4iI9Q+oH/SuexL8NYuFJqdXBKvIq/L13ggX5bufBnho
   t/S9MdgtkJI1fE82DRCI7al0VzOb1YSP9WjvTC4Hj1sJXj+GmlUx9DL/O
   QZQ0CYMsE4rII18aXw2MYEPrPXX04Y94+yoWruGWsV3e4HIkjaFPABXUE
   sp7uNzt/rmio4mqYHTf8UBlQNQ9FSU9FUWfxR5NHzHFBRr56Gr2FyI+38
   g==;
X-IronPort-AV: E=Sophos;i="5.96,143,1665417600"; 
   d="scan'208";a="215958468"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2022 08:50:25 +0800
IronPort-SDR: zZdJmQUKWRBmcZnNZNPkGlSIj2clIEjz1lKvRYsHFQtGDPK7+vTxei+XegGuY09G3ipll538Zj
 3u/8Dwo155owOJjmg/qaJjzOdOaWwjes54tBlG/bc8K7ccwQjfAU14CEzEehD7OQys1VYRDMB9
 RqwgQ6dGsVzq1dmWsqYB5VvfXSQrVskT0POs2SBiO7o8rFu+hF5sAmja78eYWSsRlTzFGSki0s
 1fvgN6LpuVIEFpW9GkHpdLeYj5sT3blaInGVfpQQ+5BD0HqiY0nn19Swv4SUJwR84x4hNbIBAu
 SLM=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Nov 2022 16:09:33 -0800
IronPort-SDR: iQkjJpr9EEiruSwyt5x/vAZEQwSLSu0r4H08ALygB3UitvD7JFC9DAe1yr/xy61rQkTd1NBlPz
 kSEgEyl3Y4jdHcJ9YEA3oVebgMFigqgUxLAZpW9zzZGv48vrQmM/cJydcN2FZvz2R4NeaW4WlN
 adevhZcg2ESxRVRFFG8jpGioomKluGuKHX2zbONTutRxMTQeHQEHe0YYQfClOL8OgW4iC8y3xH
 CbUONanMF9MwBXo3mjxsZv9kc/PzNY8FW9n0003qZBr1EcbTbgG8Yf9sLR2kbxwOgvQWoz5OpX
 MKE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Nov 2022 16:50:26 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4N5CM531ZHz1RwtC
        for <linux-ide@vger.kernel.org>; Sun,  6 Nov 2022 16:50:25 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1667782224; x=1670374225; bh=4V2Rz9TG67q8oD35wK
        vWjqMf6Te/5DihZHiUpOsyzqE=; b=jTa262oWavLeLGHCQ2LkaqqcaTphRkVB+2
        8bVeCq4mbKLvWLyoxO9iesDR1VEAQAFWqD9wsriRLuJrMHlaGZF0vsR69bTIMGjK
        Xq67lxvlnpslvxjjWznuoycjbrxx0M1Prmz21dFZBMpJzf8aV5fFSoY8lMUgg4mR
        oXV+4a9nby+51xGr7IrqlpcOUgDwAfQ/i0nDzMGHPFAuJbl07/3CTch35GCfNU/a
        PrAueJjlznPH1ae3uuUWJiuW8pQyOLfWg42uM9fA28ybYpWxu30vrkshLfLXo5v5
        ZgP1QFcpl+RNpBlkLEPpSUDB0JiFg80rs3N8jjwlFq6NRpqlaAPw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id eifiyvXPblMn for <linux-ide@vger.kernel.org>;
        Sun,  6 Nov 2022 16:50:24 -0800 (PST)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4N5CM36hJMz1RvTp;
        Sun,  6 Nov 2022 16:50:23 -0800 (PST)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org, linux-block@vger.kernel.org,
        Jens Axboe <axboe@kernel.dk>
Cc:     "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v5 1/7] block: add a sanity check for non-write flush/fua bios
Date:   Mon,  7 Nov 2022 09:50:15 +0900
Message-Id: <20221107005021.1327692-2-damien.lemoal@opensource.wdc.com>
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

From: Christoph Hellwig <hch@lst.de>

Check that the PREFUSH and FUA flags are only set on write bios,
given that the flush state machine expects that.

Reported-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 block/blk-core.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 17667159482e..d3446d38ba77 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -730,12 +730,15 @@ void submit_bio_noacct(struct bio *bio)
 	 * Filter flush bio's early so that bio based drivers without flush
 	 * support don't have to worry about them.
 	 */
-	if (op_is_flush(bio->bi_opf) &&
-	    !test_bit(QUEUE_FLAG_WC, &q->queue_flags)) {
-		bio->bi_opf &=3D ~(REQ_PREFLUSH | REQ_FUA);
-		if (!bio_sectors(bio)) {
-			status =3D BLK_STS_OK;
+	if (op_is_flush(bio->bi_opf)) {
+		if (WARN_ON_ONCE(bio_op(bio) !=3D REQ_OP_WRITE))
 			goto end_io;
+		if (!test_bit(QUEUE_FLAG_WC, &q->queue_flags)) {
+			bio->bi_opf &=3D ~(REQ_PREFLUSH | REQ_FUA);
+			if (!bio_sectors(bio)) {
+				status =3D BLK_STS_OK;
+				goto end_io;
+			}
 		}
 	}
=20
--=20
2.38.1

