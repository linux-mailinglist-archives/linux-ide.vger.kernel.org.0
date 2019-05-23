Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 742EF274B0
	for <lists+linux-ide@lfdr.de>; Thu, 23 May 2019 05:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729588AbfEWDL4 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 22 May 2019 23:11:56 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:38031 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727305AbfEWDL4 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 22 May 2019 23:11:56 -0400
Received: by mail-io1-f68.google.com with SMTP id x24so3653932ion.5;
        Wed, 22 May 2019 20:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZEV/rTrYbrsm5G11OPGYPy+mSyQ1OAcKoS1nv9PMwiw=;
        b=PhQ/JgIq+OwtWsNg5SbJ4x/PiyBr6WlunoBwPdvzxLn7xURhq1waFX3FO9BNznU0yF
         5gWON3W07d9wI8HxMMUR20iyPJVSrjzksTMklWxtZJ8yw+PLfRTFacg718R9iU/DWYz1
         4s+2A/oxe/Xry4dzTVf8Jf70ezzDsTo/qiEPVX+5tQRy9L66f9t6grU3slZSoTWIx9MX
         iALhAemAkXsjYteAirHmBQouEx3EJFRXVhGmre9RgpkEl0ayNKrVqhNJLCNQz2pLoIg0
         aKaVTwzzouhOqvJCaMT3UkdrunAkQ6XwjsOIccx6VKi7yrymRxjt94ljsC5OrOqz0/y5
         YL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZEV/rTrYbrsm5G11OPGYPy+mSyQ1OAcKoS1nv9PMwiw=;
        b=pr9yf9D9kuRsgok35ZqS0zbv+mSH/n/KrxygChGCeQtDGmRP2xpXWgwWZArZr8Rgyq
         GWpI8kRuVn32dTq0xgO/fRpEInmDp3u2gi9IOIdu9vWc6aGq+v5kB++78qJRVnoxDhXX
         J7BtHjj0hvXgZaab3xfntZ/ASQKRq/1Rz0Jr5H5Nnkc5MsZIHY3EVUL95vfwIDubCjCS
         pDD4ANdCKvBIzrHpuDUTnF74A5DHVhqha/2fdH0qtEXK6oyLthWGLi4sjvExMNFefYhz
         poiw+uzX7hw0TybDOlCLzFoPc+pUinpKDqFbSgBKUM4WtiJhJutZ6vGi1IDiuTXJXfJ6
         5OzA==
X-Gm-Message-State: APjAAAXfuONVivuVdJaynafT6iUtBd6iQfAxfxkcor/xY/bThW+ZZeYt
        HkxA7m2PZ3klMjus9CNCiyc+kVGErPorkoLAUA8=
X-Google-Smtp-Source: APXvYqxkuUWfAecH5Z0mRMgmV18FKAsua/f2L/m4KWR9mlqpOwgbk8mioIOnqOqI+kmvlajTHdDKMeATOVYcte06abU=
X-Received: by 2002:a6b:d81a:: with SMTP id y26mr55542520iob.122.1558581115261;
 Wed, 22 May 2019 20:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190521143023.31810-1-miquel.raynal@bootlin.com> <20190521143023.31810-2-miquel.raynal@bootlin.com>
In-Reply-To: <20190521143023.31810-2-miquel.raynal@bootlin.com>
From:   raymond pang <raymondpangxd@gmail.com>
Date:   Thu, 23 May 2019 03:11:39 +0000
Message-ID: <CAHG4imNxsdzjzRpFWnL+PuznjdOU4hsp2E-g1bt4WVJeokfT3w@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] ata: libahci: Ensure the host interrupt status
 bits are cleared
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
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-ide@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi Miquel,

This patch adds clearing GHC.IS into hot path, could you explain how
irq storm is generated? thanks
According to AHCI Spec, HBA should not refer to GHC.IS to generate
MSI when applying multiple MSIs.

Best Regards,
Raymond

On Tue, May 21, 2019 at 2:31 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> ahci_multi_irqs_intr_hard() is going to be used as interrupt handler
> to support SATA per-port interrupts. The current logic is to check and
> clear the SATA port interrupt status register only. To avoid spurious
> IRQs and interrupt storms, it will be needed to clear the port
> interrupt bit in the host interrupt status register as well.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/ata/libahci.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
> index 692782dddc0f..9db6f488db59 100644
> --- a/drivers/ata/libahci.c
> +++ b/drivers/ata/libahci.c
> @@ -1912,7 +1912,10 @@ static void ahci_port_intr(struct ata_port *ap)
>  static irqreturn_t ahci_multi_irqs_intr_hard(int irq, void *dev_instance)
>  {
>         struct ata_port *ap = dev_instance;
> +       struct ata_host *host = ap->host;
> +       struct ahci_host_priv *hpriv = host->private_data;
>         void __iomem *port_mmio = ahci_port_base(ap);
> +       void __iomem *mmio = hpriv->mmio;
>         u32 status;
>
>         VPRINTK("ENTER\n");
> @@ -1924,6 +1927,8 @@ static irqreturn_t ahci_multi_irqs_intr_hard(int irq, void *dev_instance)
>         ahci_handle_port_interrupt(ap, port_mmio, status);
>         spin_unlock(ap->lock);
>
> +       writel(BIT(ap->port_no), mmio + HOST_IRQ_STAT);
> +
>         VPRINTK("EXIT\n");
>
>         return IRQ_HANDLED;
> --
> 2.19.1
>
