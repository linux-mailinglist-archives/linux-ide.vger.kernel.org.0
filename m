Return-Path: <linux-ide+bounces-3924-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B17AAF6B43
	for <lists+linux-ide@lfdr.de>; Thu,  3 Jul 2025 09:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F4F87A7C46
	for <lists+linux-ide@lfdr.de>; Thu,  3 Jul 2025 07:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB18B293B53;
	Thu,  3 Jul 2025 07:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wen9/nC2"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DBC1CD1F
	for <linux-ide@vger.kernel.org>; Thu,  3 Jul 2025 07:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751527072; cv=none; b=G+nreeeZDHNhlk1TNwSnqOp+/mznJKq8g9fPHmzx3pGfZkVD6Xlk9PMwj+yetYlvrGJUZqtk5JA0Xlw3sR6OjaQTThGyG1deD5zrvSboQtfxJhPzgtqWMwBus+Qx5L8NWhIvPdcQO0pfM1G2PHiw2+5vlvoj8hoVdeFXv2TwZ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751527072; c=relaxed/simple;
	bh=gMAj5RPERgxF43/PwX4x2bEOb+3HJakZdODwPIG/Dr4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PBO0/8KhF7q3sz+tIKEj2lKofU9M9hBuCJownt/fhNhEVkV9SCy2I5yAgE4ma/5vZboZGVupL3+jRb2Oe006hZGcXvREeYhb6y7HjqRwT/4wzdNRchWVPWqP/b8JQrFOBFIg8UcnKzngtyfI4bqOxm72v/a7RtYkE2q2CN3mvIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wen9/nC2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C53C4CEF1;
	Thu,  3 Jul 2025 07:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751527071;
	bh=gMAj5RPERgxF43/PwX4x2bEOb+3HJakZdODwPIG/Dr4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Wen9/nC2pFl5qzuZtBhkQS3ClfPFsjG5ti0Lsp6FsEmio63vQNUTxyR5fyPhxuQcP
	 Q6PN45hW3cX2Wh++3na5lul1tc9xFceC3Ag70tBU935pDL8ODlJES1fPlh8GyjrAGC
	 Z28VSYSI+W+7wyI9b1yJFb6TjrTxe0eJOt5d0CeS3IqDFRYB8o08ppUvEOYqDHmBqc
	 RH+Jb84aXen+M4KS6rTVk/LFffQE11WEmdwFC/jlDkuvTrlCxRHfxIlZlcDjTs2wwj
	 brU125o1UXLqN33NRIroWVJMfpG480nRBMypSHEDEyxc/ssvKcpP/YoSnpLLZGK0sU
	 2zisXzyS5twlQ==
From: Damien Le Moal <dlemoal@kernel.org>
To: linux-ide@vger.kernel.org,
	Niklas Cassel <cassel@kernel.org>
Subject: [PATCH 1/3] ata: libata-core: Cache the general purpose log directory
Date: Thu,  3 Jul 2025 16:15:39 +0900
Message-ID: <20250703071541.278243-2-dlemoal@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703071541.278243-1-dlemoal@kernel.org>
References: <20250703071541.278243-1-dlemoal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function ata_log_supported() tests if a log page is supported by a
device using the General Purpose Log Directory log page, which lists the
size of all surported log pages. However, this log page is read from the
device using ata_read_log_page() every time ata_log_supported() is
called. That is not necessary.

Avoid reading the General Purpose Log Directory log page by caching its
content in the gp_log_dir buffer defined as part of struct ata_device.
The functions ata_read_log_directory() and ata_clear_log_directory() are
introduced to manage this buffer. ata_clear_log_directory() zero-fill
the gp_log_dir buffer every time ata_dev_configure() is called, that is,
when the device is first scanned and when it is being revalidated.
The function ata_log_supported() is modified to call
ata_read_log_directory() instead of ata_read_log_page().

The function ata_read_log_directory() calls ata_read_log_page() to read
the General Purpose Log Directory log page from the device only if the
first 16-bits word of the log is not equal to 0x0001, that is, it is not
equal to the ACS mandated value for the log version.

With this, the log page is read from the device only once for every
ata_dev_configure() call. For instance, with pr_debug enabled, a call
to ata_dev_configure() before this patch generates the following log
page accesses:

ata3.00: read log page - log 0x0, page 0x0
ata3.00: read log page - log 0x13, page 0x0
ata3.00: read log page - log 0x0, page 0x0
ata3.00: read log page - log 0x12, page 0x0
ata3.00: read log page - log 0x0, page 0x0
ata3.00: read log page - log 0x30, page 0x0
ata3.00: read log page - log 0x30, page 0x8
ata3.00: read log page - log 0x0, page 0x0
ata3.00: read log page - log 0x0, page 0x0
ata3.00: read log page - log 0x0, page 0x0
ata3.00: read log page - log 0x30, page 0x0
ata3.00: read log page - log 0x0, page 0x0
ata3.00: read log page - log 0x30, page 0x0
ata3.00: read log page - log 0x30, page 0x3
ata3.00: read log page - log 0x30, page 0x4
ata3.00: read log page - log 0x18, page 0x0

That is, the general purpose log directory page is read 7 times.
With this patch applied, the number of accesses to this log page is
reduced to one:

ata3.00: read log page - log 0x0, page 0x0
ata3.00: read log page - log 0x13, page 0x0
ata3.00: read log page - log 0x12, page 0x0
ata3.00: read log page - log 0x30, page 0x0
ata3.00: read log page - log 0x30, page 0x8
ata3.00: read log page - log 0x30, page 0x0
ata3.00: read log page - log 0x30, page 0x0
ata3.00: read log page - log 0x30, page 0x3
ata3.00: read log page - log 0x30, page 0x4
ata3.00: read log page - log 0x18, page 0x0

Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/ata/libata-core.c | 37 +++++++++++++++++++++++++++++++++++--
 include/linux/libata.h    |  3 +++
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 7f6cebe61b33..806ff5cee2b4 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -2154,14 +2154,44 @@ unsigned int ata_read_log_page(struct ata_device *dev, u8 log,
 	return err_mask;
 }
 
+static inline void ata_clear_log_directory(struct ata_device *dev)
+{
+	memset(dev->gp_log_dir, 0, ATA_SECT_SIZE);
+}
+
+static int ata_read_log_directory(struct ata_device *dev)
+{
+	u16 version;
+
+	/* If the log page is already cached, do nothing. */
+	version = get_unaligned_le16(&dev->gp_log_dir[0]);
+	if (version == 0x0001)
+		return 0;
+
+	if (ata_read_log_page(dev, ATA_LOG_DIRECTORY, 0, dev->gp_log_dir, 1)) {
+		ata_clear_log_directory(dev);
+		return -EIO;
+	}
+
+	version = get_unaligned_le16(&dev->gp_log_dir[0]);
+	if (version != 0x0001) {
+		ata_dev_err(dev, "Invalid log directory version 0x%04x\n",
+			    version);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int ata_log_supported(struct ata_device *dev, u8 log)
 {
 	if (dev->quirks & ATA_QUIRK_NO_LOG_DIR)
 		return 0;
 
-	if (ata_read_log_page(dev, ATA_LOG_DIRECTORY, 0, dev->sector_buf, 1))
+	if (ata_read_log_directory(dev))
 		return 0;
-	return get_unaligned_le16(&dev->sector_buf[log * 2]);
+
+	return get_unaligned_le16(&dev->gp_log_dir[log * 2]);
 }
 
 static bool ata_identify_page_supported(struct ata_device *dev, u8 page)
@@ -2890,6 +2920,9 @@ int ata_dev_configure(struct ata_device *dev)
 		return 0;
 	}
 
+	/* Clear the general purpose log directory cache. */
+	ata_clear_log_directory(dev);
+
 	/* Set quirks */
 	dev->quirks |= ata_dev_quirks(dev);
 	ata_force_quirks(dev);
diff --git a/include/linux/libata.h b/include/linux/libata.h
index 7462218312ad..78a4addc6659 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -761,6 +761,9 @@ struct ata_device {
 		u32		gscr[SATA_PMP_GSCR_DWORDS]; /* PMP GSCR block */
 	} ____cacheline_aligned;
 
+	/* General Purpose Log Directory log page */
+	u8			gp_log_dir[ATA_SECT_SIZE] ____cacheline_aligned;
+
 	/* DEVSLP Timing Variables from Identify Device Data Log */
 	u8			devslp_timing[ATA_LOG_DEVSLP_SIZE];
 
-- 
2.50.0


