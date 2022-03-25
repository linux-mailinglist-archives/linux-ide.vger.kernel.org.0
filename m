Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 696384E78E8
	for <lists+linux-ide@lfdr.de>; Fri, 25 Mar 2022 17:29:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243396AbiCYQbA (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 25 Mar 2022 12:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241341AbiCYQa7 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 25 Mar 2022 12:30:59 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19D3C4E38B
        for <linux-ide@vger.kernel.org>; Fri, 25 Mar 2022 09:29:25 -0700 (PDT)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id C5B18210DE;
        Fri, 25 Mar 2022 16:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1648225763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cO6Y0oqGiC2Nwm8rPrIheyCcVgmychattYratn5g/uI=;
        b=2GAWicu4Ni/cL3UbRzpI7Bd2S/Qw1GD0LCn8jLn9/gFYGTi1yH8++kNBL7jvFScMfNaIBP
        NvZ8ho8PHTH+UdGg4hUhB7kKDDuWaod1J75Bo9M10eIk6wf+0kTy2TbSHxeHwuzlen/oFU
        vBMg0HXR8dlVo75v+ipuCjUjy6GL/Wc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1648225763;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cO6Y0oqGiC2Nwm8rPrIheyCcVgmychattYratn5g/uI=;
        b=9gSBkO19hZ+KIDXFlH+CITc4grd9A+Eag1WCuBV+7dXQPUibBS0Tl80qpQqube+PcHRCAO
        jW4kMPkIfN0rKJBg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id AA59E1392B;
        Fri, 25 Mar 2022 16:29:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id Zu6LKOPtPWIPOAAAGKfGzw
        (envelope-from <hare@suse.de>); Fri, 25 Mar 2022 16:29:23 +0000
Message-ID: <e32c61c2-b141-35a0-9a84-cad97ff7560a@suse.de>
Date:   Fri, 25 Mar 2022 17:29:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/2] libata: CONFIG_ATA_SYSFS_COMPAT
Content-Language: en-US
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Damien LeMoal <damien.lemoal@wdc.com>
Cc:     linux-ide@vger.kernel.org
References: <20220325125624.99929-1-hare@suse.de>
 <20220325125624.99929-3-hare@suse.de>
 <f6a971de-d049-9e42-93e8-8253c66e4c8b@omp.ru>
From:   Hannes Reinecke <hare@suse.de>
In-Reply-To: <f6a971de-d049-9e42-93e8-8253c66e4c8b@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 3/25/22 17:22, Sergey Shtylyov wrote:
> Hello!
> 
> On 3/25/22 3:56 PM, Hannes Reinecke wrote:
> 
>> Add a config option 'ATA_SYSFS_COMPAT' to create a compatibility
>> 'ata' symlink in the PCI device sysfs directory.
>>
>> Signed-off-by: Hannes Reinecke <hare@suse.de>
> [...]
>> diff --git a/drivers/ata/libata-transport.c b/drivers/ata/libata-transport.c
>> index e5ed5046b299..29dec89ccc2d 100644
>> --- a/drivers/ata/libata-transport.c
>> +++ b/drivers/ata/libata-transport.c
>> @@ -251,6 +251,39 @@ static int ata_tport_match(struct attribute_container *cont,
>>   	return &ata_scsi_transport_template->host_attrs.ac == cont;
>>   }
>>   
>> +#ifdef CONFIG_ATA_SYSFS_COMPAT
>> +static int ata_tport_compat_link_add(struct ata_port *ap)
>> +{
>> +        struct device *dev = &ap->tdev;
> 
>     Indent with a tab, please.
> 

Of course.

>> +	struct device *parent = dev->parent;
>> +        char compat_name[64];
> 
>     Same here. The buffer seems oversized too...
> 
Hard to tell how many ATA devices there are in the system.
More than hundred?
But yeah, I can reduce it.

>> +
>> +	sprintf(compat_name, "ata%d", ap->print_id);
> 
>     snprintf(), perhaps?
> 
OK.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer
