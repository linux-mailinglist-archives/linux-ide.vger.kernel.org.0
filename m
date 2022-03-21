Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8423D4E23A4
	for <lists+linux-ide@lfdr.de>; Mon, 21 Mar 2022 10:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346032AbiCUJyD (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 21 Mar 2022 05:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346031AbiCUJyC (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 21 Mar 2022 05:54:02 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94E289BAEE
        for <linux-ide@vger.kernel.org>; Mon, 21 Mar 2022 02:52:36 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 529FF210E5;
        Mon, 21 Mar 2022 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1647856355; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uisMfIa/t9hG5kJ1AY+TNpPm+hJflCeH8G0bHBL+/oc=;
        b=CHLKDBDrRPKa1/8mHKEYpvlhxtB7JPK6zJ/0yCvcBxpo2mFTmb8pVzKL0BomeImW2p73au
        +3B/Eb4JCFr1Np/EU2ym7Aqu8bkayJJMjtbjQQTsDAYKBLfec8l+E+bpKd1YPkA6yznaYt
        JXDXhBWTwYAmycFuOOdvjfhNzzC/Oec=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1647856355;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uisMfIa/t9hG5kJ1AY+TNpPm+hJflCeH8G0bHBL+/oc=;
        b=tuMvqKB70ECMFXNhGuPrarHMWYAStHvoxVnSz/xZxOKFrJYjQlhruj37wEsNeEy4zZImtP
        4EOQ2cy7jwkHFdAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 48BD213A5E;
        Mon, 21 Mar 2022 09:52:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id fZtkEONKOGLaaAAAMHmgww
        (envelope-from <hare@suse.de>); Mon, 21 Mar 2022 09:52:35 +0000
Message-ID: <1343b9a0-c857-f800-58ca-141bc5d3dd93@suse.de>
Date:   Mon, 21 Mar 2022 10:52:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To:     Paul Menzel <pmenzel@molgen.mpg.de>, linux-ide@vger.kernel.org
References: <36288054-bc9d-c80c-502e-79bddcacd5f6@molgen.mpg.de>
From:   Hannes Reinecke <hare@suse.de>
Subject: Re: How to match disk to controller in Linux log?
In-Reply-To: <36288054-bc9d-c80c-502e-79bddcacd5f6@molgen.mpg.de>
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

On 3/21/22 09:44, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> AMD Ryzen devices come with two SATA controllers:
> 
>      $ lspci -nn | grep SATA
>      01:00.1 SATA controller [0106]: Advanced Micro Devices, Inc. [AMD] 
> 300 Series Chipset SATA Controller [1022:43b7] (rev 02)
>      07:00.2 SATA controller [0106]: Advanced Micro Devices, Inc. [AMD] 
> FCH SATA Controller [AHCI mode] [1022:7901] (rev 51)
> 
> lsscsi [1] in verbose mode shows the controller a disk is actually 
> attached to.
> 
>      $ lsscsi -v
>      [0:0:0:0]    disk    ATA      ST500LM021-1KJ15 SDM1  /dev/sda
>        dir: /sys/bus/scsi/devices/0:0:0:0 
> [/sys/devices/pci0000:00/0000:00:01.3/0000:01:00.1/ata1/host0/target0:0:0/0:0:0:0] 
> 
> 
> For analysis and bug reports, it’d be great if the Linux kernel log 
> would contain that information too. But I am unable to find it. Is it 
> present?
> 
>      [    0.426850] calling  ahci_pci_driver_init+0x0/0x1a @ 1
>      [    0.426869] ahci 0000:01:00.1: version 3.0
>      [    0.426970] ahci 0000:01:00.1: SSS flag set, parallel bus scan 
> disabled
>      [    0.427004] ahci 0000:01:00.1: AHCI 0001.0301 32 slots 8 ports 6 
> Gbps 0x33 impl SATA mode
>      [    0.427008] ahci 0000:01:00.1: flags: 64bit ncq sntf stag pm led 
> clo only pmp pio slum part sxs deso sadm sds apst
>      [    0.427412] scsi host0: ahci
>      [    0.427493] scsi host1: ahci
>      [    0.427569] scsi host2: ahci
>      [    0.427653] scsi host3: ahci
>      [    0.427728] scsi host4: ahci
>      [    0.427801] scsi host5: ahci
>      [    0.427876] scsi host6: ahci
>      [    0.427950] scsi host7: ahci
>      [    0.427978] ata1: SATA max UDMA/133 abar m131072@0xf0600000 port 
> 0xf0600100 irq 36
>      [    0.427982] ata2: SATA max UDMA/133 abar m131072@0xf0600000 port 
> 0xf0600180 irq 36
>      [    0.427985] ata3: DUMMY
>      [    0.427986] ata4: DUMMY
>      [    0.427988] ata5: SATA max UDMA/133 abar m131072@0xf0600000 port 
> 0xf0600300 irq 36
>      [    0.427991] ata6: SATA max UDMA/133 abar m131072@0xf0600000 port 
> 0xf0600380 irq 36
>      [    0.427994] ata7: DUMMY
>      [    0.427995] ata8: DUMMY
>      [    0.428015] ata1: hard resetting link
>      [    0.428116] ahci 0000:07:00.2: AHCI 0001.0301 32 slots 1 ports 6 
> Gbps 0x1 impl SATA mode
>      [    0.428124] ahci 0000:07:00.2: flags: 64bit ncq sntf ilck pm led 
> clo only pmp fbs pio slum part
>      [    0.428250] scsi host8: ahci
>      [    0.428278] ata9: SATA max UDMA/133 abar m4096@0xf0108000 port 
> 0xf0108100 irq 38
>      [    0.428295] initcall ahci_pci_driver_init+0x0/0x1a returned 0 
> after 1409 usecs
>      […]
>      [    0.428316] ata9: hard resetting link
>      [    0.532308] ata9: SATA link down (SStatus 0 SControl 300)
>      [    0.696316] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
>      [    0.725963] ata1.00: ATA-8: ST500LM021-1KJ152, 0005SDM1, max 
> UDMA/133
>      [    0.725982] ata1.00: 976773168 sectors, multi 16: LBA48 NCQ 
> (depth 32)
>      [    0.764845] ata1.00: configured for UDMA/133
> 
> Can you think of a way and log format, what controller the disk is 
> actually attached to?
> 
>      [    0.765133] ata2: hard resetting link
>      [    0.868330] ata2: SATA link down (SStatus 0 SControl 300)
>      [    0.868965] ata5: hard resetting link
>      [    0.973337] ata5: SATA link down (SStatus 0 SControl 300)
>      [    0.973910] ata6: hard resetting link
>      [    1.077832] ata6: SATA link down (SStatus 0 SControl 300)
> 

It's 'magic' ... (/me waves magic wand)
One does know where the ports are ... no?

I did do a patch once (grep for 'libata: sysfs naming option'), but that 
got shelved as I didn't had a good idea how to handle PMP devices.

Seems that I have to look at it again ...

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		           Kernel Storage Architect
hare@suse.de			                  +49 911 74053 688
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), GF: Felix Imendörffer
