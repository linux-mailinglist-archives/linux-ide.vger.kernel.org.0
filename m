Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10C20633DB
	for <lists+linux-ide@lfdr.de>; Tue,  9 Jul 2019 12:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfGIKCI (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 9 Jul 2019 06:02:08 -0400
Received: from mx2.suse.de ([195.135.220.15]:48564 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726704AbfGIKCH (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 9 Jul 2019 06:02:07 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 60551B125;
        Tue,  9 Jul 2019 10:02:06 +0000 (UTC)
From:   Jiri Slaby <jslaby@suse.cz>
To:     axboe@kernel.dk
Cc:     linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.cz>,
        linux-ide@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 3/3] ata: sata_mv, avoid trigerrable BUG_ON
Date:   Tue,  9 Jul 2019 12:02:03 +0200
Message-Id: <20190709100203.19049-3-jslaby@suse.cz>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190709100203.19049-1-jslaby@suse.cz>
References: <20190709100203.19049-1-jslaby@suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

There are several reports that the BUG_ON on unsupported command in
mv_qc_prep can be triggered under some circumstances:
https://bugzilla.suse.com/show_bug.cgi?id=1110252
https://serverfault.com/questions/888897/raid-problems-after-power-outage
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1652185
https://bugs.centos.org/view.php?id=14998

Let sata_mv handle the failure gracefully: warn about that incl. the
failed command number and return an AC_ERR_INVALID error. We can do that
now thanks to the previous patch.

Remove also the long-standing FIXME.

[v2] use %.2x as commands are defined as hexa.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: linux-ide@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
---
 drivers/ata/sata_mv.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/ata/sata_mv.c b/drivers/ata/sata_mv.c
index d6aac7b31c45..43b9a442ef9f 100644
--- a/drivers/ata/sata_mv.c
+++ b/drivers/ata/sata_mv.c
@@ -2098,12 +2098,10 @@ static int mv_qc_prep(struct ata_queued_cmd *qc)
 		 * non-NCQ mode are: [RW] STREAM DMA and W DMA FUA EXT, none
 		 * of which are defined/used by Linux.  If we get here, this
 		 * driver needs work.
-		 *
-		 * FIXME: modify libata to give qc_prep a return value and
-		 * return error here.
 		 */
-		BUG_ON(tf->command);
-		break;
+		ata_port_err(ap, "%s: unsupported command: %.2x\n", __func__,
+				tf->command);
+		return AC_ERR_INVALID;
 	}
 	mv_crqb_pack_cmd(cw++, tf->nsect, ATA_REG_NSECT, 0);
 	mv_crqb_pack_cmd(cw++, tf->hob_lbal, ATA_REG_LBAL, 0);
-- 
2.22.0

