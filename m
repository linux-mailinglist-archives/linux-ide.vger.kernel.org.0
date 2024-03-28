Return-Path: <linux-ide+bounces-809-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EFF8759B1
	for <lists+linux-ide@lfdr.de>; Thu,  7 Mar 2024 22:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F292D1C21DE4
	for <lists+linux-ide@lfdr.de>; Thu,  7 Mar 2024 21:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F9B142636;
	Thu,  7 Mar 2024 21:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eTf1iMg5"
X-Original-To: linux-ide@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C30914262B
	for <linux-ide@vger.kernel.org>; Thu,  7 Mar 2024 21:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709847877; cv=none; b=ie0Re5oIFgSafwCPYpeH0DMjOB161aXB3ZaPWDdF3iXlhNU8Ye//SKHklQdlcZGCuIhZgPj1KAlFBY23I5HUSuTnq8bqP0ONYduvAn3EHjEFM2ofC2hlCu7dV0PCOrFrJ6G2IAETlZ7ciLvtSPELFCt80iz6TTefJqGHozV1jaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709847877; c=relaxed/simple;
	bh=kCUyYic0llMdCDm2+Ue48zOf2WyrmeyB/4BoGeE0niE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mxIA+YnlAh5Dc/uLOn1xP5ZrLV3ShiRnwwrGbhywAryQqkTexef1y6ruxA4v+54JtHD2FFjwZEVThQM1QkfQ4/7Y6yXVjNtcNzwjOcGqGQRgA5tcw2LBTirfO3pheKQcFtrst0fZo2bHhLnP/8OIvrpgzkUwvZl4dbwavVOQHKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ipylypiv.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eTf1iMg5; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ipylypiv.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dbf618042daso2168867276.0
        for <linux-ide@vger.kernel.org>; Thu, 07 Mar 2024 13:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709847874; x=1710452674; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FNHEYmkbDz44hYs4zD+M5ZgpK+WL/ZuC9mDgGa4D+bI=;
        b=eTf1iMg57mQ4/JCiUJ7Nuotf3smmBrRbtU2SVGdND6v7bkC15iFwiUnhy+msB/m3C9
         6uy84ky5YtTTlDI13rgnYz7XbqoMXougOd38vtCxF0Av6rGLn7n380MWlHnhgax6TWhL
         IaW0hJkJyU6+2cV6A13DDVZjQv7+6x/ZUQhhWbW7NJYkIS1PhqiXkDJZG4X4/JovSkFM
         MEL1hSVuDX2iO3ilaXMvPeGfmysbLaJq5wxIx3e1ldQFdcho14EpiYK+0BoOwQXSb8Yj
         6ZHHMLTzF+Hvk5tUMsH/XOMRVDA7Aljha1Jjy9qQUygZV+QGRma/yH8nn0TYE3Zs/PIO
         lcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709847874; x=1710452674;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FNHEYmkbDz44hYs4zD+M5ZgpK+WL/ZuC9mDgGa4D+bI=;
        b=jf6QLdIxVDEuU7Bo5Yd2AmgpeG71FkgG2posrTBY1XVQcnULeeWwThxbGPpio7z1hY
         y0rjWGUbFe+It+FQmE1OE29Q+/mVT4Q8QWfSUbb78dDXWeDIeM6tAvMZhywr7tkrE/0X
         jhvZkaI338KffgAGxUU2RqB0fEoKS/mHPjaPudQVbmUaUkPE93vudcunvShLIJMDDm9n
         enWFTAwYdkR9dLMgGkIL/HZBGJoXs/xgePhaeYHLtI2XxhSJArNtBXuiGXdhMzazS3J3
         w0eVw8HBFdYuB/iuZQRwgKKZVfbfdaYtysQ/ucYGbEouYi9E5iTkK7E4v9+HGrGwMlXe
         cGhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE3vIQBbR7So73ouC+NIw4LnBLAyFszI3BTwpVIlU/q1STi8TxoU+sAoqtqF95KRaKS4HNeNIhoWjTcAWLAc7go0S21l7cDR42
X-Gm-Message-State: AOJu0Yy7aGIB2fVWjQOlCzNex/nukkPWfJdYY9gSHvMz3UQHCLGX82T7
	DREjvJ5iQrxXCwjWhQMH2pxkUORUCC0EGP8iW/dj7uVnAHeXByvIqrkYnYzO0pGT9OXbIJywdJC
	ul23GBYQvRw==
X-Google-Smtp-Source: AGHT+IFtnbGMiVxBhyZl+UF8YJm4Nl++uoxkJhVo05Ue3MkENEDojQCqlrApHQ4o+1Clhjzk7BciZ1hWB3GZfw==
X-Received: from ipylypiv.svl.corp.google.com ([2620:15c:2c5:13:69c0:c447:593d:278c])
 (user=ipylypiv job=sendgmr) by 2002:a25:f307:0:b0:dc7:4af0:8c6c with SMTP id
 c7-20020a25f307000000b00dc74af08c6cmr784505ybs.6.1709847874683; Thu, 07 Mar
 2024 13:44:34 -0800 (PST)
Date: Thu,  7 Mar 2024 13:44:16 -0800
In-Reply-To: <20240307214418.3812290-1-ipylypiv@google.com>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240307214418.3812290-1-ipylypiv@google.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240307214418.3812290-6-ipylypiv@google.com>
Subject: [PATCH v8 5/7] scsi: hisi_sas: Add libsas SATA sysfs attributes group
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

Omitted hisi_sas_v1_hw.c because v1 HW doesn't support SATA.

Reviewed-by: John Garry <john.g.garry@oracle.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Jason Yan <yanaijie@huawei.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
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


