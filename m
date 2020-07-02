Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC132211FF3
	for <lists+linux-ide@lfdr.de>; Thu,  2 Jul 2020 11:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgGBJck (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 2 Jul 2020 05:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbgGBJcj (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 2 Jul 2020 05:32:39 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B10C08C5DC
        for <linux-ide@vger.kernel.org>; Thu,  2 Jul 2020 02:32:39 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id t74so15633970lff.2
        for <linux-ide@vger.kernel.org>; Thu, 02 Jul 2020 02:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xJrKLxFtP5i0UcBKdy1GE3OwCPtszmxth6t90XmZnto=;
        b=ttsbcsBM5d2wN8N8MSUThSKYEGVc38uTg8irCxPOwLP4CvC/gHlh1tG9aCaoBfbZw4
         IOQAX05Te7L+tizZj+ie5VK7Qd2ZjTGvTjvv7dMiqV2GaBUPod/Y4tuvkc1GwxxympXT
         lS8buFCZstgSTqLb1RMCAp7j2dBLVMrGQ77D07mL5uAAtHxQXffy/djWidzjB/sQjuHQ
         6+tm0tSr2tz3lk3WU+8rqPPxMxLjw4FJFJ4bvbVdjahirxkBg3+5/Pl+frfX37RvHNAq
         UAE4kX+tqvxhEBjtfeulVqlABddC61Qsrzmm9DY4f9+UH+rs6h2gw0E8xco5BNsH9Reu
         Ad8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xJrKLxFtP5i0UcBKdy1GE3OwCPtszmxth6t90XmZnto=;
        b=QBmpWGusfdi/ZYY8a3NrFVnX07r3ou0wnLemm0ce04+pjAQqQmok/dq5Oy84dtqjm0
         bcvFUMOpYY6JcYNLrlk2QOMICSpRAzfYaA8QNDUntkfG/XL6ZNqVIxyiryaoIgn1eKei
         heKkPvxS6SPZYAHCibKX9OX8pqIF5XONrKc9J8pyXvrRT8NaQuc24d5je/mGJQMpD0K9
         dHFb7cdTf+lKbK0ZkDg9kPhnJYGeUdKs5OQEdUN0dSKX4NhR7ue69QDmxFbLsOCUd5Xj
         X5RzlNRS1DYkU717IjGJLgHA1N1OgSJJ8rQOE9H6gpJbRtJIGL11e58Ri02viyhF0c9o
         Pwmw==
X-Gm-Message-State: AOAM532y/m7USGjCmyAJx1DjNlvghfOZt1IhFjLrf3Iilrb1nDZIx18D
        s5qeYVsFzB9tO9XPDZoui7frdWjqUzSBCg==
X-Google-Smtp-Source: ABdhPJwIdcIQafdt42QlqVEBIRfGHC/lMgIxRDNqG0gS0fWBMzgvsIzfjrTdGE2q5x8myUi8sR6DeQ==
X-Received: by 2002:a19:6a14:: with SMTP id u20mr16782739lfu.172.1593682357797;
        Thu, 02 Jul 2020 02:32:37 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:461b:f1c2:55ed:4719:4c47:712d? ([2a00:1fa0:461b:f1c2:55ed:4719:4c47:712d])
        by smtp.gmail.com with ESMTPSA id y12sm2767034ljh.79.2020.07.02.02.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2020 02:32:37 -0700 (PDT)
Subject: Re: [PATCH v6 02/12] ata: ahci_brcm: Fix use of BCM7216 reset
 controller
To:     Jim Quinlan <james.quinlan@broadcom.com>,
        linux-pci@vger.kernel.org,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        bcm-kernel-feedback-list@broadcom.com
Cc:     Jens Axboe <axboe@kernel.dk>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200701212155.37830-1-james.quinlan@broadcom.com>
 <20200701212155.37830-3-james.quinlan@broadcom.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <968d6802-b30e-b618-1dd5-1b1a5ba6548a@cogentembedded.com>
Date:   Thu, 2 Jul 2020 12:32:24 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200701212155.37830-3-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hello!

On 02.07.2020 0:21, Jim Quinlan wrote:

> From: Jim Quinlan <jquinlan@broadcom.com>
> 
> A reset controller "rescal" is shared between the AHCI driver and the PCIe
> driver for the BrcmSTB 7216 chip.  Use
> devm_reset_control_get_optional_shared control() to handle this sharing.

    Not "devm_reset_control_get_optional_shared() control"?

> 
> Signed-off-by: Jim Quinlan <jquinlan@broadcom.com>
> 
> Fixes: 272ecd60a636 ("ata: ahci_brcm: BCM7216 reset is self de-asserting")
> Fixes: c345ec6a50e9 ("ata: ahci_brcm: Support BCM7216 reset controller name")
> ---
>   drivers/ata/ahci_brcm.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
> index 6853dbb4131d..d6115bc04b09 100644
> --- a/drivers/ata/ahci_brcm.c
> +++ b/drivers/ata/ahci_brcm.c
[...]
> @@ -452,11 +451,10 @@ static int brcm_ahci_probe(struct platform_device *pdev)
>   
>   	/* Reset is optional depending on platform and named differently */
>   	if (priv->version == BRCM_SATA_BCM7216)
> -		reset_name = "rescal";
> +		priv->rcdev = devm_reset_control_get_optional_shared(&pdev->dev, "rescal");
>   	else
> -		reset_name = "ahci";
> +		priv->rcdev = devm_reset_control_get_optional(&pdev->dev, "ahci");
>   
> -	priv->rcdev = devm_reset_control_get_optional(&pdev->dev, reset_name);
>   	if (IS_ERR(priv->rcdev))
>   		return PTR_ERR(priv->rcdev);
>   
[...]

MBR, Sergei
