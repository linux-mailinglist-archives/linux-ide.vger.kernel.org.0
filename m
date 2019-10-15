Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22A47D822A
	for <lists+linux-ide@lfdr.de>; Tue, 15 Oct 2019 23:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728607AbfJOV0m (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 15 Oct 2019 17:26:42 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37663 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728282AbfJOV0m (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 15 Oct 2019 17:26:42 -0400
Received: by mail-oi1-f194.google.com with SMTP id i16so18191969oie.4
        for <linux-ide@vger.kernel.org>; Tue, 15 Oct 2019 14:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FjTzov0ZWMBRnnkfLydTowwTTWaZQQMz8GLbYd2DoJY=;
        b=sseX6QWUP9CFA63813y5OMpaVx25163OITn2IzLP24ux6NTGMBFIsckkEKwagWvAJq
         9yXBTSntSikoMBdORY8eLAPlVHulfEOthNtwXgw3Sxy1X0v3CvRKlAM22m0WLC13KAQp
         tg6hf/IYvnxhoNNhrcZUre5exfMwHVc6OOcnJDanCqFhPXEtxsOU7604QOyRVekBGf/Q
         9oSMyaDTlrnjKheT8DHhUuWZEeR6Oy7YrH0suqKEP5N4kQAF/FgyjxnX/IZEYuMutYqA
         9mlugtK7Tvhu+3kjPcR3vG4lbWby8JiJigfNzpb6QFeE7MNKOctL3kyENkpQV1UpzU3Z
         sZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FjTzov0ZWMBRnnkfLydTowwTTWaZQQMz8GLbYd2DoJY=;
        b=BWK+u6NxXvdfQkKjG75Q7A8CCtclK0bLNo6a/RNjcPc77YqdszbiSi2d02MQ5blBAf
         XiGitJp645N7MhK7TODPs2FOxrGIK2wA5KkkEtM5ustgzyH3WG7WhWWbSbofztjXQQxQ
         6bB19S/XRKpy39G4iZVuZx7j+0kBqEsn5AMGjOsLvua8xNFTCyInK1hcW962U6YZMasf
         pjXZDcKbsqRmnR0h/qhwq9Yus4ynBdTsGS/tsi+lqy7fXRjuIKwZ9ZMEPOt9WRDfTiuR
         jp9/Wbrw/daLFzViJwYwcAxsInH1GCAt0/MDddIrBU7OPrtt2YUZWt1Ab0u9voFVlCR0
         R13g==
X-Gm-Message-State: APjAAAXm+FwNLkvOeblnD0uP0YrVhHU5GXF71Wekiiqh+ySx9qCBiSwT
        sPOSKtM+2nyMWVt98vhRQJH8JjXOheonl2pGPYEjCA==
X-Google-Smtp-Source: APXvYqziwX4Qd/CruVwbh4d+LgL43yQ6WwVxz8RVdhbf141kc/6k1rSNikV7EoWIivQB8kktrbIH2SlneWo8tRyAGPA=
X-Received: by 2002:a05:6808:7cd:: with SMTP id f13mr551315oij.70.1571174801334;
 Tue, 15 Oct 2019 14:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <157116925749.1211205.12806062056189943042.stgit@dwillia2-desk3.amr.corp.intel.com>
 <e4544252-d2d7-e464-94d6-4df7cda0e248@silicom-usa.com>
In-Reply-To: <e4544252-d2d7-e464-94d6-4df7cda0e248@silicom-usa.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 15 Oct 2019 14:26:29 -0700
Message-ID: <CAPcyv4iRFZ3AZ6WOduDPxBu2sNUY3AJLO-81sWhkDityoeQAiw@mail.gmail.com>
Subject: Re: [PATCH] libata/ahci: Fix PCS quirk application
To:     Stephen Douthit <stephend@silicom-usa.com>
Cc:     "axboe@kernel.dk" <axboe@kernel.dk>,
        Andreas Friedrich <afrie@gmx.net>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Tue, Oct 15, 2019 at 2:02 PM Stephen Douthit
<stephend@silicom-usa.com> wrote:
>
> On 10/15/19 3:54 PM, Dan Williams wrote:
> > Commit c312ef176399 "libata/ahci: Drop PCS quirk for Denverton and
> > beyond" got the polarity wrong on the check for which board-ids should
> > have the quirk applied. The board type board_ahci_pcs7 is defined at the
> > end of the list such that "pcs7" boards can be special cased in the
> > future if they need the quirk. All prior Intel board ids "<
> > board_ahci_pcs7" should proceed with applying the quirk.
> >
> > Reported-by: Andreas Friedrich <afrie@gmx.net>
> > Reported-by: Stephen Douthit <stephend@silicom-usa.com>
> > Fixes: c312ef176399 ("libata/ahci: Drop PCS quirk for Denverton and beyond")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > ---
> >   drivers/ata/ahci.c |    4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
> > index dd92faf197d5..05c2b32dcc4d 100644
> > --- a/drivers/ata/ahci.c
> > +++ b/drivers/ata/ahci.c
> > @@ -1600,7 +1600,9 @@ static void ahci_intel_pcs_quirk(struct pci_dev *pdev, struct ahci_host_priv *hp
> >        */
> >       if (!id || id->vendor != PCI_VENDOR_ID_INTEL)
> >               return;
>
> Unless I'm missing something this will short-circuit if there are any
> older Intel controllers not explicitly listed with a PCI_VDEVICE entry
> in ahci_pci_tbl.  Those will match on:
>
>         /* Generic, PCI class code for AHCI */
>         { PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
>           PCI_CLASS_STORAGE_SATA_AHCI, 0xffffff, board_ahci },

You're not missing anything, but I think we should stick with explicit
mapping as only newer controllers tend to match on class id rather
than pci-id, and there's no way to know if that class-id match is for
PCS_6 or PCS_7. Hopefully newer controllers are tested with Linux and
the BIOS fixed prior to the breakage leaking into the wild.
