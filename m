Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B66AF6AD22C
	for <lists+linux-ide@lfdr.de>; Mon,  6 Mar 2023 23:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbjCFW75 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 6 Mar 2023 17:59:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjCFW74 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 6 Mar 2023 17:59:56 -0500
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 843AF2ED79
        for <linux-ide@vger.kernel.org>; Mon,  6 Mar 2023 14:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1678143595; x=1709679595;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iZxmEGOWp/OXxEv+WC2yV5njZDK+QBRlzNqW4+BA9H0=;
  b=T/QTry7MjHioUG0wbSTycKnTcz+IK26Ec4+/anTpIy50r54Wl5FaGAvZ
   EslXHIQfpmmsew3z9kSLfVSkKrIK/+wRQ8178mAf00rmc+/AksRTyZtwa
   IZ/2Gkj4p3MYDBhW0wQ303DxnZuwS216R7KBEHjVzzXzNcvBdOhX+R5Z0
   Fw1Ln5UcPxBmKgmd+pzMj4qeFxRljfd2r/vg2VIW3133ki5uJNgydDZVb
   ea2Sjz6Ixy71HWBui/ICZnRQTe4eBKkpn2cNiOSU1mdwzWf6FQuf7wZ50
   Sh+pnF2AkbT64bF8b9b6Gi5Yg7Ba5gMTLBQIM/neyoym4JFWksKqQx/rh
   A==;
X-IronPort-AV: E=Sophos;i="5.98,238,1673884800"; 
   d="scan'208";a="229902444"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 07 Mar 2023 06:59:53 +0800
IronPort-SDR: g5oE1HCjae7Xy17uPrKWFZ7TCfq5av5d7naBp7bRGOyZ49YBstPl7N5FJ265Dj8uNOGb/Dok6K
 GxYnm6fcOh/9EhWkrD5TjlGlvokeyGGtSyumdb3O+L0VXP1PPuH8AtREp4JL8A91+wnN24ujyy
 4mJfHNizN38pzuZc5/heBv6/k8jp/4SmYRQJP7pF3OW03S783ORPPK2UqmZLyiFdKz4ZJolZwj
 LMOjR973XneYe1spcKcS6ivBYKs1Z/7QiF6J5alllQ0aCSbkH+RPiCaathDLYVr8fg0DagKoiG
 pUw=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Mar 2023 14:16:33 -0800
IronPort-SDR: u8b36L8ImXduyni33rYgsTpLhwVl+Q7hgMEQmyQxBNNsufr9fJNb89nRmxBHrtL22y6pXzrzUf
 2CTmxwHY0PLbrvtqWb//9rHQsfURpqHI86L/XsS/pdausznAQQid+xpq7mBb4E+m8b6IVAoHhw
 IJ5rVDbJpo86D2+OnpuZCYerCRuiwbhYJP0MOcZ0vm5Y6oe0NKIQjOc1B1asj589JuW0Sg0w94
 Y3ryf60f61YZ2i36U3GB7qLDB0feLIP5LgkEwY3riPC/K+Mfh8gRZsAcIO7VnKHPEnopKk4Iy1
 XBg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Mar 2023 14:59:53 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PVvD91vxzz1Rwrq
        for <linux-ide@vger.kernel.org>; Mon,  6 Mar 2023 14:59:53 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:content-language:references:to
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1678143592; x=1680735593; bh=iZxmEGOWp/OXxEv+WC2yV5njZDK+QBRlzNq
        W4+BA9H0=; b=Yu/TwQoJxDcY5ppEF57COV7O89ylia/4/nhYPCXOj21LZR2ANWL
        0YaBoDMTppI9GW5yo3NsfXXi29vFavC3dmGvJyutrkMOnCm0FDiypSq9+O5v76vC
        exdJEWLZ2eqsC62K4A5r65FI9qrwO5yC8QFkASVygFv9YqK5nKB7YQrDy08qwDKr
        6snJivlwbpteuNq53cINOJxCRzvP+Q/b9MiFJxw//ogiEtXPLfGtrg/+YkXk98hA
        zObVKO1q9e+9+8EtcvTg6wxPsGrbrK0T32f7vYvCBBUY6oVL2dBxvkYvEGI/QtL2
        h9S77UEpKn2J2B/hhbpeg0RIcG+YuguECnQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id KmIfiDvQnPmA for <linux-ide@vger.kernel.org>;
        Mon,  6 Mar 2023 14:59:52 -0800 (PST)
Received: from [10.225.163.60] (unknown [10.225.163.60])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PVvD71Gqvz1RvLy;
        Mon,  6 Mar 2023 14:59:50 -0800 (PST)
Message-ID: <4273f666-0c69-8111-308d-173df500c288@opensource.wdc.com>
Date:   Tue, 7 Mar 2023 07:59:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RESEND v4 0/18] pata_parport: protocol drivers fixes and
 cleanups
To:     Ondrej Zary <linux@zary.sk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Jens Axboe <axboe@kernel.dk>, Tim Waugh <tim@cyberelk.net>,
        linux-block@vger.kernel.org, linux-parport@lists.infradead.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230306172752.7727-1-linux@zary.sk>
Content-Language: en-US
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230306172752.7727-1-linux@zary.sk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 3/7/23 02:27, Ondrej Zary wrote:
> This patch series fixes two bugs and cleans up pata_parport protocol drivers,
> making the code simpler with no changes in behavior (except logged messages).
> 
> Signed-off-by: Ondrej Zary <linux@zary.sk>

Already queued for 6.4, but I have not pushed the branch yet.
Thanks !

> ---
> Changes in v4:
>  - dropped whitespace changes from patch 12/18
> Changes in v3:
>  - added missing reviewed-by tags
>  - added more detailed changelog:
>    - patches 04-05 are split from v1 patch 02/12
>    - patch 06: comment-out instead of if(1)
>    - patches 11-14 are split from v1 patch 08/12
> Changes in v2:
>  - added two bugfixes (first two patches)
>  - addressed Sergey's comments (mostly split patches)
> 
>  drivers/ata/pata_parport/aten.c                            |  45 ++++----------
>  drivers/ata/pata_parport/bpck.c                            |  86 ++++++++------------------
>  drivers/ata/pata_parport/bpck6.c                           | 107 ++++++++-------------------------
>  drivers/ata/pata_parport/comm.c                            |  52 +++++-----------
>  drivers/ata/pata_parport/dstr.c                            |  45 ++++----------
>  drivers/ata/pata_parport/epat.c                            |  48 ++++++---------
>  drivers/ata/pata_parport/epia.c                            |  55 +++++------------
>  drivers/ata/pata_parport/fit2.c                            |  37 ++++--------
>  drivers/ata/pata_parport/fit3.c                            |  39 ++++--------
>  drivers/ata/pata_parport/friq.c                            |  56 ++++++-----------
>  drivers/ata/pata_parport/frpw.c                            |  71 ++++++----------------
>  drivers/ata/pata_parport/kbic.c                            |  66 +++++++++-----------
>  drivers/ata/pata_parport/ktti.c                            |  38 ++++--------
>  drivers/ata/pata_parport/on20.c                            |  45 ++++----------
>  drivers/ata/pata_parport/on26.c                            |  52 ++++------------
>  drivers/ata/pata_parport/pata_parport.c                    |  31 +++++-----
>  {include/linux => drivers/ata/pata_parport}/pata_parport.h |  41 ++++---------
>  17 files changed, 271 insertions(+), 643 deletions(-)
> 
> 

-- 
Damien Le Moal
Western Digital Research

