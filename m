Return-Path: <linux-ide+bounces-2144-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADA495EA77
	for <lists+linux-ide@lfdr.de>; Mon, 26 Aug 2024 09:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1001D1F20F8E
	for <lists+linux-ide@lfdr.de>; Mon, 26 Aug 2024 07:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD85B339AB;
	Mon, 26 Aug 2024 07:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rUgACtan"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E63136671
	for <linux-ide@vger.kernel.org>; Mon, 26 Aug 2024 07:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724657471; cv=none; b=rKRqSDhKUwdhVbIfI13H6AUxgHkZyNXYxl7hAV3O9NPOH63SgKb4qxHSzJ5cTFH9wAU476VEq6obri0vrTUYCb13CiVIkE9YKFZ4QNPnt/vogxfSky2ODYy34m9P4rKyzVaCZzki9pqnKvcppG6JdRBj8uKiQmAA/F8/TzMYWE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724657471; c=relaxed/simple;
	bh=Je4YOLLz8VpI5+9LbwLXm0VwJcqvz+f3N875tXulX7k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L/q52v1OYEQPlgAu59+yeqNeaWipxXyiI3YjBOhBeIQAvdD+o9xjYWLUD1i1fxXOrdEZhCmQER5+WXEW9qtDVPVPfGOkbn7tk9ulXNiFuwoLVmP6M8c/3dof1kV1Ll6tD99lFvEq5mZROziSG6Onsc8L+8lJZeewG86YFQJREM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rUgACtan; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33A8C8CDC5;
	Mon, 26 Aug 2024 07:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724657471;
	bh=Je4YOLLz8VpI5+9LbwLXm0VwJcqvz+f3N875tXulX7k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rUgACtanuXEqso35hRkBtlCZEm70eCXDpttrVQ/zXdbny6NDvvbpPGx3Gz32wh8a1
	 JwPKm5bk9cKXFA4YzrXLTlcmFyCLoNHJc8Ic+qSAiF8VuBMq8wrSXpq3IxF9lSVDWG
	 VsO3aiSw72BLOjk7+rMFpVyUNu5BmpzN5RtnQyLuEwgh5LYFTx3MI4Pwox95qdx2O3
	 HKr2BoE2sa5RuriV8BPcUCf4AnPsuRs666p5AYCpzfS+9NRkjYWEklJVjbkVsQfDpH
	 AziYhjIg3oYpBu1io7VDotuYbNJnTukqWp0dXqi5VZhfVp3EXheV0yKikY+8izrgX6
	 aikfXtBkl2D/w==
From: Damien Le Moal <dlemoal@kernel.org>
To: linux-ide@vger.kernel.org,
	Niklas Cassel <cassel@kernel.org>
Subject: [PATCH 5/7] ata: libata: Rename ata_eh_read_sense_success_ncq_log()
Date: Mon, 26 Aug 2024 16:31:04 +0900
Message-ID: <20240826073106.56918-6-dlemoal@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240826073106.56918-1-dlemoal@kernel.org>
References: <20240826073106.56918-1-dlemoal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function ata_eh_read_sense_success_ncq_log() does more that just
reading the sense data for successful NCQ commands log page as it also
sets the sense data for all commands listed in the log page.

Rename this function to ata_eh_get_ncq_success_sense() to better
describe what the function does. Furthermore, since this function is
only called from ata_eh_get_success_sense() in libata-eh.c, there is no
need to export it and its declaration can be moved to
drivers/ata/libata.h.

To be consistent with this change, the function
ata_eh_read_sense_success_non_ncq() is also renamed to
ata_eh_get_non_ncq_success_sense().

Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/ata/libata-eh.c   | 6 +++---
 drivers/ata/libata-sata.c | 7 +++----
 drivers/ata/libata.h      | 5 +++++
 include/linux/libata.h    | 5 -----
 4 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/ata/libata-eh.c b/drivers/ata/libata-eh.c
index 214b935c2ced..107aad2a1af5 100644
--- a/drivers/ata/libata-eh.c
+++ b/drivers/ata/libata-eh.c
@@ -1924,7 +1924,7 @@ static inline bool ata_eh_quiet(struct ata_queued_cmd *qc)
 	return qc->flags & ATA_QCFLAG_QUIET;
 }
 
-static int ata_eh_read_sense_success_non_ncq(struct ata_link *link)
+static int ata_eh_get_non_ncq_success_sense(struct ata_link *link)
 {
 	struct ata_port *ap = link->ap;
 	struct ata_queued_cmd *qc;
@@ -1976,9 +1976,9 @@ static void ata_eh_get_success_sense(struct ata_link *link)
 	 * request sense ext command to retrieve the sense data.
 	 */
 	if (link->sactive)
-		ret = ata_eh_read_sense_success_ncq_log(link);
+		ret = ata_eh_get_ncq_success_sense(link);
 	else
-		ret = ata_eh_read_sense_success_non_ncq(link);
+		ret = ata_eh_get_non_ncq_success_sense(link);
 	if (ret)
 		goto out;
 
diff --git a/drivers/ata/libata-sata.c b/drivers/ata/libata-sata.c
index 286b5699dafd..020893da900d 100644
--- a/drivers/ata/libata-sata.c
+++ b/drivers/ata/libata-sata.c
@@ -1487,8 +1487,8 @@ static int ata_eh_read_log_10h(struct ata_device *dev,
 }
 
 /**
- *	ata_eh_read_sense_success_ncq_log - Read the sense data for successful
- *					    NCQ commands log
+ *	ata_eh_get_ncq_success_sense - Read and process the sense data for
+ *				       successful NCQ commands log page
  *	@link: ATA link to get sense data for
  *
  *	Read the sense data for successful NCQ commands log page to obtain
@@ -1501,7 +1501,7 @@ static int ata_eh_read_log_10h(struct ata_device *dev,
  *	RETURNS:
  *	0 on success, -errno otherwise.
  */
-int ata_eh_read_sense_success_ncq_log(struct ata_link *link)
+int ata_eh_get_ncq_success_sense(struct ata_link *link)
 {
 	struct ata_device *dev = link->device;
 	struct ata_port *ap = dev->link->ap;
@@ -1573,7 +1573,6 @@ int ata_eh_read_sense_success_ncq_log(struct ata_link *link)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(ata_eh_read_sense_success_ncq_log);
 
 /**
  *	ata_eh_analyze_ncq_error - analyze NCQ error
diff --git a/drivers/ata/libata.h b/drivers/ata/libata.h
index eda2d5dfd234..5ca17784a350 100644
--- a/drivers/ata/libata.h
+++ b/drivers/ata/libata.h
@@ -95,11 +95,16 @@ extern unsigned int ata_read_log_page(struct ata_device *dev, u8 log,
 /* libata-sata.c */
 #ifdef CONFIG_SATA_HOST
 int sata_down_spd_limit(struct ata_link *link, u32 spd_limit);
+int ata_eh_get_ncq_success_sense(struct ata_link *link);
 #else
 static inline int sata_down_spd_limit(struct ata_link *link, u32 spd_limit)
 {
 	return -EOPNOTSUPP;
 }
+static inline int ata_eh_get_ncq_success_sense(struct ata_link *link)
+{
+	return -EOPNOTSUPP;
+}
 #endif
 
 /* libata-acpi.c */
diff --git a/include/linux/libata.h b/include/linux/libata.h
index 46e35acc611c..e07a9b5d45df 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -1234,7 +1234,6 @@ extern int sata_link_hardreset(struct ata_link *link,
 			bool *online, int (*check_ready)(struct ata_link *));
 extern int sata_link_resume(struct ata_link *link, const unsigned int *params,
 			    unsigned long deadline);
-extern int ata_eh_read_sense_success_ncq_log(struct ata_link *link);
 extern void ata_eh_analyze_ncq_error(struct ata_link *link);
 #else
 static inline const unsigned int *
@@ -1277,10 +1276,6 @@ static inline int sata_link_resume(struct ata_link *link,
 {
 	return -EOPNOTSUPP;
 }
-static inline int ata_eh_read_sense_success_ncq_log(struct ata_link *link)
-{
-	return -EOPNOTSUPP;
-}
 static inline void ata_eh_analyze_ncq_error(struct ata_link *link) { }
 #endif
 extern int sata_link_debounce(struct ata_link *link,
-- 
2.46.0


