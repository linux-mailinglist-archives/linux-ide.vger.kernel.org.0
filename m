Return-Path: <linux-ide+bounces-1941-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A06C939ED2
	for <lists+linux-ide@lfdr.de>; Tue, 23 Jul 2024 12:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3E4B2831D9
	for <lists+linux-ide@lfdr.de>; Tue, 23 Jul 2024 10:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB8914D2A0;
	Tue, 23 Jul 2024 10:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMkYKmoj"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD90713C818
	for <linux-ide@vger.kernel.org>; Tue, 23 Jul 2024 10:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721730850; cv=none; b=jGVdKSJVqFriCxzNSnU0WobyMgVi/+wMFt6XhWQ+bPGPeQjhOpfZLUYQg4j5W/BPdNdQ5eWbI+fckH0e92icgABfE5XnsDPy6M37gH13XXLib9nEHdHHdWV4d4N4cWYVbU9v8LTQNuBYr288/QeL9lFjvlym+bYl64yYvwiYbLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721730850; c=relaxed/simple;
	bh=7ih87aiBDXb1yLNsc7SussGDjd+m/weNGMAZkN7wuXM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kbD6l6KZFESc6801EVgAzPklA3bQMua0BaPoNWRz6h5428yANnp96Y2NQpZwvISA0UsKLhMt3ND00oTyQci/V2jXVpNCE8duLg96NAG9UFnSns21B9rzuVglp98PyxcztnruPhjuXk/2YIXy7bKDZC0p22A2jQEqarKITO8LUq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMkYKmoj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DA3C4AF0F;
	Tue, 23 Jul 2024 10:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721730849;
	bh=7ih87aiBDXb1yLNsc7SussGDjd+m/weNGMAZkN7wuXM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YMkYKmojwN2Z4N/gtLUxypb/7akhjbG0jibsCwqI4JHhKewcDvmRzKGg8W8Alt9QR
	 n6bjZQzMm84x8Bc6DLQIqg8au0WruPJlOh3v6+FEkXeRhft5LBYbn6VTY/FjG/A7R/
	 I/n+ECS4HFUlTdhRpC2yZGC/m4g+VMWIurYigBzp4MuzH1gSdVSornu3Xz2eew93Nf
	 cAmo9vk+TGKq3tTaOgnQjDIy6BGI4UiejCLwPQUe0Yhb7EDE04opLl/A1DpIm2Lt74
	 POgQF3T3+gogzS2i5AqsAffOU4+tF18iQkOVSD0It/cIjb0qXrFd8zPyTy40OxRer3
	 wOXBBo1bULkFw==
From: Damien Le Moal <dlemoal@kernel.org>
To: linux-ide@vger.kernel.org,
	Niklas Cassel <cassel@kernel.org>
Subject: [PATCH v4 3/3] ata: libata: Print horkages applied to devices
Date: Tue, 23 Jul 2024 19:34:06 +0900
Message-ID: <20240723103406.294462-4-dlemoal@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723103406.294462-1-dlemoal@kernel.org>
References: <20240723103406.294462-1-dlemoal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the function ata_dev_print_horkage() to print the horkage
flags that will be used for a device. This new function is called from
ata_dev_horkage() when a match on a device model or device model and
revision is found for a device in the ata_dev_horkages array.

To implement this function, the ATA_HORKAGE_ flags are redefined using
the new enum ata_horkage which defines the bit shift for each horkage
flag. The array of strings ata_horkage_names is used to define the name
of each flag, which are printed by ata_dev_print_horkage().

Example output for a device listed in the ata_dev_horkages array and
which has the ATA_HORKAGE_DISABLE flag applied:

[10193.461270] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[10193.469190] ata1.00: Model ASMT109x- Config, applying horkages: disable
[10193.469195] ata1.00: unsupported device, disabling
[10193.481564] ata1.00: disable device

And while at it, make sure to use the unsigned int type for horkage
flags as struct ata_device->horkage is an unsugned int.

Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/ata/libata-core.c |  82 +++++++++++++++++++++++++---
 include/linux/libata.h    | 112 +++++++++++++++++++++++++-------------
 2 files changed, 149 insertions(+), 45 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index ee958d2893e6..91ac9b45c8d8 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -84,7 +84,7 @@ static unsigned int ata_dev_init_params(struct ata_device *dev,
 					u16 heads, u16 sectors);
 static unsigned int ata_dev_set_xfermode(struct ata_device *dev);
 static void ata_dev_xfermask(struct ata_device *dev);
-static unsigned long ata_dev_horkage(const struct ata_device *dev);
+static unsigned int ata_dev_horkage(const struct ata_device *dev);
 
 static DEFINE_IDA(ata_ida);
 
@@ -3987,10 +3987,73 @@ int ata_dev_revalidate(struct ata_device *dev, unsigned int new_class,
 	return rc;
 }
 
+static const char *ata_horkage_names[] = {
+	[__ATA_HORKAGE_DIAGNOSTIC]	= "diagnostic",
+	[__ATA_HORKAGE_NODMA]		= "nodma",
+	[__ATA_HORKAGE_NONCQ]		= "noncq",
+	[__ATA_HORKAGE_MAX_SEC_128]	= "maxsec128",
+	[__ATA_HORKAGE_BROKEN_HPA]	= "brokenhpa",
+	[__ATA_HORKAGE_DISABLE]		= "disable",
+	[__ATA_HORKAGE_HPA_SIZE]	= "hpasize",
+	[__ATA_HORKAGE_IVB]		= "ivb",
+	[__ATA_HORKAGE_STUCK_ERR]	= "stuckerr",
+	[__ATA_HORKAGE_BRIDGE_OK]	= "bridgeok",
+	[__ATA_HORKAGE_ATAPI_MOD16_DMA]	= "atapimod16dma",
+	[__ATA_HORKAGE_FIRMWARE_WARN]	= "firmwarewarn",
+	[__ATA_HORKAGE_1_5_GBPS]	= "1.5gbps",
+	[__ATA_HORKAGE_NOSETXFER]	= "nosetxfer",
+	[__ATA_HORKAGE_BROKEN_FPDMA_AA]	= "brokenfpdmaaa",
+	[__ATA_HORKAGE_DUMP_ID]		= "dumpid",
+	[__ATA_HORKAGE_MAX_SEC_LBA48]	= "maxseclba48",
+	[__ATA_HORKAGE_ATAPI_DMADIR]	= "atapidmadir",
+	[__ATA_HORKAGE_NO_NCQ_TRIM]	= "noncqtrim",
+	[__ATA_HORKAGE_NOLPM]		= "nolpm",
+	[__ATA_HORKAGE_WD_BROKEN_LPM]	= "wdbrokenlpm",
+	[__ATA_HORKAGE_ZERO_AFTER_TRIM]	= "zeroaftertrim",
+	[__ATA_HORKAGE_NO_DMA_LOG]	= "nodmalog",
+	[__ATA_HORKAGE_NOTRIM]		= "notrim",
+	[__ATA_HORKAGE_MAX_SEC_1024]	= "maxsec1024",
+	[__ATA_HORKAGE_MAX_TRIM_128M]	= "maxtrim128m",
+	[__ATA_HORKAGE_NO_NCQ_ON_ATI]	= "noncqonati",
+	[__ATA_HORKAGE_NO_ID_DEV_LOG]	= "noiddevlog",
+	[__ATA_HORKAGE_NO_LOG_DIR]	= "nologdir",
+	[__ATA_HORKAGE_NO_FUA]		= "nofua",
+};
+
+static void ata_dev_print_horkage(const struct ata_device *dev,
+				  const char *model, const char *rev,
+				  unsigned int horkage)
+{
+	int n = 0, i;
+	size_t sz;
+	char *str;
+
+	if (!horkage)
+		return;
+
+	sz = 64 + ARRAY_SIZE(ata_horkage_names) * 16;
+	str = kmalloc(sz, GFP_KERNEL);
+	if (!str)
+		return;
+
+	n = snprintf(str, sz, "Model '%s', rev '%s', applying horkages:",
+		     model, rev);
+
+	for (i = 0; i < ARRAY_SIZE(ata_horkage_names); i++) {
+		if (horkage & (1U << i))
+			n += snprintf(str + n, sz - n,
+				      " %s", ata_horkage_names[i]);
+	}
+
+	ata_dev_warn(dev, "%s", str);
+
+	kfree(str);
+}
+
 struct ata_dev_horkage_entry {
 	const char *model_num;
 	const char *model_rev;
-	unsigned long horkage;
+	unsigned int horkage;
 };
 
 static const struct ata_dev_horkage_entry ata_dev_horkages[] = {
@@ -4266,21 +4329,24 @@ static const struct ata_dev_horkage_entry ata_dev_horkages[] = {
 	{ }
 };
 
-static unsigned long ata_dev_horkage(const struct ata_device *dev)
+static unsigned int ata_dev_horkage(const struct ata_device *dev)
 {
 	unsigned char model_num[ATA_ID_PROD_LEN + 1];
 	unsigned char model_rev[ATA_ID_FW_REV_LEN + 1];
 	const struct ata_dev_horkage_entry *ad = ata_dev_horkages;
 
+	/* dev->horkage is an unsigned int. */
+	BUILD_BUG_ON(__ATA_HORKAGE_MAX > 32);
+
 	ata_id_c_string(dev->id, model_num, ATA_ID_PROD, sizeof(model_num));
 	ata_id_c_string(dev->id, model_rev, ATA_ID_FW_REV, sizeof(model_rev));
 
 	while (ad->model_num) {
-		if (glob_match(ad->model_num, model_num)) {
-			if (ad->model_rev == NULL)
-				return ad->horkage;
-			if (glob_match(ad->model_rev, model_rev))
-				return ad->horkage;
+		if (glob_match(ad->model_num, model_num) &&
+		    (!ad->model_rev || glob_match(ad->model_rev, model_rev))) {
+			ata_dev_print_horkage(dev, model_num, model_rev,
+					      ad->horkage);
+			return ad->horkage;
 		}
 		ad++;
 	}
diff --git a/include/linux/libata.h b/include/linux/libata.h
index 17394098bee9..bf8c329b0f31 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -55,6 +55,48 @@
 /* defines only for the constants which don't work well as enums */
 #define ATA_TAG_POISON		0xfafbfcfdU
 
+/*
+ * Horkage types. May be set by libata or controller on drives.
+ * Some horkage may be drive/controller pair dependent.
+ * ata_device->horkage is an unsigned int, so __ATA_HORKAGE_MAX must not
+ * exceed 31.
+ */
+enum ata_horkage {
+	__ATA_HORKAGE_DIAGNOSTIC,	/* Failed boot diag */
+	__ATA_HORKAGE_NODMA,		/* DMA problems */
+	__ATA_HORKAGE_NONCQ,		/* Don't use NCQ */
+	__ATA_HORKAGE_MAX_SEC_128,	/* Limit max sects to 128 */
+	__ATA_HORKAGE_BROKEN_HPA,	/* Broken HPA */
+	__ATA_HORKAGE_DISABLE,		/* Disable it */
+	__ATA_HORKAGE_HPA_SIZE,		/* Native size off by one */
+	__ATA_HORKAGE_IVB,		/* cbl det validity bit bugs */
+	__ATA_HORKAGE_STUCK_ERR,	/* Stuck ERR on next PACKET */
+	__ATA_HORKAGE_BRIDGE_OK,	/* No bridge limits */
+	__ATA_HORKAGE_ATAPI_MOD16_DMA,	/* Use ATAPI DMA for commands that are
+					 * not a multiple of 16 bytes */
+	__ATA_HORKAGE_FIRMWARE_WARN,	/* Firmware update warning */
+	__ATA_HORKAGE_1_5_GBPS,		/* Force 1.5 Gbps */
+	__ATA_HORKAGE_NOSETXFER,	/* Skip SETXFER, SATA only */
+	__ATA_HORKAGE_BROKEN_FPDMA_AA,	/* Skip AA */
+	__ATA_HORKAGE_DUMP_ID,		/* Dump IDENTIFY data */
+	__ATA_HORKAGE_MAX_SEC_LBA48,	/* Set max sects to 65535 */
+	__ATA_HORKAGE_ATAPI_DMADIR,	/* Device requires dmadir */
+	__ATA_HORKAGE_NO_NCQ_TRIM,	/* Do not use queued TRIM */
+	__ATA_HORKAGE_NOLPM,		/* Do not use LPM */
+	__ATA_HORKAGE_WD_BROKEN_LPM,	/* Some WDs have broken LPM */
+	__ATA_HORKAGE_ZERO_AFTER_TRIM,	/* Guarantees zero after trim */
+	__ATA_HORKAGE_NO_DMA_LOG,	/* Do not use DMA for log read */
+	__ATA_HORKAGE_NOTRIM,		/* Do not use TRIM */
+	__ATA_HORKAGE_MAX_SEC_1024,	/* Limit max sects to 1024 */
+	__ATA_HORKAGE_MAX_TRIM_128M,	/* Limit max trim size to 128M */
+	__ATA_HORKAGE_NO_NCQ_ON_ATI,	/* Disable NCQ on ATI chipset */
+	__ATA_HORKAGE_NO_ID_DEV_LOG,	/* Identify device log missing */
+	__ATA_HORKAGE_NO_LOG_DIR,	/* Do not read log directory */
+	__ATA_HORKAGE_NO_FUA,		/* Do not use FUA */
+
+	__ATA_HORKAGE_MAX,
+};
+
 enum {
 	/* various global constants */
 	LIBATA_MAX_PRD		= ATA_MAX_PRD / 2,
@@ -362,43 +404,39 @@ enum {
 	 */
 	ATA_EH_CMD_TIMEOUT_TABLE_SIZE = 8,
 
-	/* Horkage types. May be set by libata or controller on drives
-	   (some horkage may be drive/controller pair dependent */
-
-	ATA_HORKAGE_DIAGNOSTIC	= (1 << 0),	/* Failed boot diag */
-	ATA_HORKAGE_NODMA	= (1 << 1),	/* DMA problems */
-	ATA_HORKAGE_NONCQ	= (1 << 2),	/* Don't use NCQ */
-	ATA_HORKAGE_MAX_SEC_128	= (1 << 3),	/* Limit max sects to 128 */
-	ATA_HORKAGE_BROKEN_HPA	= (1 << 4),	/* Broken HPA */
-	ATA_HORKAGE_DISABLE	= (1 << 5),	/* Disable it */
-	ATA_HORKAGE_HPA_SIZE	= (1 << 6),	/* native size off by one */
-	ATA_HORKAGE_IVB		= (1 << 8),	/* cbl det validity bit bugs */
-	ATA_HORKAGE_STUCK_ERR	= (1 << 9),	/* stuck ERR on next PACKET */
-	ATA_HORKAGE_BRIDGE_OK	= (1 << 10),	/* no bridge limits */
-	ATA_HORKAGE_ATAPI_MOD16_DMA = (1 << 11), /* use ATAPI DMA for commands
-						    not multiple of 16 bytes */
-	ATA_HORKAGE_FIRMWARE_WARN = (1 << 12),	/* firmware update warning */
-	ATA_HORKAGE_1_5_GBPS	= (1 << 13),	/* force 1.5 Gbps */
-	ATA_HORKAGE_NOSETXFER	= (1 << 14),	/* skip SETXFER, SATA only */
-	ATA_HORKAGE_BROKEN_FPDMA_AA	= (1 << 15),	/* skip AA */
-	ATA_HORKAGE_DUMP_ID	= (1 << 16),	/* dump IDENTIFY data */
-	ATA_HORKAGE_MAX_SEC_LBA48 = (1 << 17),	/* Set max sects to 65535 */
-	ATA_HORKAGE_ATAPI_DMADIR = (1 << 18),	/* device requires dmadir */
-	ATA_HORKAGE_NO_NCQ_TRIM	= (1 << 19),	/* don't use queued TRIM */
-	ATA_HORKAGE_NOLPM	= (1 << 20),	/* don't use LPM */
-	ATA_HORKAGE_WD_BROKEN_LPM = (1 << 21),	/* some WDs have broken LPM */
-	ATA_HORKAGE_ZERO_AFTER_TRIM = (1 << 22),/* guarantees zero after trim */
-	ATA_HORKAGE_NO_DMA_LOG	= (1 << 23),	/* don't use DMA for log read */
-	ATA_HORKAGE_NOTRIM	= (1 << 24),	/* don't use TRIM */
-	ATA_HORKAGE_MAX_SEC_1024 = (1 << 25),	/* Limit max sects to 1024 */
-	ATA_HORKAGE_MAX_TRIM_128M = (1 << 26),	/* Limit max trim size to 128M */
-	ATA_HORKAGE_NO_NCQ_ON_ATI = (1 << 27),	/* Disable NCQ on ATI chipset */
-	ATA_HORKAGE_NO_ID_DEV_LOG = (1 << 28),	/* Identify device log missing */
-	ATA_HORKAGE_NO_LOG_DIR	= (1 << 29),	/* Do not read log directory */
-	ATA_HORKAGE_NO_FUA	= (1 << 30),	/* Do not use FUA */
-
-	 /* DMA mask for user DMA control: User visible values; DO NOT
-	    renumber */
+	/* Horkage flags */
+	ATA_HORKAGE_DIAGNOSTIC      = (1U << __ATA_HORKAGE_DIAGNOSTIC),
+	ATA_HORKAGE_NODMA           = (1U << __ATA_HORKAGE_NODMA),
+	ATA_HORKAGE_NONCQ           = (1U << __ATA_HORKAGE_NONCQ),
+	ATA_HORKAGE_MAX_SEC_128     = (1U << __ATA_HORKAGE_MAX_SEC_128),
+	ATA_HORKAGE_BROKEN_HPA      = (1U << __ATA_HORKAGE_BROKEN_HPA),
+	ATA_HORKAGE_DISABLE         = (1U << __ATA_HORKAGE_DISABLE),
+	ATA_HORKAGE_HPA_SIZE        = (1U << __ATA_HORKAGE_HPA_SIZE),
+	ATA_HORKAGE_IVB             = (1U << __ATA_HORKAGE_IVB),
+	ATA_HORKAGE_STUCK_ERR       = (1U << __ATA_HORKAGE_STUCK_ERR),
+	ATA_HORKAGE_BRIDGE_OK       = (1U << __ATA_HORKAGE_BRIDGE_OK),
+	ATA_HORKAGE_ATAPI_MOD16_DMA = (1U << __ATA_HORKAGE_ATAPI_MOD16_DMA),
+	ATA_HORKAGE_FIRMWARE_WARN   = (1U << __ATA_HORKAGE_FIRMWARE_WARN),
+	ATA_HORKAGE_1_5_GBPS        = (1U << __ATA_HORKAGE_1_5_GBPS),
+	ATA_HORKAGE_NOSETXFER       = (1U << __ATA_HORKAGE_NOSETXFER),
+	ATA_HORKAGE_BROKEN_FPDMA_AA = (1U << __ATA_HORKAGE_BROKEN_FPDMA_AA),
+	ATA_HORKAGE_DUMP_ID         = (1U << __ATA_HORKAGE_DUMP_ID),
+	ATA_HORKAGE_MAX_SEC_LBA48   = (1U << __ATA_HORKAGE_MAX_SEC_LBA48),
+	ATA_HORKAGE_ATAPI_DMADIR    = (1U << __ATA_HORKAGE_ATAPI_DMADIR),
+	ATA_HORKAGE_NO_NCQ_TRIM     = (1U << __ATA_HORKAGE_NO_NCQ_TRIM),
+	ATA_HORKAGE_NOLPM           = (1U << __ATA_HORKAGE_NOLPM),
+	ATA_HORKAGE_WD_BROKEN_LPM   = (1U << __ATA_HORKAGE_WD_BROKEN_LPM),
+	ATA_HORKAGE_ZERO_AFTER_TRIM = (1U << __ATA_HORKAGE_ZERO_AFTER_TRIM),
+	ATA_HORKAGE_NO_DMA_LOG      = (1U << __ATA_HORKAGE_NO_DMA_LOG),
+	ATA_HORKAGE_NOTRIM          = (1U << __ATA_HORKAGE_NOTRIM),
+	ATA_HORKAGE_MAX_SEC_1024    = (1U << __ATA_HORKAGE_MAX_SEC_1024),
+	ATA_HORKAGE_MAX_TRIM_128M   = (1U << __ATA_HORKAGE_MAX_TRIM_128M),
+	ATA_HORKAGE_NO_NCQ_ON_ATI   = (1U << __ATA_HORKAGE_NO_NCQ_ON_ATI),
+	ATA_HORKAGE_NO_ID_DEV_LOG   = (1U << __ATA_HORKAGE_NO_ID_DEV_LOG),
+	ATA_HORKAGE_NO_LOG_DIR      = (1U << __ATA_HORKAGE_NO_LOG_DIR),
+	ATA_HORKAGE_NO_FUA          = (1U << __ATA_HORKAGE_NO_FUA),
+
+	/* User visible DMA mask for DMA control. DO NOT renumber. */
 	ATA_DMA_MASK_ATA	= (1 << 0),	/* DMA on ATA Disk */
 	ATA_DMA_MASK_ATAPI	= (1 << 1),	/* DMA on ATAPI */
 	ATA_DMA_MASK_CFA	= (1 << 2),	/* DMA on CF Card */
-- 
2.45.2


