Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1C472BA72
	for <lists+linux-ide@lfdr.de>; Mon, 12 Jun 2023 10:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbjFLI0u (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 12 Jun 2023 04:26:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233651AbjFLIZc (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 12 Jun 2023 04:25:32 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F92A3C07
        for <linux-ide@vger.kernel.org>; Mon, 12 Jun 2023 01:24:41 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso7281674a12.0
        for <linux-ide@vger.kernel.org>; Mon, 12 Jun 2023 01:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686558279; x=1689150279;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7D6Fyjiom4mYpRNDGxmJ+4tkPJWamSoxinWl7N6B39g=;
        b=VMvW2ldCRLA4FS6P7F+8G3PCEY0tb7Iu8cL59lJycrVCfw/5IYyNMSAqeVLQJnkT1G
         niO9MMRSIz9o/yvfgmeKs7p5YCLZgp+AzSJxMWpW0IHxChy4pV3Jma4m2pLJOcuZAiUc
         HZLai9VZSbkQTVz43k8xCehT/XQM9QjZEtPMJXpiy1YQCdyrwRz2QS3qUSP+B1F73anB
         rxhJN47WVWZJDttOgsyYqw5ZQdnRJwz2mqUpyO4OyJNeMrJd0lD5GPHguucrtX40VJie
         YpYmWj1F+iIHE+uQF9uCofEhvLvc64D0CIiivNtxVpSKLcgB3RJcnJbtvTmLHP+VWmHU
         eQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686558279; x=1689150279;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7D6Fyjiom4mYpRNDGxmJ+4tkPJWamSoxinWl7N6B39g=;
        b=AI9ds343p5UxLhiBUIZ3T8tNoTcL7OovEqwiG+zxDusmLmlPtI+tZTDAVGr1NPl2Q+
         5X13RoLZB8obs9E3547wFi/pN/3Hvxly8LfB10GrVDeCvpi8pWeRXEqSMr+PHYYIKH7h
         E0JFdCyLfarC0DHHeQ14ATnBGElhhpAV4+5agbI2mU/tVHaVwe9axQybaB/rTFO8CGPw
         XAlC3IH0JkvmGBRYPEkZRNiyyj3rKxTsPSuToQftS8rVDEhM6bclCxjw3N4I9AxBG5M8
         2N3M7Rj9fC20HVSZIBmmJN03ZykfL1gtcmcnKa7Hsdvfy4tImx2R69cHqHul6vq99dv0
         PSTA==
X-Gm-Message-State: AC+VfDxxgwDIUFQHkcJeYpsBrPD9deQJVp+pEo9VuVRLe2N2JDRyA9k2
        bKIZQPww61hwUoPhS2+fon8h4A==
X-Google-Smtp-Source: ACHHUZ4fZFtU0nuw4O03Q2YBjYiPLMxR/evqGLuCK0fv5OjI6AlCOdT/nQI4kM3M9h2oNHciSBdreA==
X-Received: by 2002:a17:907:1c1f:b0:982:21a1:c4e0 with SMTP id nc31-20020a1709071c1f00b0098221a1c4e0mr1221846ejc.56.1686558279550;
        Mon, 12 Jun 2023 01:24:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id i25-20020a1709063c5900b0097899aa737esm4956590ejg.147.2023.06.12.01.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 01:24:39 -0700 (PDT)
Message-ID: <e132676c-af02-4309-dbef-f1cad2157253@linaro.org>
Date:   Mon, 12 Jun 2023 10:24:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 3/5] dt-bindings: phy: rockchip: rk3588 has two reset
 lines
Content-Language: en-US
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-ide@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20230608162238.50078-1-sebastian.reichel@collabora.com>
 <20230608162238.50078-4-sebastian.reichel@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608162238.50078-4-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 08/06/2023 18:22, Sebastian Reichel wrote:
> The RK3588 has two reset lines for the combphy. One for the
> APB interface and one for the actual PHY.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

