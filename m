Return-Path: <linux-ide+bounces-715-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A534B871211
	for <lists+linux-ide@lfdr.de>; Tue,  5 Mar 2024 01:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51884B23FD8
	for <lists+linux-ide@lfdr.de>; Tue,  5 Mar 2024 00:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DFB11183;
	Tue,  5 Mar 2024 00:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vuUL+kKM"
X-Original-To: linux-ide@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AF11095A
	for <linux-ide@vger.kernel.org>; Tue,  5 Mar 2024 00:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709599880; cv=none; b=Koano7Gh+YY+f84IRBL8N1SubOWeont7xOy8oJ9D2ODe1x1mqJjPry6eQ820ZA3SDak9wF/uymysqh8qlrtd1iRaEnUV5jCNX6RmNrSBVnJUczp+o8BNjS8s+k9octc9M0t3vglClrk2cbzdBrUXaavSS/CV80h7mTHuoPJEa0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709599880; c=relaxed/simple;
	bh=OT0sYnaxo68fwSHaMwnL2hKn2Ef03StrkDYOYiAnOZA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PtXnLG6Nd+yxDCXvh2dIRlh1+TSguGob/5Y5i+CDf2FYrB+sZAU/2vFpr2PhUumVxXmLXQnuUvT9tKWWvywabdwt1ztLJwWwAuMi4zynTtJRgqGrwzC64iqj5jZjTFGnbRpH7UYwyvoCkeJMVizZzGzYroyBK7Yxbu4Ta7bqmLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ipylypiv.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vuUL+kKM; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ipylypiv.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dcc58cddb50so8768688276.0
        for <linux-ide@vger.kernel.org>; Mon, 04 Mar 2024 16:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709599878; x=1710204678; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N68FGvP0mTMlTYCB47N23MbfsmIOzAcUrBUD9J/J0rI=;
        b=vuUL+kKMTWCSKu8wgxMV6bhdGgD8wgo13IAS+PYUzIbITKmHOppd5JNW5kNThf+sdg
         C/TOVUyNKdlAk18BWqkAn3iqvEhDvl/Ci49nTLVRP2amLLxTs1qrTExflTQLLbF0t/g0
         Zh20E8MzIx5BBgpTxvmDvVnzIxESJuh8y0enycwR7CHc5737aMBrcQc5Bi5BlH2n2WY2
         GDzkTdCh/yaUTdPIr1mWnDixY/+WkhFakvhJlUByJY7Eq6LHJDCpewvR9xv1JvQC3Ve7
         lt4qLjdxkxbtrWD3Sy9y+ZGMLoz2bJw1yGg6rHldyxkzVjDsYi2u0/yzLK3jV2xgO+6j
         Au2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709599878; x=1710204678;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N68FGvP0mTMlTYCB47N23MbfsmIOzAcUrBUD9J/J0rI=;
        b=a3owyvl5092ivsZf81LQUDJRqRxuQlPuYENKwv0gOdJmMbD7yxRVfSbEuB6hw3PNr+
         RA38wNz1OrHS1I/iIRKbQnfZ3FnPk/gMdfFgLAQjkmjpLenVCemyO5JZwNaFPDDfpH9K
         Z8UdfNTiEigCdXXpzlV2M+mfRszBSMYL15NuVN6o9GmTQ+N2+oyyoVnMSf66kyUfpIvN
         aIiUEI6hZME18SRmzcD4Slg28EQr8WRbFc8OSfH0WjHbWuzAWkV33/DwcEAC8lvqpKUq
         Aff9J1/BsAzU6GvL6vHmNNNGV3zSB/3otSYWn+nghOJ61IuQy6Qcx3iXnFRuLTTNYx4m
         YcBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn7HJ4CBfXUabHGIodFLKy9XJB+7EfAkz+cbU5idOL8NS23EZHM8x6bu6N4dq33+OCAS1ju3CwOjq6Lu60+Y47x7SJS7f1KYbG
X-Gm-Message-State: AOJu0Yx7oK5HvwGLBiKFCnHvZwJ/ifvhQRSIuRkZRC3BsjQxz02k5Jlz
	R8BTkiJmeoAb76bBDvrmmmiiPTTKv+uoRynJ37qOWUBrBoW3nABYxQS47Tj2RwIxhSjUYdK0zHa
	FjQLeUApDRg==
X-Google-Smtp-Source: AGHT+IEifz6iQ1XIfSyfq986HxT9PrXO9y0tP1HA/K2Izo+X7mbBAMA6q5VgAVEkRE6I0se5mkm5O2wOX543Lg==
X-Received: from ipylypiv.svl.corp.google.com ([2620:15c:2c5:13:e901:e760:20cd:d870])
 (user=ipylypiv job=sendgmr) by 2002:a05:6902:1004:b0:dc2:3441:897f with SMTP
 id w4-20020a056902100400b00dc23441897fmr2682137ybt.6.1709599877900; Mon, 04
 Mar 2024 16:51:17 -0800 (PST)
Date: Mon,  4 Mar 2024 16:51:01 -0800
In-Reply-To: <20240305005103.1849325-1-ipylypiv@google.com>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240305005103.1849325-1-ipylypiv@google.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240305005103.1849325-6-ipylypiv@google.com>
Subject: [PATCH v5 5/7] scsi: hisi_sas: Add libsas SATA sysfs attributes group
From: Igor Pylypiv <ipylypiv@google.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Jason Yan <yanaijie@huawei.com>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Jack Wang <jinpu.wang@cloud.ionos.com>, Hannes Reinecke <hare@suse.de>, 
	Xiang Chen <chenxiang66@hisilicon.com>, Artur Paszkiewicz <artur.paszkiewicz@intel.com>, 
	Bart Van Assche <bvanassche@acm.org>
Cc: TJ Adams <tadamsjr@google.com>, linux-ide@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Igor Pylypiv <ipylypiv@google.com>
Content-Type: text/plain; charset="UTF-8"

The added sysfs attributes group enables the configuration of NCQ Priority
feature for HBAs that rely on libsas to manage SATA devices.

Reviewed-by: John Garry <john.g.garry@oracle.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Signed-off-by: Igor Pylypiv <ipylypiv@google.com>
---
 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c | 6 ++++++
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
index 73b378837da7..b5d379ebe05d 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
@@ -3544,6 +3544,11 @@ static struct attribute *host_v2_hw_attrs[] = {
 
 ATTRIBUTE_GROUPS(host_v2_hw);
 
+static const struct attribute_group *sdev_groups_v2_hw[] = {
+	&sas_ata_sdev_attr_group,
+	NULL
+};
+
 static void map_queues_v2_hw(struct Scsi_Host *shost)
 {
 	struct hisi_hba *hisi_hba = shost_priv(shost);
@@ -3585,6 +3590,7 @@ static const struct scsi_host_template sht_v2_hw = {
 	.compat_ioctl		= sas_ioctl,
 #endif
 	.shost_groups		= host_v2_hw_groups,
+	.sdev_groups		= sdev_groups_v2_hw,
 	.host_reset		= hisi_sas_host_reset,
 	.map_queues		= map_queues_v2_hw,
 	.host_tagset		= 1,
diff --git a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
index b56fbc61a15a..9b69ea16a1e6 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
@@ -2929,6 +2929,11 @@ static struct attribute *host_v3_hw_attrs[] = {
 
 ATTRIBUTE_GROUPS(host_v3_hw);
 
+static const struct attribute_group *sdev_groups_v3_hw[] = {
+	&sas_ata_sdev_attr_group,
+	NULL
+};
+
 #define HISI_SAS_DEBUGFS_REG(x) {#x, x}
 
 struct hisi_sas_debugfs_reg_lu {
@@ -3340,6 +3345,7 @@ static const struct scsi_host_template sht_v3_hw = {
 	.compat_ioctl		= sas_ioctl,
 #endif
 	.shost_groups		= host_v3_hw_groups,
+	.sdev_groups		= sdev_groups_v3_hw,
 	.tag_alloc_policy	= BLK_TAG_ALLOC_RR,
 	.host_reset             = hisi_sas_host_reset,
 	.host_tagset		= 1,
-- 
2.44.0.278.ge034bb2e1d-goog


