Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62E80A2B23
	for <lists+linux-ide@lfdr.de>; Fri, 30 Aug 2019 01:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbfH2Xox (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 29 Aug 2019 19:44:53 -0400
Received: from mga04.intel.com ([192.55.52.120]:29080 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726416AbfH2Xow (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Thu, 29 Aug 2019 19:44:52 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Aug 2019 16:44:51 -0700
X-IronPort-AV: E=Sophos;i="5.64,445,1559545200"; 
   d="scan'208";a="356613811"
Received: from dwillia2-desk3.jf.intel.com (HELO dwillia2-desk3.amr.corp.intel.com) ([10.54.39.16])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Aug 2019 16:44:51 -0700
Subject: [PATCH v3] libata/ahci: Drop PCS quirk for Denverton and beyond
From:   Dan Williams <dan.j.williams@intel.com>
To:     axboe@kernel.dk
Cc:     Stephen Douthit <stephend@silicom-usa.com>,
        Christoph Hellwig <hch@infradead.org>,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 29 Aug 2019 16:30:34 -0700
Message-ID: <156712139395.1614755.3489977733530873708.stgit@dwillia2-desk3.amr.corp.intel.com>
User-Agent: StGit/0.18-2-gc94f
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The Linux ahci driver has historically implemented a configuration fixup
for platforms / platform-firmware that fails to enable the ports prior
to OS hand-off at boot. The fixup was originally implemented way back
before ahci moved from drivers/scsi/ to drivers/ata/, and was updated in
2007 via commit 49f290903935 "ahci: update PCS programming". The quirk
sets a port-enable bitmap in the PCS register at offset 0x92.

This quirk could be applied generically up until the arrival of the
Denverton (DNV) platform. The DNV AHCI controller architecture supports
more than 6 ports and along with that the PCS register location and
format were updated to allow for more possible ports in the bitmap. DNV
AHCI expands the register to 32-bits and moves it to offset 0x94.

As it stands there are no known problem reports with existing Linux
trying to set bits at offset 0x92 which indicates that the quirk is not
applicable. Likely it is not applicable on a wider range of platforms,
but it is difficult to discern which platforms if any still depend on
the quirk.

Rather than try to fix the PCS quirk to consider the DNV register layout
instead require explicit opt-in. The assumption is that the OS driver
need not touch this register, and platforms can be added with a new
boad_ahci_pcs7 board-id when / if problematic platforms are found in the
future. The logic in ahci_intel_pcs_quirk() looks for all Intel AHCI
instances with "legacy" board-ids and otherwise skips the quirk if the
board was matched by class-code.

Reported-by: Stephen Douthit <stephend@silicom-usa.com>
Cc: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
Changes since v2:
- Use board_ahci_pcs7 to opt Denverton out of the PCS quirk.

 drivers/ata/ahci.c |  116 +++++++++++++++++++++++++++++++---------------------
 drivers/ata/ahci.h |    2 +
 2 files changed, 71 insertions(+), 47 deletions(-)

diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
index f7652baa6337..3e63294304c7 100644
--- a/drivers/ata/ahci.c
+++ b/drivers/ata/ahci.c
@@ -65,6 +65,12 @@ enum board_ids {
 	board_ahci_sb700,	/* for SB700 and SB800 */
 	board_ahci_vt8251,
 
+	/*
+	 * board IDs for Intel chipsets that support more than 6 ports
+	 * *and* end up needing the PCS quirk.
+	 */
+	board_ahci_pcs7,
+
 	/* aliases */
 	board_ahci_mcp_linux	= board_ahci_mcp65,
 	board_ahci_mcp67	= board_ahci_mcp65,
@@ -220,6 +226,12 @@ static const struct ata_port_info ahci_port_info[] = {
 		.udma_mask	= ATA_UDMA6,
 		.port_ops	= &ahci_vt8251_ops,
 	},
+	[board_ahci_pcs7] = {
+		.flags		= AHCI_FLAG_COMMON,
+		.pio_mask	= ATA_PIO4,
+		.udma_mask	= ATA_UDMA6,
+		.port_ops	= &ahci_ops,
+	},
 };
 
 static const struct pci_device_id ahci_pci_tbl[] = {
@@ -264,26 +276,26 @@ static const struct pci_device_id ahci_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, 0x3b2b), board_ahci }, /* PCH RAID */
 	{ PCI_VDEVICE(INTEL, 0x3b2c), board_ahci_mobile }, /* PCH M RAID */
 	{ PCI_VDEVICE(INTEL, 0x3b2f), board_ahci }, /* PCH AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19b0), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19b1), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19b2), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19b3), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19b4), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19b5), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19b6), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19b7), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19bE), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19bF), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19c0), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19c1), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19c2), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19c3), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19c4), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19c5), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19c6), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19c7), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19cE), board_ahci }, /* DNV AHCI */
-	{ PCI_VDEVICE(INTEL, 0x19cF), board_ahci }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19b0), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19b1), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19b2), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19b3), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19b4), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19b5), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19b6), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19b7), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19bE), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19bF), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19c0), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19c1), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19c2), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19c3), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19c4), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19c5), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19c6), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19c7), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19cE), board_ahci_pcs7 }, /* DNV AHCI */
+	{ PCI_VDEVICE(INTEL, 0x19cF), board_ahci_pcs7 }, /* DNV AHCI */
 	{ PCI_VDEVICE(INTEL, 0x1c02), board_ahci }, /* CPT AHCI */
 	{ PCI_VDEVICE(INTEL, 0x1c03), board_ahci_mobile }, /* CPT M AHCI */
 	{ PCI_VDEVICE(INTEL, 0x1c04), board_ahci }, /* CPT RAID */
@@ -623,30 +635,6 @@ static void ahci_pci_save_initial_config(struct pci_dev *pdev,
 	ahci_save_initial_config(&pdev->dev, hpriv);
 }
 
-static int ahci_pci_reset_controller(struct ata_host *host)
-{
-	struct pci_dev *pdev = to_pci_dev(host->dev);
-	int rc;
-
-	rc = ahci_reset_controller(host);
-	if (rc)
-		return rc;
-
-	if (pdev->vendor == PCI_VENDOR_ID_INTEL) {
-		struct ahci_host_priv *hpriv = host->private_data;
-		u16 tmp16;
-
-		/* configure PCS */
-		pci_read_config_word(pdev, 0x92, &tmp16);
-		if ((tmp16 & hpriv->port_map) != hpriv->port_map) {
-			tmp16 |= hpriv->port_map;
-			pci_write_config_word(pdev, 0x92, tmp16);
-		}
-	}
-
-	return 0;
-}
-
 static void ahci_pci_init_controller(struct ata_host *host)
 {
 	struct ahci_host_priv *hpriv = host->private_data;
@@ -849,7 +837,7 @@ static int ahci_pci_device_runtime_resume(struct device *dev)
 	struct ata_host *host = pci_get_drvdata(pdev);
 	int rc;
 
-	rc = ahci_pci_reset_controller(host);
+	rc = ahci_reset_controller(host);
 	if (rc)
 		return rc;
 	ahci_pci_init_controller(host);
@@ -884,7 +872,7 @@ static int ahci_pci_device_resume(struct device *dev)
 		ahci_mcp89_apple_enable(pdev);
 
 	if (pdev->dev.power.power_state.event == PM_EVENT_SUSPEND) {
-		rc = ahci_pci_reset_controller(host);
+		rc = ahci_reset_controller(host);
 		if (rc)
 			return rc;
 
@@ -1619,6 +1607,34 @@ static void ahci_update_initial_lpm_policy(struct ata_port *ap,
 		ap->target_lpm_policy = policy;
 }
 
+static void ahci_intel_pcs_quirk(struct pci_dev *pdev, struct ahci_host_priv *hpriv)
+{
+	const struct pci_device_id *id = pci_match_id(ahci_pci_tbl, pdev);
+	u16 tmp16;
+
+	/*
+	 * Only apply the 6-port PCS quirk for known legacy platforms.
+	 */
+	if (!id || id->vendor != PCI_VENDOR_ID_INTEL)
+		return;
+	if (((enum board_ids) id->driver_data) < board_ahci_pcs7)
+		return;
+
+	/*
+	 * port_map is determined from PORTS_IMPL PCI register which is
+	 * implemented as write or write-once register.  If the register
+	 * isn't programmed, ahci automatically generates it from number
+	 * of ports, which is good enough for PCS programming. It is
+	 * otherwise expected that platform firmware enables the ports
+	 * before the OS boots.
+	 */
+	pci_read_config_word(pdev, PCS_6, &tmp16);
+	if ((tmp16 & hpriv->port_map) != hpriv->port_map) {
+		tmp16 |= hpriv->port_map;
+		pci_write_config_word(pdev, PCS_6, tmp16);
+	}
+}
+
 static int ahci_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	unsigned int board_id = ent->driver_data;
@@ -1731,6 +1747,12 @@ static int ahci_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	/* save initial config */
 	ahci_pci_save_initial_config(pdev, hpriv);
 
+	/*
+	 * If platform firmware failed to enable ports, try to enable
+	 * them here.
+	 */
+	ahci_intel_pcs_quirk(pdev, hpriv);
+
 	/* prepare host */
 	if (hpriv->cap & HOST_CAP_NCQ) {
 		pi.flags |= ATA_FLAG_NCQ;
@@ -1840,7 +1862,7 @@ static int ahci_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (rc)
 		return rc;
 
-	rc = ahci_pci_reset_controller(host);
+	rc = ahci_reset_controller(host);
 	if (rc)
 		return rc;
 
diff --git a/drivers/ata/ahci.h b/drivers/ata/ahci.h
index 0570629d719d..3dbf398c92ea 100644
--- a/drivers/ata/ahci.h
+++ b/drivers/ata/ahci.h
@@ -247,6 +247,8 @@ enum {
 					  ATA_FLAG_ACPI_SATA | ATA_FLAG_AN,
 
 	ICH_MAP				= 0x90, /* ICH MAP register */
+	PCS_6				= 0x92, /* 6 port PCS */
+	PCS_7				= 0x94, /* 7+ port PCS (Denverton) */
 
 	/* em constants */
 	EM_MAX_SLOTS			= 8,

