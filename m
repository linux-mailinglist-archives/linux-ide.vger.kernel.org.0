Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADE895A88D8
	for <lists+linux-ide@lfdr.de>; Thu,  1 Sep 2022 00:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232117AbiHaWNt (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 31 Aug 2022 18:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232278AbiHaWNr (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 31 Aug 2022 18:13:47 -0400
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC8AE97F8
        for <linux-ide@vger.kernel.org>; Wed, 31 Aug 2022 15:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1661984026; x=1693520026;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=t+QQB2ovmypqh0IvRjTomNVLTIrFuSzML607jm/gpTo=;
  b=Zc4fu74mhLZukDnyobWSMy8xIptZ/04ZvPLomVer5AXwKsKrYytviuzs
   bquJW/db9pyiCKjFB5AjL/DtMIE38uPqIK4BU6BmCH8q44NYhQEKnQTya
   T9IwmsBT3XgV2vg5NRVJ0VNxoW15Su+1j8LfJONp1Qfm2LovzOLxEwmAO
   0CPiHMJFNJBh2prhPB3vchs4g7HRz5WpgJ58ccNpXqwJlyn5cITjC+QWJ
   lgwuf1wprHyvHW6OFLThF433SAiNCU9Sbn8uJnfH1SsMQtmL4SLS3nlvc
   R/9jNz6KYF88D+eDo1N3Y5/ZLdYlzvgrx3kAE2RUf/0iaAMfGztb5UR0E
   g==;
X-IronPort-AV: E=Sophos;i="5.93,279,1654531200"; 
   d="scan'208";a="208599324"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2022 06:13:40 +0800
IronPort-SDR: qY0M0oTIZBUWJVATAQx8qBT1UXoXarhBLqghNQpQTb7wmQOJLHmwl7g4Jva+btBCqSh7Q/cRwz
 ck3eEqxfdsa5UiilqLnZ90YGOz39jom8Clc70j+tz7GGlR91pmjwfX+mIrmvZl58T0xVKySlP9
 ps4Gh1QAz0B0BNjdhoDoMMmknkzr1eN2eWd+cxEiDH1HJppo2XfuGaA48ZztPUZMO2RPOJttyD
 Maf9jBacDhn84fF/XRRpJO83qzrKgaNYNMBCGaBlaJq9TYVaifsKD4vbOcQwzH+XCGmhesO2+W
 bqzL4MY+dC5p03GxrOwXn1bi
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 Aug 2022 14:28:48 -0700
IronPort-SDR: GPEcYf6SPe8l9gUkXG6toBWziUl2DBygdRq40tXvhYKUtvYouBT8/7uI2Y8DpaN+LCbD7Zooru
 VHI6pPkr8cu5jKw2FJrrmHDhFqrDj5o9YWrzRHU0VXJTHlNfa1knfYWsWMmAidiVtegQbA217r
 ZHfemnJoZpXlgYqVwSBOLjmoD5lCJl5q78JilZeKK7E43qD9bKtk+6yhbsTPo6/0dLJ771Rcgj
 /Pj5TAs8plV9WhAfA5Pr9vzIBtHkqN+zsk+rdd/UO5CHo9kWCsLSNN8omCu/UWbSw9v0OVyPY+
 J5Q=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 Aug 2022 15:13:41 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MHz382L0gz1RwqL
        for <linux-ide@vger.kernel.org>; Wed, 31 Aug 2022 15:13:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1661984019; x=1664576020; bh=t+QQB2ovmypqh0IvRjTomNVLTIrFuSzML60
        7jm/gpTo=; b=XvdNV+Wlc/XWJeKAtwwuGSiZKh6kmR7HeccoSHRUBgEZDF/WZEC
        YQr4lIyS4326M6hdnGWRPJNvzEXNgqN77e0Nj2G8jSEWuSv8hOnqhsJcUi57aAuC
        b99KlpP+JlgfKNUP2bZaokJvrhvUuswJxzP17qRcFh+dHeZsMF/MMNESaoM2nQW/
        bXDr3SAu5V0nd+Zz9hBHccUIUImoTuzDlTlD+IbJjEpMsoPpHbMeTuplxb6VlMyZ
        WO7Np2Gm78Fdae11hrwSMncBALm756wPtYPhPZvNFPs5NUnWM81xzy1aE5OX4Ge/
        XoaAaiffHezpV+ihsrGcbBz07nPL0f07SmQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id S1eP-MsYurD0 for <linux-ide@vger.kernel.org>;
        Wed, 31 Aug 2022 15:13:39 -0700 (PDT)
Received: from [10.225.163.52] (unknown [10.225.163.52])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MHz365ybXz1RvLy;
        Wed, 31 Aug 2022 15:13:38 -0700 (PDT)
Message-ID: <318b0452-9814-6276-95a5-10478e5a1b7d@opensource.wdc.com>
Date:   Thu, 1 Sep 2022 07:13:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/3] ata: ahci: Skip 200 ms debounce delay for AMD 300
 Series Chipset SATA Controller
Content-Language: en-US
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Mario Limonciello <Mario.Limonciello@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-ide@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20220321212431.13717-1-pmenzel@molgen.mpg.de>
 <20220321212431.13717-3-pmenzel@molgen.mpg.de>
 <BL1PR12MB5157DDFD5E75360F032346D3E2169@BL1PR12MB5157.namprd12.prod.outlook.com>
 <cc7b4426-f6a6-e6b1-4aaf-0a713ee3d388@opensource.wdc.com>
 <5fb6af7b-d84f-cbae-7eb1-543f3a7e53e4@molgen.mpg.de>
 <d9837420-1cbb-ed5e-7043-985d9eb9d065@opensource.wdc.com>
 <b3e4435d-335c-1aba-1920-c225b46d09e7@molgen.mpg.de>
 <f6c78650-f22f-fcaf-a660-b1fc4ea7f641@molgen.mpg.de>
 <22f69d9a-7d0d-a408-70b3-11295f14b82d@opensource.wdc.com>
 <67950993-2eb9-c180-7c80-98c9954c9b22@molgen.mpg.de>
 <85f8c8cb-b4b9-b3ed-e79f-a1a161c9b672@opensource.wdc.com>
 <65012735-0a92-1071-e8e0-9d101c247a64@molgen.mpg.de>
 <3135eed0-b7e3-42fa-5b6c-80360f34e428@opensource.wdc.com>
 <893fe832-d522-112e-53ec-0f030c15af0d@molgen.mpg.de>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <893fe832-d522-112e-53ec-0f030c15af0d@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 8/30/22 18:05, Paul Menzel wrote:
> Dear Damien,
>=20
>=20
> Sorry for the late reply, and thank you for your great work.
>=20
> Am 01.06.22 um 10:58 schrieb Damien Le Moal:
>> On 6/1/22 01:18, Paul Menzel wrote:
>>>>>> With that in mind, I am not planning to apply your previous patche=
s
>>>>>> for 5.18, as they would conflict and would only end up being churn
>>>>>> since the delay removal by default will undo your changes.
>>>>> Obviously, I do not agree, as this would give the a little bit more
>>>>> testing already, if changing the default is a good idea. Also, if t=
he
>>>>> conflict will be hard to resolve, I happily do it (the patches coul=
d
>>>>> even be reverted on top =E2=80=93 git commits are cheap and easy to=
 handle).
>>>>
>>>> The conflict is not hard to resolve. The point is that my patches ch=
anging
>>>> the default to no debounce delay completely remove the changes of yo=
ur
>>>> patch to do the same for one or some adapters. So adding your patche=
s now
>>>> and then my patches on top does not make much sense at all.
>>>>
>>>> If too many problems show up and I end up reverting/removing the pat=
ches,
>>>> then I will be happy to take your patches for the adapter you tested=
. Note
>>>> that *all* the machines I have tested so far are OK without a deboun=
ce
>>>> delay too. So we could add them too... And endup with a long list of
>>>> adapters that use the default ahci driver without debounce delay. Th=
e goal
>>>> of changing the default to no delay is to avoid that. So far, the ad=
apters
>>>> I have identified that need the delay have their own declaration, so=
 we
>>>> only need to add a flag there. Simpler change that listing up adapte=
rs
>>>> that are OK without the delay.
>>>>
>>>>> Anyway, I wrote my piece, but you are the maintainer, so it=E2=80=99=
s your call
>>>>> and I stop bothering you.
>>>
>>> I just wanted to inquire about the status of your changes? I do not f=
ind
>>> them in your `for-5.19` branch. As they should be tested in linux-nex=
t
>>> before the merge window opens, if these are not ready yet, could you
>>> please apply my (tested) patches?
>>
>> I could, but 5.19 now has an updated libata.force kernel parameter tha=
t
>> allows one to disable the debounce delay for a particular port or for =
all
>> ports of an adapter. See libata.force=3Dx.y:nodbdelay for a port y of
>> adapter x or libata.force=3Dx:nodbdelay for all ports of adapter x.
>=20
> This is commit 3af9ca4d341d (ata: libata-core: Improve link flags force=
d=20
> settings) [1]. Thank you, this is really useful, but easily overlooked.=
 ;-)
>=20
>> I still plan to revisit the arbitrary link debounce timers but I prefe=
r to
>> have the power management cleanup applied first. The reason is that li=
nk
>> debounce depends on PHY readiness, which itself depends heavily on pow=
er
>> mode transitions. My plan is to get this done during this cycle for
>> release with 5.20 and then fix on top the arbitrary delays for 5.21.
>=20
> Nice. Can you share the current status?

No progress. I need to put together a series with all the patches that
were sent already. Unless Mario can resend something ?

>> Is the libata.force solution OK for you until we have a final more sol=
id
>> fix that can benefit most modern adapters (and not just the ones you
>> identified)? If you do have a use case that needs a "nodbdelay" horkag=
e
>> due to some constraint in the field, then I will apply your patches, b=
ut
>> they likely will be voided by coming changes. Let me know.
>=20
> I think, applying the patch would be an improvement, as people wouldn=E2=
=80=99t=20
> need to update their Linux kernel command line, and I do not mind, if i=
t=20
> gets reverted/dropped later.

Let's see were the lpm stuff goes first.


--=20
Damien Le Moal
Western Digital Research
