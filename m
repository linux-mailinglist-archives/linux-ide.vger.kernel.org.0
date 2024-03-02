Return-Path: <linux-ide+bounces-677-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0797F86F23F
	for <lists+linux-ide@lfdr.de>; Sat,  2 Mar 2024 21:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 398C51C20899
	for <lists+linux-ide@lfdr.de>; Sat,  2 Mar 2024 20:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA59D3FE46;
	Sat,  2 Mar 2024 20:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WUu9s4GF"
X-Original-To: linux-ide@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE3C1E874
	for <linux-ide@vger.kernel.org>; Sat,  2 Mar 2024 20:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709410610; cv=none; b=ofjAGGCkufIq7PwP4kcxNkc/bJDU8Y9Dphy2FGNX8s5vYdMJ/oSpgHzyOD809lFL+cLOcm1xMlEkJfOd/5Fbife57kgmQk2CghDlRDxuH3TFOSx4rNHzYdLgBcvZfuiUuPUbMHMpmH/lk+gx+8IYFaPSoy/6zFX3HitfcyXuwi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709410610; c=relaxed/simple;
	bh=Cpedd2s8rLSpGhGQydXGS4Dwk+kTKGMFmoIMXPvIswg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LLfweUa3lFo6kUVxA7LwdF6y2Iife/tCARofNbee4mENH9Xi/7Q5c1ReRqjfk4zsdHHZrfiZUCnH8lVYSa4qAF/dn9P1Z9Rk9RRcdkeSj/UYt+bFbOn7pcXrudME2UVp7ZbpOWwovqkj41+Xm3RzossmEk17HCc1bUUG51/AHwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ipylypiv.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WUu9s4GF; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ipylypiv.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc6dbdcfd39so6392370276.2
        for <linux-ide@vger.kernel.org>; Sat, 02 Mar 2024 12:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709410608; x=1710015408; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OfPnrRH4J5h8MVX8iNqJy9fStZJwj24UZx9cr338G4Q=;
        b=WUu9s4GFltsOelAdBH8YSGUoOIaKcQbD0GHXxHox+n59nvjH2H+4fVcJifvwFJ+iAD
         NkO58rN2G0I3QrsrOy5I/Mjamng2HT3WaCuaDqmhN0qK+6guA5VJOnk8Ao1xbvx0vbUp
         e2b/AqqcVz614WuEAlwFimgtNkpxfikwQJzWSmKlmzqVxaGZKJwW9RAK2w+FiLGz1keu
         BUdHCDJSX6Ue7323A9kmshlYKCUGSFSknz0hDPZfIQd7bngM4w8GRPKJ8CnRuhdUcKl4
         mb0BH5Z6IkHFmOyKVtVcqyBbKHRs4YfE0/YfRPqoO/JYmpwAle3XK8co4cylIHodZhMd
         Yulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709410608; x=1710015408;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OfPnrRH4J5h8MVX8iNqJy9fStZJwj24UZx9cr338G4Q=;
        b=rodtQ4BikwmubB11q1q//OYWOHPTteJuPQDhfAY1+QOt/8IDQPHB1ffC/Ag2qFslbo
         GqMWeR+JvcPbhqJVppKpa8Du+TQ8qFxcyDOp+LAciqxjmMEleEh08g0iJhqBH8JiVkNV
         +4gSEysBpHvZ2Uth0M202CxIFQYd4USnXetLYNvQgPKConwQbZge3eTvmfmfHExN2olW
         FOWfD8wrjXkdDHfguBE6dbvBa1DdMn5Rayvw66oKYz5GLWrlBdYPwp9qAvLe/4+Gp5b4
         gPsiYP9Z2owR+sOKffSIUjA4ZYWKIXGyuUtFADBK0f0OsPKsFZIwtOGgbd1qH3r/q74X
         4ISg==
X-Forwarded-Encrypted: i=1; AJvYcCVojW9ntWXLWTIsBRoUq/A4NoYAmvKGGbl9+j+GZ6mU/0EEEObUrz8shPb+flBHBF+1h0xbQXVAGpwfiUmqNGMd05j+ruXRkkSD
X-Gm-Message-State: AOJu0Ywi5CoPqnhNF/wMmhL65nzoM9AyJk5Zn27/LfiSYHSYC3UnmNh7
	0TAHvwWNCKK3SdusJcSA4Jv+CBzHDa7wy0yTL6sM+rgdALW+6EI+ZfdH1ZMcKXf4U8fZZy857j5
	VioFh0n5lYA==
X-Google-Smtp-Source: AGHT+IGeLsYYp+Bum4xDMw/O8ruLOFlHADU5bUPlL5Nmn8st1+tdzAV7qyUd0P4vKWtUFERohg1oCpXtFg/JvQ==
X-Received: from ipylypiv.svl.corp.google.com ([2620:15c:2c5:13:41a7:9019:9a7:b404])
 (user=ipylypiv job=sendgmr) by 2002:a05:6902:1101:b0:dc6:c2e4:5126 with SMTP
 id o1-20020a056902110100b00dc6c2e45126mr1316939ybu.12.1709410608300; Sat, 02
 Mar 2024 12:16:48 -0800 (PST)
Date: Sat,  2 Mar 2024 12:16:29 -0800
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240302201636.1228331-1-ipylypiv@google.com>
Subject: [PATCH v3 0/7] NCQ Priority sysfs sttributes for libsas
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

This patch series adds sas_ncq_prio_supported and sas_ncq_prio_enable
sysfs sttributes for libsas managed SATA devices. Existing libata sysfs
attributes cannot be used directly because the ata_port location is
different for libsas.

Changes since v2:
- Added libsas SATA sysfs attributes to aic94xx and isci.

Changes since v1:
- Dropped the "sas_" prefix to align sysfs sttributes naming with AHCI.
- Dropped ternary operators to make the code more readable.
- Corrected the formatting %u -> %d in sysfs_emit().
- Changed kstrtol() to kstrtobool() in [ata|sas]_ncq_prio_enable_store().
- Changed comments to use the "/* */" style instead of "//".
- Added libsas SATA sysfs attributes to mvsas and hisi_sas.
- Dropped the 'Reviewed-by' tags because they were not sent in-reply
  to the patch emails.

Igor Pylypiv (7):
  ata: libata-sata: Factor out NCQ Priority configuration helpers
  scsi: libsas: Define NCQ Priority sysfs attributes for SATA devices
  scsi: pm80xx: Add libsas SATA sysfs attributes group
  scsi: mvsas: Add libsas SATA sysfs attributes group
  scsi: hisi_sas: Add libsas SATA sysfs attributes group
  scsi: aic94xx: Add libsas SATA sysfs attributes group
  scsi: isci: Add libsas SATA sysfs attributes group

 drivers/ata/libata-sata.c              | 139 ++++++++++++++++++-------
 drivers/scsi/aic94xx/aic94xx_init.c    |   8 ++
 drivers/scsi/hisi_sas/hisi_sas_v1_hw.c |   6 ++
 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c |   6 ++
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c |   6 ++
 drivers/scsi/isci/init.c               |   6 ++
 drivers/scsi/libsas/sas_ata.c          |  92 ++++++++++++++++
 drivers/scsi/mvsas/mv_init.c           |   7 ++
 drivers/scsi/pm8001/pm8001_ctl.c       |   5 +
 drivers/scsi/pm8001/pm8001_init.c      |   1 +
 drivers/scsi/pm8001/pm8001_sas.h       |   1 +
 include/linux/libata.h                 |   4 +
 include/scsi/sas_ata.h                 |   6 ++
 13 files changed, 247 insertions(+), 40 deletions(-)

-- 
2.44.0.278.ge034bb2e1d-goog


