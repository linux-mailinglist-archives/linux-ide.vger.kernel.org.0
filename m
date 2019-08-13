Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 857968C411
	for <lists+linux-ide@lfdr.de>; Wed, 14 Aug 2019 00:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfHMWHa (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 13 Aug 2019 18:07:30 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45770 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfHMWH3 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 13 Aug 2019 18:07:29 -0400
Received: by mail-ot1-f66.google.com with SMTP id m24so24755392otp.12
        for <linux-ide@vger.kernel.org>; Tue, 13 Aug 2019 15:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d03nL8ERgbgYAWE4oae6TV+Y2qh8WtdG9cGr+aCg9ZQ=;
        b=vwIDTkS2RxXqreaUoIYOxGHoRq0ix6eOj5r7Iah+Cs0wFLgrEtI9Av42Og6E502jCD
         mWI6WKcNcPjhCDXBekDnayBLj57mPlJ3VMYbYmWAtQrNO2sc7va1RjAS98ITH7UWv6Tc
         uZIIq773vIQyH9pgOTlXJIt0lX6X4gHOEpMQzMaiXKWS2W14Ba7xhkRGNth/QaRE1pGj
         F5wyJTBLk/Wu5wcBfdpRT4k8JRw8KD8jgooKYYO99uRQjesRixfT317sNEjICySX8bcN
         DuheCGzynJSyRiqknxRLiqQgdaVhGf0DpTpGloW8bJNXGWzHo7cQKN1rniNIy7+4wJrE
         pMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d03nL8ERgbgYAWE4oae6TV+Y2qh8WtdG9cGr+aCg9ZQ=;
        b=bh/PnYe9mq7T484uenybK5WhukeN0Rp/F0l8MqX0PQMTVNqdKci+PTVSUffyjnyfAZ
         9MzbhrEIccsX/JIi54usofVomXo1laMqMPEGSFEG9HmxODQwpGKNdmnDjsZjwN/O1+/4
         DLPuI4pTfyE4kaEMrjVL5ktZxDtZ5eVJaspNgoxv72Z3aMk9IJDDSqjKR9n1suLvLi2D
         ilAFIK2nxs3U3tXSmxIMfKj924UNe6q4+rDZbhBVuovmWaveE7vHzDpHNuFm6Jz6Y5lH
         WnccjnxHfOtCG4V4Ao7quJ3CmyFsQ2fqSb0kSJYNUne7QMB24+2dgYCxI6SgakwntSes
         rI6g==
X-Gm-Message-State: APjAAAWyZhqu8JZFNF47qLehdKUjYbWvwlxVuxZrxDgfnc9mlnBNor0N
        PwItYNCDTTHX9DB3s56hQecxxhtc4tLuaoGqpNGtDg==
X-Google-Smtp-Source: APXvYqy3DxXsEW3npvG6mgihqbS7KjpppCn+StlyxBweAbJRDgFcRIGWBS4ex+T5tEtLiguZXcMGzdQOhWjmsA71r7o=
X-Received: by 2002:a9d:7a9a:: with SMTP id l26mr32328700otn.71.1565734048841;
 Tue, 13 Aug 2019 15:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190808202415.25166-1-stephend@silicom-usa.com>
 <20190810074317.GA18582@infradead.org> <abfa4b20-2916-d89a-f4d3-b27fca5906b2@silicom-usa.com>
 <CAPcyv4g+PdbisZd8=FpB5QiR_FCA2OQ9EqEF9yMAN=XWTYXY1Q@mail.gmail.com>
 <051cb164-19d5-9241-2941-0d866e565339@silicom-usa.com> <20190812180613.GA18377@infradead.org>
 <CAA9_cme3saBAJEyob3B1tX=t8keTodWJZMUd1j_v7vPMRU+aXA@mail.gmail.com> <20190813072954.GA23417@infradead.org>
In-Reply-To: <20190813072954.GA23417@infradead.org>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 13 Aug 2019 15:07:17 -0700
Message-ID: <CAPcyv4h5kCKVyCjomBUY27MJwheDZ8v87+a9K-2YCgyqRWR7eQ@mail.gmail.com>
Subject: Re: [PATCH] ata: ahci: Lookup PCS register offset based on PCI device ID
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Stephen Douthit <stephend@silicom-usa.com>,
        Jens Axboe <axboe@kernel.dk>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Tue, Aug 13, 2019 at 12:31 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Aug 12, 2019 at 12:31:35PM -0700, Dan Williams wrote:
> > It seems platforms / controllers that fail to run the option-rom
> > should be quirked by device-id, but the PCS register twiddling be
> > removed for everyone else. "Card BIOS" to me implies devices with an
> > Option-ROM BAR which I don't think modern devices have, so that might
> > be a simple way to try to phase out this quirk going forward without
> > regressing working setups that might be relying on this.
> >
> > Then again the driver is already depending on the number of enabled
> > ports to be reliable before PCS is written, and the current driver
> > does not attempt to enable ports that were not enabled previously.
> > That tells me that if the PCS quirk ever mattered it would have
> > already regressed when the driver switched from blindly writing 0xf to
> > only setting the bits that were already set in ->port_map.
>
> But how do we find that out?

We can layer another assumption on top of Tejun's assumptions from
commit 49f290903935 "ahci: update PCS programming". The kernel
community has not received any regression reports from that change
which says:

"
    port_map is determined from PORTS_IMPL PCI register which is
    implemented as write or write-once register.  If the register isn't
    programmed, ahci automatically generates it from number of ports,
    which is good enough for PCS programming.  ICH6/7M are probably the
    only ones where non-contiguous enable bits are necessary && PORTS_IMPL
    isn't programmed properly but they're proven to work reliably with 0xf
    anyway.
"

So the potential options I see are:

1/ Keep the current scheme, but limit it to cases where PORTS_IMPL is
less than 8 and assume this need to set the bits is unnecessary legacy
to carry forward

2/ Option1 + additionally use PORTS_IMPL as a gate to guess when the
PCS format might be different for values >= 8.

I think the driver does not need to consider Option2 unless / until it
encounters a platform where firmware does not "do the right thing",
and given Denverton has been in the wild with the wrong PCS twiddling
it seems to suggest nothing needs to be done there.

> A compromise to me seems that we just do the PCS quirk for all Intel
> devices explicitly listed in the PCI Ids based on new board_* values
> as long as they have the old PCS location, and assume anything new
> enough to have the new location won't need to quirk, given that it
> never properly worked.  This might miss some intel devices that were
> supported with the class based catchall, though.

I'd be more comfortable with PORT_IMPL as the deciding factor.
