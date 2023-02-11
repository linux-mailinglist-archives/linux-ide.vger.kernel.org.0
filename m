Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E32D5693338
	for <lists+linux-ide@lfdr.de>; Sat, 11 Feb 2023 20:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjBKTLR (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 11 Feb 2023 14:11:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBKTLQ (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 11 Feb 2023 14:11:16 -0500
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D6512587;
        Sat, 11 Feb 2023 11:11:15 -0800 (PST)
Received: from [192.168.1.103] (31.173.83.74) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Sat, 11 Feb
 2023 22:11:06 +0300
Subject: Re: [PATCH 03/12] pata_parport: remove devtype from struct pi_adapter
To:     Ondrej Zary <linux@zary.sk>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        Tim Waugh <tim@cyberelk.net>, <linux-block@vger.kernel.org>,
        <linux-parport@lists.infradead.org>, <linux-ide@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20230211144232.15138-1-linux@zary.sk>
 <20230211144232.15138-4-linux@zary.sk>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <909afe94-d786-a94c-5142-818e540705cc@omp.ru>
Date:   Sat, 11 Feb 2023 22:11:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20230211144232.15138-4-linux@zary.sk>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.173.83.74]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 02/11/2023 18:56:43
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 175451 [Feb 10 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 502 502 69dee8ef46717dd3cb3eeb129cb7cc8dab9e30f6
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.83.74 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;31.173.83.74:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.83.74
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/11/2023 19:00:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/11/2023 2:00:00 PM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 2/11/23 5:42 PM, Ondrej Zary wrote:

> Only bpck driver uses devtype but it never gets set in pata_parport.
> Remove it.
> 
> Signed-off-by: Ondrej Zary <linux@zary.sk>
> ---
>  drivers/ata/pata_parport/bpck.c | 2 +-
>  include/linux/pata_parport.h    | 3 ---
>  2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/ata/pata_parport/bpck.c b/drivers/ata/pata_parport/bpck.c
> index b9174cf8863c..451a068fe28a 100644
> --- a/drivers/ata/pata_parport/bpck.c
> +++ b/drivers/ata/pata_parport/bpck.c
> @@ -241,7 +241,7 @@ static void bpck_connect ( PIA *pi  )
>  
>  	WR(5,8);
>  
> -	if (pi->devtype == PI_PCD) {
> +	if (1 /*pi->devtype == PI_PCD*/) {	/* FIXME */
>  		WR(0x46,0x10);		/* fiddle with ESS logic ??? */

   Why not drop this entire *if* stmt? 

>  		WR(0x4c,0x38);
>  		WR(0x4d,0x88);
[...]

MBR, Sergey
