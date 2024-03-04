Return-Path: <linux-ide+bounces-702-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91233870FE8
	for <lists+linux-ide@lfdr.de>; Mon,  4 Mar 2024 23:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4D601C20CAA
	for <lists+linux-ide@lfdr.de>; Mon,  4 Mar 2024 22:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858827A124;
	Mon,  4 Mar 2024 22:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GByNeGXu"
X-Original-To: linux-ide@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7EA79F2
	for <linux-ide@vger.kernel.org>; Mon,  4 Mar 2024 22:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709590535; cv=none; b=AYdsJRAVLP0EfvaINfsjYmI//q/WiB8lKZAsQ+fcDha0azOFWcOkYRoeCHUAmLFqEzCxugVrG9LyH9D8L+OI6Ghy0Ptlcg15f7qyn8rAS248trZIIs2SbQKpnmgs6U5zqcXBPtkVIVSRv961LDShSB5Z0j8fizLUU0Bncz5uhTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709590535; c=relaxed/simple;
	bh=Ywwfa5hw3g3wV4YuKstMZgWxolfExRYUJDz6ONhDQPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UyeOhAsH0BH4SrNL3Wm+V/E2rXQGvDsgtEl+f5IINRa2L0HXwFthVA7FR6KPTq+YE1cWKLCRX9ECxgd5UnvtMFWYaFsZYaugBDdicwB+qlrY6doZlbxU/GrGGaqqXgY+4G4kjQMdyvqC5LzyDJ7Sq47TcWIZiOvtB/dBOhebbr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GByNeGXu; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5d3912c9a83so3462151a12.3
        for <linux-ide@vger.kernel.org>; Mon, 04 Mar 2024 14:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709590533; x=1710195333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CSTIJJSftklFQL8UGUvWnO8gT1gJvRrz6tflwqRvH64=;
        b=GByNeGXu3mpKAP7KYOO2fiHJHa12KRG5RXYRwRreTb8kjQGlPb0RYVix/kQssGHzmg
         JyZkr1G+DCzUaVkvFbYRvhxx9+Kz6YtOI5GvgK/VnU6jiDY/q8suiKabRqggLFwKc7cF
         0FCcwp822HVaZE8nCNLytXMZK1IGGepTyQhh9k+9FAHHwiZm7tIKUapF/7ha6Ggi+vit
         LbRq6SJUvTvGRHwyDoex4Z49D1LSVb4CTHynN1rJn2vW53bZ6A19OF+teVNUWP0wGo7H
         XJz2WQ5ipdscUGNS2SFFGtqmiNBmrd5Jpr3Ltf+N90XXkx/ja3yqa/4QVuZngYMLhHs9
         B4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709590533; x=1710195333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSTIJJSftklFQL8UGUvWnO8gT1gJvRrz6tflwqRvH64=;
        b=WEOiarJLpyzB1V7XPDFHo+lHfxS8csek1SsrBJvuWPAGmYY3uP9NShr7peVAFK8iF5
         CHXD78Dggq92xCIWCKndEIpr2GmNUrFayYqSK8usF4eLkSzTtvK42bxuCTobWtWA1Wlu
         xGxVwdAiFsHa1TEByamQ2GqBYkq/jzPRyDBn1bPAmTHOJTwJ0nV67iVaugnRKSoQ8Q7y
         XAsaDQUaXG3mLzI2xYXXh3DSPXLeHK96rTWglpfFHNfbZRcFFMkc3I/96/iWHLkuwa06
         Lqbpm1p4uHlkFF/1EwieVFwC0Xn3lOSDsK3RgCdWK6pR/oSiqoayEGrlRryRJoZTJpkR
         9hoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjhPFPw5hRDcx4dT12bHhCnXF1wzWZkx2XOB8wOFSbP/jPlyzCawtlczjBUqVm1OBaMO+xiIKGfYf9oKYeQF6sNDnlNZgwJweE
X-Gm-Message-State: AOJu0Yw3HDFIVRJ1LgYTe3tJ3rZHmh8sZByYMTOb5bnkkunQCW5NCv+7
	SAZwoZvWFKAKeCrI1XLlfFxbuzjaQBhguEkJDCnl+SBV66P+2cZ2/amQdLFQwg==
X-Google-Smtp-Source: AGHT+IHt/hQua7h8iZoyVsAhREKa+jlMeGGZA/YCtHYwR0B6JyCyglCHiHhKof9hlPuS6WTl1DYncQ==
X-Received: by 2002:a05:6a20:938f:b0:1a1:e75:477c with SMTP id x15-20020a056a20938f00b001a10e75477cmr39790pzh.9.1709590532931;
        Mon, 04 Mar 2024 14:15:32 -0800 (PST)
Received: from google.com ([2620:15c:2c5:13:e901:e760:20cd:d870])
        by smtp.gmail.com with ESMTPSA id hq4-20020a056a00680400b006e4e93f4f17sm7817163pfb.117.2024.03.04.14.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 14:15:32 -0800 (PST)
Date: Mon, 4 Mar 2024 14:15:26 -0800
From: Igor Pylypiv <ipylypiv@google.com>
To: John Garry <john.g.garry@oracle.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
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
Subject: Re: [PATCH v3 1/7] ata: libata-sata: Factor out NCQ Priority
 configuration helpers
Message-ID: <ZeZH_jX4SO9YxgXk@google.com>
References: <20240302201636.1228331-1-ipylypiv@google.com>
 <20240302201636.1228331-2-ipylypiv@google.com>
 <5c20140a-79e8-4d0a-899a-d4ec5c9def42@oracle.com>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c20140a-79e8-4d0a-899a-d4ec5c9def42@oracle.com>

On Mon, Mar 04, 2024 at 08:34:52AM +0000, John Garry wrote:
> On 02/03/2024 20:16, Igor Pylypiv wrote:
> > Export libata NCQ Priority configuration helpers to be reused
> > for libsas managed SATA devices.
> > 
> > Signed-off-by: Igor Pylypiv <ipylypiv@google.com>
> 
> This looks ok. Some small code comments below, though.
> 
> > ---
> >   drivers/ata/libata-sata.c | 139 +++++++++++++++++++++++++++-----------
> >   include/linux/libata.h    |   4 ++
> >   2 files changed, 103 insertions(+), 40 deletions(-)
> > 
> > diff --git a/drivers/ata/libata-sata.c b/drivers/ata/libata-sata.c
> > index 0fb1934875f2..a8d5e36d5211 100644
> > --- a/drivers/ata/libata-sata.c
> > +++ b/drivers/ata/libata-sata.c
> > @@ -848,29 +848,73 @@ DEVICE_ATTR(link_power_management_policy, S_IRUGO | S_IWUSR,
> >   	    ata_scsi_lpm_show, ata_scsi_lpm_store);
> >   EXPORT_SYMBOL_GPL(dev_attr_link_power_management_policy);
> > +/**
> > + *	ata_ncq_prio_supported - Check if device supports NCQ Priority
> > + *	@ap: ATA port of the target device
> > + *	@sdev: SCSI device
> > + *
> > + *	Helper to check if device supports NCQ Priority feature,
> > + *	usable with both libsas and libata.
> > + */
> > +int ata_ncq_prio_supported(struct ata_port *ap, struct scsi_device *sdev)
> > +{
> > +	struct ata_device *dev;
> > +	unsigned long flags;
> > +	int rc;
> > +
> > +	spin_lock_irqsave(ap->lock, flags);
> > +	dev = ata_scsi_find_dev(ap, sdev);
> > +	if (!dev)
> > +		rc = -ENODEV;
> > +	else
> > +		rc = !!(dev->flags & ATA_DFLAG_NCQ_PRIO);
> > +	spin_unlock_irqrestore(ap->lock, flags);
> > +	return rc;
> > +}
> 
> I'm not the biggest fan of functions which effectively return both a boolean
> and an error code.
> 
> I like this patten more:
> 
> int ata_ncq_prio_supported(struct ata_port *ap, struct scsi_device *sdev,
> bool *supported)
> {
> 	...
> 	if (rc)
> 		return rc;
> 	*supported = true/false.
> 	return 0;
> }
> 
> No big deal, though.

Thanks for the review, John. Separating out an error code and a boolean
makes the code a bit more readable. Sent out v4 with the changes.

> 
> > +EXPORT_SYMBOL_GPL(ata_ncq_prio_supported);
> > +
> >   static ssize_t ata_ncq_prio_supported_show(struct device *device,
> >   					   struct device_attribute *attr,
> >   					   char *buf)
> >   {
> >   	struct scsi_device *sdev = to_scsi_device(device);
> >   	struct ata_port *ap = ata_shost_to_port(sdev->host);
> > +	int rc;
> > +
> > +	rc = ata_ncq_prio_supported(ap, sdev);
> > +	if (rc < 0)
> > +		return rc;
> > +
> > +	return sysfs_emit(buf, "%d\n", rc);
> > +}
> > +
> > +DEVICE_ATTR(ncq_prio_supported, S_IRUGO, ata_ncq_prio_supported_show, NULL);
> > +EXPORT_SYMBOL_GPL(dev_attr_ncq_prio_supported);
> > +
> > +/**
> > + *	ata_ncq_prio_enabled - Check if NCQ Priority is enabled
> > + *	@ap: ATA port of the target device
> > + *	@sdev: SCSI device
> > + *
> > + *	Helper to check if NCQ Priority feature is enabled,
> > + *	usable with both libsas and libata.
> 
> It's usable by anything which uses libata, really. For the moment that is
> libsas and libata.
> 
> > + */
> > +int ata_ncq_prio_enabled(struct ata_port *ap, struct scsi_device *sdev)
> > +{
> >   	struct ata_device *dev;
> > -	bool ncq_prio_supported;
> > -	int rc = 0;
> > +	unsigned long flags;
> > +	int rc;
> > -	spin_lock_irq(ap->lock);
> > +	spin_lock_irqsave(ap->lock, flags);
> >   	dev = ata_scsi_find_dev(ap, sdev);
> >   	if (!dev)
> >   		rc = -ENODEV;
> >   	else
> > -		ncq_prio_supported = dev->flags & ATA_DFLAG_NCQ_PRIO;
> > -	spin_unlock_irq(ap->lock);
> > -
> > -	return rc ? rc : sysfs_emit(buf, "%u\n", ncq_prio_supported);
> > +		rc = !!(dev->flags & ATA_DFLAG_NCQ_PRIO_ENABLED);
> > +	spin_unlock_irqrestore(ap->lock, flags);
> > +	return rc;
> >   }
> > -
> > -DEVICE_ATTR(ncq_prio_supported, S_IRUGO, ata_ncq_prio_supported_show, NULL);
> > -EXPORT_SYMBOL_GPL(dev_attr_ncq_prio_supported);
> > +EXPORT_SYMBOL_GPL(ata_ncq_prio_enabled);
> >   static ssize_t ata_ncq_prio_enable_show(struct device *device,
> >   					struct device_attribute *attr,
> > @@ -878,50 +922,45 @@ static ssize_t ata_ncq_prio_enable_show(struct device *device,
> >   {
> >   	struct scsi_device *sdev = to_scsi_device(device);
> >   	struct ata_port *ap = ata_shost_to_port(sdev->host);
> > -	struct ata_device *dev;
> > -	bool ncq_prio_enable;
> > -	int rc = 0;
> > +	int rc;
> > -	spin_lock_irq(ap->lock);
> > -	dev = ata_scsi_find_dev(ap, sdev);
> > -	if (!dev)
> > -		rc = -ENODEV;
> > -	else
> > -		ncq_prio_enable = dev->flags & ATA_DFLAG_NCQ_PRIO_ENABLED;
> > -	spin_unlock_irq(ap->lock);
> > +	rc = ata_ncq_prio_enabled(ap, sdev);
> > +	if (rc < 0)
> > +		return rc;
> > -	return rc ? rc : sysfs_emit(buf, "%u\n", ncq_prio_enable);
> > +	return sysfs_emit(buf, "%d\n", rc);
> >   }
> > -static ssize_t ata_ncq_prio_enable_store(struct device *device,
> > -					 struct device_attribute *attr,
> > -					 const char *buf, size_t len)
> > +/**
> > + *	ata_ncq_prio_enable - Enable/disable NCQ Priority
> > + *	@ap: ATA port of the target device
> > + *	@sdev: SCSI device
> > + *	@enable: true - enable NCQ Priority, false - disable NCQ Priority
> > + *
> > + *	Helper to enable/disable NCQ Priority feature, usable with both
> > + *	libsas and libata.
> > + */
> > +int ata_ncq_prio_enable(struct ata_port *ap, struct scsi_device *sdev,
> > +			bool enable)
> >   {
> > -	struct scsi_device *sdev = to_scsi_device(device);
> > -	struct ata_port *ap;
> >   	struct ata_device *dev;
> > -	long int input;
> > +	unsigned long flags;
> >   	int rc = 0;
> > -	rc = kstrtol(buf, 10, &input);
> > -	if (rc)
> > -		return rc;
> > -	if ((input < 0) || (input > 1))
> > -		return -EINVAL;
> > +	spin_lock_irqsave(ap->lock, flags);
> > -	ap = ata_shost_to_port(sdev->host);
> >   	dev = ata_scsi_find_dev(ap, sdev);
> > -	if (unlikely(!dev))
> > -		return  -ENODEV;
> > -
> > -	spin_lock_irq(ap->lock);
> > +	if (unlikely(!dev)) {
> 
> no need for unlikely() - this is not fathpath
> 
> > +		rc = -ENODEV;
> > +		goto unlock;
> > +	}
> >   	if (!(dev->flags & ATA_DFLAG_NCQ_PRIO)) {
> >   		rc = -EINVAL;
> >   		goto unlock;
> 

