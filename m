Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36DE1401F3F
	for <lists+linux-ide@lfdr.de>; Mon,  6 Sep 2021 19:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244197AbhIFRkA (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 6 Sep 2021 13:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237281AbhIFRj7 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 6 Sep 2021 13:39:59 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67A99C061757
        for <linux-ide@vger.kernel.org>; Mon,  6 Sep 2021 10:38:54 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id j10-20020a17090a94ca00b00181f17b7ef7so4659832pjw.2
        for <linux-ide@vger.kernel.org>; Mon, 06 Sep 2021 10:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=sQHkWdbNwQL+km/anEAO4GkAw1yDfLqfvOkzncIGzQs=;
        b=hkZiYTI7ITLho6KNgNMXS3Fojm3uLGt2wMEGeP/KT/1WA9ObXGUmNfae9U7na0E/FN
         pgFNLPgsmgMsBHwn/CrJrUHyEahtdPY0Dqb6Taw/JA2Or6xMfDyf/Q4quQch6i5a6T0f
         z8G1o755xM1YG5ooQd8blQN2vfEiV3P2Kh/a6fdhBDh9brcsyKKSJRL1JtEsjTgCTfbo
         NZ9zzc3RNYRT2g/y8So3niUUGgrTFHh7tFi0vu+8XmdFPMgWhX+PpIum0ODEGf1wJkIp
         8l9RczsPGbkvSi0EpTuyOjPVcBPm1KLbMUg5ReYFqiYRGsVNdISgi2pAf5IDMf0Q0zuT
         QbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sQHkWdbNwQL+km/anEAO4GkAw1yDfLqfvOkzncIGzQs=;
        b=typsCTzamy725dVp03glpttRYs8YA0zsiOEqNq1ZtQU4JqGc9R9lAPO7jC8RNntI2Y
         icMjTIIUuPz1UIAyKSnaB6Meft81pzzAywjDxH5ZE4QVmKVmyHNyCEDXVMQwJMiqUlL+
         rk+SyQDtBxoXn/2NewSxhDN/KDmmfxzcgYgv1YZJSDBKhh6T1NIpSAdqf2oOgH4XOJDy
         RKKjlu1yuUHyT+vPIapdZ5Zd3lsXatTUiMTsvQCyyHtJxIvIiatGEnQGp8+Vy1G42cSm
         g0BoIHGdnsW4QTZ1ZTEnwfR85NG4TAJt7fYBYI5SZTGg/0PJBWuSHHlypVw0ZgQIJHdj
         0ZZw==
X-Gm-Message-State: AOAM5310N8DMqc/yxlBOSxkRbxVl26TfU6nEPXboEbfUX6IfLGlU2IL8
        ROT5r+VFJfcTdFuo/pO2MQ9JBg==
X-Google-Smtp-Source: ABdhPJxuIE2RpHMVps8Sa+gF25x2LZ3amjCLjaUwGyvy6FRnJ8jf0971TypSPxvLWdevF0Bx6gmEcQ==
X-Received: by 2002:a17:90b:2212:: with SMTP id kw18mr230767pjb.59.1630949933839;
        Mon, 06 Sep 2021 10:38:53 -0700 (PDT)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id n15sm8579420pff.149.2021.09.06.10.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 10:38:53 -0700 (PDT)
Subject: Re: [PATCH v7 1/5] block: Add independent access ranges support
To:     Damien Le Moal <damien.lemoal@wdc.com>,
        linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org
References: <20210906015810.732799-1-damien.lemoal@wdc.com>
 <20210906015810.732799-2-damien.lemoal@wdc.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <9a253efe-d924-a8a8-10ac-c2787ce34cb7@kernel.dk>
Date:   Mon, 6 Sep 2021 11:38:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210906015810.732799-2-damien.lemoal@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 9/5/21 7:58 PM, Damien Le Moal wrote:
> struct blk_independent_access_ranges contains kobjects (struct kobject)
> to expose to the user through sysfs the set of independent access ranges
> supported by a device. When the device is initialized, sysfs
> registration of the ranges information is done from blk_register_queue()
> using the block layer internal function disk_register_iaranges(). If a
> driver calls disk_set_iaranges() for a registered queue, e.g. when a
> device is revalidated, disk_set_iaranges() will execute
> disk_register_iaranges() to update the sysfs attribute files.

I really detest the iaranges "name", it's horribly illegible. If you
want to stick with the ia thing, then disk_register_ia_ranges() would be
a lot better (though still horrible, imho, just less so).

Same goes for blk-iaranges, we really need to come up with something
more descriptive here.

-- 
Jens Axboe

