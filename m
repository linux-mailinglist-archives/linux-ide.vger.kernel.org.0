Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7E760588C
	for <lists+linux-ide@lfdr.de>; Thu, 20 Oct 2022 09:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiJTHas (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 20 Oct 2022 03:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiJTHap (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 20 Oct 2022 03:30:45 -0400
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FC94B0F5;
        Thu, 20 Oct 2022 00:30:26 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id F31755808CC;
        Thu, 20 Oct 2022 03:30:24 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Thu, 20 Oct 2022 03:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1666251024; x=1666258224; bh=wOxLCzcVu+
        q+SEyBn/M4QllQRne63QwVrmt2BoYxq6o=; b=DB0KPjPqIj/nbnYmjgdk0kCApn
        aVNrHAQUjdw5QcGUS9R59jqK3joi2g74adqnI0MmeDADz+cBP8HjR3FjsgxGJszU
        p7fKM+Yv2Fz+EuiBub/9XJaJVi/9TirMoM1DjawknQWEzHchWNPsl6pnKdzdgKgm
        HvgBa7nfN6nWlTRqU05OkOZwHXJo+MwEcGdGgEHDxOMRBuGQISe87t4xOJKUHYra
        sMFrtpuBVPevYu2OkPxDX6bxJZ38fenQBKR+9kX4f+tCmeFFSHIYyDUmpKbjyRUq
        dpKGnV8CZUqRSZ6eN3b8CXbIKEZqyylRN+lsUr65byN/Hk1sl9+IVSko+5QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1666251024; x=1666258224; bh=wOxLCzcVu+q+SEyBn/M4QllQRne6
        3QwVrmt2BoYxq6o=; b=URPrxE7B17bixo89Pz9gzBBvqySx2hF97gJCAd+ebL/7
        kcG0y4nvK22Qh9tt4OKq8DtlgClI/rhX96NTFg1Hngkyyq5qF6fXp845XARp65bt
        wEnkduta/m/nuPAEj+loUCHG0sm9CqNdEds3ZxbVU9y4oenFNSi4W6XHHipJHXUO
        irBXEM1d7oo/igL7tNEEJSt2M6tp3/nWO5tN55L05H//4mZp/c56nwyWm2lw0yMH
        MDMzLWwiJHCteWb4eOBQewYJMD1Z4V1vnr7UPgKMlFu3zR2kGeeCreGbh455udxg
        b8Qkvq7qOkGpMcj9NyxDlv4QsnBI1g5eMXza/DX8Dw==
X-ME-Sender: <xms:D_lQYygvGxTjHf-7p5AEBfEoGWLxaoZml1Ghe4k4sIKJh1G29--lKA>
    <xme:D_lQYzAgx2xFpAluHJrk2nStKSKbsAQePERlV5AvGpRiqb-6UzeDpk_st7nzQM51h
    _3f3FcBaIzaVRDRRiM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelhedguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:D_lQY6EsVHvuMHlyrYFxtKd2TM17riXA_lB-LOCtNvcYWDk9ECOaeg>
    <xmx:D_lQY7QSPyrIK-Ty_HH4bEYVNvGxu8aLN2uaqM7pbC4r42nxZJu4fA>
    <xmx:D_lQY_xy3DkJac2uBHlBJpxk-Y898n1VkZA_GdhJU7XMutk1vmjRYw>
    <xmx:EPlQY3a_NzkYc7nklI6hLzts8juem--7fDfXf7QbahDBdQSaXaFrdg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 12D00B60086; Thu, 20 Oct 2022 03:30:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <7d9eebc8-39b6-4dc1-9ffc-f17ec584bee2@app.fastmail.com>
In-Reply-To: <m2r0z3h5yr.fsf@sopl295.home>
References: <20221019161831.3864786-1-arnd@kernel.org>
 <m2r0z3h5yr.fsf@sopl295.home>
Date:   Thu, 20 Oct 2022 09:30:03 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Robert Jarzmik" <jarzmik.robert@orange.fr>,
        "Arnd Bergmann" <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        "Daniel Mack" <daniel@zonque.org>,
        "Haojian Zhuang" <haojian.zhuang@gmail.com>,
        linux-kernel@vger.kernel.org,
        "Alan Stern" <stern@rowland.harvard.edu>,
        "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>,
        "Damien Le Moal" <damien.lemoal@opensource.wdc.com>,
        "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
        "Dominik Brodowski" <linux@dominikbrodowski.net>,
        "Felipe Balbi" <balbi@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Helge Deller" <deller@gmx.de>, perex@perex.cz,
        jingoohan1@gmail.com, "Lee Jones" <lee@kernel.org>,
        kernel@wantstofly.org, lgirdwood@gmail.com,
        "Linus Walleij" <linus.walleij@linaro.org>, marek.vasut@gmail.com,
        "Mark Brown" <broonie@kernel.org>, mkpetch@internode.on.net,
        "Miquel Raynal" <miquel.raynal@bootlin.com>,
        lost.distance@yahoo.com, philipp.zabel@gmail.com,
        "Russell King" <linux@armlinux.org.uk>, sre@kernel.org,
        slapin@ossfans.org, "Sergey Shtylyov" <s.shtylyov@omp.ru>,
        "Sudip Mukherjee" <sudipm.mukherjee@gmail.com>, tiwai@suse.com,
        "Ulf Hansson" <ulf.hansson@linaro.org>,
        "Vignesh Raghavendra" <vigneshr@ti.com>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
        linux-pm@vger.kernel.org, linux-ide@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-input@vger.kernel.org, patches@opensource.cirrus.com,
        linux-leds@vger.kernel.org,
        "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 00/30] ARM: pxa: remove all unused boards&drivers
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Wed, Oct 19, 2022, at 23:13, Robert Jarzmik wrote:
> Arnd Bergmann <arnd@kernel.org> writes:
>
>> From: Arnd Bergmann <arnd@arndb.de>
> ...zip...
>
>> A good number of drivers become impossible to select after this, so
>> each of these also get dropped. I'm including the driver patches in the
>> series here and can either merge them through the soc tree, or they
>> can get picked up by the individual subsystem maintainers. Since both
>> the platform and the drivers get removed, the order should not matter.
> This part is a bit ... bothering.
> I at least identified these :
>>  delete mode 100644 drivers/input/touchscreen/wm9705.c
>>  delete mode 100644 drivers/input/touchscreen/wm9712.c
>>  delete mode 100644 drivers/input/touchscreen/wm9713.c
>>  delete mode 100644 drivers/input/touchscreen/wm97xx-core.c
>>  delete mode 100644 drivers/mfd/wm97xx-core.c
>>  delete mode 100644 sound/ac97/bus.c
>>  delete mode 100644 sound/ac97/codec.c
>>  delete mode 100644 sound/ac97/snd_ac97_compat.c
>
> For the existing platforms working with devicetree support (mioa701 for
> example), the wm9713 was properly used, providing both sound support and input
> touchscreen.
> So was the a97 part, providing a framework to make the wm9713 work.
>
> So I'm wondering how the choice to chop these drivers was done, and it is
> necessary to remove them. If so, maybe pxa support in the kernel should be
> removed all together, as people playing with it loose part of the working DT
> platforms they had.

If the files are used for DT based machines, then they should
definitely stay, the intention of my series was to only remove
known dead code.

What I did was to remove CONFIG_UNUSED_BOARD_FILES and then
recursively trim out all code that could be compiled in
before but not after this change, assuming that this would
be safe.

What I see here is that AC97_BUS_NEW and SND_PXA2XX_SOC_AC97
are selected by eight legacy board files (tosa, e740, e750,
e800, em_x270, palm27x, zylonite and mioa701), but no
DT based machine, so without CONFIG_UNUSED_BOARD_FILES, the
entire AC97_BUS_NEW infrastructure and all drivers depending
on this became dead code.

Unfortunately I ran into problems sending out the rest of the
series after sending the cover letter, so the explanations
I put in the individual patches were not here. See [1] for the
actual series.

Since it looks like I'll have to redo half of the PXA patches
after leaving AC97_BUS_NEW in, I won't post the full version
first.

Any idea where I went wrong here? Did I make a mistake in
following the Kconfig dependencies, or are some parts of this
incorrectly annotated?

     Arnd

[1] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=boardfile-remove&id=73c4b7cfbc2b2
