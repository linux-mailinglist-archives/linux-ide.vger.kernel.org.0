Return-Path: <linux-ide+bounces-2192-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CDE967CE0
	for <lists+linux-ide@lfdr.de>; Mon,  2 Sep 2024 02:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AB111C20CA0
	for <lists+linux-ide@lfdr.de>; Mon,  2 Sep 2024 00:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F16D14290;
	Mon,  2 Sep 2024 00:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QC1Xmozi"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC1BEEB5
	for <linux-ide@vger.kernel.org>; Mon,  2 Sep 2024 00:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725235251; cv=none; b=pGEyQ/ue8dkgPDLckaQUkfOF2NCC8q5jLaOnN1cNaTLe5+CuKh2IJAlvC2fp9IBelVS2CHP8Ps1CMz1jbQU2sdKlwv1r4K9THry+9jQVQWj2MMqCyZ/nhPq2H4o2GD75qDO4idfGyIrGLc4O+yYATJ/fuXWTDWoXu/tZSpkXG3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725235251; c=relaxed/simple;
	bh=DXqXunIofpQUev6bkaEKtbmLvHpqFNjNvI0MH0H3wfc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VsdBqwMbvWiF1/TXHcMIhyJ2/9kZEXqu+T1az9VP5MXWNRBse71RcMHcNpAjyhEhTzUV2IrUQOixtHGHKu7VSLqjnPpM0Ts88scaU0V2w+JrY0J6TK/DkEZSomkIxFocOZ2vEeZuiU1dccSpcHaV9/FBPmaocrpqLnLnOOylRSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QC1Xmozi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0D3C4CEC3;
	Mon,  2 Sep 2024 00:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725235250;
	bh=DXqXunIofpQUev6bkaEKtbmLvHpqFNjNvI0MH0H3wfc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QC1XmoziDatT5gyoYin/0HIpkiiIbRj4rG4sculNxuFAQsUlf4Fd3mtM9+nNZBLO7
	 SMQ5pW0lTJjmerBvkARb6y7ZYH5Xw7IVzZc9dzwnGy/KQDSELKyzkgLKVpO5HgjOHx
	 2qi4spfEpUxtIazdOwj3x456EHLdgEF3r3R75KXT64ZrW1mRzPgZk4xeanKuXj9jwk
	 TEiRTpcF7zEwMjiLYdIb37lM1dOsKNsaWyppPWawCQ4dwkyzU+h9w4K7l2I5qWS7p7
	 bMHH760TGU9EO2KnJ2x9p9QS5hqxaQlDRSR0hu4JymQAe/QjJ8Z8SS+PGYgyajDMFg
	 91lOtjdMONNvA==
From: Damien Le Moal <dlemoal@kernel.org>
To: linux-ide@vger.kernel.org,
	Niklas Cassel <cassel@kernel.org>
Subject: [PATCH v2 6/7] ata: libata: Move sector_buf from struct ata_port to struct ata_device
Date: Mon,  2 Sep 2024 09:00:42 +0900
Message-ID: <20240902000043.155495-7-dlemoal@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902000043.155495-1-dlemoal@kernel.org>
References: <20240902000043.155495-1-dlemoal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 512B buffer sector_buf field of struct ata_port is used for scanning
devices as well as during error recovery with ata EH. This buffer is
thus useless if a port does not have a device connected to it.
And also given that commands using this buffer are issued to devices,
and not to ports, move this buffer definition from struct ata_port to
struct ata_device.

This change slightly increases system memory usage for systems using a
port-multiplier as in that case we do not need a per-device buffer for
scanning devices (PMP does not allow parallel scanning) nor for EH (as
when entering EH we are guaranteed that all commands to all devices
connected to the PMP have completed or have been aborted). However,
this change reduces memory usage on systems that have many ports with
only few devices rives connected, which is a much more common use case
than the PMP use case.

Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/ata/libata-core.c  | 63 ++++++++++++++++----------------------
 drivers/ata/libata-eh.c    |  2 +-
 drivers/ata/libata-pmp.c   |  3 +-
 drivers/ata/libata-sata.c  |  2 +-
 drivers/ata/libata-zpodd.c |  2 +-
 include/linux/libata.h     |  4 ++-
 6 files changed, 33 insertions(+), 43 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index b5a051bbb01f..32325a1c07af 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -2125,19 +2125,16 @@ unsigned int ata_read_log_page(struct ata_device *dev, u8 log,
 
 static int ata_log_supported(struct ata_device *dev, u8 log)
 {
-	struct ata_port *ap = dev->link->ap;
-
 	if (dev->quirks & ATA_QUIRK_NO_LOG_DIR)
 		return 0;
 
-	if (ata_read_log_page(dev, ATA_LOG_DIRECTORY, 0, ap->sector_buf, 1))
+	if (ata_read_log_page(dev, ATA_LOG_DIRECTORY, 0, dev->sector_buf, 1))
 		return 0;
-	return get_unaligned_le16(&ap->sector_buf[log * 2]);
+	return get_unaligned_le16(&dev->sector_buf[log * 2]);
 }
 
 static bool ata_identify_page_supported(struct ata_device *dev, u8 page)
 {
-	struct ata_port *ap = dev->link->ap;
 	unsigned int err, i;
 
 	if (dev->quirks & ATA_QUIRK_NO_ID_DEV_LOG)
@@ -2160,13 +2157,13 @@ static bool ata_identify_page_supported(struct ata_device *dev, u8 page)
 	 * Read IDENTIFY DEVICE data log, page 0, to figure out if the page is
 	 * supported.
 	 */
-	err = ata_read_log_page(dev, ATA_LOG_IDENTIFY_DEVICE, 0, ap->sector_buf,
-				1);
+	err = ata_read_log_page(dev, ATA_LOG_IDENTIFY_DEVICE, 0,
+				dev->sector_buf, 1);
 	if (err)
 		return false;
 
-	for (i = 0; i < ap->sector_buf[8]; i++) {
-		if (ap->sector_buf[9 + i] == page)
+	for (i = 0; i < dev->sector_buf[8]; i++) {
+		if (dev->sector_buf[9 + i] == page)
 			return true;
 	}
 
@@ -2218,7 +2215,6 @@ static inline bool ata_dev_knobble(struct ata_device *dev)
 
 static void ata_dev_config_ncq_send_recv(struct ata_device *dev)
 {
-	struct ata_port *ap = dev->link->ap;
 	unsigned int err_mask;
 
 	if (!ata_log_supported(dev, ATA_LOG_NCQ_SEND_RECV)) {
@@ -2226,12 +2222,12 @@ static void ata_dev_config_ncq_send_recv(struct ata_device *dev)
 		return;
 	}
 	err_mask = ata_read_log_page(dev, ATA_LOG_NCQ_SEND_RECV,
-				     0, ap->sector_buf, 1);
+				     0, dev->sector_buf, 1);
 	if (!err_mask) {
 		u8 *cmds = dev->ncq_send_recv_cmds;
 
 		dev->flags |= ATA_DFLAG_NCQ_SEND_RECV;
-		memcpy(cmds, ap->sector_buf, ATA_LOG_NCQ_SEND_RECV_SIZE);
+		memcpy(cmds, dev->sector_buf, ATA_LOG_NCQ_SEND_RECV_SIZE);
 
 		if (dev->quirks & ATA_QUIRK_NO_NCQ_TRIM) {
 			ata_dev_dbg(dev, "disabling queued TRIM support\n");
@@ -2243,7 +2239,6 @@ static void ata_dev_config_ncq_send_recv(struct ata_device *dev)
 
 static void ata_dev_config_ncq_non_data(struct ata_device *dev)
 {
-	struct ata_port *ap = dev->link->ap;
 	unsigned int err_mask;
 
 	if (!ata_log_supported(dev, ATA_LOG_NCQ_NON_DATA)) {
@@ -2252,17 +2247,14 @@ static void ata_dev_config_ncq_non_data(struct ata_device *dev)
 		return;
 	}
 	err_mask = ata_read_log_page(dev, ATA_LOG_NCQ_NON_DATA,
-				     0, ap->sector_buf, 1);
-	if (!err_mask) {
-		u8 *cmds = dev->ncq_non_data_cmds;
-
-		memcpy(cmds, ap->sector_buf, ATA_LOG_NCQ_NON_DATA_SIZE);
-	}
+				     0, dev->sector_buf, 1);
+	if (!err_mask)
+		memcpy(dev->ncq_non_data_cmds, dev->sector_buf,
+		       ATA_LOG_NCQ_NON_DATA_SIZE);
 }
 
 static void ata_dev_config_ncq_prio(struct ata_device *dev)
 {
-	struct ata_port *ap = dev->link->ap;
 	unsigned int err_mask;
 
 	if (!ata_identify_page_supported(dev, ATA_LOG_SATA_SETTINGS))
@@ -2271,12 +2263,11 @@ static void ata_dev_config_ncq_prio(struct ata_device *dev)
 	err_mask = ata_read_log_page(dev,
 				     ATA_LOG_IDENTIFY_DEVICE,
 				     ATA_LOG_SATA_SETTINGS,
-				     ap->sector_buf,
-				     1);
+				     dev->sector_buf, 1);
 	if (err_mask)
 		goto not_supported;
 
-	if (!(ap->sector_buf[ATA_LOG_NCQ_PRIO_OFFSET] & BIT(3)))
+	if (!(dev->sector_buf[ATA_LOG_NCQ_PRIO_OFFSET] & BIT(3)))
 		goto not_supported;
 
 	dev->flags |= ATA_DFLAG_NCQ_PRIO;
@@ -2392,9 +2383,8 @@ static void ata_dev_config_sense_reporting(struct ata_device *dev)
 
 static void ata_dev_config_zac(struct ata_device *dev)
 {
-	struct ata_port *ap = dev->link->ap;
 	unsigned int err_mask;
-	u8 *identify_buf = ap->sector_buf;
+	u8 *identify_buf = dev->sector_buf;
 
 	dev->zac_zones_optimal_open = U32_MAX;
 	dev->zac_zones_optimal_nonseq = U32_MAX;
@@ -2446,7 +2436,6 @@ static void ata_dev_config_zac(struct ata_device *dev)
 
 static void ata_dev_config_trusted(struct ata_device *dev)
 {
-	struct ata_port *ap = dev->link->ap;
 	u64 trusted_cap;
 	unsigned int err;
 
@@ -2460,11 +2449,11 @@ static void ata_dev_config_trusted(struct ata_device *dev)
 	}
 
 	err = ata_read_log_page(dev, ATA_LOG_IDENTIFY_DEVICE, ATA_LOG_SECURITY,
-			ap->sector_buf, 1);
+				dev->sector_buf, 1);
 	if (err)
 		return;
 
-	trusted_cap = get_unaligned_le64(&ap->sector_buf[40]);
+	trusted_cap = get_unaligned_le64(&dev->sector_buf[40]);
 	if (!(trusted_cap & (1ULL << 63))) {
 		ata_dev_dbg(dev,
 			    "Trusted Computing capability qword not valid!\n");
@@ -2492,12 +2481,12 @@ static void ata_dev_config_cdl(struct ata_device *dev)
 
 	err_mask = ata_read_log_page(dev, ATA_LOG_IDENTIFY_DEVICE,
 				     ATA_LOG_SUPPORTED_CAPABILITIES,
-				     ap->sector_buf, 1);
+				     dev->sector_buf, 1);
 	if (err_mask)
 		goto not_supported;
 
 	/* Check Command Duration Limit Supported bits */
-	val = get_unaligned_le64(&ap->sector_buf[168]);
+	val = get_unaligned_le64(&dev->sector_buf[168]);
 	if (!(val & BIT_ULL(63)) || !(val & BIT_ULL(0)))
 		goto not_supported;
 
@@ -2510,7 +2499,7 @@ static void ata_dev_config_cdl(struct ata_device *dev)
 	 * We must have support for the sense data for successful NCQ commands
 	 * log indicated by the successful NCQ command sense data supported bit.
 	 */
-	val = get_unaligned_le64(&ap->sector_buf[8]);
+	val = get_unaligned_le64(&dev->sector_buf[8]);
 	if (!(val & BIT_ULL(63)) || !(val & BIT_ULL(47))) {
 		ata_dev_warn(dev,
 			"CDL supported but Successful NCQ Command Sense Data is not supported\n");
@@ -2530,11 +2519,11 @@ static void ata_dev_config_cdl(struct ata_device *dev)
 	 */
 	err_mask = ata_read_log_page(dev, ATA_LOG_IDENTIFY_DEVICE,
 				     ATA_LOG_CURRENT_SETTINGS,
-				     ap->sector_buf, 1);
+				     dev->sector_buf, 1);
 	if (err_mask)
 		goto not_supported;
 
-	val = get_unaligned_le64(&ap->sector_buf[8]);
+	val = get_unaligned_le64(&dev->sector_buf[8]);
 	cdl_enabled = val & BIT_ULL(63) && val & BIT_ULL(21);
 	if (dev->flags & ATA_DFLAG_CDL_ENABLED) {
 		if (!cdl_enabled) {
@@ -2591,13 +2580,13 @@ static void ata_dev_config_cdl(struct ata_device *dev)
 	 * Command duration limits is supported: cache the CDL log page 18h
 	 * (command duration descriptors).
 	 */
-	err_mask = ata_read_log_page(dev, ATA_LOG_CDL, 0, ap->sector_buf, 1);
+	err_mask = ata_read_log_page(dev, ATA_LOG_CDL, 0, dev->sector_buf, 1);
 	if (err_mask) {
 		ata_dev_warn(dev, "Read Command Duration Limits log failed\n");
 		goto not_supported;
 	}
 
-	memcpy(dev->cdl, ap->sector_buf, ATA_LOG_CDL_SIZE);
+	memcpy(dev->cdl, dev->sector_buf, ATA_LOG_CDL_SIZE);
 	dev->flags |= ATA_DFLAG_CDL;
 
 	return;
@@ -2689,7 +2678,7 @@ static void ata_dev_config_fua(struct ata_device *dev)
 
 static void ata_dev_config_devslp(struct ata_device *dev)
 {
-	u8 *sata_setting = dev->link->ap->sector_buf;
+	u8 *sata_setting = dev->sector_buf;
 	unsigned int err_mask;
 	int i, j;
 
@@ -3759,7 +3748,7 @@ static int ata_dev_same_device(struct ata_device *dev, unsigned int new_class,
 int ata_dev_reread_id(struct ata_device *dev, unsigned int readid_flags)
 {
 	unsigned int class = dev->class;
-	u16 *id = (void *)dev->link->ap->sector_buf;
+	u16 *id = (void *)dev->sector_buf;
 	int rc;
 
 	/* read ID data */
diff --git a/drivers/ata/libata-eh.c b/drivers/ata/libata-eh.c
index d2747a0d684c..ed535e1b4225 100644
--- a/drivers/ata/libata-eh.c
+++ b/drivers/ata/libata-eh.c
@@ -3284,7 +3284,7 @@ static int atapi_eh_clear_ua(struct ata_device *dev)
 	int i;
 
 	for (i = 0; i < ATA_EH_UA_TRIES; i++) {
-		u8 *sense_buffer = dev->link->ap->sector_buf;
+		u8 *sense_buffer = dev->sector_buf;
 		u8 sense_key = 0;
 		unsigned int err_mask;
 
diff --git a/drivers/ata/libata-pmp.c b/drivers/ata/libata-pmp.c
index e2e9cbd405fa..d5d189328ae6 100644
--- a/drivers/ata/libata-pmp.c
+++ b/drivers/ata/libata-pmp.c
@@ -648,8 +648,7 @@ static int sata_pmp_same_pmp(struct ata_device *dev, const u32 *new_gscr)
 static int sata_pmp_revalidate(struct ata_device *dev, unsigned int new_class)
 {
 	struct ata_link *link = dev->link;
-	struct ata_port *ap = link->ap;
-	u32 *gscr = (void *)ap->sector_buf;
+	u32 *gscr = (void *)dev->sector_buf;
 	int rc;
 
 	ata_eh_about_to_do(link, NULL, ATA_EH_REVALIDATE);
diff --git a/drivers/ata/libata-sata.c b/drivers/ata/libata-sata.c
index 4e063cb42018..498430db86f7 100644
--- a/drivers/ata/libata-sata.c
+++ b/drivers/ata/libata-sata.c
@@ -1448,7 +1448,7 @@ EXPORT_SYMBOL_GPL(sata_async_notification);
 static int ata_eh_read_log_10h(struct ata_device *dev,
 			       int *tag, struct ata_taskfile *tf)
 {
-	u8 *buf = dev->link->ap->sector_buf;
+	u8 *buf = dev->sector_buf;
 	unsigned int err_mask;
 	u8 csum;
 	int i;
diff --git a/drivers/ata/libata-zpodd.c b/drivers/ata/libata-zpodd.c
index eefda51f97d3..4b83b517caec 100644
--- a/drivers/ata/libata-zpodd.c
+++ b/drivers/ata/libata-zpodd.c
@@ -112,7 +112,7 @@ static bool zpready(struct ata_device *dev)
 	if (!ret || sense_key != NOT_READY)
 		return false;
 
-	sense_buf = dev->link->ap->sector_buf;
+	sense_buf = dev->sector_buf;
 	ret = atapi_eh_request_sense(dev, sense_buf, sense_key);
 	if (ret)
 		return false;
diff --git a/include/linux/libata.h b/include/linux/libata.h
index 55a6b57742bc..aac38dcd2230 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -769,6 +769,9 @@ struct ata_device {
 	int			spdn_cnt;
 	/* ering is CLEAR_END, read comment above CLEAR_END */
 	struct ata_ering	ering;
+
+	/* For EH */
+	u8			sector_buf[ATA_SECT_SIZE] ____cacheline_aligned;
 };
 
 /* Fields between ATA_DEVICE_CLEAR_BEGIN and ATA_DEVICE_CLEAR_END are
@@ -916,7 +919,6 @@ struct ata_port {
 #endif
 	/* owned by EH */
 	u8			*ncq_sense_buf;
-	u8			sector_buf[ATA_SECT_SIZE] ____cacheline_aligned;
 };
 
 /* The following initializer overrides a method to NULL whether one of
-- 
2.46.0


