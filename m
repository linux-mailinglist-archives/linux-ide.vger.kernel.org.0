Return-Path: <linux-ide+bounces-730-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0F1872B59
	for <lists+linux-ide@lfdr.de>; Wed,  6 Mar 2024 00:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F8E7B247CD
	for <lists+linux-ide@lfdr.de>; Tue,  5 Mar 2024 23:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240DB12E1EC;
	Tue,  5 Mar 2024 23:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sx8lDWtT"
X-Original-To: linux-ide@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B87112EBD0
	for <linux-ide@vger.kernel.org>; Tue,  5 Mar 2024 23:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709683116; cv=none; b=vEaZXIWAxgCM3cMGcseMFGTWutaurSwrpAhVHoC7rPIEbbNNeU4cY/zSFA8Q/4uY5564kSyEJXqXMLOE4/Vya7iTbidlTm7KsEwthNSl3Xo2pv7EbyTW6vh284x6KZwG5PXIeAItf1DBH1VgUdtdeYMnQRE4HMVn39V7UClaoBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709683116; c=relaxed/simple;
	bh=tljO3YNKojGQKl4/nogEVW1mt1rHvPdAvzEjzTFZ6pc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qlEh9MPU5VIc831fW7z4917m+iHLglW8ydgf/WEsBONPd2pFnjz89qpkewzfIihOv/zzCjnzOIxRYU7OwwC0U+iG6QaWJdECCQr6A+HQwaIRMgm5zaLek51wMJt4dQ+SbQ5f2/TRsWyyhlx3snsW+/7t3g/DpdugJe958D69Les=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ipylypiv.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sx8lDWtT; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ipylypiv.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dcbfe1a42a4so12186577276.2
        for <linux-ide@vger.kernel.org>; Tue, 05 Mar 2024 15:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709683113; x=1710287913; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3IbqjAWtZG0ah6rSd6ZSYfM1o+jFUFiPix71IOwviDA=;
        b=sx8lDWtT4hWa48qP3Am/fxk3aVUl83KAOHLkcAwFfGv3O+PiAWZ8MglWGRCS2a4SH9
         FRICui0TbGKzjycyfE6abJdBxx4ZfU4+MVN7M+Wwh/4AMjbZTieg0WtW1r3tDkpj08pj
         aT04dYWsnVgMUuTo/FIoT9j941FgjAJJqmcStZtIG/rgfHQPb0iznU+/yjIm9Iv0qowC
         1TqBavTYHYL6Ok0UoMO8WOTsWtU22lLfRpqtGF4jxruSrQLjEQcJld+zqB7FIw+UufQJ
         hAyOH+uRkGb8fTRS5VkVw6MhfPQSe9iws+ts5VoYZfBJDBEc1C3Fn/PkJvoWzlAEyEOc
         X34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709683113; x=1710287913;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3IbqjAWtZG0ah6rSd6ZSYfM1o+jFUFiPix71IOwviDA=;
        b=E8zB3U/IVXYcH/xs456UtO0iqgNtSEUnrlZdroGc/2EGRz10bEKV7IvYZ8XPVJAb6r
         Juxs6TQRR9noVjRg9Gwd1Xbpm7YukkEn7161WcNkCKYJp1HkxGQKn6fFgVkmNf8LrBXJ
         MVqFk9g/ury39tRF337J+Tj9C6pqNOn2azkayrcfi1fXaLIe4bYjdSdpzY0ajZ8K4lHl
         86C+7YecTByJRwXoBxs/bPWZhSPVSgca8HHrq3x/TLxo6TDa+hHuTf6nV1aM7ix5OSw9
         gseMGO4eFAn2Sw0RBBqT60o6e0UaiI0fM3zq3S8wFjinMbLzIETHb081SwTb6fP2gupe
         nDRA==
X-Forwarded-Encrypted: i=1; AJvYcCWP/G5IBp12MHjQijwLZqOH1QwE1cxfV8mdmcGQwuMp6dI519Ery/UaccHUCXqLhhc86C1K4ZCzN/bgBhmFB5T/y+4y3RPK/CK7
X-Gm-Message-State: AOJu0Yy28IUszQ3/3l1CVpH571AX7RIzZUxR2Uj5i2v6s5mf4jebhrVW
	ZigzLbob+fZmFmpSz2v72SufsjU5KGyi/85PIx758zlJF5pMswAOQqxCzsfDn7LN5F4WJK79wT9
	Eevompvs+JA==
X-Google-Smtp-Source: AGHT+IFXxAYiJwdVSZE8mHvAfunpdCHDxq3qHZGle0aN74vGiPj3t3l+o4Wf8Kbr7CjkWhD3mljTyMnh9hhPgw==
X-Received: from ipylypiv.svl.corp.google.com ([2620:15c:2c5:13:69ff:df2c:aa81:7b74])
 (user=ipylypiv job=sendgmr) by 2002:a05:6902:724:b0:dcc:5a91:aee9 with SMTP
 id l4-20020a056902072400b00dcc5a91aee9mr3344267ybt.7.1709683113424; Tue, 05
 Mar 2024 15:58:33 -0800 (PST)
Date: Tue,  5 Mar 2024 15:58:17 -0800
In-Reply-To: <20240305235823.3308225-1-ipylypiv@google.com>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240305235823.3308225-1-ipylypiv@google.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240305235823.3308225-3-ipylypiv@google.com>
Subject: [PATCH v6 2/7] scsi: libsas: Define NCQ Priority sysfs attributes for
 SATA devices
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

Libata sysfs attributes cannot be used for libsas managed SATA devices
because the ata_port location is different for libsas.

Defined sysfs attributes (visible for SATA devices only):
- /sys/block/sda/device/ncq_prio_enable
- /sys/block/sda/device/ncq_prio_supported

The newly defined attributes will pass the correct ata_port to libata
helper functions.

Reviewed-by: John Garry <john.g.garry@oracle.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Jason Yan <yanaijie@huawei.com>
Signed-off-by: Igor Pylypiv <ipylypiv@google.com>
---
 drivers/scsi/libsas/sas_ata.c | 94 +++++++++++++++++++++++++++++++++++
 include/scsi/sas_ata.h        |  6 +++
 2 files changed, 100 insertions(+)

diff --git a/drivers/scsi/libsas/sas_ata.c b/drivers/scsi/libsas/sas_ata.c
index 12e2653846e3..04b0bd9a4e01 100644
--- a/drivers/scsi/libsas/sas_ata.c
+++ b/drivers/scsi/libsas/sas_ata.c
@@ -964,3 +964,97 @@ int sas_execute_ata_cmd(struct domain_device *device, u8 *fis, int force_phy_id)
 			       force_phy_id, &tmf_task);
 }
 EXPORT_SYMBOL_GPL(sas_execute_ata_cmd);
+
+static ssize_t sas_ncq_prio_supported_show(struct device *device,
+					   struct device_attribute *attr,
+					   char *buf)
+{
+	struct scsi_device *sdev = to_scsi_device(device);
+	struct domain_device *ddev = sdev_to_domain_dev(sdev);
+	bool supported;
+	int rc;
+
+	/* This attribute shall be visible for SATA devices only */
+	if (WARN_ON_ONCE(!dev_is_sata(ddev)))
+		return -EINVAL;
+
+	rc = ata_ncq_prio_supported(ddev->sata_dev.ap, sdev, &supported);
+	if (rc)
+		return rc;
+
+	return sysfs_emit(buf, "%d\n", supported);
+}
+
+DEVICE_ATTR(ncq_prio_supported, S_IRUGO, sas_ncq_prio_supported_show, NULL);
+
+static ssize_t sas_ncq_prio_enable_show(struct device *device,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct scsi_device *sdev = to_scsi_device(device);
+	struct domain_device *ddev = sdev_to_domain_dev(sdev);
+	bool enabled;
+	int rc;
+
+	/* This attribute shall be visible for SATA devices only */
+	if (WARN_ON_ONCE(!dev_is_sata(ddev)))
+		return -EINVAL;
+
+	rc = ata_ncq_prio_enabled(ddev->sata_dev.ap, sdev, &enabled);
+	if (rc)
+		return rc;
+
+	return sysfs_emit(buf, "%d\n", enabled);
+}
+
+static ssize_t sas_ncq_prio_enable_store(struct device *device,
+					 struct device_attribute *attr,
+					 const char *buf, size_t len)
+{
+	struct scsi_device *sdev = to_scsi_device(device);
+	struct domain_device *ddev = sdev_to_domain_dev(sdev);
+	bool enable;
+	int rc;
+
+	/* This attribute shall be visible for SATA devices only */
+	if (WARN_ON_ONCE(!dev_is_sata(ddev)))
+		return -EINVAL;
+
+	rc = kstrtobool(buf, &enable);
+	if (rc)
+		return rc;
+
+	rc = ata_ncq_prio_enable(ddev->sata_dev.ap, sdev, enable);
+	if (rc)
+		return rc;
+
+	return len;
+}
+
+DEVICE_ATTR(ncq_prio_enable, S_IRUGO | S_IWUSR,
+	    sas_ncq_prio_enable_show, sas_ncq_prio_enable_store);
+
+static struct attribute *sas_ata_sdev_attrs[] = {
+	&dev_attr_ncq_prio_supported.attr,
+	&dev_attr_ncq_prio_enable.attr,
+	NULL
+};
+
+static umode_t sas_ata_attr_is_visible(struct kobject *kobj,
+				       struct attribute *attr, int i)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct scsi_device *sdev = to_scsi_device(dev);
+	struct domain_device *ddev = sdev_to_domain_dev(sdev);
+
+	if (!dev_is_sata(ddev))
+		return 0;
+
+	return attr->mode;
+}
+
+const struct attribute_group sas_ata_sdev_attr_group = {
+	.attrs = sas_ata_sdev_attrs,
+	.is_visible = sas_ata_attr_is_visible,
+};
+EXPORT_SYMBOL_GPL(sas_ata_sdev_attr_group);
diff --git a/include/scsi/sas_ata.h b/include/scsi/sas_ata.h
index 2f8c719840a6..59a75cd8b5e0 100644
--- a/include/scsi/sas_ata.h
+++ b/include/scsi/sas_ata.h
@@ -39,6 +39,8 @@ int smp_ata_check_ready_type(struct ata_link *link);
 int sas_discover_sata(struct domain_device *dev);
 int sas_ata_add_dev(struct domain_device *parent, struct ex_phy *phy,
 		    struct domain_device *child, int phy_id);
+
+extern const struct attribute_group sas_ata_sdev_attr_group;
 #else
 
 static inline void sas_ata_disabled_notice(void)
@@ -123,6 +125,10 @@ static inline int sas_ata_add_dev(struct domain_device *parent, struct ex_phy *p
 	sas_ata_disabled_notice();
 	return -ENODEV;
 }
+
+static const struct attribute_group sas_ata_sdev_attr_group __maybe_unused = {
+	.attrs = NULL,
+};
 #endif
 
 #endif /* _SAS_ATA_H_ */
-- 
2.44.0.278.ge034bb2e1d-goog


