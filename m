Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3982651652
	for <lists+linux-ide@lfdr.de>; Tue, 20 Dec 2022 00:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233105AbiLSXDs (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 19 Dec 2022 18:03:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232727AbiLSXB7 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 19 Dec 2022 18:01:59 -0500
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4A711A33
        for <linux-ide@vger.kernel.org>; Mon, 19 Dec 2022 15:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1671490851; x=1703026851;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ECzHKD874L/2s+q5yE96TXJkBaCiaKo5Ubu4WxCLDKE=;
  b=eenv7JfY1D63hG5U/XVHJtG0/ZrSH85Foj879vbm9ladvuDsBuh74Fzi
   qcsFhqymEe+fL7GW0vWScCEAXlLp21Ukn/JYN5r1SVd9cRQHOu/YQEDDv
   +BOMMsa4wXk7SjoSAIJV3mMuJ/5DyCyaX66EwVs0N6PWcgc2iTa4oEFbT
   Rq2xvd7nuSIGZlJxxM/8A94aGbID25ZOhyvGCdGsMiVTrHKlJLv9bS6kg
   qxJrwOcrcuhq2AENLuiA+AJ4NAsgUV9NCZh7++yhKUX91MAIBfxchm0X2
   m0CK8H/PGrcsixrxPUZKiPkxaYwiI852A31rNCpIpsHgL/rHLjHSBZfZ1
   g==;
X-IronPort-AV: E=Sophos;i="5.96,257,1665417600"; 
   d="scan'208";a="323388491"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2022 07:00:49 +0800
IronPort-SDR: qX0mQ9dSFV/WGvmUeS+gPGqqFkyiQPkIZu5jcaAOojsR42DDMAFEkkx0v1e3UrbpVacXQOr9uR
 e8tXOEFRhvi1u/M5E1Eg7kdK+3Fbh53gF9VTcqZJ5lQl3hauqnNz1WrybLoPqxGd95yb4BCtgo
 duEixF0mYKUhGbRykFx357u9EmJX/qp7K2vzjIQ/UcRjNBaydctbvgMoBpsAr3bB2Jy2ZNLpLu
 dR56hzFyEuAjOthBn6OpSTEF154SW410o0qYBbLKKy2bySuFFp6yaexeBmUBKlw8dWU5RgEbms
 gtU=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Dec 2022 14:13:19 -0800
IronPort-SDR: RO0b08pO3aGjzarIpchUHyAGhnU49RzziwsVjlnnZwFAuU5kOBbxG5Hy5EFG8TfbG0EQyxFnEH
 7DosWGC3Iatn9v0Wd96VLh4MKAodhzU0e9mtHR5fMD6UOI5647/W4tkpo04Beq1MAeItGoPeLs
 fculy4K4px9NZOprx7KPbFdnD7Ji8Jj/GZd0TwVyjPiHT4SL2l+r9iCnlPo9uxu+fa2GvIKtzh
 vEFtKt+b3hEidbUW+Lr/mCgZZdIB0UFDz2prQYLZn+lhTFDGi615C8m12vXII0FurJENn/wWsK
 y9Q=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Dec 2022 15:00:49 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NbZtl6jfwz1Rwrq
        for <linux-ide@vger.kernel.org>; Mon, 19 Dec 2022 15:00:47 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1671490846; x=1674082847; bh=ECzHKD874L/2s+q5yE96TXJkBaCiaKo5Ubu
        4WxCLDKE=; b=me+2UvV2aY1MHUjEtnV2BXljahbxCr7z4uvHHA6KBbrnXDUez3d
        Oz6bUwywYmSFcCAa40sacJUC+8+Qmd8VFKYApHMx4Hq2zBnYWr+a8bsdXa0mFoGX
        Uij1pHUq7GkqTTE5Qm+7dJCSxb0S7+dwkW6sFseouLr1P+gqqtNnM8m3zCROE6h6
        0TfuJVBZc/mTGn9vog47jFRGHv+hh2A2MOTcgNXdPAPy5VhZgUb6V/G5EXRicHjt
        XaEwT1h+ghp4wDVhWWnHuK4Rsgo9NMWXL+7y6GzzX2KYFyygv6dCt6K1+vy5VwyQ
        RzkAak8uiNAHcoVAULf69ZljDCVEsKqYRRw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id k8rfYKIhR0cj for <linux-ide@vger.kernel.org>;
        Mon, 19 Dec 2022 15:00:46 -0800 (PST)
Received: from [10.225.163.106] (unknown [10.225.163.106])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NbZtj0MVHz1RvLy;
        Mon, 19 Dec 2022 15:00:44 -0800 (PST)
Message-ID: <4489f80f-9f39-8f3f-5d10-6b113131e65c@opensource.wdc.com>
Date:   Tue, 20 Dec 2022 08:00:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH V2] scsi: libsas: Directly kick-off EH when ATA device
 fell off
Content-Language: en-US
To:     John Garry <john.g.garry@oracle.com>,
        Jason Yan <yanaijie@huawei.com>,
        Xingui Yang <yangxingui@huawei.com>, jejb@linux.ibm.com,
        martin.petersen@oracle.com, linux-ide@vger.kernel.org,
        hare@suse.com, hch@lst.de
Cc:     linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxarm@huawei.com, prime.zeng@hisilicon.com,
        kangfenglong@huawei.com
References: <20221216100327.7386-1-yangxingui@huawei.com>
 <565fcf28-ec53-8d74-00a3-94be8e5b60e4@oracle.com>
 <60ace19e-d029-f14d-9aac-d5cef83b5b64@huawei.com>
 <257dcd6c-2ffd-f518-9b13-c309348088d9@oracle.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <257dcd6c-2ffd-f518-9b13-c309348088d9@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 12/20/22 00:55, John Garry wrote:
> On 19/12/2022 15:28, Jason Yan wrote:
>>>> +=C2=A0=C2=A0=C2=A0 if (test_bit(SAS_DEV_GONE, &dev->state) && dev_i=
s_sata(dev))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sas_ata_device_link_abor=
t(dev, false);
>>>
>>> Firstly, I think that there is a bug in sas_ata_device_link_abort() -=
>=20
>>> ata_link_abort() code in that the host lock in not grabbed, as the=20
>>> comment in ata_port_abort() mentions. Having said that, libsas had=20
>>> already some dodgy host locking usage - specifically dropping the loc=
k=20
>>> for the queuing path (that's something else to be fixed up ... I thin=
k=20
>>
>> Taking big locks in queuing path is not a good idea. This will bring=20
>> down performance.
>=20
> But it is expected that ata_qc_issue() should be called with that the=20
> host lock grabbed (and keep it).
>=20
> I think that the reason libsas drops the lock is because some LLDD=20
> queuecommand CBs calls task_done() in some error paths. If we kept the=20
> lock held, then we could have a deadlock, for example:
>=20
> sas_ata_qc_issue (has lock) -> lldd_execute_task() =3D=20
> pm8001_queue_command() -> task_done() =3D sas_ata_task_done() -> grab h=
ost=20
> lock =3D> deadlock.

That should be easily solvable using a workqueue for doing task_done(), n=
o ?

>=20
> Thanks,
> John

--=20
Damien Le Moal
Western Digital Research

