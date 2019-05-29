Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4E4F2DA0D
	for <lists+linux-ide@lfdr.de>; Wed, 29 May 2019 12:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbfE2KKs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ide@lfdr.de>); Wed, 29 May 2019 06:10:48 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:59797 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfE2KKs (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 29 May 2019 06:10:48 -0400
X-Originating-IP: 90.88.147.134
Received: from xps13 (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 59808E0011;
        Wed, 29 May 2019 10:10:34 +0000 (UTC)
Date:   Wed, 29 May 2019 12:10:33 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Marc Zyngier <marc.zyngier@arm.com>
Cc:     Gregory Clement <gregory.clement@bootlin.com>,
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
Subject: Re: [PATCH v4 08/10] ata: ahci: mvebu: Add support for A8k legacy
 DT bindings
Message-ID: <20190529121033.04748037@xps13>
In-Reply-To: <04cd3174-6857-4552-293d-5f25caa189a7@arm.com>
References: <20190521143023.31810-1-miquel.raynal@bootlin.com>
        <20190521143023.31810-9-miquel.raynal@bootlin.com>
        <04cd3174-6857-4552-293d-5f25caa189a7@arm.com>
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

Marc Zyngier <marc.zyngier@arm.com> wrote on Tue, 21 May 2019 16:46:01
+0100:

> On 21/05/2019 15:30, Miquel Raynal wrote:
> > The CP110 SATA unit has 2 ports, and a dedicated ICU entry per
> > port. In the past, the AHCI SATA driver only supported one interrupt
> > per SATA unit. To solve this conflict, the 2 SATA wired interrupts in
> > the South-Bridge got configured as 1 GIC interrupt in the
> > North-Bridge, regardless of the number of SATA ports actually
> > enabled/in use, and the DT bindings only referenced the interrupt of
> > one port.
> > 
> > Since then, this limitation has been addressed and this patch ensures
> > backward compatibility with old DTs not describing SATA ports
> > correctly directly from the AHCI MVEBU driver. This way, we will be
> > able to drop the hack from the ICU driver. IOW, when the A8k
> > compatible string is used and there is no sub-nodes in the DT, we
> > fake the creation and mapping of the second (missing) interrupt.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/ata/ahci_mvebu.c       | 29 ++++++++++++++++++++++++++++-
> >  drivers/ata/libahci_platform.c |  3 +++
> >  include/linux/ahci_platform.h  |  1 +
> >  3 files changed, 32 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/ata/ahci_mvebu.c b/drivers/ata/ahci_mvebu.c
> > index 8671aa8179fa..8c981b8d6e4d 100644
> > --- a/drivers/ata/ahci_mvebu.c
> > +++ b/drivers/ata/ahci_mvebu.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/mbus.h>
> >  #include <linux/module.h>
> >  #include <linux/of_device.h>
> > +#include <linux/of_irq.h>
> >  #include <linux/platform_device.h>
> >  #include "ahci.h"
> >  
> > @@ -28,9 +29,13 @@
> >  #define AHCI_WINDOW_BASE(win)	(0x64 + ((win) << 4))
> >  #define AHCI_WINDOW_SIZE(win)	(0x68 + ((win) << 4))
> >  
> > +#define ICU_SATA0_ICU_ID 109
> > +#define ICU_SATA1_ICU_ID 107
> > +
> >  struct ahci_mvebu_plat_data {
> >  	int (*plat_config)(struct ahci_host_priv *hpriv, struct device *dev);
> >  	unsigned int host_flags;
> > +	unsigned int resource_flags;
> >  };
> >  
> >  static void ahci_mvebu_mbus_config(struct ahci_host_priv *hpriv,
> > @@ -101,6 +106,27 @@ static int ahci_mvebu_armada_3700_config(struct ahci_host_priv *hpriv,
> >  static int ahci_mvebu_armada_8k_config(struct ahci_host_priv *hpriv,
> >  				       struct device *dev)
> >  {
> > +	struct device_node *np = of_irq_find_parent(dev->of_node);
> > +	struct irq_data *irqd = irq_get_irq_data(hpriv->irqs[0]);
> > +	int host_irq = irqd ? irqd_to_hwirq(irqd) : 0;
> > +	int missing_irq = (host_irq == ICU_SATA1_ICU_ID) ?
> > +		ICU_SATA0_ICU_ID : ICU_SATA1_ICU_ID;
> > +	struct irq_fwspec fwspec = {
> > +		.fwnode = of_node_to_fwnode(np),
> > +		.param_count = 2,
> > +		.param = {missing_irq, IRQ_TYPE_LEVEL_HIGH},
> > +	};
> > +
> > +	if (of_get_child_count(dev->of_node))
> > +		return 0;
> > +
> > +	hpriv->irqs[1] = irq_create_fwspec_mapping(&fwspec);
> > +	if (hpriv->irqs[1]) {
> > +		hpriv->flags |= AHCI_HFLAG_MULTI_MSI;
> > +		hpriv->get_irq_vector = ahci_get_per_port_irq_vector;
> > +		hpriv->mask_port_map = GENMASK(1, 0);
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > @@ -200,7 +226,7 @@ static int ahci_mvebu_probe(struct platform_device *pdev)
> >  	if (!pdata)
> >  		return -EINVAL;
> >  
> > -	hpriv = ahci_platform_get_resources(pdev, 0);
> > +	hpriv = ahci_platform_get_resources(pdev, pdata->resource_flags);  
> 
> This seems to be the only use of resource_flags in the whole series. Why
> can't you just pass AHCI_PLATFORM_A8K_QUIRK as a parameter and not
> allocate an extra field in the platform data structure?

Because this driver supports 3 different compatibles and the a8k
compatible is the only one needing this flag. Another solution would
be to declare on the stack a 'resource_flags' variable and set it to
AHCI_PLATFORM_A8K_QUIRK only when using the right compatible. I
suppose in this case, using an entry of a platform data structure is
the way to go (cleaner, more readable, at the cost of an extra 4
bytes). Unless you insist on this point I will keep this organization.

> 
> >  	if (IS_ERR(hpriv))
> >  		return PTR_ERR(hpriv);
> >  
> > @@ -240,6 +266,7 @@ static const struct ahci_mvebu_plat_data ahci_mvebu_armada_3700_plat_data = {
> >  
> >  static const struct ahci_mvebu_plat_data ahci_mvebu_armada_8k_plat_data = {
> >  	.plat_config = ahci_mvebu_armada_8k_config,
> > +	.resource_flags = AHCI_PLATFORM_A8K_QUIRK,
> >  };
> >  
> >  static const struct of_device_id ahci_mvebu_of_match[] = {
> > diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platform.c
> > index 347ff14aedd2..620e5f27fdd7 100644
> > --- a/drivers/ata/libahci_platform.c
> > +++ b/drivers/ata/libahci_platform.c
> > @@ -484,6 +484,9 @@ struct ahci_host_priv *ahci_platform_get_resources(struct platform_device *pdev,
> >  	if (!child_nodes)
> >  		hpriv->nports = 1;
> >  
> > +	if (!child_nodes && flags & AHCI_PLATFORM_A8K_QUIRK)  
> 
> Consider using braces around the bitwise operators.

Sure!

> 
> > +		hpriv->nports = 2;
> > +
> >  	hpriv->phys = devm_kcalloc(dev, hpriv->nports, sizeof(*hpriv->phys), GFP_KERNEL);
> >  	if (!hpriv->phys) {
> >  		rc = -ENOMEM;
> > diff --git a/include/linux/ahci_platform.h b/include/linux/ahci_platform.h
> > index eaedca5fe6fc..57465ba6bb15 100644
> > --- a/include/linux/ahci_platform.h
> > +++ b/include/linux/ahci_platform.h
> > @@ -44,5 +44,6 @@ int ahci_platform_suspend(struct device *dev);
> >  int ahci_platform_resume(struct device *dev);
> >  
> >  #define AHCI_PLATFORM_GET_RESETS	0x01
> > +#define AHCI_PLATFORM_A8K_QUIRK		0x02
> >  
> >  #endif /* _AHCI_PLATFORM_H */
> >   
> 
> Thanks,
> 
> 	M.


Thanks,
Miquèl
