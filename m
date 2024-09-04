Return-Path: <linux-ide+bounces-2216-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D33E96900D
	for <lists+linux-ide@lfdr.de>; Tue,  3 Sep 2024 00:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 978051C20C9D
	for <lists+linux-ide@lfdr.de>; Mon,  2 Sep 2024 22:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132BA187340;
	Mon,  2 Sep 2024 22:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ej3srXdP"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B535FDA7
	for <linux-ide@vger.kernel.org>; Mon,  2 Sep 2024 22:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725317707; cv=none; b=r2VxSlNDIGra9JH3dYcUgPE32lhRbkyBwdDY58VXFp9mDdirIXzkfkcxS+MqGNjDThHp4CwcHPznACntbQ3zd9ZCjxeO8lbReyn9H0ygD3s8GYB4ZFlRxONjhYqGBCoRXwPSGd4iR8d85MpwSfYSC2zY9Y6J0Qs+vjl336RQ5Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725317707; c=relaxed/simple;
	bh=DH3MiiITdNKPwr3R3Ixhd7JtXemRUoTr/JaM4C7yprk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Efssak+vOVH3CCoVPgupFFYWDjQYraqpUYC3ZogY3ED+Hied18eHbNC7Nmky6YZncikCblKUZ6B+OqoAHlzXRAxfY7AtTfeRaAdoBNOL526f+d82jtREqfEDJf4Ex7Dx+NH7auzn+vasphCzcjCp9ivnSsLjRSmHym4ZXuUuYLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ej3srXdP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19736C4CEC2;
	Mon,  2 Sep 2024 22:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725317706;
	bh=DH3MiiITdNKPwr3R3Ixhd7JtXemRUoTr/JaM4C7yprk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ej3srXdPrii12sqkBnuKeu2pEud7DJYWJQOPZAXd0RvOuUbg1nNdqrb9PRyr2hGK+
	 m//ajQdijYwG3kAFaNVr+XxA1Tl8HyfLsYkApqUD/FH5hS9bXRKxQh2Ej5L1oq0yy1
	 z3P4B1qOOt891K52Jv6FVeH3AEZiLp45xJnvARLjKRz/TKAHV1mzLAkT4fJJOasCYx
	 6vz0P/LNShDiQ0s/Z9ME7XUWxENEO55/EeNEyyra4P9YcvdXoPyL+Di2IZji/hNT+X
	 cVpbd+NLFyCL/lp2WYyazFWQ0KD9o0MXbvw3ka+j/vNyecdwbVbGHjsT4mklSH0Lq4
	 381+wfBz5Rkig==
Message-ID: <847eed24-dc05-4f6f-b933-63687ba22ccc@kernel.org>
Date: Tue, 3 Sep 2024 07:55:05 +0900
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] ata: libata: Improve CDL resource management
To: Niklas Cassel <cassel@kernel.org>
Cc: linux-ide@vger.kernel.org
References: <20240902115400.166881-1-dlemoal@kernel.org>
 <20240902115400.166881-8-dlemoal@kernel.org> <ZtYoTn8kydZ9u4gA@x1-carbon.lan>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <ZtYoTn8kydZ9u4gA@x1-carbon.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/3/24 06:04, Niklas Cassel wrote:
> On Mon, Sep 02, 2024 at 08:54:00PM +0900, Damien Le Moal wrote:
>> The ncq_sense_buf buffer field of struct ata_port is allocated and used
>> only for devices that support the Command Duration Limits (CDL) feature.
>> However, the cdl buffer of struct ata_device, which is used to cache the
>> command duration limits log page for devices supporting CDL is always
>> allocated as part of struct ata_device, which is wasteful of memory for
>> devices that do not support this feature.
>>
>> Clean this up by defining both buffers as part of the new ata_cdl
>> structure and allocating this structure only for devices that support
>> the CDL feature. This new structure is attached to struct ata_device
>> using the cdl pointer.
>>
>> The functions ata_dev_init_cdl_resources() and
>> ata_dev_cleanup_cdl_resources() are defined to manage this new structure
>> allocation, initialization and cleanup when a port is removed or a
>> device disabled. ata_dev_init_cdl_resources() is called from
>> ata_dev_config_cdl() only for devices that support CDL.
>> ata_dev_cleanup_cdl_resources() is called from ata_port_free() and
>> ata_eh_dev_disable() to free the ata_cdl structure when a device is
>> being disabled by EH or its port being removed.
>>
>> Note that the name of the former cdl log buffer of struct ata_device is
>> changed to desc_log_buf to make it clearer that it is a buffer for the
>> limit descriptors log page.
>>
>> This change reduces the size of struct ata_device, thus reducing memory
>> usage for ATA devices that do not support the CDL feature.
>>
>> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
>> Reviewed-by: Hannes Reinecke <hare@suse.de>
>> ---
>>  drivers/ata/libata-core.c | 74 ++++++++++++++++++++++++++-------------
>>  drivers/ata/libata-eh.c   |  2 ++
>>  drivers/ata/libata-sata.c |  2 +-
>>  drivers/ata/libata-scsi.c |  2 +-
>>  drivers/ata/libata.h      |  1 +
>>  include/linux/libata.h    | 21 ++++++++---
>>  6 files changed, 72 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
>> index 32325a1c07af..428931a0cb8d 100644
>> --- a/drivers/ata/libata-core.c
>> +++ b/drivers/ata/libata-core.c
>> @@ -2464,12 +2464,40 @@ static void ata_dev_config_trusted(struct ata_device *dev)
>>  		dev->flags |= ATA_DFLAG_TRUSTED;
>>  }
>>  
>> +static int ata_dev_init_cdl_resources(struct ata_device *dev)
>> +{
>> +	struct ata_cdl *cdl = dev->cdl;
>> +	unsigned int err_mask;
>> +
>> +	if (!cdl) {
>> +		cdl = kzalloc(sizeof(struct ata_cdl), GFP_KERNEL);
> 
> cdl = kzalloc(sizeof(*ata_cdl), GFP_KERNEL);
> 
> is more robust, as with the current code, if someone changes type of *cdl,
> there is a chance to introduce a bug if they forget to update this line.
> 
> 
>> +		if (!cdl)
>> +			return -ENOMEM;
>> +		dev->cdl = cdl;
>> +	}
>> +
>> +	err_mask = ata_read_log_page(dev, ATA_LOG_CDL, 0, cdl->desc_log_buf,
>> +				     ATA_LOG_CDL_SIZE / ATA_SECT_SIZE);
>> +	if (err_mask) {
>> +		ata_dev_warn(dev, "Read Command Duration Limits log failed\n");
>> +		return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +void ata_dev_cleanup_cdl_resources(struct ata_device *dev)
>> +{
>> +	kfree(dev->cdl);
>> +	dev->cdl = NULL;
>> +}
>> +
>>  static void ata_dev_config_cdl(struct ata_device *dev)
>>  {
>> -	struct ata_port *ap = dev->link->ap;
>>  	unsigned int err_mask;
>>  	bool cdl_enabled;
>>  	u64 val;
>> +	int ret;
>>  
>>  	if (ata_id_major_version(dev->id) < 11)
>>  		goto not_supported;
>> @@ -2564,37 +2592,20 @@ static void ata_dev_config_cdl(struct ata_device *dev)
>>  		}
>>  	}
>>  
>> -	/*
>> -	 * Allocate a buffer to handle reading the sense data for successful
>> -	 * NCQ Commands log page for commands using a CDL with one of the limit
>> -	 * policy set to 0xD (successful completion with sense data available
>> -	 * bit set).
>> -	 */
>> -	if (!ap->ncq_sense_buf) {
>> -		ap->ncq_sense_buf = kmalloc(ATA_LOG_SENSE_NCQ_SIZE, GFP_KERNEL);
>> -		if (!ap->ncq_sense_buf)
>> -			goto not_supported;
>> -	}
>> -
>> -	/*
>> -	 * Command duration limits is supported: cache the CDL log page 18h
>> -	 * (command duration descriptors).
>> -	 */
>> -	err_mask = ata_read_log_page(dev, ATA_LOG_CDL, 0, dev->sector_buf, 1);
>> -	if (err_mask) {
>> -		ata_dev_warn(dev, "Read Command Duration Limits log failed\n");
>> +	/* CDL is supported: allocate and initialize needed resources. */
>> +	ret = ata_dev_init_cdl_resources(dev);
>> +	if (ret) {
>> +		ata_dev_warn(dev, "Initialize CDL resources failed\n");
>>  		goto not_supported;
>>  	}
>>  
>> -	memcpy(dev->cdl, dev->sector_buf, ATA_LOG_CDL_SIZE);
>>  	dev->flags |= ATA_DFLAG_CDL;
>>  
>>  	return;
>>  
>>  not_supported:
>>  	dev->flags &= ~(ATA_DFLAG_CDL | ATA_DFLAG_CDL_ENABLED);
>> -	kfree(ap->ncq_sense_buf);
>> -	ap->ncq_sense_buf = NULL;
>> +	ata_dev_cleanup_cdl_resources(dev);
>>  }
>>  
>>  static int ata_dev_config_lba(struct ata_device *dev)
>> @@ -5446,12 +5457,19 @@ EXPORT_SYMBOL_GPL(ata_port_alloc);
>>  
>>  void ata_port_free(struct ata_port *ap)
>>  {
>> +	struct ata_device *dev;
>> +	struct ata_link *link;
>> +
>>  	if (!ap)
>>  		return;
>>  
>> +	ata_for_each_link(link, ap, HOST_FIRST) {
>> +		ata_for_each_dev(dev, link, ALL)
>> +			ata_dev_cleanup_cdl_resources(dev);
>> +	}
> 
> Here you free the resources when the port is freed, nice.
> 
> 
>> +
>>  	kfree(ap->pmp_link);
>>  	kfree(ap->slave_link);
>> -	kfree(ap->ncq_sense_buf);
>>  	ida_free(&ata_ida, ap->print_id);
>>  	kfree(ap);
>>  }
>> @@ -6000,11 +6018,19 @@ static void ata_port_detach(struct ata_port *ap)
>>  	ata_port_wait_eh(ap);
>>  
>>  	mutex_lock(&ap->scsi_scan_mutex);
>> +
>> +	/* Cleanup CDL device resources */
>> +	ata_for_each_link(link, ap, HOST_FIRST) {
>> +		ata_for_each_dev(dev, link, ALL)
>> +			ata_dev_cleanup_cdl_resources(dev);
> 
> Here you clean up resources.
> Why?
> Resources will get cleaned up when ata_port_free() is called,
> which will be called by ata_devres_release() -> ata_host_put()
> -> ata_host_release() -> ata_port_free(), when the device is
> removed.

That happens only if the host (=port) is removed, but not if only the device is
being removed, e.g. because it was yanked out of its slot (hotplug) or the user
removed it using sysfs. In such case, the port remains and is not deleted, so
ata_port_free() is not called. Ports exists for as long as the adapter exist.

> I don't see any reason to free it here as well.

Hotplug of drives :)

> 
> That will just ensure that the ata_dev_cleanup_cdl_resources()
> call by ata_port_free() will do nothing.

Yes, if the device is removed before the port, ata_dev_cleanup_cdl_resources()
becomes a no-op.

> 
> 
>> +	}
>> +
>>  	spin_lock_irqsave(ap->lock, flags);
>>  
>>  	/* Remove scsi devices */
>>  	ata_for_each_link(link, ap, HOST_FIRST) {
>>  		ata_for_each_dev(dev, link, ALL) {
>> +			ata_dev_cleanup_cdl_resources(dev);
> 
> What is the point of this call?

That is a mistake, should not be here. Will remove it.

> You already looped through all devices in this same function
> (ata_port_detach()) just above.
> 
> But just like my comment above, I don't see any reason to call
> ata_dev_cleanup_cdl_resources() here. The resources will get
> freed by ata_port_free() when the device is removed.
> 
> I think you can remove both ata_dev_cleanup_cdl_resources()
> calls in ata_port_detach().
> 
> 
>>  			if (dev->sdev) {
>>  				spin_unlock_irqrestore(ap->lock, flags);
>>  				scsi_remove_device(dev->sdev);
>> diff --git a/drivers/ata/libata-eh.c b/drivers/ata/libata-eh.c
>> index ed535e1b4225..41f1bee0b434 100644
>> --- a/drivers/ata/libata-eh.c
>> +++ b/drivers/ata/libata-eh.c
>> @@ -500,6 +500,8 @@ static void ata_eh_dev_disable(struct ata_device *dev)
>>  	ata_down_xfermask_limit(dev, ATA_DNXFER_FORCE_PIO0 | ATA_DNXFER_QUIET);
>>  	dev->class++;
>>  
>> +	ata_dev_cleanup_cdl_resources(dev);
>> +
>>  	/* From now till the next successful probe, ering is used to
>>  	 * track probe failures.  Clear accumulated device error info.
>>  	 */
>> diff --git a/drivers/ata/libata-sata.c b/drivers/ata/libata-sata.c
>> index 498430db86f7..c8b119a06bb2 100644
>> --- a/drivers/ata/libata-sata.c
>> +++ b/drivers/ata/libata-sata.c
>> @@ -1505,7 +1505,7 @@ int ata_eh_get_ncq_success_sense(struct ata_link *link)
>>  {
>>  	struct ata_device *dev = link->device;
>>  	struct ata_port *ap = dev->link->ap;
>> -	u8 *buf = ap->ncq_sense_buf;
>> +	u8 *buf = dev->cdl->ncq_sense_log_buf;
>>  	struct ata_queued_cmd *qc;
>>  	unsigned int err_mask, tag;
>>  	u8 *sense, sk = 0, asc = 0, ascq = 0;
>> diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
>> index a3ffce4b218d..7fed924d6561 100644
>> --- a/drivers/ata/libata-scsi.c
>> +++ b/drivers/ata/libata-scsi.c
>> @@ -2259,7 +2259,7 @@ static inline u16 ata_xlat_cdl_limit(u8 *buf)
>>  static unsigned int ata_msense_control_spgt2(struct ata_device *dev, u8 *buf,
>>  					     u8 spg)
>>  {
>> -	u8 *b, *cdl = dev->cdl, *desc;
>> +	u8 *b, *cdl = dev->cdl->desc_log_buf, *desc;
>>  	u32 policy;
>>  	int i;
>>  
>> diff --git a/drivers/ata/libata.h b/drivers/ata/libata.h
>> index 2a9d1bbf2482..0f4c6e26fe50 100644
>> --- a/drivers/ata/libata.h
>> +++ b/drivers/ata/libata.h
>> @@ -89,6 +89,7 @@ extern int ata_cmd_ioctl(struct scsi_device *scsidev, void __user *arg);
>>  extern const char *sata_spd_string(unsigned int spd);
>>  extern unsigned int ata_read_log_page(struct ata_device *dev, u8 log,
>>  				      u8 page, void *buf, unsigned int sectors);
>> +void ata_dev_cleanup_cdl_resources(struct ata_device *dev);
>>  
>>  #define to_ata_port(d) container_of(d, struct ata_port, tdev)
>>  
>> diff --git a/include/linux/libata.h b/include/linux/libata.h
>> index aac38dcd2230..9b4a6ff03235 100644
>> --- a/include/linux/libata.h
>> +++ b/include/linux/libata.h
>> @@ -700,6 +700,21 @@ struct ata_cpr_log {
>>  	struct ata_cpr		cpr[] __counted_by(nr_cpr);
>>  };
>>  
>> +struct ata_cdl {
>> +	/*
>> +	 * Buffer to cache the CDL log page 18h (command duration descriptors)
>> +	 * for SCSI-ATA translation.
>> +	 */
>> +	u8			desc_log_buf[ATA_LOG_CDL_SIZE];
>> +
>> +	/*
>> +	 * Buffer to handle reading the sense data for successful NCQ Commands
>> +	 * log page for commands using a CDL with one of the limits policy set
>> +	 * to 0xD (successful completion with sense data available bit set).
>> +	 */
>> +	u8			ncq_sense_log_buf[ATA_LOG_SENSE_NCQ_SIZE];
>> +};
>> +
>>  struct ata_device {
>>  	struct ata_link		*link;
>>  	unsigned int		devno;		/* 0 or 1 */
>> @@ -762,8 +777,8 @@ struct ata_device {
>>  	/* Concurrent positioning ranges */
>>  	struct ata_cpr_log	*cpr_log;
>>  
>> -	/* Command Duration Limits log support */
>> -	u8			cdl[ATA_LOG_CDL_SIZE];
>> +	/* Command Duration Limits support */
>> +	struct ata_cdl		*cdl;
>>  
>>  	/* error history */
>>  	int			spdn_cnt;
>> @@ -917,8 +932,6 @@ struct ata_port {
>>  #ifdef CONFIG_ATA_ACPI
>>  	struct ata_acpi_gtm	__acpi_init_gtm; /* use ata_acpi_init_gtm() */
>>  #endif
>> -	/* owned by EH */
>> -	u8			*ncq_sense_buf;
>>  };
>>  
>>  /* The following initializer overrides a method to NULL whether one of
>> -- 
>> 2.46.0
>>

-- 
Damien Le Moal
Western Digital Research


