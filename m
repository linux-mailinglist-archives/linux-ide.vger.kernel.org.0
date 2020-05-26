Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4EC51B4ACC
	for <lists+linux-ide@lfdr.de>; Wed, 22 Apr 2020 18:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgDVQq0 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 22 Apr 2020 12:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgDVQq0 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 22 Apr 2020 12:46:26 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A56D0C03C1AC
        for <linux-ide@vger.kernel.org>; Wed, 22 Apr 2020 09:46:24 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id b18so2600944ilf.2
        for <linux-ide@vger.kernel.org>; Wed, 22 Apr 2020 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1cV4OuPmkRZ6+zxhfjx8VUKHzAPPELWDKUnr+i1Zl2E=;
        b=vxrw4X12UbXuE8+hKgIRfqbehXZCbT3g1S5XxQ+LVjc5pBkTlst1hlpCAKpWhhZuRu
         veFMvmN+TdYJoobKQlAcPw6JABkRX/KE0oY7sokc0O3Ubt/H9HZmiPyMcH7mA95pj6Mv
         hsbcYkcLl9TIpZJkeOuziDN9U6KahUNlKAIvHBxipbOf4/3GY6HNpcM5h/0atEYHfS1J
         5TnA8z0aXlRNGp/PDhj068qQJeSm366/rYglsOfDgkjlAbyg23I3BhZcaQGv49KdWiYT
         nagOCmHMaULGJBLasMsxEUo6OJAP6KBFFCvGx1AX1CdYZDUtp8pnaisywCFpPZkRJfya
         i9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1cV4OuPmkRZ6+zxhfjx8VUKHzAPPELWDKUnr+i1Zl2E=;
        b=oJKi8EftqB7rAVVRhoAB3ByO2LwE5at5bpllRMqgM9tV6ajmBT412jWFV6Mf27eT0I
         E4H2To0CSNwpE7aHi2xlh4c8HuyESxzxizXDFHag4AszHOuZnNgYoT5zcEKAMoSb6g9g
         U9+80IfHaHhazL4B35BgIUNXK4q9XyBc0T2aS/4uLJPOeqX4G057vV5FCrQQB5Xj3KbD
         Um5HYUiO/c0U9sDbdDP3P0tVg41+oyWHdOy8v/WZNIK1I+akNr0J++sPQJXsDzUDsEnF
         v7uF2GawEymkInPZl+/m45zSwYIVQWYGyL8TBU3EYdFE2ZQUCzdY3diYt4zmXbtoVlJS
         MU3A==
X-Gm-Message-State: AGi0Puao2mfDLQDCDccw/OnUl4Bv31CNBu9Hf5VwwAvK6LwYQQv8yis8
        3+KtFw1c/U+y+RZwN6z92GTU9A==
X-Google-Smtp-Source: APiQypIBWtVOQSTuiObuI0NSKLZhoSwUm3Bnp61Fd89wZTmPr1Njs/VncynYhJfgmsOlad6tANPNUA==
X-Received: by 2002:a92:cece:: with SMTP id z14mr26155375ilq.147.1587573983733;
        Wed, 22 Apr 2020 09:46:23 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id c18sm2251436ilr.37.2020.04.22.09.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 09:46:23 -0700 (PDT)
Subject: Re: clean up DMA draining
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20200414074225.332324-1-hch@lst.de>
 <20200422064151.GA23271@lst.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <f969685b-6547-2e93-f288-d2b1d5ec4dc4@kernel.dk>
Date:   Wed, 22 Apr 2020 10:46:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422064151.GA23271@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 4/22/20 12:41 AM, Christoph Hellwig wrote:
> On Tue, Apr 14, 2020 at 09:42:20AM +0200, Christoph Hellwig wrote:
>> Hi all,
>>
>> currently the dma draining and alignining specific to ATA CDROMs
>> and the UFS driver has its ugly hooks in core block code.  Move
>> this out into the scsi and ide drivers instead.
> 
> Any commens?

Looks OK to me, and I think the idea is sound.


-- 
Jens Axboe

