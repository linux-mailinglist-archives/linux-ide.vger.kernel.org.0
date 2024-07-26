Return-Path: <linux-ide+bounces-1973-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CB893D159
	for <lists+linux-ide@lfdr.de>; Fri, 26 Jul 2024 12:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E368C2810E2
	for <lists+linux-ide@lfdr.de>; Fri, 26 Jul 2024 10:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDAD61EB27;
	Fri, 26 Jul 2024 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXrbWM16"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DD97F8
	for <linux-ide@vger.kernel.org>; Fri, 26 Jul 2024 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721990868; cv=none; b=lGEEWujfv7kz0djOm1Q/6w+oGflK3LSKLm1dSdg2Q3wrQRhiVj7Wi0BFxCr21QpuKfvf9rLiqiZzc69CBjbFDJAWnP9tSTXlzBs5+EFCv3vRn6z8E88SGChArm5lM5grw3NP1hTB5VYnNkhv3q9hLnseIGEMWjdUwvet6Z7ooDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721990868; c=relaxed/simple;
	bh=l+vXPQeC3eBKX39e6Lu9Tz9e0g029BgLZFH5OUlTC18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDGlSBSspgFK2dbvbRzxWet2MO7VksDitOoBubbv3hJCyld9qOfwZgWgYYNzD4NMUUBRM0MKBC+anA1b0hiUKgM2Ut+NfCTzzwAx9qfeEag49ZEOsG4awSvzZh6BJV5fuz0yG5eU+EjETzNHG2aMRvLutW1i45v+b/vR0AyC0ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXrbWM16; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D30C32782;
	Fri, 26 Jul 2024 10:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721990868;
	bh=l+vXPQeC3eBKX39e6Lu9Tz9e0g029BgLZFH5OUlTC18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OXrbWM16xqUGl1+8RW1PcxBNjROykrBhHxCK8gnTkyIA8qGrWFUhTbFGECBlkGaKm
	 8y6phc+6Qi06dFBFd6HrwSmvlZrk4fCVs6Z/BRdUjjNSQ6J4/AZjcsEmaNbBa+Sqhp
	 gd6NDxiplWIKxD1Qd7BgxKACj1FtNBEGd4p8fV3xGdR7FGMRZqOGwx4VsIZyqkhVCF
	 LMYFrv9vn4Xdil0nHLj2nzdXNg+LieB8NZRS1OLxLs+ys7dkJB5eCl3IMLfycGmtgy
	 v/9nbEtr+O47dIi4FS8R30OHHkvefnNj1ky+XRHg1tEJ9vl+v9aloY7lHQscsSskdp
	 Ttwq+J9IvBdCA==
Date: Fri, 26 Jul 2024 12:47:44 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: linux-ide@vger.kernel.org
Subject: Re: [PATCH v6 04/11] ata: libata: Print quirks applied to devices
Message-ID: <ZqN-0F74yBsFdtJu@ryzen.lan>
References: <20240726031954.566882-1-dlemoal@kernel.org>
 <20240726031954.566882-5-dlemoal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726031954.566882-5-dlemoal@kernel.org>

On Fri, Jul 26, 2024 at 12:19:47PM +0900, Damien Le Moal wrote:
> Introduce the function ata_dev_print_quirks() to print the quirk flags
> that will be applied to a scanned device. This new function is called
> from ata_dev_quirks() when a match on a device model or device model
> and revision is found for a device in the __ata_dev_quirks array.
> 
> To implement this function, the ATA_QUIRK_ flags are redefined using
> the new enum ata_quirk which defines the bit shift for each quirk
> flag. The array of strings ata_quirk_names is used to define the name
> of each flag, which are printed by ata_dev_print_quirks().
> 
> Example output for a device listed in the __ata_dev_quirks array and
> which has the ATA_QUIRK_DISABLE flag applied:
> 
> [10193.461270] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
> [10193.469190] ata1.00: Model 'ASMT109x- Config', rev '2143 5', applying quirks: disable
> [10193.469195] ata1.00: unsupported device, disabling
> [10193.481564] ata1.00: disable device
> 
> enum ata_quirk also defines the __ATA_QUIRK_MAX value as one plus the
> last quirk flag defined. This value is used in ata_dev_quirks() to add a
> build time check that all quirk flags fit within the unsigned int
> (32-bits) quirks field of struct ata_device.
> 
> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
> Reviewed-by: Igor Pylypiv <ipylypiv@google.com>
> ---
>  drivers/ata/libata-core.c |  76 +++++++++++++++++++++++++--
>  include/linux/libata.h    | 106 ++++++++++++++++++++++++++------------
>  2 files changed, 143 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
> index 19b041bd7588..fc9fcfda42b8 100644
> --- a/drivers/ata/libata-core.c
> +++ b/drivers/ata/libata-core.c
> @@ -3988,6 +3988,69 @@ int ata_dev_revalidate(struct ata_device *dev, unsigned int new_class,
>  	return rc;
>  }
>  
> +static const char * const ata_quirk_names[] = {
> +	[__ATA_QUIRK_DIAGNOSTIC]	= "diagnostic",
> +	[__ATA_QUIRK_NODMA]		= "nodma",
> +	[__ATA_QUIRK_NONCQ]		= "noncq",
> +	[__ATA_QUIRK_MAX_SEC_128]	= "maxsec128",
> +	[__ATA_QUIRK_BROKEN_HPA]	= "brokenhpa",
> +	[__ATA_QUIRK_DISABLE]		= "disable",
> +	[__ATA_QUIRK_HPA_SIZE]		= "hpasize",
> +	[__ATA_QUIRK_IVB]		= "ivb",
> +	[__ATA_QUIRK_STUCK_ERR]		= "stuckerr",
> +	[__ATA_QUIRK_BRIDGE_OK]		= "bridgeok",
> +	[__ATA_QUIRK_ATAPI_MOD16_DMA]	= "atapimod16dma",
> +	[__ATA_QUIRK_FIRMWARE_WARN]	= "firmwarewarn",
> +	[__ATA_QUIRK_1_5_GBPS]		= "1.5gbps",
> +	[__ATA_QUIRK_NOSETXFER]		= "nosetxfer",
> +	[__ATA_QUIRK_BROKEN_FPDMA_AA]	= "brokenfpdmaaa",
> +	[__ATA_QUIRK_DUMP_ID]		= "dumpid",
> +	[__ATA_QUIRK_MAX_SEC_LBA48]	= "maxseclba48",
> +	[__ATA_QUIRK_ATAPI_DMADIR]	= "atapidmadir",
> +	[__ATA_QUIRK_NO_NCQ_TRIM]	= "noncqtrim",
> +	[__ATA_QUIRK_NOLPM]		= "nolpm",
> +	[__ATA_QUIRK_WD_BROKEN_LPM]	= "wdbrokenlpm",
> +	[__ATA_QUIRK_ZERO_AFTER_TRIM]	= "zeroaftertrim",
> +	[__ATA_QUIRK_NO_DMA_LOG]	= "nodmalog",
> +	[__ATA_QUIRK_NOTRIM]		= "notrim",
> +	[__ATA_QUIRK_MAX_SEC_1024]	= "maxsec1024",
> +	[__ATA_QUIRK_MAX_TRIM_128M]	= "maxtrim128m",
> +	[__ATA_QUIRK_NO_NCQ_ON_ATI]	= "noncqonati",
> +	[__ATA_QUIRK_NO_ID_DEV_LOG]	= "noiddevlog",
> +	[__ATA_QUIRK_NO_LOG_DIR]	= "nologdir",
> +	[__ATA_QUIRK_NO_FUA]		= "nofua",
> +};
> +
> +static void ata_dev_print_quirks(const struct ata_device *dev,
> +				 const char *model, const char *rev,
> +				 unsigned int quirks)
> +{
> +	int n = 0, i;
> +	size_t sz;
> +	char *str;
> +
> +	if (!quirks)
> +		return;
> +
> +	sz = 64 + ARRAY_SIZE(ata_quirk_names) * 16;
> +	str = kmalloc(sz, GFP_KERNEL);
> +	if (!str)
> +		return;
> +
> +	n = snprintf(str, sz, "Model '%s', rev '%s', applying quirks:",
> +		     model, rev);
> +
> +	for (i = 0; i < ARRAY_SIZE(ata_quirk_names); i++) {
> +		if (quirks & (1U << i))
> +			n += snprintf(str + n, sz - n,
> +				      " %s", ata_quirk_names[i]);
> +	}
> +
> +	ata_dev_warn(dev, "%s\n", str);
> +
> +	kfree(str);
> +}
> +
>  struct ata_dev_quirks_entry {
>  	const char *model_num;
>  	const char *model_rev;
> @@ -4273,15 +4336,18 @@ static unsigned int ata_dev_quirks(const struct ata_device *dev)
>  	unsigned char model_rev[ATA_ID_FW_REV_LEN + 1];
>  	const struct ata_dev_quirks_entry *ad = __ata_dev_quirks;
>  
> +	/* dev->quirks is an unsigned int. */
> +	BUILD_BUG_ON(__ATA_QUIRK_MAX > 32);
> +
>  	ata_id_c_string(dev->id, model_num, ATA_ID_PROD, sizeof(model_num));
>  	ata_id_c_string(dev->id, model_rev, ATA_ID_FW_REV, sizeof(model_rev));
>  
>  	while (ad->model_num) {
> -		if (glob_match(ad->model_num, model_num)) {
> -			if (ad->model_rev == NULL)
> -				return ad->quirks;
> -			if (glob_match(ad->model_rev, model_rev))
> -				return ad->quirks;
> +		if (glob_match(ad->model_num, model_num) &&
> +		    (!ad->model_rev || glob_match(ad->model_rev, model_rev))) {
> +			ata_dev_print_quirks(dev, model_num, model_rev,
> +					     ad->quirks);
> +			return ad->quirks;
>  		}
>  		ad++;
>  	}
> diff --git a/include/linux/libata.h b/include/linux/libata.h
> index 05dd7038ab30..d598ef690e50 100644
> --- a/include/linux/libata.h
> +++ b/include/linux/libata.h
> @@ -55,6 +55,46 @@
>  /* defines only for the constants which don't work well as enums */
>  #define ATA_TAG_POISON		0xfafbfcfdU
>  
> +/*
> + * Quirk flags bits.
> + * ata_device->quirks is an unsigned int, so __ATA_QUIRK_MAX must not exceed 32.
> + */
> +enum ata_quirks {
> +	__ATA_QUIRK_DIAGNOSTIC,		/* Failed boot diag */
> +	__ATA_QUIRK_NODMA,		/* DMA problems */
> +	__ATA_QUIRK_NONCQ,		/* Don't use NCQ */
> +	__ATA_QUIRK_MAX_SEC_128,	/* Limit max sects to 128 */
> +	__ATA_QUIRK_BROKEN_HPA,		/* Broken HPA */
> +	__ATA_QUIRK_DISABLE,		/* Disable it */
> +	__ATA_QUIRK_HPA_SIZE,		/* Native size off by one */
> +	__ATA_QUIRK_IVB,		/* cbl det validity bit bugs */
> +	__ATA_QUIRK_STUCK_ERR,		/* Stuck ERR on next PACKET */
> +	__ATA_QUIRK_BRIDGE_OK,		/* No bridge limits */
> +	__ATA_QUIRK_ATAPI_MOD16_DMA,	/* Use ATAPI DMA for commands that */
> +					/* are not a multiple of 16 bytes */
> +	__ATA_QUIRK_FIRMWARE_WARN,	/* Firmware update warning */
> +	__ATA_QUIRK_1_5_GBPS,		/* Force 1.5 Gbps */
> +	__ATA_QUIRK_NOSETXFER,		/* Skip SETXFER, SATA only */
> +	__ATA_QUIRK_BROKEN_FPDMA_AA,	/* Skip AA */
> +	__ATA_QUIRK_DUMP_ID,		/* Dump IDENTIFY data */
> +	__ATA_QUIRK_MAX_SEC_LBA48,	/* Set max sects to 65535 */
> +	__ATA_QUIRK_ATAPI_DMADIR,	/* Device requires dmadir */
> +	__ATA_QUIRK_NO_NCQ_TRIM,	/* Do not use queued TRIM */
> +	__ATA_QUIRK_NOLPM,		/* Do not use LPM */
> +	__ATA_QUIRK_WD_BROKEN_LPM,	/* Some WDs have broken LPM */
> +	__ATA_QUIRK_ZERO_AFTER_TRIM,	/* Guarantees zero after trim */
> +	__ATA_QUIRK_NO_DMA_LOG,		/* Do not use DMA for log read */
> +	__ATA_QUIRK_NOTRIM,		/* Do not use TRIM */
> +	__ATA_QUIRK_MAX_SEC_1024,	/* Limit max sects to 1024 */
> +	__ATA_QUIRK_MAX_TRIM_128M,	/* Limit max trim size to 128M */
> +	__ATA_QUIRK_NO_NCQ_ON_ATI,	/* Disable NCQ on ATI chipset */
> +	__ATA_QUIRK_NO_ID_DEV_LOG,	/* Identify device log missing */
> +	__ATA_QUIRK_NO_LOG_DIR,		/* Do not read log directory */
> +	__ATA_QUIRK_NO_FUA,		/* Do not use FUA */
> +
> +	__ATA_QUIRK_MAX,
> +};
> +
>  enum {
>  	/* various global constants */
>  	LIBATA_MAX_PRD		= ATA_MAX_PRD / 2,
> @@ -366,40 +406,38 @@ enum {
>  	 * Quirk flags: may be set by libata or controller drivers on drives.
>  	 * Some quirks may be drive/controller pair dependent.
>  	 */
> -	ATA_QUIRK_DIAGNOSTIC	= (1 << 0),	/* Failed boot diag */
> -	ATA_QUIRK_NODMA		= (1 << 1),	/* DMA problems */
> -	ATA_QUIRK_NONCQ		= (1 << 2),	/* Do not use NCQ */
> -	ATA_QUIRK_MAX_SEC_128	= (1 << 3),	/* Limit max sects to 128 */
> -	ATA_QUIRK_BROKEN_HPA	= (1 << 4),	/* Broken HPA */
> -	ATA_QUIRK_DISABLE	= (1 << 5),	/* Disable it */
> -	ATA_QUIRK_HPA_SIZE	= (1 << 6),	/* Native size off by one */
> -	ATA_QUIRK_IVB		= (1 << 8),	/* CBL det validity bit bugs */
> -	ATA_QUIRK_STUCK_ERR	= (1 << 9),	/* Stuck ERR on next PACKET */
> -	ATA_QUIRK_BRIDGE_OK	= (1 << 10),	/* No bridge limits */
> -	ATA_QUIRK_ATAPI_MOD16_DMA = (1 << 11),	/* Use ATAPI DMA for commands */
> -						/* not multiple of 16 bytes */
> -	ATA_QUIRK_FIRMWARE_WARN = (1 << 12),	/* Firmware update warning */
> -	ATA_QUIRK_1_5_GBPS	= (1 << 13),	/* Force 1.5 Gbps */
> -	ATA_QUIRK_NOSETXFER	= (1 << 14),	/* Skip SETXFER, SATA only */
> -	ATA_QUIRK_BROKEN_FPDMA_AA = (1 << 15),	/* Skip AA */
> -	ATA_QUIRK_DUMP_ID	= (1 << 16),	/* Dump IDENTIFY data */
> -	ATA_QUIRK_MAX_SEC_LBA48 = (1 << 17),	/* Set max sects to 65535 */
> -	ATA_QUIRK_ATAPI_DMADIR	= (1 << 18),	/* Device requires dmadir */
> -	ATA_QUIRK_NO_NCQ_TRIM	= (1 << 19),	/* Do not use queued TRIM */
> -	ATA_QUIRK_NOLPM		= (1 << 20),	/* Do not use LPM */
> -	ATA_QUIRK_WD_BROKEN_LPM = (1 << 21),	/* Some WDs have broken LPM */
> -	ATA_QUIRK_ZERO_AFTER_TRIM = (1 << 22),	/* Guarantees zero after trim */
> -	ATA_QUIRK_NO_DMA_LOG	= (1 << 23),	/* Do not use DMA for log read */
> -	ATA_QUIRK_NOTRIM	= (1 << 24),	/* Do not use TRIM */
> -	ATA_QUIRK_MAX_SEC_1024	= (1 << 25),	/* Limit max sects to 1024 */
> -	ATA_QUIRK_MAX_TRIM_128M = (1 << 26),	/* Limit max trim size to 128M */
> -	ATA_QUIRK_NO_NCQ_ON_ATI = (1 << 27),	/* Disable NCQ on ATI chipset */
> -	ATA_QUIRK_NO_ID_DEV_LOG = (1 << 28),	/* Identify device log missing */
> -	ATA_QUIRK_NO_LOG_DIR	= (1 << 29),	/* Do not read log directory */
> -	ATA_QUIRK_NO_FUA	= (1 << 30),	/* Do not use FUA */
> -
> -	 /* DMA mask for user DMA control: User visible values; DO NOT
> -	    renumber */
> +	ATA_QUIRK_DIAGNOSTIC		= (1U << __ATA_QUIRK_DIAGNOSTIC),
> +	ATA_QUIRK_NODMA			= (1U << __ATA_QUIRK_NODMA),
> +	ATA_QUIRK_NONCQ			= (1U << __ATA_QUIRK_NONCQ),
> +	ATA_QUIRK_MAX_SEC_128		= (1U << __ATA_QUIRK_MAX_SEC_128),
> +	ATA_QUIRK_BROKEN_HPA		= (1U << __ATA_QUIRK_BROKEN_HPA),
> +	ATA_QUIRK_DISABLE		= (1U << __ATA_QUIRK_DISABLE),
> +	ATA_QUIRK_HPA_SIZE		= (1U << __ATA_QUIRK_HPA_SIZE),
> +	ATA_QUIRK_IVB			= (1U << __ATA_QUIRK_IVB),
> +	ATA_QUIRK_STUCK_ERR		= (1U << __ATA_QUIRK_STUCK_ERR),
> +	ATA_QUIRK_BRIDGE_OK		= (1U << __ATA_QUIRK_BRIDGE_OK),
> +	ATA_QUIRK_ATAPI_MOD16_DMA	= (1U << __ATA_QUIRK_ATAPI_MOD16_DMA),
> +	ATA_QUIRK_FIRMWARE_WARN		= (1U << __ATA_QUIRK_FIRMWARE_WARN),
> +	ATA_QUIRK_1_5_GBPS		= (1U << __ATA_QUIRK_1_5_GBPS),
> +	ATA_QUIRK_NOSETXFER		= (1U << __ATA_QUIRK_NOSETXFER),
> +	ATA_QUIRK_BROKEN_FPDMA_AA	= (1U << __ATA_QUIRK_BROKEN_FPDMA_AA),
> +	ATA_QUIRK_DUMP_ID		= (1U << __ATA_QUIRK_DUMP_ID),
> +	ATA_QUIRK_MAX_SEC_LBA48		= (1U << __ATA_QUIRK_MAX_SEC_LBA48),
> +	ATA_QUIRK_ATAPI_DMADIR		= (1U << __ATA_QUIRK_ATAPI_DMADIR),
> +	ATA_QUIRK_NO_NCQ_TRIM		= (1U << __ATA_QUIRK_NO_NCQ_TRIM),
> +	ATA_QUIRK_NOLPM			= (1U << __ATA_QUIRK_NOLPM),
> +	ATA_QUIRK_WD_BROKEN_LPM		= (1U << __ATA_QUIRK_WD_BROKEN_LPM),
> +	ATA_QUIRK_ZERO_AFTER_TRIM	= (1U << __ATA_QUIRK_ZERO_AFTER_TRIM),
> +	ATA_QUIRK_NO_DMA_LOG		= (1U << __ATA_QUIRK_NO_DMA_LOG),
> +	ATA_QUIRK_NOTRIM		= (1U << __ATA_QUIRK_NOTRIM),
> +	ATA_QUIRK_MAX_SEC_1024		= (1U << __ATA_QUIRK_MAX_SEC_1024),
> +	ATA_QUIRK_MAX_TRIM_128M		= (1U << __ATA_QUIRK_MAX_TRIM_128M),
> +	ATA_QUIRK_NO_NCQ_ON_ATI		= (1U << __ATA_QUIRK_NO_NCQ_ON_ATI),
> +	ATA_QUIRK_NO_ID_DEV_LOG		= (1U << __ATA_QUIRK_NO_ID_DEV_LOG),
> +	ATA_QUIRK_NO_LOG_DIR		= (1U << __ATA_QUIRK_NO_LOG_DIR),
> +	ATA_QUIRK_NO_FUA		= (1U << __ATA_QUIRK_NO_FUA),

Personally, I would prefer if these used the BIT() macro.
But since BIT() does the shift with 1UL, that might require that this patch
(and the previous patch in the series) changes the quirk data type to
consistenly be "unsigned long" everywhere, instead of changing the quirk data
type to consistently be "unsigned int" everywhere.

We could still keep the:
BUILD_BUG_ON(__ATA_QUIRK_MAX > 32);

Since unsigned long is 32-bits on 32-bit platforms.

FWIW, on nvme, quirks is defined as "unsigned long" in drivers/nvme/host/nvme.h

But since this is personal preference, I would also be fine if you decide
to keep this patch as it is, thus:
Reviewed-by: Niklas Cassel <cassel@kernel.org>

