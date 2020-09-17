Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5101926DB39
	for <lists+linux-ide@lfdr.de>; Thu, 17 Sep 2020 14:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgIQMMh (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 17 Sep 2020 08:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgIQMB4 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 17 Sep 2020 08:01:56 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE24EC06178B
        for <linux-ide@vger.kernel.org>; Thu, 17 Sep 2020 05:01:54 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BsbCK5G3Rz9sS8;
        Thu, 17 Sep 2020 22:01:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1600344062;
        bh=drKiJPh6uUahqNiKyElUeAZk2wIXu3ZhA3NKB9nCYcw=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=K1UY89jCixp72jlWeIPSfpOB7vyiQ2pwGnUFVvsf0B2FOmy7/yaCzh6UCT7p5W/Yw
         70F9JkRP1E9jKlutDTKywLjjzj6Z7rg+8fYmE/G3k7D7HgEbb3MZ+NwOlLDgTRQYUZ
         1EkTImlGWMYYzoDYOlmr87dXl+80hpg4SFZC85Sh4waowIocEYUUT+DLl8FpyH4Lg3
         7gvv3s+HIp1yRZ6pXo3wGCKVhpn7poXOIMnY9q3+HVTGh4Fj4eGnUUF3YyPN+AEAHi
         HPh+GRDX7d+HzQwYacuaSKo1D3gk/4OVThEvPTzsv/53OHblkyoZq4enad7HsrK5Ys
         CKSIckbWyg/Gw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Wang Wensheng <wangwensheng4@huawei.com>, davem@davemloft.net,
        benh@kernel.crashing.org, paulus@samba.org,
        linux-ide@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] ide: Fix symbol undeclared warnings
In-Reply-To: <20200916092333.77158-1-wangwensheng4@huawei.com>
References: <20200916092333.77158-1-wangwensheng4@huawei.com>
Date:   Thu, 17 Sep 2020 22:01:00 +1000
Message-ID: <87zh5oobnn.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Wang Wensheng <wangwensheng4@huawei.com> writes:
> Build the object file with `C=2` and get the following warnings:
> make allmodconfig ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu-
> make C=2 drivers/ide/pmac.o ARCH=powerpc64
> CROSS_COMPILE=powerpc64-linux-gnu-
>
> drivers/ide/pmac.c:228:23: warning: symbol 'mdma_timings_33' was not
> declared. Should it be static?
> drivers/ide/pmac.c:241:23: warning: symbol 'mdma_timings_33k' was not
> declared. Should it be static?
> drivers/ide/pmac.c:254:23: warning: symbol 'mdma_timings_66' was not
> declared. Should it be static?
> drivers/ide/pmac.c:272:3: warning: symbol 'kl66_udma_timings' was not
> declared. Should it be static?
> drivers/ide/pmac.c:1418:12: warning: symbol 'pmac_ide_probe' was not
> declared. Should it be static?
>
> Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>
> ---
>  drivers/ide/pmac.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

TIL davem maintains IDE?

But I suspect he isn't that interested in this powerpc only driver, so
I'll grab this.

cheers


> diff --git a/drivers/ide/pmac.c b/drivers/ide/pmac.c
> index ea0b064b5f56..6bb2fc6755c2 100644
> --- a/drivers/ide/pmac.c
> +++ b/drivers/ide/pmac.c
> @@ -225,7 +225,7 @@ struct mdma_timings_t {
>  	int	cycleTime;
>  };
>  
> -struct mdma_timings_t mdma_timings_33[] =
> +static struct mdma_timings_t mdma_timings_33[] =
>  {
>      { 240, 240, 480 },
>      { 180, 180, 360 },
> @@ -238,7 +238,7 @@ struct mdma_timings_t mdma_timings_33[] =
>      {   0,   0,   0 }
>  };
>  
> -struct mdma_timings_t mdma_timings_33k[] =
> +static struct mdma_timings_t mdma_timings_33k[] =
>  {
>      { 240, 240, 480 },
>      { 180, 180, 360 },
> @@ -251,7 +251,7 @@ struct mdma_timings_t mdma_timings_33k[] =
>      {   0,   0,   0 }
>  };
>  
> -struct mdma_timings_t mdma_timings_66[] =
> +static struct mdma_timings_t mdma_timings_66[] =
>  {
>      { 240, 240, 480 },
>      { 180, 180, 360 },
> @@ -265,7 +265,7 @@ struct mdma_timings_t mdma_timings_66[] =
>  };
>  
>  /* KeyLargo ATA-4 Ultra DMA timings (rounded) */
> -struct {
> +static struct {
>  	int	addrSetup; /* ??? */
>  	int	rdy2pause;
>  	int	wrDataSetup;
> @@ -1415,7 +1415,7 @@ static struct pci_driver pmac_ide_pci_driver = {
>  };
>  MODULE_DEVICE_TABLE(pci, pmac_ide_pci_match);
>  
> -int __init pmac_ide_probe(void)
> +static int __init pmac_ide_probe(void)
>  {
>  	int error;
>  
> -- 
> 2.25.0
