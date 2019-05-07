Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B196B15D57
	for <lists+linux-ide@lfdr.de>; Tue,  7 May 2019 08:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbfEGG2T (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 7 May 2019 02:28:19 -0400
Received: from mga04.intel.com ([192.55.52.120]:3840 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726085AbfEGG2T (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 7 May 2019 02:28:19 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 May 2019 23:28:18 -0700
X-ExtLoop1: 1
Received: from ning-debian.sh.intel.com ([10.239.16.122])
  by FMSMGA003.fm.intel.com with ESMTP; 06 May 2019 23:28:17 -0700
From:   ning.a.zhang@intel.com
To:     axboe@kernel.dk, tj@kernel.org, linux-ide@vger.kernel.org
Cc:     dpetigara@broadcom.com, f.fainelli@gmail.com,
        ning.a.zhang@intel.com
Subject: [PATCH] libata: skip link debounce on resume
Date:   Tue,  7 May 2019 14:28:07 +0800
Message-Id: <20190507062807.24259-1-ning.a.zhang@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Zhang Ning <ning.a.zhang@intel.com>

when link has flag: ATA_LFLAG_NO_DB_DELAY, skip link debounce.

Change-Id: Ibcac689d7be97c1e139f87d416498a269ff2abf4
Signed-off-by: Zhang Ning <ning.a.zhang@intel.com>
---
 drivers/ata/libata-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index adf28788cab5..1fcb3190491e 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -3838,6 +3838,8 @@ int sata_link_debounce(struct ata_link *link, const unsigned long *params,
 
 		/* DET stable? */
 		if (cur == last) {
+			if (link->flags & ATA_LFLAG_NO_DB_DELAY)
+				return 0;
 			if (cur == 1 && time_before(jiffies, deadline))
 				continue;
 			if (time_after(jiffies,
-- 
2.20.1

