Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48C846161B9
	for <lists+linux-ide@lfdr.de>; Wed,  2 Nov 2022 12:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbiKBLZ5 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 2 Nov 2022 07:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbiKBLZz (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 2 Nov 2022 07:25:55 -0400
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C88127B09
        for <linux-ide@vger.kernel.org>; Wed,  2 Nov 2022 04:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1667388354; x=1698924354;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TMLQrUTJOuanaRsKmkyrbCftoNV6xvpScUeT6XiFWnc=;
  b=G58nHaocEq2E4sxct/tLYfG8ICbyQ16zB9xMhgHeTe34PhR5t+gGtIfX
   PPT/tdriUBJY829JY7A+Mff4PNQFCmE6uOtxq9veQ6dbui+RRv8R3DB3Z
   klZUjgPeIsAdE/VXxW0FKveo/7r7ASrQGyVwec7/QhcJLFhS2Yw+kKaT5
   i7g8FlMCjYU1G8T6yBeXY6VWV8QWqorRxj5iEp/8XA9FSjPFoYaiss+nd
   GHexBK0L0ffBUwwxF6pLSus3WM5SHMVN0ozF0hthDcb5jJToxjedLg129
   f/Aq1JDgDnQF0ISu8KpbpvJoyKLNszDnNA8Fnj6Q0PtcAojwgdpz1fmdT
   g==;
X-IronPort-AV: E=Sophos;i="5.95,232,1661788800"; 
   d="scan'208";a="319639725"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 02 Nov 2022 19:25:52 +0800
IronPort-SDR: IoPNrgV0Jc9vvvUlE6PJHlhyRY7VBo+Yq1N4QLiayuCkozNDaURs4HumuMjAxCr3c5A/Jm3+ON
 MvMStAXf1UpDSrwUi4w+UMNCpIR1Nj6XkJpJaNTeXf1iA+n7utobE6r57VPVGhh6ukYgvcg51y
 Pbz7ouXXoMivIT8SWoSuhPsC+6sh0iioV6z8DJeyD6YCeFru2jecWvsdWu70EjGayjHj4xhOBZ
 KO1AxQH5E0yErxrGHiz9l1jCZFOdolu/sKv4ujJ1yU2U90Nw4wNT5UyqG85NC+j+54yqTlo735
 Ovo=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Nov 2022 03:39:22 -0700
IronPort-SDR: 0O1EvEMbDMYnhoGRpauAcWNnrWHN+pr510tZOT2TaW3osUsuxmXr3Wnt5xg/SNRK3USbwUMtsv
 msgI1XQvVAeuK6ZiNCP6B+wOBLBjnEi3f3cpvO1s9sYV0v3Kq3fnTW/7eH2TQuRBWZpvxftaDe
 FoIA11kIDDm8fKJTelRXMFGabrWWKolxLuSjkQPHCdw6qnd8No7ElgqvNQPvL/v/up9RVESHGc
 C8WpwKmuPYGDKTnr59oZzIIsoI0q357o4m+q6Tp59liwu6LscTX6dHVIavjOeqtkmXY7im7iHh
 lrk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Nov 2022 04:25:53 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4N2Phc2Ffqz1Rx15
        for <linux-ide@vger.kernel.org>; Wed,  2 Nov 2022 04:25:52 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1667388350; x=1669980351; bh=TMLQrUTJOuanaRsKmkyrbCftoNV6xvpScUe
        T6XiFWnc=; b=SmDrBMJJnhvWUFxaUlGNiG27FrNO3FrQKy3NGqCvsxlFEq7oA9u
        MYiuy9R6pnRET443szhTsplFWw1uYJmPF4tw+HsTfEbs/H/XHc8kWEqOioONzAd9
        qCl17NUGnOUD3u7zalTlFo6NnKVSsEL89JaNchbZKGtZclTE6vPj8bDgxnGkcQQc
        koGmlNgb/uahK3HnS7ofyrleAUm8rHBdi5YCR8irZDJFphLddrUTlrQPsJF+zfF7
        Ou3VI8TwO9/rfnG5f8cjUnGwFJqnOqHFbCD91m8hVL96b51SJndtBM/WspgW0BOK
        opAYfDAlrGmU0u9SdB5UlTjqfIo1VhOmnlQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id jYXOrJQ-Uw29 for <linux-ide@vger.kernel.org>;
        Wed,  2 Nov 2022 04:25:50 -0700 (PDT)
Received: from [10.225.163.24] (unknown [10.225.163.24])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4N2PhW5sj3z1RvLy;
        Wed,  2 Nov 2022 04:25:47 -0700 (PDT)
Message-ID: <0de1c3fd-4be7-1690-0780-720505c3692b@opensource.wdc.com>
Date:   Wed, 2 Nov 2022 20:25:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH RFC v3 2/7] ata: libata-scsi: Add
 ata_internal_queuecommand()
Content-Language: en-US
To:     Hannes Reinecke <hare@suse.de>,
        John Garry <john.g.garry@oracle.com>,
        John Garry <john.garry@huawei.com>, jejb@linux.ibm.com,
        martin.petersen@oracle.com, bvanassche@acm.org, hch@lst.de,
        ming.lei@redhat.com, niklas.cassel@wdc.com
Cc:     axboe@kernel.dk, jinpu.wang@cloud.ionos.com,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
        linuxarm@huawei.com, john.garry2@mail.dcu.ie
References: <1666693976-181094-1-git-send-email-john.garry@huawei.com>
 <1666693976-181094-3-git-send-email-john.garry@huawei.com>
 <08fdb698-0df3-7bc8-e6af-7d13cc96acfa@opensource.wdc.com>
 <83d9dc82-ea37-4a3c-7e67-1c097f777767@huawei.com>
 <9a2f30cc-d0e9-b454-d7cd-1b0bd3cf0bb9@opensource.wdc.com>
 <0e60fab5-8a76-9b7e-08cf-fb791e01ae08@huawei.com>
 <71b56949-e4d7-fd94-c44a-867080b7a4fa@opensource.wdc.com>
 <b03b37a2-35dc-5218-7279-ae68678a47ff@huawei.com>
 <0e4994f7-f131-39b0-c876-f447b71566cd@opensource.wdc.com>
 <05cf6d61-987b-025d-b694-a58981226b97@oracle.com>
 <ff0c2ab7-8e82-40d9-1adf-78ee12846e1f@opensource.wdc.com>
 <39f9afc5-9aab-6f7c-b67a-e74e694543d4@suse.de>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <39f9afc5-9aab-6f7c-b67a-e74e694543d4@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 11/2/22 20:12, Hannes Reinecke wrote:
> On 11/2/22 11:07, Damien Le Moal wrote:
>> On 11/2/22 18:52, John Garry wrote:
>>> Hi Damien,
>>>
> [ .. ]
>>>>> Or re-use 1 from 32 (and still also have 1 separate internal command)?
>>>>
>>>> I am not yet 100% sure if we can treat that internal NCQ read log like
>>>> any other read/write request... If we can, then the 1-out-of-32
>>>> reservation would not be needed. Need to revisit all the cases we need
>>>> to take care of (because in the middle of this CDL completion handling,
>>>> regular NCQ errors can happen, resulting in a drive reset that could
>>>> wreck everything as we lose the sense data for the completed requests).
>>>>
>>>> In any case, I think that we can deal with that extra reserved command
>>>> on top of you current series. No need to worry about it for now I think.
>>>>
>>>
>>> So are you saying that you are basing current CDL support on libata
>>> internally managing this extra reserved tag (and so do not need this
>>> SCSI midlayer reserved tag support yet)?
>>
>> Not really. For now, it is using libata EH, that is, when we need the
>> internal command for the read log, we know the device is idle and no
>> command is on-going. So we send a non-NCQ command which does not have a tag.
>>
>> Ideally, all of this should use a real reserved tag to allow for an NCQ
>> read log outside of EH, avoiding the drive queue drain.
>>
> But with the current design you'll only get that if you reserve one 
> precious tag.

yes, which is annoying. Back to the days where ATA max qd was 31...

> OTOH, we might not need that tag at all, as _if_ we get an error for a 
> specific command the tag associated with it is necessarily free after 
> completion, right?

Well, it is not really free. It is unused as far as the device is
concerned since the command that needs to be checked completed. But not
free yet since we need to do the read log first before being able to
scsi-complete the command (which will free the tag). So if we use the
regular submission path to issue the read log, we must be guaranteed that
we can get a tag, otherwise we will deadlock. Hence the need to reserve
one tag.


> So we only need to find a way of 're-using' that tag, then we won't have 
> to set aside a reserved tag and everything would be dandy...

I tried that. It is very ugly... Problem is that integration with EH in
case a real NCQ error happens when all that read-log-complete dance is
happening is hard. And don't get me started with the need to save/restore
the scsi command context of the command we are reusing the tag from.

And given that the code is changing to use regular submission path for
internal commands, right now, we need a reserved tag. Or a way to "borrow"
the tag from a request that we need to check. Which means we need some
additional api to not always try to allocate a tag.

> 
> Maybe we can stop processing when we receive an error (should be doing 
> that anyway as otherwise the log might be overwritten), then we should 
> be having a pretty good chance of getting that tag.

Hmmm.... that would be no better than using EH which does stop processing
until the internal house keeping is done.

> Or, precisely, getting _any_ tag as at least one tag is free at that point.
> Hmm?

See above. Not free, but usable as far as the device is concerned since we
have at least on command we need to check completed at the device level
(but not yet completed from scsi/block layer point of view).

> 
> Cheers,
> 
> Hannes

-- 
Damien Le Moal
Western Digital Research

