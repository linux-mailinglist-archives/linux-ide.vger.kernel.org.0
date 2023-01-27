Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A303167E688
	for <lists+linux-ide@lfdr.de>; Fri, 27 Jan 2023 14:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234670AbjA0NYH (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 27 Jan 2023 08:24:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234149AbjA0NYF (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 27 Jan 2023 08:24:05 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384317DBE1
        for <linux-ide@vger.kernel.org>; Fri, 27 Jan 2023 05:24:04 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-4c24993965eso66194807b3.12
        for <linux-ide@vger.kernel.org>; Fri, 27 Jan 2023 05:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LZZ3MuEVu6XkQPyGITmSKOdfGu07b5+34vXdaMUVpmM=;
        b=UAHrFOhuENO8p4X6jjmFs9KrdLnh1L5ioIcN1vRBhDE992xV4cddAO0IjROU44dIG/
         nalP7afFVUtdPnm8JH4xghgm1GM/q5GOZS2kC5Yd9GXI9Z7PktEengh3fovMoq+zsVVE
         t0IPxp6dqeh897/z5G46UH91FQqy4WJQU8D3SIuIya0S9WZHfZk2C5Y30r2S827bu9eD
         CJLrDr1gIIxiC13d3vWqjY/9ZHwEpUdCVVNQAD/k++s1nG+mBWETZdTm2h8dtkZQWFeu
         swJGEwBP9C1DSuiQ188wLhYmsd5xFXheW++Lnq9ZpWPRKwvE/hZ2po1OCXDHo+L7t9nf
         jzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZZ3MuEVu6XkQPyGITmSKOdfGu07b5+34vXdaMUVpmM=;
        b=FYEMq0uMMIiBeCy/fH1rRbVufdtkKUTxkmnbo4qFixJUTyGJlZeF716VHRAr4Ux+ly
         GTsQdQmP5xi+fBGxgsNL140Os1LLUTqeOwDGSWYwc8y5C4Gw4tp0s9gh+FMDXtfvnNvM
         1pOLndDzZiAlJ4l+1iiUrgaR1YRFfNOo6vQrJYBKcc9YAx1nUZkaTEmXowuGz8Yrvb3/
         jld2RRq2ChC4eZgNq0XemhTcoPnk+2ah9UEZVqi8Om8rAiYcz16HCZbymFc2T5qe6PcU
         VcmtSBf5yriSq9lP+wUYhtcdvoD82HGx/srKuxY48ACwMN0LuLnqb4ZjlyyM0+HarsRC
         uJqA==
X-Gm-Message-State: AFqh2kro2gMpvN6onOWFFcf5+ACHRwYGUPiVx1Al9ITFn2cSQ7/pvNah
        /JANXgkJnChSSQlqdW9kmM2SlpcX1coUtL55d5AMuA==
X-Google-Smtp-Source: AMrXdXsM2Y+feqWmDnpZZfAnDgXVYRK43870GInPFgNTT7qpRIbR4qPNx7T9fr58byEQonupKGetuGN9HSWpF17Olo4=
X-Received: by 2002:a05:690c:39b:b0:4f3:8d0e:edce with SMTP id
 bh27-20020a05690c039b00b004f38d0eedcemr3538984ywb.185.1674825843435; Fri, 27
 Jan 2023 05:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org> <20230127093217.60818-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127093217.60818-2-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 14:23:51 +0100
Message-ID: <CACRpkdabA03VEFFVDVDiEVnLDZXGmW-kyCpD8iRVOcBzNBTfkw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: intel,ixp4xx-expansion-bus: split out
 peripheral properties
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linusw@kernel.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Marek Vasut <marex@denx.de>, Lubomir Rintel <lkundrak@v3.sk>,
        - <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Fri, Jan 27, 2023 at 10:32 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The properties of devices in IXP4xx expansion bus need to be also
> applied to actual devices' bindings.  Prepare for this by splitting them
> to separate intel,ixp4xx-expansion-peripheral-props binding, just like
> other memory-controller peripheral properties.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Whoa, this is a complex one!
But I assume you and Marek know what you're doing so:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Maybe I can assign the following external bus interface to the Qcom
people, as it is yet another one of those:
Documentation/devicetree/bindings/bus/qcom,ebi2.txt

I've been uncertain about how I should convert that one over properly.

Yours,
Linus Walleij
