Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 549B14CA477
	for <lists+linux-ide@lfdr.de>; Wed,  2 Mar 2022 13:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240432AbiCBMLz (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 2 Mar 2022 07:11:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238422AbiCBMLz (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 2 Mar 2022 07:11:55 -0500
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DBA56E55C
        for <linux-ide@vger.kernel.org>; Wed,  2 Mar 2022 04:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1646223070; x=1677759070;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vAuQx7BREl0FilyuvYvK+6a4J3lvwM0xT1xhYotLxzk=;
  b=Lq+u/3a33ntt/5sXbFC8kQk4/LrqmaHthaLT/02KyVCLnUBoXozhIELk
   ozVZ57vGxGZJR1l5bSLWGphkdiGaFImqhgal6LNmkEfZJabHTPqDAupyp
   TyDuHjueDqM0jpcGRCgWhHw7niIAhzViUQjBpAAVtJC5UVRT3rqvn1tTN
   cFtqTiLGiQTkeUQQUMKwniTkAbzOj3/jNjPr4Rn7D3Dp2w1K1QLc4r/aU
   0IWiA/tBQYUx4MQPTxWBk7OAM5eZmpGra0MzPwXu5uQvTBnlJpBB89FJU
   HYwgUvbbRVRLTKn2IH23ykvrxdvAh2RmQYdk/kmlFCb9icYQEOEMlKklk
   A==;
X-IronPort-AV: E=Sophos;i="5.90,148,1643644800"; 
   d="scan'208";a="193214764"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 02 Mar 2022 20:11:09 +0800
IronPort-SDR: iEjauQ6xq9eQ66CMH9ziyEgxESi3FtbKn0diVXadTUlTPgvNNEQPQ0Hum7HXW4s3pfrXDinafr
 fXyNxDaDyc86U56o9sOYgCrz1erLq4Z6VCQqbeKmUZQINS4xf4wr5g3V2Yk+pxsBE/UKo9gshl
 FRA9NW4U3ig2P7oUkQZYlw/rwlC4JyiVXbNCVJe2zC9xevMpcmXZ4jXDHtGtRYl5w1SAZCFSOi
 pBcBFdFRR91q4b8t1tTiaLl/IXXcQoRJoKtSlMtEmLMKbafPbz2U86PFBProI4tLUXAb/PcONv
 k0AbDSrgFinhpxxRRFHPXkgm
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2022 03:43:35 -0800
IronPort-SDR: He96CoXGOiIA2dvsjMPf6SsVNtoLGd7LSuLa/4K0J/tShensTOpHrLTvIC7xHXYEMmVW3xcsxp
 HNL532PmGnG8e0Gp4HJg233Kcr3sRQABR/sqAbanI4jCrqfxjgjth9Ggm6KP6A6j44ZxeNdYTi
 8Ow0d9sz0LBm6VB7jfvQMsRD/mYEqAQkqsREVIp9G/hboCbapHmiv6zbZyCr1PV4kk8tfDLobD
 BkbZ36H7jYhYQD6zihYsbzJ3SoGEZY45YpIwd2fK2UvJf0Xp4t7VDy73674bcfPJr4D3EHaGIb
 YlI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2022 04:11:09 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K7tHx38qwz1SVnx
        for <linux-ide@vger.kernel.org>; Wed,  2 Mar 2022 04:11:09 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1646223067; x=1648815068; bh=vAuQx7BREl0FilyuvYvK+6a4J3lvwM0xT1x
        hYotLxzk=; b=FchrGdkQOaP7mTK0hZVsmex/bDLSpoPLbWFLyr7bRefKieoKu+t
        MQISVQPbrcoMS6oPtPoDjVRtq0qdtgCm4DZ6ZlRS92zXR/MlK/AUgy+hQfLqwK2f
        S/LCzoir7qZAcRSepEfMfPJ8tkxV+/uE1zg9T/I7YkATNKPal5jzqcrX3fmjjOJr
        Y2VCIOzxgQBdIncuxgFv7HCuus1wejDSZSLcHsSmRwCKtNpWVAm59jA2q06mBAk6
        z/59gi//O+Phl7L+RopPq8ZCSWPf0d+GbN90dX2aQfaDlCTJdRA6XcQEokcgovJT
        YrcdQJukmmpYNhoJEj2VNyScWnxPmcXwmrg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id GBEzj32QPtCW for <linux-ide@vger.kernel.org>;
        Wed,  2 Mar 2022 04:11:07 -0800 (PST)
Received: from [10.112.1.94] (c02drav6md6t.wdc.com [10.112.1.94])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K7tHq4cw8z1Rvlx;
        Wed,  2 Mar 2022 04:11:03 -0800 (PST)
Message-ID: <2918bfa8-ca14-1395-b8a0-428e250c5a00@opensource.wdc.com>
Date:   Wed, 2 Mar 2022 14:11:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] ata: Drop commas after OF match table sentinels
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <15d4b8e1108c902c4e80c87edfc702a7786de4ba.1646209667.git.geert+renesas@glider.be>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <15d4b8e1108c902c4e80c87edfc702a7786de4ba.1646209667.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 2022/03/02 10:30, Geert Uytterhoeven wrote:
> It does not make sense to have a comma after a sentinel, as any new
> elements must be added before the sentinel.
> 
> Add comments to clarify the purpose of the empty elements.

Some nits below.

> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/ata/ahci_brcm.c        | 2 +-
>  drivers/ata/ahci_ceva.c        | 2 +-
>  drivers/ata/ahci_da850.c       | 2 +-
>  drivers/ata/ahci_dm816.c       | 2 +-
>  drivers/ata/ahci_imx.c         | 2 +-
>  drivers/ata/ahci_mtk.c         | 2 +-
>  drivers/ata/ahci_mvebu.c       | 2 +-
>  drivers/ata/ahci_octeon.c      | 2 +-
>  drivers/ata/ahci_platform.c    | 2 +-
>  drivers/ata/ahci_qoriq.c       | 2 +-
>  drivers/ata/ahci_st.c          | 2 +-
>  drivers/ata/ahci_sunxi.c       | 2 +-
>  drivers/ata/ahci_xgene.c       | 2 +-
>  drivers/ata/pata_ftide010.c    | 2 +-
>  drivers/ata/pata_ixp4xx_cf.c   | 2 +-
>  drivers/ata/pata_macio.c       | 2 +-
>  drivers/ata/pata_mpc52xx.c     | 2 +-
>  drivers/ata/pata_octeon_cf.c   | 2 +-
>  drivers/ata/pata_of_platform.c | 2 +-
>  drivers/ata/sata_fsl.c         | 2 +-
>  drivers/ata/sata_gemini.c      | 2 +-
>  drivers/ata/sata_highbank.c    | 2 +-
>  drivers/ata/sata_mv.c          | 2 +-
>  drivers/ata/sata_rcar.c        | 2 +-
>  24 files changed, 24 insertions(+), 24 deletions(-)

[...]

> diff --git a/drivers/ata/pata_ftide010.c b/drivers/ata/pata_ftide010.c
> index 34cb104f6b43e5cf..2a92797b5e11a9aa 100644
> --- a/drivers/ata/pata_ftide010.c
> +++ b/drivers/ata/pata_ftide010.c
> @@ -557,7 +557,7 @@ static const struct of_device_id pata_ftide010_of_match[] = {
>  	{
>  		.compatible = "faraday,ftide010",
>  	},

While at it, could you rewrap this one to a single line to have a consistent style ?

> -	{},
> +	{ /* sentinel */ }
>  };
>  
>  static struct platform_driver pata_ftide010_driver = {
> diff --git a/drivers/ata/pata_ixp4xx_cf.c b/drivers/ata/pata_ixp4xx_cf.c
> index 17b557c91e1c78fc..e225913a619d8414 100644
> --- a/drivers/ata/pata_ixp4xx_cf.c
> +++ b/drivers/ata/pata_ixp4xx_cf.c
> @@ -293,7 +293,7 @@ static int ixp4xx_pata_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id ixp4xx_pata_of_match[] = {
>  	{ .compatible = "intel,ixp4xx-compact-flash", },
> -	{ },
> +	{ /* sentinel */ }
>  };
>  
>  static struct platform_driver ixp4xx_pata_platform_driver = {
> diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
> index 16e8aa184a75793f..8cf778723fd6d049 100644
> --- a/drivers/ata/pata_macio.c
> +++ b/drivers/ata/pata_macio.c
> @@ -1345,7 +1345,7 @@ static const struct of_device_id pata_macio_match[] =
>  	{
>  	.type		= "ata",
>  	},

Here too.

> -	{},
> +	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, pata_macio_match);
>  
> diff --git a/drivers/ata/pata_mpc52xx.c b/drivers/ata/pata_mpc52xx.c
> index f1d352d5f128537a..bc9d9df3b5aced64 100644
> --- a/drivers/ata/pata_mpc52xx.c
> +++ b/drivers/ata/pata_mpc52xx.c
> @@ -849,7 +849,7 @@ mpc52xx_ata_resume(struct platform_device *op)
>  static const struct of_device_id mpc52xx_ata_of_match[] = {
>  	{ .compatible = "fsl,mpc5200-ata", },
>  	{ .compatible = "mpc5200-ata", },
> -	{},
> +	{ /* sentinel */ }
>  };
>  
>  
> diff --git a/drivers/ata/pata_octeon_cf.c b/drivers/ata/pata_octeon_cf.c
> index 05c2ab3757568c62..bdaec863171a14cf 100644
> --- a/drivers/ata/pata_octeon_cf.c
> +++ b/drivers/ata/pata_octeon_cf.c
> @@ -1009,7 +1009,7 @@ static const struct of_device_id octeon_cf_match[] = {
>  	{
>  		.compatible = "cavium,ebt3000-compact-flash",
>  	},

And here as well.

> -	{},
> +	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, octeon_cf_match);
>  
> diff --git a/drivers/ata/pata_of_platform.c b/drivers/ata/pata_of_platform.c
> index c3a40b717dcdcc2a..ac5a633c00a57ac1 100644
> --- a/drivers/ata/pata_of_platform.c
> +++ b/drivers/ata/pata_of_platform.c
> @@ -79,7 +79,7 @@ static int pata_of_platform_probe(struct platform_device *ofdev)
>  
>  static const struct of_device_id pata_of_platform_match[] = {
>  	{ .compatible = "ata-generic", },
> -	{ },
> +	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, pata_of_platform_match);
>  
> diff --git a/drivers/ata/sata_fsl.c b/drivers/ata/sata_fsl.c
> index 556034a15430461f..11867a7eb4691771 100644
> --- a/drivers/ata/sata_fsl.c
> +++ b/drivers/ata/sata_fsl.c
> @@ -1583,7 +1583,7 @@ static const struct of_device_id fsl_sata_match[] = {
>  	{
>  		.compatible = "fsl,pq-sata-v2",
>  	},

Same.

> -	{},
> +	{ /* sentinel */ }
>  };
>  
>  MODULE_DEVICE_TABLE(of, fsl_sata_match);
> diff --git a/drivers/ata/sata_gemini.c b/drivers/ata/sata_gemini.c
> index 440a63de20d01a07..c7e9efc0025f1a91 100644
> --- a/drivers/ata/sata_gemini.c
> +++ b/drivers/ata/sata_gemini.c
> @@ -422,7 +422,7 @@ static const struct of_device_id gemini_sata_of_match[] = {
>  	{
>  		.compatible = "cortina,gemini-sata-bridge",
>  	},

Another...

> -	{},
> +	{ /* sentinel */ }
>  };
>  
>  static struct platform_driver gemini_sata_driver = {
> diff --git a/drivers/ata/sata_highbank.c b/drivers/ata/sata_highbank.c
> index b29d3f1d64b03317..cd375e4df9644e33 100644
> --- a/drivers/ata/sata_highbank.c
> +++ b/drivers/ata/sata_highbank.c
> @@ -444,7 +444,7 @@ static struct scsi_host_template ahci_highbank_platform_sht = {
>  
>  static const struct of_device_id ahci_of_match[] = {
>  	{ .compatible = "calxeda,hb-ahci" },
> -	{},
> +	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ahci_of_match);
>  
> diff --git a/drivers/ata/sata_mv.c b/drivers/ata/sata_mv.c
> index 53446b997740d5fd..13d92b71e6659cda 100644
> --- a/drivers/ata/sata_mv.c
> +++ b/drivers/ata/sata_mv.c
> @@ -4277,7 +4277,7 @@ static int mv_platform_resume(struct platform_device *pdev)
>  static const struct of_device_id mv_sata_dt_ids[] = {
>  	{ .compatible = "marvell,armada-370-sata", },
>  	{ .compatible = "marvell,orion-sata", },
> -	{},
> +	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mv_sata_dt_ids);
>  #endif
> diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
> index 3d96b6faa3f0e1c6..1483d3efeb7e220e 100644
> --- a/drivers/ata/sata_rcar.c
> +++ b/drivers/ata/sata_rcar.c
> @@ -857,7 +857,7 @@ static const struct of_device_id sata_rcar_match[] = {
>  		.compatible = "renesas,rcar-gen3-sata",
>  		.data = (void *)RCAR_GEN3_SATA
>  	},
> -	{ },
> +	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sata_rcar_match);
>  


-- 
Damien Le Moal
Western Digital Research
