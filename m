Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64F4DA3E94
	for <lists+linux-ide@lfdr.de>; Fri, 30 Aug 2019 21:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbfH3Tm6 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 30 Aug 2019 15:42:58 -0400
Received: from mga12.intel.com ([192.55.52.136]:54276 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727246AbfH3Tm6 (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Fri, 30 Aug 2019 15:42:58 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Aug 2019 12:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,447,1559545200"; 
   d="scan'208";a="382117602"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2019 12:42:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 220A01A1; Fri, 30 Aug 2019 22:42:56 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Chuansheng Liu <chuansheng.liu@intel.com>
Subject: [PATCH v1] ahci: Do not export local variable ahci_em_messages
Date:   Fri, 30 Aug 2019 22:42:55 +0300
Message-Id: <20190830194255.878-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The commit ed08d40cdec4
  ("ahci: Changing two module params with static and __read_mostly")
moved ahci_em_messages to be static while missing the fact of exporting it.

WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

Drop export for the local variable ahci_em_messages.

Fixes: ed08d40cdec4 ("ahci: Changing two module params with static and __read_mostly")
Cc: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/ata/libahci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
index e4c45d3cca79..bff369d9a1a7 100644
--- a/drivers/ata/libahci.c
+++ b/drivers/ata/libahci.c
@@ -175,7 +175,6 @@ struct ata_port_operations ahci_pmp_retry_srst_ops = {
 EXPORT_SYMBOL_GPL(ahci_pmp_retry_srst_ops);
 
 static bool ahci_em_messages __read_mostly = true;
-EXPORT_SYMBOL_GPL(ahci_em_messages);
 module_param(ahci_em_messages, bool, 0444);
 /* add other LED protocol types when they become supported */
 MODULE_PARM_DESC(ahci_em_messages,
-- 
2.23.0.rc1

