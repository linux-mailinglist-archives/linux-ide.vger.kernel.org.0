Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E094840DA
	for <lists+linux-ide@lfdr.de>; Tue,  4 Jan 2022 12:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232255AbiADL3t (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 4 Jan 2022 06:29:49 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:51862 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbiADL3t (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 4 Jan 2022 06:29:49 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 15FBF212BC;
        Tue,  4 Jan 2022 11:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1641295788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wJzhjNunFufBOiKszdByLsyEBypBcBM2Np0fHX7pHlY=;
        b=i7GWX6sdbm/TZtU3uJmpojweMb6flkN+v97xu/tvu3qrz3nNS+9dWE7qgxjpLNjEa1585g
        XPQwRWq+GDlruJuO0qox2zKIdT/++c6O/Ei54aAT3uvkiQbEEyza7bXQjK3tZyo8szs8Az
        n7pyoFcmEPL5Y7Yc3/GZFha6gECP3+A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1641295788;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wJzhjNunFufBOiKszdByLsyEBypBcBM2Np0fHX7pHlY=;
        b=awtHizZYc2shuk4H74zQw1IC+4kspPgEbx6m5dsKUnonuR3BqBw6vUkOoJXisxgG+BWyfk
        kXdfO/6ZFThTTHDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01B6413ADF;
        Tue,  4 Jan 2022 11:29:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id E+2HO6sv1GGMOgAAMHmgww
        (envelope-from <hare@suse.de>); Tue, 04 Jan 2022 11:29:47 +0000
Subject: Re: [PATCH v2 05/22] ata: ahci_st: add compile test support
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        linux-ide@vger.kernel.org
References: <20220104105843.1730172-1-damien.lemoal@opensource.wdc.com>
 <20220104105843.1730172-6-damien.lemoal@opensource.wdc.com>
From:   Hannes Reinecke <hare@suse.de>
Message-ID: <6706cfb4-c8cd-02ec-5b18-e3fc360efdc5@suse.de>
Date:   Tue, 4 Jan 2022 12:29:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20220104105843.1730172-6-damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 1/4/22 11:58 AM, Damien Le Moal wrote:
> Add Kconfig dependendy on COMPILE_TEST to allow compile tests with
> configs that do not enable ARCH_STI.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> ---
>  drivers/ata/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
> index e9f919f17d09..83fac101744c 100644
> --- a/drivers/ata/Kconfig
> +++ b/drivers/ata/Kconfig
> @@ -193,7 +193,7 @@ config AHCI_DM816
>  
>  config AHCI_ST
>  	tristate "ST AHCI SATA support"
> -	depends on ARCH_STI
> +	depends on ARCH_STI || COMPILE_TEST
>  	select SATA_HOST
>  	help
>  	  This option enables support for ST AHCI SATA controller.
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		           Kernel Storage Architect
hare@suse.de			                  +49 911 74053 688
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), GF: Felix Imendörffer
