Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF88612EF3
	for <lists+linux-ide@lfdr.de>; Mon, 31 Oct 2022 03:26:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiJaC0x (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 30 Oct 2022 22:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiJaC0w (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 30 Oct 2022 22:26:52 -0400
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A455FB7
        for <linux-ide@vger.kernel.org>; Sun, 30 Oct 2022 19:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1667183211; x=1698719211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u+YhafSOih06QZfSN+lI+siqPo+e0Kz4p8AfqVOVZpQ=;
  b=XAwdFdByFAvbcuIcSBPdjLTRajwfYAzNJGos7rfrIp/0jcSNrXJOnRgX
   sYHwwzwa2leySvmxXJc5jzPbqpGb9hUcijde/FAHggQXZr+/1e9BDM+d5
   JGHEg6p7BqNzD3otEj9UOnt+4xRRyuGejWdyx8P6onex3W67b4WrpR+sc
   EBxg+W3H/TClvfJqw+6XKR31eDx+rIsqC2iXF0DzZpDWE3BjJmp8AfR/D
   cUxFCaWeBbNKvmCM9CgtIaT7jH7XLJTvmWy/tntYlyNPMgrkmhd3jKijG
   6NJACXyjwpT92/B4Fch9W3fRFG9mR7H0HcqYpH32/Pt4/i6iBUzZxpxnU
   w==;
X-IronPort-AV: E=Sophos;i="5.95,227,1661788800"; 
   d="scan'208";a="215446859"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 31 Oct 2022 10:26:51 +0800
IronPort-SDR: vBt0pP996SRUJkM8J3UfytqeLihdPiDpYWRXkEdHV/wb10eMtb54n+j0rpcsLYog8wI0uJ+P10
 KjET/K6bMNBXoGHXXhRNcMqQ0rlreRikkknB5fDqmO/m6GWf/dHQpGtnY5aSORvjdndsgXswa1
 0B6SBMIvNV2HxZwFZh41rd71ZKntrtLrBNcUB7z5pMtHtPwZDVsiQWLxB5appDnsKR5S9QhlYj
 IGDcPI01r8U2T/HC/EJblmfz71Mq16eCPV+ycBpOpLHHMRlrHtB3BtegO8b0Q+M9trp+Da3BHf
 qItek5iSUAvmOPLJs4gr3p87
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Oct 2022 18:40:23 -0700
IronPort-SDR: 07G+xNr4/D+H6Xmgs3YgbWP1NC2q0dLTUyUoPSe9GXd1qs2+dW1PB7FzDMNhNeIGMjlk004lS1
 PLVufMCkV3YegeEo8a32z3NTSPZvmudg/RMRKDZ7yU+Z4pCAfyoKUR90543ZyPHU+7fQoMkDrR
 dpwhV0DYnc4HOxzD2F7BjN//BazxOYFX2eTwfaIk8PhQnMwIzi2pGoDwz4AZ0Tq6LbCORRKTdx
 usnWyqUUkjpRXmATETxzTXS142t5gY7P3QaqI2JLJ57SN4wRajoW/1Pt56qKAC/UPaNtZO9sgE
 i5Y=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Oct 2022 19:26:50 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4N0xqZ1bftz1Rwrq
        for <linux-ide@vger.kernel.org>; Sun, 30 Oct 2022 19:26:50 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1667183209; x=1669775210; bh=u+YhafSOih06QZfSN+
        lI+siqPo+e0Kz4p8AfqVOVZpQ=; b=PgVGgsto9AHwhU9xCf9B4tVL1gcvJbK3wn
        Wgf1xCLC2Xvhfbp6iCNmC+QSdd+I3ddzH+yTd90aiihdgi9xuqw2Z3VG3SCRPVw8
        caRyzbunbuLipzMGsCnXLx2x5xx35TeMG6brQ3Q/qdTX19zasCLdsfWcXAGemrIo
        UgcwqrjJ/uDrapXsq1QNUCQVmBuZwfAuunQe7S0YaT2wkewFKMSLpJs71acof4Tj
        jo+S36F/OkGv66MUO3rAm45w01IIdcAUP3v97dmqhV+Yr5cMHpayX2Qp/4HrSyPA
        dvT2cKdorWD6dD//ot1Xnq1JcZZKxRoIB/hGsuRBeAe2V816IfnA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Ef-nJTryO0dz for <linux-ide@vger.kernel.org>;
        Sun, 30 Oct 2022 19:26:49 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4N0xqV5GHcz1RvTp;
        Sun, 30 Oct 2022 19:26:46 -0700 (PDT)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org, linux-block@vger.kernel.org,
        Jens Axboe <axboe@kernel.dk>
Cc:     "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Hannes Reinecke <hare@suse.de>
Subject: [PATCH v4 1/7] block: Prevent the use of REQ_FUA with read operations
Date:   Mon, 31 Oct 2022 11:26:36 +0900
Message-Id: <20221031022642.352794-2-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031022642.352794-1-damien.lemoal@opensource.wdc.com>
References: <20221031022642.352794-1-damien.lemoal@opensource.wdc.com>
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

For block devices that do not support FUA, the blk-flush machinery using
preflush/postflush (synchronize cache) does not enforce media access on
the device side for a REQ_FUA read. Furthermore, not all block devices
support FUA for read operations (e.g. ATA devices with NCQ support
turned off). Finally, while all the blk-flush.c code is clearly intended
at processing FUA writes, there is no explicit checks verifying that the
issued request is a write.

Add a check at the beginning of blk_insert_flush() to ensure that any
REQ_FUA read request is failed, reporting "not supported" to the user.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 block/blk-flush.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/block/blk-flush.c b/block/blk-flush.c
index 53202eff545e..4a2693c7535b 100644
--- a/block/blk-flush.c
+++ b/block/blk-flush.c
@@ -397,6 +397,18 @@ void blk_insert_flush(struct request *rq)
 	unsigned int policy =3D blk_flush_policy(fflags, rq);
 	struct blk_flush_queue *fq =3D blk_get_flush_queue(q, rq->mq_ctx);
=20
+	/*
+	 * REQ_FUA does not apply to read requests because:
+	 * - There is no way to reliably force media access for read operations
+	 *   with a block device that does not support FUA.
+	 * - Not all block devices support FUA for read operations (e.g. ATA
+	 *   devices with NCQ support turned off).
+	 */
+	if (!op_is_write(rq->cmd_flags) && (rq->cmd_flags & REQ_FUA)) {
+		blk_mq_end_request(rq, BLK_STS_NOTSUPP);
+		return;
+	}
+
 	/*
 	 * @policy now records what operations need to be done.  Adjust
 	 * REQ_PREFLUSH and FUA for the driver.
--=20
2.38.1

