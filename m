Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CAA858DA9B
	for <lists+linux-ide@lfdr.de>; Tue,  9 Aug 2022 16:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbiHIO56 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 9 Aug 2022 10:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243594AbiHIO55 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 9 Aug 2022 10:57:57 -0400
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 243E71D0FF
        for <linux-ide@vger.kernel.org>; Tue,  9 Aug 2022 07:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1660057076; x=1691593076;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=c4OlQACnlgF7EiwwjFivbcgriHsBbGqtJVrPmg09I08=;
  b=mlnDWfaYAlW2oTMQluhHEe3+Rgrxf8DYdelcVucD9FZlCDNoFtgb4hQF
   w7lltoJhDRIpbuHNlbUitNHEoSwW2cWEjq853sKBLkP+PP6+U7b+Ryb7C
   anpkwuTkuiasNHxX2gIudLYs27kWvP8U4oXty+89UqVxARjnN6IEdFm/9
   eXrLYlrDz6sDFWJwGJ/KuQOnOe5lm934Ev745f/+5tHcO60mAKwVpXzkG
   xFmyXPHqlr/XdLUiHGNjaSyeo8/kQC8L8fqQgLdGyu5u1K9qvSyqIidmG
   LII74K1KRwH50ZB+8DOdJ/D5PD9KXWElPUuqy81yM7G1KL3NWN53mjnVr
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,224,1654531200"; 
   d="scan'208";a="312532052"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 09 Aug 2022 22:57:53 +0800
IronPort-SDR: Hr/PeLb/SAR7tw4gicckv01ofvEpGS7D2SKO4ZbKSZG+uiWxXdAKyXmLWjDxY5ENUWDedUehVA
 6DqPGJzlqdnqXAY+t5rH2ol0YhBFRWNJHhGy7DBeu3bjZ9fFM8U2SMOqGes6orXZwTHJdX1hAY
 Yos+zbQN1xyMNxDZSyvOj9g0SUudsLGIKIY+7DBY6bF0sCiv78co9nJXspZqVGdGeS+C+W4PP4
 eEb800AgBqBNX3w1COM0c/1y+Rg+ZWcwj3z5ACUt0ISUSmPJSrM/Z1ZL3DTsDdNgOmYb9u4h8M
 Pv+EU7lG/K9+NoShFJXUuY+8
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Aug 2022 07:18:50 -0700
IronPort-SDR: goxXmy65uZV2PRWVvqUiG8vZUgiCY1fxG85UiN/HQfMdZ36tmE7W4crbGnoQXF3zelwWQFgpBg
 C2iSQ1FIwXh2W0TuqIVzQ7lpuFeDFu3F/6/fELAt/YEomv76yb+bqm8PtZ4lPu0rNmZ6OfqkFO
 2Ph6GFb15rw2l6JdNSh9TbTWSRXxIQi/hsXvn6DOZ570g3yeqrGLJbFdTJ4p46OOIPq4B/OAB2
 DJ9TOuJGh0DUqRGBfBorMhP0d0d2096iTZ2W+xWTdnJhH3WKqCSkjkPDlWUz7sB2u+D4xMx5KL
 1Qk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Aug 2022 07:57:55 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M2GQT4GMvz1Rwnl
        for <linux-ide@vger.kernel.org>; Tue,  9 Aug 2022 07:57:53 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1660057072; x=1662649073; bh=c4OlQACnlgF7EiwwjFivbcgriHsBbGqtJVr
        Pmg09I08=; b=HNpRgF5j2w9HqejYQ0X9G5Ul3dFnBEnCvkxyAIluWxIXUlajtFg
        sEm2OjDgO9kPJZyJN2SE1HC8MgxB4ODsjIMb95mxRDSG+/sUb7VVxaemq++S0f7s
        sCLZ1wxav1ztGG5zqEt31pyICJeuUYsSAgHCZI1SmIZsphI8Pzv3MjQe2MZ6bgV+
        XgXYzJrEJBqpyQqyNo/DAgMwI2cEqJzgK7p1DviN8tVnxV82b00QBq60rT/BYcnJ
        8CPnmNb+AMycv5u1wpOXCMLOHDiKWj11vMqC1DmSkWKvwmhVuwR8Y+IixBry47P0
        1m99yw5FjVKWZFJ3a/twW28rnbRNXDzHKfg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 49BhBSOoj5Gh for <linux-ide@vger.kernel.org>;
        Tue,  9 Aug 2022 07:57:52 -0700 (PDT)
Received: from [10.111.68.99] (c02drav6md6t.sdcorp.global.sandisk.com [10.111.68.99])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M2GQS1cFyz1RtVk;
        Tue,  9 Aug 2022 07:57:52 -0700 (PDT)
Message-ID: <ef84d2dd-84ea-e1c7-05ef-f0a082d4f7d0@opensource.wdc.com>
Date:   Tue, 9 Aug 2022 07:57:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0%
 regression
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>,
        kernel test robot <oliver.sang@intel.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-ide@vger.kernel.org, lkp@lists.01.org, lkp@intel.com,
        ying.huang@intel.com, feng.tang@intel.com,
        zhengjun.xing@linux.intel.com, fengwei.yin@intel.com
References: <YuzPMMnnY739Tnit@xsang-OptiPlex-9020>
 <1f498d4a-f93f-ceb4-b713-753196e5e08d@opensource.wdc.com>
 <3451fa5a-6229-073f-ae18-0c232cd48ed5@huawei.com>
 <16f03f81-a8c7-bacf-c74c-67231f7f7202@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <16f03f81-a8c7-bacf-c74c-67231f7f7202@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 2022/08/09 7:16, John Garry wrote:
> On 09/08/2022 10:58, John Garry wrote:
>>>>
>>>> commit: 0568e6122574dcc1aded2979cd0245038efe22b6 ("ata: libata-scsi:=
=20
>>>> cap ata_device->max_sectors according to shost->max_sectors")
>>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mas=
ter
>>>>
>>>> in testcase: stress-ng
>>>> on test machine: 96 threads 2 sockets Ice Lake with 256G memory
>>>> with following parameters:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0nr_threads: 10%
>>>> =C2=A0=C2=A0=C2=A0=C2=A0disk: 1HDD
>>>> =C2=A0=C2=A0=C2=A0=C2=A0testtime: 60s
>>>> =C2=A0=C2=A0=C2=A0=C2=A0fs: f2fs
>>>> =C2=A0=C2=A0=C2=A0=C2=A0class: filesystem
>>>> =C2=A0=C2=A0=C2=A0=C2=A0test: copy-file
>>>> =C2=A0=C2=A0=C2=A0=C2=A0cpufreq_governor: performance
>>>> =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0xb000280
>>>
>>> Without knowing what the device adapter is, hard to say where the=20
>>> problem is. I
>>> suspect that with the patch applied, we may be ending up with a small=
=20
>>> default
>>> max_sectors value, causing overhead due to more commands than necessa=
ry.
>>>
>>> Will check what I see with my test rig.
>>
>> As far as I can see, this patch should not make a difference unless th=
e=20
>> ATA shost driver is setting the max_sectors value unnecessarily low.
>=20
> For __ATA_BASE_SHT, we don't set max_sectors. As such, we default=20
> shost->max_sectors =3D SCSI_DEFAULT_MAX_SECTORS (=3D1024) in=20
> scsi_host_alloc(). I assume no shost dma mapping limit applied.
>=20
> Then - for example - we could select dev->max_sectors =3D=20
> ATA_MAX_SECTORS_LBA48 (=3D65535) in ata_dev_configure().
>=20
> So with commit 0568e6122574 we would have final max sectors =3D 1024, a=
s=20
> opposed to 65535 previously. I guess that the problem is something like=
=20
> this.
>=20
> If so, it seems that we would need to apply the shost dma mapping limit=
=20
> separately in ata_scsi_dev_config() and not use shost->max_sectors.

OK. Will have a look at that.

>=20
> thanks,
> John
>=20


--=20
Damien Le Moal
Western Digital Research
