Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84070223BEB
	for <lists+linux-ide@lfdr.de>; Fri, 17 Jul 2020 15:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgGQNHg (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 17 Jul 2020 09:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbgGQNHf (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 17 Jul 2020 09:07:35 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4023C08C5DC
        for <linux-ide@vger.kernel.org>; Fri, 17 Jul 2020 06:07:34 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id x9so12529013ljc.5
        for <linux-ide@vger.kernel.org>; Fri, 17 Jul 2020 06:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=a1qhOLKVmgbDxWR7DsBGPKppiVIcs98dPPN7Z4vRK7U=;
        b=ZcpCVdZKMBTqfoayJtQADEX4zVTHWV2yxNakXh3yLSNrzebl3aH9tjryPIXyI3pz6I
         E2E3jnn6/nLLS3nE0S8SBL5EhIZybuDyrLJ8SHFAg3d1SuO6BRbnY4H8ODY14ZMIU6aa
         bmcXjLAzlncoRVHBH7XYqCt9t74/Qwj97l1fL/lhjkcXd/1k+4HwapoaSSbtq8rreAwQ
         WqOP7vcgpQxfnV7i318A74jitSFLb1wO1WK01FmDR/P5sCd/VDuBBd+k8ePw7372X/j7
         NIMH0Ym89cWouqdU8y2johbuaT26g3FYSTo0/3PXJ0Rfvj5tHrIEK1PSDeOM+hO3S/s6
         CNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=a1qhOLKVmgbDxWR7DsBGPKppiVIcs98dPPN7Z4vRK7U=;
        b=Zi/KQCgR0qVIAKjXVil3lsP6nt1lBDagN/MjA7wFyFbhVhT9QEmkNM0Ocv66dgbEEQ
         05/XeZkv6REJuuz4QMJAf5nR0PqFjT8J9HP/i0bm+O9Djil5vffzPeQksFBk/jcj3fzc
         RFh/wpsLGNVtGPOMIyXvIBua/qLCu2JsHXCBG6Nkk6yRF9CkDtJsHfYYtRVVN4+fnitD
         PcitCaxqitMqGvcozSpVnAjtFENGww78RjIK4UQKcre4b6HmATa0H/IVoO4C5IDGYUcm
         TLhgiKyB+23VaToemcg+7qog0FXBEF98HScG6GsV8jkIi+K91m4B8BsOxyY/qBAZ9xwo
         /+Tw==
X-Gm-Message-State: AOAM533XuvI4MNNsiRSJTkNMZzEFtSc3cGtEJlZC9HI34J9pm2ZCcMWX
        PcqDeJoEwJXpoKMX/s172DsJJw==
X-Google-Smtp-Source: ABdhPJzV0BbOtpw7WhJztEZ51jWAX1HJ1JFIJz6hmBPOoJG/oR+b2KfjYZfEVEra0G7K6n1rrFZL3Q==
X-Received: by 2002:a2e:8047:: with SMTP id p7mr4660529ljg.414.1594991252832;
        Fri, 17 Jul 2020 06:07:32 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id k25sm1651300ljk.87.2020.07.17.06.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 06:07:31 -0700 (PDT)
Date:   Fri, 17 Jul 2020 15:07:30 +0200
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-ide@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 17/20] dt-bindings: media: renesas,vin: Add R8A774E1
 support
Message-ID: <20200717130730.GA3976796@oden.dyn.berto.se>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-18-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1594919915-5225-18-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi Lad,

Thanks for your work.

On 2020-07-16 18:18:32 +0100, Lad Prabhakar wrote:
> Document support for the VIN module in the Renesas RZ/G2H (R8A774E1) SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> index 53c0a7238bac..4e0de280c1e5 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -40,6 +40,7 @@ properties:
>                - renesas,vin-r8a774a1 # RZ/G2M
>                - renesas,vin-r8a774b1 # RZ/G2N
>                - renesas,vin-r8a774c0 # RZ/G2E
> +              - renesas,vin-r8a774e1 # RZ/G2H
>                - renesas,vin-r8a7778  # R-Car M1
>                - renesas,vin-r8a7779  # R-Car H1
>                - renesas,vin-r8a7795  # R-Car H3
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas S�derlund
