Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E362550345
	for <lists+linux-ide@lfdr.de>; Sat, 18 Jun 2022 08:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbiFRGwh (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 18 Jun 2022 02:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiFRGwf (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 18 Jun 2022 02:52:35 -0400
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A795F48334
        for <linux-ide@vger.kernel.org>; Fri, 17 Jun 2022 23:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1655535155; x=1687071155;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8uHQ9MiiAPuzcAYC2a1/X5+Fg5Ls+OxZmIChY7eTPTo=;
  b=IeA4pbnPdM9in5Sty31gl+g86qDCziajXz6L8wmgPLjz5sUl5BD7+eQM
   kDSxu8+Hroj8fRTKEGavIb17l79vQ4NAxbYg6wV6SrEWcz6vDMXXzppYG
   w6vrtD0iEvQ2M2W0ah5MUbkrJSvIQxeCnzGe4WYA72SHdO9YmclT/G/Pa
   g+Dm5YzLKk3NODQ1B3wE8DKSqwhvliyImVGJ/oB4MKiYhVeWcIWO7VX8/
   nxy9xoEFUevYufAD2CRElYwomzOv8xK074AOgtgYO63x7Zj+IFxhBKBh9
   /D6TJqJPADDArGIrFyI7GRu+JsYV81w+E0ViXsOXk3mK0wQYpEiPUA5BT
   g==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650902400"; 
   d="scan'208";a="204259540"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 18 Jun 2022 14:52:33 +0800
IronPort-SDR: KCKGam5jWA7s7v10mbalMpC2RKowNTI+acsffijuGF1g8vghq1O+yLShMLalZDeCmoNIiLIoMz
 dreqsCSNl9Y9fSawpxCgTJV1+rWKMtYjCxZKmLipdiEpOm99rPSCJAahThOc1fAVBaRJEbxRHH
 3Hq9D9vMaQNchVQSdp4fpd17BIGsRunGCyxLGEDqPLsE88XouNAJ3IBnYH52b2e7Yohjd3GVIG
 q/AYaKRPP6/21lRvdwckE9kVqeNEKy8KBSW7hwVbgzi4amIlG5NBZpLVMFWojiRyHl4fTT6Jew
 bx5nUcMbGxTT1F+DcR0HJVnx
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2022 23:15:07 -0700
IronPort-SDR: HBJRhhR5I3g9zLBTzT4QJichsrajNjBfwGpYX4bdGqVJpDI258i9vUJZTE4qiwTV3p2bZj1ovL
 0K/KKTQaIZO9n1OpMxb+b6XEpbEZ9n3ayfdQKL+v6VFuzkSJQwOJeu1H3b4+ln5E/lmEjZE0qB
 JufZWnQOd75XCVj+imxM4hzsYXykQi1lmAuoqpkb2yEih/ZnXeRj/yoKc3cIOmy1lLSQ9WyOVE
 GadHcr4f1IXAU6xmShAl7ChAnktQiQB46lgVq3Q8Z/HBMgEpCg5rkpzh38umsdDHUEnxy7zwa8
 eRQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2022 23:52:33 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LQ66S1cY8z1SHwl
        for <linux-ide@vger.kernel.org>; Fri, 17 Jun 2022 23:52:32 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1655535151; x=1658127152; bh=8uHQ9MiiAPuzcAYC2a1/X5+Fg5Ls+OxZmIC
        hY7eTPTo=; b=TUpJ7+ebXL/gL11xJaFgaSyqdV1HX0y+gJhPQYh1RWrl/kfOvXD
        X9ibxuxriilkY06CD6RvqsfDaU9baWmtRaLLutlL5Okvyhqqghh/il1Za4PYSzB2
        oLDbJKOjPcWcd+eM/vIsmTPugdeDJTQnWlyGSHmLNlL6kzBsfrHuWdPTdfI87BbE
        8KxQc3vBGATGLW1RmJ+0tPNOuaSZ8dOeFfoXguxKbnKX0QJlAeBZzKTdqYInrQjR
        foSQI3moOeez0AhxAMYUnKTNdmxT8HvLOMYYhp2OAymPjrn5Ty6sm6ffs/kCwEnn
        ZJZ6ICx1nhiQcNLL8WXg7pGG2rqK47o+U5g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 8hZn-WVVIk5y for <linux-ide@vger.kernel.org>;
        Fri, 17 Jun 2022 23:52:31 -0700 (PDT)
Received: from [10.225.163.84] (unknown [10.225.163.84])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LQ66P39qWz1Rvlc;
        Fri, 17 Jun 2022 23:52:29 -0700 (PDT)
Message-ID: <f560ca8b-d921-d228-64f0-74e320f8af67@opensource.wdc.com>
Date:   Sat, 18 Jun 2022 15:52:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 12/23] ata: libahci: Extend port-cmd flags set with
 port capabilities
Content-Language: en-US
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Hans de Goede <hdegoede@redhat.com>,
        Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220610081801.11854-1-Sergey.Semin@baikalelectronics.ru>
 <20220610081801.11854-13-Sergey.Semin@baikalelectronics.ru>
 <d06e9910-527e-cfa2-f2df-737fb4799fe5@opensource.wdc.com>
 <20220615205819.uiqptkqm5qfdvrbj@mobilestation>
 <903e273a-9dc5-f0df-5391-e96e63318323@opensource.wdc.com>
 <20220617203100.jg2o7ponolaenf6r@mobilestation>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220617203100.jg2o7ponolaenf6r@mobilestation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 6/18/22 05:31, Serge Semin wrote:
> On Thu, Jun 16, 2022 at 09:28:18AM +0900, Damien Le Moal wrote:
>> On 2022/06/16 5:58, Serge Semin wrote:
>>> On Tue, Jun 14, 2022 at 05:32:41PM +0900, Damien Le Moal wrote:
>>>> On 6/10/22 17:17, Serge Semin wrote:
>>>>> Currently not all of the Port-specific capabilities listed in the
>>>>
>>>> s/listed/are listed
>>>>
>>>>> PORT_CMD-enumeration. Let's extend that set with the Cold Presence
>>>>> Detection and Mechanical Presence Switch attached to the Port flags [1] so
>>>>> to closeup the set of the platform-specific port-capabilities flags.  Note
>>>>> these flags are supposed to be set by the platform firmware if there is
>>>>> one. Alternatively as we are about to do they can be set by means of the
>>>>> OF properties.
>>>>>
>>>>> While at it replace PORT_IRQ_DEV_ILCK with PORT_IRQ_DMPS and fix the
>>>>> comment there. In accordance with [2] that IRQ flag is supposed to
>>>>> indicate the state of the signal coming from the Mechanical Presence
>>>>> Switch.
>>>>>
>>>>> [1] Serial ATA AHCI 1.3.1 Specification, p.27
>>>>> [2] Serial ATA AHCI 1.3.1 Specification, p.24, p.88
>>>>>
>>>>> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>>>>> Reviewed-by: Hannes Reinecke <hare@suse.de>
>>>>>
>>>>> ---
>>>>>
>>>>> Changelog v4:
>>>>> - Fix the DMPS macros name in the patch log. (@Sergei Shtylyov)
>>>>> ---
>>>>>  drivers/ata/ahci.h | 7 ++++++-
>>>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/ata/ahci.h b/drivers/ata/ahci.h
>>>>> index 7d834deefeb9..f501531bd1b3 100644
>>>>> --- a/drivers/ata/ahci.h
>>>>> +++ b/drivers/ata/ahci.h
>>>>> @@ -138,7 +138,7 @@ enum {
>>>>>  	PORT_IRQ_BAD_PMP	= (1 << 23), /* incorrect port multiplier */
>>>>>  
>>>>>  	PORT_IRQ_PHYRDY		= (1 << 22), /* PhyRdy changed */
>>>>> -	PORT_IRQ_DEV_ILCK	= (1 << 7), /* device interlock */
>>>>> +	PORT_IRQ_DMPS		= (1 << 7), /* mechanical presence status */
>>>>>  	PORT_IRQ_CONNECT	= (1 << 6), /* port connect change status */
>>>>>  	PORT_IRQ_SG_DONE	= (1 << 5), /* descriptor processed */
>>>>>  	PORT_IRQ_UNK_FIS	= (1 << 4), /* unknown FIS rx'd */
>>>>> @@ -166,6 +166,8 @@ enum {
>>>>>  	PORT_CMD_ATAPI		= (1 << 24), /* Device is ATAPI */
>>>>>  	PORT_CMD_FBSCP		= (1 << 22), /* FBS Capable Port */
>>>>>  	PORT_CMD_ESP		= (1 << 21), /* External Sata Port */
>>>>> +	PORT_CMD_CPD		= (1 << 20), /* Cold Presence Detection */
>>>>> +	PORT_CMD_MPSP		= (1 << 19), /* Mechanical Presence Switch */
>>>>>  	PORT_CMD_HPCP		= (1 << 18), /* HotPlug Capable Port */
>>>>>  	PORT_CMD_PMP		= (1 << 17), /* PMP attached */
>>>>>  	PORT_CMD_LIST_ON	= (1 << 15), /* cmd list DMA engine running */
>>>>> @@ -181,6 +183,9 @@ enum {
>>>>>  	PORT_CMD_ICC_PARTIAL	= (0x2 << 28), /* Put i/f in partial state */
>>>>>  	PORT_CMD_ICC_SLUMBER	= (0x6 << 28), /* Put i/f in slumber state */
>>>>>  
>>>>> +	PORT_CMD_CAP		= PORT_CMD_HPCP | PORT_CMD_MPSP |
>>>>> +				  PORT_CMD_CPD | PORT_CMD_ESP | PORT_CMD_FBSCP,
>>>>
>>>
>>>> What is this one for ? A comment above it would be nice.
>>>
>>> Isn't it obviously inferrable from the definition and the item name?
>>
> 
>> I am guessing from the name. Am I guessing OK ? A comment would still be nice.
>> Why just these bits ? There are more cap/support indicator bits in that port cmd
>> bitfield. So why this particular set of bits ? What do they mean all together ?
> 
> Normally the variable/constant name should be self-content (as the
> kernel coding style doc states and what the common sense suggests). So
> the reader could correctly guess its purpose/content/value. In this
> case PORT_CMD_CAP - means PORT CMD capabilities mask. All of the
> possible flags have been set in that mask. There are no more
> capabilities in the PORT CMD register left undeclared. That's why the
> name is selected the way it is and why I haven't added any comment in
> here (what the kernel coding style says about the over-commenting the
> code).

Yes, I understood from the name what it is. What I do NOT understand is
why all the feature bits are not there. Why this subset only ? A comment
about that would be nice so that the reason for it is not lost.

> 
>>
>> Sure I can go and read the specs to figure it out. But again, a comment would
>> avoid readers of the code to have to decrypt all that.
> 
> If you still insist on having an additional comment. I can add
> something like "/* PORT_CMD capabilities mask */". Are you ok with it?

That does not help on its own. The macro name says that already. I would
like a note about why only these features are selected.

> 
> -Sergey
> 
>>
>>>
>>> -Sergey
>>>
>>>>
>>>>> +
>>>>>  	/* PORT_FBS bits */
>>>>>  	PORT_FBS_DWE_OFFSET	= 16, /* FBS device with error offset */
>>>>>  	PORT_FBS_ADO_OFFSET	= 12, /* FBS active dev optimization offset */
>>>>
>>>>
>>>> -- 
>>>> Damien Le Moal
>>>> Western Digital Research
>>
>>
>> -- 
>> Damien Le Moal
>> Western Digital Research


-- 
Damien Le Moal
Western Digital Research
