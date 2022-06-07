Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A155E5398CE
	for <lists+linux-ide@lfdr.de>; Tue, 31 May 2022 23:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347929AbiEaVaa (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 31 May 2022 17:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346349AbiEaVa3 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 31 May 2022 17:30:29 -0400
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC13B9CF38
        for <linux-ide@vger.kernel.org>; Tue, 31 May 2022 14:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1654032627; x=1685568627;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BY/3N4m5k3a9PP8+kxvECWFk1mLOpm+stsGO4daEj78=;
  b=GQa46mRApIuJlidXSl6CuLYNAqFaldDlmYsj3JO5paYyI+6yZ2J/FZBy
   HLG/N7VhiH8hb6xO4aA7DoWW4B4OIcFSnjUsbcOJmujCPjmAsdsXtEK8K
   CryAVlSj1hH0kot6RRoKWVPOH+vVInoIQCXH10YKQRSrHzzq3z74yERnz
   2fHPLKDRVteQHteO5zT+vviY1rXtC8ikBnT1xLV1HJQP+9xd6fDb8TG5K
   9ZO7CpTg6owsFkdRNel56F64MR8Lxt2K0fSqivHTJURonKng8DZxrdIfS
   4uaRwODCoI4A4T0oEzfEwNmOcsE5E1HwVFw/H6fI3IMYkhsoOSGN7ThMS
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,266,1647273600"; 
   d="scan'208";a="206787237"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 01 Jun 2022 05:30:27 +0800
IronPort-SDR: 1O1y12AQIYgiPQP7O2X8sjR6x5a8Y/ZIlygldI+nXmorpbyDMNwtARwXHhNg1itaEmJeNVFh81
 yse+yFPZKmhlOraCf/BRjZ+MVdiCeGuvmfHBo+7rvALWqaUFevIAWVIQEih2e1vpX8Iqtsm17Y
 WoY+uKHVxS7lqELkdlzZgsThXrNKyt7CEMNeXsGp2eccdTYVhoJgnbDBkDriXnJ4Lf7pDh3Zre
 RV4PAsD/ItZXSr4YO17t4hjjrDI8b4tZ3tB3x4tU3EvvrJ3NCjp/adkv+BM9tJ4aZABFSwfsEF
 F3BPBEtN9+JXSiRPhIZ8CjVf
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 May 2022 13:54:13 -0700
IronPort-SDR: Jk0zdgiTEt5VxnZyf6Z7Oahm+HCm2VuLGDBv0/259PLbzhKEGTLRSkVCa/2Whw6sykGaZY2c6w
 RpynNH68SywwKJaLhlzxvDRszCaKstZJ3ZwLRweo9YN/ZXYMZ/kEHjuiuvneVqe2adeRiMOFLs
 dDN684soRZ1fCstjG2THfiyKEVwwrlBSUaxUPjJc907F8Zjrr0AfGKPVcAA4tH/Rr8Ft6IJSkE
 VBsS8LG7DobBO8KBmhmn2DCq9utRXuvYHUSe42Z4lwoFQzfZ5duZJsEYXOVHhWWTVUvRej8wLo
 wts=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 May 2022 14:30:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LCQRl6sYpz1SVp2
        for <linux-ide@vger.kernel.org>; Tue, 31 May 2022 14:30:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1654032627; x=1656624628; bh=BY/3N4m5k3a9PP8+kxvECWFk1mLOpm+stsG
        O4daEj78=; b=NAQtIWriPdmX/XQzewvVsNznND20KxwByNPZN/tOBUIK+Rbew0w
        xHIWZ4SWaFScxpg8qtMt/P5Ej0v+qVqUK273TuyNIDUQdYcTGa9EadE7XlIEZww5
        AJTi40kl/n3AmF0S4dQ3He0JD4oapoXla7qfYx0DextIYQgQhji7YtNU60EuW4ua
        DusZIsJeYquDcq5TbCjx6nlMwRMZsOome6m9Qh+J/Tc96zEKUDdZ5OyhEN6QfjZa
        3bP9xGFrnVTHQt5ZxMUHwZXQ3vyGGQT+eUMQ3F3thI/DrzSYd4OHWGOd7rnE+wiH
        Ay98lSUEkbpFQHz2VEkOTPUzpo6dZ6NA0rQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id LQW67Beaxq8H for <linux-ide@vger.kernel.org>;
        Tue, 31 May 2022 14:30:27 -0700 (PDT)
Received: from [10.225.163.63] (unknown [10.225.163.63])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LCQRk02qXz1Rvlc;
        Tue, 31 May 2022 14:30:25 -0700 (PDT)
Message-ID: <a24e7a79-ff46-158f-92b0-1f667d4d2153@opensource.wdc.com>
Date:   Wed, 1 Jun 2022 06:30:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] [PATCH v1 2/2] sd: Fixing interpretation of VPD B9h
 length
Content-Language: en-US
To:     Tyler Erickson <tyler.erickson@seagate.com>, jejb@linux.ibm.com,
        martin.petersen@oracle.com
Cc:     linux-scsi@vger.kernel.org, linux-ide@vger.kernel.org,
        muhammad.ahmad@seagate.com,
        Michael English <michael.english@seagate.com>
References: <20220531175009.850-1-tyler.erickson@seagate.com>
 <20220531175009.850-3-tyler.erickson@seagate.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220531175009.850-3-tyler.erickson@seagate.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 6/1/22 02:50, Tyler Erickson wrote:
> Fixing the interpretation of the length of the B9h VPD page
> (concurrent positioning ranges). Adding 4 is necessary as
> the first 4 bytes of the page is the header with page number
> and length information. Adding 3 was likely a misinterpretation
> of the SBC-5 specification which sets all offsets starting at zero.
> 
> This fixes the error in dmesg:
> [ 9.014456] sd 1:0:0:0: [sda] Invalid Concurrent Positioning Ranges VPD page
> 
> Signed-off-by: Tyler Erickson <tyler.erickson@seagate.com>
> Reviewed-by: Muhammad Ahmad <muhammad.ahmad@seagate.com>
> Tested-by: Michael English <michael.english@seagate.com>

This needs a fixes tag and cc stable. Your patch format is also starnge.
It is missing the "---" separator after the tags. This is not going to
apply. Did you generate this with git format-patch ?

> 
> diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
> index dc6e55761fd1..14867e8cd687 100644
> --- a/drivers/scsi/sd.c
> +++ b/drivers/scsi/sd.c
> @@ -3067,7 +3067,7 @@ static void sd_read_cpr(struct scsi_disk *sdkp)
>  		goto out;
>  
>  	/* We must have at least a 64B header and one 32B range descriptor */
> -	vpd_len = get_unaligned_be16(&buffer[2]) + 3;
> +	vpd_len = get_unaligned_be16(&buffer[2]) + 4;
>  	if (vpd_len > buf_len || vpd_len < 64 + 32 || (vpd_len & 31)) {
>  		sd_printk(KERN_ERR, sdkp,
>  			  "Invalid Concurrent Positioning Ranges VPD page\n");


-- 
Damien Le Moal
Western Digital Research
