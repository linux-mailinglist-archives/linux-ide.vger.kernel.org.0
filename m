Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4899C281001
	for <lists+linux-ide@lfdr.de>; Fri,  2 Oct 2020 11:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgJBJkk (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 2 Oct 2020 05:40:40 -0400
Received: from mga14.intel.com ([192.55.52.115]:18117 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726181AbgJBJkj (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Fri, 2 Oct 2020 05:40:39 -0400
IronPort-SDR: FcUhJndXYmVSCPI6afC8lg1vrrexNiP6DoEPiJ6VcnkIgOO1ltVuNxXx8PkqsPytGCilUuitpk
 s3SxuSlXKqKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="162191312"
X-IronPort-AV: E=Sophos;i="5.77,327,1596524400"; 
   d="scan'208";a="162191312"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 02:40:37 -0700
IronPort-SDR: EdfO4x51+338IEfWgxVSCdJ6y0fvUAt0XKF8Ie5ZGOrQVB4zB7/vyWoyTWKuNPVIPh6z52s6MX
 6nr7iyRdM7kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,327,1596524400"; 
   d="scan'208";a="346421538"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 02 Oct 2020 02:40:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id B8366320; Fri,  2 Oct 2020 12:40:35 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-ide@vger.kernel.org
Subject: [PATCH] ahci: Add Intel Rocket Lake PCH-H RAID PCI IDs
Date:   Fri,  2 Oct 2020 12:40:35 +0300
Message-Id: <20201002094035.57329-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Add Intel Rocket Lake PCH-H RAID PCI IDs to the list of supported
controllers.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/ata/ahci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
index fbd8eaa32d32..00ba8e5a1ccc 100644
--- a/drivers/ata/ahci.c
+++ b/drivers/ata/ahci.c
@@ -360,6 +360,10 @@ static const struct pci_device_id ahci_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, 0x1f3f), board_ahci_avn }, /* Avoton RAID */
 	{ PCI_VDEVICE(INTEL, 0x2823), board_ahci }, /* Wellsburg RAID */
 	{ PCI_VDEVICE(INTEL, 0x2827), board_ahci }, /* Wellsburg RAID */
+	{ PCI_VDEVICE(INTEL, 0x43d4), board_ahci }, /* Rocket Lake PCH-H RAID */
+	{ PCI_VDEVICE(INTEL, 0x43d5), board_ahci }, /* Rocket Lake PCH-H RAID */
+	{ PCI_VDEVICE(INTEL, 0x43d6), board_ahci }, /* Rocket Lake PCH-H RAID */
+	{ PCI_VDEVICE(INTEL, 0x43d7), board_ahci }, /* Rocket Lake PCH-H RAID */
 	{ PCI_VDEVICE(INTEL, 0x8d02), board_ahci }, /* Wellsburg AHCI */
 	{ PCI_VDEVICE(INTEL, 0x8d04), board_ahci }, /* Wellsburg RAID */
 	{ PCI_VDEVICE(INTEL, 0x8d06), board_ahci }, /* Wellsburg RAID */
-- 
2.28.0

