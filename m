Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B37A4D934C
	for <lists+linux-ide@lfdr.de>; Tue, 15 Mar 2022 05:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239454AbiCOEYG (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 15 Mar 2022 00:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239450AbiCOEYF (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 15 Mar 2022 00:24:05 -0400
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D03A10EB
        for <linux-ide@vger.kernel.org>; Mon, 14 Mar 2022 21:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1647318173; x=1678854173;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vHag9sKA8G63wSr1MJwoHJ5oQT8S2xx+RtVKiXA7kMA=;
  b=p6uNHaKwLsGc8NBki7IdV4VAo0gIp7ib8tA9ElyBsVyYOIQO2+J8sKLu
   TLFLhVFwDlFNA/BxZFWj8MLxlx0fpfmuzDAt31zjPmPAL2sUs7ZEcxKPb
   JNHqPpIYMmHTAYc8WhGiE2ObVx2W2iMeb1xDeNsqChC6nA+Aa3tTwEe31
   H6COfDAyQVvdBl/Rl95JLYrbajClooG96NiNHgVniduPonlfqmGg6vTiE
   +0CEjS+ZHEj0WdV2xGAkN4KlNhfbfpAxo2e+wwTsUrjIefNuycAhPB9jU
   o04NHe56lrgW5GGW3R373eBvGkSI0cnjHz8uCS6p1vqC+jr+Laekt4DjC
   g==;
X-IronPort-AV: E=Sophos;i="5.90,182,1643644800"; 
   d="scan'208";a="200214988"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 15 Mar 2022 12:22:50 +0800
IronPort-SDR: jcgnmQxCUXqf+srktVuy7znD0yXTfNrb5J7pSAZmvIprWBjnlZrxJl/2wI5E/vsby5W0Yj/5IH
 OsbmLynGQTHhYnQXjwZv+iZlT/RdbsRBsvC632xbJkzFEtXFGVjbFMaXi54aHim2TuqZXxNptH
 S1l/xR/ynkuotFaC2PapBdRUHIIVbVT5jjmzb70dwY0btst4lKFiHK6y0iJ5HPi6m07yHxrpP8
 enBIKg9XLh1oUaBp6alR3R1xYcxmf+9e+R/bwmEVpZ9EyosJV6wOOzOTE20Xg8ZwSftoLTTg5s
 pOo1rt+QdBWs0HS19y34mxS0
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 20:53:59 -0700
IronPort-SDR: 0IejUeCjFXR6fzSW1W9ds3OGspFiYEK2+Vy/ei2ef6GhrmMCWwbo71HywJftZ/YZgbsfu3ised
 iYlmSRkxgiq9ynOzXbgEL4XidQmNC3xC2zy2UA0tLm4RE7vYItnI+JTHF6LxnxpYAsVdxgbxO/
 ZTLM51H01LP2hXdp+78G+FdTDQDcNj1L37KbxTwPYuRUJi6mY9QrfiYGMwLLvzG1qx38YxMsYK
 EKKes1O4nqN5PqTJBYm9hiNxcXASOu2qS6zfdE8qu396gu1rgKRoWoADqe0077Z5J2Pwzb7q8x
 y9c=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 21:22:51 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KHgHZ5M0yz1SVp1
        for <linux-ide@vger.kernel.org>; Mon, 14 Mar 2022 21:22:50 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1647318169; x=1649910170; bh=vHag9sKA8G63wSr1MJwoHJ5oQT8S2xx+RtV
        KiXA7kMA=; b=DGmNJlNj8c9vFP15Xdd8sgAUxJHSjgxdot05ackYTQNauq+k0Rw
        s1StcxwnIZga9j2sj/qUqsNYpG7so04zdNHStq4ywVK1AVJ8/yA7hLFKOWcOLot1
        PK9yZXO6z03OOM20fOYLzN3xv4PA2v3MNZFaIZrH96rKnEpOd+jF2kLWIUMl23jA
        rThhQwj+tdOQT86H49dWPZalbqSzyFr18sKCNxJ3wS0Z+FtnbCWgi9QMQtEWbymA
        qVH4uE53Xeg2RFHzbAb2ViyLbc5NGTadM24Ox/+dbtk9eTh566FjreaY4qAFRiup
        +a7waMfvtuK1dEJysHwUwmOG36L2sKRvywA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id poKNcWxntFO8 for <linux-ide@vger.kernel.org>;
        Mon, 14 Mar 2022 21:22:49 -0700 (PDT)
Received: from [10.225.163.101] (unknown [10.225.163.101])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KHgHX3czQz1Rvlx;
        Mon, 14 Mar 2022 21:22:48 -0700 (PDT)
Message-ID: <8f32b2ed-13d6-c357-e417-b86a57a285db@opensource.wdc.com>
Date:   Tue, 15 Mar 2022 13:22:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] pata_parport: add driver (PARIDE replacement)
Content-Language: en-US
To:     Jens Axboe <axboe@kernel.dk>, Ondrej Zary <linux@zary.sk>
Cc:     Christoph Hellwig <hch@lst.de>, Tim Waugh <tim@cyberelk.net>,
        linux-block@vger.kernel.org, linux-parport@lists.infradead.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220312144415.20010-1-linux@zary.sk>
 <202203132015.18183.linux@zary.sk>
 <5161ed17-5f55-e851-c2e2-5340cc62fa3b@kernel.dk>
 <202203142125.40532.linux@zary.sk>
 <f8c176d4-74f0-3e4f-446f-2a5f8ace3b28@kernel.dk>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <f8c176d4-74f0-3e4f-446f-2a5f8ace3b28@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 3/15/22 05:29, Jens Axboe wrote:
> On 3/14/22 2:25 PM, Ondrej Zary wrote:
>> On Monday 14 March 2022 00:19:30 Jens Axboe wrote:
>>> On 3/13/22 1:15 PM, Ondrej Zary wrote:
>>>> On Saturday 12 March 2022 15:44:15 Ondrej Zary wrote:
>>>>> The pata_parport is a libata-based replacement of the old PARIDE
>>>>> subsystem - driver for parallel port IDE devices.
>>>>> It uses the original paride low-level protocol drivers but does not
>>>>> need the high-level drivers (pd, pcd, pf, pt, pg). The IDE devices
>>>>> behind parallel port adapters are handled by the ATA layer.
>>>>>
>>>>> This will allow paride and its high-level drivers to be removed.
>>>>>
>>>>> paride and pata_parport are mutually exclusive because the compiled
>>>>> protocol drivers are incompatible.
>>>>>
>>>>> Tested with Imation SuperDisk LS-120 and HP C4381A (both use EPAT
>>>>> chip).
>>>>>
>>>>> Note: EPP-32 mode is buggy in EPAT - and also in all other protocol
>>>>> drivers - they don't handle non-multiple-of-4 block transfers
>>>>> correctly. This causes problems with LS-120 drive.
>>>>> There is also another bug in EPAT: EPP modes don't work unless a 4-bit
>>>>> or 8-bit mode is used first (probably some initialization missing?).
>>>>> Once the device is initialized, EPP works until power cycle.
>>>>>
>>>>> So after device power on, you have to:
>>>>> echo "parport0 epat 0" >/sys/bus/pata_parport/new_device
>>>>> echo pata_parport.0 >/sys/bus/pata_parport/delete_device
>>>>> echo "parport0 epat 4" >/sys/bus/pata_parport/new_device
>>>>> (autoprobe will initialize correctly as it tries the slowest modes
>>>>> first but you'll get the broken EPP-32 mode)
>>>>
>>>> Found a bug - the same device can be registered multiple times. Fix
>>>> will be in v2. But this revealed a bigger problem: pi_connect can
>>>> sleep (uses parport_claim_or_block) and libata does not like that. Any
>>>> ideas how to fix this?
>>>
>>> I think you'd need two things here:
>>>
>>> - The blk-mq queue should be registered with BLK_MQ_F_BLOCKING, which
>>>   will allow blocking off the queue_rq path.
>>
>> My knowledge about blk-mq is exactly zero. After grepping the code, I
>> guess that BLK_MQ_F_BLOCKING should be used by the block device
>> drivers - sd and sr?
> 
> The controller would set
> 
> ->needs_blocking_queue_rq = true;
> 
> or something, and we'd default to false. And if that is set, when the
> blk-mq queue is created, then we'd set BLK_MQ_F_BLOCKING upon creation
> if that flag is true.
> 
> That's the block layer side. Then in libata you'd need to ensure that
> you check that same setting and invoke ata_qc_issue() appropriately.
> 
> Very top level stuff, there might be more things lurking below. But
> you'll probably find them as you test this stuff...

Yes, the ata_port spinlock being held when calling ata_qc_issue() is
mandatory. But since I am assuming that all the IDE devices connected to
this adapter are QD=1 maximum, there can only be only one command in
flight. So it may be OK to release that lock before calling pi_connect()
and retake it right after it. libsas actually does something similar
(for no good reasons in that case though).

Jens point remain though that since pi_connect() can sleep, marking the
device queue with BLK_MQ_F_BLOCKING is mandatory.

-- 
Damien Le Moal
Western Digital Research
