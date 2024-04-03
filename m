Return-Path: <linux-ide+bounces-1093-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 172458968C0
	for <lists+linux-ide@lfdr.de>; Wed,  3 Apr 2024 10:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A5E21C26282
	for <lists+linux-ide@lfdr.de>; Wed,  3 Apr 2024 08:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330C36FE22;
	Wed,  3 Apr 2024 08:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFWcNKqg"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A48D6FE13;
	Wed,  3 Apr 2024 08:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712133146; cv=none; b=rNR8Wdp+2/08NisqBZyI8cKxb11w9wcTsFunY7Jcm2f3K9EoffcYpsQKIQP8/uDMjGQFcP1Btpe441SA1DZYbB7Z7mHn3zs7JOBuGjnZDMX+okjV8GwKRC4xSV7Jf8WRWMjRwfRbAwsgQfdROg3CCUVNML0354RdnFAmFHUkdXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712133146; c=relaxed/simple;
	bh=aGhiiMNbyThJXm/os2JFdWTJxH/5Ik748muQ/oIJTBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kVTVta4IV+opAFljvoie/KTeE5+zVdZSauhjH0P9sFRCH0ezKRgE1syfxqprU/95ptcklx/ZJPc6lUr7re4Mg3F/SVVNvppWLMYKkui0XVt2kITOtKNN5pNeYjx8ZpGnkZsXjrKpcQvqO0REzJIY+uGSC8C1nUjDyyaU9tph9TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gFWcNKqg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC60C43330;
	Wed,  3 Apr 2024 08:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712133145;
	bh=aGhiiMNbyThJXm/os2JFdWTJxH/5Ik748muQ/oIJTBs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gFWcNKqgMGhVcvPHrJu3LUr9vw9tGvcC+8FZUCcllgrlMOwbjZ21bZsZS6rbSrZD6
	 z1nl6uE1SWxMeQkuJwWBWTqI+CqyFJlzjSOcNjLxhFbvRWwsz3d7gk50Q30W06gGUN
	 ZE8oNF46LDq68Ktr5D/nN07eq7zVnFju6KUhMUTz3tZIj+kWzAtbD3+D3a4EqAs+U2
	 twcQQBz7/sbkCjmy/ZZthmnZ0OMCrhd/S2fiXiyksXOg8cegGNVLL6Tm2TE4hEUSV+
	 jlujWEJPveb3a7DgazHcD85f5ZC++b/XLFNyh6xGulqhLDAAJfhOkJmiFstQB3GObP
	 BMGGQNLI6gx9Q==
Message-ID: <a1ca8aa3-d122-4ec9-b239-8180a02106e1@kernel.org>
Date: Wed, 3 Apr 2024 17:32:23 +0900
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/34] sata: mv: drop unnecessary #ifdef checks
To: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 Niklas Cassel <cassel@kernel.org>,
 Saeed Bishara <saeed@ubuntu-saeed.il.marvell.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Ma Ke <make_ruc2021@163.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jeff Garzik <jeff@garzik.org>, linux-ide@vger.kernel.org
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-31-arnd@kernel.org>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240403080702.3509288-31-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/3/24 17:06, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Building with W=1 shows a warning for an unused variable when CONFIG_PCI
> is diabled:
> 
> drivers/ata/sata_mv.c:790:35: error: unused variable 'mv_pci_tbl' [-Werror,-Wunused-const-variable]
> static const struct pci_device_id mv_pci_tbl[] = {
> 
> Move the table into the same block that containsn the pci_driver
> definition.
> 
> Fixes: 7bb3c5290ca0 ("sata_mv: Remove PCI dependency")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

The patch title is also not describing what the patch does.
Are you OK with changing that to:

ata: sata_mv: Fix PCI device ID table declaration warning

?

> ---
>  drivers/ata/sata_mv.c | 64 +++++++++++++++++++++----------------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/ata/sata_mv.c b/drivers/ata/sata_mv.c
> index e82786c63fbd..697063890f5d 100644
> --- a/drivers/ata/sata_mv.c
> +++ b/drivers/ata/sata_mv.c
> @@ -787,37 +787,6 @@ static const struct ata_port_info mv_port_info[] = {
>  	},
>  };
>  
> -static const struct pci_device_id mv_pci_tbl[] = {
> -	{ PCI_VDEVICE(MARVELL, 0x5040), chip_504x },
> -	{ PCI_VDEVICE(MARVELL, 0x5041), chip_504x },
> -	{ PCI_VDEVICE(MARVELL, 0x5080), chip_5080 },
> -	{ PCI_VDEVICE(MARVELL, 0x5081), chip_508x },
> -	/* RocketRAID 1720/174x have different identifiers */
> -	{ PCI_VDEVICE(TTI, 0x1720), chip_6042 },
> -	{ PCI_VDEVICE(TTI, 0x1740), chip_6042 },
> -	{ PCI_VDEVICE(TTI, 0x1742), chip_6042 },
> -
> -	{ PCI_VDEVICE(MARVELL, 0x6040), chip_604x },
> -	{ PCI_VDEVICE(MARVELL, 0x6041), chip_604x },
> -	{ PCI_VDEVICE(MARVELL, 0x6042), chip_6042 },
> -	{ PCI_VDEVICE(MARVELL, 0x6080), chip_608x },
> -	{ PCI_VDEVICE(MARVELL, 0x6081), chip_608x },
> -
> -	{ PCI_VDEVICE(ADAPTEC2, 0x0241), chip_604x },
> -
> -	/* Adaptec 1430SA */
> -	{ PCI_VDEVICE(ADAPTEC2, 0x0243), chip_7042 },
> -
> -	/* Marvell 7042 support */
> -	{ PCI_VDEVICE(MARVELL, 0x7042), chip_7042 },
> -
> -	/* Highpoint RocketRAID PCIe series */
> -	{ PCI_VDEVICE(TTI, 0x2300), chip_7042 },
> -	{ PCI_VDEVICE(TTI, 0x2310), chip_7042 },
> -
> -	{ }			/* terminate list */
> -};
> -
>  static const struct mv_hw_ops mv5xxx_ops = {
>  	.phy_errata		= mv5_phy_errata,
>  	.enable_leds		= mv5_enable_leds,
> @@ -4303,6 +4272,37 @@ static int mv_pci_init_one(struct pci_dev *pdev,
>  static int mv_pci_device_resume(struct pci_dev *pdev);
>  #endif
>  
> +static const struct pci_device_id mv_pci_tbl[] = {
> +	{ PCI_VDEVICE(MARVELL, 0x5040), chip_504x },
> +	{ PCI_VDEVICE(MARVELL, 0x5041), chip_504x },
> +	{ PCI_VDEVICE(MARVELL, 0x5080), chip_5080 },
> +	{ PCI_VDEVICE(MARVELL, 0x5081), chip_508x },
> +	/* RocketRAID 1720/174x have different identifiers */
> +	{ PCI_VDEVICE(TTI, 0x1720), chip_6042 },
> +	{ PCI_VDEVICE(TTI, 0x1740), chip_6042 },
> +	{ PCI_VDEVICE(TTI, 0x1742), chip_6042 },
> +
> +	{ PCI_VDEVICE(MARVELL, 0x6040), chip_604x },
> +	{ PCI_VDEVICE(MARVELL, 0x6041), chip_604x },
> +	{ PCI_VDEVICE(MARVELL, 0x6042), chip_6042 },
> +	{ PCI_VDEVICE(MARVELL, 0x6080), chip_608x },
> +	{ PCI_VDEVICE(MARVELL, 0x6081), chip_608x },
> +
> +	{ PCI_VDEVICE(ADAPTEC2, 0x0241), chip_604x },
> +
> +	/* Adaptec 1430SA */
> +	{ PCI_VDEVICE(ADAPTEC2, 0x0243), chip_7042 },
> +
> +	/* Marvell 7042 support */
> +	{ PCI_VDEVICE(MARVELL, 0x7042), chip_7042 },
> +
> +	/* Highpoint RocketRAID PCIe series */
> +	{ PCI_VDEVICE(TTI, 0x2300), chip_7042 },
> +	{ PCI_VDEVICE(TTI, 0x2310), chip_7042 },
> +
> +	{ }			/* terminate list */
> +};
> +
>  
>  static struct pci_driver mv_pci_driver = {
>  	.name			= DRV_NAME,
> @@ -4315,6 +4315,7 @@ static struct pci_driver mv_pci_driver = {
>  #endif
>  
>  };
> +MODULE_DEVICE_TABLE(pci, mv_pci_tbl);
>  
>  /**
>   *      mv_print_info - Dump key info to kernel log for perusal.
> @@ -4487,7 +4488,6 @@ static void __exit mv_exit(void)
>  MODULE_AUTHOR("Brett Russ");
>  MODULE_DESCRIPTION("SCSI low-level driver for Marvell SATA controllers");
>  MODULE_LICENSE("GPL v2");
> -MODULE_DEVICE_TABLE(pci, mv_pci_tbl);
>  MODULE_VERSION(DRV_VERSION);
>  MODULE_ALIAS("platform:" DRV_NAME);
>  

-- 
Damien Le Moal
Western Digital Research


