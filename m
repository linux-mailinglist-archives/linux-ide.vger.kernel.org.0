Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D940F616076
	for <lists+linux-ide@lfdr.de>; Wed,  2 Nov 2022 11:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbiKBKHS (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 2 Nov 2022 06:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiKBKHQ (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 2 Nov 2022 06:07:16 -0400
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D0323EBA
        for <linux-ide@vger.kernel.org>; Wed,  2 Nov 2022 03:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1667383635; x=1698919635;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JCX4B4TGkjLJ3lQDVKPLvWo4xblaY/2CTtdZ/PqgQVk=;
  b=k53fQNBRb6hHnuLytZ6qJvUX+K1hJW1rS/FDyU2fgkFZmgUhwo1TNqP8
   aSKy8+1dbL/oB3uirM6SYjvHLJ6OsDl5wTBjceMEsAOC2Z11UbbJRozjO
   sl12b19A2S/0mif6K2t+NqxQR6jYnWDjPsYtctd5kNTHMbIPKVDj//oMH
   8o4GokQX6zS1Utb98Gw1aGIq7OzTOWRTk2u68YJ5Sda7bL6E8F7l7TB0D
   taiJpWu4DPEZNfADUPJiF8sFsPjrmLwbMY3ORSbmy/pDGpIi/+ayBspAj
   wMEyRFAYyU6te3teSE0lcq9Re6hR5bJmODT9yIdMwwQbJ1qF0hmeuGxbJ
   w==;
X-IronPort-AV: E=Sophos;i="5.95,232,1661788800"; 
   d="scan'208";a="213591753"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 02 Nov 2022 18:07:14 +0800
IronPort-SDR: dJ4YzaTGqEqyQMibHX8Pt07XJAvc4rV6srVxlUkuIZBRIsnH4WLxbClUp1GavnCP+hmCuzBUil
 odbUtFpxqFqNzI5MleEBmjKQuWgbDjCaBCwpgn6u2FTbpadNNTcIJTcTa/xFLg/6MgOp4NvhVi
 XSZDNCS9rJhMa2w6ayl9JGgdZF4DqSrvWviksWsvHaecUWfPq+BcLsG2VBG7p6ncHuQ3B/mCBS
 9yOtJCW2WEDifKXr7xP3/4AwPt7LUs/eT5Tul5WOr+icuqT9ieTValXOdD7CH3i3lQ6tZnBESI
 HhOpWOYesrWexNXRLweyFGB+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Nov 2022 02:26:28 -0700
IronPort-SDR: 2zQZ9k1xq9JY7N4u3+fldzUA7EvuSd8I6hL1DrxzqyH0sSBLfkiYyTYCDCsOqT98/wsLMMQXer
 KHe4lbQBZHE4LC1j/HJK7wVFhnUBggdPC6z+raKDRpxBT1br1V9UPx7D/GR1g/4UpkQ0xxGv7l
 kLoWKBd0JSJA2Rd7EjvbbmulzADYJp4lkUHPipZbyE6baG1uthhf+h/2g/Uds4MKOmW54ooLu2
 17jLWEzi8ThJyKpwWasESD0i5oLxN8+p9nV0cR9LswSAGzf18ba6hAqTYk4rfGtF1cBZ2Drr28
 0Mo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Nov 2022 03:07:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4N2Mxs4Vq9z1RwvL
        for <linux-ide@vger.kernel.org>; Wed,  2 Nov 2022 03:07:13 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1667383631; x=1669975632; bh=JCX4B4TGkjLJ3lQDVKPLvWo4xblaY/2CTtd
        Z/PqgQVk=; b=enw5S1jfA1UIbRfoqOQnFzAVaShXYf6niQN0V4yRV16dPpPUOG7
        D9Cum052+X+M+icWV+U5guVp7wmrSu+09dYCcYKk/njpvgsIwxpIWxRCBaJFqzP5
        R72CGhP1d3vVOU28MT7QQkk7ZseNi/5zWvodB1BUiqWjZBDiNaPGdnVNSMi5me4M
        zNIfFlsJ3DVW4LTLLHM6wrkpZ9P3P2i8AZ7a+baz/FFQhnjiNJ3dwh846ZNFsSgh
        fXCXTO1mUwncobwtHp1j6lYVmorrS8AAwoy1GkihaA7YG/kDogjOikkKbNS0/ae9
        L1fPxRRUQNAFMkVRTR6azX17Tb7WVA//YeA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id X3WzJj39MnG5 for <linux-ide@vger.kernel.org>;
        Wed,  2 Nov 2022 03:07:11 -0700 (PDT)
Received: from [10.225.163.24] (unknown [10.225.163.24])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4N2Mxm3H54z1RvTp;
        Wed,  2 Nov 2022 03:07:07 -0700 (PDT)
Message-ID: <ff0c2ab7-8e82-40d9-1adf-78ee12846e1f@opensource.wdc.com>
Date:   Wed, 2 Nov 2022 19:07:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH RFC v3 2/7] ata: libata-scsi: Add
 ata_internal_queuecommand()
Content-Language: en-US
To:     John Garry <john.g.garry@oracle.com>,
        John Garry <john.garry@huawei.com>, jejb@linux.ibm.com,
        martin.petersen@oracle.com, hare@suse.de, bvanassche@acm.org,
        hch@lst.de, ming.lei@redhat.com, niklas.cassel@wdc.com
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
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <05cf6d61-987b-025d-b694-a58981226b97@oracle.com>
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

On 11/2/22 18:52, John Garry wrote:
> Hi Damien,
> 
>>>>>
>>>>> Please also note that for AHCI, I make reserved depth =1, while for SAS
>>>>> controllers it is greater. This means that in theory we could alloc > 1x
>>>>> reserved command for SATA disk, but I don't think it matters.
>>>> Yes, 1 is enough. However, is 1 reserved out of 32 total, meaning that
>>>> the
>>>> user can only use 31 tags ? or is it 32+1 reserved ? which we can do
>>>> since
>>>> when using the reserved request, we will not use a hw tag (all reserved
>>>> requests will be non-ncq).
>>>>
>>>> The 32 + 1 scheme will work.
>>>
>>> Yes, 32 + 1 is what we want. I now think that there is a mistake in my
>>> code in this series for ahci.
>>>
>>> So I think we need for ahci:
>>>
>>> can_queue = 33 >
>> Hmm.. For ATA, can_queue should be only 32. nr_tags is going to be 33
>> though as we include one tag for a reserved command. No ? (may be I
>> misunderstand can_queue though).
> 
> Yes, we want nr_tags=33. But according to semantics of can_queue, it 
> includes total of regular and reserved tags. This is because tag_set 
> depth is total of regular and reserved tags, and we subtract reserved 
> tags from total depth in blk_mq_init_bitmaps():
> 
> int blk_mq_init_bitmaps(.., unsigned int queue_depth, unsigned int 
> reserved, ..)
> {
> 	unsigned int depth = queue_depth - reserved;
> 	...
> 
> 	if (bt_alloc(bitmap_tags, depth, round_robin, node
> 
> 
> So we want a change like this as well:
> 
> diff --git a/drivers/ata/ahci.h b/drivers/ata/ahci.h
> index da7ee8bec165..cbcc337055a7 100644
> --- a/drivers/ata/ahci.h
> +++ b/drivers/ata/ahci.h
> @@ -390,7 +390,7 @@ extern const struct attribute_group 
> *ahci_sdev_groups[];
>   */
> #define AHCI_SHT(drv_name)                                             \
>         __ATA_BASE_SHT(drv_name),                                       \
> -       .can_queue              = AHCI_MAX_CMDS,                        \
> +       .can_queue              = AHCI_MAX_CMDS + 1,                    \
>         .sg_tablesize           = AHCI_MAX_SG,                          \
>         .dma_boundary           = AHCI_DMA_BOUNDARY,                    \
>         .shost_groups           = ahci_shost_groups,
> 
> I know it seems strange, but still 32 tags will only ever be available 
> for non-internal commands (as it is today) and 1 for ata internal command.
> 
>>
>>> nr_reserved_cmds = 1
>>>
>>> while I only have can_queue = 32
>>
>> Which seems right to me.
>>
>>>
>>> I need to check that again for ahci driver and AHCI SHT...
>>>
>>>> But for CDL command completion handling, we
>>>> will need a NCQ command to do a read log, to avoid forcing a queue drain.
>>>> For that to reliably work, we'll need a 31+1+1 setup...
>>>>
>>>
>>> So is your idea to permanently reserve 1 more command from 32 commands ?
>>
>> Yes. Command Duration Limits has this weird case were commands may be
>> failed when exceeding their duration limit with a "good status" and
>> "sense data available bit" set. This case was defined to avoid the queue
>> stall that happens with any NCQ error. The way to handle this without
>> relying on EH (as that would also cause a queue drain) is to issue an
>> NCQ read log command to fetch the "sense data for successful NCQ
>> commands" log, to retrieve the sense data for the completed command and
>> check if it really failed or not. So we absolutely need a reserved
>> command for this, Without a reserved command, it is a nightmare to
>> support (tag reuse would be another solution, but it is horrible).
>>
>>> Or re-use 1 from 32 (and still also have 1 separate internal command)?
>>
>> I am not yet 100% sure if we can treat that internal NCQ read log like
>> any other read/write request... If we can, then the 1-out-of-32
>> reservation would not be needed. Need to revisit all the cases we need
>> to take care of (because in the middle of this CDL completion handling,
>> regular NCQ errors can happen, resulting in a drive reset that could
>> wreck everything as we lose the sense data for the completed requests).
>>
>> In any case, I think that we can deal with that extra reserved command
>> on top of you current series. No need to worry about it for now I think.
>>
> 
> So are you saying that you are basing current CDL support on libata 
> internally managing this extra reserved tag (and so do not need this 
> SCSI midlayer reserved tag support yet)?

Not really. For now, it is using libata EH, that is, when we need the
internal command for the read log, we know the device is idle and no
command is on-going. So we send a non-NCQ command which does not have a tag.

Ideally, all of this should use a real reserved tag to allow for an NCQ
read log outside of EH, avoiding the drive queue drain.

> 
> Thanks,
> John

-- 
Damien Le Moal
Western Digital Research

