Return-Path: <linux-ide+bounces-3360-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 738CCA7AA5E
	for <lists+linux-ide@lfdr.de>; Thu,  3 Apr 2025 21:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 090F93BA3DD
	for <lists+linux-ide@lfdr.de>; Thu,  3 Apr 2025 19:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF5E25A2D7;
	Thu,  3 Apr 2025 19:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pPfT7t27"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313F6254870;
	Thu,  3 Apr 2025 19:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707007; cv=none; b=fIBznVVw9fNPE5q+tL5r/LfTT6+oiNqnx+CuTS7qNRwLQ6owScgjUKeG0VeEcsXrAGrPuArpbIYHuARU7iW0QOLnSdhjw+3GYDtGIIZHMRvCXbCPhenQVxUZqWUdFTzR9m0xblTihbmPqgomW/9NiypswaoeDzLMZy5ZJc9Vigk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707007; c=relaxed/simple;
	bh=hXWnviH1OUd1Mpzj2eQ7r5YGzdSbdAoncb+pXeFxenc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=caK/bbAf/vv8B29w7qP46VITimN57runMYSyUW+MO+Bc+eTdzP+g0y30a2iHr/XH8RdqRrPu2YIY2qfpjhc/wcJfVXNabNK+xVl/aiVIVmqh6yUwOe9MWsN5srfwF9/vWMsrf4AIoH7H5nZX6inqkc3RhcCR9Ldu0aApP4xcuXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pPfT7t27; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBCC0C4CEE8;
	Thu,  3 Apr 2025 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707006;
	bh=hXWnviH1OUd1Mpzj2eQ7r5YGzdSbdAoncb+pXeFxenc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pPfT7t27xmUiiOgruObn4HWhk2nnT45HtzNA34ubUlfgrtSWzeTDCfhrkHCN7aAqE
	 JLF0VbfiAMSpcal5Rlc+xg5krrkIfOGIM3z7o1kK/UcoouR8O9tZa2eJ7hiAvCPqQL
	 q8y5/67HZ6gIA/W/wdmXxfm4q3xqlNEKVdJmUBvzcW0sNHExoRTzxOgJaMidtDA+0j
	 GO/Tia8mfCdZA2w3uiwJ0Q0NUalOeGVHhk8qkHauHj5szXEssDxzx1qqyu+py8mVdc
	 1AbqwhhvY4rSHpKu8rXMh3ozC6VJ9/WW/dG7i+/m4b7kvQP9XgMvHb2/BHB5xogxLF
	 SZymhzOrNi0wg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Daniel Kral <d.kral@proxmox.com>,
	Niklas Cassel <cassel@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	dlemoal@kernel.org,
	linux-ide@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 32/54] ahci: add PCI ID for Marvell 88SE9215 SATA Controller
Date: Thu,  3 Apr 2025 15:01:47 -0400
Message-Id: <20250403190209.2675485-32-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403190209.2675485-1-sashal@kernel.org>
References: <20250403190209.2675485-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
Content-Transfer-Encoding: 8bit

From: Daniel Kral <d.kral@proxmox.com>

[ Upstream commit 885251dc35767b1c992f6909532ca366c830814a ]

Add support for Marvell Technology Group Ltd. 88SE9215 SATA 6 Gb/s
controller, which is e.g. used in the DAWICONTROL DC-614e RAID bus
controller and was not automatically recognized before.

Tested with a DAWICONTROL DC-614e RAID bus controller.

Signed-off-by: Daniel Kral <d.kral@proxmox.com>
Link: https://lore.kernel.org/r/20250304092030.37108-1-d.kral@proxmox.com
Signed-off-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ata/ahci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
index f813dbdc2346f..52ae8f9a7dd61 100644
--- a/drivers/ata/ahci.c
+++ b/drivers/ata/ahci.c
@@ -589,6 +589,8 @@ static const struct pci_device_id ahci_pci_tbl[] = {
 	  .driver_data = board_ahci_yes_fbs },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MARVELL_EXT, 0x91a3),
 	  .driver_data = board_ahci_yes_fbs },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MARVELL_EXT, 0x9215),
+	  .driver_data = board_ahci_yes_fbs },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MARVELL_EXT, 0x9230),
 	  .driver_data = board_ahci_yes_fbs },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MARVELL_EXT, 0x9235),
-- 
2.39.5


