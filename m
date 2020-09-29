Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE1D27CFA3
	for <lists+linux-ide@lfdr.de>; Tue, 29 Sep 2020 15:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730906AbgI2Nmx (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 29 Sep 2020 09:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730870AbgI2Nmw (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 29 Sep 2020 09:42:52 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37009C0613D3
        for <linux-ide@vger.kernel.org>; Tue, 29 Sep 2020 06:42:52 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id a2so4425333otr.11
        for <linux-ide@vger.kernel.org>; Tue, 29 Sep 2020 06:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7Re7sYUHoP/OO8RJy6m0dCE8FjQyDvN9idLxneZjSGs=;
        b=Z34rZ/ds72mfUVTwVAO13Bpz4khcxmzLmZRTJ6BeCzZVGwvFQBFtfTqV+Mw0LWRYNM
         uCrAI5JhrSTo6VZxNGORq4+uDlbuWvNn0BzZwcj+1vO5F++bvuicz0Q+A30JgXV/f7rA
         Rk9jpCrpw+utP3CvREty99qb9cv8smpJnWoLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7Re7sYUHoP/OO8RJy6m0dCE8FjQyDvN9idLxneZjSGs=;
        b=W55wKVmpQuUw+H1csqGWXtgDJkIr6q+YRR/4n2Sd5XcMfTr63PG/egyagpJEKSzzrM
         8WW9n93cq/KKZEH3TiRiWU1xSu5esH3X5nByBUnEbSiS1rVj3RvY8jm/3JGzzLIyG6XP
         vu8ZK7oZRyA7+YxiIzdd1kRMnVFAZZX8dVtURNtaF/yhoEdILnbgGwV9XonfpPgy9+R2
         y1d3sUAy04s51ucBtpe0C8rBp6u7wKvHNnZtUjeooVwx5BJexY9fkppdVHHXkfASa/SP
         vLvdkbhZBhYKGaLfXT9iZf4mDCfLkgoVLpZMHhJwIuAcyYSe9GsZOlNZ4yahLGa8Pptv
         K1eQ==
X-Gm-Message-State: AOAM532iy867rgqkAPzcH6lIpR3pJR1zVhqs3rkU8+ynzavz+SP5Ltt7
        koQKLy+HYiGx3+nmER93P5SHe9dcZMjY5A==
X-Google-Smtp-Source: ABdhPJxomgEcCkXHcyd2u2LBzXalo3/5KY6BNqNVB1FRlJIPPq8bhwRXFJ9dfNYvva75m6zRbuIoZQ==
X-Received: by 2002:a05:6830:196:: with SMTP id q22mr2688536ota.221.1601386971432;
        Tue, 29 Sep 2020 06:42:51 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id l4sm993642oie.25.2020.09.29.06.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 06:42:50 -0700 (PDT)
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate
 statements
To:     Joe Perches <joe@perches.com>,
        Julia Lawall <julia.lawall@inria.fr>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     Ard Biesheuvel <ardb@kernel.org>, linux-iio@vger.kernel.org,
        drbd-dev@tron.linbit.com,
        =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>,
        David Lechner <david@lechnology.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-wireless@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        linux-amlogic@lists.infradead.org,
        Thomas Gleixner <tglx@linutronix.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        openipmi-developer@lists.sourceforge.net,
        linux-clk@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <CAMj1kXGh+CzuXkAnqsoMO2A3T1p=D6uFOV347Ym5+VFn5U1gWg@mail.gmail.com>
 <20200929124108.GY4282@kadam>
 <alpine.DEB.2.22.394.2009291445050.2808@hadrien>
 <5f0d2b20f5088281363bb4a35c5652a2c087f159.camel@perches.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <cd75e2d1-9923-b725-78cd-fd5611431584@linuxfoundation.org>
Date:   Tue, 29 Sep 2020 07:42:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5f0d2b20f5088281363bb4a35c5652a2c087f159.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 9/29/20 7:34 AM, Joe Perches wrote:
> On Tue, 2020-09-29 at 14:47 +0200, Julia Lawall wrote:
>> On Tue, 29 Sep 2020, Dan Carpenter wrote:
>>> The times where commas are used deliberately to replace curly braces are
>>> just evil.  Either way the code is cleaner with semi-colons.
>>
>> I also found exaamples like the following to be particularly unforunate:
>>
>>                                  fprintf(stderr,
>>                                          "page_nr %lu wrong count %Lu %Lu\n",
>>                                         page_nr, count,
>>                                         count_verify[page_nr]), exit(1);
>>
>> The exit is very hard to see, unless you know to look for it.
> 
> I sent that patch last month.
> https://patchwork.kernel.org/patch/11734877/
> 

I see what happened. This patch touches lib, cpupower, and selftests.
Guess lost in the limbo of who takes it.

  tools/lib/subcmd/help.c                    |  10 +-
  tools/power/cpupower/utils/cpufreq-set.c   |  14 +-
  tools/testing/selftests/vm/gup_benchmark.c |  18 +-
  tools/testing/selftests/vm/userfaultfd.c   | 296 +++++++++++++--------
  4 files changed, 210 insertions(+), 128 deletions(-)

I can take it through one of my trees.

thanks,
-- Shuah
