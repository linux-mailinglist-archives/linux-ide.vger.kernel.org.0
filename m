Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25B17132D3B
	for <lists+linux-ide@lfdr.de>; Tue,  7 Jan 2020 18:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbgAGRkI (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 7 Jan 2020 12:40:08 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41400 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728266AbgAGRkI (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 7 Jan 2020 12:40:08 -0500
Received: by mail-ed1-f67.google.com with SMTP id c26so270574eds.8;
        Tue, 07 Jan 2020 09:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q/XjvGExh5kLeeoJHCJo1qE8Keasv8mIWhYK04sJ8bA=;
        b=Drs/vaMoaWXtgf1Gv9M0DYZzfJwHNTdv5lmktFEJIZOWC8hteMqyFAEAGceVirtz/1
         uuVzePJN0YGIztVIh8vU6Zxo2zko1rsjw/Pg5FXcIx9AF0Hp1AFTsdDyGf/2nqCwNNRO
         iknNMHAzM9wLFtRgeaBJDp8I/MuQdpcMIVbZIRZSkfe60i4m/U2uKRaPbsdHVS6qP57Y
         2i1Tv2X/n093w4RqEvAl94QVIq3zKocJSZtoJH4i0O9eNVDWN0VGGSX1dDhTEDghL9pw
         12Y5dwgStS8UA77lni3ahb/+FAPg/te9yUBBrnqVfNvkvLU0c02LLZ7SOuaIzhbHQfS9
         gihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Q/XjvGExh5kLeeoJHCJo1qE8Keasv8mIWhYK04sJ8bA=;
        b=f4MkoLMtVBeErNPVVW4lCaOm6F4N51usfNU01VZixzinfopHNDoL1VXEde8Ks8CySR
         ld6uIwAewPH453I8hJMidw8PuwpmSH+IyZlrSTn9tbz4WF8Kh9uC97wFOWDRl4d1629E
         hMIV/tgTBoKr6Mwjnc3JW8JJphvyrppuAkCn0Jd3pO9zncg62KxV3MGK3kpjanhHLS6j
         NM8RdRo0JPcVruf+gU6COOAxwJ8u0TZ+uKtmaeWLOWZhgHGM/fUfgj6A1NKpbmT9naHi
         2isOYFbi2nXNJzEkNTydpKGekbdxKnZ++XFpYJJb8Wt20U8c9dWG2ix4yCpN4pHxARJ5
         Dl6A==
X-Gm-Message-State: APjAAAXY44TDP8ScCqz5zv+Fcvd4uqGJNzpuKv97/FBzX8pma/EZJH7+
        osf33Unh5Vn0Dy3ikEmHH7aI8dwW
X-Google-Smtp-Source: APXvYqwm6PcQzDRwBzpLV6BH8t8w+IKacW4Jh88bx0LCQFArMUO9HoElW9lrZ0aq8FcLnEWbRzWG+Q==
X-Received: by 2002:aa7:df89:: with SMTP id b9mr1022722edy.99.1578418804437;
        Tue, 07 Jan 2020 09:40:04 -0800 (PST)
Received: from [10.67.50.41] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id k26sm13806edv.13.2020.01.07.09.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 09:40:03 -0800 (PST)
Subject: Re: [PATCH 0/8] ata: ahci_brcm: Fixes and new device support
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Tejun Heo <tj@kernel.org>, Jaedon Shin <jaedon.shin@gmail.com>,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux- stable <stable@vger.kernel.org>
References: <20191210185351.14825-1-f.fainelli@gmail.com>
 <CA+G9fYsMyUWGo8Qtd2UCfYDV2aoH71=hCZKaTurq4Aj2eeZczw@mail.gmail.com>
 <CA+G9fYvmwetcZPraZrHbj=MjgWZik-wFK7nEejs-6TrYyODcSg@mail.gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 G10n8gCguORqNGMsVRxrlLs7/himep7MrCc=
Message-ID: <f2867b48-7ee3-4545-5d3e-19622120be4c@gmail.com>
Date:   Tue, 7 Jan 2020 09:39:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CA+G9fYvmwetcZPraZrHbj=MjgWZik-wFK7nEejs-6TrYyODcSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 1/7/20 9:29 AM, Naresh Kamboju wrote:
> On Tue, 7 Jan 2020 at 22:17, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>
>> On Wed, 11 Dec 2019 at 00:25, Florian Fainelli <f.fainelli@gmail.com> wrote:
>>>
>>> Hi Jens,
>>>
>>> The first 4 patches are fixes and should ideally be queued up/picked up
>>> by stable. The last 4 patches add support for BCM7216 which is one of
>>> our latest devices supported by this driver.
>>>
>>> Patch #2 does a few things, but it was pretty badly broken before and it
>>> is hard not to fix all call sites (probe, suspend, resume) in one shot.
>>>
>>> Please let me know if you have any comments.
>>>
>>> Thanks!
>>>
>>> Florian Fainelli (8):
>>>   ata: libahci_platform: Export again ahci_platform_<en/dis>able_phys()
>>>   ata: ahci_brcm: Fix AHCI resources management
>>
>> Following error on stable-rc 4.14 and 4.9 branch for arm build.
> 
> Following error on stable-rc 4.19, 4.14 and 4.9 branch for arm build.
> 
>>
>>  drivers/ata/ahci_brcm.c: In function 'brcm_ahci_probe':
>>  drivers/ata/ahci_brcm.c:412:28: error: 'struct brcm_ahci_priv' has no
>> member named 'rcdev'; did you mean 'dev'?
>>    if (!IS_ERR_OR_NULL(priv->rcdev))
>>                              ^~~~~
>>                              dev
>>    CC      fs/pnode.o
>>    CC      block/genhd.o
>>  drivers/ata/ahci_brcm.c:413:3: error: implicit declaration of
>> function 'reset_control_assert'; did you mean 'ahci_reset_controller'?
>> [-Werror=implicit-function-declaration]
>>     reset_control_assert(priv->rcdev);
>>     ^~~~~~~~~~~~~~~~~~~~
>>     ahci_reset_controller
>>  drivers/ata/ahci_brcm.c:413:30: error: 'struct brcm_ahci_priv' has no
>> member named 'rcdev'; did you mean 'dev'?
>>     reset_control_assert(priv->rcdev);
>>                                ^~~~~
>>                                dev
>>  cc1: some warnings being treated as errors
>>
>> Full build log links,
>> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-stable-rc-4.14/DISTRO=lkft,MACHINE=am57xx-evm,label=docker-lkft/702/consoleText
>> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-stable-rc-4.9/DISTRO=lkft,MACHINE=am57xx-evm,label=docker-lkft/773/consoleText
> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-stable-rc-4.19/DISTRO=lkft,MACHINE=am57xx-evm,label=docker-lkft/404/consoleText

The reset controller support was added in
2b2c47d9e1fe90311b725125d6252a859ee87a79 ("ata: ahci_brcm: Allow
optional reset controller to be used") which was include in v4.20 and
newer so that explains the build failure.

You may want to cherry pick that change into the respective stable
branches and then back port the fixes if that is not too much trouble.
If that does not work or is impractical, please let me know and I can
provide directed backport changes for 4.9, 4.14 and 4.19.

Thank you
-- 
Florian
