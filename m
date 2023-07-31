Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F67B768AD5
	for <lists+linux-ide@lfdr.de>; Mon, 31 Jul 2023 06:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjGaEoa (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 31 Jul 2023 00:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjGaEo3 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 31 Jul 2023 00:44:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A40F2E6D;
        Sun, 30 Jul 2023 21:44:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2EECF60D2C;
        Mon, 31 Jul 2023 04:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B197AC433C8;
        Mon, 31 Jul 2023 04:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690778666;
        bh=zfIqjkA0m+w6TbuhcS6WCvI4oDBTqVIXGxKyN1K08YE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=E966lwzgpWhQkSg1MDAK6p5yCUIm2Y9oQzfTDwyQn55CQldsv0qYRYKYjBLYBTunP
         f/EAGlqBbDVvMtayl+a5jNo45DqrcIZS4u5CkmdaWesJ6EiKW5TUk/pL9YWKXAJKbE
         NPj+th5dMphRbR2bgb0gi8N4JF0DWLO4W7nuyG0QPVFLCE5QrhiPJk2B0qAKbBIk3t
         PEBlG2K4dS0792oqhvRw2F4pYK+dBojdXB8f2K7/6KbpU0VouA43v+1xXFY+P5nELz
         hrLB9VFoJMZOpiWAVIZfRmROchCVJbrIUX+jCyuWmY0qPpDazaPZ0JvbRwMVtBzKqq
         lZW6XekagkIIg==
Message-ID: <c35198ed-678d-eb06-359b-21f7f7399bbf@kernel.org>
Date:   Mon, 31 Jul 2023 13:44:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ata,scsi: do not issue START STOP UNIT on resume
Content-Language: en-US
To:     TW <dalzot@gmail.com>, linux-ide@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>
Cc:     Paul Ausbeck <paula@soe.ucsc.edu>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        regressions@lists.linux.dev, Bart Van Assche <bvanassche@acm.org>
References: <20230731003956.572414-1-dlemoal@kernel.org>
 <92782079-140a-3581-797e-e5bf0c464d53@gmail.com>
From:   Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <92782079-140a-3581-797e-e5bf0c464d53@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 7/31/23 12:48, TW wrote:
> Tested-by: Tanner Watkins

A tested-by tag must have the form:

Tested-by: Tanner Watkins <dalzot@gmail.com>

Also, please do not top-post. That is, reply with your text (this tag), below
the original message (which you can trim).

Thanks.

> 
> On 7/30/23 18:39, Damien Le Moal wrote:
>> During system resume, ata_port_pm_resume() triggers ata EH to
>> 1) Resume the controller
>> 2) Reset and rescan the ports
>> 3) Revalidate devices
>> This EH execution is started asynchronously from ata_port_pm_resume(),
>> which means that when sd_resume() is executed, none or only part of the
>> above processing may have been executed. However, sd_resume() issues a
>> START STOP UNIT to wake up the drive from sleep mode. This command is
>> translated to ATA with ata_scsi_start_stop_xlat() and issued to the
>> device. However, depending on the state of execution of the EH process
>> and revalidation triggerred by ata_port_pm_resume(), two things may
>> happen:
>> 1) The START STOP UNIT fails if it is received before the controller has
>>     been reenabled at the beginning of the EH execution. This is visible
>>     with error messages like:
>>
>> ata10.00: device reported invalid CHS sector 0
>> sd 9:0:0:0: [sdc] Start/Stop Unit failed: Result: hostbyte=DID_OK driverbyte=DRIVER_OK
>> sd 9:0:0:0: [sdc] Sense Key : Illegal Request [current]
>> sd 9:0:0:0: [sdc] Add. Sense: Unaligned write command
>> sd 9:0:0:0: PM: dpm_run_callback(): scsi_bus_resume+0x0/0x90 returns -5
>> sd 9:0:0:0: PM: failed to resume async: error -5
>>
>> 2) The START STOP UNIT command is received while the EH process is
>>     on-going, which mean that it is stopped and must wait for its
>>     completion, at which point the command is rather useless as the drive
>>     is already fully spun up already. This case results also in a
>>     significant delay in sd_resume() which is observable by users as
>>     the entire system resume completion is delayed.
>>
>> Given that ATA devices will be woken up by libata activity on resume,
>> sd_resume() has no need to issue a START STOP UNIT command, which solves
>> the above mentioned problems. Do not issue this command by introducing
>> the new scsi_device flag no_start_on_resume and setting this flag to 1
>> in ata_scsi_dev_config(). sd_resume() is modified to issue a START STOP
>> UNIT command only if this flag is not set.
>>
>> Reported-by: Paul Ausbeck <paula@soe.ucsc.edu>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=215880
>> Fixes: a19a93e4c6a9 ("scsi: core: pm: Rely on the device driver core for async power management")
>> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
>> ---
>>   drivers/ata/libata-scsi.c  | 7 +++++++
>>   drivers/scsi/sd.c          | 9 ++++++---
>>   include/scsi/scsi_device.h | 1 +
>>   3 files changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
>> index 370d18aca71e..c6ece32de8e3 100644
>> --- a/drivers/ata/libata-scsi.c
>> +++ b/drivers/ata/libata-scsi.c
>> @@ -1100,7 +1100,14 @@ int ata_scsi_dev_config(struct scsi_device *sdev, struct ata_device *dev)
>>   		}
>>   	} else {
>>   		sdev->sector_size = ata_id_logical_sector_size(dev->id);
>> +		/*
>> +		 * Stop the drive on suspend but do not issue START STOP UNIT
>> +		 * on resume as this is not necessary and may fail: the device
>> +		 * will be woken up by ata_port_pm_resume() with a port reset
>> +		 * and device revalidation.
>> +		 */
>>   		sdev->manage_start_stop = 1;
>> +		sdev->no_start_on_resume = 1;
>>   	}
>>   
>>   	/*
>> diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
>> index 68b12afa0721..3c668cfb146d 100644
>> --- a/drivers/scsi/sd.c
>> +++ b/drivers/scsi/sd.c
>> @@ -3876,7 +3876,7 @@ static int sd_suspend_runtime(struct device *dev)
>>   static int sd_resume(struct device *dev)
>>   {
>>   	struct scsi_disk *sdkp = dev_get_drvdata(dev);
>> -	int ret;
>> +	int ret = 0;
>>   
>>   	if (!sdkp)	/* E.g.: runtime resume at the start of sd_probe() */
>>   		return 0;
>> @@ -3884,8 +3884,11 @@ static int sd_resume(struct device *dev)
>>   	if (!sdkp->device->manage_start_stop)
>>   		return 0;
>>   
>> -	sd_printk(KERN_NOTICE, sdkp, "Starting disk\n");
>> -	ret = sd_start_stop_device(sdkp, 1);
>> +	if (!sdkp->device->no_start_on_resume) {
>> +		sd_printk(KERN_NOTICE, sdkp, "Starting disk\n");
>> +		ret = sd_start_stop_device(sdkp, 1);
>> +	}
>> +
>>   	if (!ret)
>>   		opal_unlock_from_suspend(sdkp->opal_dev);
>>   	return ret;
>> diff --git a/include/scsi/scsi_device.h b/include/scsi/scsi_device.h
>> index 75b2235b99e2..b9230b6add04 100644
>> --- a/include/scsi/scsi_device.h
>> +++ b/include/scsi/scsi_device.h
>> @@ -194,6 +194,7 @@ struct scsi_device {
>>   	unsigned no_start_on_add:1;	/* do not issue start on add */
>>   	unsigned allow_restart:1; /* issue START_UNIT in error handler */
>>   	unsigned manage_start_stop:1;	/* Let HLD (sd) manage start/stop */
>> +	unsigned no_start_on_resume:1; /* Do not issue START_STOP_UNIT on resume */
>>   	unsigned start_stop_pwr_cond:1;	/* Set power cond. in START_STOP_UNIT */
>>   	unsigned no_uld_attach:1; /* disable connecting to upper level drivers */
>>   	unsigned select_no_atn:1;

-- 
Damien Le Moal
Western Digital Research

