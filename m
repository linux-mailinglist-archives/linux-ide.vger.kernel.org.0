Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABCD9682B9A
	for <lists+linux-ide@lfdr.de>; Tue, 31 Jan 2023 12:37:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbjAaLhG (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 31 Jan 2023 06:37:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbjAaLg7 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 31 Jan 2023 06:36:59 -0500
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0956CDF8
        for <linux-ide@vger.kernel.org>; Tue, 31 Jan 2023 03:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1675165018; x=1706701018;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gA2pIWlMZlIKc4EJKQFR0wQk92xrlZIShxykKJ4in54=;
  b=VYlzN+JWJ1D+gWU7huVHNW/b2Ofr6XaAq5BGn/Rhgzmm0YFycvdtVy7x
   edsMF1nrQjDbDGhThZ/QenfDjjMQ03iFeYZ+iLv9gTX8I24gfm2857JHt
   TaHoVfOBamNweIXbNT5g68p+AcmwROU2jLAkJNzzYNu4cI7lDpXsuQPkv
   Nz8I6wnV9uvbpj7dBqGdXaktyK+x7/n9IA7dJAxc7DLeIBGMcGLYKUKrs
   Tplby7o9pegBZwuCiem2ReNvETvJdnEzaVmUqO7kmQtC4y2mnHvqstVZ5
   6k8JAi3xuLTqbNBL0NqSlMi3G6smfOgC/MTvfAmXEWukBrNKjW+6s6kes
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,261,1669046400"; 
   d="scan'208";a="326459827"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 31 Jan 2023 19:36:57 +0800
IronPort-SDR: yKWpFgqgqvHfW3RehIxuLqI6V38WOmg9kdRmZjdAFFZ9a203JbJwsIchtHfKt2NBkma6G9/a3/
 T0CoYeEDITY4TXcF4lTIfvZLRb4+qULEtpPoO9OH1USWS0B+qldHUR87+L6yHTZ5bmwNC16jgy
 cBeTLPKvExHexspHu6porQzFA1lfov6oyokFj3jbAWcXRy+Ubm3PIC72lDlChVlGRbaFoORWh3
 JeDIPwDe+H9LPowEJ8/T8J8SlT87yQZMUuShYwIqiBag3jADQ56efSfRO1W5K1Hbi7HUMOWh8+
 5pU=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 Jan 2023 02:48:37 -0800
IronPort-SDR: XOBBxfpu1Cejp32olrDTwqY2x2ClUy4gYyUIzMI/LK06EmwMuJ8fjS4HvTiNQP6CHz0K9NMiTi
 j4UCA8EAAV8Mo/2lCqbk5sewttM7NPyPzOuK8ajSFxUS2X3HY9kF88gb+aKA8AE/fOhIdr2yN7
 DYrE1ONpToMrWDMF5AF1mlfQCRJjVoBIKh3h7NGQ7TbOwzYSAQGmiAQ/sCdi4BV/iU1nPrFy34
 0laDB+HGPt+Zf3ohjJPlL4nCBkDEDqWc8BgBkXsikX9p2l4GLLbLCPAuzP8AoKKvZ4LpF46yhI
 5CE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 Jan 2023 03:36:57 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P5jgs0P6Qz1RvTr
        for <linux-ide@vger.kernel.org>; Tue, 31 Jan 2023 03:36:57 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1675165016; x=1677757017; bh=gA2pIWlMZlIKc4EJKQFR0wQk92xrlZIShxy
        kKJ4in54=; b=hIWdUmu6yk9coI0UhFdgGB5/VD8gQosnLTC00nLyuZ8C7+yemTs
        /HNf+k2lJxLgAQmjsXrvJ5NeyTDbcgPJrQg0B1NyyGzgyxKwZ18Cp6V1+9/Q2KHC
        qc8OZTn6m2T6wIYynC52aWw3gNq3IzSRKHQfpyDCOAdSyo4oHSC+mUG+LI9s3+Z6
        5n3rhKZT2AsK8uwWDTfFDhYodIvfOOS6/khgwMgmaSK76jwY5XbYtf1krcZEYjUB
        ZhNobySuQnW+r6N9RMZRzIDtVsy8dNquz6NTACu5JEkwEn25dKk3FnvAeaIaQ8xo
        mqD4PeLqtUv6j32jk1EkOThbFqvANbIb6JQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id DBG6MChnzjEU for <linux-ide@vger.kernel.org>;
        Tue, 31 Jan 2023 03:36:56 -0800 (PST)
Received: from [10.225.163.70] (unknown [10.225.163.70])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P5jgq0bmTz1RvLy;
        Tue, 31 Jan 2023 03:36:54 -0800 (PST)
Message-ID: <1569ffb1-b23c-3f8c-6467-102f51426850@opensource.wdc.com>
Date:   Tue, 31 Jan 2023 20:36:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] drivers/block: Move PARIDE protocol modules to
 drivers/ata/pata_parport
Content-Language: en-US
To:     Ondrej Zary <linux@zary.sk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Jens Axboe <axboe@kernel.dk>, Tim Waugh <tim@cyberelk.net>,
        linux-block@vger.kernel.org, linux-parport@lists.infradead.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org
References: <d4f7ebd5-d90d-fb96-0fad-bd129ac162dc@opensource.wdc.com>
 <20230130211050.16753-2-linux@zary.sk>
 <e6041145-7336-2534-8449-7b9b6a842466@opensource.wdc.com>
 <202301311124.23302.linux@zary.sk>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <202301311124.23302.linux@zary.sk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 1/31/23 19:24, Ondrej Zary wrote:
> On Tuesday 31 January 2023, Damien Le Moal wrote:
>> On 1/31/23 06:10, Ondrej Zary wrote:
>>> diff --git a/drivers/Makefile b/drivers/Makefile
>>> index f1365608bc8c..de8aa561c95c 100644
>>> --- a/drivers/Makefile
>>> +++ b/drivers/Makefile
>>> @@ -98,7 +98,7 @@ obj-$(CONFIG_DIO)		+= dio/
>>>  obj-$(CONFIG_SBUS)		+= sbus/
>>>  obj-$(CONFIG_ZORRO)		+= zorro/
>>>  obj-$(CONFIG_ATA_OVER_ETH)	+= block/aoe/
>>> -obj-y		 		+= block/paride/
>>> +obj-$(CONFIG_PATA_PARPORT)	+= ata/pata_parport/
>>
>> It would be better to have this in drivers/ata/Makefile, not here, so that doing
>> something like:
>>
>> make -j64 M=drivers/ata W=1
>> or
>> make -j64 M=drivers/ata C=1
>>
>> actually also checks the parport protocol modules too.
>>
>> diff --git a/drivers/ata/Makefile b/drivers/ata/Makefile
>> index 23588738cff0..2f85812e16ef 100644
>> --- a/drivers/ata/Makefile
>> +++ b/drivers/ata/Makefile
>> @@ -114,6 +114,7 @@ obj-$(CONFIG_PATA_SAMSUNG_CF)       += pata_samsung_cf.o
>>
>>  obj-$(CONFIG_PATA_PXA)         += pata_pxa.o
>>
>> +obj-$(CONFIG_PATA_PARPORT)     += pata_parport/
>>  obj-$(CONFIG_PATA_PARPORT)     += pata_parport.o
>>
>> And then we could also have drivers/ata/pata_parport.c moved under
>> drivers/ata/pata_parport/ to tidy things up.
>>
>> If you agree, I can fix that up, that is easy to do.
> 
> OK, thank you.

All queued now. Thanks !

-- 
Damien Le Moal
Western Digital Research

