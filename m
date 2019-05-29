Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24C402DA03
	for <lists+linux-ide@lfdr.de>; Wed, 29 May 2019 12:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbfE2KIo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ide@lfdr.de>); Wed, 29 May 2019 06:08:44 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:54071 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfE2KIn (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 29 May 2019 06:08:43 -0400
X-Originating-IP: 90.88.147.134
Received: from xps13 (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4702EC0004;
        Wed, 29 May 2019 10:08:35 +0000 (UTC)
Date:   Wed, 29 May 2019 12:08:33 +0200
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
Message-ID: <20190529120833.29334c70@xps13>
In-Reply-To: <53ce8c5b-46fc-c969-5168-18e4bcc62cde@arm.com>
References: <20190521143023.31810-1-miquel.raynal@bootlin.com>
        <20190521143023.31810-2-miquel.raynal@bootlin.com>
        <CAHG4imNxsdzjzRpFWnL+PuznjdOU4hsp2E-g1bt4WVJeokfT3w@mail.gmail.com>
        <53ce8c5b-46fc-c969-5168-18e4bcc62cde@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi Marc & Raymond,

Marc Zyngier <marc.zyngier@arm.com> wrote on Thu, 23 May 2019 10:26:01
+0100:

> On 23/05/2019 04:11, raymond pang wrote:
> > Hi Miquel,
> > 
> > This patch adds clearing GHC.IS into hot path, could you explain how
> > irq storm is generated? thanks
> > According to AHCI Spec, HBA should not refer to GHC.IS to generate
> > MSI when applying multiple MSIs.  
> 
> Well spotted.
> 
> I have the ugly feeling that this is because the Marvell AHCI
> implementation is not using MSIs at all, but instead a pair of wired
> interrupts (which are level triggered instead of edge, hence the
> screaming interrupts).
> 
> The changes in the following patches abuse the rest of the driver by
> pretending this is a a multi-MSI setup, while it clearly doesn't match
> the expectation of the AHCI spec for MSIs.
> 
> It looks like this shouldn't be imposed on other unsuspecting
> implementations which correctly use edge-triggered MSIs and do not
> require such an MMIO access.

I understand your concern, let me add a AHCI_HFLAG_LEVEL_MSI in
hpriv->flags which will be used by the mvebu_ahci.c driver to request
for this MMIO access. This way, the hot path remains the same.


Thanks,
Miquèl
