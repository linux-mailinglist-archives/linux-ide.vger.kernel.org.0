Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80BEE56D1F4
	for <lists+linux-ide@lfdr.de>; Mon, 11 Jul 2022 01:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiGJXME (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 10 Jul 2022 19:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGJXME (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 10 Jul 2022 19:12:04 -0400
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866C95FB9
        for <linux-ide@vger.kernel.org>; Sun, 10 Jul 2022 16:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1657494723; x=1689030723;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=y6n2xO56ccReruOffYR7/rcHB13U7RFfKAUPB4hruKU=;
  b=qiX3Ydx5Iq8xMofWvZL0OFqpCYOv+TeVFY3gqpKFNw9JN8Tml+zKNKOz
   Axm6JMVljx3fLSLcfuP2Zbo1FEe6jdoxPKxf3WahUUBjZJFwYPfWFlB9L
   23xoUkbXDYIT4mQkdd4YZD+b0ok3BFZSnST6CXsUSx0qTWP27P0qr5cxt
   5QufH2aH2JUPPD7f/d1pnIsACul0YSXfYgrITl5NOfl9D5yI4ITT9ttRv
   t69u4/wHINtQXWJyhW/t34B3mt/lQ8f1Ch6fTrdyDSpbPWrKfQLI2N/bC
   aTWMsbS1MEpQ9j3VnqB6VxRRmzHUkD0rI3Arf3nhN0OC492WtIVjmy/rB
   g==;
X-IronPort-AV: E=Sophos;i="5.92,261,1650902400"; 
   d="scan'208";a="317444933"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 11 Jul 2022 07:12:02 +0800
IronPort-SDR: oI8JSNscgpKSn2+u7E7dSekJcFsiJ3KsDfekWKkC1GFfKZ2R3Y5ylUe5U+2nyRrxx9boMBKRdS
 v1xs7TripY7sDKHXfOMZ5JsIDmOFlFR3PCtITiOvt8a9pRYatUdmRnsgv3n3hKkiuc+DBp2Oxs
 q95K5RRo1UYh4ZJpCqYIeR6vKv5RG3cDIE3dP3YX7c0luyGxxNaSLBT5Whbju8ewALokdb38qI
 sJy4cdDvQ6MQ+9/5HoUqg61g3gU4lJDXAAa/N9IICeCi+5PMtGOUoEpQn4bQ/nlB+sxt8zeocL
 as5fbFMmLxT9POJekZ+0ayfq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2022 15:33:40 -0700
IronPort-SDR: utAjjSLw1AgtNUFrOkUZDZ3OJlwlGaRWfYqBKI4jsg4+wjc+j0+Tnrnfpe35mxLlR7RpiPUV0O
 aAQtogLms+YlgoCCq/INQk20HhpsazWyM26ppCTBWnBaQSOxpCHiWTvKdV/gVuRgSMMHGufhP8
 vRB5eCAtNp28YJmMDHVnBsFttiWU7HpsQPmX3Qe2P61KXZ3QBb5Q8CNID2N4OA/8dFhCvf2zfU
 0vRaj9gretbmmzTmqf807n9TuTpsUTMc4uQaxmVJg37dbqq2650umJPQqVR1n18zrsDWaD+txP
 VHU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2022 16:12:03 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lh2pV12xnz1RwqM
        for <linux-ide@vger.kernel.org>; Sun, 10 Jul 2022 16:12:02 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1657494721; x=1660086722; bh=y6n2xO56ccReruOffYR7/rcHB13U7RFfKAU
        PB4hruKU=; b=dnjrd6Sl9EoZ7U+i192CYUEyM9kIQWPHutxp/22MNeUYorF0nZ+
        1e8JCWt6jPLOi3RTxrxoTVgPM3VUOARfuEFJXzHqPWZ1vcOnzblU3uW81ls3iEkQ
        Q65de0WR5dlbBgFvbITYQAXw90rGHK+KoitlKzp+EoZ35bhv5vitDa8Ile5SN/QM
        h1ynvRstMsdkhuHUZp8Kx6PUgcW1up9yWctm9ulinwgUJUGJe94eGJ8/8ve6ED9Z
        MhVz+uT+HXH2jzwDVNy4b19ZeEYSByc/Zbvfy7gTT5FsRD9cnYY/2RfHRj53ZffE
        4YlOejzQHqqRBpAJ4fmKvFW6Jjzfc0YWLGw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 8ZoSzcadxWp0 for <linux-ide@vger.kernel.org>;
        Sun, 10 Jul 2022 16:12:01 -0700 (PDT)
Received: from [10.225.163.114] (unknown [10.225.163.114])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lh2pS5TmLz1RtVk;
        Sun, 10 Jul 2022 16:12:00 -0700 (PDT)
Message-ID: <81f7fc52-1adf-a26b-3f43-5fdf975ee57c@opensource.wdc.com>
Date:   Mon, 11 Jul 2022 08:11:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drivers/ata: fix repeated words in comments
Content-Language: en-US
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Jilin Yuan <yuanjilin@cdjrlc.com>, s.shtylyov@omp.ru
Cc:     linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220710052203.12349-1-yuanjilin@cdjrlc.com>
 <cec12e246d7151f6041bf553629a3047e81d4afe.camel@HansenPartnership.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <cec12e246d7151f6041bf553629a3047e81d4afe.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 7/10/22 23:21, James Bottomley wrote:
> On Sun, 2022-07-10 at 13:22 +0800, Jilin Yuan wrote:
>> diff --git a/drivers/ata/libata-eh.c b/drivers/ata/libata-eh.c
>> index 3307ed45fe4d..f2ac8340e769 100644
>> --- a/drivers/ata/libata-eh.c
>> +++ b/drivers/ata/libata-eh.c
>> @@ -863,7 +863,7 @@ void ata_eh_fastdrain_timerfn(struct timer_list
>> *t)
>>   *
>>   *	Set ATA_PFLAG_EH_PENDING and activate fast drain if @fastdrain
>>   *	is non-zero and EH wasn't pending before.  Fast drain ensures
>> - *	that EH kicks in in timely manner.
>> + *	that EH kicks in timely manner.
> 
> The original is correct and the update doesn't make sense.  Of course
> adding an article would make the original read better ...

yep: ...that EH kicks in in a timely manner.

> 
> James
> 
> 


-- 
Damien Le Moal
Western Digital Research
