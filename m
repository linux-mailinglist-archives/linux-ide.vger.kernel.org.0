Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8FA255FE5D
	for <lists+linux-ide@lfdr.de>; Wed, 29 Jun 2022 13:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbiF2LSq (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 29 Jun 2022 07:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbiF2LSp (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 29 Jun 2022 07:18:45 -0400
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5FA02125B
        for <linux-ide@vger.kernel.org>; Wed, 29 Jun 2022 04:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1656501523; x=1688037523;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8DEsZcP8wnNuDkDTsKoZkNehiHn9QvzTdKDqdcGcm/U=;
  b=blSOznUXD0T3KISD0Pg0vcLFGZJl1/4SRrxF7PDHVCYT8sasr+F64fgq
   WIgoZr+0idXN1pHSp2gRkeEp/dSAE5uJj+hjF+/GFsWmL6DVCNsjEizJm
   uBKW0btCP1f5l3JkUy9C8dbcaQogNxtRnsUGHvclDXqGvruZmFkdwnDwM
   cnyAmhWBl4AuZIyvfsSLldSeYpUP9T/PhuiBooJewVeO5/n0FA2rU9s+i
   KvXraSikPLS1KmZChu4ioWYHpAUNMQdrV3P6EWeEgUyVfBDFNcoMyTRjZ
   agAAo+wGDvnA8rcvOY/+VXfOeWRRLKqKOdmkgZonHVSo2PLA1GoG4kHkB
   A==;
X-IronPort-AV: E=Sophos;i="5.92,231,1650902400"; 
   d="scan'208";a="203051771"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 29 Jun 2022 19:18:42 +0800
IronPort-SDR: 1JarDlInkV2jr/AqMDJieN44AvQ3rxMqESTnjVqGVAnaAygvAj6FgmNucP5fof47ur0/d6YMGT
 bLfHWCzUeBrRuLxdoEhvOXvE5PcARXJG8CKQvHX2zIcclUau76quM1TTApqydMjZCGbVBXp74J
 h3FnZBj9OH9+4NzrPiutYDcWoXZepme5ayqtEAdJ22FUxmS8wI2w+nQ34dSe/1Sc2aflbMkkA1
 FYJkR+dUwttoQOprn5L9O7VnqLoJycm48kDhC1CuRdlKocte23TcEZO7+H+mVQ1du2tJXZzaoI
 DCYUK6hBRWvDaY4ZT9PmkkOF
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Jun 2022 03:36:22 -0700
IronPort-SDR: N/50NhrmYMycXYKNvqFPiPD9T0LRB8J2IJImO+wbfU39VFwEeAc8m0XWFzEPB9AHGon6SRRZvC
 rXBMnXizIlKie80u0uyAgVOkc4uArVhMSkM9FjQliS9HizLflyTyLcCmnYdEs9kH99OX4FSi72
 Te4FDlwDh0IcTP4j1HWLhDsYp8rHEP58CloLBwuqncpGAKT5gPNKPknCODvXaMrgFlYWjY//iK
 vWekk1gNmMphEucFHGRAA46DAi55/Us6ZTvF+3yiiXRZeXgCq5aqymzRmdjusbqCjQZdOrYNfd
 cz0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Jun 2022 04:18:42 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LXzVV4tJGz1Rwnl
        for <linux-ide@vger.kernel.org>; Wed, 29 Jun 2022 04:18:42 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1656501522; x=1659093523; bh=8DEsZcP8wnNuDkDTsKoZkNehiHn9QvzTdKD
        qdcGcm/U=; b=JWDF71mJGb2IWvw1oNKGVMrot3qC8Q0V70BLGPr+42MHvIeqKez
        utVbe6sM3GczzDvhOj/XV1Lvdd9A5voKMbCAr/+qWRUNHLTH9tujow6Wv/+SIhf+
        +JnrHBwZykNYo9Sz4/oIsBWrSZJ9joy5gzXkfSn1h3Emr8gacYoPteLuZISjfsVa
        bwySsHOjqPLn2afj+z8KqXCR61BLd2r3Ryk/RPhvCGRVVhuOrlCxV8XjMeplMpr2
        QLA+Iz3J0gx0Mhsp7R9WaCbuSrVo/GkuEmBkhrBc7+5ahtUmAPfe8uOEkEec5X3P
        CuR2KSvz5oMjpS9Jrawl4lXr5F9hAiJrD7w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id t1loXUf3M7pK for <linux-ide@vger.kernel.org>;
        Wed, 29 Jun 2022 04:18:42 -0700 (PDT)
Received: from [10.225.163.99] (unknown [10.225.163.99])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LXzVT42sjz1RtVk;
        Wed, 29 Jun 2022 04:18:41 -0700 (PDT)
Message-ID: <8227ef6a-665f-d16c-e5e4-6e04e2e6ee45@opensource.wdc.com>
Date:   Wed, 29 Jun 2022 20:18:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] ata: pata_cs5535: Fix W=1 warnings
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>, s.shtylyov@omp.ru
Cc:     linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1656494324-101603-1-git-send-email-john.garry@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <1656494324-101603-1-git-send-email-john.garry@huawei.com>
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

On 6/29/22 18:18, John Garry wrote:
> x86_64 allmodconfig build with W=3D1 gives these warnings:
>=20
> drivers/ata/pata_cs5535.c: In function =E2=80=98cs5535_set_piomode=E2=80=
=99:
> drivers/ata/pata_cs5535.c:93:11: error: variable =E2=80=98dummy=E2=80=99=
 set but not used [-Werror=3Dunused-but-set-variable]
>   u32 reg, dummy;
>            ^~~~~
> drivers/ata/pata_cs5535.c: In function =E2=80=98cs5535_set_dmamode=E2=80=
=99:
> drivers/ata/pata_cs5535.c:132:11: error: variable =E2=80=98dummy=E2=80=99=
 set but not used [-Werror=3Dunused-but-set-variable]
>   u32 reg, dummy;
>            ^~~~~
> cc1: all warnings being treated as errors
>=20
> Mark variables 'dummy' as "maybe unused" as they are only ever written =
in
> rdmsr() calls.
>=20
> Signed-off-by: John Garry <john.garry@huawei.com>
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Updated for-5.20. Thanks !

> ---
> Differences to v1:
> - Add RB tag (thanks!)
> - Fix commit message
>=20
> diff --git a/drivers/ata/pata_cs5535.c b/drivers/ata/pata_cs5535.c
> index 6725931f3c35..c2c3238ff84b 100644
> --- a/drivers/ata/pata_cs5535.c
> +++ b/drivers/ata/pata_cs5535.c
> @@ -90,7 +90,7 @@ static void cs5535_set_piomode(struct ata_port *ap, s=
truct ata_device *adev)
>  	static const u16 pio_cmd_timings[5] =3D {
>  		0xF7F4, 0x53F3, 0x13F1, 0x5131, 0x1131
>  	};
> -	u32 reg, dummy;
> +	u32 reg, __maybe_unused dummy;
>  	struct ata_device *pair =3D ata_dev_pair(adev);
> =20
>  	int mode =3D adev->pio_mode - XFER_PIO_0;
> @@ -129,7 +129,7 @@ static void cs5535_set_dmamode(struct ata_port *ap,=
 struct ata_device *adev)
>  	static const u32 mwdma_timings[3] =3D {
>  		0x7F0FFFF3, 0x7F035352, 0x7F024241
>  	};
> -	u32 reg, dummy;
> +	u32 reg, __maybe_unused dummy;
>  	int mode =3D adev->dma_mode;
> =20
>  	rdmsr(ATAC_CH0D0_DMA + 2 * adev->devno, reg, dummy);


--=20
Damien Le Moal
Western Digital Research
