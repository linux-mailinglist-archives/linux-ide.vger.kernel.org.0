Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE1CE3C155
	for <lists+linux-ide@lfdr.de>; Tue, 11 Jun 2019 04:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390670AbfFKCqp (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 10 Jun 2019 22:46:45 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37479 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390461AbfFKCqo (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 10 Jun 2019 22:46:44 -0400
Received: by mail-qt1-f194.google.com with SMTP id y57so12833589qtk.4
        for <linux-ide@vger.kernel.org>; Mon, 10 Jun 2019 19:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0m35NGQgea2Dtho1tkMpAy982wOOgH1ICR+Vwx3GZeE=;
        b=B7mV3IItGXU3TGMF4QJRflUaAgL4S43JkzhIxxw0iqm4+OLzf9fKB8j2JP2dVCDPil
         sW384G7A11k2gPbEjKGTOv5X2Z3ryeV9M6ryiSLro3IxjT9OZyDo3pObjYM7A1rlex5o
         JM/lbTbVKx0jeE+Hz8BQ5+xUiAB+RIJKjWpmOGWMVU2PHOUFA3YILO2buWSMwliLUQET
         D1qvaiKdx5eSJQsH2Z8ksyja4hIH3EWjs1jAF4U61bv0JbaavY2pVTYjrZaqFU5vAwOY
         NK/8qG5MN2Gn1DUikSm2ti8MCRGEJwUYBqBSQCGhBK+/QkiLzAuqnJRCDVqUQDsWMwXP
         O3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0m35NGQgea2Dtho1tkMpAy982wOOgH1ICR+Vwx3GZeE=;
        b=UOwRhe1wNeEE63bHsIRFz49XY3KMDWV0ha0sszOMsGulEmePrw11fcndFBdk0KvkoA
         JqWA68FetvrRDpf9/TEbJpqVyY/+6F8m2INi+dtWSQSjkrOSz4xJhuWONHdVQo1LWq6f
         cXWJbwxD1zUGd1c7Ce5hE04Xb2a01hbQ0caC847zjJeAPoTVEakWamL7rfcXnecrfX7f
         YUvVKbFxLbihINksc0YH5vtFXLCp3Uz2MKQbqeLlcWA6xEHR1F2+fiz7oIFM1GivVrrw
         L27CHICPjvBRWBShxk1bvxiw7EC5RuYU+P8RVvaBEGJl0fXk+ov+rUbIMd2aTn1Nbag+
         bOjw==
X-Gm-Message-State: APjAAAWSrv3WVhcwCr18mKYby2ERkKB1jUJt+sUH8N1Iha4ov9SXQVvx
        jxSjfyEheetyMdo1puGs648T1JlNw04+1gMXNWHRoQ==
X-Google-Smtp-Source: APXvYqx/p8Wk437d+ei9zOMYRa2j+hTRwjg4+eaMD3R6/xZEyIIMKtLlMd2J9aaBFx62GGYjdo6hkJN+cGx/sK9kwI4=
X-Received: by 2002:ac8:2ec3:: with SMTP id i3mr17155681qta.110.1560221203710;
 Mon, 10 Jun 2019 19:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190610074456.2761-1-drake@endlessm.com> <CAOSXXT7OFzHeTxNqZ1sS6giRxhDcrUUnVjURWBiFUc5T_8p=MA@mail.gmail.com>
In-Reply-To: <CAOSXXT7OFzHeTxNqZ1sS6giRxhDcrUUnVjURWBiFUc5T_8p=MA@mail.gmail.com>
From:   Daniel Drake <drake@endlessm.com>
Date:   Tue, 11 Jun 2019 10:46:32 +0800
Message-ID: <CAD8Lp45djPU_Ur8uCO2Y5Sbek_5N9QKkxLXdKNVcvkr6rFPLUQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: Add Intel remapped NVMe device support
To:     Keith Busch <keith.busch@gmail.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, Jens Axboe <axboe@kernel.dk>,
        Keith Busch <kbusch@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux PCI <linux-pci@vger.kernel.org>,
        linux-ide@vger.kernel.org, Sagi Grimberg <sagi@grimberg.me>,
        linux-nvme <linux-nvme@lists.infradead.org>,
        Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Tue, Jun 11, 2019 at 12:00 AM Keith Busch <keith.busch@gmail.com> wrote:
>
> On Mon, Jun 10, 2019 at 1:45 AM Daniel Drake <drake@endlessm.com> wrote:
> > +       /* We don't support sharing MSI interrupts between these devices */
> > +       nrdev->bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
>
> And this is a problem, isn't it? Since we don't have an option to open
> the MSI implementation in RAID mode your experience will be much
> better to disable this mode when using Linux as per the current
> recommendation rather than limping along with legacy IRQ.

What's the specific problem that you see here? Is it that the
interrupt delivery mechanism is legacy wire instead of MSI, or is the
problem that the interrupt is shared over the whole set of storage
devices?

I installed Windows 10 on this product in RAID mode and it is using
the legacy interrupt too. Also, on Linux, MSI interrupts have already
been disabled on the AHCI part of such setups for a good while now:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f723fa4e69920f6a5dd5fa0d10ce90e2f14d189c

The earlier patches from Dan Williams also had the design of sharing
the legacy interrupt:
https://marc.info/?l=linux-ide&m=147709610621480&w=2

I think some kind of MSI support may be possible, perhaps something
similar to what is done by drivers/pci/controller/vmd.c, but it needs
a bit more thought, and I was hoping that we could get the base device
support in place before investigating MSI as a separate step. However,
if the concern you are raising is regarding the sharing of interrupts,
I think that cannot change because the NVMe devices PCI config space
is totally inaccessible when in this mode. That means there is no way
we can configure a per-device MSI message, so the interrupt will
continue to be shared regardless of delivery mechanism.

Thanks,
Daniel
