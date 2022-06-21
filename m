Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5279D553BB2
	for <lists+linux-ide@lfdr.de>; Tue, 21 Jun 2022 22:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245194AbiFUUiH (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 21 Jun 2022 16:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbiFUUiF (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 21 Jun 2022 16:38:05 -0400
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8BDD10EB
        for <linux-ide@vger.kernel.org>; Tue, 21 Jun 2022 13:38:03 -0700 (PDT)
Received: from [192.168.1.103] (178.176.77.12) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Tue, 21 Jun
 2022 23:37:55 +0300
Subject: Re: [PATCH] ata: libata-scsi: fix sloppy result type of ata_ioc32()
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
References: <4a695619-2de7-671e-7b67-2afddf22423f@omp.ru>
 <d653908c-1270-9c2f-eceb-2572e9c9d339@opensource.wdc.com>
 <e8dcebdc-7618-533e-0050-dd03ef1f4bb8@omp.ru>
 <9c231ffe-df3c-9c36-4b8b-dc518009c3d2@opensource.wdc.com>
 <b37cfe23-a19b-970d-d5b1-3d67659595ee@omp.ru>
Organization: Open Mobile Platform
Message-ID: <a57fdc21-1f06-495a-deda-d29c74cd75ab@omp.ru>
Date:   Tue, 21 Jun 2022 23:37:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b37cfe23-a19b-970d-d5b1-3d67659595ee@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.77.12]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 06/21/2022 20:24:58
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 171269 [Jun 21 2022]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 491 491 a718ef6dc942138335b0bcd7ab07f27b5c06005e
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.77.12 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;178.176.77.12:7.7.3,7.7.1;omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.77.12
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/21/2022 20:28:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/21/2022 4:24:00 PM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 6/21/22 10:14 PM, Sergey Shtylyov wrote:
[...]
>>>>> While ata_ioc32() returns *int*, its result gets assigned to and compared
>>>>> with the *unsigned long* variable 'val' in ata_sas_scsi_ioctl(), its only
>>>>> caller, which implies a problematic implicit cast -- fix that by returning
>>>>> *unsigned long* instead.
>>>>>
>>>>> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
>>>>> analysis tool.
>>>>>
>>>>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>>>>
>>>>> ---
>>>>> This patch is against the 'for-next' branch of Damien's 'libata.git' repo.
>>>>>
>>>>>  drivers/ata/libata-scsi.c |    2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> Index: libata/drivers/ata/libata-scsi.c
>>>>> ===================================================================
>>>>> --- libata.orig/drivers/ata/libata-scsi.c
>>>>> +++ libata/drivers/ata/libata-scsi.c
>>>>> @@ -539,7 +539,7 @@ int ata_task_ioctl(struct scsi_device *s
>>>>>  	return rc;
>>>>>  }
>>>>>  
>>>>> -static int ata_ioc32(struct ata_port *ap)
>>>>> +static unsigned long ata_ioc32(struct ata_port *ap)
>>>>>  {
>>>>>  	if (ap->flags & ATA_FLAG_PIO_DMA)
>>>>>  		return 1;
>>>
>>>> Actually, this should be a bool I think and the ioctl code cleaned to use
>>>
>>>    By the ioctl code you mean ata_sas_scsi_ioctl()?
>>
>> yes.
>>
>>>> that type since the val argument of the ioctl is also used as a bool.
>>>
>>>    As for HDIO_SET_32BIT, that's prolly OK but what to do with HDIO_GET_32BIT
>>> (it calls put_user() on *unsigned long*)?
>>
>> Something like this should work fine:
>>
>> diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
>> index 86dbb1cdfabd..ec7f79cbb135 100644
>> --- a/drivers/ata/libata-scsi.c
>> +++ b/drivers/ata/libata-scsi.c
> [...]
>> @@ -571,16 +572,16 @@ int ata_sas_scsi_ioctl(struct ata_port *ap, struct
>> scsi_device *scsidev,
>>                 return put_user(val, (unsigned long __user *)arg);
>>
>>         case HDIO_SET_32BIT:
> 
>    Hmm, I told you this *case* is prolly OK -- it was HDIO_GET_32BIT *case* that
> I was concerned about... So you mean that HDIO_GET_32BIT handling should remain
> intact?
> 
>> -               val = (unsigned long) arg;
>> +               pio32 = !!((unsigned long) arg);

   No, this one won't do -- it changes the behavior in case ATA_PFLAG_PIO32CHANGE
isn't set... :-/

>>                 rc = 0;
>>                 spin_lock_irqsave(ap->lock, flags);
>>                 if (ap->pflags & ATA_PFLAG_PIO32CHANGE) {
>> -                       if (val)
>> +                       if (pio32)
>>                                 ap->pflags |= ATA_PFLAG_PIO32;
>>                         else
>>                                 ap->pflags &= ~ATA_PFLAG_PIO32;
>>                 } else {
>> -                       if (val != ata_ioc32(ap))
>> +                       if (pio32 != ata_ioc32(ap))
>>                                 rc = -EINVAL;
>>                 }
>>                 spin_unlock_irqrestore(ap->lock, flags);
> 
>    Not really sure this is worth it... *unsigned long* result type for
> ata_ioc32() seems simpler.

   Actually, even just modifying ata_ioc32() to return 'bool' produces
a seemingly correct code. Note that ata_ioc32() is inlined in any case...

MBR, Sergey
