Return-Path: <linux-ide+bounces-432-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DB28478CE
	for <lists+linux-ide@lfdr.de>; Fri,  2 Feb 2024 20:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FFC21C26FC7
	for <lists+linux-ide@lfdr.de>; Fri,  2 Feb 2024 19:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A71158344;
	Fri,  2 Feb 2024 18:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pLnEuAsn"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA83B158340;
	Fri,  2 Feb 2024 18:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706899332; cv=none; b=dSlcJaKEuo5csH/X5m/6fwKJi/PIOeOctreGxvYyPOAJu2up9sHf7Ea4k2zYsF35UK7t7D22jIDrnQ9q6l9n/ZCy87bfNfT9Jm/Ncki0vPJvbcDti7lMb3zq4CdaEkWEUgHW4xa2wvo7TRgit4JvtsU+SOxdI+Lhw4zJHg1w+dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706899332; c=relaxed/simple;
	bh=EHDYbzRhUr/NbgJe0ynDLIuAPvXyh1z62ccfD4UEa3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B5yFOhfQDWvSDN+F7RWHchrE+ORPegfxjx1vuObdaDsd+2mtZAkxDVsmgfVzxUa2u+Ko+UCLELUA+EzKhe6wHDTndSR85Zi2HzHyUNBWJvBE6AhT+HVnaA/EKz2nnjFHjlVo4dWxetiQcU2PFbsZOCm/HmujF8gde9Zd8qsaGGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pLnEuAsn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B499EC43394;
	Fri,  2 Feb 2024 18:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706899332;
	bh=EHDYbzRhUr/NbgJe0ynDLIuAPvXyh1z62ccfD4UEa3I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pLnEuAsnt12ngyciKNttX1sCCKoOAvMXNj5cmhOF3Gmjfv53m55ogY7yPt/RWvSYn
	 3/5oPqmhJI6rdfyUTxGAPxznUPg0T+FDCD+ay+8McjMo90EZwAw5o22ZRDrn3uFbRf
	 fJT0GpccjK+MVQdhEiDjIJ8BT/NCifouNArV/oeOVouLBrFzEbiqebftyIArO335dq
	 KW3o1Fn5bJgZsrui6qODOHJUDV3JRyC90b1Bg4qdHx78lOlf853zfeOQ86xglO3Ujt
	 ZaTxfPvfqQ4AaZf11uamqjlDw29+fIwIYSnVjvKIjS/BlHig8+vUu8TZIfK4fFa4RF
	 S6mdEBWXKMp+Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lennert Buytenhek <kernel@wantstofly.org>,
	Niklas Cassel <cassel@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	dlemoal@kernel.org,
	linux-ide@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 8/8] ahci: add 43-bit DMA address quirk for ASMedia ASM1061 controllers
Date: Fri,  2 Feb 2024 13:41:52 -0500
Message-ID: <20240202184156.541981-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202184156.541981-1-sashal@kernel.org>
References: <20240202184156.541981-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.209
Content-Transfer-Encoding: 8bit

From: Lennert Buytenhek <kernel@wantstofly.org>

[ Upstream commit 20730e9b277873deeb6637339edcba64468f3da3 ]

With one of the on-board ASM1061 AHCI controllers (1b21:0612) on an
ASUSTeK Pro WS WRX80E-SAGE SE WIFI mainboard, a controller hang was
observed that was immediately preceded by the following kernel
messages:

ahci 0000:28:00.0: Using 64-bit DMA addresses
ahci 0000:28:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0035 address=0x7fffff00000 flags=0x0000]
ahci 0000:28:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0035 address=0x7fffff00300 flags=0x0000]
ahci 0000:28:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0035 address=0x7fffff00380 flags=0x0000]
ahci 0000:28:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0035 address=0x7fffff00400 flags=0x0000]
ahci 0000:28:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0035 address=0x7fffff00680 flags=0x0000]
ahci 0000:28:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0035 address=0x7fffff00700 flags=0x0000]

The first message is produced by code in drivers/iommu/dma-iommu.c
which is accompanied by the following comment that seems to apply:

        /*
         * Try to use all the 32-bit PCI addresses first. The original SAC vs.
         * DAC reasoning loses relevance with PCIe, but enough hardware and
         * firmware bugs are still lurking out there that it's safest not to
         * venture into the 64-bit space until necessary.
         *
         * If your device goes wrong after seeing the notice then likely either
         * its driver is not setting DMA masks accurately, the hardware has
         * some inherent bug in handling >32-bit addresses, or not all the
         * expected address bits are wired up between the device and the IOMMU.
         */

Asking the ASM1061 on a discrete PCIe card to DMA from I/O virtual
address 0xffffffff00000000 produces the following I/O page faults:

vfio-pci 0000:07:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0021 address=0x7ff00000000 flags=0x0010]
vfio-pci 0000:07:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0021 address=0x7ff00000500 flags=0x0010]

Note that the upper 21 bits of the logged DMA address are zero.  (When
asking a different PCIe device in the same PCIe slot to DMA to the
same I/O virtual address, we do see all the upper 32 bits of the DMA
address as 1, so this is not an issue with the chipset or IOMMU
configuration on the test system.)

Also, hacking libahci to always set the upper 21 bits of all DMA
addresses to 1 produces no discernible effect on the behavior of the
ASM1061, and mkfs/mount/scrub/etc work as without this hack.

This all strongly suggests that the ASM1061 has a 43 bit DMA address
limit, and this commit therefore adds a quirk to deal with this limit.

This issue probably applies to (some of) the other supported ASMedia
parts as well, but we limit it to the PCI IDs known to refer to
ASM1061 parts, as that's the only part we know for sure to be affected
by this issue at this point.

Link: https://lore.kernel.org/linux-ide/ZaZ2PIpEId-rl6jv@wantstofly.org/
Signed-off-by: Lennert Buytenhek <kernel@wantstofly.org>
[cassel: drop date from error messages in commit log]
Signed-off-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ata/ahci.c | 29 +++++++++++++++++++++++------
 drivers/ata/ahci.h |  1 +
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
index 8bfada4843d8..6f7f8e41404d 100644
--- a/drivers/ata/ahci.c
+++ b/drivers/ata/ahci.c
@@ -49,6 +49,7 @@ enum {
 enum board_ids {
 	/* board IDs by feature in alphabetical order */
 	board_ahci,
+	board_ahci_43bit_dma,
 	board_ahci_ign_iferr,
 	board_ahci_low_power,
 	board_ahci_no_debounce_delay,
@@ -129,6 +130,13 @@ static const struct ata_port_info ahci_port_info[] = {
 		.udma_mask	= ATA_UDMA6,
 		.port_ops	= &ahci_ops,
 	},
+	[board_ahci_43bit_dma] = {
+		AHCI_HFLAGS	(AHCI_HFLAG_43BIT_ONLY),
+		.flags		= AHCI_FLAG_COMMON,
+		.pio_mask	= ATA_PIO4,
+		.udma_mask	= ATA_UDMA6,
+		.port_ops	= &ahci_ops,
+	},
 	[board_ahci_ign_iferr] = {
 		AHCI_HFLAGS	(AHCI_HFLAG_IGN_IRQ_IF_ERR),
 		.flags		= AHCI_FLAG_COMMON,
@@ -594,11 +602,11 @@ static const struct pci_device_id ahci_pci_tbl[] = {
 	{ PCI_VDEVICE(PROMISE, 0x3f20), board_ahci },	/* PDC42819 */
 	{ PCI_VDEVICE(PROMISE, 0x3781), board_ahci },   /* FastTrak TX8660 ahci-mode */
 
-	/* Asmedia */
+	/* ASMedia */
 	{ PCI_VDEVICE(ASMEDIA, 0x0601), board_ahci },	/* ASM1060 */
 	{ PCI_VDEVICE(ASMEDIA, 0x0602), board_ahci },	/* ASM1060 */
-	{ PCI_VDEVICE(ASMEDIA, 0x0611), board_ahci },	/* ASM1061 */
-	{ PCI_VDEVICE(ASMEDIA, 0x0612), board_ahci },	/* ASM1062 */
+	{ PCI_VDEVICE(ASMEDIA, 0x0611), board_ahci_43bit_dma },	/* ASM1061 */
+	{ PCI_VDEVICE(ASMEDIA, 0x0612), board_ahci_43bit_dma },	/* ASM1061/1062 */
 	{ PCI_VDEVICE(ASMEDIA, 0x0621), board_ahci },   /* ASM1061R */
 	{ PCI_VDEVICE(ASMEDIA, 0x0622), board_ahci },   /* ASM1062R */
 
@@ -951,11 +959,20 @@ static int ahci_pci_device_resume(struct device *dev)
 
 #endif /* CONFIG_PM */
 
-static int ahci_configure_dma_masks(struct pci_dev *pdev, int using_dac)
+static int ahci_configure_dma_masks(struct pci_dev *pdev,
+				    struct ahci_host_priv *hpriv)
 {
-	const int dma_bits = using_dac ? 64 : 32;
+	int dma_bits;
 	int rc;
 
+	if (hpriv->cap & HOST_CAP_64) {
+		dma_bits = 64;
+		if (hpriv->flags & AHCI_HFLAG_43BIT_ONLY)
+			dma_bits = 43;
+	} else {
+		dma_bits = 32;
+	}
+
 	/*
 	 * If the device fixup already set the dma_mask to some non-standard
 	 * value, don't extend it here. This happens on STA2X11, for example.
@@ -1933,7 +1950,7 @@ static int ahci_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	ahci_gtf_filter_workaround(host);
 
 	/* initialize adapter */
-	rc = ahci_configure_dma_masks(pdev, hpriv->cap & HOST_CAP_64);
+	rc = ahci_configure_dma_masks(pdev, hpriv);
 	if (rc)
 		return rc;
 
diff --git a/drivers/ata/ahci.h b/drivers/ata/ahci.h
index 7cc6feb17e97..b8db2b0d7414 100644
--- a/drivers/ata/ahci.h
+++ b/drivers/ata/ahci.h
@@ -244,6 +244,7 @@ enum {
 	AHCI_HFLAG_IGN_NOTSUPP_POWER_ON	= BIT(27), /* ignore -EOPNOTSUPP
 						      from phy_power_on() */
 	AHCI_HFLAG_NO_SXS		= BIT(28), /* SXS not supported */
+	AHCI_HFLAG_43BIT_ONLY		= BIT(29), /* 43bit DMA addr limit */
 
 	/* ap->flags bits */
 
-- 
2.43.0


