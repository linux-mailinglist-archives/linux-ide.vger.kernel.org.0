Return-Path: <linux-ide+bounces-3369-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C76A7AC84
	for <lists+linux-ide@lfdr.de>; Thu,  3 Apr 2025 21:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE03D17103E
	for <lists+linux-ide@lfdr.de>; Thu,  3 Apr 2025 19:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C22277809;
	Thu,  3 Apr 2025 19:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzMCSjlX"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B0A277804;
	Thu,  3 Apr 2025 19:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707242; cv=none; b=QnYG+EKX73uhSSwh+etU+ec/I9rSySvBMhtXUi+Macr1pFYHChlUR9IZ8JnfH5Bc4zmvq477iFFlZ2JKKIU9YePT3lp+fdl/j5tt9Z9R7d6ihxG5gdtGQZxxpAQ2Y4L8GCazL5CcT4l+Omfw9EOUqaJ8oLmQ3sG3jtjYiGwlOrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707242; c=relaxed/simple;
	bh=4yJmhhGvOCIorjEfxIkFak6PjpCmAbv87X+zawKb7pc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kpiMbxSTP7dba7jCkBeXU/93GtBmgvfbhnMDD5PDnLHIIrbNGQoa/3q2VdMChKtPuuYdzUG+NvqO2pVe9NTZMxj+f+LOYnsiIM2kdZ1cbmmcNq4ZwzW56je40geWg+ATmK62kndMh9VZ8LiTRvQ3wkEdKkoYsXnWt8lYgdvV6vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzMCSjlX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A15C4AF0C;
	Thu,  3 Apr 2025 19:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707242;
	bh=4yJmhhGvOCIorjEfxIkFak6PjpCmAbv87X+zawKb7pc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BzMCSjlXqY0H6rt1ZsYrb4kFx12c2XHUvYBBnmTpqqtg0ATm9uhkFJp9iqypahxZr
	 08Qr/gF7tcuvv9ENbr+o3RSlAw1+YINR1U8Mmc0eJplZocFNEp8QxbinE9zwbclqGy
	 KhpFqEG7Ur1R6fJ48cPAmp5b7i80il+055KTeE1v77SuPPeSROKehb/CIU/rbrPdW5
	 E24Z1/OinL4bOff2lr5KGbylU6dHUymWEQ+9Kt3vGZVf1uTDMTOCd6zLaNK3UZ2a14
	 bnqxZYnKTvY9L+HGc2EObZNe0jxezo/MRiWzn5YkZr/uBcKG5zE77fS1L9xwG6d9kG
	 +7Hz36sS1Hw6w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	Yuli Wang <wangyuli@uniontech.com>,
	Jie Fan <fanjie@uniontech.com>,
	Erpeng Xu <xuerpeng@uniontech.com>,
	Niklas Cassel <cassel@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	dlemoal@kernel.org,
	linux-ide@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 35/47] ahci: Marvell 88SE9215 controllers prefer DMA for ATAPI
Date: Thu,  3 Apr 2025 15:05:43 -0400
Message-Id: <20250403190555.2677001-35-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403190555.2677001-1-sashal@kernel.org>
References: <20250403190555.2677001-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.21
Content-Transfer-Encoding: 8bit

From: Huacai Chen <chenhuacai@loongson.cn>

[ Upstream commit 0507c777f5d8f9e34b137d28ee263599a7b81242 ]

We use CD/DVD drives under Marvell 88SE9215 SATA controller on many
Loongson-based machines. We found its PIO doesn't work well, and on the
opposite its DMA seems work very well.

We don't know the detail of the 88SE9215 SATA controller, but we have
tested different CD/DVD drives and they all have problems under 88SE9215
(but they all work well under an Intel SATA controller). So, we consider
this problem is bound to 88SE9215 SATA controller rather than bound to
CD/DVD drives.

As a solution, we define a new dedicated AHCI board id which is named
board_ahci_yes_fbs_atapi_dma for 88SE9215, and for this id we set the
AHCI_HFLAG_ATAPI_DMA_QUIRK and ATA_QUIRK_ATAPI_MOD16_DMA flags on the
SATA controller in order to prefer ATAPI DMA.

Reported-by: Yuli Wang <wangyuli@uniontech.com>
Tested-by: Jie Fan <fanjie@uniontech.com>
Tested-by: Erpeng Xu <xuerpeng@uniontech.com>
Tested-by: Yuli Wang <wangyuli@uniontech.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Link: https://lore.kernel.org/r/20250318104314.2160526-1-chenhuacai@loongson.cn
Signed-off-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ata/ahci.c    | 11 ++++++++++-
 drivers/ata/ahci.h    |  1 +
 drivers/ata/libahci.c |  4 ++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
index 14dd1b432ac34..650122deb480d 100644
--- a/drivers/ata/ahci.c
+++ b/drivers/ata/ahci.c
@@ -63,6 +63,7 @@ enum board_ids {
 	board_ahci_pcs_quirk_no_devslp,
 	board_ahci_pcs_quirk_no_sntf,
 	board_ahci_yes_fbs,
+	board_ahci_yes_fbs_atapi_dma,
 
 	/* board IDs for specific chipsets in alphabetical order */
 	board_ahci_al,
@@ -188,6 +189,14 @@ static const struct ata_port_info ahci_port_info[] = {
 		.udma_mask	= ATA_UDMA6,
 		.port_ops	= &ahci_ops,
 	},
+	[board_ahci_yes_fbs_atapi_dma] = {
+		AHCI_HFLAGS	(AHCI_HFLAG_YES_FBS |
+				 AHCI_HFLAG_ATAPI_DMA_QUIRK),
+		.flags		= AHCI_FLAG_COMMON,
+		.pio_mask	= ATA_PIO4,
+		.udma_mask	= ATA_UDMA6,
+		.port_ops	= &ahci_ops,
+	},
 	/* by chipsets */
 	[board_ahci_al] = {
 		AHCI_HFLAGS	(AHCI_HFLAG_NO_PMP | AHCI_HFLAG_NO_MSI),
@@ -590,7 +599,7 @@ static const struct pci_device_id ahci_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_MARVELL_EXT, 0x91a3),
 	  .driver_data = board_ahci_yes_fbs },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MARVELL_EXT, 0x9215),
-	  .driver_data = board_ahci_yes_fbs },
+	  .driver_data = board_ahci_yes_fbs_atapi_dma },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MARVELL_EXT, 0x9230),
 	  .driver_data = board_ahci_yes_fbs },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MARVELL_EXT, 0x9235),
diff --git a/drivers/ata/ahci.h b/drivers/ata/ahci.h
index 8f40f75ba08cf..10a5fe02f0a45 100644
--- a/drivers/ata/ahci.h
+++ b/drivers/ata/ahci.h
@@ -246,6 +246,7 @@ enum {
 	AHCI_HFLAG_NO_SXS		= BIT(26), /* SXS not supported */
 	AHCI_HFLAG_43BIT_ONLY		= BIT(27), /* 43bit DMA addr limit */
 	AHCI_HFLAG_INTEL_PCS_QUIRK	= BIT(28), /* apply Intel PCS quirk */
+	AHCI_HFLAG_ATAPI_DMA_QUIRK	= BIT(29), /* force ATAPI to use DMA */
 
 	/* ap->flags bits */
 
diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
index fdfa7b2662180..a28ffe1e59691 100644
--- a/drivers/ata/libahci.c
+++ b/drivers/ata/libahci.c
@@ -1321,6 +1321,10 @@ static void ahci_dev_config(struct ata_device *dev)
 {
 	struct ahci_host_priv *hpriv = dev->link->ap->host->private_data;
 
+	if ((dev->class == ATA_DEV_ATAPI) &&
+	    (hpriv->flags & AHCI_HFLAG_ATAPI_DMA_QUIRK))
+		dev->quirks |= ATA_QUIRK_ATAPI_MOD16_DMA;
+
 	if (hpriv->flags & AHCI_HFLAG_SECT255) {
 		dev->max_sectors = 255;
 		ata_dev_info(dev,
-- 
2.39.5


