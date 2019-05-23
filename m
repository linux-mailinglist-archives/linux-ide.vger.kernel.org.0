Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E949C27962
	for <lists+linux-ide@lfdr.de>; Thu, 23 May 2019 11:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbfEWJgn (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 23 May 2019 05:36:43 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44414 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727434AbfEWJgn (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 23 May 2019 05:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=C9Fu8dUAF8smkFmbrTSjD2DqFNL9fQeYAFwJNoqCimY=; b=i42IvBJoHVjHYrfml/eNUNVwO
        CeRVwgK8RHiihNoboaZhaXM42a00fqvNxuM2xuXUd4MbVaSHJJruiAwnRSztz+TVHKGo44IhBubMC
        j73b87f0hkt3azyrtI7X0Oe1+rN7r3fDZ6g01xsFPkyXk3XWAjlS8fpF16HyjM2gFUSD2FmIFj+qQ
        HuC7Uzt+7FtFZThm8KmSeTVv9iDb4/yhbdZhzcYnd08JU7yxDBNFFoBKT8jkkF3KEGLOMXd2OZotp
        GO5rcFlh5d6TVF2SR6Mwin1fXYrqSUUw4GK2FlPmUF3Rgp8RMe8UXed6BOyP2RfkUDUJ/JMIqO2ko
        yDRM15DaA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hTk9B-0000my-7A; Thu, 23 May 2019 09:36:25 +0000
Date:   Thu, 23 May 2019 02:36:25 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jens Axboe <axboe@kernel.dk>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>, linux-ide@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 02/10] ata: ahci: Support per-port interrupts
Message-ID: <20190523093625.GA26136@infradead.org>
References: <20190521143023.31810-1-miquel.raynal@bootlin.com>
 <20190521143023.31810-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521143023.31810-3-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

> --- a/drivers/ata/acard-ahci.c
> +++ b/drivers/ata/acard-ahci.c
> @@ -434,7 +434,7 @@ static int acard_ahci_init_one(struct pci_dev *pdev, const struct pci_device_id
>  	if (!hpriv)
>  		return -ENOMEM;
>  
> -	hpriv->irq = pdev->irq;
> +	hpriv->irqs[0] = pdev->irq;
>  	hpriv->flags |= (unsigned long)pi.private_data;

Who allocates ->irqs for the non-ahci.c case?

> @@ -95,6 +96,14 @@ static void ahci_platform_disable_phys(struct ahci_host_priv *hpriv)
>  	}
>  }
>  
> +int ahci_get_per_port_irq_vector(struct ata_host *host, int port)
> +{
> +	struct ahci_host_priv *hpriv = host->private_data;
> +
> +	return hpriv->irqs[port];
> +}
> +EXPORT_SYMBOL_GPL(ahci_get_per_port_irq_vector);

This function seems a little misnamed.  The only multi-irq support in
the AHCI spec itself is PCIe MSI/MSI-X, which is not handled by this
function, but instead in the PCI layer using pci_irq_vector and the
ahci_get_irq_vector callback in ahci.c.

In fact it seems like this scheme particular to your device config,
why don't we just add a specific libahci-using subdriver for it?  That
would also get rid of the whole ->irq to ->irqs change.
