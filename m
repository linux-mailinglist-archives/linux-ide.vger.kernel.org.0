Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D463F49D7A1
	for <lists+linux-ide@lfdr.de>; Thu, 27 Jan 2022 02:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234704AbiA0ByN (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 26 Jan 2022 20:54:13 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:48860 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234693AbiA0ByM (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 26 Jan 2022 20:54:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1643248450; x=1674784450;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=k7/raDRJiRiKukJMbC690CDgFjvvtSVzyEUqguE3Ewo=;
  b=eneX56w+jkuz/YY/Il+F2ebWMoXydshF48LexETmbNzx+VkV+nGgiJHN
   Jm/fBYbX/9TBvsnzZBJ1JpRAX5MpwCrEbRW3qVX3xokuVKQ5WkUD6VjKS
   t/jpNPukalCX42oBTVSnZ6okY8zn6iMZu2Cp5N/zXOIlxXYd0Th5+WaZw
   CrW5bIhw2kw63t/+IRmGipNqf2NheL0VFU8EseSvx7+3nW2je2jUYnNBc
   1t/W7dzDBQntmGlQzd3pypdqugytx6rDvid60qXuV9MkJUBYBowSlAE4w
   ivuBlVzE/8wMbsjbAU2947mC5wxuCR7vpbJ80vooWFI2tGVHtl8ghtx+F
   A==;
X-IronPort-AV: E=Sophos;i="5.88,319,1635177600"; 
   d="scan'208";a="196277894"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 27 Jan 2022 09:54:10 +0800
IronPort-SDR: 4Vsia9Jeje2L5SqRqRqNYNp0sF85Gm/LTSaubug3xeB1amfWQ60ECJN5F03ZCnVBMeiTuym6rN
 luzWCV3uZZJBoLnPfHLfjP3der3s1PYglI2KRS0V8+iGteJPMUJWNTme+ScM8ye4DMyWkC3XpW
 uh3B7J6/7nGu3a7Eavc5+hzUxztXypH6JAxMihVH7DpYdF3crQMbyydeLPv36zQv71nvwG9jC7
 JMqUd7jM3GKUVA1QtTTP33X1SCQ4tZBwzs2GWW7R0TbEaZtVGTRXaXVeHDduv7wOP0FngCrHjq
 WdTQipZr11+zdm/fMrmV0ZO6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 17:27:30 -0800
IronPort-SDR: 4semsjYv9tgG2uK+rHAA6oA8UdWD60Zg2Oc+ydFuaiyOaZOC+ds5S7PqF3tw2yjRje8AzcNJC8
 edRVH5mkDnCuW8QtRI3OdEjjjFhFqbWfzrWyaCrQ6Dk84sKsNHlaiCeI+D+BnLmHqi28VVKiuc
 d7sm4yHIjJtsrn9lz3IhhJom90HECuB5w0o9NlQVM1Y7re/2h5V8qfmLupW8/0XGErDcMJTTyO
 0V0xXwzGlARG/Jilkw45NW8m8fsLLoaruT/LIHZyqTY1O4J2a3J+jFkLkEq7kIBXxAhzR8iQKb
 hIw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 17:54:13 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JkkCl5VwZz1SVp1
        for <linux-ide@vger.kernel.org>; Wed, 26 Jan 2022 17:54:11 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1643248451; x=1645840452; bh=k7/raDRJiRiKukJMbC690CDgFjvvtSVzyEU
        qguE3Ewo=; b=odAlT6NQhRABEmo2qVABxMm1PHGrbHuobW4g2kQr+IwR6+hw5hJ
        0rMqKCVbS6EX4loC2aXMS/E+Ws6gjsQ7BUoDtju9nW5xfuSTH+POAbq1NKB3F/3V
        ygXbPRyl3MisgE/6R9g8jHqhF23HSq6Ky9hEpBaA0jfH0MkTcDgJc4Cd2sMwJt2U
        4wjffZSckjR6Kisv75W4mdcc/A36+VEaIHDj93oGAzzdCpuI5kCACrVCBeeSy9Tg
        l8wT/7m/+OZvUC+vHfi2Vp/E6ayMYr4AG2z+7yjg96e8qeiSVqDZMy8kr/Tr7tJu
        bescYLgcLB47a7spPvZd37+HSr09UeCtFHw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id ykQ2QDQmlKud for <linux-ide@vger.kernel.org>;
        Wed, 26 Jan 2022 17:54:11 -0800 (PST)
Received: from [10.225.163.56] (unknown [10.225.163.56])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JkkCk0qlTz1RvlN;
        Wed, 26 Jan 2022 17:54:09 -0800 (PST)
Message-ID: <851b0f18-a95d-cfd1-54df-a6902f251a4e@opensource.wdc.com>
Date:   Thu, 27 Jan 2022 10:54:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ata: pata_platform: Fix a NULL pointer dereference in
 __pata_platform_probe()
Content-Language: en-US
To:     Zhou Qingyang <zhou1615@umn.edu>
Cc:     kjlu@umn.edu, Alexander Shiyan <shc_work@mail.ru>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220124164525.53068-1-zhou1615@umn.edu>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220124164525.53068-1-zhou1615@umn.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 1/25/22 01:45, Zhou Qingyang wrote:
> In __pata_platform_probe(), devm_kzalloc() is assigned to ap->ops and
> there is a dereference of it right after that, which could introduce a
> NULL pointer dereference bug.
> 
> Fix this by adding a NULL check of ap->ops.
> 
> This bug was found by a static analyzer.
> 
> Builds with 'make allyesconfig' show no new warnings,
> and our static analyzer no longer warns about this code.
> 
> Fixes: f3d5e4f18dba ("ata: pata_of_platform: Allow to use 16-bit wide data transfer")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
> The analysis employs differential checking to identify inconsistent 
> security operations (e.g., checks or kfrees) between two code paths 
> and confirms that the inconsistent operations are not recovered in the
> current function or the callers, so they constitute bugs. 
> 
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.

See below. Reviewing the fix would be good too :)

> 
>  drivers/ata/pata_platform.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/ata/pata_platform.c b/drivers/ata/pata_platform.c
> index 028329428b75..021ef9cbcbc1 100644
> --- a/drivers/ata/pata_platform.c
> +++ b/drivers/ata/pata_platform.c
> @@ -128,6 +128,8 @@ int __pata_platform_probe(struct device *dev, struct resource *io_res,
>  	ap = host->ports[0];
>  
>  	ap->ops = devm_kzalloc(dev, sizeof(*ap->ops), GFP_KERNEL);
> +	if (ap->ops)

This of course should be "if (!ap->ops)", obviously...
I fixed that when applying.

> +		return -ENOMEM;
>  	ap->ops->inherits = &ata_sff_port_ops;
>  	ap->ops->cable_detect = ata_cable_unknown;
>  	ap->ops->set_mode = pata_platform_set_mode;


-- 
Damien Le Moal
Western Digital Research
