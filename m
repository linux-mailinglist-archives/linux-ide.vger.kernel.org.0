Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F91B46D863
	for <lists+linux-ide@lfdr.de>; Wed,  8 Dec 2021 17:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237030AbhLHQgy (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 8 Dec 2021 11:36:54 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:37748 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237034AbhLHQgl (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 8 Dec 2021 11:36:41 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id BA7BB1FE1B;
        Wed,  8 Dec 2021 16:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1638981180; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=juQxGrBuQSDY+nHKvca8xG0A60mcAh6NWwb39qmQKE0=;
        b=kFFqQt83Hf1RfctAAIV3V1Y+ZqsgMmcDV+9+IYLSNnSlYFcyTnbNn3chV8N15cqNhTWcfT
        7wCFm8cN0XDqIgPrtl3QX0J05M3JmAL4zwSJbkHUPkiyRL1K4O65bncZk3UdwmBPHAXoUU
        4HVbF1XgSBnZb4o5EPkbcPLOG7aEnKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1638981180;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=juQxGrBuQSDY+nHKvca8xG0A60mcAh6NWwb39qmQKE0=;
        b=vliC6fIblkv9OgiUjv74SfMOMgW7uYKpbfynCzNYHsq2z0WqtNLevDaGfiZqe7zwaGd2Cv
        zS3RrrcbUzM84uCg==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
        by relay2.suse.de (Postfix) with ESMTP id B722AA3BB8;
        Wed,  8 Dec 2021 16:33:00 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
        id B38695191FA9; Wed,  8 Dec 2021 17:33:00 +0100 (CET)
From:   Hannes Reinecke <hare@suse.de>
To:     Damien LeMoal <damien.lemoal@wdc.com>
Cc:     linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 38/73] sata_inic162x: Drop pointless VPRINTK() calls
Date:   Wed,  8 Dec 2021 17:32:20 +0100
Message-Id: <20211208163255.114660-39-hare@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211208163255.114660-1-hare@suse.de>
References: <20211208163255.114660-1-hare@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/sata_inic162x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/ata/sata_inic162x.c b/drivers/ata/sata_inic162x.c
index b6239dae524a..781901151d82 100644
--- a/drivers/ata/sata_inic162x.c
+++ b/drivers/ata/sata_inic162x.c
@@ -488,8 +488,6 @@ static enum ata_completion_errors inic_qc_prep(struct ata_queued_cmd *qc)
 	bool is_data = ata_is_data(qc->tf.protocol);
 	unsigned int cdb_len = 0;
 
-	VPRINTK("ENTER\n");
-
 	if (is_atapi)
 		cdb_len = qc->dev->cdb_len;
 
-- 
2.29.2

