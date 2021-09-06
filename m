Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF6DB401417
	for <lists+linux-ide@lfdr.de>; Mon,  6 Sep 2021 03:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241085AbhIFBcW (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 5 Sep 2021 21:32:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:47528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351401AbhIFBa0 (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Sun, 5 Sep 2021 21:30:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC7AE611AD;
        Mon,  6 Sep 2021 01:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630891422;
        bh=oTBW6XUuhknbqKs+Jvdfwrz8zVlzu29Nj5RUC1hNxZA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PdeAb364ScRObp70pqqlVo/GyIrfGE09f6LlR4eQQjNt/6FPM5Y74xHBq4weDzdGJ
         PCrvrvVYruaqZaMgwvwTEfzcUdQRG9xJ9zD1/D5DL8iYj8JzxmfEeyR1lTGe4ago/w
         Get1ZqbfTdlBP5s7Rbe3uxoVpwv/puHmUr5q0mCE3bg9k1uJk5PxlzIAwcDJbDFHhy
         kC+lL7TWvIkQmOCwQtBNzZ1jbTna5ki0HS7lstwGr7ueGeg3PRMFFiSp7NTGjaMwvF
         13eI/brSsdfxlgqzV2GpY08dXl9wg4rRnbLVYveTN0p9H37KyhNqo83UwQEZKA1bnK
         JcjYBjmtEKtXg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Damien Le Moal <damien.lemoal@wdc.com>,
        kernel test robot <lkp@intel.com>,
        Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
        Sasha Levin <sashal@kernel.org>, linux-ide@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 16/23] libata: fix ata_host_start()
Date:   Sun,  5 Sep 2021 21:23:15 -0400
Message-Id: <20210906012322.930668-16-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210906012322.930668-1-sashal@kernel.org>
References: <20210906012322.930668-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Damien Le Moal <damien.lemoal@wdc.com>

[ Upstream commit 355a8031dc174450ccad2a61c513ad7222d87a97 ]

The loop on entry of ata_host_start() may not initialize host->ops to a
non NULL value. The test on the host_stop field of host->ops must then
be preceded by a check that host->ops is not NULL.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Link: https://lore.kernel.org/r/20210816014456.2191776-3-damien.lemoal@wdc.com
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ata/libata-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index db1d86af21b4..d9b1c3e95592 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -6412,7 +6412,7 @@ int ata_host_start(struct ata_host *host)
 			have_stop = 1;
 	}
 
-	if (host->ops->host_stop)
+	if (host->ops && host->ops->host_stop)
 		have_stop = 1;
 
 	if (have_stop) {
-- 
2.30.2

