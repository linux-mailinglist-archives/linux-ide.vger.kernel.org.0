Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3AE94D79C0
	for <lists+linux-ide@lfdr.de>; Mon, 14 Mar 2022 04:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236109AbiCNDux (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 13 Mar 2022 23:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236104AbiCNDuw (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 13 Mar 2022 23:50:52 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD053201AA
        for <linux-ide@vger.kernel.org>; Sun, 13 Mar 2022 20:49:43 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id m11-20020a17090a7f8b00b001beef6143a8so13234634pjl.4
        for <linux-ide@vger.kernel.org>; Sun, 13 Mar 2022 20:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Mrr28nJUCfgByHsWGp/lHeprSpd4BkVYd9lJAdXUu48=;
        b=FPB+lPM1wM0el3n1VYmlE5LDbRTs8sdcLP6rhLivQXbvVE/6OaSdvkuxVAWgW3GAS6
         mCMPT6yPPoLqUIWqzXKaXl49Jt30BLrmJOnguy7j+UnxbQTA0zSY4jNbIQh2b552WMCr
         BLspIouyPoT0BBBqWpQYuIb1WptiTqYoBJBCZtRSMdx6OIO33LoVdkbeOiVV2NUfmKcM
         rer+SutQKOCp+tKYwJ2sYviEeAxSgncvatqYsjAeLNOZsxgX3ubUvG6sbjPmA2rMvmLn
         RVlLSP1bvyDZLSkNDSC4so10uHrNNkh9L3S4BfBy8cytp3VvdbSBQIkc+FaPh13vvfRa
         R1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Mrr28nJUCfgByHsWGp/lHeprSpd4BkVYd9lJAdXUu48=;
        b=PWVsp0axHzwEwLdsyy/85/E3NtFs81n6vGi+CkVU9PMpM/VMj0o11SUtGKE3FGtbUu
         6VKfAr3QYM0JqDV1edrLnqhUgYXlL0KUQc3a+6KYLDph0N9Phr0Xy6E8+slfB/chAJBe
         WNLbtYzAXew75BUgoZzRYnFFZojvYNvyRBUr9wVJWLGGaxUtH5UB4QQt8eUqwselaOcn
         dI+uA+PDq6vhA4ncLvDPZc/CrpElBp+7dIZH3DbX90l2bIVCzN99k7M03Kp/Y9on3pS7
         h7x8kkvZss7K5RlI6NU6w493V575EWV+MbM1HxKU/C+/sW0BlmBjD/eRMaz8cYPfHkKB
         x2Ew==
X-Gm-Message-State: AOAM5335bNUuxLqZKoxVkIqEypYoR1aP6Sd8frDeqI4+7cgUd7VIDHii
        OT/KFxLo4N8Dknv05OtBrhzgSw==
X-Google-Smtp-Source: ABdhPJxrhB5eKmRl1RqT3UBbRYo79qSooHLNLaD7StOCwa5jF/tglcgSr1X0UJm/D49ONUYxaDhZEA==
X-Received: by 2002:a17:902:d486:b0:151:8e66:621c with SMTP id c6-20020a170902d48600b001518e66621cmr21648715plg.141.1647229783099;
        Sun, 13 Mar 2022 20:49:43 -0700 (PDT)
Received: from localhost ([223.184.83.228])
        by smtp.gmail.com with ESMTPSA id m12-20020a17090a414c00b001bf6d88870csm15733286pjg.55.2022.03.13.20.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 20:49:42 -0700 (PDT)
Date:   Mon, 14 Mar 2022 09:19:40 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Wunderlich <linux@fw-web.de>
Cc:     devicetree@vger.kernel.org,
        Frank Wunderlich <frank-w@public-files.de>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Heiko Stuebner <heiko@sntech.de>,
        Peter Geis <pgwipeout@gmail.com>,
        Michael Riesch <michael.riesch@wolfvision.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 3/6] ARM: dts: spear13xx: Fix sata node name
Message-ID: <20220314034940.rxkgue2kllnqhucp@vireshk-i7>
References: <20220311210357.222830-1-linux@fw-web.de>
 <20220311210357.222830-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311210357.222830-4-linux@fw-web.de>
User-Agent: NeoMutt/20180716-391-311a52
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 11-03-22, 22:03, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> After converting the binding to yaml the node name does
> not match the standard pattern, change it.
> 
> arch/arm/boot/dts/spear1340-evb.dt.yaml: ahci@b1000000:
> $nodename:0: 'ahci@b1000000' does not match '^sata(@.*)?$'
> 	From schema: Documentation/devicetree/bindings/ata/ahci-platform.yaml
> 
> Fixes: 07658d9a659b ("SPEAr13xx: Add dts and dtsi files")

I don't think this is correct. The above patch is correct. The first
patch in this series changes the names and that's where things break.

I think you could have added these patches before changing to yaml and
then nothing would ever have broken.

Since this isn't a big deal anyway, I think you can just drop the
Fixes tag here, and other dts patches you have.

-- 
viresh
