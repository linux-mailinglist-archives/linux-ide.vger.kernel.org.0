Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE65442CF8
	for <lists+linux-ide@lfdr.de>; Tue,  2 Nov 2021 12:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhKBLor (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 2 Nov 2021 07:44:47 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:4137 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbhKBLoq (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 2 Nov 2021 07:44:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1635853330; x=1667389330;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BcH/1ckRia/4G3I9IEymg2+BKfrpnVMjrIw9YXoODG4=;
  b=NTTaTOTn7DjNA7cg/ss8g7SSVLGvtMQhqCveYX3c5xTFxJQzVcSh6bti
   +wg2vav5wSW/RbPQjLAo2t/ZLEHlXwbfIOt6c5+u/ZXsDme7Sxhav53gN
   iUW3rftrYrtKjuTa3b/9WTy1Pq4XvvgxS/UpGM1cSbJDU2b5MggSjL7U0
   M55WhKHnutEbqT/I8jFExWXWJwn5qcSw72sLtQf8jfDw7oKGKIAljWttx
   J4C5Sc1XHw8ooBgyhXIceL0B7rBGnd6U8qnS6Os73xz04qMcVhnprlRXU
   NB40H0/w/pGUP/kh6j2eT9n6e1VpQyCLJp5XyyB8IOxhR0a9dBTdKzKzE
   Q==;
X-IronPort-AV: E=Sophos;i="5.87,202,1631548800"; 
   d="scan'208";a="189275966"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 02 Nov 2021 19:42:10 +0800
IronPort-SDR: MwqEqnw3MeirnHwZWABT7qiHL1oEz3BNAshTKYmv9tEU1/iLa9RFVdmKxe+YBZkj6Jjy2ykqfO
 IfdVp8rZXNJy4vzp3HV0jOCJbetD3EElojlwV++pL9EBDXFX8pHI4gErhqEAwlSmp+fYEGsOHb
 6T/t1hBbBh5xQ7+55XUX3roisiEAiCA0K+um09Rh8WnylTXnJOsNJomk4jyNl1aAABrJ0FbIso
 QNbsbmocqgTlh6udPGJpT/EJrfb0ZbHdLYrjaDHqkedkmnTJP5/4/sS4yb+oehF30Nn61hgbD1
 wRZGGUo+vRqPRv8hFFAqRzwW
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 04:16:00 -0700
IronPort-SDR: tRet5XpCuTxMI6+50xH0eO/8IbX0S9Nf7pVB8NGd8kdVQqkdjFn/+nu/lH2V+l3CGb9lZ8tkcx
 pLrrNvBkfyqYEmUYZNLFyTgolmfUDrZngUpFEiZF6rsSYrz4zVx02j/KHMD7lNSa5LE9G52Afv
 8bA/KqGlwc3XfbWJ/HKOTgcurPZUVBwVatq3dH/hp34pOhrjoMqEVORarrWlnFHpZ1vFcn6bOV
 PWJQ+ug48Y3lbr8zQhC9rMtxBsogQ/AuvVc2fXS/JcfaOlVgBAR3b6Yvz8weVJlFmbJ00T9rTd
 7iY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 04:42:12 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Hk7Kv247Mz1RtVw
        for <linux-ide@vger.kernel.org>; Tue,  2 Nov 2021 04:42:11 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1635853330; x=1638445331; bh=BcH/1ckRia/4G3I9IEymg2+BKfrpnVMjrIw
        9YXoODG4=; b=m3+W/dPg1IHKBaJFSWhl1wlRmRGpnV2CeV2/cvkEbwCpv3yp8Ek
        kyMm10DCjASAzhLgHtgjKCQmY5cslRGtcWmaNtALFONZIG99/yVQV8UZ+gfngfAG
        N3hfay0vHuxhxszAnsYQZdEX/NLrcC4DBeTGTFp2GyAf59dJXEbSzzcoSi+/W04g
        N6oCdx1jKG5No8dcOtLkFpdZ3Mv3uMS+vH2rIAI0Sa18gt4A6Iwihk1tmuQiYpX2
        zlOUKIrDXlttnHndyu2dte/GiB1sa5pa+XM8mnoDyUdLfOtQSrIC8MBzhcr9kh21
        S/POTeAV/KmFeClg5AsKJ5yqhaGnNKZoblg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Npdgj38cNxQU for <linux-ide@vger.kernel.org>;
        Tue,  2 Nov 2021 04:42:10 -0700 (PDT)
Received: from [10.225.54.48] (unknown [10.225.54.48])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Hk7Ks1PHVz1RtVl;
        Tue,  2 Nov 2021 04:42:08 -0700 (PDT)
Message-ID: <63c29948-24ac-1cc3-5c1a-1e5b82c9b19f@opensource.wdc.com>
Date:   Tue, 2 Nov 2021 20:42:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH v9 3/5] libata: support concurrent positioning ranges log
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
        linux-ide@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, linux-renesas@vger.kernel.org
References: <20211027022223.183838-1-damien.lemoal@wdc.com>
 <20211027022223.183838-4-damien.lemoal@wdc.com>
 <alpine.DEB.2.22.394.2111021130020.2311589@ramsan.of.borg>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital
In-Reply-To: <alpine.DEB.2.22.394.2111021130020.2311589@ramsan.of.borg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 2021/11/02 19:40, Geert Uytterhoeven wrote:
>  	Hi Damien,
> 
> On Wed, 27 Oct 2021, Damien Le Moal wrote:
>> Add support to discover if an ATA device supports the Concurrent
>> Positioning Ranges data log (address 0x47), indicating that the device
>> is capable of seeking to multiple different locations in parallel using
>> multiple actuators serving different LBA ranges.
>>
>> Also add support to translate the concurrent positioning ranges log
>> into its equivalent Concurrent Positioning Ranges VPD page B9h in
>> libata-scsi.c.
>>
>> The format of the Concurrent Positioning Ranges Log is defined in ACS-5
>> r9.
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> 
> Thanks for your patch, which is now commit fe22e1c2f705676a ("libata:
> support concurrent positioning ranges log") upstream.
> 
> During resume from s2ram on Renesas Salvator-XS, I now see more scary
> messages than before:
> 
>       ata1: link resume succeeded after 1 retries
>       ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
>      +ata1.00: qc timeout (cmd 0x2f)
>      +ata1.00: Read log page 0x00 failed, Emask 0x4
>      +ata1.00: ATA Identify Device Log not supported
>      +ata1.00: failed to set xfermode (err_mask=0x40)
>       ata1: link resume succeeded after 1 retries
>       ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
>      +ata1.00: ATA Identify Device Log not supported
>      +ata1.00: ATA Identify Device Log not supported
>       ata1.00: configured for UDMA/133
> 
> I guess this is expected?

Nope, it is not. The problem is actually not the concurrent positioning log, or
any other log, being supported or not.

Notice the qc timeout ? On device scan after coming out of sleep, or even simply
doing a rmmod ahci+modprobe ahci, the read log commands issued during device
revalidate timeout fairly easily as they are issued while the drive is not
necessarilly fully restarted yet. These errors happen fairly easily due to the
command timeout setting in libata being too short, I think, for the "restart"
case. On a clean boot, they do not happen as longer timeouts are used in that case.

I identified this problem recently while testing stuff: I was doing rmmod of ata
modules and then modprobe of newly compiled modules for tests and noticed these
timeouts. Increasing the timeout values, they disappear. I am however still
scratching my head about the best way to address this. Still digging about this
to first make sure this is really about timeouts being set too short.

> 
> The hard drive (old Maxtor 6L160M0 that received a third life as a test
> bed for Renesas SATA regression testing) seems to still work fine.

I have plenty of brand new drives in my box that show similar error patterns.
The drive is not at fault and libata recovers so the user may not notice the
error. I didn't notice for a while too...

> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>  						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>  							    -- Linus Torvalds
> 


-- 
Damien Le Moal
Western Digital Research
