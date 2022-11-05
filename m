Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8D661DBAC
	for <lists+linux-ide@lfdr.de>; Sat,  5 Nov 2022 16:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbiKEPcn (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 5 Nov 2022 11:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiKEPcn (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 5 Nov 2022 11:32:43 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65271A180
        for <linux-ide@vger.kernel.org>; Sat,  5 Nov 2022 08:32:42 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id k15so6971613pfg.2
        for <linux-ide@vger.kernel.org>; Sat, 05 Nov 2022 08:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u6m1xWl0cTcngqkPkHG892As2RQXCoWAPr6dzQ1sZGM=;
        b=JTyaoj59H4cWDZL3KXPYpdeVR+b9LmS5fPyBQxtXXgLQnh+yZydPbWsiDlJ1Kt22mv
         HBSimvFze4TC9nv2jtbMXHvE0QxUoGBTyQj70IM958/D47+aq3rBMYq74yIeQ9z3wTFE
         GW728FRB+T6IIxYWMAxaQ83aIeq2T6PPN/ysAaEJbvM//jODZK06egDXkO7C5mpo1gX+
         SbMAMqNv9X4BsNNOleo9oV0JAazkXqj4b2jEIF4IJptT6Rg2fFcwI9zDrqmdqvcxAunV
         5AJaUywTcTjPdszriz++tKDHe21nECoXtKDf859UkZ465COCIesGG7yykTtybsicRJYS
         FrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u6m1xWl0cTcngqkPkHG892As2RQXCoWAPr6dzQ1sZGM=;
        b=F+dlb8xzJcgoSV35G+m6KHkmRhyBdR0eslergq3luUzpTpul4pL/pm0/VyKRSQ49hO
         3UZp/FpL0p7CaaWvZsDHiR6VFExYEJA9VlDNhbpBSjmPFUzMHkmnB9rN/5m6WRdQ/uFk
         O59QGZVsWTuTNcjr81DUEfcIZiNQpZy65plVfWenOHJ4yFn7yapLszuyYjERWAqzFA1C
         9+VDFOISzf8Zt+p43ixN4NOEvZHRFYNOXyARLyGsx1xRP/rcDlrmzzfIXjxTq9q/isAN
         W3sfIOQrv9GV6z5AfkpX18/A3RmUfsBwuTaXIwP7VarjNPqbqBnkaQ+prLjD4pHcPKZt
         96wQ==
X-Gm-Message-State: ACrzQf2DxKxHcroR+FIt6UHYR8uNxejXkEoXg8GcmM2wijSfe6Czi86t
        S8v+O79T0IZim35eQCDDFz1ssoxz0jnHCM+/
X-Google-Smtp-Source: AMsMyM43iwI3AlHrekdzk0svmfJr8ErR3FtBgJcfpu1Sdgg00NRTf0wngRydK/o6jUUnIvc9qwYXLA==
X-Received: by 2002:aa7:959d:0:b0:56d:27ac:778 with SMTP id z29-20020aa7959d000000b0056d27ac0778mr38035147pfj.29.1667662361826;
        Sat, 05 Nov 2022 08:32:41 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902dac800b0017f9021ddc6sm1798353plx.289.2022.11.05.08.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Nov 2022 08:32:41 -0700 (PDT)
Message-ID: <e2e297a5-b25f-dba2-bac9-dcb2342faeb5@kernel.dk>
Date:   Sat, 5 Nov 2022 09:32:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v4 1/7] block: Prevent the use of REQ_FUA with read
 operations
Content-Language: en-US
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        linux-ide@vger.kernel.org, linux-block@vger.kernel.org,
        "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Hannes Reinecke <hare@suse.de>
References: <20221031022642.352794-1-damien.lemoal@opensource.wdc.com>
 <20221031022642.352794-2-damien.lemoal@opensource.wdc.com>
 <Y2E2wFnbeUzAPjo0@infradead.org>
 <3af6895b-b776-cf0d-fe1e-866ce5e6b0b0@opensource.wdc.com>
 <Y2IXjzWL5eHA3Co9@infradead.org>
 <8125e422-7bc8-46a1-792a-f31cee7a91a3@kernel.dk>
 <Y2NylejsWVvOeZuL@infradead.org>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <Y2NylejsWVvOeZuL@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 11/3/22 1:49 AM, Christoph Hellwig wrote:
> On Wed, Nov 02, 2022 at 09:17:54AM -0600, Jens Axboe wrote:
>>
>> This looks fine, but if we're never expecting this to happen, I do think
>> it should just go into libata instead as that's the only user that
>> cares about it. Yes, that'll lose the backtrace for who submitted it
>> potentially, but you can debug it pretty easily at that point if you
>> run into it.
> 
> FUA and PREFLUSH are bits only defined for writes.  libata might be the
> first thing blowing up, but it really is a block layer constraint.
> So validity checking what is being sent to the block layer at the
> highest possible lyer is a good thing to ensure we don't get us in
> trouble by someone accidentally sending one down or even expecting it
> to work.  Especially as at least SCSI actually defines semantics for FUA
> on reads, but they are completely bogus and useless.

OK, fair enough. I guess we can stick it in the block layer.

-- 
Jens Axboe


