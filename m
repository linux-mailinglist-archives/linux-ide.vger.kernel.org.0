Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51A43E2CA5
	for <lists+linux-ide@lfdr.de>; Fri,  6 Aug 2021 16:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240182AbhHFOeO (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 6 Aug 2021 10:34:14 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:24349 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240018AbhHFOeL (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 6 Aug 2021 10:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1628260435; x=1659796435;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=xfPISnz+lDrC+RzZtNwvQ0ZeCU/HWjMV/n+gpksdiUQ=;
  b=e8tdrGzfpukXFG3ocHtQVSEDOKQBj9hddeRYJccyAe4xrqYA4G6ib0Za
   GqibDastFEPstZeoMnmtqRBAGCmvzxTAVEY6LWVyKN3fA1V663A28FcyS
   3U+LPFJIHtQ8wszHtEIbGGmPWC4DRj1muzhmOr+hdZWVWVFKmqMCTkqMx
   T5fzxbBOB0Q9xVGQBO3Dw6F27x/406/vVJhFBtKurt+Wl77ADV/Gtir0F
   B5Sv5MzR1g8k5OWhI8aozYvcXBA0CrrxVSD9kiLP5P4EUIvUj8Z7/2iF6
   9f4l5dVcmjLeuFJ2NjIDLnFg213i6QESQ5mA58xX0UHlI4sh6Gp2cdTN+
   A==;
X-IronPort-AV: E=Sophos;i="5.84,300,1620662400"; 
   d="scan'208";a="175719441"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 06 Aug 2021 22:33:55 +0800
IronPort-SDR: TSK/CAGfV2UQIb75gYzD/yNQFyeVSc65Bd8WYM37+3UE8DiHtFOXeIOPPFgUNulltZlFM/0p5k
 2/FgmqNDf+vB9b2a+Rolfjxl89VguVSBJr0V3aALyxnHil4jJTBV+XhBuQwxgfW+1ofV8SFSlX
 Tk/Cw48TRChgKkNAcmL0Fep5LLa70GlD2vf3dqvMcyMLe0Fc78XEMyJeKdN4uGMx1kztZxZAH/
 5xQQCza8WXT5h+lCsgwF6lDkS0WppfUEMPzHiF7pLXNX5cpJGr02wCUV3RtiacoJPy33vaqpUm
 gBm4kB521jd84sfDdDNQSwfY
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2021 07:11:22 -0700
IronPort-SDR: qTosrTD2Zzd9jzdp9Ihyu71s8p8WsMj4wZN85EyNJYtqIYcxey7JySY1a+CnhcWPjSDASMnW+K
 HveVzwmSkWekRCAC9Oe2OZKLdzQ6+6x847V7ZwEpR/uYQ/HeAVKHzNYyVmij3GQBMU4vTxm9Rg
 e8VfLWwVdDDoDBOevsiuLHCzwx3Mr6mQC1AfEHxTuX5WcwDxVwMHGuSGWQbMchQvsuKhCNEToV
 kdHomPHIH35rS15H48iDw+sa5QAm8tnoWFtoGrh6TZt1+ATqs2HBSuI8Kv9PhyYQpsZdGNhFvG
 TF8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2021 07:33:55 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gh7Jf0vrpz1RvlQ
        for <linux-ide@vger.kernel.org>; Fri,  6 Aug 2021 07:33:54 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-language
        :content-type:in-reply-to:mime-version:user-agent:date
        :message-id:organization:from:references:to:subject; s=dkim; t=
        1628260433; x=1630852434; bh=xfPISnz+lDrC+RzZtNwvQ0ZeCU/HWjMV/n+
        gpksdiUQ=; b=p6/ogsj1ytgEyeCtVw9Ds5t0qwjXAocD/Z1bU5tpIv/lwjgYaYi
        Rz2J9v6QjQYFPJZB+jSP4pr6X8TZWU/v/OGJP6YkpzKOoeQoM9y2L8he73sMKBxu
        Huy8eyc4PifgRewedPTojrkFz5ILHGMy1bAkERQ1LsyvWYk2kPJZ6zovVZ6yHHtj
        +FwwVgdqDEUCuUCGb5xdGOQLmRt9IYt4hEsZETqykiWkCQWHGF7vHPWY+YVDQ0lw
        sxOXN1Ao/4cw8pn1DboBDDyhCAtnTUUlGk7MYwwaZ6kC1nifNn7BIUcHF4zNA67w
        mM05GDZSK/EiPaixaSZNLRS98n5YiGky/hA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id HuNuex438hAD for <linux-ide@vger.kernel.org>;
        Fri,  6 Aug 2021 07:33:53 -0700 (PDT)
Received: from [10.225.48.54] (unknown [10.225.48.54])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gh7Jb6qldz1RvlC;
        Fri,  6 Aug 2021 07:33:51 -0700 (PDT)
Subject: Re: [PATCH v2 2/9] libata: fix ata_host_start()
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
        linux-ide@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org
Cc:     Sathya Prakash <sathya.prakash@broadcom.com>,
        Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
        Suganath Prabu Subramani 
        <suganath-prabu.subramani@broadcom.com>
References: <20210806074252.398482-1-damien.lemoal@wdc.com>
 <20210806074252.398482-3-damien.lemoal@wdc.com>
 <1dca71ad49be897f9544d0de59204e42a5b56a50.camel@HansenPartnership.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital
Message-ID: <5ff8b910-7fef-fa5b-a6b5-8094e3e73ae0@opensource.wdc.com>
Date:   Fri, 6 Aug 2021 23:33:50 +0900
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1dca71ad49be897f9544d0de59204e42a5b56a50.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 2021/08/06 23:31, James Bottomley wrote:
> On Fri, 2021-08-06 at 16:42 +0900, Damien Le Moal wrote:
>> The loop on entry of ata_host_start() may not initialize host->ops to
>> a non NULL value. The test on the host_stop field of host->ops must
>> then be preceded by a check that host->ops is not NULL.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>  drivers/ata/libata-core.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
>> index ea8b91297f12..fe49197caf99 100644
>> --- a/drivers/ata/libata-core.c
>> +++ b/drivers/ata/libata-core.c
>> @@ -5573,7 +5573,7 @@ int ata_host_start(struct ata_host *host)
>>  			have_stop = 1;
>>  	}
>>  
>> -	if (host->ops->host_stop)
>> +	if (host->ops && host->ops->host_stop)
> 
> since have_stop was already set by the port ops, surely this entire if
> is redundant?

Will check.

> 
> James
> 
> 


-- 
Damien Le Moal
Western Digital Research
