Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43B2667DB56
	for <lists+linux-ide@lfdr.de>; Fri, 27 Jan 2023 02:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbjA0BkK (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 26 Jan 2023 20:40:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjA0BkK (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 26 Jan 2023 20:40:10 -0500
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC912BF06
        for <linux-ide@vger.kernel.org>; Thu, 26 Jan 2023 17:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1674783608; x=1706319608;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=cvtPQ+idKz46qxzIcCfeLB7lg9OmoAyRicnhLSwep5A=;
  b=mN15xs0eBKBv51gbCv2IUhyPRxCxFbV02/qW21L2qy1zNAA+jcg1j9XG
   TXkr9Cy9qaAexZVHO3cQqUQxDPairZ0hTewXMaP9O+8q6N70VTZhQ/PWk
   GaFfqIGSO9LZaUKJanaNAc8FUNr2wgumJn5GXykfVnqgyQdRI1GYfonMV
   56FXakJEdbkl5fnjRiPpIF3an07Tv/VqSmm5JY3zXG6zlHpcNU5L8VtWn
   IahvdBn2OoM6C+TyH5Bsd/EgSw8VBV2SX7r0GagPjqO75QmJjtLaDzLyI
   i0tq0jRnrc8NjizUW37L7EPBHIs6g2BZRwNdNqCaePzTlU1rGeABsUHXZ
   A==;
X-IronPort-AV: E=Sophos;i="5.97,249,1669046400"; 
   d="scan'208";a="333839024"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 27 Jan 2023 09:40:07 +0800
IronPort-SDR: 7KFk4r6SxB6WGWQSAMFnec+9Dt42B2kOs6/OfEA38Dj0ZQn8xcH3bclEcj4gnIbjLw1OtNV0BI
 JV1vs+mnv5ABpAsNdmsRE0eh49KDQc8ZNw+pdIJFK/gCdowAqWStXc+mamag0aer1bc5zPboar
 aktACgkyFAVGPoAC0hZvWauE0FSDGhWl1B78h3JsG0YMBVacR6ym1c+yqWfiKaE9Y91DuXZY/7
 fpPyRwKJV3ar24Uy6P/yEk6Hga8gzXdv0n/D5pjeVWdpOGtJnhsQudbR+yUasjb212SSwbPsJ0
 AYg=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Jan 2023 16:51:53 -0800
IronPort-SDR: Hx9FX2sNKgYVb51jVtTjvPV4xs+rOn2qw2NHza7/R/XQw9Nja59fb3iCIOfsWFzVoUqed42qEp
 xB7B42GbSyUZhid6GBtK3UbPgtlrXFguUYel/tMfyl3zZgz+aSsLh///Oe9vn//Nezn0bzo/+P
 Xvh0O9zxrE+vuONzlNya2FiUX1lzwuNGEuz12ajcRzZ10c7F7S3sIUtmVhoYND8wAur1W9RhmN
 ZUL7DDFxnPEzMcj9ebktDesP+dDTOj991encTxr28AlA+NliRoRGwMt49hf/3Sb3rh9ieVG1u8
 MsE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Jan 2023 17:40:08 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P30d33GW6z1Rwrq
        for <linux-ide@vger.kernel.org>; Thu, 26 Jan 2023 17:40:07 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:references:to:from:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1674783606; x=1677375607; bh=cvtPQ+idKz46qxzIcCfeLB7lg9OmoAyRicn
        hLSwep5A=; b=gxVBNpnfzdd//k1B57yJX/XJEtGzavGIFMZ56ba+i6mdEl4JDSg
        QV7LtfXG8CUOcn43be5CnvpY3TrhjRqQN2+vUiPNLMc6oc5S9xczhPP7km28Ho6z
        0CQSAlcJklGUoprG53PgGOAKMrZn9Wp5biQNHFJUSg6tXYTeR6j4EBSrepcE4vzu
        u2a0sbICYE4N6CeKky8pT2ZndcSaoX8wYgpX+E7w7V2H3JUXU82Pat/XQCdNVVt/
        H1ocUczIUml4UsVNHLw0kuM9mmavwBb6eIGIaC63eaRhu74A5hjQN+Yw8IM5FMgP
        pz6xu03fJvkRs6QXn006DUWjdkLNUex24rw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Xaew2c3_2ngS for <linux-ide@vger.kernel.org>;
        Thu, 26 Jan 2023 17:40:06 -0800 (PST)
Received: from [10.225.163.63] (unknown [10.225.163.63])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P30d04pknz1RvLy;
        Thu, 26 Jan 2023 17:40:04 -0800 (PST)
Message-ID: <c8ef76be-c285-c797-5bdb-3a960821048b@opensource.wdc.com>
Date:   Fri, 27 Jan 2023 10:40:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 01/18] block: introduce duration-limits priority class
Content-Language: en-US
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     Bart Van Assche <bvanassche@acm.org>,
        Niklas Cassel <Niklas.Cassel@wdc.com>
Cc:     Paolo Valente <paolo.valente@linaro.org>,
        Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Hannes Reinecke <hare@suse.de>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
References: <20230124190308.127318-2-niklas.cassel@wdc.com>
 <bd0ce7ad-cf9e-a647-9b1e-cb36e7bbe30f@acm.org>
 <731aeacc-74c0-396b-efa0-f9ae950566d8@opensource.wdc.com>
 <873e0213-94b5-0d81-a8aa-4671241e198c@acm.org>
 <4c345d8b-7efa-85c9-fe1c-1124ea5d9de6@opensource.wdc.com>
 <5066441f-e265-ed64-fa39-f77a931ab998@acm.org>
 <275993f1-f9e8-e7a8-e901-2f7d3a6bb501@opensource.wdc.com>
 <e8324901-7c18-153f-b47f-112a394832bd@acm.org> <Y9Gd0eI1t8V61yzO@x1-carbon>
 <86de1e78-0ff2-be70-f592-673bce76e5ac@opensource.wdc.com>
 <Y9KF5z/v0Qp5E4sI@x1-carbon> <7f0a2464-673a-f64a-4ebb-e599c3123a24@acm.org>
 <29b50dbd-76e9-cdce-4227-a22223850c9a@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <29b50dbd-76e9-cdce-4227-a22223850c9a@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 1/27/23 09:18, Damien Le Moal wrote:
> On 1/27/23 02:33, Bart Van Assche wrote:
>> On 1/26/23 05:53, Niklas Cassel wrote:
>>> On Thu, Jan 26, 2023 at 09:24:12AM +0900, Damien Le Moal wrote:
>>>> But again, the difficulty with this overloading is that we *cannot* implement a
>>>> solid level-based scheduling in IO schedulers because ordering the CDLs in a
>>>> meaningful way is impossible. So BFQ handling of the RT class would likely not
>>>> result in the most ideal scheduling (that would depend heavily on how the CDL
>>>> descriptors are defined on the drive). Hence my reluctance to overload the RT
>>>> class for CDL.
>>>
>>> Well, if CDL were to reuse IOPRIO_CLASS_RT, then the user would either have to
>>> disable the IO scheduler, so that lower classdata levels wouldn't be prioritized
>>> over higher classdata levels, or simply use an IO scheduler that does not care
>>> about the classdata level, e.g. mq-deadline.
>>
>> How about making the information about whether or not CDL has been 
>> enabled available to the scheduler such that the scheduler can include 
>> that information in its decisions?
> 
> Sure, that is easy to do. But as I mentioned before, I think that is
> something we can do after this initial support series.
> 
>>> However, for CDL, things are not as simple as setting a single bit in the
>>> command, because of all the different descriptors, so we must let the classdata
>>> represent the device side priority level, and not the host side priority level
>>> (as we cannot have both, and I agree with you, it is very hard define an order
>>> between the descriptors.. e.g. should a 20 ms policy 0xf descriptor be ranked
>>> higher or lower than a 20 ms policy 0xd descriptor?).
>>
>> How about only supporting a subset of the standard such that it becomes 
>> easy to map CDLs to host side priority levels?
> 
> I am opposed to this, for several reasons:
> 
> 1) We are seeing different use cases from users that cover a wide range of
> use of CDL descriptors with various definitions.
> 
> 2) Passthrough commands can be used by a user to change a drive CDL
> descriptors without the kernel knowing about it, unless we spend our time
> revalidating the CDL descriptor log page(s)...
> 
> 3) CDL standard as is is actually very sensible and not overloaded with
> stuff that is only useful in niche use cases. For each CDL descriptor, you
> have:
>  * The active time limit, which is a clean way to specify how much time
> you allow a drive to deal with bad sectors (mostly read case). A typical
> HDD will try very hard to recover data from a sector, always. As a result,
> the HDD may spend up to several seconds reading a sector again and again
> applying different signal processing techniques until it gets the sector
> ECC checked to return valid data. That of course can hugely increase an IO
> latency seen by the host. In applications such as erasure coded
> distributed object stores, maximum latency for an object access can thus
> be kept low using this limit without compromising the data since the
> object can always be rebuilt from the erasure codes if one HDD is slow to
> respond. This limit is also interesting for video streaming/playback to
> avoid video buffer underflow (at the expense of may be some block noise
> depending on the codec).
>  * The inactive time limit can be used to tell the drive how long it is
> allowed to let a command stand in the drive internal queue before
> processing. This is thus a parameter that allows a host to tune the drive
> RPO optimization (rotational positioning optimization, e.g. HDD internal
> command scheduling based on angular sector position on tracks withe the
> head current position). This is a neat way to control max IOPS vs tail
> latency since drives tend to privilege maximizing IOPS over lowering max
> tail latency.
>  * The duration guideline limit defines an overall time limit for a
> command without distinguishing between active and inactive time. It is the
> easiest to use (the easiest one to understand from a beginner user point
> of view). This is a neat way to define an intelligent IO prioritization in
> fact, way better than RT class scheduling on the host or the use of ATA
> NCQ high priority, as it provides more information to the drive about the
> urgency of a particular command. That allows the drive to still perform
> RPO to maximize IOPS without long tail latencies. Chaining such limit with
> an active+inactive time limit descriptor using the "next limit" policy
> (0x1 policy) can also finely define what the drive should if the guideline
> limit is exceeded (as the next descriptor can define what to do based on
> the reason for the limit being exceeded: long internal queueing vs bad
> sector long access time).

Note that all 3 limits can be used in a single CDL descriptor to precisely
define how a command should be processed by the device. That is why it is
nearly impossible to come up with a meaningful ordering of CDL descriptors
as an increasing set of priority levels.

> 
>> If users really need the ability to use all standardized CDL features 
>> and if there is no easy way to map CDL levels to an I/O priority, is the 
>> I/O priority mechanism really the best basis for a user space interface 
>> for CDLs?
> 
> As you can see above, yes, we need everything and should not attempt
> restricting CDL use. The IO priority interface is a perfect fit for CDL in
> the sense that all we need to pass along from user to device is one
> number: the CDL index to use for a command. So creating a different
> interface for this while the IO priority interface exactly does that
> sounds silly to me.
> 
> One compromise we could do is: have the IO schedulers completely ignore
> CDL prio class for now, that is, have them assume that no IO prio
> class/level was specified. Given that they are not tuned to handle CDL
> well anyway, this is probably the best thing to do for now.
> 
> We still need to have the block layer prevent merging of requests with
> different CDL descriptors though, which is another reason to reuse the IO
> prio interface as the block layer already does this. Less code, which is
> always a good thing.
> 
>>
>> Thanks,
>>
>> Bart.
> 

-- 
Damien Le Moal
Western Digital Research

