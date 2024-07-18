Return-Path: <linux-ide+bounces-1916-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E5B934BBA
	for <lists+linux-ide@lfdr.de>; Thu, 18 Jul 2024 12:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23F43B224D3
	for <lists+linux-ide@lfdr.de>; Thu, 18 Jul 2024 10:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8A57FBB7;
	Thu, 18 Jul 2024 10:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFd4aUP4"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8902C1EA80
	for <linux-ide@vger.kernel.org>; Thu, 18 Jul 2024 10:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721298841; cv=none; b=ZaEsk4VU8+RP1RvfiWjjGqywURjg/PJXk7rN40GE0K9p1O+DR6cH3v+8aGcOEt+BX3In8qCRdKAanF9PbCxj43trTuBaq6Q3A+D+7L77rYNf0HdBEM1YVIx14FNTFxIwHUJTdMACLKn6Ct6MCYdGTcaGkW+Gw6yxU7oxHDo7H2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721298841; c=relaxed/simple;
	bh=oDCOVbbnCTH3ChHzR7fuuqioWy05iWEvPv7tGC3aBo4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCa4EZw8S5XBPIB6W0Zqn4DqXEJ1LX2F8XzGGV56w5LjgJeut3Hmr7ptK/vit0r84Lylj4MwjLbKkIf3voj0TfQ2RU53e50KSrLR7NPmUIiT8L7ldvNxsovWRctNE6t6n773EAVjOl8JQx2hXVN5CChy/HISHLcHX5PcJr0Lt10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFd4aUP4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B401FC116B1;
	Thu, 18 Jul 2024 10:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721298841;
	bh=oDCOVbbnCTH3ChHzR7fuuqioWy05iWEvPv7tGC3aBo4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NFd4aUP4UdmP5bp5v7kYKt6WLH4BPCRlX6Jjio+qWRrXpbMmfvtflq66uaDWzGQNu
	 2/S20498Xa4xrZHVPwpWM1S4N3j8aEdgacXKQB6Oh+EfGM+gfZtw0hke/ABfXYazzN
	 YZknnCvdrtA5D7vQEewj7ZYbSSXbWHXAao0lRvrbLh3yWd6jOyk/d9tNiL+IrkqIXm
	 g/V2vFKjhXNsuiUs/YS7fN5oYOK9bsaKg3+sli901m4cjRAPKAhY6RU3hubT688kn6
	 XYAvZ7tX8U9AY4KV5QN6zi3d0xPec0VOrCJCsTFzSgsddLBm6kKdlH2ILgDi22bGKF
	 1VyrYCM3G3LaQ==
From: Damien Le Moal <dlemoal@kernel.org>
To: linux-ide@vger.kernel.org,
	Niklas Cassel <cassel@kernel.org>
Subject: [PATCH v2 2/3] ata: libata: Rename ata_dev_blacklisted()
Date: Thu, 18 Jul 2024 19:33:57 +0900
Message-ID: <20240718103358.176260-3-dlemoal@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718103358.176260-1-dlemoal@kernel.org>
References: <20240718103358.176260-1-dlemoal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the function ata_dev_blacklisted() to ata_dev_horkage() as this
new name:
1) Does not use an expression that can be considered as negatively loaded.
2) The name does not reflect what the function actually does, which is
   returning a set of horkage flag for the device, of which only one
   flag will completely disable the device.

Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/ata/libata-core.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 286e1bc02540..ee958d2893e6 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -84,7 +84,7 @@ static unsigned int ata_dev_init_params(struct ata_device *dev,
 					u16 heads, u16 sectors);
 static unsigned int ata_dev_set_xfermode(struct ata_device *dev);
 static void ata_dev_xfermask(struct ata_device *dev);
-static unsigned long ata_dev_blacklisted(const struct ata_device *dev);
+static unsigned long ata_dev_horkage(const struct ata_device *dev);
 
 static DEFINE_IDA(ata_ida);
 
@@ -2223,7 +2223,7 @@ static inline u8 ata_dev_knobble(struct ata_device *dev)
 {
 	struct ata_port *ap = dev->link->ap;
 
-	if (ata_dev_blacklisted(dev) & ATA_HORKAGE_BRIDGE_OK)
+	if (ata_dev_horkage(dev) & ATA_HORKAGE_BRIDGE_OK)
 		return 0;
 
 	return ((ap->cbl == ATA_CBL_SATA) && (!ata_id_is_sata(dev->id)));
@@ -2830,7 +2830,7 @@ int ata_dev_configure(struct ata_device *dev)
 	}
 
 	/* set horkage */
-	dev->horkage |= ata_dev_blacklisted(dev);
+	dev->horkage |= ata_dev_horkage(dev);
 	ata_force_horkage(dev);
 
 	if (dev->horkage & ATA_HORKAGE_DISABLE) {
@@ -3987,13 +3987,13 @@ int ata_dev_revalidate(struct ata_device *dev, unsigned int new_class,
 	return rc;
 }
 
-struct ata_blacklist_entry {
+struct ata_dev_horkage_entry {
 	const char *model_num;
 	const char *model_rev;
 	unsigned long horkage;
 };
 
-static const struct ata_blacklist_entry ata_device_blacklist [] = {
+static const struct ata_dev_horkage_entry ata_dev_horkages[] = {
 	/* Devices with DMA related problems under Linux */
 	{ "WDC AC11000H",	NULL,		ATA_HORKAGE_NODMA },
 	{ "WDC AC22100H",	NULL,		ATA_HORKAGE_NODMA },
@@ -4111,7 +4111,7 @@ static const struct ata_blacklist_entry ata_device_blacklist [] = {
 
 	/* Devices which get the IVB wrong */
 	{ "QUANTUM FIREBALLlct10 05", "A03.0900", ATA_HORKAGE_IVB },
-	/* Maybe we should just blacklist TSSTcorp... */
+	/* Maybe we should just add all TSSTcorp devices... */
 	{ "TSSTcorp CDDVDW SH-S202[HJN]", "SB0[01]",  ATA_HORKAGE_IVB },
 
 	/* Devices that do not need bridging limits applied */
@@ -4266,11 +4266,11 @@ static const struct ata_blacklist_entry ata_device_blacklist [] = {
 	{ }
 };
 
-static unsigned long ata_dev_blacklisted(const struct ata_device *dev)
+static unsigned long ata_dev_horkage(const struct ata_device *dev)
 {
 	unsigned char model_num[ATA_ID_PROD_LEN + 1];
 	unsigned char model_rev[ATA_ID_FW_REV_LEN + 1];
-	const struct ata_blacklist_entry *ad = ata_device_blacklist;
+	const struct ata_dev_horkage_entry *ad = ata_dev_horkages;
 
 	ata_id_c_string(dev->id, model_num, ATA_ID_PROD, sizeof(model_num));
 	ata_id_c_string(dev->id, model_rev, ATA_ID_FW_REV, sizeof(model_rev));
@@ -4372,8 +4372,7 @@ static int cable_is_40wire(struct ata_port *ap)
  *
  *	Compute supported xfermask of @dev and store it in
  *	dev->*_mask.  This function is responsible for applying all
- *	known limits including host controller limits, device
- *	blacklist, etc...
+ *	known limits including host controller limits, device horkages, etc...
  *
  *	LOCKING:
  *	None.
-- 
2.45.2


