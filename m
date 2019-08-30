Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B09A0A3B2D
	for <lists+linux-ide@lfdr.de>; Fri, 30 Aug 2019 18:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728240AbfH3QBD (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 30 Aug 2019 12:01:03 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38960 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbfH3QBD (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 30 Aug 2019 12:01:03 -0400
Received: by mail-ot1-f68.google.com with SMTP id b1so7379638otp.6
        for <linux-ide@vger.kernel.org>; Fri, 30 Aug 2019 09:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ySfHoB8l/xyw8qkOA35nwr7iHxPZP1YOxL7hVP9E3h4=;
        b=1L+6bgkshAql1vjG+F+Qinh4kK7fAjxpP05HH8wUoQj50+FjvvLvLw2lUiddjp4fCD
         noU3eenfi5DgIeiNL9zxQqZeDXFSMyZ3qHwRG3NQkjzUooWqvHEKlpZlSLBCF3794JMk
         fnmYt7eukhwAVo+a6mQkArQsFL9ZhzgsPsi4npqNWXbsgRK6JqtMR+iVIP0MMU1NC1rR
         FLVKCFrATvforvUK0oSB3NTRZUCVlC+HGnp7P8j6iaU/8EfaVARXv80wrGl9MsrQrTVF
         UUTOaKMZnD6L41iWBj3RS2hrOARNoTFdqEwqw6gai0kO5CO64Wyc71BoGnXINKP9kx9/
         /lVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ySfHoB8l/xyw8qkOA35nwr7iHxPZP1YOxL7hVP9E3h4=;
        b=Ib0oyQSZPv4sRD9uprnU8wMKXnVcz+P3cSM6YH738/9iv8J0OJQPA17q5Tj5nOsO7e
         mnHhhR7CvLim+cup6DAPZAgeGJc/dgHsmiB/0viS+byPIcZNy1dASynujbCg3TvSAysn
         szFglgKA+06lA4Lunua3mVxYmcy2wb3eOLEDgShefvyC64oEf6cI3xphI4KD/CE5C+pz
         dP0FW9iGLq1MxgRSLnTLK05jfNnD/vZ7GzryKTM85MyW9RfZaaAYa3zIO1fH2kSI4Mqx
         VfVT2gBoMV/2/xsJaVPWtD2OlKZTrMgajITM5t6EQtkizC7x1aUkM5LQ7yaMppwipKEW
         vnjQ==
X-Gm-Message-State: APjAAAXZG0oHkzoiJIOno8NQZv+OXRB6kD/W1Yk6wmaNnLCU3B8vA8F8
        y8NorjP3vmV2uRynt18AbCDXU4e5BnXqhnS7jb4ou0YIEt8=
X-Google-Smtp-Source: APXvYqyipA8UNkC9jFwZFjWhmNOU4RjajQwMFnKJMHl6vT1i7F+SkTBCCB9CI5CTCSa+8tEnJCkS/xbKemvtfvD0nNs=
X-Received: by 2002:a05:6830:458:: with SMTP id d24mr12543472otc.126.1567180861989;
 Fri, 30 Aug 2019 09:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <156712139395.1614755.3489977733530873708.stgit@dwillia2-desk3.amr.corp.intel.com>
 <63de1aac-ff06-729e-0db4-bc1a8a799dc0@silicom-usa.com>
In-Reply-To: <63de1aac-ff06-729e-0db4-bc1a8a799dc0@silicom-usa.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 30 Aug 2019 09:00:50 -0700
Message-ID: <CAPcyv4h2tNRC0w1mKjnt6tuZrUcUTh+y1YCeQKTb+b8HftEWZg@mail.gmail.com>
Subject: Re: [PATCH v3] libata/ahci: Drop PCS quirk for Denverton and beyond
To:     Stephen Douthit <stephend@silicom-usa.com>
Cc:     "axboe@kernel.dk" <axboe@kernel.dk>,
        Christoph Hellwig <hch@infradead.org>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Fri, Aug 30, 2019 at 8:47 AM Stephen Douthit
<stephend@silicom-usa.com> wrote:
>
> On 8/29/19 7:30 PM, Dan Williams wrote:
> > The Linux ahci driver has historically implemented a configuration fixup
> > for platforms / platform-firmware that fails to enable the ports prior
> > to OS hand-off at boot. The fixup was originally implemented way back
> > before ahci moved from drivers/scsi/ to drivers/ata/, and was updated in
> > 2007 via commit 49f290903935 "ahci: update PCS programming". The quirk
> > sets a port-enable bitmap in the PCS register at offset 0x92.
> >
> > This quirk could be applied generically up until the arrival of the
> > Denverton (DNV) platform. The DNV AHCI controller architecture supports
> > more than 6 ports and along with that the PCS register location and
> > format were updated to allow for more possible ports in the bitmap. DNV
> > AHCI expands the register to 32-bits and moves it to offset 0x94.
> >
> > As it stands there are no known problem reports with existing Linux
> > trying to set bits at offset 0x92 which indicates that the quirk is not
> > applicable. Likely it is not applicable on a wider range of platforms,
> > but it is difficult to discern which platforms if any still depend on
> > the quirk.
> >
> > Rather than try to fix the PCS quirk to consider the DNV register layout
> > instead require explicit opt-in. The assumption is that the OS driver
> > need not touch this register, and platforms can be added with a new
> > boad_ahci_pcs7 board-id when / if problematic platforms are found in the
> > future. The logic in ahci_intel_pcs_quirk() looks for all Intel AHCI
> > instances with "legacy" board-ids and otherwise skips the quirk if the
> > board was matched by class-code.
> >
> > Reported-by: Stephen Douthit <stephend@silicom-usa.com>
> > Cc: Christoph Hellwig <hch@infradead.org>
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > ---
> > Changes since v2:
> > - Use board_ahci_pcs7 to opt Denverton out of the PCS quirk.
> >
> >   drivers/ata/ahci.c |  116 +++++++++++++++++++++++++++++++---------------------
> >   drivers/ata/ahci.h |    2 +
> >   2 files changed, 71 insertions(+), 47 deletions(-)
> >
> > diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
> > index f7652baa6337..3e63294304c7 100644
> > --- a/drivers/ata/ahci.c
> > +++ b/drivers/ata/ahci.c
> > @@ -65,6 +65,12 @@ enum board_ids {
> >       board_ahci_sb700,       /* for SB700 and SB800 */
> >       board_ahci_vt8251,
> >
> > +     /*
> > +      * board IDs for Intel chipsets that support more than 6 ports
> > +      * *and* end up needing the PCS quirk.
> > +      */
> > +     board_ahci_pcs7,
> > +
> >       /* aliases */
> >       board_ahci_mcp_linux    = board_ahci_mcp65,
> >       board_ahci_mcp67        = board_ahci_mcp65,
> > @@ -220,6 +226,12 @@ static const struct ata_port_info ahci_port_info[] = {
> >               .udma_mask      = ATA_UDMA6,
> >               .port_ops       = &ahci_vt8251_ops,
> >       },
> > +     [board_ahci_pcs7] = {
> > +             .flags          = AHCI_FLAG_COMMON,
> > +             .pio_mask       = ATA_PIO4,
> > +             .udma_mask      = ATA_UDMA6,
> > +             .port_ops       = &ahci_ops,
> > +     },
> >   };
> >
> >   static const struct pci_device_id ahci_pci_tbl[] = {
> > @@ -264,26 +276,26 @@ static const struct pci_device_id ahci_pci_tbl[] = {
> >       { PCI_VDEVICE(INTEL, 0x3b2b), board_ahci }, /* PCH RAID */
> >       { PCI_VDEVICE(INTEL, 0x3b2c), board_ahci_mobile }, /* PCH M RAID */
> >       { PCI_VDEVICE(INTEL, 0x3b2f), board_ahci }, /* PCH AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19b0), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19b1), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19b2), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19b3), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19b4), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19b5), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19b6), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19b7), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19bE), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19bF), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19c0), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19c1), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19c2), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19c3), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19c4), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19c5), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19c6), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19c7), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19cE), board_ahci }, /* DNV AHCI */
> > -     { PCI_VDEVICE(INTEL, 0x19cF), board_ahci }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19b0), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19b1), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19b2), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19b3), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19b4), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19b5), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19b6), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19b7), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19bE), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19bF), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19c0), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19c1), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19c2), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19c3), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19c4), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19c5), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19c6), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19c7), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19cE), board_ahci_pcs7 }, /* DNV AHCI */
> > +     { PCI_VDEVICE(INTEL, 0x19cF), board_ahci_pcs7 }, /* DNV AHCI */
>
> I think you want to invert this scheme and mark the old controllers as
> board_ahci_pcs6 and leave Denverton/newer controllers as board_ahci.
>
> Otherwise the quirk below runs for any Intel controllers that matched
> based on the AHCI class code, since their board_id will be board_ahci
> which is < board_ahci_pcs7.

It shouldn't apply for the class code because the id->vendor in that
case will be PCI_ANY_ID not PCI_VENDOR_ID_INTEL.
