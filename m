Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF63692D87
	for <lists+linux-ide@lfdr.de>; Sat, 11 Feb 2023 04:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbjBKDM2 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 10 Feb 2023 22:12:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjBKDM2 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 10 Feb 2023 22:12:28 -0500
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98AD52916D
        for <linux-ide@vger.kernel.org>; Fri, 10 Feb 2023 19:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1676085147; x=1707621147;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cRNFIFSiH3UIhDPtCd3elJf0fnQt1BKoidMcaUkgeTg=;
  b=IaPU1G7wpNnBBSK8eojmTxgjR++JUStPuC9CamVkS7N7XOrEusX8ItOj
   5jtVXRMR1BgHP6UziFvcV1pZUpS/0GKKQOeNzvexuNL+0i3PAoNDjDaiw
   6oZf4mwu9XrihGdsG5eLeIWZ9Z7UTSuhTUfz23GW8fDJ543EjiJlYubRf
   bMO3mVOKNY6vYvMmuy4Gt/blVz43q6lpHLPWJG8CBbX58oYpVNjIXFSlz
   6IHZn2aBYePYY+u08sHVE6uDiZSsZRUIKZNUyB1qEk0jZ4ZKHfkJvaWgH
   2YmHCRvvbWGg66nbGhFE1g83q+XUPl3b7D4Wdo1xr76I2awlM8TqUczf6
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,287,1669046400"; 
   d="scan'208";a="335008782"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 11 Feb 2023 11:12:25 +0800
IronPort-SDR: lViUVQ4LdOQusDj8r/5hUwIyREiUwynPHXdHbVDdXWMSBWIqCSjyP6O8LQqcyH0vUhJYxm7use
 GOqr5bWH8ZFRWTTxdBSxXBG6daXWCpRDLtVTZh3R9QW6DMB2CojAUn7+4Sma482lRb33rQ1p30
 ETqPHZ8IqxDvCpFmsZRNtRpmeUZIAsXsTU19IgWxF4qkJH81arZzaKe89T6gnqAecJQNwGOHKH
 yFYFzeDB4/A07BjmVGc79CmdtW/12Mxf80n2bWbrMRtqE5kqsRfw9QSz5cqrygGnmZ8yfwzjw3
 V3Y=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Feb 2023 18:23:53 -0800
IronPort-SDR: 3eSJuyQzR8r1wwATtAZQZg8b/BxVYZkjNkiV+ud2IE/CxMsnp3YOpUfFFIgSc+Ol/Tq1m2wm5V
 Z3K18anB/VOKJhV7rgUpaUStOZAtBErue1WnaOWXlGVYFLrTvHmplVYU8rE8LIsWyC4T+yFHU3
 mtQClgpi5/0j0SsNDJ9HQPaB/GsLVQoQciz7+pJ7+dCP3VnJLwfiATwbEG4Da4Z0l1Fwto76HG
 BrxDtQHnQbtFU7aZ2U3lLqV9p2gqrHNcegWNA4pP8wWtO6TK3clpPWT3lLzzLgAGjrcLpuZDce
 8/o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Feb 2023 19:12:26 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PDFyf0HhRz1RwqL
        for <linux-ide@vger.kernel.org>; Fri, 10 Feb 2023 19:12:26 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1676085145; x=1678677146; bh=cRNFIFSiH3UIhDPtCd3elJf0fnQt1BKoidM
        caUkgeTg=; b=fvGh+zp6fhxV/Fq+ILp5k2xdBGar38kgrYpySv3C4NUMq9nyAF+
        27AvspNy6EB8RzbE2b9dATMQFhepoAelwiS2ZQ6tlpszz+6AhIjcJExU1Iv8U69m
        VlCUB3EAXH8bflfmCPWXfRP0/E9iu7GDjyU5Gg4/vN4EpJshtaDvFUhAHe8Kp1PD
        /JfumgdHbQuiZdXqeatE7aBAg8lOuwznqFWQ8NJED4Ed4uSFCVTT2aLANjbPXLaW
        KAojQHPL7JNOmSuLNhIv1+lNAtlgPjHr+ft5/Bwp1aRpQDu/WO/QcZPhSU1HY8Tm
        baHAZUUrxfTG/+W7x7fnuvXgYXcZV5XPABg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id IBS_66POMXW7 for <linux-ide@vger.kernel.org>;
        Fri, 10 Feb 2023 19:12:25 -0800 (PST)
Received: from [10.225.163.108] (unknown [10.225.163.108])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PDFyd06Yrz1RvLy;
        Fri, 10 Feb 2023 19:12:24 -0800 (PST)
Message-ID: <d2a0c3bd-d7ef-85ff-6268-712c098e9d32@opensource.wdc.com>
Date:   Sat, 11 Feb 2023 12:12:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ata: libata-core: Disable READ LOG DMA EXT for Samsung
 MZ7LH
Content-Language: en-US
To:     Patrick McLean <chutzpah@gentoo.org>, linux-kernel@vger.kernel.org
Cc:     linux-ide@vger.kernel.org
References: <20230210215151.812839-1-chutzpah@gentoo.org>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230210215151.812839-1-chutzpah@gentoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 2/11/23 06:51, Patrick McLean wrote:
> Samsung MZ7LH drives are spewing messages like this in to dmesg with AMD
> SATA controllers:
> 
> ata1.00: exception Emask 0x0 SAct 0x7e0000 SErr 0x0 action 0x6 frozen
> ata1.00: failed command: SEND FPDMA QUEUED
> ata1.00: cmd 64/01:88:00:00:00/00:00:00:00:00/a0 tag 17 ncq dma 512 out
>          res 40/00:01:01:4f:c2/00:00:00:00:00/00 Emask
>          0x4 (timeout)
> 
> Since this was seen previously with SSD 840 EVO drives in
> https://bugzilla.kernel.org/show_bug.cgi?id=203475 let's add the same
> fix for these drives as the EVOs have, since they likely have very
> similar firmwares.
> 
> Signed-off-by: Patrick McLean <chutzpah@gentoo.org>
> ---
>  drivers/ata/libata-core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
> index 2ea572628b1c..c4c89d24f84c 100644
> --- a/drivers/ata/libata-core.c
> +++ b/drivers/ata/libata-core.c
> @@ -4045,6 +4045,9 @@ static const struct ata_blacklist_entry ata_device_blacklist [] = {
>  	{ "Samsung SSD 870*",		NULL,	ATA_HORKAGE_NO_NCQ_TRIM |
>  						ATA_HORKAGE_ZERO_AFTER_TRIM |
>  						ATA_HORKAGE_NO_NCQ_ON_ATI },
> +	{ "SAMSUNG*MZ7LH*",		NULL,	ATA_HORKAGE_NO_NCQ_TRIM |

Are you sure about the upper case here for this drive model name ?

> +						ATA_HORKAGE_ZERO_AFTER_TRIM |
> +						ATA_HORKAGE_NO_NCQ_ON_ATI, },
>  	{ "FCCT*M500*",			NULL,	ATA_HORKAGE_NO_NCQ_TRIM |
>  						ATA_HORKAGE_ZERO_AFTER_TRIM },
>  

-- 
Damien Le Moal
Western Digital Research

