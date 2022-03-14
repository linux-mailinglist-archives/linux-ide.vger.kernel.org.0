Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6CC4D8E20
	for <lists+linux-ide@lfdr.de>; Mon, 14 Mar 2022 21:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244993AbiCNUae (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 14 Mar 2022 16:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235159AbiCNUae (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 14 Mar 2022 16:30:34 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5CA010FCA
        for <linux-ide@vger.kernel.org>; Mon, 14 Mar 2022 13:29:22 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id n16so10726223ile.11
        for <linux-ide@vger.kernel.org>; Mon, 14 Mar 2022 13:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=adXU5jvKdTeVUXf7FxN5XUsW/sqJcSLYktYqOlUAuGU=;
        b=YMaAzpTJ/gtwOmU/jO4rVspaaaENPjTYPf8fMMpYAvUtktldwYaURpBUJTghtO3gb/
         WaKY0lNhSy8SG8TjDP+WAEBn6c4q4PzqXRWvemkAHFK1ZX80feH+2MdWJDfnPEvGQ6AG
         2PK3toOPhslyKZJ2N1It0wSXSgfGxCd2YXpuTyGn+RP3MBJAGsqNuElspn5ZIExsWYfZ
         0dYlx6MHOnSvJ0dfAxAz2TqpqfnmExSDQHvtx7S2K3ZttkmnvYpyyodxXgo3XoqB2Pnx
         GYrloOG9Wg0hjCeiQenx8eIuf8m9C5N0FHXlGxDsL0OTggtaee9aGxruVHMQyvF8iY+Z
         BX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=adXU5jvKdTeVUXf7FxN5XUsW/sqJcSLYktYqOlUAuGU=;
        b=65prJn6uRQnAXxrAdjZenw3EXKZ4skyXQCvtVN8HYEeMbzHrZQ5bAKtN6RkX/JoQ3e
         fpr/N1tozdu4cBP/mKbQd95OlXfj1qhhWWJNx7S0kQZuPJVvPypWLV7ClsK2iqrg1SVH
         Jqn5a0NRI3Ccku7sjvY88YFOUv0aKeaKoDVqtKepA/gZdK7vtWUiM9eHQEH6mgeZO8f6
         5bKDxEReKWcrvUEt7JK46GZ3CGStHmkPXSo5R8LDohRPZ0cnGql8yiNnxFV5SErNMM8t
         wrHDILfQ1Uz6r0p04X9HkQ5Td/haicRcrdPtRlfQRPFIZZQJTEeUgtdXDjYkER+rQp+S
         iyfQ==
X-Gm-Message-State: AOAM532CuUM5cs22mrF4A5ddsqtZ8HQISLdB6GjQMhc2GYICwF+yKcwq
        qZKQo1uIynE31N1wsX1Jogw0Xg==
X-Google-Smtp-Source: ABdhPJzQQ8K0nRbPG+0HNAXbsPOTCihXiooGxuoIC/3yrAozV0/AYejpQjvJnYoxarWBPBHqW8IVxw==
X-Received: by 2002:a05:6e02:13c3:b0:2c6:229a:73b8 with SMTP id v3-20020a056e0213c300b002c6229a73b8mr20479980ilj.260.1647289762114;
        Mon, 14 Mar 2022 13:29:22 -0700 (PDT)
Received: from [192.168.1.172] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id q5-20020a056e0220e500b002c79a587c4bsm3004499ilv.4.2022.03.14.13.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 13:29:21 -0700 (PDT)
Message-ID: <f8c176d4-74f0-3e4f-446f-2a5f8ace3b28@kernel.dk>
Date:   Mon, 14 Mar 2022 14:29:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] pata_parport: add driver (PARIDE replacement)
Content-Language: en-US
To:     Ondrej Zary <linux@zary.sk>
Cc:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Christoph Hellwig <hch@lst.de>, Tim Waugh <tim@cyberelk.net>,
        linux-block@vger.kernel.org, linux-parport@lists.infradead.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220312144415.20010-1-linux@zary.sk>
 <202203132015.18183.linux@zary.sk>
 <5161ed17-5f55-e851-c2e2-5340cc62fa3b@kernel.dk>
 <202203142125.40532.linux@zary.sk>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202203142125.40532.linux@zary.sk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 3/14/22 2:25 PM, Ondrej Zary wrote:
> On Monday 14 March 2022 00:19:30 Jens Axboe wrote:
>> On 3/13/22 1:15 PM, Ondrej Zary wrote:
>>> On Saturday 12 March 2022 15:44:15 Ondrej Zary wrote:
>>>> The pata_parport is a libata-based replacement of the old PARIDE
>>>> subsystem - driver for parallel port IDE devices.
>>>> It uses the original paride low-level protocol drivers but does not
>>>> need the high-level drivers (pd, pcd, pf, pt, pg). The IDE devices
>>>> behind parallel port adapters are handled by the ATA layer.
>>>>
>>>> This will allow paride and its high-level drivers to be removed.
>>>>
>>>> paride and pata_parport are mutually exclusive because the compiled
>>>> protocol drivers are incompatible.
>>>>
>>>> Tested with Imation SuperDisk LS-120 and HP C4381A (both use EPAT
>>>> chip).
>>>>
>>>> Note: EPP-32 mode is buggy in EPAT - and also in all other protocol
>>>> drivers - they don't handle non-multiple-of-4 block transfers
>>>> correctly. This causes problems with LS-120 drive.
>>>> There is also another bug in EPAT: EPP modes don't work unless a 4-bit
>>>> or 8-bit mode is used first (probably some initialization missing?).
>>>> Once the device is initialized, EPP works until power cycle.
>>>>
>>>> So after device power on, you have to:
>>>> echo "parport0 epat 0" >/sys/bus/pata_parport/new_device
>>>> echo pata_parport.0 >/sys/bus/pata_parport/delete_device
>>>> echo "parport0 epat 4" >/sys/bus/pata_parport/new_device
>>>> (autoprobe will initialize correctly as it tries the slowest modes
>>>> first but you'll get the broken EPP-32 mode)
>>>
>>> Found a bug - the same device can be registered multiple times. Fix
>>> will be in v2. But this revealed a bigger problem: pi_connect can
>>> sleep (uses parport_claim_or_block) and libata does not like that. Any
>>> ideas how to fix this?
>>
>> I think you'd need two things here:
>>
>> - The blk-mq queue should be registered with BLK_MQ_F_BLOCKING, which
>>   will allow blocking off the queue_rq path.
> 
> My knowledge about blk-mq is exactly zero. After grepping the code, I
> guess that BLK_MQ_F_BLOCKING should be used by the block device
> drivers - sd and sr?

The controller would set

->needs_blocking_queue_rq = true;

or something, and we'd default to false. And if that is set, when the
blk-mq queue is created, then we'd set BLK_MQ_F_BLOCKING upon creation
if that flag is true.

That's the block layer side. Then in libata you'd need to ensure that
you check that same setting and invoke ata_qc_issue() appropriately.

Very top level stuff, there might be more things lurking below. But
you'll probably find them as you test this stuff...

-- 
Jens Axboe

