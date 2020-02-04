Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF42151E98
	for <lists+linux-ide@lfdr.de>; Tue,  4 Feb 2020 17:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbgBDQ4I (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 4 Feb 2020 11:56:08 -0500
Received: from mx2.suse.de ([195.135.220.15]:34814 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727387AbgBDQ4H (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 4 Feb 2020 11:56:07 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id EC3E7B0C6;
        Tue,  4 Feb 2020 16:56:04 +0000 (UTC)
From:   Hannes Reinecke <hare@suse.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Bartolomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>,
        Hannes Reinecke <hare@suse.com>
Subject: [PATCH 06/46] ata_piix: remove debugging message in piix_init()
Date:   Tue,  4 Feb 2020 17:55:07 +0100
Message-Id: <20200204165547.115220-7-hare@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200204165547.115220-1-hare@suse.de>
References: <20200204165547.115220-1-hare@suse.de>
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Drop pointless debugging message in piix_init()

Signed-off-by: Hannes Reinecke <hare@suse.com>
---
 drivers/ata/ata_piix.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/ata/ata_piix.c b/drivers/ata/ata_piix.c
index 3ca7720e7d8f..f940ecf72aaa 100644
--- a/drivers/ata/ata_piix.c
+++ b/drivers/ata/ata_piix.c
@@ -1767,14 +1767,12 @@ static int __init piix_init(void)
 {
 	int rc;
 
-	DPRINTK("pci_register_driver\n");
 	rc = pci_register_driver(&piix_pci_driver);
 	if (rc)
 		return rc;
 
 	in_module_init = 0;
 
-	DPRINTK("done\n");
 	return 0;
 }
 
-- 
2.16.4

