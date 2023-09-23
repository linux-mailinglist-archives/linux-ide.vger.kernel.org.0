Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 591487AC303
	for <lists+linux-ide@lfdr.de>; Sat, 23 Sep 2023 17:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbjIWPCA (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 23 Sep 2023 11:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231937AbjIWPB5 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 23 Sep 2023 11:01:57 -0400
Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B2C819A;
        Sat, 23 Sep 2023 08:01:51 -0700 (PDT)
Received: from eig-obgw-5010a.ext.cloudfilter.net ([10.0.29.199])
        by cmsmtp with ESMTP
        id jyvyqGzeoez0Ck48MqCMc8; Sat, 23 Sep 2023 15:01:26 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with ESMTPS
        id k48jqC7HqIDdmk48kqCw9u; Sat, 23 Sep 2023 15:01:50 +0000
X-Authority-Analysis: v=2.4 cv=HcYH8wI8 c=1 sm=1 tr=0 ts=650efdde
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=EabzJG2rVzengUzDcWBcKvR8fjGQXhmX4ki6ncLymxs=; b=gbIV+wQRirZt/G48bleKQNkkZA
        Hz2yDIjD4PHK3btnm/PH2fllBsDAu7wmnm4YAG6C0wXhEdqaSiiJ1FPKDeqcN+0vVvMDl2FQjVL0P
        e+YD0jNxVhHJzQgwb74SaU+Gaug5y4N7YAoaJk+V+qHCOJIBFfdMicBDgUNIX7eG+vqtRc+BbsOOI
        kKdto1Gw5d1iShBJqkdXi4U22T5H22gS+I1vMIrGnvvSNwhqjKvi85XfqNIFp6xwK0dj2O79wSGMK
        tEfoFd+WDiO9iAi2vZHw+HhTrl9wvfFyqw5CT+jbxl636BBLPlZUOEfuq3PX1xq9jBTWgu2U0tl0M
        EYnHPA+w==;
Received: from [94.239.20.48] (port=46296 helo=[192.168.1.98])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.96)
        (envelope-from <gustavo@embeddedor.com>)
        id 1qjy5R-003dKL-0q;
        Sat, 23 Sep 2023 03:34:01 -0500
Message-ID: <17cda7da-a70f-8d0d-4224-c82b0ddc4364@embeddedor.com>
Date:   Sat, 23 Sep 2023 10:35:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] libata: Annotate struct ata_cpr_log with __counted_by
Content-Language: en-US
To:     Kees Cook <keescook@chromium.org>,
        Damien Le Moal <dlemoal@kernel.org>
Cc:     linux-ide@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20230922175210.work.239-kees@kernel.org>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175210.work.239-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.239.20.48
X-Source-L: No
X-Exim-ID: 1qjy5R-003dKL-0q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:46296
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org:  HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLObdDCitD7CqE3EpOs3qVYVbj7OD5XNZe8p2p0A5cXFT/8OZStJZgBdnvKfynbslQg9EnK3AyG98klPkd1RibzZChdS9FwxcCp+Ckgv+2s9+pTZUOxC
 DbKEM/eCKMQIayKV8E7J2GdUZJkBQsmm0WtARvDamo2Q0p/KacT25cCTNTEZKQHXK8I9KfcCP9h8Kztqx0z/Pnr3Td+meyqxQJPza8Hy0oIn7YxqRPxxlwts
 9O9G/Lo+XaQTwaDtjdY9aLCVm5jv775cAv786UMD1GaiKdbFrwWb3wQDGI4d/+bdLRElh9om/ma3IA2Ntn4okA==
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org



On 9/22/23 11:52, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct ata_cpr_log.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Damien Le Moal <dlemoal@kernel.org>
> Cc: linux-ide@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   include/linux/libata.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/libata.h b/include/linux/libata.h
> index 3c17a5053f00..f91e8e7f1c00 100644
> --- a/include/linux/libata.h
> +++ b/include/linux/libata.h
> @@ -656,7 +656,7 @@ struct ata_cpr {
>   
>   struct ata_cpr_log {
>   	u8			nr_cpr;
> -	struct ata_cpr		cpr[];
> +	struct ata_cpr		cpr[] __counted_by(nr_cpr);
>   };
>   
>   struct ata_device {
