Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12EC74576A
	for <lists+linux-ide@lfdr.de>; Fri, 14 Jun 2019 10:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbfFNIZB (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 14 Jun 2019 04:25:01 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36842 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbfFNIZA (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 14 Jun 2019 04:25:00 -0400
Received: by mail-lf1-f68.google.com with SMTP id q26so1127635lfc.3
        for <linux-ide@vger.kernel.org>; Fri, 14 Jun 2019 01:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ui1gY2AP8chXdXn4wmlJQTa1agcsKtmFVHRK40WFU4U=;
        b=HdUyjwMq0kBBGoMRXEpch9I9ao93cxtEIRbVgFkLWO81MCwFQdr2DIrPJj0FNeFPcm
         acPkqkVYftUgC0vIt8Zp7FixT4eDYUZJpsFZFK0YF8Vl6VeEx6JsnY1ehgrd/8mM8Cr2
         VqrkTt3Z4tLGu9b7BB9RauoMtmTHITL0yQXBIBqsmle7L4djMJKrHKyGgHXD73aTFKWw
         /wRiGIkiGMiftqtBc6PYEPiUDkWujvPZM7PJ5RGsKLw9sMjBuHPeSWNFrgB8+amNQ8H6
         UoY4phfPjhmeB0Bzy+5sCboHEMe0oSnHAChnE9iKHX4V565rMv5U9WY2mWOm4yTmlCHm
         qoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ui1gY2AP8chXdXn4wmlJQTa1agcsKtmFVHRK40WFU4U=;
        b=Fn9INbMIe1QaGRSMVXj3nvYNB4foxsOD/DeVsR569JwnleBzIAEtvqgLkzYgC3S16o
         f4zTARV5H3MjPxcj2BgFcvGjOCUI5sEKHEld6MMIZ+EJJgH7ylF3V92IQaU2d7tfbYvB
         PQnyaUTiU7exYLU5VOQ3Fx8HR5TMWmd9Ufq1TS5CRXnFnZVimFQRi6TDXYPRZMDDy7OT
         WHfT0ZOiWWq6RzjfNko/Th2O2CxPrbHobQIkFDBg1rBltKR1uRxfqT1xY/WrgG9g490a
         XIaboP+HYkKYOXWi10Rs4oHGWJ4Soi6ZiZ1VoiRdNvJrYZyN0yN2S8HEHdZqKmxKMI92
         R3qw==
X-Gm-Message-State: APjAAAWiKWLH/al8lmoCIQYW7qxxX0J6erC1pYIAi+7rHm7oEMK878h8
        Y00mQm53/pP9fWcm3Jh5eOEQZNS5JyM=
X-Google-Smtp-Source: APXvYqxqAzZa3TgvBcOszolL8TArMgvi7Ng31/rAXeYBcOf3R76pCykuiCkcuVwtNQ4QHwmGavmYeA==
X-Received: by 2002:a19:e05c:: with SMTP id g28mr33170062lfj.167.1560500698732;
        Fri, 14 Jun 2019 01:24:58 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.84.143])
        by smtp.gmail.com with ESMTPSA id b11sm454239ljf.8.2019.06.14.01.24.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 01:24:58 -0700 (PDT)
Subject: Re: [RFC 3/3] ata: sata_mv, avoid trigerrable BUG_ON
To:     Jiri Slaby <jslaby@suse.cz>, axboe@kernel.dk
Cc:     linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org
References: <20190614071140.6233-1-jslaby@suse.cz>
 <20190614071140.6233-3-jslaby@suse.cz>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0e9f8a3b-65b9-4d87-21f1-684f7e44b166@cogentembedded.com>
Date:   Fri, 14 Jun 2019 11:24:46 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614071140.6233-3-jslaby@suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hello!

On 14.06.2019 10:11, Jiri Slaby wrote:

> There are several reports that the BUG_ON on unsupported command in
> mv_qc_prep can be triggered under some circumstances:
> https://bugzilla.suse.com/show_bug.cgi?id=1110252
> https://serverfault.com/questions/888897/raid-problems-after-power-outage
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1652185
> https://bugs.centos.org/view.php?id=14998
> 
> Let sata_mv handle the failure gracefully: warn about that incl. the
> failed command number and return an AC_ERR_INVALID error. We can do that
> now thanks to the previous patch.
> 
> Remove also the long-standing FIXME.
> 
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: linux-ide@vger.kernel.org
> ---
>   drivers/ata/sata_mv.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/ata/sata_mv.c b/drivers/ata/sata_mv.c
> index d6aac7b31c45..144fa0982168 100644
> --- a/drivers/ata/sata_mv.c
> +++ b/drivers/ata/sata_mv.c
> @@ -2098,12 +2098,10 @@ static int mv_qc_prep(struct ata_queued_cmd *qc)
>   		 * non-NCQ mode are: [RW] STREAM DMA and W DMA FUA EXT, none
>   		 * of which are defined/used by Linux.  If we get here, this
>   		 * driver needs work.
> -		 *
> -		 * FIXME: modify libata to give qc_prep a return value and
> -		 * return error here.
>   		 */
> -		BUG_ON(tf->command);
> -		break;
> +		ata_port_err(ap, "%s: unsupported command: %d\n", __func__,
> +				tf->command);

    I'd use "%x" here instead of "%d".

> +		return AC_ERR_INVALID;
>   	}
>   	mv_crqb_pack_cmd(cw++, tf->nsect, ATA_REG_NSECT, 0);
>   	mv_crqb_pack_cmd(cw++, tf->hob_lbal, ATA_REG_LBAL, 0);

MBR, Sergei
