Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDA6354D89D
	for <lists+linux-ide@lfdr.de>; Thu, 16 Jun 2022 04:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349884AbiFPCrQ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 15 Jun 2022 22:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350066AbiFPCrP (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 15 Jun 2022 22:47:15 -0400
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 761FD46B17
        for <linux-ide@vger.kernel.org>; Wed, 15 Jun 2022 19:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1655347634; x=1686883634;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=V39QHtDc8ZGDX6evTrJaCU7/qqstpDRwkxEs8NSe5TQ=;
  b=daGxh8Kqv/519AhGGYdiKN04Vu7aSq3HJk4XigbKu2DUsdpvzOLF30ne
   eMA5vgNoFo06pM6R66fzb6l+SdYnFi4UZ1cqaT/vlROeuf0TDuz7ANabb
   nJHEyXpyfnwRX0PcgRuywHCLmgEyRwfrISnSuM0TJypSIRDKslb8vtfR0
   92Nly3/6f1PvCWzJ8/dsR7fqDhTHKK0x4E3tbXtyw/DuISN8hp9E8kwxa
   0k7YUf2WbpkeaHymX8I3X7IDPVmdGErvEDurFDF9/V2/TQHQ2z+QsKV2r
   pE7z8wC4LBAY7twq2g3C/R+HmOFlPbON/g2VZEmXFhPL3BhiROQC5dSwh
   A==;
X-IronPort-AV: E=Sophos;i="5.91,302,1647273600"; 
   d="scan'208";a="315364296"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 16 Jun 2022 10:47:09 +0800
IronPort-SDR: TYH6I2HHkHZvj8V8nBdnRv0s+6zHBs1NCtOmMMPS4psV4ezynmz1UdmR6vF0H85J5np1IkHtto
 QAz9mMt13cHvp1vX+MvuHX2FZrnivV82czQXF43Lm+sKN9jxjPdoD5Q3UcRPzrI81jgV4VDz2j
 5kl1JVV3eRwikYLItRWcra5vauVW1QhADwDYZKHK4OT24BVzXUlTLUy++f9hz6BCO6BNk4TKPo
 11hUUfpJ6l0+Fz5iryDD3wYL4ER5fRj3NkUI01cFaZR+mx+P+CIojomQlSLFA53C7pVo6P0Giz
 GOZE1hYM9gBeT0zAQTkS/l8F
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Jun 2022 19:09:59 -0700
IronPort-SDR: WgxHJsxwTrfIByPpwkJLLs0y+qxnQtRBsl0vBjg8EiA9THsypnDSwRM102l8uLnxC13+dwejZL
 DsLMuF1KueESJ43u+nG2v8Rh/GiZOP4BcBce5GKxgXNdc7vRZjFN6EYmlwgam5Bw6TYYf+lErg
 SL/AQq/DTy+K2vWsnSMQyG8ACAHALyNNIiWgR3osMx/IScc5ahF0PCh+U4dHyRiIpx2g0R2Gm9
 sjfUTMn5RqxHB5Y8Hc+WRuZHEBEY58Gxb+pMYoj0MBC7JU4P3Ru9DmaBD12XK04rO4lTdvPTgv
 W74=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Jun 2022 19:47:09 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LNmmD3r5cz1SVp8
        for <linux-ide@vger.kernel.org>; Wed, 15 Jun 2022 19:47:08 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1655347627; x=1657939628; bh=V39QHtDc8ZGDX6evTrJaCU7/qqstpDRwkxE
        s8NSe5TQ=; b=qyf84KIgbeM9gHqxzGhqEchppSklzUAsS48UHw/vSFoMxpem7f1
        MJkvZ2RLdbrLGAghTnzYpw0sghTNZp55aqKDASg8JQnA9SPzOfkPxjNGqPaoAU5z
        YIj4WpTWCPshSrgGUudeUuyCpkjrvpjEp8QG6PW289e0GS461+krfSa8LtqYIR7l
        TRZazRy8rV+VmYv7zpsUtV06fKTHu+dS1iFEngax+9nLg9Kr/Sb+62/QKqXzHDXi
        VzjRjzzuDWcBWU7kfDlHKJl8yQ7UsjGRAwO2uvU2EAG0lWJzyFuryATBhuvGcDdv
        JEG16aBJrtXTevSTn3F+9dY8/x/xaDTqeaQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id mMP_oTpCowVc for <linux-ide@vger.kernel.org>;
        Wed, 15 Jun 2022 19:47:07 -0700 (PDT)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LNmm91mxvz1Rvlc;
        Wed, 15 Jun 2022 19:47:05 -0700 (PDT)
Message-ID: <c702f06e-b7da-92be-3c4f-5dd405600235@opensource.wdc.com>
Date:   Thu, 16 Jun 2022 11:47:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RFC v2 03/18] scsi: core: Implement reserved command
 handling
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>,
        Bart Van Assche <bvanassche@acm.org>, axboe@kernel.dk,
        jejb@linux.ibm.com, martin.petersen@oracle.com, brking@us.ibm.com,
        hare@suse.de, hch@lst.de
Cc:     linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        chenxiang66@hisilicon.com
References: <1654770559-101375-1-git-send-email-john.garry@huawei.com>
 <1654770559-101375-4-git-send-email-john.garry@huawei.com>
 <b4a0ede5-95a3-4388-e808-7627b5484d01@opensource.wdc.com>
 <9e89360d-3325-92af-0436-b34df748f3e2@acm.org>
 <e36bba7e-d78d-27b4-a0e2-9d921bc82f5d@opensource.wdc.com>
 <3a27b6ff-e495-8f11-6925-1487c9d14fa9@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <3a27b6ff-e495-8f11-6925-1487c9d14fa9@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 6/15/22 16:35, John Garry wrote:
> On 15/06/2022 00:43, Damien Le Moal wrote:
>> On 6/15/22 03:20, Bart Van Assche wrote:
>>> On 6/13/22 00:01, Damien Le Moal wrote:
>>>> On 6/9/22 19:29, John Garry wrote:
>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * This determines how many commands the H=
BA will set aside
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * for internal commands. This number will=
 be added to
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * @can_queue to calcumate the maximum num=
ber of simultaneous
>>>>
>>>> s/calcumate/calculate
>>>>
>>>> But this is weird. For SATA, can_queue is 32. Having reserved comman=
ds,
>>>> that number needs to stay the same. We cannot have more than 32 tags=
.
>>>> I think keeping can_queue as the max queue depth with at most
>>>> nr_reserved_cmds tags reserved is better.
>>>>
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * commands sent to the host.
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> +=C2=A0=C2=A0=C2=A0 int nr_reserved_cmds;
>>>
>>> +1 for Damien's request. I also prefer to keep can_queue as the maxim=
um
>>> queue depth, whether or not nr_reserved_cmds has been set.
>>
>> For non SATA drives, I still think that is a good idea. However, for=20
>> SATA,
>> we always have the internal tag command that is special. With John's
>> change, it would have to be reserved but that means we are down to 31 =
max
>> QD,
>=20
> My intention is to keep regular tag depth at 32 for SATA. We add an=20
> extra tag as a reserved tag. Indeed, this is called a 'tag', but it's=20
> just really the placeholder for what will be the ATA_TAG_INTERNAL reque=
st.
>=20
> About how we set scsi_host.can_queue, in this series we set .can_queue=20
> as max regular tags, and the handling is as follows:
>=20
> scsi_mq_setup_tags():
> tag_set->queue_depth =3D shost->can_queue + shost->nr_reserved_cmds
> tag_set->reserved_tags =3D shost->nr_reserved_cmds
>=20
> So we honour the rule that blk_mq_tag_set.queue_depth is the total tag=20
> depth, including reserved.
>=20
> Incidentally I think Christoph prefers to keep .can_queue at total max=20
> tags including reserved:
> https://lore.kernel.org/linux-scsi/337339b7-6f4a-a25c-f11c-7f701b42d6a8=
@suse.de/=20
>=20
>=20
>> so going backward several years... That internal tag for ATA does not
>> need to be reserved since this command is always used when the drive i=
s
>> idle and no other NCQ commands are on-going.
>=20
> So do you mean that ATA_TAG_INTERNAL qc is used for other commands apar=
t=20
> from internal commands?

No. It is used only for internal commands. What I meant to say is that=20
currently, internal commands are issued only on device scan, device=20
revalidate and error handling. All of these phases are done with the=20
device under EH with the issuing path stopped and all commands=20
completed, so no regular commands can be issued. Only internal ones, non=20
NCQ, using the ATA_TAG_INTERNAL. So strictly speaking, we should not=20
need to reserve that internal tag at all.

>=20
>>
>> So the solution to all this is a likely a little more complicated if w=
e
>> want to keep ATA max QD to 32.
>>
>=20
> thanks,
> John


--=20
Damien Le Moal
Western Digital Research
