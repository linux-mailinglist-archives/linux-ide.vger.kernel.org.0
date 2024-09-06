Return-Path: <linux-ide+bounces-2242-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4597D96E77A
	for <lists+linux-ide@lfdr.de>; Fri,  6 Sep 2024 03:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B875A1F21860
	for <lists+linux-ide@lfdr.de>; Fri,  6 Sep 2024 01:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EA022315;
	Fri,  6 Sep 2024 01:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9DTJ9Rv"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CFD18E0E
	for <linux-ide@vger.kernel.org>; Fri,  6 Sep 2024 01:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725587935; cv=none; b=lOaToock2LxPjSBOlrJyzuxYauR/9oXN/sGle4xJJ9B+1ZVOlR0zOz86XwQbF7Q4Q6rFT8nBBcrfryVsiiMT8jaZ6bN28hO7ZpsN8YRKSk6wtvFdhJtJUF0xtVzZxiqrTtKVMFH0mjv7aEiZfKRPbMUQ/m4fRCNRaY3OAdV+i30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725587935; c=relaxed/simple;
	bh=CCwuMdEuaElYXq/n2Xn/Gu5ZDbwen9DBpaWbyw5ZAuk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=imNDq7GhEO1xti+A94CLp0lu2Ur/UMCF1bVDEHEB9/iRWNp5LZUXya+HzL4xkf0wzxv1xUm2XExTZwKqsPEd8mxO5J6HbdOd/f79Ir8LOSBGGpzCqnnahzHcisOpixSr14dB+jmImhOR0Z7vPMPe5Egi8ZyOfvfyXYJXoPbFNd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9DTJ9Rv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA9FC4CEC5;
	Fri,  6 Sep 2024 01:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725587935;
	bh=CCwuMdEuaElYXq/n2Xn/Gu5ZDbwen9DBpaWbyw5ZAuk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=i9DTJ9RvpgZEUIjxsB+xtjRbZZBFK3PIw7Myva84k3I02tr3sxeq3IFzyWzZNDbXA
	 YvnN7zDJkklGSlkcbVoMjBBcDT+VzBz+e+jUT1JkkIOPkdiYh6ewdkANZQUCASR91t
	 c/ZWvXY9baeaFdTxG0PzyuRpHNEREej+eUGa6gOasuTGXucJhPI+jelXfjBTgqSCbd
	 ODzBcK4S1ZSNRD6wV7NQl1eUZIkaJ5uTxxzb9LDMSCPUHz1hbI9SQubxMKs60MVsjm
	 g3yzSLhZSVy3sEY8ZpgHNDbKWPAB/+96TPRsGZSj/U54vv2Icy9D/21ju5cj/4O+Jo
	 D+qDGkozqgjbQ==
From: Damien Le Moal <dlemoal@kernel.org>
To: linux-ide@vger.kernel.org,
	Niklas Cassel <cassel@kernel.org>
Subject: [PATCH v5 9/9] ata: libata: Improve CDL resource management
Date: Fri,  6 Sep 2024 10:58:47 +0900
Message-ID: <20240906015847.229539-10-dlemoal@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906015847.229539-1-dlemoal@kernel.org>
References: <20240906015847.229539-1-dlemoal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ncq_sense_buf buffer field of struct ata_port is allocated and used
only for devices that support the Command Duration Limits (CDL) feature.
However, the cdl buffer of struct ata_device, which is used to cache the
command duration limits log page for devices supporting CDL is always
allocated as part of struct ata_device, which is wasteful of memory for
devices that do not support this feature.

Clean this up by defining both buffers as part of the new ata_cdl
structure and allocating this structure only for devices that support
the CDL feature. This new structure is attached to struct ata_device
using the cdl pointer.

The functions ata_dev_init_cdl_resources() and
ata_dev_cleanup_cdl_resources() are defined to manage this new structure
allocation, initialization and freeing when a port is removed or a
device disabled. ata_dev_init_cdl_resources() is called from
ata_dev_config_cdl() only for devices that support CDL.
ata_dev_cleanup_cdl_resources() is called from ata_dev_free_resources()
to free the ata_cdl structure when a device is being disabled by EH.

Note that the name of the former cdl log buffer of struct ata_device is
changed to desc_log_buf to make it clearer that it is a buffer for the
limit descriptors log page.

This change reduces the size of struct ata_device, thus reducing memory
usage for ATA devices that do not support the CDL feature.

Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/ata/libata-core.c | 60 +++++++++++++++++++++++----------------
 drivers/ata/libata-sata.c |  2 +-
 drivers/ata/libata-scsi.c |  2 +-
 drivers/ata/libata.h      |  1 +
 include/linux/libata.h    | 21 +++++++++++---
 5 files changed, 56 insertions(+), 30 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index bfd452b0d46d..bd2f8e442b14 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -2464,12 +2464,40 @@ static void ata_dev_config_trusted(struct ata_device *dev)
 		dev->flags |= ATA_DFLAG_TRUSTED;
 }
 
+static int ata_dev_init_cdl_resources(struct ata_device *dev)
+{
+	struct ata_cdl *cdl = dev->cdl;
+	unsigned int err_mask;
+
+	if (!cdl) {
+		cdl = kzalloc(sizeof(*cdl), GFP_KERNEL);
+		if (!cdl)
+			return -ENOMEM;
+		dev->cdl = cdl;
+	}
+
+	err_mask = ata_read_log_page(dev, ATA_LOG_CDL, 0, cdl->desc_log_buf,
+				     ATA_LOG_CDL_SIZE / ATA_SECT_SIZE);
+	if (err_mask) {
+		ata_dev_warn(dev, "Read Command Duration Limits log failed\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+void ata_dev_cleanup_cdl_resources(struct ata_device *dev)
+{
+	kfree(dev->cdl);
+	dev->cdl = NULL;
+}
+
 static void ata_dev_config_cdl(struct ata_device *dev)
 {
-	struct ata_port *ap = dev->link->ap;
 	unsigned int err_mask;
 	bool cdl_enabled;
 	u64 val;
+	int ret;
 
 	if (ata_id_major_version(dev->id) < 11)
 		goto not_supported;
@@ -2564,37 +2592,20 @@ static void ata_dev_config_cdl(struct ata_device *dev)
 		}
 	}
 
-	/*
-	 * Allocate a buffer to handle reading the sense data for successful
-	 * NCQ Commands log page for commands using a CDL with one of the limit
-	 * policy set to 0xD (successful completion with sense data available
-	 * bit set).
-	 */
-	if (!ap->ncq_sense_buf) {
-		ap->ncq_sense_buf = kmalloc(ATA_LOG_SENSE_NCQ_SIZE, GFP_KERNEL);
-		if (!ap->ncq_sense_buf)
-			goto not_supported;
-	}
-
-	/*
-	 * Command duration limits is supported: cache the CDL log page 18h
-	 * (command duration descriptors).
-	 */
-	err_mask = ata_read_log_page(dev, ATA_LOG_CDL, 0, dev->sector_buf, 1);
-	if (err_mask) {
-		ata_dev_warn(dev, "Read Command Duration Limits log failed\n");
+	/* CDL is supported: allocate and initialize needed resources. */
+	ret = ata_dev_init_cdl_resources(dev);
+	if (ret) {
+		ata_dev_warn(dev, "Initialize CDL resources failed\n");
 		goto not_supported;
 	}
 
-	memcpy(dev->cdl, dev->sector_buf, ATA_LOG_CDL_SIZE);
 	dev->flags |= ATA_DFLAG_CDL;
 
 	return;
 
 not_supported:
 	dev->flags &= ~(ATA_DFLAG_CDL | ATA_DFLAG_CDL_ENABLED);
-	kfree(ap->ncq_sense_buf);
-	ap->ncq_sense_buf = NULL;
+	ata_dev_cleanup_cdl_resources(dev);
 }
 
 static int ata_dev_config_lba(struct ata_device *dev)
@@ -5451,7 +5462,6 @@ void ata_port_free(struct ata_port *ap)
 
 	kfree(ap->pmp_link);
 	kfree(ap->slave_link);
-	kfree(ap->ncq_sense_buf);
 	ida_free(&ata_ida, ap->print_id);
 	kfree(ap);
 }
@@ -5989,6 +5999,8 @@ void ata_dev_free_resources(struct ata_device *dev)
 {
 	if (zpodd_dev_enabled(dev))
 		zpodd_exit(dev);
+
+	ata_dev_cleanup_cdl_resources(dev);
 }
 
 /**
diff --git a/drivers/ata/libata-sata.c b/drivers/ata/libata-sata.c
index 498430db86f7..c8b119a06bb2 100644
--- a/drivers/ata/libata-sata.c
+++ b/drivers/ata/libata-sata.c
@@ -1505,7 +1505,7 @@ int ata_eh_get_ncq_success_sense(struct ata_link *link)
 {
 	struct ata_device *dev = link->device;
 	struct ata_port *ap = dev->link->ap;
-	u8 *buf = ap->ncq_sense_buf;
+	u8 *buf = dev->cdl->ncq_sense_log_buf;
 	struct ata_queued_cmd *qc;
 	unsigned int err_mask, tag;
 	u8 *sense, sk = 0, asc = 0, ascq = 0;
diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
index a42726910fb8..d0cf30c23c71 100644
--- a/drivers/ata/libata-scsi.c
+++ b/drivers/ata/libata-scsi.c
@@ -2259,7 +2259,7 @@ static inline u16 ata_xlat_cdl_limit(u8 *buf)
 static unsigned int ata_msense_control_spgt2(struct ata_device *dev, u8 *buf,
 					     u8 spg)
 {
-	u8 *b, *cdl = dev->cdl, *desc;
+	u8 *b, *cdl = dev->cdl->desc_log_buf, *desc;
 	u32 policy;
 	int i;
 
diff --git a/drivers/ata/libata.h b/drivers/ata/libata.h
index 927d77bde7ef..0337be4faec7 100644
--- a/drivers/ata/libata.h
+++ b/drivers/ata/libata.h
@@ -90,6 +90,7 @@ extern int ata_cmd_ioctl(struct scsi_device *scsidev, void __user *arg);
 extern const char *sata_spd_string(unsigned int spd);
 extern unsigned int ata_read_log_page(struct ata_device *dev, u8 log,
 				      u8 page, void *buf, unsigned int sectors);
+void ata_dev_cleanup_cdl_resources(struct ata_device *dev);
 
 #define to_ata_port(d) container_of(d, struct ata_port, tdev)
 
diff --git a/include/linux/libata.h b/include/linux/libata.h
index aac38dcd2230..9b4a6ff03235 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -700,6 +700,21 @@ struct ata_cpr_log {
 	struct ata_cpr		cpr[] __counted_by(nr_cpr);
 };
 
+struct ata_cdl {
+	/*
+	 * Buffer to cache the CDL log page 18h (command duration descriptors)
+	 * for SCSI-ATA translation.
+	 */
+	u8			desc_log_buf[ATA_LOG_CDL_SIZE];
+
+	/*
+	 * Buffer to handle reading the sense data for successful NCQ Commands
+	 * log page for commands using a CDL with one of the limits policy set
+	 * to 0xD (successful completion with sense data available bit set).
+	 */
+	u8			ncq_sense_log_buf[ATA_LOG_SENSE_NCQ_SIZE];
+};
+
 struct ata_device {
 	struct ata_link		*link;
 	unsigned int		devno;		/* 0 or 1 */
@@ -762,8 +777,8 @@ struct ata_device {
 	/* Concurrent positioning ranges */
 	struct ata_cpr_log	*cpr_log;
 
-	/* Command Duration Limits log support */
-	u8			cdl[ATA_LOG_CDL_SIZE];
+	/* Command Duration Limits support */
+	struct ata_cdl		*cdl;
 
 	/* error history */
 	int			spdn_cnt;
@@ -917,8 +932,6 @@ struct ata_port {
 #ifdef CONFIG_ATA_ACPI
 	struct ata_acpi_gtm	__acpi_init_gtm; /* use ata_acpi_init_gtm() */
 #endif
-	/* owned by EH */
-	u8			*ncq_sense_buf;
 };
 
 /* The following initializer overrides a method to NULL whether one of
-- 
2.46.0


