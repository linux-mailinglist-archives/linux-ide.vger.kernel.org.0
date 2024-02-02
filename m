Return-Path: <linux-ide+bounces-425-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C4E847843
	for <lists+linux-ide@lfdr.de>; Fri,  2 Feb 2024 19:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A91921F2F75C
	for <lists+linux-ide@lfdr.de>; Fri,  2 Feb 2024 18:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D79C153BE4;
	Fri,  2 Feb 2024 18:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g1rBH88i"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3302F13249D;
	Fri,  2 Feb 2024 18:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706899238; cv=none; b=R/eFA2th3EyG4sXwSE8JRZp0XfdzZ4qAs710ZNhlNRW1AREh+CTuNkeWhLu+sVSFO54ILwgNd8Hr90j6cLQZa3tAI9Mu1W6hOmnMhYvsFX5BNjm374SZCLLmc1ct5tiBatnKx5h4Wr+qLuRPdXKWWMQfBf3X+xbh22sDRHYeR58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706899238; c=relaxed/simple;
	bh=+DqmJrtQ5ijipvQMftzNqfUlSkyApmqR3NlAhKuNcfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQw7qNBEpKTmmRKVEPdTGksZnV2yZJ2PPRbjM8eJa8ExwhnTMi0LHbu83V9ji8itsPMpjFo4XdZSfK/TZ4ueeCrCnFU+F9Pc9BeuDV2Xa7y78luCrRSNDtIbQv5wWbKzF0Ip47Yacsl3BNARu6PuOU74E+Y/mNxbDByu2oE9ViQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1rBH88i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26098C43394;
	Fri,  2 Feb 2024 18:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706899238;
	bh=+DqmJrtQ5ijipvQMftzNqfUlSkyApmqR3NlAhKuNcfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g1rBH88iHB180OIhFyQ2Zco13UVPpPJ/+umEA6/BzXDptW/M+y83uggmYidJ7toDy
	 2GXv8asyaVb7ywOr0F3dY3H4wr5Og3Wtstsl/RfAi3d6M+Il9c7zL9IFXB6vdCF2Qd
	 8FsXzKnhTitTwSmGAodBRNQQUDMjAbY7vwOcVT9ffalK/il+hxI1FKpVUroBx8WK+S
	 3KSpROGRzb0A+8fV4+24MpO6PDgKj3qiQhDXh8cpgtucVypYNBpfUlFmwVAOP0f1Sy
	 8mbViX5Q8lI9fDITqvoy9srEeJSOUqcJwyvnkkbIvZS0QoQHsziJ2GjWPYb0zrpRIX
	 AgrlJaJGkCM6Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Conrad Kostecki <conikost@gentoo.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Niklas Cassel <cassel@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	dlemoal@kernel.org,
	linux-ide@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 14/21] ahci: asm1166: correct count of reported ports
Date: Fri,  2 Feb 2024 13:40:01 -0500
Message-ID: <20240202184015.540966-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202184015.540966-1-sashal@kernel.org>
References: <20240202184015.540966-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.15
Content-Transfer-Encoding: 8bit

From: Conrad Kostecki <conikost@gentoo.org>

[ Upstream commit 0077a504e1a4468669fd2e011108db49133db56e ]

The ASM1166 SATA host controller always reports wrongly,
that it has 32 ports. But in reality, it only has six ports.

This seems to be a hardware issue, as all tested ASM1166
SATA host controllers reports such high count of ports.

Example output: ahci 0000:09:00.0: AHCI 0001.0301
32 slots 32 ports 6 Gbps 0xffffff3f impl SATA mode.

By adjusting the port_map, the count is limited to six ports.

New output: ahci 0000:09:00.0: AHCI 0001.0301
32 slots 32 ports 6 Gbps 0x3f impl SATA mode.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=211873
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218346
Signed-off-by: Conrad Kostecki <conikost@gentoo.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ata/ahci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
index 08745e7db820..2b8f0c3c3879 100644
--- a/drivers/ata/ahci.c
+++ b/drivers/ata/ahci.c
@@ -657,6 +657,11 @@ MODULE_PARM_DESC(mobile_lpm_policy, "Default LPM policy for mobile chipsets");
 static void ahci_pci_save_initial_config(struct pci_dev *pdev,
 					 struct ahci_host_priv *hpriv)
 {
+	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA && pdev->device == 0x1166) {
+		dev_info(&pdev->dev, "ASM1166 has only six ports\n");
+		hpriv->saved_port_map = 0x3f;
+	}
+
 	if (pdev->vendor == PCI_VENDOR_ID_JMICRON && pdev->device == 0x2361) {
 		dev_info(&pdev->dev, "JMB361 has only one port\n");
 		hpriv->saved_port_map = 1;
-- 
2.43.0


