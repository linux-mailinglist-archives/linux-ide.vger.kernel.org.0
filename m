Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23D718C669
	for <lists+linux-ide@lfdr.de>; Wed, 14 Aug 2019 04:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbfHNCOY (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 13 Aug 2019 22:14:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:46336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728721AbfHNCOY (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 13 Aug 2019 22:14:24 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 52B6620874;
        Wed, 14 Aug 2019 02:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565748864;
        bh=mxnWxWuMu9N+RIWzpMV7MjIXLsiiInilQr1dytlK0eE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LWipy90qskwXnz7vUH0LLHtH0sLaRx+xtPwznO1bgK3ROTC7H+sRHEBUA7mc3HKSc
         APgETYtCjk6FWsy9eBRyLSxvZq+y4FVbQSQTddbCcvxtmux923gbw6gMoZpseGAHDW
         Ga4/J3NimBKH/QfTzJBhGHfEmE93lok6FdFh00N8=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>, Krishna Ram Prakash R <krp@gtux.in>,
        Kees Cook <keescook@chromium.org>,
        Sasha Levin <sashal@kernel.org>, linux-ide@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 111/123] libata: have ata_scsi_rw_xlat() fail invalid passthrough requests
Date:   Tue, 13 Aug 2019 22:10:35 -0400
Message-Id: <20190814021047.14828-111-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814021047.14828-1-sashal@kernel.org>
References: <20190814021047.14828-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Jens Axboe <axboe@kernel.dk>

[ Upstream commit 2d7271501720038381d45fb3dcbe4831228fc8cc ]

For passthrough requests, libata-scsi takes what the user passes in
as gospel. This can be problematic if the user fills in the CDB
incorrectly. One example of that is in request sizes. For read/write
commands, the CDB contains fields describing the transfer length of
the request. These should match with the SG_IO header fields, but
libata-scsi currently does no validation of that.

Check that the number of blocks in the CDB for passthrough requests
matches what was mapped into the request. If the CDB asks for more
data then the validated SG_IO header fields, error it.

Reported-by: Krishna Ram Prakash R <krp@gtux.in>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ata/libata-scsi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
index 391ac0503dc07..76d0f9de767bc 100644
--- a/drivers/ata/libata-scsi.c
+++ b/drivers/ata/libata-scsi.c
@@ -1786,6 +1786,21 @@ static unsigned int ata_scsi_verify_xlat(struct ata_queued_cmd *qc)
 	return 1;
 }
 
+static bool ata_check_nblocks(struct scsi_cmnd *scmd, u32 n_blocks)
+{
+	struct request *rq = scmd->request;
+	u32 req_blocks;
+
+	if (!blk_rq_is_passthrough(rq))
+		return true;
+
+	req_blocks = blk_rq_bytes(rq) / scmd->device->sector_size;
+	if (n_blocks > req_blocks)
+		return false;
+
+	return true;
+}
+
 /**
  *	ata_scsi_rw_xlat - Translate SCSI r/w command into an ATA one
  *	@qc: Storage for translated ATA taskfile
@@ -1830,6 +1845,8 @@ static unsigned int ata_scsi_rw_xlat(struct ata_queued_cmd *qc)
 		scsi_10_lba_len(cdb, &block, &n_block);
 		if (cdb[1] & (1 << 3))
 			tf_flags |= ATA_TFLAG_FUA;
+		if (!ata_check_nblocks(scmd, n_block))
+			goto invalid_fld;
 		break;
 	case READ_6:
 	case WRITE_6:
@@ -1844,6 +1861,8 @@ static unsigned int ata_scsi_rw_xlat(struct ata_queued_cmd *qc)
 		 */
 		if (!n_block)
 			n_block = 256;
+		if (!ata_check_nblocks(scmd, n_block))
+			goto invalid_fld;
 		break;
 	case READ_16:
 	case WRITE_16:
@@ -1854,6 +1873,8 @@ static unsigned int ata_scsi_rw_xlat(struct ata_queued_cmd *qc)
 		scsi_16_lba_len(cdb, &block, &n_block);
 		if (cdb[1] & (1 << 3))
 			tf_flags |= ATA_TFLAG_FUA;
+		if (!ata_check_nblocks(scmd, n_block))
+			goto invalid_fld;
 		break;
 	default:
 		DPRINTK("no-byte command\n");
-- 
2.20.1

