Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9650C6105D3
	for <lists+linux-ide@lfdr.de>; Fri, 28 Oct 2022 00:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235612AbiJ0Wfg (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 27 Oct 2022 18:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235641AbiJ0Wfc (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 27 Oct 2022 18:35:32 -0400
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E194B4B8
        for <linux-ide@vger.kernel.org>; Thu, 27 Oct 2022 15:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1666910129; x=1698446129;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=H+7M2UuZtjw+FCc+KMjrmjoeHRhHt0w0ZWFxTeOO8oM=;
  b=pQeLcZjnBa0Zp22cwJuzOllEiOUjLwYcQvIkAaH53wHXoEWSVaDzw163
   jh6QZE5+Q/R4fTV75+HTgeu9fIcqNI7V01WzLGlmERd+dSpqtjsJ0R4a2
   rjhhJjmIcpd8mnO28FnyV298xth8Ic9t2JpmBnsfV8HC59kan4j3zynj2
   gbTUVBNG7L3IQHOMeeOkHRLtR63ivlNhgdrkML8MsRb0lBWm2FIPfXiXF
   pzqI2WH0vzOF9ztipdd9dwiNtWtuLQYbWR6RbOdvoKofyx9Vjgy+kDkT3
   vWiQ0eUuReOU3uNlCdnuj5kQEjishZ96lw7LgT1gckTMRpgYRKAaMCeeK
   g==;
X-IronPort-AV: E=Sophos;i="5.95,219,1661788800"; 
   d="scan'208";a="220083972"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2022 06:35:23 +0800
IronPort-SDR: x3h+VDQS8DbF0W5V4a3CsrsNOh1qx5vpI58TEMdC8eN6s3RRLeD5yN/3F5lP3f1BYEB6pC45Ri
 DWZNkAVqEHitCHnID9bWHxS8rAiINTM964hhOSsyESrHSXbqahXQhCNPxhkrcemrJ6FIBbeHZD
 jXU1DuvCrGB1N0OCZ2g8nZ1nBAeETFhl6upJbZwodx53Gtu7/8cPL+HJomd/UwQCjYJL+suiaN
 vAtiHlQxfEYEMeQ5q+jrCYxmvbapO3es3yROHbX2hcqDpkXSU5yvj46yvyXrDS1x73lsqEc6bG
 EnCOIR3abDzwi90QN7o5R4FH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Oct 2022 14:49:01 -0700
IronPort-SDR: C1cHUuWZuiAG81IP8VLdin5x2vuVPrTtMop1Ks8mOtbLQeZmFSUUw9PWNtCnSw6Gkp+t0MiXle
 +M2LIV9mUOagUkBvdE8gZHGTOrS2cqoemjPPGhnp/JLUTdCVYpec6Fc2YRSzwAqwqn1AuElHpi
 uh2uhMDgrFRxmHkerhFxxL9fpudwhJgEiVJ/+KJWFIh5Ndgetq2UN1vlmqVYSKyRCdbXYdwYvL
 3nWLebb5uLC70weDzdph+VXgRiB1QxCsPO3f2Ei7LHYfYcF1EqLebOIIjk2um0dgHIXbtWXv7P
 b4o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Oct 2022 15:35:23 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mz0qt2BgWz1RwvL
        for <linux-ide@vger.kernel.org>; Thu, 27 Oct 2022 15:35:22 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1666910121; x=1669502122; bh=H+7M2UuZtjw+FCc+KMjrmjoeHRhHt0w0ZWF
        xTeOO8oM=; b=B+2w+4zMhpTBwTuBm2aeKe/8yHd8OfbrM6CaxqALnXREUhZnEP0
        1ozDMDCo58W1o79ZWZi2INJd6Xj9qX/177p7EhCM4KCSkhqMBOYlpnLhSiXW3hxa
        9MC1N1+izEeQhOLU8pAcQUKjATlAkFi0Bvq9v/LzaKvl1Q1K+TImOU0GLH2MlzKs
        OVVdhZejIqs6sRokPc0lyQjkDzpgjL+vlMIOsXC6d+l7Wqh6eDiL2VdxVq3L/w5O
        H4XFAQaE+n9L9SK1xy9etDk0IDikG3puf24HT5mfeHJkhFVJvCKlBkmW9mC03ZKR
        hR4ThSv5qhbfdC/DWWtpNenvkJud8MvK2Zw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 7-_7XMAox1sP for <linux-ide@vger.kernel.org>;
        Thu, 27 Oct 2022 15:35:21 -0700 (PDT)
Received: from [10.225.163.15] (unknown [10.225.163.15])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mz0qp2LJDz1RvLy;
        Thu, 27 Oct 2022 15:35:18 -0700 (PDT)
Message-ID: <07028dac-d6cc-d707-db08-b92c365a6220@opensource.wdc.com>
Date:   Fri, 28 Oct 2022 07:35:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH RFC v3 2/7] ata: libata-scsi: Add
 ata_internal_queuecommand()
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>, Hannes Reinecke <hare@suse.de>,
        jejb@linux.ibm.com, martin.petersen@oracle.com, bvanassche@acm.org,
        hch@lst.de, ming.lei@redhat.com, niklas.cassel@wdc.com
Cc:     axboe@kernel.dk, jinpu.wang@cloud.ionos.com,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
        linuxarm@huawei.com, john.garry2@mail.dcu.ie
References: <1666693976-181094-1-git-send-email-john.garry@huawei.com>
 <1666693976-181094-3-git-send-email-john.garry@huawei.com>
 <08fdb698-0df3-7bc8-e6af-7d13cc96acfa@opensource.wdc.com>
 <83d9dc82-ea37-4a3c-7e67-1c097f777767@huawei.com>
 <3ef0347f-f3e2-cf08-2b27-f65a7afe82a2@suse.de>
 <ea0be367-a4e0-3cc2-c4c7-04d8db1714cd@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <ea0be367-a4e0-3cc2-c4c7-04d8db1714cd@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 10/28/22 02:23, John Garry wrote:
> On 27/10/2022 14:02, Hannes Reinecke wrote:
>>>>> =C2=A0 /**
>>>>> =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 ata_scsi_slave_config - Set SCSI d=
evice attributes
>>>>> =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 @sdev: SCSI device to examine
>>>>> diff --git a/include/linux/libata.h b/include/linux/libata.h
>>>>> index 8938b584520f..f09c5dca16ce 100644
>>>>> --- a/include/linux/libata.h
>>>>> +++ b/include/linux/libata.h
>>>>> @@ -1141,6 +1141,8 @@ extern int ata_std_bios_param(struct=20
>>>>> scsi_device *sdev,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sector_t capacity, int geom=
[]);
>>>>> =C2=A0 extern void ata_scsi_unlock_native_capacity(struct scsi_devi=
ce=20
>>>>> *sdev);
>>>>> =C2=A0 extern int ata_scsi_slave_config(struct scsi_device *sdev);
>>>>> +extern int ata_internal_queuecommand(struct Scsi_Host *shost,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct scsi_cmnd *scmd);
>>>>> =C2=A0 extern void ata_scsi_slave_destroy(struct scsi_device *sdev)=
;
>>>>> =C2=A0 extern int ata_scsi_change_queue_depth(struct scsi_device *s=
dev,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 int queue_depth);
>>>>> @@ -1391,7 +1393,8 @@ extern const struct attribute_group=20
>>>>> *ata_common_sdev_groups[];
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .slave_destroy=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D ata_scsi_slave_destroy,=C2=A0=C2=A0=C2=A0 \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .bios_param=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D ata_std_bios_param,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .unlock_native_capacity=C2=A0=C2=A0=C2=
=A0 =3D ata_scsi_unlock_native_capacity,\
>>>>> -=C2=A0=C2=A0=C2=A0 .max_sectors=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D ATA_MAX_SECTORS_LBA48
>>>>> +=C2=A0=C2=A0=C2=A0 .max_sectors=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D ATA_MAX_SECTORS_LBA48,\
>>>>> +=C2=A0=C2=A0=C2=A0 .reserved_queuecommand =3D ata_internal_queueco=
mmand
>>>>> =C2=A0 #define ATA_SUBBASE_SHT(drv_name)=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __ATA_BASE_SHT(drv_name),=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
>>>>
>>>
>>
>> But that means we can't use it before the SCSI host is initialized; so=
me=20
>> HBAs require to send commands before the host can be initialized prope=
rly.
>=20
> At what stage do you want to send these commands? The tags for the shos=
t=20
> are not setup until scsi_add_host() -> scsi_mq_setup_tags() is called,=20
> so can't expect blk-mq to manage reserved tags before then.
>=20
> If you are required to send commands prior to scsi_add_host(), then I=20
> suppose the low-level driver still needs to manage tags until the shost=
=20
> is ready. I guess that some very simple scheme can be used, like always=
=20
> use tag 0, since most probe is done serially per-host. But that's not a=
=20
> case which I have had to deal with yet.

In libata case, ata_dev_configure() will cause a lot of
ata_exec_internal_sg() calls for IDENTIFY and various READ LOG commands.
That is all done with non-ncq commands, which means that we do not requir=
e
a hw tag. But given that you are changing ata_exec_internal_sg() to call
alloc_request + blk_execute_rq_nowait(), how would these work without a
tag, at least a soft one ? Or we would need to keep the current code to
use ata_qc_issue() directly for probe time ? That will look very ugly...

>=20
> Thanks,
> John

--=20
Damien Le Moal
Western Digital Research

