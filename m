Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 834EF53C5BE
	for <lists+linux-ide@lfdr.de>; Fri,  3 Jun 2022 09:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241800AbiFCHHs (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 3 Jun 2022 03:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242124AbiFCHHm (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 3 Jun 2022 03:07:42 -0400
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15DD19C18
        for <linux-ide@vger.kernel.org>; Fri,  3 Jun 2022 00:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1654240058; x=1685776058;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uM1jIRHRevJwm7+Qyxup2fdwLhUnSqJOSozlPvxAOsA=;
  b=b3O6HJ4kUmBfNrIqS/RX6BE+tUsijWothY0BcSqTM3773JsTGH4I3NpG
   GqWI0fzPbHFxPFFk9KP69b20A2/rJHgci6t7HwGm1MoOtiS2uDE/eBEmS
   B66eKpya3dnKjPkfVS1BRMPwmFJGeY71JzpzhMOn6PZq62QHkxfbqK6SR
   s9raOm/rScQ56YMsmu3XWMP698v22blv/9eHbIlaDSAkCVggnNuQm7rfH
   EjrtvGGoGJ3efnbZpL8nx0LbqFwbrChNgjev70ACqbtzQ+yjkxMi/jXJd
   qFfjYLVxDoBGElx6va8r/avIKE3qcjea1Zqxjt4A4CkHw4dMHlf/ep03Z
   w==;
X-IronPort-AV: E=Sophos;i="5.91,273,1647273600"; 
   d="scan'208";a="306434770"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 03 Jun 2022 15:07:35 +0800
IronPort-SDR: nQUpKN5lzmytbFgZceU2wjKd2kqdqqNOWcG2hKKiW05I5xlwttGYZCDJ4YQTBPbkwew8iF03+Q
 cMnAagjnANWC/Zgr24NPztuAhJutOCIuy75+u5FL7uY7x6t+HtyoHzoIqFwKcuQlXE9QRQK1CM
 JDNEd1oMFUU5ImbEPFo9E6/zUQ5ZbRnaUGomo2u0MXv1jfygOsByFImwSDENOiWL1c5kXSJjmj
 vPS2oHkJfyxGJaGrlCuEbKsARZ244f3MOFfhu7GnwdHTV3e0TCaCtObu68GljP6EffHl3Z3ZLL
 EjsM8fp/iQaTq32C7gVnWifB
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jun 2022 23:26:40 -0700
IronPort-SDR: TQpt8LGggPPfAsPINQA1akOihxFVsEfGnZtqc8MElveQJ2g4N30h6JtSAjncYbCOyO/COp0KBQ
 2/wRUHI8z1l1tA/S89VOv7bWvEjbMwA47KwtN3ijvim/5uEzDIEjouwcsgTJYNptZ9YBjLFIUP
 o4t+QAzJY8milDtHBptjaJE0TiFuvoaRDRNcjKszYPl5oPqpeZ375VoOKtQw7dDoJZmGo2aA/Z
 YHs8s4WVkBdVmM3/gCrLy9PsmjSY8gRzkBouosQSFDZ1aumunuPZzBcXDCYVy0wOH7I9Tr5yph
 ixk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Jun 2022 00:07:35 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LDv8l2fNBz1SVp0
        for <linux-ide@vger.kernel.org>; Fri,  3 Jun 2022 00:07:35 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1654240054; x=1656832055; bh=uM1jIRHRevJwm7+Qyxup2fdwLhUnSqJOSoz
        lPvxAOsA=; b=iyxsCrf7ecox+D17zQfPEeGFAYaDeoH4KHDEN6AyiKUcufyiw4G
        snHvnatBCfc9H2xfQVqIh8B9dfcGcBNtoJ6QeLYR9+8ZB2LfK9/Vbm9BmX0bx+iP
        PZoinjyq74P7Kmf5kaKkE+VMQ6ZTc/ShfRSjj7k2iYz4AhJvbDrqXEqkKTCXQNnQ
        XkDJNbUcRWhs4Wq5ojeAqxTQyxBDgIvUNPquoCItppOUz9uySLPMxk2Imek7sQ8y
        WDkz96McELGKvq+gVtIZgPe4JFHl9RFTH80kIqvXWYpnDPkBGGDkasihUgM0tYhJ
        1V2jsIR7xV+02dmU1tGSxloJ9QW6nIhaiiA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 3MDJEQSkSaay for <linux-ide@vger.kernel.org>;
        Fri,  3 Jun 2022 00:07:34 -0700 (PDT)
Received: from [10.225.163.68] (unknown [10.225.163.68])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LDv8h4xFjz1Rvlc;
        Fri,  3 Jun 2022 00:07:32 -0700 (PDT)
Message-ID: <948fc607-af5a-8b80-4f87-297462bb58c4@opensource.wdc.com>
Date:   Fri, 3 Jun 2022 16:07:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/3] libata: fix reading concurrent positioning ranges
 log
Content-Language: en-US
To:     Hannes Reinecke <hare@suse.de>,
        Tyler Erickson <tyler.erickson@seagate.com>,
        jejb@linux.ibm.com, martin.petersen@oracle.com
Cc:     linux-scsi@vger.kernel.org, linux-ide@vger.kernel.org,
        muhammad.ahmad@seagate.com, stable@vger.kernel.org
References: <20220602225113.10218-1-tyler.erickson@seagate.com>
 <20220602225113.10218-2-tyler.erickson@seagate.com>
 <071542b5-2269-7c8a-a78c-0cd7299bca99@suse.de>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <071542b5-2269-7c8a-a78c-0cd7299bca99@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 6/3/22 15:17, Hannes Reinecke wrote:
> On 6/3/22 00:51, Tyler Erickson wrote:
>> The concurrent positioning ranges log is not a fixed size and may depend
>> on how many ranges are supported by the device. This patch uses the size
>> reported in the GPL directory to determine the number of pages supported
>> by the device before attempting to read this log page.
>>
>> This resolves this error from the dmesg output:
>>      ata6.00: Read log 0x47 page 0x00 failed, Emask 0x1
>>
>> Cc: stable@vger.kernel.org
>> Fixes: fe22e1c2f705 ("libata: support concurrent positioning ranges log")
>> Signed-off-by: Tyler Erickson <tyler.erickson@seagate.com>
>> Reviewed-by: Muhammad Ahmad <muhammad.ahmad@seagate.com>
>> Tested-by: Michael English <michael.english@seagate.com>
>> ---
>>   drivers/ata/libata-core.c | 21 +++++++++++++--------
>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
>> index 40e816419f48..3ea10f72cb70 100644
>> --- a/drivers/ata/libata-core.c
>> +++ b/drivers/ata/libata-core.c
>> @@ -2010,16 +2010,16 @@ unsigned int ata_read_log_page(struct ata_device *dev, u8 log,
>>   	return err_mask;
>>   }
>>   
>> -static bool ata_log_supported(struct ata_device *dev, u8 log)
>> +static int ata_log_supported(struct ata_device *dev, u8 log)
>>   {
>>   	struct ata_port *ap = dev->link->ap;
>>   
>>   	if (dev->horkage & ATA_HORKAGE_NO_LOG_DIR)
>> -		return false;
>> +		return 0;
>>   
>>   	if (ata_read_log_page(dev, ATA_LOG_DIRECTORY, 0, ap->sector_buf, 1))
>> -		return false;
>> -	return get_unaligned_le16(&ap->sector_buf[log * 2]) ? true : false;
>> +		return 0;
>> +	return get_unaligned_le16(&ap->sector_buf[log * 2]);
>>   }
>>   
> Maybe we should change to name of the function here; 
> 'ata_log_supported()' suggests a bool return.
> 
> ata_check_log_page() ?
> 
>>   static bool ata_identify_page_supported(struct ata_device *dev, u8 page)
>> @@ -2455,15 +2455,20 @@ static void ata_dev_config_cpr(struct ata_device *dev)
>>   	struct ata_cpr_log *cpr_log = NULL;
>>   	u8 *desc, *buf = NULL;
>>   
>> -	if (ata_id_major_version(dev->id) < 11 ||
>> -	    !ata_log_supported(dev, ATA_LOG_CONCURRENT_POSITIONING_RANGES))
>> +	if (ata_id_major_version(dev->id) < 11)
>> +		goto out;
>> +
>> +	buf_len = ata_log_supported(dev, ATA_LOG_CONCURRENT_POSITIONING_RANGES);
>> +	if (buf_len == 0)
>>   		goto out;
>>   
>>   	/*
>>   	 * Read the concurrent positioning ranges log (0x47). We can have at
>> -	 * most 255 32B range descriptors plus a 64B header.
>> +	 * most 255 32B range descriptors plus a 64B header. This log varies in
>> +	 * size, so use the size reported in the GPL directory. Reading beyond
>> +	 * the supported length will result in an error.
>>   	 */
>> -	buf_len = (64 + 255 * 32 + 511) & ~511;
>> +	buf_len <<= 9;
>>   	buf = kzalloc(buf_len, GFP_KERNEL);
>>   	if (!buf)
>>   		goto out;
> 
> I don't get it.
> You just returned the actual length of the log page from the previous 
> function. Why do you need to calculate the length here?

Calculate ? This is only converting from 512B sectors to bytes.
The calculation was mine, a gross error :) This is what this patch is fixing.

> 
> Cheers,
> 
> Hannes


-- 
Damien Le Moal
Western Digital Research
