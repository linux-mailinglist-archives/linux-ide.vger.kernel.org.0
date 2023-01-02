Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFAA65B5F8
	for <lists+linux-ide@lfdr.de>; Mon,  2 Jan 2023 18:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235138AbjABRfw (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 2 Jan 2023 12:35:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236039AbjABRfu (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 2 Jan 2023 12:35:50 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68C0C7B
        for <linux-ide@vger.kernel.org>; Mon,  2 Jan 2023 09:35:48 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id 79so18658025pgf.11
        for <linux-ide@vger.kernel.org>; Mon, 02 Jan 2023 09:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/FLi7onUW3nYVddnO6ufjs5aBaW8qFFiB26AInMK3E=;
        b=1Zl5X9eDu29gEyWJkUd3WN95PDZ7pmieuyZgog/h8fWIF89EVUeYQ2cj0BpAUjwJj4
         om8QY+oFVhiRQLuAW1xun+3txUwxj4pZF1UwD0wcRI9j+gMFfNUwTK2VMzP6gpZBLpf3
         gPi1yf4ppqhEPRZw9Knu9hLwtocxe88cQn0autD5oZZztvigxEpa3hdn9iUIRmJWrxYG
         Vxr6RJ+K8G6A6dBs/tPlZu7KCjNpjBIoB2JPaDvIdDTUf3TcuHJ29xAbHh8PQIwdXyIC
         LuGQA5b1QQHiB3E0Wd/hy+BlfwaeHkxAFE6lHIX7IGkcDpXpAFlKZgXXYw7DWWzqUl/m
         a1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/FLi7onUW3nYVddnO6ufjs5aBaW8qFFiB26AInMK3E=;
        b=eSnNONNZ9kdkmJ9KVJlzkyJBvbI9j+exmF0ccdjy35N0CbK28u/rAbS75VARdJVQ7G
         aqr56r4tH0q3Qt4tzy+V2mDpIiNMTggOObuNXsvvJotOIaKSdvG5tmB3yv/AeXykhb+4
         BOOKI1QVNH696QX4Ad77oKqLufykI/xeI889rZXkJ6YGq4sv0ypUL+1hKHpt9E6c+4XX
         67O1FOHlJmyFGJo9YygKeTTZxOcUGCNeucOEWK9jO6JCpPkYPIP8xHi0ccjPyCecThJc
         Z3mHnGtfCIub7nkVTaycR7ZfZs/XoKvxsL6+TjY1iw8hfxkRLfzNStXtFJd4DmdW0NjF
         aVkQ==
X-Gm-Message-State: AFqh2koL1522BcTqhcVWfaJmRMXkoWcCTgsOgH3Vn3iOHaqQ+fuPXIpe
        4Dq7OMzrknfOQ/b51i9tRQyLdQ==
X-Google-Smtp-Source: AMrXdXvBFYldhHt4VPdiHQAA4t8vs65eDOK8fDS7D3BhKPJNuRtli+f6wQT43IPHh2PFTy0dlu2Kug==
X-Received: by 2002:a05:6a00:72b:b0:576:f200:e3eb with SMTP id 11-20020a056a00072b00b00576f200e3ebmr9900196pfm.0.1672680948192;
        Mon, 02 Jan 2023 09:35:48 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id a125-20020a624d83000000b005771475561bsm18771186pfb.163.2023.01.02.09.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 09:35:47 -0800 (PST)
Message-ID: <faafa17b-4b1c-9134-b920-327263acf69e@kernel.dk>
Date:   Mon, 2 Jan 2023 10:35:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 1/7] block: add a sanity check for non-write flush/fua
 bios
Content-Language: en-US
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        linux-ide@vger.kernel.org, linux-block@vger.kernel.org
Cc:     "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
References: <20221108055544.1481583-1-damien.lemoal@opensource.wdc.com>
 <20221108055544.1481583-2-damien.lemoal@opensource.wdc.com>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20221108055544.1481583-2-damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 11/7/22 10:55 PM, Damien Le Moal wrote:
> From: Christoph Hellwig <hch@infradead.org>
> 
> Check that the PREFUSH and FUA flags are only set on write bios,
> given that the flush state machine expects that.
> 
> Reported-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe


