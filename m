Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5FD0302178
	for <lists+linux-ide@lfdr.de>; Mon, 25 Jan 2021 05:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbhAYEyU (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 24 Jan 2021 23:54:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbhAYEyN (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 24 Jan 2021 23:54:13 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D15C7C061756
        for <linux-ide@vger.kernel.org>; Sun, 24 Jan 2021 20:53:32 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id e9so421618pjj.0
        for <linux-ide@vger.kernel.org>; Sun, 24 Jan 2021 20:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yCVXNmnkbukJI6FbnBMkRVDM8J/Lut2yGB3GCl5tMhk=;
        b=mUc+2GmhUCQFtGXsbDdMUePaHUC70SqcjIvNUGzmQAMRmDih05IYA/pLKTv5cpBUJg
         8D4F5NWSJKzdXYHX3tUo/gpur6bsvJgO0jl+aDqenyGk4M3crlQnK9+R3fse9TDvl9Kg
         PDvjAjdRxv7sEQky3VyreBHgThr+GzpCJW1XuWOAUmcO51X0t91JXgwFck88xc5IXzZ7
         kcZMpDwGdq/6TX1yaFTbsmRuAy8Q+Bd9qAymHynKCsDAhhvlHsCRTzF+gutiHWy4k037
         tg1DroGlhRJAHLuCAeOG6dOO/t8s4/8RlUz8Nd7VLJNZUmhsSiwItgtDZcoPgaKB9O6D
         PMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yCVXNmnkbukJI6FbnBMkRVDM8J/Lut2yGB3GCl5tMhk=;
        b=cSrjl8r6+aYT9rOKx0Wwx8ue1gy2XvVx0MWWI439JPCW3OBqi8TtFregdivKAciXP3
         gMIL2RvJgGEGjeKOnt+aZLvK5PJrZ2Nv3Gm3z9XpEeHGsTAF5MoKWx1E9qaouA0jfTjz
         yO0IxG1FDzPU+sC7imua22Pjbi2Whit8xweeiuNZyI0GyXfRcEkyisWzfCMStwdPI/6x
         y2rsHggo/pLGSl2Rju67t090LkqgkdmFDTz/BjmvffNa1xd+LKckLp5zydywS0EzzJpC
         pPxji1RJwvMKA9W8PssvwNNeVBj5w4e+ou/EkIFLVEurIIUB6ieeWyMSegKjWVYo5Ugm
         M1GA==
X-Gm-Message-State: AOAM533yi4wHJw82/c+LXmRNFCf+iKcm/7Q/E/NfQ4Iq1/MrUFpGVp94
        UQNVjqrKPIxmye8eUBp5+O6/1A==
X-Google-Smtp-Source: ABdhPJxH9fkoQGdpf2yTn0S6RVjDGgTIT95lILem9Ftm+wTQRagGEoMXbOUbGd2ZD+OyyhreIN7wUA==
X-Received: by 2002:a17:902:b285:b029:de:a0a3:f3b9 with SMTP id u5-20020a170902b285b02900dea0a3f3b9mr336676plr.34.1611550412389;
        Sun, 24 Jan 2021 20:53:32 -0800 (PST)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id 68sm14877443pfe.33.2021.01.24.20.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Jan 2021 20:53:31 -0800 (PST)
Subject: Re: [PATCH V3 0/2] remove unused argument from blk_execute_rq_nowait
 and blk_execute_rq
To:     Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Cc:     linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-ide@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org,
        hch@infradead.org
References: <1611550198-17142-1-git-send-email-guoqing.jiang@cloud.ionos.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <50c4cdb5-b5ea-5431-c319-a6784f33f8b6@kernel.dk>
Date:   Sun, 24 Jan 2021 21:53:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1611550198-17142-1-git-send-email-guoqing.jiang@cloud.ionos.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 1/24/21 9:49 PM, Guoqing Jiang wrote:
> V3 changes:
> 1. rebase with for-5.12/block branch.
> 2. add Ulf's Acked-by.
> 
> V2 changes:
> 1. update commit header per Christoph's comment.
> 
> Hi Jens,
> 
> This series remove unused 'q' from blk_execute_rq_nowait and blk_execute_rq.
> Also update the comment for blk_execute_rq_nowait.
> 

Applied, thanks.

-- 
Jens Axboe

