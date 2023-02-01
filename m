Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7EF067F353
	for <lists+linux-ide@lfdr.de>; Sat, 28 Jan 2023 01:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232216AbjA1Av5 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 27 Jan 2023 19:51:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjA1Avw (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 27 Jan 2023 19:51:52 -0500
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B3F7D2B1
        for <linux-ide@vger.kernel.org>; Fri, 27 Jan 2023 16:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1674867110; x=1706403110;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=h7HJst5pTVD4tI4PoTjmbvCy7uRR3w+1cYqbNxk7D+s=;
  b=CJqQXmzZ9vsDc/QBlqrhdFG26Q5smL+e5JYC9jui43+FE9usko/Jv/n6
   xeQG/N3QgYzl1rqjOcdIZeVPMdprJiLcSCwR8HAJmeYa2Oj1y//cpTlLI
   YtPdVZ9QYuf75D4s5VIU42vSzUSs5xO8CjpAq/ZFp8MovvdGK1zwBg6rb
   ft21BYUrHcSxxBESmXDr8aZ4/lF8hOuhAMb9b/dOjMHOTYJG3m1PldNAL
   nDJyuun3E9IKuX6vYq1VStDN5UDLvbOpflaNjN925n56+qlSfVrR7bkQh
   UYFhfBMIdLYyXA5YBtVcQ1ZSIqnJgstjrqlK6b+uSd6uADywgyMSWzmEx
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,252,1669046400"; 
   d="scan'208";a="220264670"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2023 08:51:48 +0800
IronPort-SDR: jEhhHYqrAvD06oGVSLnV5GJoNcMfl7LN6gBgksmL/6LWAOJLY/+lchwnBuCMBdiLVbBdNXlqpT
 Pbn91tDI1j+/0GGo5iIbSgFB/gAKPacWU/RDqqtUia9dLZdQam8GMw3mFJtKShRX2VYrgJ/YWW
 jogvYZTHgRbuw4n3SlBL91y5gxXS7oF8IAq8AsfDaEJFcwJFDzw8k8fW6i5VXSY4XUcRiOPVpK
 ltXdprvI3pJI8o36vqv5USt95uCrf3F4jXXDvVAhmxOXql8ZPBaCYdULLGYC1/G3E4ZQTAbVyR
 vRI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jan 2023 16:03:33 -0800
IronPort-SDR: 4RU4b7YhHsNL2e7N4sR727/4K70r0+70s20o4229O0qIiK6tgDs9uL9yCsnobgNtFCE+jNZK25
 x2Ey+1faOg85uuk0MYfnpm83/zRBZ5A+/XdxvAno00I0My82kgURApy+6EsR4KKwYh2uuAf8Aq
 JO8sQuZYq9ppsTzEjB9R+5UL1Hhay8JmjBoLhIFQ4x2s0KaBXh7oOV7XAKwwRqgNtjRQqg0tun
 ZEuPcVTYSF5nqdBTGfxSu0d7EC0lbz/RbW+DdueQVL31OyFRPmJ8WDPM/m191rCAyun3AuTCar
 JGg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jan 2023 16:51:49 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P3bVr4WQtz1Rwtl
        for <linux-ide@vger.kernel.org>; Fri, 27 Jan 2023 16:51:48 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1674867107; x=1677459108; bh=h7HJst5pTVD4tI4PoTjmbvCy7uRR3w+1cYq
        bNxk7D+s=; b=At8TcGXn8NZI++9iOEcoMCsPW6ZshSEv/oDt2iL3VqM5hCcQOMk
        1Xk0GljZY2PZ2FyOx/11i0zGNF/kqeKJ//aLzCsjdIAQmuuQYSgRdze1/3GzlEax
        +8dEkuRzhUzRXWMN6D5RxCnhzmdk3HejhKMP9ccSnJWYriDQH+CsiySMIK9A6MA/
        dNxMoQnWTMxlv5bnSl2Ppwml84nnKJ1FGn3yOiFK7j/5PXANcMvJ8RWm06Ip8PlM
        UjsiRikqd/LqdMzho30/WZ84XzwAvQHSakTLAdpc3ccVbet6+wxMAjZ1S5m/9CXN
        tfwKjVSqrfymGr1eXXK+Vz0N7ko4tV2+1Ng==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id bMR78045pAdu for <linux-ide@vger.kernel.org>;
        Fri, 27 Jan 2023 16:51:47 -0800 (PST)
Received: from [10.225.163.66] (unknown [10.225.163.66])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P3bVp2CsXz1RvLy;
        Fri, 27 Jan 2023 16:51:46 -0800 (PST)
Message-ID: <99e6b267-6e2e-2233-19c2-1acf7c9135b2@opensource.wdc.com>
Date:   Sat, 28 Jan 2023 09:51:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 07/18] scsi: sd: detect support for command duration
 limits
Content-Language: en-US
To:     Hannes Reinecke <hare@suse.de>,
        Niklas Cassel <niklas.cassel@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Christoph Hellwig <hch@lst.de>, linux-scsi@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-block@vger.kernel.org
References: <20230124190308.127318-1-niklas.cassel@wdc.com>
 <20230124190308.127318-8-niklas.cassel@wdc.com>
 <f0793325-3022-e7b8-672d-00f2f9ee0cd9@suse.de>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <f0793325-3022-e7b8-672d-00f2f9ee0cd9@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 1/27/23 22:00, Hannes Reinecke wrote:
> On 1/24/23 20:02, Niklas Cassel wrote:
>> From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
>>
>> Detect if a disk supports command duration limits. Support for
>> the READ 16, WRITE 16, READ 32 and WRITE 32 commands is tested using
>> the function scsi_report_opcode(). For a disk supporting command
>> duration limits, the mode page indicating the command duration limits
>> descriptors that apply to the command is indicated using the rwcdlp
>> and cdlp bits.
>>
>> Support duration limits is advertizes through sysfs using the new
>> "duration_limits" sysfs sub-directory of the generic device directory,
>> that is, /sys/block/sdX/device/duration_limits. Within this new
>> directory, the limit descriptors that apply to read and write operatio=
ns
>> are exposed within the read and write directories, with descriptor
>> attributes grouped together in directories. The overall sysfs structur=
e
>> created is:
>>
>> /sys/block/sde/device/duration_limits/
>> =E2=94=9C=E2=94=80=E2=94=80 perf_vs_duration_guideline
>> =E2=94=9C=E2=94=80=E2=94=80 read
>> =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 1
>> =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 duration_guideline
>> =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 duration_guideline_policy
>> =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 max_active_time
>> =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 max_active_time_policy
>> =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 max_inactive_time
>> =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80=
 max_inactive_time_policy
>> =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 2
>> =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 duration_guideline
>> ...
>> =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 page
>> =E2=94=94=E2=94=80=E2=94=80 write
>>      =E2=94=9C=E2=94=80=E2=94=80 1
>>      =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 duration_guidel=
ine
>>      =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 duration_guidel=
ine_policy
>> ...
>>
>> For each of the read and write descriptor directories, the page
>> attribute file indicate the command duration limit page providing the
>> descriptors. The possible values for the page attribute are "A", "B",
>> "T2A" and "T2B".
>>
>> The new "duration_limits" attributes directory is added only for disks
>> that supports command duration limits.
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
>> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
>> ---
>>   drivers/scsi/Makefile |   2 +-
>>   drivers/scsi/sd.c     |   2 +
>>   drivers/scsi/sd.h     |  61 ++++
>>   drivers/scsi/sd_cdl.c | 764 ++++++++++++++++++++++++++++++++++++++++=
++
>>   4 files changed, 828 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/scsi/sd_cdl.c
>>
> I'm not particularly happy with having sysfs reflect user settings, but=
=20
> every other place I can think of is even more convoluted.
> So there.
>=20
>> diff --git a/drivers/scsi/Makefile b/drivers/scsi/Makefile
>> index f055bfd54a68..0e48cb6d21d6 100644
>> --- a/drivers/scsi/Makefile
>> +++ b/drivers/scsi/Makefile
>> @@ -170,7 +170,7 @@ scsi_mod-$(CONFIG_BLK_DEV_BSG)	+=3D scsi_bsg.o
>>  =20
>>   hv_storvsc-y			:=3D storvsc_drv.o
>>  =20
>> -sd_mod-objs	:=3D sd.o
>> +sd_mod-objs	:=3D sd.o sd_cdl.o
>>   sd_mod-$(CONFIG_BLK_DEV_INTEGRITY) +=3D sd_dif.o
>>   sd_mod-$(CONFIG_BLK_DEV_ZONED) +=3D sd_zbc.o
>>  =20
>> diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
>> index 45945bfeee92..7879a5470773 100644
>> --- a/drivers/scsi/sd.c
>> +++ b/drivers/scsi/sd.c
>> @@ -3326,6 +3326,7 @@ static int sd_revalidate_disk(struct gendisk *di=
sk)
>>   		sd_read_write_same(sdkp, buffer);
>>   		sd_read_security(sdkp, buffer);
>>   		sd_config_protection(sdkp);
>> +		sd_read_cdl(sdkp, buffer);
>>   	}
>>  =20
>>   	/*
>> @@ -3646,6 +3647,7 @@ static void scsi_disk_release(struct device *dev=
)
>>  =20
>>   	ida_free(&sd_index_ida, sdkp->index);
>>   	sd_zbc_free_zone_info(sdkp);
>> +	sd_cdl_release(sdkp);
>>   	put_device(&sdkp->device->sdev_gendev);
>>   	free_opal_dev(sdkp->opal_dev);
>>  =20
> Hmm. Calling this during revalidate() makes sense, but how can we ensur=
e=20
> that we call revalidate() when the user issues a MODE_SELECT command?

Given that CDLs can be changed with a passthrough command, I do not think=
 we can
do anything about that, unfortunately. But I think the same is true of ma=
ny
things like that. E.g. "let's turn onf/off the write cache without the ke=
rnel
noticing"... But given that on a normal system only privileged applicatio=
ns can
do passthrough, if that happens, then the system has been hacked or the u=
ser is
shooting himself in the foot.

cdl-tools project (cdladm utility) uses passtrhough but triggers a revali=
date
after changing CDLs to make sure sysfs stays in sync.

As Christoph suggested, we could change all this to an ioctl(GET_CDL) for
applications... But sysfs is so much simpler in my opinion, not to mentio=
n that
it allows access to the information for any application written in a lang=
uage
that does not have ioctl() or an equivalent.

cdl-tools has a test suite all written in bash scripts thanks to the sysf=
s
interface :)

>=20
> Other than that:
>=20
> Reviewed-by: Hannes Reinecke <hare@suse.de>
>=20
> Cheers,
>=20
> Hannes

--=20
Damien Le Moal
Western Digital Research

