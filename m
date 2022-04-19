Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F125C507A17
	for <lists+linux-ide@lfdr.de>; Tue, 19 Apr 2022 21:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242565AbiDSTW1 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 19 Apr 2022 15:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346734AbiDSTW0 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 19 Apr 2022 15:22:26 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E9F3BBC8;
        Tue, 19 Apr 2022 12:19:42 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-deb9295679so18563648fac.6;
        Tue, 19 Apr 2022 12:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GCIqaSaM+78BTcFvVqPCCxKtj0Yv/w6zLXwTQ8J37TY=;
        b=N15yGzRCwjecxnVIg8M/2zW+MKauyG0rBwOQRVpldykQZnRkqKE9El1mrCIhC5tpa3
         mZYs/NNNtiUyh5W5hvl19Y7zeb8DeOxu4tks0mReUgmniMD/bf5nsYFdNWiptODmqyOs
         3gCrlLxCjhFC54R//epn2UJujKxBQXNdEgFjxCmpH7mgjaM6tLlQBDaTVCUcdQtR35lj
         7Tt1lDZsdAHI5Pbstj9J84Ihxn5WFPb+B+vLEZoTxk6AWANcNnnqMG7G+CgpD4Ea0Yko
         41w+05FRULRAio8K5wBHqi2F+ZvrvAiWWspzJJK1NASbvKD2U3VX923okxMvrmhXwnEk
         BZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GCIqaSaM+78BTcFvVqPCCxKtj0Yv/w6zLXwTQ8J37TY=;
        b=Mi70Pt+8yUfyCDF/jBw1Ww3YNquPBEyEVYD2BPptP1IM8Lm0Spok1A761eFcI0o6jh
         xd/m0P7VjpzPbYw74gHPrU91p9CHOi+d4xNT7MPFPjE0hyLgYdmgBCiOIWuFFaz/i7L3
         dIoZDqTVHNP/1p/SA/tgX1OquH2cIFWLxH5Z2XYOQ8qIC+GUj8teGa7EwbJeGfmas8QD
         Nc69HtFL7ZA3TaeDhtMN01EAYOj4A+kLbzmeUsD56Gg1zKjHhVORlBjEeUI/i4Ras3tn
         MBPgYYHGNsAOKxsoVyVu1JS0UnZz+bEMCPiBbeMgNlWTckyXfjq6i2QjX0atoG7TLw6X
         v8Hw==
X-Gm-Message-State: AOAM531lFDCr25iJd54F+YSPBdWO5E5ZO5/bcFnv+LSCmsxg5yPFWyos
        axPRyul50HnK2WJiV1Ujyms=
X-Google-Smtp-Source: ABdhPJwSWdjg1BPPp6prEE5n8IQQyhcAi3SbJ3RPj6S76yJb9QiX5X1uNp4B+FkD632RnMbZPsmO9A==
X-Received: by 2002:a05:6870:4253:b0:e6:3a8e:9bbe with SMTP id v19-20020a056870425300b000e63a8e9bbemr49128oac.235.1650395982153;
        Tue, 19 Apr 2022 12:19:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z3-20020a056870d68300b000e2a0a74f9fsm5713262oap.37.2022.04.19.12.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 12:19:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <24b49b6a-564c-6e2b-64fe-a3b5aeaa6d20@roeck-us.net>
Date:   Tue, 19 Apr 2022 12:19:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 09/48] watchdog: sa1100: use platform device registration
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>, robert.jarzmik@free.fr,
        linux-arm-kernel@lists.infradead.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Paul Parsons <lost.distance@yahoo.com>,
        Tomas Cech <sleep_walker@suse.com>,
        Sergey Lapin <slapin@ossfans.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
        patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        alsa-devel@alsa-project.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-10-arnd@kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220419163810.2118169-10-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 4/19/22 09:37, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Rather than relying on machine specific headers to
> pass down the reboot status and the register locations,
> use resources and platform_data.
> 
> Aside from this, keep the changes to a minimum.
> 
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   arch/arm/mach-pxa/devices.c               | 11 +++
>   arch/arm/mach-pxa/include/mach/regs-ost.h |  2 +
>   arch/arm/mach-pxa/include/mach/reset.h    |  2 +-
>   arch/arm/mach-pxa/pxa25x.c                |  2 +-
>   arch/arm/mach-pxa/pxa27x.c                |  2 +-
>   arch/arm/mach-pxa/pxa3xx.c                |  2 +-
>   arch/arm/mach-pxa/reset.c                 |  3 -
>   arch/arm/mach-sa1100/generic.c            |  6 +-
>   arch/arm/mach-sa1100/include/mach/reset.h |  1 -
>   drivers/watchdog/sa1100_wdt.c             | 87 ++++++++++++++++-------
>   10 files changed, 83 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
> index 454523237c97..12f78636045f 100644
> --- a/arch/arm/mach-pxa/devices.c
> +++ b/arch/arm/mach-pxa/devices.c
> @@ -24,6 +24,8 @@
>   #include <linux/platform_data/mmp_dma.h>
>   #include <linux/platform_data/mtd-nand-pxa3xx.h>
>   
> +#include <mach/regs-ost.h>
> +#include <mach/reset.h>
>   #include "devices.h"
>   #include "generic.h"
>   
> @@ -1118,3 +1120,12 @@ void __init pxa2xx_set_dmac_info(struct mmp_dma_platdata *dma_pdata)
>   {
>   	pxa_register_device(&pxa2xx_pxa_dma, dma_pdata);
>   }
> +
> +void __init pxa_register_wdt(unsigned int reset_status)
> +{
> +	struct resource res = DEFINE_RES_MEM(OST_PHYS, OST_LEN);
> +
> +	reset_status &= RESET_STATUS_WATCHDOG;
> +	platform_device_register_resndata(NULL, "sa1100_wdt", -1, &res, 1,
> +					  &reset_status, sizeof(reset_status));
> +}
> diff --git a/arch/arm/mach-pxa/include/mach/regs-ost.h b/arch/arm/mach-pxa/include/mach/regs-ost.h
> index 109d0ed264df..c8001cfc8d6b 100644
> --- a/arch/arm/mach-pxa/include/mach/regs-ost.h
> +++ b/arch/arm/mach-pxa/include/mach/regs-ost.h
> @@ -7,6 +7,8 @@
>   /*
>    * OS Timer & Match Registers
>    */
> +#define OST_PHYS	0x40A00000
> +#define OST_LEN		0x00000020
>   
>   #define OSMR0		io_p2v(0x40A00000)  /* */
>   #define OSMR1		io_p2v(0x40A00004)  /* */
> diff --git a/arch/arm/mach-pxa/include/mach/reset.h b/arch/arm/mach-pxa/include/mach/reset.h
> index e1c4d100fd45..963dd190bc13 100644
> --- a/arch/arm/mach-pxa/include/mach/reset.h
> +++ b/arch/arm/mach-pxa/include/mach/reset.h
> @@ -8,8 +8,8 @@
>   #define RESET_STATUS_GPIO	(1 << 3)	/* GPIO Reset */
>   #define RESET_STATUS_ALL	(0xf)
>   
> -extern unsigned int reset_status;
>   extern void clear_reset_status(unsigned int mask);
> +extern void pxa_register_wdt(unsigned int reset_status);
>   
>   /**
>    * init_gpio_reset() - register GPIO as reset generator
> diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
> index 305047ebd2f1..dfc90b41fba3 100644
> --- a/arch/arm/mach-pxa/pxa25x.c
> +++ b/arch/arm/mach-pxa/pxa25x.c
> @@ -240,7 +240,7 @@ static int __init pxa25x_init(void)
>   
>   	if (cpu_is_pxa25x()) {
>   
> -		reset_status = RCSR;
> +		pxa_register_wdt(RCSR);
>   
>   		pxa25x_init_pm();
>   
> diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
> index a81ac88ecbfd..38fdd22c4dc5 100644
> --- a/arch/arm/mach-pxa/pxa27x.c
> +++ b/arch/arm/mach-pxa/pxa27x.c
> @@ -337,7 +337,7 @@ static int __init pxa27x_init(void)
>   
>   	if (cpu_is_pxa27x()) {
>   
> -		reset_status = RCSR;
> +		pxa_register_wdt(RCSR);
>   
>   		pxa27x_init_pm();
>   
> diff --git a/arch/arm/mach-pxa/pxa3xx.c b/arch/arm/mach-pxa/pxa3xx.c
> index fc84aed99481..7c569fa2a6da 100644
> --- a/arch/arm/mach-pxa/pxa3xx.c
> +++ b/arch/arm/mach-pxa/pxa3xx.c
> @@ -463,7 +463,7 @@ static int __init pxa3xx_init(void)
>   
>   	if (cpu_is_pxa3xx()) {
>   
> -		reset_status = ARSR;
> +		pxa_register_wdt(ARSR);
>   
>   		/*
>   		 * clear RDH bit every time after reset
> diff --git a/arch/arm/mach-pxa/reset.c b/arch/arm/mach-pxa/reset.c
> index af78405aa4e9..fcb791c5ae3e 100644
> --- a/arch/arm/mach-pxa/reset.c
> +++ b/arch/arm/mach-pxa/reset.c
> @@ -11,9 +11,6 @@
>   #include <mach/reset.h>
>   #include <mach/smemc.h>
>   
> -unsigned int reset_status;
> -EXPORT_SYMBOL(reset_status);
> -
>   static void do_hw_reset(void);
>   
>   static int reset_gpio = -1;
> diff --git a/arch/arm/mach-sa1100/generic.c b/arch/arm/mach-sa1100/generic.c
> index 4dfb7554649d..6c21f214cd60 100644
> --- a/arch/arm/mach-sa1100/generic.c
> +++ b/arch/arm/mach-sa1100/generic.c
> @@ -39,9 +39,6 @@
>   #include "generic.h"
>   #include <clocksource/pxa.h>
>   
> -unsigned int reset_status;
> -EXPORT_SYMBOL(reset_status);
> -
>   #define NR_FREQS	16
>   
>   /*
> @@ -319,10 +316,13 @@ static struct platform_device *sa11x0_devices[] __initdata = {
>   
>   static int __init sa1100_init(void)
>   {
> +	struct resource wdt_res = DEFINE_RES_MEM(0x90000000, 0x20);
>   	pm_power_off = sa1100_power_off;
>   
>   	regulator_has_full_constraints();
>   
> +	platform_device_register_simple("sa1100_wdt", -1, &wdt_res, 1);
> +
>   	return platform_add_devices(sa11x0_devices, ARRAY_SIZE(sa11x0_devices));
>   }
>   
> diff --git a/arch/arm/mach-sa1100/include/mach/reset.h b/arch/arm/mach-sa1100/include/mach/reset.h
> index 27695650a567..a6723d45ae2a 100644
> --- a/arch/arm/mach-sa1100/include/mach/reset.h
> +++ b/arch/arm/mach-sa1100/include/mach/reset.h
> @@ -10,7 +10,6 @@
>   #define RESET_STATUS_GPIO	(1 << 3)	/* GPIO Reset */
>   #define RESET_STATUS_ALL	(0xf)
>   
> -extern unsigned int reset_status;
>   static inline void clear_reset_status(unsigned int mask)
>   {
>   	RCSR = mask;
> diff --git a/drivers/watchdog/sa1100_wdt.c b/drivers/watchdog/sa1100_wdt.c
> index d33f0375112f..2d0a06a158a8 100644
> --- a/drivers/watchdog/sa1100_wdt.c
> +++ b/drivers/watchdog/sa1100_wdt.c
> @@ -22,6 +22,7 @@
>   #include <linux/types.h>
>   #include <linux/kernel.h>
>   #include <linux/fs.h>
> +#include <linux/platform_device.h>
>   #include <linux/miscdevice.h>
>   #include <linux/watchdog.h>
>   #include <linux/init.h>
> @@ -30,16 +31,42 @@
>   #include <linux/uaccess.h>
>   #include <linux/timex.h>
>   
> -#ifdef CONFIG_ARCH_PXA
> -#include <mach/regs-ost.h>
> -#endif
> +#define REG_OSMR0  	0x0000  /* OS timer Match Reg. 0 */
> +#define REG_OSMR1  	0x0004  /* OS timer Match Reg. 1 */
> +#define REG_OSMR2  	0x0008  /* OS timer Match Reg. 2 */
> +#define REG_OSMR3  	0x000c  /* OS timer Match Reg. 3 */
> +#define REG_OSCR   	0x0010  /* OS timer Counter Reg. */
> +#define REG_OSSR   	0x0014  /* OS timer Status Reg. */
> +#define REG_OWER   	0x0018  /* OS timer Watch-dog Enable Reg. */
> +#define REG_OIER  	0x001C  /* OS timer Interrupt Enable Reg. */
>   
> -#include <mach/reset.h>
> +#define OSSR_M3		(1 << 3)	/* Match status channel 3 */
> +#define OSSR_M2		(1 << 2)	/* Match status channel 2 */
> +#define OSSR_M1		(1 << 1)	/* Match status channel 1 */
> +#define OSSR_M0		(1 << 0)	/* Match status channel 0 */
> +
> +#define OWER_WME	(1 << 0)	/* Watchdog Match Enable */
> +
> +#define OIER_E3		(1 << 3)	/* Interrupt enable channel 3 */
> +#define OIER_E2		(1 << 2)	/* Interrupt enable channel 2 */
> +#define OIER_E1		(1 << 1)	/* Interrupt enable channel 1 */
> +#define OIER_E0		(1 << 0)	/* Interrupt enable channel 0 */
>   
>   static unsigned long oscr_freq;
>   static unsigned long sa1100wdt_users;
>   static unsigned int pre_margin;
>   static int boot_status;
> +static void __iomem *reg_base;
> +
> +static inline void sa1100_wr(u32 val, u32 offset)
> +{
> +	writel_relaxed(val, reg_base + offset);
> +}
> +
> +static inline u32 sa1100_rd(u32 offset)
> +{
> +	return readl_relaxed(reg_base + offset);
> +}
>   
>   /*
>    *	Allow only one person to hold it open
> @@ -50,10 +77,10 @@ static int sa1100dog_open(struct inode *inode, struct file *file)
>   		return -EBUSY;
>   
>   	/* Activate SA1100 Watchdog timer */
> -	writel_relaxed(readl_relaxed(OSCR) + pre_margin, OSMR3);
> -	writel_relaxed(OSSR_M3, OSSR);
> -	writel_relaxed(OWER_WME, OWER);
> -	writel_relaxed(readl_relaxed(OIER) | OIER_E3, OIER);
> +	sa1100_wr(sa1100_rd(REG_OSCR) + pre_margin, REG_OSMR3);
> +	sa1100_wr(OSSR_M3, REG_OSSR);
> +	sa1100_wr(OWER_WME, REG_OWER);
> +	sa1100_wr(sa1100_rd(REG_OIER) | OIER_E3, REG_OIER);
>   	return stream_open(inode, file);
>   }
>   
> @@ -61,7 +88,7 @@ static int sa1100dog_open(struct inode *inode, struct file *file)
>    * The watchdog cannot be disabled.
>    *
>    * Previous comments suggested that turning off the interrupt by
> - * clearing OIER[E3] would prevent the watchdog timing out but this
> + * clearing REG_OIER[E3] would prevent the watchdog timing out but this
>    * does not appear to be true (at least on the PXA255).
>    */
>   static int sa1100dog_release(struct inode *inode, struct file *file)
> @@ -76,7 +103,7 @@ static ssize_t sa1100dog_write(struct file *file, const char __user *data,
>   {
>   	if (len)
>   		/* Refresh OSMR3 timer. */
> -		writel_relaxed(readl_relaxed(OSCR) + pre_margin, OSMR3);
> +		sa1100_wr(sa1100_rd(REG_OSCR) + pre_margin, REG_OSMR3);
>   	return len;
>   }
>   
> @@ -110,7 +137,7 @@ static long sa1100dog_ioctl(struct file *file, unsigned int cmd,
>   		break;
>   
>   	case WDIOC_KEEPALIVE:
> -		writel_relaxed(readl_relaxed(OSCR) + pre_margin, OSMR3);
> +		sa1100_wr(sa1100_rd(REG_OSCR) + pre_margin, REG_OSMR3);
>   		ret = 0;
>   		break;
>   
> @@ -125,7 +152,7 @@ static long sa1100dog_ioctl(struct file *file, unsigned int cmd,
>   		}
>   
>   		pre_margin = oscr_freq * time;
> -		writel_relaxed(readl_relaxed(OSCR) + pre_margin, OSMR3);
> +		sa1100_wr(sa1100_rd(REG_OSCR) + pre_margin, REG_OSMR3);
>   		fallthrough;
>   
>   	case WDIOC_GETTIMEOUT:
> @@ -151,12 +178,22 @@ static struct miscdevice sa1100dog_miscdev = {
>   	.fops		= &sa1100dog_fops,
>   };
>   
> -static int margin __initdata = 60;		/* (secs) Default is 1 minute */
> +static int margin = 60;		/* (secs) Default is 1 minute */
>   static struct clk *clk;
>   
> -static int __init sa1100dog_init(void)
> +static int sa1100dog_probe(struct platform_device *pdev)
>   {
>   	int ret;
> +	int *platform_data;
> +	struct resource *res;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENXIO;
> +	reg_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +	ret = PTR_ERR_OR_ZERO(reg_base);
> +	if (ret)
> +		return ret;
>   
>   	clk = clk_get(NULL, "OSTIMER0");
>   	if (IS_ERR(clk)) {
> @@ -174,13 +211,9 @@ static int __init sa1100dog_init(void)
>   
>   	oscr_freq = clk_get_rate(clk);
>   
> -	/*
> -	 * Read the reset status, and save it for later.  If
> -	 * we suspend, RCSR will be cleared, and the watchdog
> -	 * reset reason will be lost.
> -	 */
> -	boot_status = (reset_status & RESET_STATUS_WATCHDOG) ?
> -				WDIOF_CARDRESET : 0;
> +	platform_data = pdev->dev.platform_data;
> +	if (platform_data && *platform_data)
> +		boot_status = WDIOF_CARDRESET;
>   	pre_margin = oscr_freq * margin;
>   
>   	ret = misc_register(&sa1100dog_miscdev);
> @@ -196,15 +229,21 @@ static int __init sa1100dog_init(void)
>   	return ret;
>   }
>   
> -static void __exit sa1100dog_exit(void)
> +static int sa1100dog_remove(struct platform_device *pdev)
>   {
>   	misc_deregister(&sa1100dog_miscdev);
>   	clk_disable_unprepare(clk);
>   	clk_put(clk);
> +
> +	return 0;
>   }
>   
> -module_init(sa1100dog_init);
> -module_exit(sa1100dog_exit);
> +struct platform_driver sa1100dog_driver = {
> +	.driver.name = "sa1100_wdt",
> +	.probe	  = sa1100dog_probe,
> +	.remove	  = sa1100dog_remove,
> +};
> +module_platform_driver(sa1100dog_driver);
>   
>   MODULE_AUTHOR("Oleg Drokin <green@crimea.edu>");
>   MODULE_DESCRIPTION("SA1100/PXA2xx Watchdog");

