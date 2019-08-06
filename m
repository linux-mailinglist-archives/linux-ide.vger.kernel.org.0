Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E118883BE8
	for <lists+linux-ide@lfdr.de>; Tue,  6 Aug 2019 23:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbfHFViw (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 6 Aug 2019 17:38:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:55732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729555AbfHFViC (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 6 Aug 2019 17:38:02 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF60720C01;
        Tue,  6 Aug 2019 21:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565127481;
        bh=Nge1Rt5g/b+aqtX1NJamqBDlTw67F+5Aabrmh1A3G+w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NmyCfyRiPj2PTKMOz3CV92M6qTfamxY3htUVVtmAsN0XuZxRbH8wkDCuGf6pVNSeX
         4rY6DrDe6KS/9nasseeGFUlpFFDjOrbI1dABCs2+bwTsi4Oiucgp5rSdtyVRI0RiTP
         exTCpPGFsGeYxdumahVAAy7RK1fn0xA5h2APrsC0=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Jeffrin Jose T <jeffrin@rajagiritech.edu.in>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>,
        linux-ide@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 06/14] libata: zpodd: Fix small read overflow in zpodd_get_mech_type()
Date:   Tue,  6 Aug 2019 17:37:40 -0400
Message-Id: <20190806213749.20689-6-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806213749.20689-1-sashal@kernel.org>
References: <20190806213749.20689-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Kees Cook <keescook@chromium.org>

[ Upstream commit 71d6c505b4d9e6f76586350450e785e3d452b346 ]

Jeffrin reported a KASAN issue:

  BUG: KASAN: global-out-of-bounds in ata_exec_internal_sg+0x50f/0xc70
  Read of size 16 at addr ffffffff91f41f80 by task scsi_eh_1/149
  ...
  The buggy address belongs to the variable:
    cdb.48319+0x0/0x40

Much like commit 18c9a99bce2a ("libata: zpodd: small read overflow in
eject_tray()"), this fixes a cdb[] buffer length, this time in
zpodd_get_mech_type():

We read from the cdb[] buffer in ata_exec_internal_sg(). It has to be
ATAPI_CDB_LEN (16) bytes long, but this buffer is only 12 bytes.

Reported-by: Jeffrin Jose T <jeffrin@rajagiritech.edu.in>
Fixes: afe759511808c ("libata: identify and init ZPODD devices")
Link: https://lore.kernel.org/lkml/201907181423.E808958@keescook/
Tested-by: Jeffrin Jose T <jeffrin@rajagiritech.edu.in>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ata/libata-zpodd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/libata-zpodd.c b/drivers/ata/libata-zpodd.c
index 7017a81d53cf2..083856272e92a 100644
--- a/drivers/ata/libata-zpodd.c
+++ b/drivers/ata/libata-zpodd.c
@@ -55,7 +55,7 @@ static enum odd_mech_type zpodd_get_mech_type(struct ata_device *dev)
 	unsigned int ret;
 	struct rm_feature_desc *desc;
 	struct ata_taskfile tf;
-	static const char cdb[] = {  GPCMD_GET_CONFIGURATION,
+	static const char cdb[ATAPI_CDB_LEN] = {  GPCMD_GET_CONFIGURATION,
 			2,      /* only 1 feature descriptor requested */
 			0, 3,   /* 3, removable medium feature */
 			0, 0, 0,/* reserved */
-- 
2.20.1

