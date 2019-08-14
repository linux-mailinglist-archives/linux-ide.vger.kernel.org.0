Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1BAE8C7C6
	for <lists+linux-ide@lfdr.de>; Wed, 14 Aug 2019 04:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728883AbfHNC0z (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 13 Aug 2019 22:26:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:54624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730369AbfHNC0e (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 13 Aug 2019 22:26:34 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B323A2173B;
        Wed, 14 Aug 2019 02:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565749594;
        bh=jX8fTWyNSK6du04D93U9Tv5IXcgdx3qFvD1n2Jb5vpM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Tq03IogP8/RzDcWaj7DH3veTFMLpSCCIVIe+m+4+uuBUmsovJSC0wUm1wrF1lIX/6
         GzL1iChg0/SfPtC0Cv7fwVND5g0lStXqig1UDqr7WmKx5LGbGsgBZgkUb7Sczxn6R8
         l3h6P3wD76RyULV7l6WkHl0S2KwOopnZsD/yB6uk=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>, Kees Cook <keescook@chromium.org>,
        Sasha Levin <sashal@kernel.org>, linux-ide@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 27/28] libata: add SG safety checks in SFF pio transfers
Date:   Tue, 13 Aug 2019 22:25:49 -0400
Message-Id: <20190814022550.17463-27-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814022550.17463-1-sashal@kernel.org>
References: <20190814022550.17463-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Jens Axboe <axboe@kernel.dk>

[ Upstream commit 752ead44491e8c91e14d7079625c5916b30921c5 ]

Abort processing of a command if we run out of mapped data in the
SG list. This should never happen, but a previous bug caused it to
be possible. Play it safe and attempt to abort nicely if we don't
have more SG segments left.

Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ata/libata-sff.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/ata/libata-sff.c b/drivers/ata/libata-sff.c
index 18de4c4570682..1d8901fc0bfa9 100644
--- a/drivers/ata/libata-sff.c
+++ b/drivers/ata/libata-sff.c
@@ -703,6 +703,10 @@ static void ata_pio_sector(struct ata_queued_cmd *qc)
 	unsigned int offset;
 	unsigned char *buf;
 
+	if (!qc->cursg) {
+		qc->curbytes = qc->nbytes;
+		return;
+	}
 	if (qc->curbytes == qc->nbytes - qc->sect_size)
 		ap->hsm_task_state = HSM_ST_LAST;
 
@@ -742,6 +746,8 @@ static void ata_pio_sector(struct ata_queued_cmd *qc)
 
 	if (qc->cursg_ofs == qc->cursg->length) {
 		qc->cursg = sg_next(qc->cursg);
+		if (!qc->cursg)
+			ap->hsm_task_state = HSM_ST_LAST;
 		qc->cursg_ofs = 0;
 	}
 }
-- 
2.20.1

