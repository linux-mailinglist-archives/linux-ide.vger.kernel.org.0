Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B177946EB09
	for <lists+linux-ide@lfdr.de>; Thu,  9 Dec 2021 16:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236107AbhLIPZR (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 9 Dec 2021 10:25:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50309 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236059AbhLIPZQ (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 9 Dec 2021 10:25:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639063302;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6YIGwGqD4dGu6FG9WPJtv2xc8Ws3EOTfiVlMjVaJjDc=;
        b=e4zSpZRskvKrWZrUUWzwgkjPXSaQ2I5Fu4EUXbwTnHYaMvrM0gIHVJZ1D7yJiS/7kBCcNW
        1tUyLu/czt0Z6Rwh7+N3FxasBwtChluyTV9qqmXlG0veMQT+JQ7c6tpARmRaFwGv5uSTIg
        yCH6VRH34bbeCr0Ip3mQtSRFRoRIzGE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-5jIVvQnOMxGSjQ4elccM1g-1; Thu, 09 Dec 2021 10:21:41 -0500
X-MC-Unique: 5jIVvQnOMxGSjQ4elccM1g-1
Received: by mail-ed1-f70.google.com with SMTP id v1-20020aa7cd41000000b003e80973378aso5543434edw.14
        for <linux-ide@vger.kernel.org>; Thu, 09 Dec 2021 07:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6YIGwGqD4dGu6FG9WPJtv2xc8Ws3EOTfiVlMjVaJjDc=;
        b=AbrRhk91z/UzNbEYHNp9Ou/7ar6hYneZo7cfRgWOk0ys1CvJKMHs3/GAld9WJAnq2k
         DzGYQ4GbaGSTY5yr+NXHpN6B7GWLHmgZjMbAHRf9OyYGUBhgaKjwQ2A8MtVNR5RR6Z0J
         xrx3ffmzsGBnSWzH4a1lc1KZhdyL4nn5VvcaIx0mDQeGMEaz92PkEvQwZQ464eI2bgD4
         ISku+yETTQu4Qahl4Uv8loO8SDxmDkhfnYnggDfGYpXWh7aXtzrSYcLQVlFnwXsyxrBG
         GstEkMQTLXLzKhyhbcX3Vcssp3OQDivlceXs3U6RgSRUYVAdU5AEBzPcI/O2di+FdX0x
         Ms2g==
X-Gm-Message-State: AOAM531/Ls8Ln+RWKrj8NQB6zPh5DMQXiRCV7E6jQKMvs4wb+sfoe5oV
        AFXjaJq3hNNmM/tvk5LRx/EvBRXSGZD1wuPKwN/FRpZUlKR2OezkizHJX0iVzHH6A9lcwVVm7yV
        VRWABbmsgooQftA7rXGi1
X-Received: by 2002:a17:907:3fa0:: with SMTP id hr32mr16327580ejc.443.1639063300414;
        Thu, 09 Dec 2021 07:21:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyF1/alZruXsxPvxvH8kFaKeZWv95VPojWHHwg+QJ4I8m8OmUqA7eco9d+KB2Cp/F+WGLjJAQ==
X-Received: by 2002:a17:907:3fa0:: with SMTP id hr32mr16327550ejc.443.1639063300133;
        Thu, 09 Dec 2021 07:21:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e26sm50021edr.82.2021.12.09.07.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 07:21:39 -0800 (PST)
Message-ID: <ffba1bed-9e68-1d4a-a03b-c9bc1edfa7b5@redhat.com>
Date:   Thu, 9 Dec 2021 16:21:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1 1/2] ata: libahci_platform: Get rid of dup message when
 IRQ can't be retrieved
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>
References: <20211209145937.77719-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211209145937.77719-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi,

On 12/9/21 15:59, Andy Shevchenko wrote:
> platform_get_irq() will print a message when it fails.
> No need to repeat this.
> 
> While at it, drop redundant check for 0 as platform_get_irq() spills
> out a big WARN() in such case.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks, the series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans

> ---
>  drivers/ata/libahci_platform.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platform.c
> index 0910441321f7..1af642c84e7b 100644
> --- a/drivers/ata/libahci_platform.c
> +++ b/drivers/ata/libahci_platform.c
> @@ -579,13 +579,8 @@ int ahci_platform_init_host(struct platform_device *pdev,
>  	int i, irq, n_ports, rc;
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		if (irq != -EPROBE_DEFER)
> -			dev_err(dev, "no irq\n");
> +	if (irq < 0)
>  		return irq;
> -	}
> -	if (!irq)
> -		return -EINVAL;
>  
>  	hpriv->irq = irq;
>  
> 

