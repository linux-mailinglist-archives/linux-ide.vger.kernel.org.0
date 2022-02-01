Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF634A578C
	for <lists+linux-ide@lfdr.de>; Tue,  1 Feb 2022 08:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234606AbiBAHOJ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 1 Feb 2022 02:14:09 -0500
Received: from mx3.molgen.mpg.de ([141.14.17.11]:36961 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234592AbiBAHOI (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 1 Feb 2022 02:14:08 -0500
Received: from localhost.localdomain (unknown [77.235.169.38])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6C26961E6478B;
        Tue,  1 Feb 2022 08:14:04 +0100 (CET)
From:   Paul Menzel <pmenzel@molgen.mpg.de>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc:     Paul Menzel <pmenzel@molgen.mpg.de>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] ata: ahci: Skip 200 ms debounce delay for Marvell 88SE9235
Date:   Tue,  1 Feb 2022 08:12:23 +0100
Message-Id: <20220201071229.6418-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The 200 ms delay before debouncing the PHY in `sata_link_resume()` is
not needed for the Marvell 88SE9235.

    $ lspci -nn -s 0021:0e:00.0
    0021:0e:00.0 SATA controller [0106]: Marvell Technology Group Ltd. 88SE9235 PCIe 2.0 x2 4-port SATA 6 Gb/s Controller [1b4b:9235] (rev 11)

So, remove it. Tested on IBM S822LC with current Linux 5.17-rc1:

Currently, without this patch (with 200 ms delay), device probe for ata1
takes 485 ms:

    [    3.358158] ata1: SATA max UDMA/133 abar m2048@0x3fe881000000 port 0x3fe881000100 irq 39
    [    3.358175] ata2: SATA max UDMA/133 abar m2048@0x3fe881000000 port 0x3fe881000180 irq 39
    [    3.358191] ata3: SATA max UDMA/133 abar m2048@0x3fe881000000 port 0x3fe881000200 irq 39
    [    3.358207] ata4: SATA max UDMA/133 abar m2048@0x3fe881000000 port 0x3fe881000280 irq 39
    […]
    [    3.677542] ata3: SATA link down (SStatus 0 SControl 300)
    [    3.677719] ata4: SATA link down (SStatus 0 SControl 300)
    [    3.839242] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
    [    3.839828] ata2.00: ATA-10: ST1000NX0313         00LY266 00LY265IBM, BE33, max UDMA/133
    [    3.840029] ata2.00: 1953525168 sectors, multi 0: LBA48 NCQ (depth 32), AA
    [    3.841796] ata2.00: configured for UDMA/133
    [    3.843231] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
    [    3.844083] ata1.00: ATA-10: ST1000NX0313         00LY266 00LY265IBM, BE33, max UDMA/133
    [    3.844313] ata1.00: 1953525168 sectors, multi 0: LBA48 NCQ (depth 32), AA
    [    3.846043] ata1.00: configured for UDMA/133

With this patch (no delay) device probe for ata1 takes 273 ms:

    [    3.624259] ata1: SATA max UDMA/133 abar m2048@0x3fe881000000 port 0x3f e881000100 irq 39
    [    3.624436] ata2: SATA max UDMA/133 abar m2048@0x3fe881000000 port 0x3f e881000180 irq 39
    [    3.624452] ata3: SATA max UDMA/133 abar m2048@0x3fe881000000 port 0x3f e881000200 irq 39
    [    3.624468] ata4: SATA max UDMA/133 abar m2048@0x3fe881000000 port 0x3f e881000280 irq 39
    […]
    [    3.731966] ata3: SATA link down (SStatus 0 SControl 300)
    [    3.732069] ata4: SATA link down (SStatus 0 SControl 300)
    [    3.897448] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
    [    3.897678] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
    [    3.898140] ata1.00: ATA-10: ST1000NX0313         00LY266 00LY265IBM, BE33, max UDMA/133
    [    3.898175] ata2.00: ATA-10: ST1000NX0313         00LY266 00LY265IBM, BE33, max UDMA/133
    [    3.898287] ata1.00: 1953525168 sectors, multi 0: LBA48 NCQ (depth 32), AA
    [    3.898349] ata2.00: 1953525168 sectors, multi 0: LBA48 NCQ (depth 32), AA
    [    3.900070] ata1.00: configured for UDMA/133
    [    3.900166] ata2.00: configured for UDMA/133

Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
v2: address comments for commit message (but forgot v2 tag)
v3: resend with v3 tag in subject line/commit message summary

 drivers/ata/ahci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
index ab5811ef5a53..edca4e8fd44e 100644
--- a/drivers/ata/ahci.c
+++ b/drivers/ata/ahci.c
@@ -582,6 +582,8 @@ static const struct pci_device_id ahci_pci_tbl[] = {
 	  .driver_data = board_ahci_yes_fbs },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MARVELL_EXT, 0x9230),
 	  .driver_data = board_ahci_yes_fbs },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MARVELL_EXT, 0x9235),
+	  .driver_data = board_ahci_no_debounce_delay },
 	{ PCI_DEVICE(PCI_VENDOR_ID_TTI, 0x0642), /* highpoint rocketraid 642L */
 	  .driver_data = board_ahci_yes_fbs },
 	{ PCI_DEVICE(PCI_VENDOR_ID_TTI, 0x0645), /* highpoint rocketraid 644L */
-- 
2.34.1

