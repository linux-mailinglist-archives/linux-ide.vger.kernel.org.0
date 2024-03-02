Return-Path: <linux-ide+bounces-674-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE23586ED5B
	for <lists+linux-ide@lfdr.de>; Sat,  2 Mar 2024 01:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 691C62893AB
	for <lists+linux-ide@lfdr.de>; Sat,  2 Mar 2024 00:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F39BA57;
	Sat,  2 Mar 2024 00:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NqBmaVw+"
X-Original-To: linux-ide@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0BF11CBE
	for <linux-ide@vger.kernel.org>; Sat,  2 Mar 2024 00:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709338625; cv=none; b=iB5ZFUBp8OZfu7fg7b7kPXr1+rXTkjIDB2dAL15GxlaxMlJK1Uzkj25MVw2byADT+qOnJJxT14S51gT3Syy89HX7Nk+zUe/pJlRLiNTJF4j8k23AWj24FTSe+OjXcGG6zidNu+leyBallObDxiX8mpL3MXzV+YexwBhWpjSAr1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709338625; c=relaxed/simple;
	bh=bjPtSxZSirainXwWirJU3J0oe9KNdxmW81tZ+T9YgIw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VpFk0TyqV5+/RV0qZz2Tvu6qjGD0jQV05QoAVmb1hIQ1Gln4A6VgwZ49MAhnBho8IUbn7w8jrApCyCceHsRc0a5WFT/nXd3gajwV/fIgR6ETxqU3sxroMX0kwghwJsjjTPac3qlkYQUmVmCQtV5ZSTeWSdU09/QiB4ngvSy2FqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ipylypiv.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NqBmaVw+; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ipylypiv.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-608d6ffc64eso37936627b3.0
        for <linux-ide@vger.kernel.org>; Fri, 01 Mar 2024 16:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709338623; x=1709943423; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cz+zzq0hSSZv+LNtbHhOy76RrAuTvZz0C7UUtpPGk5c=;
        b=NqBmaVw+4RQgYIfxwns4Hj+hw6aLAd179C/AdDV+zJb5Ml9Ia8IoMrgg/bTv7AGBOh
         TdaCIHLiwFDjLEdIL0k9rTHyTAzlnyvZKETtyaw6u681mM0tX1Eke+jo+M5fsjYJd9qd
         SSp3zJ/+BDfWcqU4/gMgvAzgzc5ddKPIKQ1s12C2gA37TQ4xN8AIIZOfv0TUix8cgZ9y
         YGDZnAS2GI/0/oZ9Jty2qxx6H2C3e7cZ6kZKnQuwnietELKVpPoxjng86RCHx2+BS5eg
         YQDWzvo/qX+gL49oA8MTSylTKwAvcUSLqCO8qCZvvMdoC1AoYqSFplW9VcsBcgqaFeP9
         goig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709338623; x=1709943423;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cz+zzq0hSSZv+LNtbHhOy76RrAuTvZz0C7UUtpPGk5c=;
        b=jrSvTMpzDnjC+rDRVC0gp1F00W52/aRinP9ho1277WnbkOaatr7Pv61rGWXEhacMJt
         QiH9oHC2JHokZ8hDjonX0FrohPKi/FQzpFe1stBm/HHCitk2oUJSJqsb8KIqxARpgGoL
         FtlgCy2gCONOYa0R0/NHBn5WPLiNSzTWu8RstLShBOWTt3wD7tNwrIbXlmX5Fl5cAOME
         6OtiAtqak3W6rxVd5UkSk2uS8AVmKq2psgBjh3RMDlhpTVaUUZWHgYuYHGJDXNMTRSk7
         EULCktlWH5E4T0tSGku/Ct5dIlC9rvnSVzW+hoPtvbHGzbU7do5DEehxf32W8ayl+goe
         XU4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXR2qte6zSSDVaW3CasiKudYfiVmZumSprkRMcimenfeV62QVEjPMkFfJGGWxiVUjrAS5mMaSP2SgzmdxQ/oZ1Mb3KiqXO5tDyH
X-Gm-Message-State: AOJu0YznCvovrqY978V/BB4l29o8KubL/fqy+mpdLk7BTMLHimXENMPq
	g0xXJki2YB4wVC87QjwDb5zjb341H3+l2UTH+5mODq+adBbQiZBvdpBACAVY5qNLABhIoBhEwJv
	7jBRo/J6aTQ==
X-Google-Smtp-Source: AGHT+IG+aso8DlILFFU3hOZkQxoXGg0/2rizQ7SMEtEdYiKh5yDyTO6FrayYjPmqaZro4E9t7cvjrUqndk6pUg==
X-Received: from ipylypiv.svl.corp.google.com ([2620:15c:2c5:13:2afe:1a8e:f846:999f])
 (user=ipylypiv job=sendgmr) by 2002:a81:9808:0:b0:607:8f65:5433 with SMTP id
 p8-20020a819808000000b006078f655433mr688164ywg.4.1709338622812; Fri, 01 Mar
 2024 16:17:02 -0800 (PST)
Date: Fri,  1 Mar 2024 16:16:01 -0800
In-Reply-To: <20240302001603.1012084-1-ipylypiv@google.com>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240302001603.1012084-1-ipylypiv@google.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240302001603.1012084-5-ipylypiv@google.com>
Subject: [PATCH v2 4/5] scsi: mvsas: Add libsas SATA sysfs attributes group
From: Igor Pylypiv <ipylypiv@google.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Jason Yan <yanaijie@huawei.com>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Jack Wang <jinpu.wang@cloud.ionos.com>, Hannes Reinecke <hare@suse.de>
Cc: TJ Adams <tadamsjr@google.com>, linux-ide@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Igor Pylypiv <ipylypiv@google.com>
Content-Type: text/plain; charset="UTF-8"

The added sysfs attributes group enables the configuration of NCQ Priority
feature for HBAs that rely on libsas to manage SATA devices.

Signed-off-by: Igor Pylypiv <ipylypiv@google.com>
---
 drivers/scsi/mvsas/mv_init.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/scsi/mvsas/mv_init.c b/drivers/scsi/mvsas/mv_init.c
index 43ebb331e216..80cbe030ac53 100644
--- a/drivers/scsi/mvsas/mv_init.c
+++ b/drivers/scsi/mvsas/mv_init.c
@@ -26,6 +26,7 @@ static const struct mvs_chip_info mvs_chips[] = {
 };
 
 static const struct attribute_group *mvst_host_groups[];
+static const struct attribute_group *mvst_sdev_groups[];
 
 #define SOC_SAS_NUM 2
 
@@ -53,6 +54,7 @@ static const struct scsi_host_template mvs_sht = {
 	.compat_ioctl		= sas_ioctl,
 #endif
 	.shost_groups		= mvst_host_groups,
+	.sdev_groups		= mvst_sdev_groups,
 	.track_queue_depth	= 1,
 };
 
@@ -779,6 +781,11 @@ static struct attribute *mvst_host_attrs[] = {
 
 ATTRIBUTE_GROUPS(mvst_host);
 
+static const struct attribute_group *mvst_sdev_groups[] = {
+	&sas_ata_sdev_attr_group,
+	NULL,
+};
+
 module_init(mvs_init);
 module_exit(mvs_exit);
 
-- 
2.44.0.278.ge034bb2e1d-goog


