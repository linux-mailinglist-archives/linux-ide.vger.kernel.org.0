Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A116151E9B
	for <lists+linux-ide@lfdr.de>; Tue,  4 Feb 2020 17:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbgBDQ4J (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 4 Feb 2020 11:56:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:34810 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727385AbgBDQ4I (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 4 Feb 2020 11:56:08 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id F37EEB11A;
        Tue,  4 Feb 2020 16:56:04 +0000 (UTC)
From:   Hannes Reinecke <hare@suse.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Bartolomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.com>,
        Hannes Reinecke <hare@suse.de>
Subject: [PATCH 13/46] ata_piix: Drop DPRINTK() statement
Date:   Tue,  4 Feb 2020 17:55:14 +0100
Message-Id: <20200204165547.115220-14-hare@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200204165547.115220-1-hare@suse.de>
References: <20200204165547.115220-1-hare@suse.de>
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Hannes Reinecke <hare@suse.com>

Drop a pointless DPRINTK() statement about PCI setup.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/ata_piix.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ata/ata_piix.c b/drivers/ata/ata_piix.c
index f940ecf72aaa..10ebe8daf1a5 100644
--- a/drivers/ata/ata_piix.c
+++ b/drivers/ata/ata_piix.c
@@ -1343,7 +1343,6 @@ static void piix_init_pcs(struct ata_host *host,
 	new_pcs = pcs | map_db->port_enable;
 
 	if (new_pcs != pcs) {
-		DPRINTK("updating PCS from 0x%x to 0x%x\n", pcs, new_pcs);
 		pci_write_config_word(pdev, ICH5_PCS, new_pcs);
 		msleep(150);
 	}
-- 
2.16.4

