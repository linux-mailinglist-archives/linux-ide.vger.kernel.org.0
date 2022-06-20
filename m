Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 298535525C5
	for <lists+linux-ide@lfdr.de>; Mon, 20 Jun 2022 22:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235833AbiFTU06 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 20 Jun 2022 16:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236325AbiFTU05 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 20 Jun 2022 16:26:57 -0400
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE0D15A24
        for <linux-ide@vger.kernel.org>; Mon, 20 Jun 2022 13:26:56 -0700 (PDT)
Received: from [192.168.1.103] (178.176.78.78) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Mon, 20 Jun
 2022 23:26:48 +0300
Subject: Re: [PATCH] ata: libata-scsi: fix sloppy result type of ata_ioc32()
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
References: <4a695619-2de7-671e-7b67-2afddf22423f@omp.ru>
 <d653908c-1270-9c2f-eceb-2572e9c9d339@opensource.wdc.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <e8dcebdc-7618-533e-0050-dd03ef1f4bb8@omp.ru>
Date:   Mon, 20 Jun 2022 23:26:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <d653908c-1270-9c2f-eceb-2572e9c9d339@opensource.wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.78.78]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 06/20/2022 20:09:25
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 171243 [Jun 20 2022]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 490 490 64947c9fe6ec4170c45683de1592f92a9c3bac07
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.78.78 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.78.78
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/20/2022 20:12:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/20/2022 5:27:00 PM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 6/20/22 2:12 AM, Damien Le Moal wrote:

>> While ata_ioc32() returns *int*, its result gets assigned to and compared
>> with the *unsigned long* variable 'val' in ata_sas_scsi_ioctl(), its only
>> caller, which implies a problematic implicit cast -- fix that by returning
>> *unsigned long* instead.
>>
>> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
>> analysis tool.
>>
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>
>> ---
>> This patch is against the 'for-next' branch of Damien's 'libata.git' repo.
>>
>>  drivers/ata/libata-scsi.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Index: libata/drivers/ata/libata-scsi.c
>> ===================================================================
>> --- libata.orig/drivers/ata/libata-scsi.c
>> +++ libata/drivers/ata/libata-scsi.c
>> @@ -539,7 +539,7 @@ int ata_task_ioctl(struct scsi_device *s
>>  	return rc;
>>  }
>>  
>> -static int ata_ioc32(struct ata_port *ap)
>> +static unsigned long ata_ioc32(struct ata_port *ap)
>>  {
>>  	if (ap->flags & ATA_FLAG_PIO_DMA)
>>  		return 1;

> Actually, this should be a bool I think and the ioctl code cleaned to use

   By the ioctl code you mean ata_sas_scsi_ioctl()?

> that type since the val argument of the ioctl is also used as a bool.

   As for HDIO_SET_32BIT, that's prolly OK but what to do with HDIO_GET_32BIT
(it calls put_user() on *unsigned long*)?

MBR, Sergey
