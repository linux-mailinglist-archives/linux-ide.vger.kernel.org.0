Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4FC132EA8
	for <lists+linux-ide@lfdr.de>; Tue,  7 Jan 2020 19:47:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbgAGSrX (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 7 Jan 2020 13:47:23 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:20710 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728358AbgAGSrX (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 7 Jan 2020 13:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578422842;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/8Zg9nxAOoXcvew8mYe1pYf5ie2kAu84kdP/XsWGT2E=;
        b=evL9Ec0jCdrYkz/wiUpctRTYm4sHGbiR6ISoe7gGguchU1pM6TbZshjU7YmuTYWbTz5iPE
        voW0xPjbQ3icBr7tLLZ4jiPf4H+Rrvi/AJVyQ5oEhTqsfZ2jdoMFIWyvAGng9fEp7b/Wf1
        p5l5VMLRiR5lkNECfiblm2sK6mGLljQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-QdZiL7H0MPmVMujlrkZauQ-1; Tue, 07 Jan 2020 13:47:21 -0500
X-MC-Unique: QdZiL7H0MPmVMujlrkZauQ-1
Received: by mail-wr1-f69.google.com with SMTP id i9so334032wru.1
        for <linux-ide@vger.kernel.org>; Tue, 07 Jan 2020 10:47:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/8Zg9nxAOoXcvew8mYe1pYf5ie2kAu84kdP/XsWGT2E=;
        b=o5SH3HuCGtIvUExJvON2Oleg70cD9+R8xEdJ3TYqkxt5Y3m8SEUrqwaCd9xz6lceln
         tjTSEX3CXJl62mel7081q49xN28phrLdo8D792qWnfSh0rIZFeyh8JuJ1wJ03wffJidq
         ZMfRbsr6Koqnw7u5TeZkWPUuBcSM7scKAexCIbeMtLmspvy+Zo6/8ypfkWJbl53jPwVL
         rU2LzzUACCqlSsnPZqUUgHNRFZoGeZn1Nd7wO2RQuINkvrP8pMzAVeKcOnlI/92zoxMe
         lQ4p2zUGFbDKz6WX8F8yYMEumS5BmZpo6GWYqPtTJZPIzjJmsLk237LBP93Y+vDymky5
         un1Q==
X-Gm-Message-State: APjAAAVbpYwUhgQZ8D4Z6+RHY0Nb/ca7aMD7It90LhT/CYmsFCKLQ2oW
        GYC9urD4FhFm0/+6anCSh7T5V2+yQ+nWjzz1WXcRKGFRYnMGp2cD14QjLn+LuF7++uQNMGSEr1w
        0mXCdxDOUJXjhvBgHqUYw
X-Received: by 2002:a1c:9acf:: with SMTP id c198mr374951wme.175.1578422840006;
        Tue, 07 Jan 2020 10:47:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyS3CiETVxrLdyEhHA7cbzJ+/9zPZi9ioE/EmeP9k2qsD3wfuMIgZsc4+ZCakmbQ2rVRvEZ3w==
X-Received: by 2002:a1c:9acf:: with SMTP id c198mr374926wme.175.1578422839831;
        Tue, 07 Jan 2020 10:47:19 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id p17sm956544wrx.20.2020.01.07.10.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 10:47:19 -0800 (PST)
Subject: Re: [PATCH v3 0/3] ata: ahci_brcm: Follow-up changes for BCM7216
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     bcm-kernel-feedback-list@broadcom.com,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Tejun Heo <tj@kernel.org>, Jaedon Shin <jaedon.shin@gmail.com>,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20200107183022.26224-1-f.fainelli@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <92eeb7d0-5e96-b0b6-38db-a22d4862d6dd@redhat.com>
Date:   Tue, 7 Jan 2020 19:47:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200107183022.26224-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi,

On 07-01-2020 19:30, Florian Fainelli wrote:
> Hi Jens, Philipp,
> 
> These three patches are a follow-up to my previous series titled: ata:
> ahci_brcm: Fixes and new device support.
> 
> After submitting the BCM7216 RESCAL reset driver, Philipp the reset
> controller maintained indicated that the reset line should be self
> de-asserting and so reset_control_reset() should be used instead.
> 
> These three patches update the driver in that regard. It would be great if
> you could apply those and get them queued up for 5.6 since they are
> directly related to the previous series.
> 
> Changes in v3:
> - introduced a preliminary patch making use of the proper reset control
>    API in order to manage the optional reset controller line
> - updated patches after introducing that preliminary patch
> 
> Changes in v2:
> - updated error path after moving the reset line control

Series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> 
> Thanks!
> 
> Florian Fainelli (3):
>    ata: ahci_brcm: Correct reset control API usage
>    ata: ahci_brcm: Perform reset after obtaining resources
>    ata: ahci_brcm: BCM7216 reset is self de-asserting
> 
>   drivers/ata/ahci_brcm.c | 42 +++++++++++++++++++++++++----------------
>   1 file changed, 26 insertions(+), 16 deletions(-)
> 

