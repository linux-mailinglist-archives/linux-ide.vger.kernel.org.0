Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDFBD2DC81
	for <lists+linux-ide@lfdr.de>; Wed, 29 May 2019 14:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfE2MOQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ide@lfdr.de>); Wed, 29 May 2019 08:14:16 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:54103 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbfE2MOQ (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 29 May 2019 08:14:16 -0400
Received: from xps13 (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 83FC020000B;
        Wed, 29 May 2019 12:13:57 +0000 (UTC)
Date:   Wed, 29 May 2019 14:13:56 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Marc Zyngier <marc.zyngier@arm.com>
Cc:     raymond pang <raymondpangxd@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jens Axboe <axboe@kernel.dk>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-ide@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v4 01/10] ata: libahci: Ensure the host interrupt status
 bits are cleared
Message-ID: <20190529141356.1d9f03f3@xps13>
In-Reply-To: <409ea2c5-c31a-fb6a-22c6-98b45e767809@arm.com>
References: <20190521143023.31810-1-miquel.raynal@bootlin.com>
        <20190521143023.31810-2-miquel.raynal@bootlin.com>
        <CAHG4imNxsdzjzRpFWnL+PuznjdOU4hsp2E-g1bt4WVJeokfT3w@mail.gmail.com>
        <53ce8c5b-46fc-c969-5168-18e4bcc62cde@arm.com>
        <20190529120833.29334c70@xps13>
        <409ea2c5-c31a-fb6a-22c6-98b45e767809@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi Marc,

Marc Zyngier <marc.zyngier@arm.com> wrote on Wed, 29 May 2019 11:37:58
+0100:

> On 29/05/2019 11:08, Miquel Raynal wrote:
> > Hi Marc & Raymond,
> > 
> > Marc Zyngier <marc.zyngier@arm.com> wrote on Thu, 23 May 2019 10:26:01
> > +0100:
> >   
> >> On 23/05/2019 04:11, raymond pang wrote:  
> >>> Hi Miquel,
> >>>
> >>> This patch adds clearing GHC.IS into hot path, could you explain how
> >>> irq storm is generated? thanks
> >>> According to AHCI Spec, HBA should not refer to GHC.IS to generate
> >>> MSI when applying multiple MSIs.    
> >>
> >> Well spotted.
> >>
> >> I have the ugly feeling that this is because the Marvell AHCI
> >> implementation is not using MSIs at all, but instead a pair of wired
> >> interrupts (which are level triggered instead of edge, hence the
> >> screaming interrupts).
> >>
> >> The changes in the following patches abuse the rest of the driver by
> >> pretending this is a a multi-MSI setup, while it clearly doesn't match
> >> the expectation of the AHCI spec for MSIs.
> >>
> >> It looks like this shouldn't be imposed on other unsuspecting
> >> implementations which correctly use edge-triggered MSIs and do not
> >> require such an MMIO access.  
> > 
> > I understand your concern, let me add a AHCI_HFLAG_LEVEL_MSI in
> > hpriv->flags which will be used by the mvebu_ahci.c driver to request
> > for this MMIO access. This way, the hot path remains the same.  
> 
> I'm not convinced that's a good idea, if only because from the PoV of
> the AHCI device itself, these are not MSIs at all, but wired interrupts.
> The fact that there is some glue logic in the middle that turns it into
> a message (and then back into a wire) is a regrettable implementation
> detail.
> 
> I'd rather you stick to the normal interrupt handler, or provide your
> own, which would solve most problems.

Unless I don't understand your proposal, "stick to the normal interrupt
handler" is not possible as I need this register write to happen at
this time, not at any other moment.

However, on the possibility of having a separate interrupt handler, I
may use the new AHCI_HFALG_LEVEL_MSI flag to change the
devm_request_irq call here [1] and use my own at this moment. The
handler will be in libahci.c though.

Would this be a better approach?


Thanks,
Miquèl

[1] https://elixir.bootlin.com/linux/v5.2-rc2/source/drivers/ata/libahci.c#L2557
