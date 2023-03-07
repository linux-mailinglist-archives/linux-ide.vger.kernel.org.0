Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0246AE567
	for <lists+linux-ide@lfdr.de>; Tue,  7 Mar 2023 16:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbjCGPwp (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 7 Mar 2023 10:52:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjCGPwm (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 7 Mar 2023 10:52:42 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A34F88C810
        for <linux-ide@vger.kernel.org>; Tue,  7 Mar 2023 07:52:30 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id ay14so50409092edb.11
        for <linux-ide@vger.kernel.org>; Tue, 07 Mar 2023 07:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678204349;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xrd6qK7hMyHVwtg6Pun3WvLwqeCKfsvJclD5mLFXwgY=;
        b=DT+doUYLM/jXsxmjyKKOg8UL7zJewGuXgq2bX0DaONfvjSYO6V59A1RbU6nJpJKW06
         I2r9Sr0iACpzAZ/KUtBeXz4nAczbUrWkHKXZjP5i8iik7quNyIqBaRBWqixvUeiXPD75
         TeiRxNXcYkD8joeqd3zCjxEP355Fs0p6XnKnwK7U5UphHvBY2D8a9DebVS/iFaiTkSLG
         PWphGCEOPu6Ii1eC1ysu04WzKrU9R/O8VZEnwDWnlw/LEsJi6SKkPUFOKnac9q3mu2v8
         F0byB5NjFIE2eiK/VhTAAzLXgvUzLZyXLnEhGmnZD2P81CPmd//O9L9XMS2UW2iwH6yf
         ybgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678204349;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xrd6qK7hMyHVwtg6Pun3WvLwqeCKfsvJclD5mLFXwgY=;
        b=rc6BUuDTpounnzUv8aK1IjRmKXLIIB/ihtQBAoULCQ/HDzvgvjE1pFjGQ3fc0G9e+/
         uvfV5jDnX13UCONXRlrHc1gow34oku/3WUNjpOhnJ7tdJJJYtKBS4iZm0yM48qEpRx4M
         EKjgjY4K++5KRNnQ/J9j3XCKT3lUAX6y1dyebfjEKV1vwLIEytRcX1/y5D3B4x3XYBtL
         1f3O4tU2j6OsSzJW9KTo1Y5F6NMHcBZEFEWU4zDIsb2nYjow+WXKjqETvsUudK3dB1w2
         OfgSn38iqhibSYsURzhIeLLxEpKVWhFagsNhUhbm9y05by42iGrCbawf8cBE9vMXWWWH
         jgnw==
X-Gm-Message-State: AO0yUKXt87/25yRUs/1Yzg7CwPC8BKNx8pJjLfuoXFv1lUzpMXd4Cvrp
        jJr0q4C4JT1khoThljrp3cWG9A==
X-Google-Smtp-Source: AK7set8m7oRQ+cAgTtvL5dosF9lC6h3uel75c14Jj9kdll6P9IGXf5r7bqsGtYrW2I6xrGn1yure9Q==
X-Received: by 2002:a17:907:1ca3:b0:8ea:2055:4f1b with SMTP id nb35-20020a1709071ca300b008ea20554f1bmr18866802ejc.24.1678204349112;
        Tue, 07 Mar 2023 07:52:29 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:a60f:e604:c252:1f3d? ([2a02:810d:15c0:828:a60f:e604:c252:1f3d])
        by smtp.gmail.com with ESMTPSA id ib21-20020a1709072c7500b008cdb0628991sm6321506ejc.57.2023.03.07.07.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 07:52:28 -0800 (PST)
Message-ID: <bf6d6b20-8479-80f7-1899-d58e03e6c6c8@linaro.org>
Date:   Tue, 7 Mar 2023 16:52:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] dt-bindings: ata: Add UniPhier controller binding
Content-Language: en-US
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Jens Axboe <axboe@kernel.dk>
Cc:     linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230222155906.19403-1-hayashi.kunihiko@socionext.com>
 <9d36818f-3ce3-0fb6-1a3e-85e3879af08c@opensource.wdc.com>
 <a6425bde-5b6d-2fb2-2396-a35677b19e8f@linaro.org>
 <e5ed284a-77ac-df6d-1473-e4d96955f65b@opensource.wdc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e5ed284a-77ac-df6d-1473-e4d96955f65b@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 07/03/2023 11:42, Damien Le Moal wrote:
> On 3/7/23 17:13, Krzysztof Kozlowski wrote:
>> On 06/03/2023 02:22, Damien Le Moal wrote:
>>> On 2/23/23 00:59, Kunihiko Hayashi wrote:
>>>> Add UniPhier SATA controller compatible string to the platform binding.
>>>> This controller needs three reset controls for Pro4 SoC, or two reset
>>>> controls for PXs2 and PXs3 SoCs.
>>>>
>>>> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
>>>
>>> Rob,
>>>
>>> Are you OK with this patch ? I can take it for 6.4.
>>>
>>
>> You got Review (which includes also "Ack"), what are you missing here?
> 
> By the way, I am not seeing/have not received any Ack. Hence why I checked with Rob.

You were on Cc... Did I end up in spam?

Best regards,
Krzysztof

