Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBC05643F7F
	for <lists+linux-ide@lfdr.de>; Tue,  6 Dec 2022 10:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiLFJM7 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 6 Dec 2022 04:12:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiLFJM4 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 6 Dec 2022 04:12:56 -0500
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C33BC98
        for <linux-ide@vger.kernel.org>; Tue,  6 Dec 2022 01:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1670317975; x=1701853975;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4mt0j/vdtWfJcSSBLLsGjJ3hTgh4e+ZqWrii34fueUY=;
  b=FQtS63ojtH+dIXoo3bS9SDE3JEnu+vsoDpL8gvL0WvAleDHpiy31VnhN
   XA2OG6NmZxM57rhByJcq4Q2anCd/nENEc6NJTjpTDNS9d3zNpGB057QWD
   lzhPPn7Y3bOnyIsa30YOadVD6U5KsH8u4pywqwqD5LennCFBzpOMTEws+
   oVpjruQiIdIIuHsJzqyIVyG+dRQDWCFlyMRtoOaq/zr4U4L84uZlxPzOQ
   x/XtBA5Ja4h+aWT8SIfAZHEd9JtVnOZFrxnbWH1PH9TKtoAasjIKyEad9
   aC6SjjHAJJKY4r0OQNhyg6gqQSNVhlMOptXU2ASH0ljSTRBC/9u3et6Vs
   A==;
X-IronPort-AV: E=Sophos;i="5.96,220,1665417600"; 
   d="scan'208";a="217990542"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 06 Dec 2022 17:12:54 +0800
IronPort-SDR: 2Xf+COL3odsGEXw/nqIW76uBt9A23/bl1eDcL58HOmiaRFP96ASAR7zGAxKp76/66BsQggFhTr
 5G2TW+2Axx31ql/BKNl6TLvUbvvBziy48Az9LSbjMGDg+r8qps/iA400fUgF5YlRDN8uGEMdwY
 2rIvYzN0+Uq6ks+rB2uBhEK1tthh9tPy6Z5ExSHxcVmkK7hI5Ve7YK4pSEKK9lE4XrlOdxQjyE
 zbEOgqeNKhRQswimoez0CXdb1ealg5Xxszt9Xl6B8lU/JM+9jsgTQ20fJbM50H3AuJJW8bD06K
 9BA=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Dec 2022 00:31:26 -0800
IronPort-SDR: G+sFvQZ1llHdP7VuRRxNIsH0pgdOm2JaEm/vNO51FSM3sErpmbn2C4wUaMiq0VU67nnsb1XJuV
 gs2k1uLlVTxg3DaQGbjwU9i7o7A+3Dn0yQwWd+4LKiqg5wGF44Wqirikwhy5jDgZPScCYQ/mvQ
 ar6mlkTpD74qF++6DSYouPdXCFuFcgWsV+uYf1xppKiPwc13hJA+KRivSCPTRmcn2GIZwMRNSH
 i3CN7XHKT2h3qsCj235tuYekzMe6p3u5rNuAHVI0rqIW/9iyyADiRpTlfnfm0XLfj2ioI4ux1E
 aCw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Dec 2022 01:12:55 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NRF7T3xRYz1RwtC
        for <linux-ide@vger.kernel.org>; Tue,  6 Dec 2022 01:12:53 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1670317972; x=1672909973; bh=4mt0j/vdtWfJcSSBLLsGjJ3hTgh4e+ZqWri
        i34fueUY=; b=YNSyUHBzaAuo3ULsinKsC2zO2BLGCy3UVeDKqHthvVvj2MyBt8d
        KEQA8yVLkKSd3gfSQAQb+PnVDFrHNJOPeOWDJTZnqxUSC+Ho0Ti2B+p1EvLvsL/N
        YTcAFyY8G5NhmSY53yzHQKnA7VFtc0lu/fSJpEVtfTWx5DDw/bF0bn3He25govb3
        nsUWOBFCbvrWuB2DMh5kxLd8RuDY3UW9CQTp+uwXVKKZA10yT8vlvP5mtgB5qAM4
        6jsBpQKjgFNZczbuGXW4p5vOYBipJ4SzaNettuVsPzfmMC8JZtXYdENAZWY6nrpp
        Fa3zaxB3wUKjUdIMUf6tSq6VWTIjmxUTasw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id YBbH6iXOMlDF for <linux-ide@vger.kernel.org>;
        Tue,  6 Dec 2022 01:12:52 -0800 (PST)
Received: from [10.225.163.74] (unknown [10.225.163.74])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NRF7Q0fHvz1RvLy;
        Tue,  6 Dec 2022 01:12:49 -0800 (PST)
Message-ID: <fa2bc2b9-d74a-51a3-cb5f-80d04e145b27@opensource.wdc.com>
Date:   Tue, 6 Dec 2022 18:12:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: TI: X15 the connected SSD is not detected on Linux next 20221006
 tag
Content-Language: en-US
To:     Serge Semin <fancer.lancer@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Anders Roxell <anders.roxell@linaro.org>,
        Niklas Cassel <Niklas.Cassel@wdc.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        open list <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Carlos Hernandez <ceh@ti.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
References: <CADYN=9JiX-=PcKMzAcSm=p7Dh6kYT7Kbv-8kcNF0MQ4=1hFS5g@mail.gmail.com>
 <20221014140633.mlypet7skkxvt453@mobilestation>
 <CADYN=9LrKHRNMON3GA4piDvWeSWTASQ1u2=D30rXFdvo1L18bg@mail.gmail.com>
 <20221017155246.zxal2cfehjgaajcu@mobilestation>
 <CA+G9fYtYetV5sZVD14WkZxCE_tgTC4VVKm8BcBw5_NwXD6U=Sw@mail.gmail.com>
 <Y4cqcTRcni5H7UAU@x1-carbon>
 <CADYN=9KKGBXn-YkiiFxsUzsanTALbDV1c+tB0oUQPouE1idnuQ@mail.gmail.com>
 <20221205011105.4do4trbytq4bfw5b@mobilestation>
 <98670e23-6553-4788-8662-9403c480af82@app.fastmail.com>
 <f440a8ff-7657-c1be-e733-4ad69b6b7b0b@opensource.wdc.com>
 <20221206084637.olaflvqmxwoo467a@mobilestation>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20221206084637.olaflvqmxwoo467a@mobilestation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 12/6/22 17:46, Serge Semin wrote:
> On Mon, Dec 05, 2022 at 10:24:22PM +0900, Damien Le Moal wrote:
>> On 12/5/22 19:08, Arnd Bergmann wrote:
>>> On Mon, Dec 5, 2022, at 02:11, Serge Semin wrote:
>>>> On Thu, Dec 01, 2022 at 12:48:32PM +0100, Anders Roxell wrote:
>>>
>>>>>
>>>>>   for (i = 0; i < hpriv->n_clks; i++) {
>>>>> - if (!strcmp(hpriv->clks[i].id, con_id))
>>>>> + if (hpriv->clks && hpriv->clks[i].id &&
>>>>> +    !strcmp(hpriv->clks[i].id, con_id))
>>>>>   return hpriv->clks[i].clk;
>>>>>   }
>>>>
>>>> Indeed I should have taken into account that devm_clk_bulk_get_all()
>>>> can get unnamed clocks too. But checking the hpriv->clks pointer for
>>>> being not null is redundant, since the ahci_platform_get_resources()
>>>> procedure makes sure that the array is always allocated. At the very
>>>> least you shouldn't check the pointer in the loop, but can make sure
>>>> that the clks array is available before it.
>>>
> 
>>> Do you think this is otherwise the correct fix then? Any chance we
>>> can still get a version of it into 6.1?
> 
> I'll think of a better solution. But at this stage it seems like the
> best choice seeing the bindings permit having unnamed clocks
> specified.
> 
>>
>> If someone sends me a proper patch to apply, I can send a last PR for 6.1
>> to Linus before week end.
> 
> I'll submit the patch today. Thanks.

Anders just posted one. Can you review it please ?

> 
> -Serge(y)
> 
>>
>>
>>>
>>>      Arnd
>>
>> -- 
>> Damien Le Moal
>> Western Digital Research
>>

-- 
Damien Le Moal
Western Digital Research

