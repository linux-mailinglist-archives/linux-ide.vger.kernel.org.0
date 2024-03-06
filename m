Return-Path: <linux-ide+bounces-791-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F06874063
	for <lists+linux-ide@lfdr.de>; Wed,  6 Mar 2024 20:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB2101F219BA
	for <lists+linux-ide@lfdr.de>; Wed,  6 Mar 2024 19:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939A613F445;
	Wed,  6 Mar 2024 19:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R+iKghyo"
X-Original-To: linux-ide@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF4F13F426
	for <linux-ide@vger.kernel.org>; Wed,  6 Mar 2024 19:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709753332; cv=none; b=JuamCMmYypP2rY802h93q2CmI7vGDHD61sClZnyUiNWQn4UcfX6AfzWvRoZOZWVyY0iXLydBqUEAL/yaGigf1dxWIakFj37AE6BWQPUA1Bd3tcbDpiskhrwH39g9str7d0KGzJnpGih/DAYUDfocLud/fODku9gMHlDt80HMu+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709753332; c=relaxed/simple;
	bh=oVbP8h99GUK9lOc/Amw1op4GHOhWRRASuthXoAH1gbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWqT6K8bY1AdynbfNUDw2v2A/x+q85w+QYIRdkuYCbTmIfkmwZwZdzTm9FQxmE2lJfR8oZ+xBWwUaLMKvE236B6za9426zkH+0V7OfvsOmEnBXDVW6qFiGr7UtMcd6DgbqR8D1D3lomWNql19gxzhIiQlFzGYvZ52noSwYFaZ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R+iKghyo; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5e4613f2b56so40613a12.1
        for <linux-ide@vger.kernel.org>; Wed, 06 Mar 2024 11:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709753330; x=1710358130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m9++UoKpeeQiFQPK2S6XtFoDKlxqW5vdVso25F8fqUo=;
        b=R+iKghyoQDh5a92Rgy8ermZReGcTEAJKdfigKeXwTapaAMM65j3r/8br9CS0da04mK
         G42Wly5B14AX2d4IKQwm57XqpOlWHzQr59zUMqsBZq4obsf/m4t+ddbP5VvBFQBRbNn6
         wudyd+zRPUZi5zH+ZKi7qaD1g+FemIfgFM76uZnk26aaHHwdrUEYUT9DD54+eGXnLBWL
         Tytber+V+3spP7Q02UNIODHt47VPM7KFlAvDGcYhtiQ8gDLowaymlBzZfjxsZXCl1rdN
         N2TWVPQ8oPOuF2rY5CDX766wdf3hF970igQD31DSN/aHOwdqIbvLSp1xWBrULWA/iWGf
         yxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709753330; x=1710358130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9++UoKpeeQiFQPK2S6XtFoDKlxqW5vdVso25F8fqUo=;
        b=h9Y1NWlqG1bH9flgO9otvLZKrH70RNZ2PkTEqAL57Sjg0SSJ6FBNWuwY1EFGy7E0f7
         SFLUTbXZ4LOfoZ3TeiC77SDZu0EaCNXOL1imUV62O3xpUYTNLklIjzMNUg4CjYwDDOxz
         gdNe7ePL5Lbrtotnns1csongIy/MGWEY5JaIjZ+jlVVoqrtn+nmTrg77hrwwxltjxvaI
         LTAy+g4/ucB12I3tzMP7CKbE08I2GFqJu3PuxtJluPCm+3M7g/HtYI87oRhlgzlKn7Jk
         +3dDYD7vT5XlfZSdoEh4vwZfNI0o73xrcBKPb3+usspKVhdDzYQNitFJX62mVne6+5GW
         Bp8w==
X-Forwarded-Encrypted: i=1; AJvYcCU/a87TF28o93520vsf8NvuYDQijIJs/cfumxlD4Q7n8cpOyMu6Yu6GbxyTHDjuLWm3/QPBAf46g7SWqD3G9Jc6Fop1pv/oVbl4
X-Gm-Message-State: AOJu0YzEqJ9euB54jMpcCC/V9iiBgploquRyuRgTIEefXYdmskrJ3hOW
	oOP+aI/oGcvxWUfcoabI2GYlusQuj9TuDz1nifnQKY/ExvqPOG6syLceQvOVBQ==
X-Google-Smtp-Source: AGHT+IGakAHWNMkzUL4cVU+huFc20UjAENCfOhUHpM8bWIsR6IZeSjD2XDwSligdYZMB5iErYVB1qg==
X-Received: by 2002:a05:6a20:3d19:b0:1a1:6ee9:336 with SMTP id y25-20020a056a203d1900b001a16ee90336mr137360pzi.15.1709753330036;
        Wed, 06 Mar 2024 11:28:50 -0800 (PST)
Received: from google.com ([2620:15c:2c5:13:9a91:c17:53d9:d156])
        by smtp.gmail.com with ESMTPSA id p41-20020a056a000a2900b006e641fee598sm3260316pfh.141.2024.03.06.11.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 11:28:49 -0800 (PST)
Date: Wed, 6 Mar 2024 11:28:42 -0800
From: Igor Pylypiv <ipylypiv@google.com>
To: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Jason Yan <yanaijie@huawei.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Hannes Reinecke <hare@suse.de>,
	Xiang Chen <chenxiang66@hisilicon.com>,
	Artur Paszkiewicz <artur.paszkiewicz@intel.com>,
	Bart Van Assche <bvanassche@acm.org>,
	TJ Adams <tadamsjr@google.com>, linux-ide@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/7] scsi: libsas: Define NCQ Priority sysfs
 attributes for SATA devices
Message-ID: <ZejD6mYBhYFQ5Xq8@google.com>
References: <20240306012226.3398927-1-ipylypiv@google.com>
 <20240306012226.3398927-3-ipylypiv@google.com>
 <ZehLfEjfOTs2wGZe@ryzen>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZehLfEjfOTs2wGZe@ryzen>

On Wed, Mar 06, 2024 at 11:54:52AM +0100, Niklas Cassel wrote:
> On Tue, Mar 05, 2024 at 05:22:21PM -0800, Igor Pylypiv wrote:
> > Libata sysfs attributes cannot be used for libsas managed SATA devices
> > because the ata_port location is different for libsas.
> > 
> > Defined sysfs attributes (visible for SATA devices only):
> > - /sys/block/sda/device/ncq_prio_enable
> > - /sys/block/sda/device/ncq_prio_supported
> > 
> > The newly defined attributes will pass the correct ata_port to libata
> > helper functions.
> > 
> > Reviewed-by: John Garry <john.g.garry@oracle.com>
> > Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> > Reviewed-by: Jason Yan <yanaijie@huawei.com>
> > Signed-off-by: Igor Pylypiv <ipylypiv@google.com>
> > ---
> >  drivers/scsi/libsas/sas_ata.c | 94 +++++++++++++++++++++++++++++++++++
> >  include/scsi/sas_ata.h        |  6 +++
> >  2 files changed, 100 insertions(+)
> > 
> > diff --git a/drivers/scsi/libsas/sas_ata.c b/drivers/scsi/libsas/sas_ata.c
> > index 12e2653846e3..04b0bd9a4e01 100644
> > --- a/drivers/scsi/libsas/sas_ata.c
> > +++ b/drivers/scsi/libsas/sas_ata.c
> > @@ -964,3 +964,97 @@ int sas_execute_ata_cmd(struct domain_device *device, u8 *fis, int force_phy_id)
> >  			       force_phy_id, &tmf_task);
> >  }
> >  EXPORT_SYMBOL_GPL(sas_execute_ata_cmd);
> > +
> > +static ssize_t sas_ncq_prio_supported_show(struct device *device,
> > +					   struct device_attribute *attr,
> > +					   char *buf)
> > +{
> > +	struct scsi_device *sdev = to_scsi_device(device);
> > +	struct domain_device *ddev = sdev_to_domain_dev(sdev);
> > +	bool supported;
> > +	int rc;
> > +
> > +	/* This attribute shall be visible for SATA devices only */
> > +	if (WARN_ON_ONCE(!dev_is_sata(ddev)))
> > +		return -EINVAL;
> 
> Like Hannes commented, I don't believe this is needed.
> 

The intention for the check is to serve as a fail-safe in case 'is_visible()'
callback gets incorrectly modified and stops hiding the sysfs attributes
for non-SATA devices.

Just want to clarify should I remove the WARN_ON_ONCE and keep the fail-safe
check or should I get rid of the check completely and trust 'is_visible()'
to always hide the sysfs attributes for non-SATA devices? 

> 
> > +
> > +	rc = ata_ncq_prio_supported(ddev->sata_dev.ap, sdev, &supported);
> > +	if (rc)
> > +		return rc;
> > +
> > +	return sysfs_emit(buf, "%d\n", supported);
> > +}
> > +
> 
> While this is a bit different depending on file, the most common way is to
> have no blank link before the DEVICE_ATTR().
>

In "[PATCH 1/3] ata: libata-sata: Factor out NCQ Priority configuration helpers"
Damien asked to keep the blank link before the DEVICE_ATTR() in libata-sata.c.

Non-prio sysfs attributes in libata-sata.c don't have blank lines
before DEVICE_ATTR() so I'm more inclined to remove the lines.

I'm fine with either of ways, just want to get a consensus and make it 
consistent for both libata-sata.c and sas_ata.c.
 
> 
> > +DEVICE_ATTR(ncq_prio_supported, S_IRUGO, sas_ncq_prio_supported_show, NULL);
> > +
> > +static ssize_t sas_ncq_prio_enable_show(struct device *device,
> > +					struct device_attribute *attr,
> > +					char *buf)
> > +{
> > +	struct scsi_device *sdev = to_scsi_device(device);
> > +	struct domain_device *ddev = sdev_to_domain_dev(sdev);
> > +	bool enabled;
> > +	int rc;
> > +
> > +	/* This attribute shall be visible for SATA devices only */
> > +	if (WARN_ON_ONCE(!dev_is_sata(ddev)))
> > +		return -EINVAL;
> > +
> > +	rc = ata_ncq_prio_enabled(ddev->sata_dev.ap, sdev, &enabled);
> > +	if (rc)
> > +		return rc;
> > +
> > +	return sysfs_emit(buf, "%d\n", enabled);
> > +}
> > +
> > +static ssize_t sas_ncq_prio_enable_store(struct device *device,
> > +					 struct device_attribute *attr,
> > +					 const char *buf, size_t len)
> > +{
> > +	struct scsi_device *sdev = to_scsi_device(device);
> > +	struct domain_device *ddev = sdev_to_domain_dev(sdev);
> > +	bool enable;
> > +	int rc;
> > +
> > +	/* This attribute shall be visible for SATA devices only */
> > +	if (WARN_ON_ONCE(!dev_is_sata(ddev)))
> > +		return -EINVAL;
> > +
> > +	rc = kstrtobool(buf, &enable);
> > +	if (rc)
> > +		return rc;
> > +
> > +	rc = ata_ncq_prio_enable(ddev->sata_dev.ap, sdev, enable);
> > +	if (rc)
> > +		return rc;
> > +
> > +	return len;
> > +}
> > +
> > +DEVICE_ATTR(ncq_prio_enable, S_IRUGO | S_IWUSR,
> > +	    sas_ncq_prio_enable_show, sas_ncq_prio_enable_store);
> > +
> > +static struct attribute *sas_ata_sdev_attrs[] = {
> > +	&dev_attr_ncq_prio_supported.attr,
> > +	&dev_attr_ncq_prio_enable.attr,
> > +	NULL
> > +};
> > +
> > +static umode_t sas_ata_attr_is_visible(struct kobject *kobj,
> > +				       struct attribute *attr, int i)
> > +{
> > +	struct device *dev = kobj_to_dev(kobj);
> > +	struct scsi_device *sdev = to_scsi_device(dev);
> > +	struct domain_device *ddev = sdev_to_domain_dev(sdev);
> > +
> > +	if (!dev_is_sata(ddev))
> > +		return 0;
> > +
> > +	return attr->mode;
> > +}
> > +
> > +const struct attribute_group sas_ata_sdev_attr_group = {
> > +	.attrs = sas_ata_sdev_attrs,
> > +	.is_visible = sas_ata_attr_is_visible,
> > +};
> > +EXPORT_SYMBOL_GPL(sas_ata_sdev_attr_group);
> > diff --git a/include/scsi/sas_ata.h b/include/scsi/sas_ata.h
> > index 2f8c719840a6..92e27e7bf088 100644
> > --- a/include/scsi/sas_ata.h
> > +++ b/include/scsi/sas_ata.h
> > @@ -39,6 +39,9 @@ int smp_ata_check_ready_type(struct ata_link *link);
> >  int sas_discover_sata(struct domain_device *dev);
> >  int sas_ata_add_dev(struct domain_device *parent, struct ex_phy *phy,
> >  		    struct domain_device *child, int phy_id);
> > +
> > +extern const struct attribute_group sas_ata_sdev_attr_group;
> > +
> >  #else
> >  
> >  static inline void sas_ata_disabled_notice(void)
> > @@ -123,6 +126,9 @@ static inline int sas_ata_add_dev(struct domain_device *parent, struct ex_phy *p
> >  	sas_ata_disabled_notice();
> >  	return -ENODEV;
> >  }
> > +
> > +#define sas_ata_sdev_attr_group ((struct attribute_group) {})
> > +
> >  #endif
> >  
> >  #endif /* _SAS_ATA_H_ */
> > -- 
> > 2.44.0.278.ge034bb2e1d-goog
> > 

