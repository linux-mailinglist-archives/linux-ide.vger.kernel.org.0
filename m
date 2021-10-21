Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E46543584E
	for <lists+linux-ide@lfdr.de>; Thu, 21 Oct 2021 03:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhJUBjs (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 20 Oct 2021 21:39:48 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:13604 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbhJUBjr (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 20 Oct 2021 21:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1634780251; x=1666316251;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jwOrXSWMi/h8yhJ2POQSyR+DIDfPu/1xNtKYNmwPAro=;
  b=ZSjwKtAsmXowQxhGlz3k4+OhaGyAZ6oPNLBeNt/FcbMRIm9wD/LCqZ5o
   ivORzR50pi90fmM7WUSqf6yt18I4k9fYqRcQZ+wKWeqO6AwUrYZbnE4u3
   w3/gRzjl61YhZ/UVP9tO5S+DKFPilPWCRVGpwedDf14+AKzYobXbLG1nF
   x/CYkoQLuQ6u8oMvUQ/KdMQ+2f7lgplGqCTeuZzO1ilojF+hFMrxp1hGh
   06csp1mlMxa9GSniZ4oDeRuk4ji2xsMubrITVY3y1ZrCymCoebeqOVIKo
   pi7kJdMr5YVyLjHM9tat/K59x68CwhGn1Vyj9M/DKdQj995xEk89Ac4os
   w==;
X-IronPort-AV: E=Sophos;i="5.87,168,1631548800"; 
   d="scan'208";a="183467351"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 21 Oct 2021 09:37:30 +0800
IronPort-SDR: p21J4nKI9k3EXGcNjHsoVW2eDbJPwH40S/opF0bznAmMD7cBVhL3WTuvMdBnfin3ExUO1EJ3HJ
 JNAZQnj5Zm9tSbnBXdR8+HBOY13sl5KhbM8c0OuUJ/dntEb0BtMK5ShvKHTqSlEzgnk5pB/cv1
 4u8bhJ5fSrrxXmaW5TUG5Nju3loMg3zVzIDcrHkqsj4AQvGWbeVTSEBsdh2rJk4vNnSsvPIJy6
 pkjrk2qrALEz1JMmjnKDU2pL9WvtnLWmqJsayFyicSsp+etZoRA4GvfN9BzXCY9DcmS34lxPCP
 4XDfZfndOdyyW0zAlokkMRAP
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 18:11:35 -0700
IronPort-SDR: YxmaQ7DAS9M18HFFwB3fxKMx1r5v7UD7H0lcTHca2fQE80Y59HyRNFQAGibW2e/7oQt3s9laxM
 4ZY7TGs2uEdIWpcIM/P7XZ9fcCn6GaQ8NQxNHkVEsLMoWbZcvR/ReKefG77Vm2ZIs4rjDBxssY
 yoR+0FRLQkvQM8wfi5WBM7Iujhz/koczfjvTNedKoBRtSmFRfBaz6cX4o9utsXtaAEyBv8QYxt
 C5wpW6eVqt3Hp/m7bgS1cRDCWLA6VNsMpBSXt1utM4vpI8PxU2EMaI6Tb3wYzIy7zeHip/YlYm
 JKs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 18:37:32 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HZVTl3VfYz1RvmF
        for <linux-ide@vger.kernel.org>; Wed, 20 Oct 2021 18:37:31 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1634780250; x=1637372251; bh=jwOrXSWMi/h8yhJ2POQSyR+DIDfPu/1xNtK
        YNmwPAro=; b=K6Qu8WOl7wmxvDxE7eQjTqZkkrCRYHqVUmf8xMBxpSG+k08iuXU
        IqIVntaUXvS8CJz7cpVorzw7BK9W9ct5XqNjMUWOrDwmeNowdUolaouWBOyI+98I
        VxQtpnY7FziMRdXh90aTKdkeOKQdBaSUCEcnagM+/aixOuyFuHIzZNHJHsky8J/l
        jyB2tQPGvBdu1pvZpwsUy4YxE8YWR1pxXvyeKugOiSALLGmqpXV+BsHKkO/UzIeB
        Yd9nBbXcbHrxfXqvlPAMcLNdH4BsLyVhGBBoj7r91MytHrr/LxjecD7v3ay3pyFc
        9CxCDSrxbMjxIDB8PU27N85BdCv35HhWFxA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id yFY--SKoJvZV for <linux-ide@vger.kernel.org>;
        Wed, 20 Oct 2021 18:37:30 -0700 (PDT)
Received: from [10.225.163.67] (unknown [10.225.163.67])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HZVTk1rT3z1RvlZ;
        Wed, 20 Oct 2021 18:37:30 -0700 (PDT)
Message-ID: <42eb2c97-7ebd-b369-5fd6-ba342cb3c89b@opensource.wdc.com>
Date:   Thu, 21 Oct 2021 10:37:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] scsi: ata: make ahci_sdev_attrs static
Content-Language: en-US
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>
References: <1634639082-1007-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <1634639082-1007-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 10/19/21 19:24, Jiapeng Chong wrote:
> From: chongjiapeng <jiapeng.chong@linux.alibaba.com>
> 
> This symbol is not used outside of libahci.c, so marks it static.
> 
> Fix the following sparse warning:
> 
> drivers/ata/libahci.c:134:18: warning: symbol 'ahci_sdev_attrs' was not
> declared. Should it be static?
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Fixes: c3f69c7f629f ("scsi: ata: Switch to attribute groups")
> Signed-off-by: chongjiapeng <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/ata/libahci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
> index 28430c093a7f..8a6835bfd18a 100644
> --- a/drivers/ata/libahci.c
> +++ b/drivers/ata/libahci.c
> @@ -131,7 +131,7 @@ const struct attribute_group *ahci_shost_groups[] = {
>  };
>  EXPORT_SYMBOL_GPL(ahci_shost_groups);
>  
> -struct attribute *ahci_sdev_attrs[] = {
> +static struct attribute *ahci_sdev_attrs[] = {
>  	&dev_attr_sw_activity.attr,
>  	&dev_attr_unload_heads.attr,
>  	&dev_attr_ncq_prio_supported.attr,
> 

Jiapeng,

This patch does not apply to the current libata tree since it is against
the latest changes queued in the scsi tree. After fixing the patch
title, can you resend this patch to the linux-scsi list and to Martin ?



-- 
Damien Le Moal
Western Digital Research
