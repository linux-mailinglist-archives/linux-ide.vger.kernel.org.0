Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7A3274B6AC
	for <lists+linux-ide@lfdr.de>; Fri,  7 Jul 2023 20:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjGGS6X (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 7 Jul 2023 14:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjGGS6V (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 7 Jul 2023 14:58:21 -0400
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D6E124;
        Fri,  7 Jul 2023 11:58:20 -0700 (PDT)
Received: from [192.168.1.103] (31.173.86.230) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Fri, 7 Jul 2023
 21:58:10 +0300
Subject: Re: [PATCH 6/8] pata: ixp4xx: Use
 devm_platform_get_and_ioremap_resource()
To:     Yangtao Li <frank.li@vivo.com>, Damien Le Moal <dlemoal@kernel.org>
CC:     <linux-ide@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230706124239.23366-1-frank.li@vivo.com>
 <20230706124239.23366-6-frank.li@vivo.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <f264a261-d8c7-5220-d8cd-f59e04230cb2@omp.ru>
Date:   Fri, 7 Jul 2023 21:58:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20230706124239.23366-6-frank.li@vivo.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.173.86.230]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 07/07/2023 18:33:35
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 178491 [Jul 07 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.86.230 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.86.230 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;31.173.86.230:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.86.230
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 07/07/2023 18:40:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 7/7/2023 3:11:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 7/6/23 3:42 PM, Yangtao Li wrote:

> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  drivers/ata/pata_ixp4xx_cf.c | 24 +++++++++---------------
>  1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/ata/pata_ixp4xx_cf.c b/drivers/ata/pata_ixp4xx_cf.c
> index b1daa4d3fcd9..246bb4f8f1f7 100644
> --- a/drivers/ata/pata_ixp4xx_cf.c
> +++ b/drivers/ata/pata_ixp4xx_cf.c
[...]
> @@ -271,18 +265,18 @@ static int ixp4xx_pata_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ixpp->cmd = devm_ioremap_resource(dev, cmd);
> -	ixpp->ctl = devm_ioremap_resource(dev, ctl);
> -	if (IS_ERR(ixpp->cmd) || IS_ERR(ixpp->ctl))
> -		return -ENOMEM;
> +	ixpp->cmd = devm_platform_get_and_ioremap_resource(pdev, 0, &cmd);
> +	if (IS_ERR(ixpp->cmd))
> +		return PTR_ERR(ixpp->cmd);
> +
> +	ixpp->ctl = devm_platform_get_and_ioremap_resource(pdev, 1, &ctl);
> +	if (IS_ERR(ixpp->ctl))
> +		return PTR_ERR(ixpp->ctl);

   Looks good...

>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq > 0)
> -		irq_set_irq_type(irq, IRQ_TYPE_EDGE_RISING);
> -	else if (irq < 0)
> +	if (irq < 0)
>  		return irq;
> -	else
> -		return -EINVAL;
> +	irq_set_irq_type(irq, IRQ_TYPE_EDGE_RISING);

   This change also looks good (but undescribed!), however it should be
done in a separate patch.
   For the future, try to follow a simple rule: do one thing per patch.
Oh, and don't forget to describe everything you do in a patch...

[...]

MBR, Sergey
