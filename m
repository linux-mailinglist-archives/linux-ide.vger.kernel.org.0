Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6F8A4781D4
	for <lists+linux-ide@lfdr.de>; Fri, 17 Dec 2021 01:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbhLQA6O (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 16 Dec 2021 19:58:14 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:11727 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbhLQA6N (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 16 Dec 2021 19:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1639702692; x=1671238692;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Qno2CgAyxQirWWW1hmZkXeM+1LMatVaVq6RgRnLvU9g=;
  b=ILS6U4A55Vxj5Sr0QmwtJyPUXmjVwNTttJbB2/stM9UaIHbys+kVwxoe
   gvvBgEre/Uf5TvmjYMohSA58JAIwExK036/QfaxxfOsln1O9Q3arltLsn
   xAn20I7K8mTFT+IeXi1lATn1sYfwpWGYRf9KOxESLB2XebuZcOOwlR6VL
   ra1PCF4zfEVnt/VocNWlcgZmZbwnA6vFtVk6vIbntaUsYm9ROM9XfjOhe
   5yC8u73lG8FLOZGfBdvA+QWGY83BdFnsduekUxc/He0x7nWl5NP/AyLkC
   5z/Mm5JIATOtWf0u/IC+PnmxXMPPHExEDJ8SSvIKfnhWjgEkk0RqRmNGo
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,212,1635177600"; 
   d="scan'208";a="193258225"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2021 08:58:12 +0800
IronPort-SDR: /0HVHYN1uudhvCnXa2pc3ZgYh8wY8T27KOAUuqeLzdwv+CCy/zUlMZI0nRwp4Y1uWhT+8YRAYX
 m7pYyQ08j303E5ME6EKu4L6/YbJlG6Rcz0jdW/5T9jIB5N2LRodrQFQWJWpXZPbuHWaxjP91+a
 3dwqMK0sJSmcPg2A/R6fckrwWTs1pNmD8V3mzZFDnJAIJml/H4nuNbbOW//dzvBVI2m6x8YUnL
 Qi6odGX7vjO/nwbtB5OblRH8taXxBXDPxoWixMAss22bZqhedGWKa3sGduDWNgKMBPqqRYrJUc
 K+cGlfO+5JBLvmnelA9htK+B
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 16:31:05 -0800
IronPort-SDR: NNxwl7v2NtaAAQk8RqY0xusVoEU5yEYXhGlEnru8H/g6s5qLPVnPwLp/AzMZ7fYjymBxbFpZsn
 EhQ5PycoxpDtoy/q0e1cloIiHMCQmrkrPX+fNxv649u8VK/Zlzqsw5ajL4+P87jmY2n/WutChM
 NWb5wiyQ2PIaAAR/4tZ+uoFmFFGZ9tMjsNb4RA8DM1VLAzaWf9w4xmKLLmnS4zbfsOviMVhcse
 ck11SbnM7s5/OLQn+N/4jq7loJTzTUGKKU0LRGtxsO89X1dXwp/p8ihFlISsQMA0sFS2fSu4FT
 HO0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 16:58:13 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JFVw43Stsz1RwFN
        for <linux-ide@vger.kernel.org>; Thu, 16 Dec 2021 16:58:12 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1639702691; x=1642294692; bh=Qno2CgAyxQirWWW1hmZkXeM+1LMatVaVq6R
        gRnLvU9g=; b=sX+5aHWgjU9WmuJbCT9oQHSqKbcQ0AsCaRcqPHpRlVbdNupQT2R
        Ijey0rj3u2cDC9Qr2rWzE9SGFC/4KXUVJBIaOsxnZ3rNAp7HoyAAcY1+7Lqff/gj
        HZcT5qlU80JXjKVg6DV7OIiKLf/G+QXmIFdst7/Z7uvPzghZayLy7Kg8LkBGGV/L
        MK6Eu4bzvACUSZo8Bh5DXPbUBW+0I1R/n1KkDylyPlTaN10XgsRvLLggg8U0EIyu
        +KtpVGVSBOqyx553a2J9hbr/96iLmelOUCI2shTt5RnopU8HTfoFjBrBixktv4OV
        vfmZOHIJFAG6xE7Q/V/tj09NPdprRdzk8pw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id d1J3y20-ZC8b for <linux-ide@vger.kernel.org>;
        Thu, 16 Dec 2021 16:58:11 -0800 (PST)
Received: from [10.225.163.18] (unknown [10.225.163.18])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JFVw26Y4Vz1RtVG;
        Thu, 16 Dec 2021 16:58:10 -0800 (PST)
Message-ID: <ad51ef97-7742-7ed3-58f0-e3b9fc4f71ed@opensource.wdc.com>
Date:   Fri, 17 Dec 2021 09:58:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1 2/2] ata: libahci_platform: Remove bogus 32-bit DMA
 mask attempt
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>
References: <20211209145937.77719-1-andriy.shevchenko@linux.intel.com>
 <20211209145937.77719-2-andriy.shevchenko@linux.intel.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20211209145937.77719-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 12/9/21 23:59, Andy Shevchenko wrote:
> If 64-bit mask attempt fails, the 32-bit will fail by the very same reason.
> Don't even try the latter. It's a continuation of the changes that contains,
> e.g. dcc02c19cc06 ("sata_sil24: use dma_set_mask_and_coherent").
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/ata/libahci_platform.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platform.c
> index 1af642c84e7b..972f5ec86a27 100644
> --- a/drivers/ata/libahci_platform.c
> +++ b/drivers/ata/libahci_platform.c
> @@ -637,13 +637,8 @@ int ahci_platform_init_host(struct platform_device *pdev,
>  	if (hpriv->cap & HOST_CAP_64) {
>  		rc = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64));
>  		if (rc) {
> -			rc = dma_coerce_mask_and_coherent(dev,
> -							  DMA_BIT_MASK(32));
> -			if (rc) {
> -				dev_err(dev, "Failed to enable 64-bit DMA.\n");
> -				return rc;
> -			}
> -			dev_warn(dev, "Enable 32-bit DMA instead of 64-bit.\n");
> +			dev_err(dev, "Failed to enable 64-bit DMA.\n");
> +			return rc;
>  		}
>  	}
>  
> 

Applied to for-5.17.
For patch 1/2, waiting for you v2 restoring the irq == 0 check.

-- 
Damien Le Moal
Western Digital Research
