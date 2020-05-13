Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9002A1D1302
	for <lists+linux-ide@lfdr.de>; Wed, 13 May 2020 14:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728378AbgEMMoD (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 13 May 2020 08:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728299AbgEMMoC (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 13 May 2020 08:44:02 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D062BC061A0E
        for <linux-ide@vger.kernel.org>; Wed, 13 May 2020 05:44:01 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u6so17592014ljl.6
        for <linux-ide@vger.kernel.org>; Wed, 13 May 2020 05:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5d0pcOaIE1HJrh/I4QffOguHc0kKvV2w4f0cXubp9W8=;
        b=N77Fqus1DRNogWlGHp1XKGSqzOq3nxy+D4pGLZIK+g3innXI7KH6ylMFEUfVWEIKlv
         dYUITJ0L3eiM8JkVWfBaUgCr+3NAfzFak7rDp8xt9SQy9++SBGB+iSh7MZPR/DbeiWm2
         pw3UvO1ewZZcmm19B+g84a4dNxwVzZKPFzJkPBwbl9QgNKsbq2x9GcFVXTxCUmWCxkha
         kCGvvU8s/3cuLu4UUquV74JcT3IbAul4K/9yfEDkmMkldmDhFxkT4MFhFQNN22eYRU/b
         VLIZz1AzE5aC0Cvq7q/jqZ2C9E4Wt59PEn/ghfWUQEMAW9qac+EkuTCnIQld5tQTNkm2
         VCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5d0pcOaIE1HJrh/I4QffOguHc0kKvV2w4f0cXubp9W8=;
        b=YCMH+A4fK0rERqi5Jld8oXXXTtA4rF9HQMBg4yb5k6tffjqlFTov+PAZyu4yQC7U2K
         j0qvGabr2tzfdunUJSSTH+oKLhvQC08LLgJ57lLr+M9eesNDWZfCbxN/srrnmHAfe6Ub
         eBA9U3/X2ZoYCk9mJQQfms5hNCqUMika0GyFRvE6m4UqjqLD6/tyewDC4QA6RnpJB7yA
         XneiU8+x3gZbgCLaJQrD+++zG5ohs743W4ziyOa82MaA6nw51wkGQVbuakHtmOXx74/o
         eiUZD4fofVRE7GLJkrTN4dzF3WFHQ+Yv5jwYlodJ1k/1ID8JP6OCyNSvAivEBYl1Zeo4
         2WKQ==
X-Gm-Message-State: AOAM532uQFtbNsOf+STRmObjfJrhnMegcfFT0Xx3r3HmdGxzAOJ3GUTm
        tGan+ET5/1IhifyHoDBU01lVSg==
X-Google-Smtp-Source: ABdhPJwF2QF4EVFN/KfTwSvMhLIVx+dfj1avGadYmJTLx267Uz6kRex1oWHe2K7HEIhEGhEtAnoDwA==
X-Received: by 2002:a2e:b0e3:: with SMTP id h3mr17204006ljl.69.1589373840291;
        Wed, 13 May 2020 05:44:00 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:8bd:2220:dc4:6005:75a4:5a6? ([2a00:1fa0:8bd:2220:dc4:6005:75a4:5a6])
        by smtp.gmail.com with ESMTPSA id c20sm15182100ljk.59.2020.05.13.05.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2020 05:43:59 -0700 (PDT)
Subject: Re: [PATCH] ata: sata_rcar: Fix DMA boundary mask
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jens Axboe <axboe@kernel.dk>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@lst.de>
Cc:     linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200513110426.22472-1-geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <231a408f-a696-baab-6eda-0d959689f476@cogentembedded.com>
Date:   Wed, 13 May 2020 15:43:51 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200513110426.22472-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hello!

On 13.05.2020 14:04, Geert Uytterhoeven wrote:

> Before commit 9495b7e92f716ab2 ("driver core: platform: Initialize
> dma_parms for platform devices"), the R-Car SATA device didn't have DMA
> parameters.  Hence the DMA boundary mask supplied by its driver was
> silently ignored, as __scsi_init_queue() doesn't check the return value
> of dma_set_seg_boundary(), and the default value of 0xffffffff was used.
> 
> Now the device has gained DMA parameters, the driver-supplied value is
> used, and the following warning is printed on Salvator-XS:
> 
>      DMA-API: sata_rcar ee300000.sata: mapping sg segment across boundary [start=0x00000000ffffe000] [end=0x00000000ffffefff] [boundary=0x000000001ffffffe]
>      WARNING: CPU: 5 PID: 38 at kernel/dma/debug.c:1233 debug_dma_map_sg+0x298/0x300
> 
> (the range of start/end values depend on whether IOMMU support is
>   enabled or not)
> 
> The issue here is that SATA_RCAR_DMA_BOUNDARY doesn't have bit 0 set, so
> any typical end value, which is odd, will trigger the check.
> 
> Fix this by increasing the DMA boundary value by 1.
> 
> Fixes: 8bfbeed58665dbbf ("sata_rcar: correct 'sata_rcar_sht'")
> Fixes: 9495b7e92f716ab2 ("driver core: platform: Initialize dma_parms for platform devices")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

    Sorry, my mistake that went undetected for many years. :-)

MBR, Sergei
