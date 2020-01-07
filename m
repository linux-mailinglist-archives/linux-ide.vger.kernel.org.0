Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42F361336E5
	for <lists+linux-ide@lfdr.de>; Tue,  7 Jan 2020 23:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgAGWxC (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 7 Jan 2020 17:53:02 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35951 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbgAGWxC (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 7 Jan 2020 17:53:02 -0500
Received: by mail-ed1-f67.google.com with SMTP id j17so1009425edp.3;
        Tue, 07 Jan 2020 14:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bLf9MRl/zEuO2K43L/4HQmzn+iRdGQ6WkPQMnmdAgZQ=;
        b=huOQleIphTNE+eVRD2OVId9XW6a481/O+guS/D/Gpe5wkIMOHVEi+U+1Xi+OM+tnKa
         AjaRBXED1HtnGGhLVrssRptfjilpnG7Ib/q7pqQ8c6B/Oal+NN9s/K1gDUkZghBCaLXv
         4ykWVuLnnHYvdS98qCjqn4+hH6IvW+JQCxl/kWIrirPKczlECiIrMIGXAiPUXFIZpqGu
         py6XD0W7zpIig3Gm4RmDZql1zIpIctnhOZSsR1+8WmDCFwtPVyqAQENiEkqFHnfrPaVF
         ssmvIfKFM501PvaX+WBUbzyy28mkN2el/zJJO/5S52P7Jk02UQqb+XeSr/JqwqydCtyA
         P1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bLf9MRl/zEuO2K43L/4HQmzn+iRdGQ6WkPQMnmdAgZQ=;
        b=M0tnHwFlVu+sJ5cvs2OgphfCTTyG4aj8vsJvKCd53s9g8iJ2v21Rpij2owSxHM+MOz
         BqH6dMJ87Fm5/uaW2/zRQlEbyabs+/ke6oeDbONaAx84IOXZbWP1kQAwFun5sq9lDqd1
         4N+lgxOAk+qYlUcV8BI3gmyV8HWgYeqwnHrYG7TfwDRUADsUbCQI6qDwIeerN56Ul8kd
         tY4IbABoRBvj3uz3y+nv/aywHSQofAPfLtEBvR+abZAq25mu54xpXm+cMKJDP6xGF8YV
         f/c8vQijutD8DrNzrqnqoCJA8VGgD69fTFQ2y/w6njrjeaSyb3TdbGDm/9Zk3gbsGnt2
         IFTg==
X-Gm-Message-State: APjAAAU5KM14KMnCqDxZNbuuWHW/KxqV80t+NrPdsI7qDTcnLNuGeRLZ
        4XKjBaDytnLxF+xMFKc7ZT0t8mu3
X-Google-Smtp-Source: APXvYqwD+m+tE9hNINU7r7t60XQOD/JnvvTaW1ZjdRq09KOiAvETtwFYY24f0+mqZzmGWOnVu8VbvA==
X-Received: by 2002:aa7:dc48:: with SMTP id g8mr2368186edu.208.1578437579709;
        Tue, 07 Jan 2020 14:52:59 -0800 (PST)
Received: from [10.67.50.41] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id md13sm24104ejb.85.2020.01.07.14.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 14:52:59 -0800 (PST)
Subject: Re: [PATCH 2/2] ata: brcm: fix reset controller API usage
To:     Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200107221506.2731280-1-arnd@arndb.de>
 <20200107221506.2731280-2-arnd@arndb.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 G10n8gCguORqNGMsVRxrlLs7/himep7MrCc=
Message-ID: <6fb53662-ebdb-55de-c470-0aa1c447bbd0@gmail.com>
Date:   Tue, 7 Jan 2020 14:52:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200107221506.2731280-2-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 1/7/20 2:15 PM, Arnd Bergmann wrote:
> While fixing another issue in this driver I noticed it uses
> IS_ERR_OR_NULL(), which is almost always a mistake.
> 
> Change the driver to use the proper devm_reset_control_get_optional()
> interface instead and remove the checks except for the one that
> checks for a failure in that function.
> 
> Fixes: 2b2c47d9e1fe ("ata: ahci_brcm: Allow optional reset controller to be used")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

This is nearly equivalent to:

https://lore.kernel.org/lkml/20200107183022.26224-2-f.fainelli@gmail.com/

which was just submitted this morning. Thanks!

> ---
>  drivers/ata/ahci_brcm.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
> index 239333d11b88..7ac1141c6ad0 100644
> --- a/drivers/ata/ahci_brcm.c
> +++ b/drivers/ata/ahci_brcm.c
> @@ -352,8 +352,7 @@ static int brcm_ahci_suspend(struct device *dev)
>  	else
>  		ret = 0;
>  
> -	if (!IS_ERR_OR_NULL(priv->rcdev))
> -		reset_control_assert(priv->rcdev);
> +	reset_control_assert(priv->rcdev);
>  
>  	return ret;
>  }
> @@ -365,8 +364,7 @@ static int __maybe_unused brcm_ahci_resume(struct device *dev)
>  	struct brcm_ahci_priv *priv = hpriv->plat_data;
>  	int ret = 0;
>  
> -	if (!IS_ERR_OR_NULL(priv->rcdev))
> -		ret = reset_control_deassert(priv->rcdev);
> +	ret = reset_control_deassert(priv->rcdev);
>  	if (ret)
>  		return ret;
>  
> @@ -454,9 +452,11 @@ static int brcm_ahci_probe(struct platform_device *pdev)
>  	else
>  		reset_name = "ahci";
>  
> -	priv->rcdev = devm_reset_control_get(&pdev->dev, reset_name);
> -	if (!IS_ERR_OR_NULL(priv->rcdev))
> -		reset_control_deassert(priv->rcdev);
> +	priv->rcdev = devm_reset_control_get_optional(&pdev->dev, reset_name);
> +	if (IS_ERR(priv->rcdev))
> +		return PTR_ERR(priv->rcdev);
> +
> +	reset_control_deassert(priv->rcdev);
>  
>  	hpriv = ahci_platform_get_resources(pdev, 0);
>  	if (IS_ERR(hpriv)) {
> @@ -520,8 +520,7 @@ static int brcm_ahci_probe(struct platform_device *pdev)
>  out_disable_clks:
>  	ahci_platform_disable_clks(hpriv);
>  out_reset:
> -	if (!IS_ERR_OR_NULL(priv->rcdev))
> -		reset_control_assert(priv->rcdev);
> +	reset_control_assert(priv->rcdev);
>  	return ret;
>  }
>  
> 


-- 
Florian
