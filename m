Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4870379A224
	for <lists+linux-ide@lfdr.de>; Mon, 11 Sep 2023 06:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233639AbjIKEDQ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 11 Sep 2023 00:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233637AbjIKEDA (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 11 Sep 2023 00:03:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415AACE0;
        Sun, 10 Sep 2023 21:02:53 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA96C433C9;
        Mon, 11 Sep 2023 04:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694404972;
        bh=rv7s8lvB7fQVRZeV3XRC9Sf248ndIl+ZYZHCj5lOseg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vMIJOpXxiqJ0o1uAoT7LqfTah2Mj/uaexyJHZcL31HqNjy3lif3jNGxqDwGEQrELv
         DcyKX6RuTLBuPMXDf83m3n167EsbquxLg0HzLaV0WRLupofpZVSfaT7zVfW0w2jfsA
         Zpke3AWM17NE8u4xvLKqxFPq0Jy2qH3UbJ6E39wGOFvCxiqIV6jUFtEaex17jgps5i
         gpJXaHjCHYIQSdU7ofreXEoYs/TFD190gUbDipmHkIBfDnTOPh8eJ7PSjDKcmA73EG
         brNQiwiuPZieqVNeL1nC/Mb0Chn7l/H9KKfWNq50cwE8cYP9qjEH1V9+6VrgKaeAFc
         ukiTAdemjr6rA==
From:   Damien Le Moal <dlemoal@kernel.org>
To:     linux-ide@vger.kernel.org
Cc:     linux-scsi@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        John Garry <john.g.garry@oracle.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Paul Ausbeck <paula@soe.ucsc.edu>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Joe Breuer <linux-kernel@jmbreuer.net>
Subject: [PATCH 17/19] ata: libata-eh: Improve reset error messages
Date:   Mon, 11 Sep 2023 13:02:15 +0900
Message-ID: <20230911040217.253905-18-dlemoal@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230911040217.253905-1-dlemoal@kernel.org>
References: <20230911040217.253905-1-dlemoal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Some drives are really slow to spinup on resume, resulting is a very
slow response to COMRESET and to error messages such as:

ata1: COMRESET failed (errno=-16)
ata1: link is slow to respond, please be patient (ready=0)
ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
ata1.00: configured for UDMA/133

Given that the slowness of the response is indicated with the message
"link is slow to respond..." and that resets are retried until the
device is detected as online after up to 1min (ata_eh_reset_timeouts),
there is no point in printing the "COMRESET failed" error message. Let's
not scare the user with non fatal errors and only warn about reset
failures in ata_eh_reset() when all reset retries have been exhausted.

Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/ata/libata-eh.c   | 2 ++
 drivers/ata/libata-sata.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ata/libata-eh.c b/drivers/ata/libata-eh.c
index 43b0a1509548..bbc522d16f44 100644
--- a/drivers/ata/libata-eh.c
+++ b/drivers/ata/libata-eh.c
@@ -2919,6 +2919,8 @@ int ata_eh_reset(struct ata_link *link, int classify,
 		 */
 		if (ata_is_host_link(link))
 			ata_eh_thaw_port(ap);
+		ata_link_warn(link, "%sreset failed\n",
+			      reset == hardreset ? "hard" : "soft");
 		goto out;
 	}
 
diff --git a/drivers/ata/libata-sata.c b/drivers/ata/libata-sata.c
index 0748e9ea4f5f..00674aae1696 100644
--- a/drivers/ata/libata-sata.c
+++ b/drivers/ata/libata-sata.c
@@ -608,7 +608,6 @@ int sata_link_hardreset(struct ata_link *link, const unsigned int *timing,
 		/* online is set iff link is online && reset succeeded */
 		if (online)
 			*online = false;
-		ata_link_err(link, "COMRESET failed (errno=%d)\n", rc);
 	}
 	return rc;
 }
-- 
2.41.0

