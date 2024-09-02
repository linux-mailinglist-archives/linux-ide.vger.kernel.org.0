Return-Path: <linux-ide+bounces-2207-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4E79686BC
	for <lists+linux-ide@lfdr.de>; Mon,  2 Sep 2024 13:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D827D2836E2
	for <lists+linux-ide@lfdr.de>; Mon,  2 Sep 2024 11:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDAE1DAC42;
	Mon,  2 Sep 2024 11:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tDvOL6YT"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00D817F394
	for <linux-ide@vger.kernel.org>; Mon,  2 Sep 2024 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725278046; cv=none; b=kwJzOBpnlsfq3vLB/gKFe9C3+QcklBdWY6lklNJcunkGf3TRqIb5u5hgnZ5LBy8MiudQtNdy/XI9ExY2eX2wateSsro0WZHHjNBJnZ4Ycek3RXWUNgIYhrYRz0ZoFMtB9fRofBJwp+ZVz7rL2VSrsFc/TZKwYgiO9FUFamzlctY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725278046; c=relaxed/simple;
	bh=2uZkFjKIa5i0sFf5kGfcY6laQboBXHlaG1SK28KyRms=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AB9accA6n662uZk3+DB5Zt/sEOgtrTabdOG6VpF4cgtKrGj1oCUGE+ef32RM6BNFi+428pny6WdNvftOaL5hH4+o9jzMXaGS8QU4Kp3e9AvHAr0r9uwN9saozYBVZNaPA9yJY8YfzbFiZSZqfDqLPC4eNLlX13+FypGshUOrysE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tDvOL6YT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D16C4CEC2;
	Mon,  2 Sep 2024 11:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725278045;
	bh=2uZkFjKIa5i0sFf5kGfcY6laQboBXHlaG1SK28KyRms=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tDvOL6YToQutZErzpx29G6wX2Ke9HEXSZFf4ly9wNSVEZu4l7MrFwOqnDbQZMAe8h
	 kBYOg5BzvTkIgdbz4NIhnnnSiOQ8mt8kPVScKObfOBso/6ilGP7mHNgnN39WXKwUxw
	 y7uNkyDQJLJduXHFCL07i2YHwOR8UCzlCYFxway7t+SGLaPTdL3diyXDHyaf8qvW1A
	 eVaApJ2SwPM3BCcsMEfCJwyqGIs11fyXV384w0o8gPEE4znxohwY/uroeidaUF66oj
	 aiYj7diRLJQNyQcKCO+uatgA7X1geydTa1MY2qBW8Pc0HX8MiS/1suC1ebpdfdjXvk
	 bzDipUjuse+fg==
From: Damien Le Moal <dlemoal@kernel.org>
To: linux-ide@vger.kernel.org,
	Niklas Cassel <cassel@kernel.org>
Subject: [PATCH v3 4/7] ata: libata: Move sata_std_hardreset() definition to libata-sata.c
Date: Mon,  2 Sep 2024 20:53:57 +0900
Message-ID: <20240902115400.166881-5-dlemoal@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902115400.166881-1-dlemoal@kernel.org>
References: <20240902115400.166881-1-dlemoal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike ata_std_prereset() and ata_std_postreset(), the function
sata_std_hardreset() applies only to SATA devices, as its name implies.
So move its definition to libata-sata.c.

Together with this, also move the definition of sata_port_ops to
libata-sata.c, where it belongs.

Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/libata-core.c | 35 -----------------------------------
 drivers/ata/libata-sata.c | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/libata.h    |  9 +++++++--
 3 files changed, 43 insertions(+), 37 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index b957eb900a00..b5a051bbb01f 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -72,14 +72,6 @@ const struct ata_port_operations ata_base_port_ops = {
 	.end_eh			= ata_std_end_eh,
 };
 
-const struct ata_port_operations sata_port_ops = {
-	.inherits		= &ata_base_port_ops,
-
-	.qc_defer		= ata_std_qc_defer,
-	.hardreset		= sata_std_hardreset,
-};
-EXPORT_SYMBOL_GPL(sata_port_ops);
-
 static unsigned int ata_dev_init_params(struct ata_device *dev,
 					u16 heads, u16 sectors);
 static unsigned int ata_dev_set_xfermode(struct ata_device *dev);
@@ -3676,33 +3668,6 @@ int ata_std_prereset(struct ata_link *link, unsigned long deadline)
 }
 EXPORT_SYMBOL_GPL(ata_std_prereset);
 
-/**
- *	sata_std_hardreset - COMRESET w/o waiting or classification
- *	@link: link to reset
- *	@class: resulting class of attached device
- *	@deadline: deadline jiffies for the operation
- *
- *	Standard SATA COMRESET w/o waiting or classification.
- *
- *	LOCKING:
- *	Kernel thread context (may sleep)
- *
- *	RETURNS:
- *	0 if link offline, -EAGAIN if link online, -errno on errors.
- */
-int sata_std_hardreset(struct ata_link *link, unsigned int *class,
-		       unsigned long deadline)
-{
-	const unsigned int *timing = sata_ehc_deb_timing(&link->eh_context);
-	bool online;
-	int rc;
-
-	/* do hardreset */
-	rc = sata_link_hardreset(link, timing, deadline, &online, NULL);
-	return online ? -EAGAIN : rc;
-}
-EXPORT_SYMBOL_GPL(sata_std_hardreset);
-
 /**
  *	ata_std_postreset - standard postreset callback
  *	@link: the target ata_link
diff --git a/drivers/ata/libata-sata.c b/drivers/ata/libata-sata.c
index 124e2b2ea3c0..40f70de94fbd 100644
--- a/drivers/ata/libata-sata.c
+++ b/drivers/ata/libata-sata.c
@@ -706,6 +706,34 @@ int sata_link_hardreset(struct ata_link *link, const unsigned int *timing,
 }
 EXPORT_SYMBOL_GPL(sata_link_hardreset);
 
+/**
+ *	sata_std_hardreset - COMRESET w/o waiting or classification
+ *	@link: link to reset
+ *	@class: resulting class of attached device
+ *	@deadline: deadline jiffies for the operation
+ *
+ *	Standard SATA COMRESET w/o waiting or classification.
+ *
+ *	LOCKING:
+ *	Kernel thread context (may sleep)
+ *
+ *	RETURNS:
+ *	0 if link offline, -EAGAIN if link online, -errno on errors.
+ */
+int sata_std_hardreset(struct ata_link *link, unsigned int *class,
+		       unsigned long deadline)
+{
+	const unsigned int *timing = sata_ehc_deb_timing(&link->eh_context);
+	bool online;
+	int rc;
+
+	rc = sata_link_hardreset(link, timing, deadline, &online, NULL);
+	if (online)
+		return -EAGAIN;
+	return rc;
+}
+EXPORT_SYMBOL_GPL(sata_std_hardreset);
+
 /**
  *	ata_qc_complete_multiple - Complete multiple qcs successfully
  *	@ap: port in question
@@ -1654,3 +1682,11 @@ void ata_eh_analyze_ncq_error(struct ata_link *link)
 	ehc->i.err_mask &= ~AC_ERR_DEV;
 }
 EXPORT_SYMBOL_GPL(ata_eh_analyze_ncq_error);
+
+const struct ata_port_operations sata_port_ops = {
+	.inherits		= &ata_base_port_ops,
+
+	.qc_defer		= ata_std_qc_defer,
+	.hardreset		= sata_std_hardreset,
+};
+EXPORT_SYMBOL_GPL(sata_port_ops);
diff --git a/include/linux/libata.h b/include/linux/libata.h
index 6552e90753ae..d52ae7723c05 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -1104,8 +1104,6 @@ static inline bool ata_port_is_frozen(const struct ata_port *ap)
 extern int ata_std_prereset(struct ata_link *link, unsigned long deadline);
 extern int ata_wait_after_reset(struct ata_link *link, unsigned long deadline,
 				int (*check_ready)(struct ata_link *link));
-extern int sata_std_hardreset(struct ata_link *link, unsigned int *class,
-			      unsigned long deadline);
 extern void ata_std_postreset(struct ata_link *link, unsigned int *classes);
 
 extern struct ata_host *ata_host_alloc(struct device *dev, int n_ports);
@@ -1229,6 +1227,8 @@ extern int sata_scr_read(struct ata_link *link, int reg, u32 *val);
 extern int sata_scr_write(struct ata_link *link, int reg, u32 val);
 extern int sata_scr_write_flush(struct ata_link *link, int reg, u32 val);
 extern int sata_set_spd(struct ata_link *link);
+int sata_std_hardreset(struct ata_link *link, unsigned int *class,
+		       unsigned long deadline);
 extern int sata_link_hardreset(struct ata_link *link,
 			const unsigned int *timing, unsigned long deadline,
 			bool *online, int (*check_ready)(struct ata_link *));
@@ -1256,6 +1256,11 @@ static inline int sata_scr_write_flush(struct ata_link *link, int reg, u32 val)
 	return -EOPNOTSUPP;
 }
 static inline int sata_set_spd(struct ata_link *link) { return -EOPNOTSUPP; }
+static inline int sata_std_hardreset(struct ata_link *link, unsigned int *class,
+				     unsigned long deadline)
+{
+	return -EOPNOTSUPP;
+}
 static inline int sata_link_hardreset(struct ata_link *link,
 				      const unsigned int *timing,
 				      unsigned long deadline,
-- 
2.46.0


