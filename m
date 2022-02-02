Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81EFB4A713F
	for <lists+linux-ide@lfdr.de>; Wed,  2 Feb 2022 14:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235193AbiBBNJZ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 2 Feb 2022 08:09:25 -0500
Received: from mail.acc.umu.se ([130.239.18.156]:50847 "EHLO mail.acc.umu.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229706AbiBBNJY (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Wed, 2 Feb 2022 08:09:24 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by amavisd-new (Postfix) with ESMTP id DB96144B90;
        Wed,  2 Feb 2022 14:09:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=acc.umu.se; s=mail1;
        t=1643807362; bh=xl2WoqJCh9hQjHCqarTU8pNCMigoLz5MQJbbFbWS46E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yK9GYzZ5Z61XAkfva2xSUSLnQcAVYRY5KlJr/7iuuH2eR2BiXLQyjQVSJKX+Qbowg
         uhDAMyFQUSbPx59T3EswJinihYdntzC47PG+tVN5flG5ZVWG+IH6RPlg8kFHQSOPYx
         Gwp8l6tEJEkNBi2EeJfRDlDTuq67HaY/pxhFYJ+Rv1hN9DrkxYOx7188sybWWSklFs
         7NO2QOvR++jLgw3yC1ERsczal6It8J0xSYfs+PmaQ4/WutpZFXWsCKMMtzmQApCfIZ
         qjpSSgzKGZEmUDIvYVq0qEsIzUn3Qg0va0xtbij2kUt8q9xSeMpXlryNImpb3EUlcC
         CpGvct2YkQphw==
Received: by mail.acc.umu.se (Postfix, from userid 24471)
        id 3932E44B92; Wed,  2 Feb 2022 14:09:22 +0100 (CET)
Date:   Wed, 2 Feb 2022 14:09:21 +0100
From:   Anton Lundin <glance@acc.umu.se>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc:     linux-ide@vger.kernel.org
Subject: Re: [PATCH] libata: Don't issue ATA_LOG_DIRECTORY to SATADOM-ML 3ME
Message-ID: <20220202130921.GF723116@montezuma.acc.umu.se>
References: <20220202100536.1909665-1-glance@acc.umu.se>
 <bf9f47f1-08c4-370b-446a-1ae9efdc772a@opensource.wdc.com>
 <20220202122520.GE723116@montezuma.acc.umu.se>
 <b7486a01-2f3f-fc12-82c6-8a6c874793e4@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b7486a01-2f3f-fc12-82c6-8a6c874793e4@opensource.wdc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 02 February, 2022 - Damien Le Moal wrote:

> On 2022/02/02 21:25, Anton Lundin wrote:
> > On 02 February, 2022 - Damien Le Moal wrote:
> > 
> >> On 2/2/22 19:05, Anton Lundin wrote:
> >>> Back in 06f6c4c6c3e8 ("ata: libata: add missing ata_identify_page_supported() calls")
> >>> a read of ATA_LOG_DIRECTORY page was added. This caused the
> >>> SATADOM-ML 3ME to lock up.
> >>>
> >>> In 636f6e2af4fb ("libata: add horkage for missing Identify Device log")
> >>> a flag was added to cache if a device supports this or not.
> >>>
> >>> This adds a blacklist entry which flags that these devices doesn't
> >>> support that call and shouldn't be issued that call.
> >>>
> >>> Cc: stable@vger.kernel.org # v5.10+
> >>> Signed-off-by: Anton Lundin <glance@acc.umu.se>
> >>> Depends-on: 636f6e2af4fb ("libata: add horkage for missing Identify Device log")
> >>
> >> I do not think so. See below.
> >>
> >>> ---
> >>>  drivers/ata/libata-core.c | 7 +++++++
> >>>  1 file changed, 7 insertions(+)
> >>>
> >>> diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
> >>> index 87d36b29ca5f..e024af9f33d0 100644
> >>> --- a/drivers/ata/libata-core.c
> >>> +++ b/drivers/ata/libata-core.c
> >>> @@ -4070,6 +4070,13 @@ static const struct ata_blacklist_entry ata_device_blacklist [] = {
> >>>  	{ "WDC WD3000JD-*",		NULL,	ATA_HORKAGE_WD_BROKEN_LPM },
> >>>  	{ "WDC WD3200JD-*",		NULL,	ATA_HORKAGE_WD_BROKEN_LPM },
> >>>  
> >>> +	/*
> >>> +	 * This sata dom goes on a walkabout when it sees the
> >>> +	 * ATA_LOG_DIRECTORY read request so ensure we don't issue such a
> >>> +	 * request to these devices.
> >>> +	 */
> >>> +	{ "SATADOM-ML 3ME",		NULL,	ATA_HORKAGE_NO_ID_DEV_LOG },
> >>
> >> This flag only disables trying to access the identify device log page,
> >> it does *not* avoid access to the log directory log page in general. The
> >> log directory will still be consulted for other log pages beside the
> >> identify device log page, from any function that calls
> >> ata_log_supported() (e.g. ata_dev_config_ncq_send_recv() and
> >> ata_dev_config_ncq_non_data())
> > 
> > Non of those code paths are called for this device, probably due to some
> > other flag disqualifying them.
> >  
> >> So it will be a lot more solid to define a ATA_HORKAGE_NO_LOG_DIR flag
> >> and test for it in ata_log_supported(), completely preventing any access
> >> to the log directory page for this drive type.
> > 
> > That was my first thought but then I found ATA_HORKAGE_NO_ID_DEV_LOG
> > which was in the calling path that actually triggered this issue.
> > 
> > But, yes, I totally agree that's a more solid solution preventing this
> > kind of issue to crop up again.
> > 
> >>> +
> >>>  	/* End Marker */
> >>>  	{ }
> >>>  };
> >>
> >> Note: if you need this fix sent to linux-stable, add "Cc: stable@..."
> >> and a Fixes tag.
> > 
> > I'd think it's fitting to send it to linux-stable, because it prevents
> > those DOM's from working in v5.15.5+.
> > 
> > Ok. I must have missed that part when I read submitting-patches doc.
> > 
> > I'll rework and re-submit the patch.
> 
> I sent you a draft patch. Please try it.

Works like a charm.

> Also, to confirm if the log directory log page is indeed the page that locks up
> the drive, can you try this command:
> 
> sg_sat_read_gplog --dma --log=0 --page=0 --readonly

# sg_sat_read_gplog --dma --log=0 --page=0 --readonly /dev/sda
ATA PASS-THROUGH (16), bad field in cdb
sg_sat_read_gplog failed: Illegal request

> and
> 
> sg_sat_read_gplog --log=0 --page=0 --readonly

# sg_sat_read_gplog --log=0 --page=0 --readonly /dev/sda
 00     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 08     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 10     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 18     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 20     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 28     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 30     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 38     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 40     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 48     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 50     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 58     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 60     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 68     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 70     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 78     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 80     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 88     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 90     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 98     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 a0     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 a8     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 b0     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 b8     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 c0     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 c8     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 d0     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 d8     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 e0     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 e8     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 f0     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 
 f8     0000 0000 0000 0000 0000 0000 0000 0000     .. .. .. .. .. .. .. .. 

Mind you, this with a patched kernel, if that affects anything.
 
> Beware that if the log drectory is the problem, this will lockup your drive !
> If that is OK and works, then please try:
> 
> sg_sat_read_gplog --dma --log=48 --page=0 --readonly

# sg_sat_read_gplog --dma --log=48 --page=0 --readonly /dev/sda
ATA PASS-THROUGH (16), bad field in cdb
sg_sat_read_gplog failed: Illegal request

> and
> 
> sg_sat_read_gplog --log=48 --page=0 --readonly

sg_sat_read_gplog --log=48 --page=0 --readonly /dev/sda
ATA PASS-THROUGH (16), bad field in cdb
sg_sat_read_gplog failed: Illegal request
 
> log=48 (0x30) is the identify device log page. log=0 is the log directory log page.
 
So, does this means that it might be where in the init of the device the
directory log page is accessed that causes the device to fault?

A snippet from a failed boot before the patch looks like:
ata1.00: qc timeout (cmd 0x2f)
ata1.00: Read log 0x00 page 0x00 failed, Emask 0x4
ata1.00: ATA Identify Device Log not supported
ata1.00: failed to set xfermode (err_mask=0x40)
ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
ata1.00: failed to IDENTIFY (INIT_DEV_PARAMS failed, err_mask=0x80)
ata1.00: revalidation failed (errno=-5)
ata1: limiting SATA link speed to 3.0 Gbps
ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 320)
ata1.00: qc timeout (cmd 0x2f)
ata1.00: Read log 0x00 page 0x00 failed, Emask 0x4
ata1.00: ATA Identify Device Log not supported
ata1.00: failed to set xfermode (err_mask=0x40)
ata1.00: disabled
ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 320)


When I messed around trying to figure out what the fault was I saw a
couple of different Emask, 0x4, 0x40 and 0x80.

I also blindly played around with adding a ata_msleep(ap, 500); after
the failed attempt to access the log directory log page, but that didn't
help.

//Anton
