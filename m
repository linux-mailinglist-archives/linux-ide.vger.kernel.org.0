Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 667646208A4
	for <lists+linux-ide@lfdr.de>; Tue,  8 Nov 2022 06:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbiKHFAK (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 8 Nov 2022 00:00:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233300AbiKHE7q (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 7 Nov 2022 23:59:46 -0500
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 337353207A
        for <linux-ide@vger.kernel.org>; Mon,  7 Nov 2022 20:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1667883532; x=1699419532;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=46ovSLoSoayx3G43K4UsLTVhaD9jYAuDPcb9XUrUYbU=;
  b=p0Y5J1haLEszztFfGHgUGzTQCWEPkO4NW5TzN579jJmm3fJrv/hmSP9k
   6SKOExW0xEHqF3EeEhBxt1sf8XLwyXWE62ibN48lLaJVijJJXLoT6lto8
   yQ4LQV4Ux5Zo7pb/xVGwObW6q+Uos8cjWhj05i5FPjB5OyIQtqUXM1rfB
   6msfXXiiSk02co7NN/dI+2MqT3NInYBPIOAP9OiO9xcWWRMbO1TJ64TnQ
   wkdCHg61eEQG2ngBtV6pEL5S6DnCt2SvNWqLB/AdkY4bQTWTNodzc9MlI
   vyB2UH2opFu9lHBKIVzpPMHR2ei+/uRZyQD3xhITgo04Kv4Lvux8w3r2m
   A==;
X-IronPort-AV: E=Sophos;i="5.96,145,1665417600"; 
   d="scan'208";a="320064102"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2022 12:58:49 +0800
IronPort-SDR: vQ5gXbbUREUotJleOQTGGchiqLqAtCYVZfiLBnBOz+AIHWNJ+o81lA+Y3Rn0tLh5fZkOc/nzs8
 HcgazIQe5ocrT6ClpMssGlP4jZ+WgGem50P1wgGVOwypnpB0oXWkq0POo17iMGh3dbsXrhGxOz
 KNS86qoPdKASefyZI7tDfTTFO2I19FdqRiF6OQkbYve185O5spEcExGcBuuk3hUaAPmgkmyXfu
 E3rAcMDTlrSydHT3BY6LFhfUz/E9tPV8599+EHzDRBT0U+fR2XdUyJi8ykMbUU5lYJ8hAs0ULb
 xmc=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Nov 2022 20:17:56 -0800
IronPort-SDR: B82SJdPuCbKZL4PWbXyLAEIET1MwlSdJZBpWQGaFqLCJvTvGTSkNdVOB4FmgSkmIMl/YBuK8Mr
 azFvX8WFUZxL/Ef3HiP5YHKaoD7rh16pGiMwQZc/m4amuV0HMWYDDF1cv6z+yYys/4m+BVn5/t
 n8IIsBYRXSlHlSY6Z0qNZNzcqiLontpPzJGhp//hAeb0VZI4EC751sl4URNRlp8nXVE+x8j0pm
 OgUZ5EFpUqiXr8hYBHN7fFnM12CgzjfOIVhHN96Nsrgb1tjqT31rTQB06qaiVtbMCOoLoSdR3O
 V+8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Nov 2022 20:58:50 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4N5wqF3nRnz1RvTr
        for <linux-ide@vger.kernel.org>; Mon,  7 Nov 2022 20:58:49 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1667883528; x=1670475529; bh=46ovSLoSoayx3G43K4UsLTVhaD9jYAuDPcb
        9XUrUYbU=; b=ZrzaftJmL3sO7U7+iCl+0YhaUTM2YAXTODriLgV8GWzVPC1vDw1
        X+QW6U2pe7C/h/F52a26VC5sz9V2Ud4TPDHecVbSTccPfdrMU3lS5MxDaAOWEpYw
        ksPq9zlnzTFxq9CXIkgH2Zc4WYeIeMitztORwUeXLm4b8q2z51kV/DTLRndVclyV
        YcJ3D1gN313geU68zNV6qpB1ZwhsRuQUqurWecuwKnxJFfvp2k6QlYAoXce5e8rI
        AlxiU8xV0BAdc1Vrl4JSQMJBZkf8qfFEIMss7dM1GiojUbU89VriJcmBhPY84vqY
        9MeuaY3Az0QUbpLEILtKRQnEV1FKGpKQQAw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id qWJ9NnB34uee for <linux-ide@vger.kernel.org>;
        Mon,  7 Nov 2022 20:58:48 -0800 (PST)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4N5wqC3QZbz1RvLy;
        Mon,  7 Nov 2022 20:58:47 -0800 (PST)
Message-ID: <2df619de-2931-390c-08c6-f4d9c0f75bc5@opensource.wdc.com>
Date:   Tue, 8 Nov 2022 13:58:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/2] ata: ahci (gcc13): use BIT() for bit definitions in
 enum
Content-Language: en-US
To:     "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Martin Liska <mliska@suse.cz>,
        linux-ide@vger.kernel.org
References: <20221031114310.10337-1-jirislaby@kernel.org>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20221031114310.10337-1-jirislaby@kernel.org>
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

On 10/31/22 20:43, Jiri Slaby (SUSE) wrote:
> gcc13 now uses the type of the enum for all its members [1]. Given the
> ata enum defines its members using both unsigned and signed ints, the
> type of the enum is promoted to long.
> 
> Make sure most the members are unsigned ints using the BIT() macro. The
> rest will be converted separately in the next patch.
> 
> The error in question is for example this:
> drivers/block/mtip32xx/mtip32xx.c:722:25: error: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'long in'

This is not an ATA driver. Any example of a compile warning/error for
libata and ata drivers ?

> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=36113
> 
> Cc: Martin Liska <mliska@suse.cz>
> Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Cc: linux-ide@vger.kernel.org
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> ---
>  drivers/ata/ahci.h | 220 ++++++++++++++++++++++-----------------------
>  1 file changed, 110 insertions(+), 110 deletions(-)
> 
> diff --git a/drivers/ata/ahci.h b/drivers/ata/ahci.h
> index 7add8e79912b..94b5c81f08dd 100644
> --- a/drivers/ata/ahci.h
> +++ b/drivers/ata/ahci.h
> @@ -53,12 +53,12 @@ enum {
>  	AHCI_PORT_PRIV_FBS_DMA_SZ	= AHCI_CMD_SLOT_SZ +
>  					  AHCI_CMD_TBL_AR_SZ +
>  					  (AHCI_RX_FIS_SZ * 16),
> -	AHCI_IRQ_ON_SG		= (1 << 31),
> -	AHCI_CMD_ATAPI		= (1 << 5),
> -	AHCI_CMD_WRITE		= (1 << 6),
> -	AHCI_CMD_PREFETCH	= (1 << 7),
> -	AHCI_CMD_RESET		= (1 << 8),
> -	AHCI_CMD_CLR_BUSY	= (1 << 10),
> +	AHCI_IRQ_ON_SG		= BIT(31),
> +	AHCI_CMD_ATAPI		= BIT(5),
> +	AHCI_CMD_WRITE		= BIT(6),
> +	AHCI_CMD_PREFETCH	= BIT(7),
> +	AHCI_CMD_RESET		= BIT(8),
> +	AHCI_CMD_CLR_BUSY	= BIT(10),
>  
>  	RX_FIS_PIO_SETUP	= 0x20,	/* offset of PIO Setup FIS data */
>  	RX_FIS_D2H_REG		= 0x40,	/* offset of D2H Register FIS data */
> @@ -76,37 +76,37 @@ enum {
>  	HOST_CAP2		= 0x24, /* host capabilities, extended */
>  
>  	/* HOST_CTL bits */
> -	HOST_RESET		= (1 << 0),  /* reset controller; self-clear */
> -	HOST_IRQ_EN		= (1 << 1),  /* global IRQ enable */
> -	HOST_MRSM		= (1 << 2),  /* MSI Revert to Single Message */
> -	HOST_AHCI_EN		= (1 << 31), /* AHCI enabled */
> +	HOST_RESET		= BIT(0),  /* reset controller; self-clear */
> +	HOST_IRQ_EN		= BIT(1),  /* global IRQ enable */
> +	HOST_MRSM		= BIT(2),  /* MSI Revert to Single Message */
> +	HOST_AHCI_EN		= BIT(31), /* AHCI enabled */
>  
>  	/* HOST_CAP bits */
> -	HOST_CAP_SXS		= (1 << 5),  /* Supports External SATA */
> -	HOST_CAP_EMS		= (1 << 6),  /* Enclosure Management support */
> -	HOST_CAP_CCC		= (1 << 7),  /* Command Completion Coalescing */
> -	HOST_CAP_PART		= (1 << 13), /* Partial state capable */
> -	HOST_CAP_SSC		= (1 << 14), /* Slumber state capable */
> -	HOST_CAP_PIO_MULTI	= (1 << 15), /* PIO multiple DRQ support */
> -	HOST_CAP_FBS		= (1 << 16), /* FIS-based switching support */
> -	HOST_CAP_PMP		= (1 << 17), /* Port Multiplier support */
> -	HOST_CAP_ONLY		= (1 << 18), /* Supports AHCI mode only */
> -	HOST_CAP_CLO		= (1 << 24), /* Command List Override support */
> -	HOST_CAP_LED		= (1 << 25), /* Supports activity LED */
> -	HOST_CAP_ALPM		= (1 << 26), /* Aggressive Link PM support */
> -	HOST_CAP_SSS		= (1 << 27), /* Staggered Spin-up */
> -	HOST_CAP_MPS		= (1 << 28), /* Mechanical presence switch */
> -	HOST_CAP_SNTF		= (1 << 29), /* SNotification register */
> -	HOST_CAP_NCQ		= (1 << 30), /* Native Command Queueing */
> -	HOST_CAP_64		= (1 << 31), /* PCI DAC (64-bit DMA) support */
> +	HOST_CAP_SXS		= BIT(5),  /* Supports External SATA */
> +	HOST_CAP_EMS		= BIT(6),  /* Enclosure Management support */
> +	HOST_CAP_CCC		= BIT(7),  /* Command Completion Coalescing */
> +	HOST_CAP_PART		= BIT(13), /* Partial state capable */
> +	HOST_CAP_SSC		= BIT(14), /* Slumber state capable */
> +	HOST_CAP_PIO_MULTI	= BIT(15), /* PIO multiple DRQ support */
> +	HOST_CAP_FBS		= BIT(16), /* FIS-based switching support */
> +	HOST_CAP_PMP		= BIT(17), /* Port Multiplier support */
> +	HOST_CAP_ONLY		= BIT(18), /* Supports AHCI mode only */
> +	HOST_CAP_CLO		= BIT(24), /* Command List Override support */
> +	HOST_CAP_LED		= BIT(25), /* Supports activity LED */
> +	HOST_CAP_ALPM		= BIT(26), /* Aggressive Link PM support */
> +	HOST_CAP_SSS		= BIT(27), /* Staggered Spin-up */
> +	HOST_CAP_MPS		= BIT(28), /* Mechanical presence switch */
> +	HOST_CAP_SNTF		= BIT(29), /* SNotification register */
> +	HOST_CAP_NCQ		= BIT(30), /* Native Command Queueing */
> +	HOST_CAP_64		= BIT(31), /* PCI DAC (64-bit DMA) support */
>  
>  	/* HOST_CAP2 bits */
> -	HOST_CAP2_BOH		= (1 << 0),  /* BIOS/OS handoff supported */
> -	HOST_CAP2_NVMHCI	= (1 << 1),  /* NVMHCI supported */
> -	HOST_CAP2_APST		= (1 << 2),  /* Automatic partial to slumber */
> -	HOST_CAP2_SDS		= (1 << 3),  /* Support device sleep */
> -	HOST_CAP2_SADM		= (1 << 4),  /* Support aggressive DevSlp */
> -	HOST_CAP2_DESO		= (1 << 5),  /* DevSlp from slumber only */
> +	HOST_CAP2_BOH		= BIT(0),  /* BIOS/OS handoff supported */
> +	HOST_CAP2_NVMHCI	= BIT(1),  /* NVMHCI supported */
> +	HOST_CAP2_APST		= BIT(2),  /* Automatic partial to slumber */
> +	HOST_CAP2_SDS		= BIT(3),  /* Support device sleep */
> +	HOST_CAP2_SADM		= BIT(4),  /* Support aggressive DevSlp */
> +	HOST_CAP2_DESO		= BIT(5),  /* DevSlp from slumber only */
>  
>  	/* registers for each SATA port */
>  	PORT_LST_ADDR		= 0x00, /* command list DMA addr */
> @@ -128,24 +128,24 @@ enum {
>  	PORT_DEVSLP		= 0x44, /* device sleep */
>  
>  	/* PORT_IRQ_{STAT,MASK} bits */
> -	PORT_IRQ_COLD_PRES	= (1 << 31), /* cold presence detect */
> -	PORT_IRQ_TF_ERR		= (1 << 30), /* task file error */
> -	PORT_IRQ_HBUS_ERR	= (1 << 29), /* host bus fatal error */
> -	PORT_IRQ_HBUS_DATA_ERR	= (1 << 28), /* host bus data error */
> -	PORT_IRQ_IF_ERR		= (1 << 27), /* interface fatal error */
> -	PORT_IRQ_IF_NONFATAL	= (1 << 26), /* interface non-fatal error */
> -	PORT_IRQ_OVERFLOW	= (1 << 24), /* xfer exhausted available S/G */
> -	PORT_IRQ_BAD_PMP	= (1 << 23), /* incorrect port multiplier */
> -
> -	PORT_IRQ_PHYRDY		= (1 << 22), /* PhyRdy changed */
> -	PORT_IRQ_DMPS		= (1 << 7), /* mechanical presence status */
> -	PORT_IRQ_CONNECT	= (1 << 6), /* port connect change status */
> -	PORT_IRQ_SG_DONE	= (1 << 5), /* descriptor processed */
> -	PORT_IRQ_UNK_FIS	= (1 << 4), /* unknown FIS rx'd */
> -	PORT_IRQ_SDB_FIS	= (1 << 3), /* Set Device Bits FIS rx'd */
> -	PORT_IRQ_DMAS_FIS	= (1 << 2), /* DMA Setup FIS rx'd */
> -	PORT_IRQ_PIOS_FIS	= (1 << 1), /* PIO Setup FIS rx'd */
> -	PORT_IRQ_D2H_REG_FIS	= (1 << 0), /* D2H Register FIS rx'd */
> +	PORT_IRQ_COLD_PRES	= BIT(31), /* cold presence detect */
> +	PORT_IRQ_TF_ERR		= BIT(30), /* task file error */
> +	PORT_IRQ_HBUS_ERR	= BIT(29), /* host bus fatal error */
> +	PORT_IRQ_HBUS_DATA_ERR	= BIT(28), /* host bus data error */
> +	PORT_IRQ_IF_ERR		= BIT(27), /* interface fatal error */
> +	PORT_IRQ_IF_NONFATAL	= BIT(26), /* interface non-fatal error */
> +	PORT_IRQ_OVERFLOW	= BIT(24), /* xfer exhausted available S/G */
> +	PORT_IRQ_BAD_PMP	= BIT(23), /* incorrect port multiplier */
> +
> +	PORT_IRQ_PHYRDY		= BIT(22), /* PhyRdy changed */
> +	PORT_IRQ_DMPS		= BIT(7), /* mechanical presence status */
> +	PORT_IRQ_CONNECT	= BIT(6), /* port connect change status */
> +	PORT_IRQ_SG_DONE	= BIT(5), /* descriptor processed */
> +	PORT_IRQ_UNK_FIS	= BIT(4), /* unknown FIS rx'd */
> +	PORT_IRQ_SDB_FIS	= BIT(3), /* Set Device Bits FIS rx'd */
> +	PORT_IRQ_DMAS_FIS	= BIT(2), /* DMA Setup FIS rx'd */
> +	PORT_IRQ_PIOS_FIS	= BIT(1), /* PIO Setup FIS rx'd */
> +	PORT_IRQ_D2H_REG_FIS	= BIT(0), /* D2H Register FIS rx'd */
>  
>  	PORT_IRQ_FREEZE		= PORT_IRQ_HBUS_ERR |
>  				  PORT_IRQ_IF_ERR |
> @@ -161,22 +161,22 @@ enum {
>  				  PORT_IRQ_PIOS_FIS | PORT_IRQ_D2H_REG_FIS,
>  
>  	/* PORT_CMD bits */
> -	PORT_CMD_ASP		= (1 << 27), /* Aggressive Slumber/Partial */
> -	PORT_CMD_ALPE		= (1 << 26), /* Aggressive Link PM enable */
> -	PORT_CMD_ATAPI		= (1 << 24), /* Device is ATAPI */
> -	PORT_CMD_FBSCP		= (1 << 22), /* FBS Capable Port */
> -	PORT_CMD_ESP		= (1 << 21), /* External Sata Port */
> -	PORT_CMD_CPD		= (1 << 20), /* Cold Presence Detection */
> -	PORT_CMD_MPSP		= (1 << 19), /* Mechanical Presence Switch */
> -	PORT_CMD_HPCP		= (1 << 18), /* HotPlug Capable Port */
> -	PORT_CMD_PMP		= (1 << 17), /* PMP attached */
> -	PORT_CMD_LIST_ON	= (1 << 15), /* cmd list DMA engine running */
> -	PORT_CMD_FIS_ON		= (1 << 14), /* FIS DMA engine running */
> -	PORT_CMD_FIS_RX		= (1 << 4), /* Enable FIS receive DMA engine */
> -	PORT_CMD_CLO		= (1 << 3), /* Command list override */
> -	PORT_CMD_POWER_ON	= (1 << 2), /* Power up device */
> -	PORT_CMD_SPIN_UP	= (1 << 1), /* Spin up device */
> -	PORT_CMD_START		= (1 << 0), /* Enable port DMA engine */
> +	PORT_CMD_ASP		= BIT(27), /* Aggressive Slumber/Partial */
> +	PORT_CMD_ALPE		= BIT(26), /* Aggressive Link PM enable */
> +	PORT_CMD_ATAPI		= BIT(24), /* Device is ATAPI */
> +	PORT_CMD_FBSCP		= BIT(22), /* FBS Capable Port */
> +	PORT_CMD_ESP		= BIT(21), /* External Sata Port */
> +	PORT_CMD_CPD		= BIT(20), /* Cold Presence Detection */
> +	PORT_CMD_MPSP		= BIT(19), /* Mechanical Presence Switch */
> +	PORT_CMD_HPCP		= BIT(18), /* HotPlug Capable Port */
> +	PORT_CMD_PMP		= BIT(17), /* PMP attached */
> +	PORT_CMD_LIST_ON	= BIT(15), /* cmd list DMA engine running */
> +	PORT_CMD_FIS_ON		= BIT(14), /* FIS DMA engine running */
> +	PORT_CMD_FIS_RX		= BIT(4), /* Enable FIS receive DMA engine */
> +	PORT_CMD_CLO		= BIT(3), /* Command list override */
> +	PORT_CMD_POWER_ON	= BIT(2), /* Power up device */
> +	PORT_CMD_SPIN_UP	= BIT(1), /* Spin up device */
> +	PORT_CMD_START		= BIT(0), /* Enable port DMA engine */
>  
>  	PORT_CMD_ICC_MASK	= (0xf << 28), /* i/f ICC state mask */
>  	PORT_CMD_ICC_ACTIVE	= (0x1 << 28), /* Put i/f in active state */
> @@ -192,9 +192,9 @@ enum {
>  	PORT_FBS_ADO_OFFSET	= 12, /* FBS active dev optimization offset */
>  	PORT_FBS_DEV_OFFSET	= 8,  /* FBS device to issue offset */
>  	PORT_FBS_DEV_MASK	= (0xf << PORT_FBS_DEV_OFFSET),  /* FBS.DEV */
> -	PORT_FBS_SDE		= (1 << 2), /* FBS single device error */
> -	PORT_FBS_DEC		= (1 << 1), /* FBS device error clear */
> -	PORT_FBS_EN		= (1 << 0), /* Enable FBS */
> +	PORT_FBS_SDE		= BIT(2), /* FBS single device error */
> +	PORT_FBS_DEC		= BIT(1), /* FBS device error clear */
> +	PORT_FBS_EN		= BIT(0), /* Enable FBS */
>  
>  	/* PORT_DEVSLP bits */
>  	PORT_DEVSLP_DM_OFFSET	= 25,             /* DITO multiplier offset */
> @@ -202,50 +202,50 @@ enum {
>  	PORT_DEVSLP_DITO_OFFSET	= 15,             /* DITO offset */
>  	PORT_DEVSLP_MDAT_OFFSET	= 10,             /* Minimum assertion time */
>  	PORT_DEVSLP_DETO_OFFSET	= 2,              /* DevSlp exit timeout */
> -	PORT_DEVSLP_DSP		= (1 << 1),       /* DevSlp present */
> -	PORT_DEVSLP_ADSE	= (1 << 0),       /* Aggressive DevSlp enable */
> +	PORT_DEVSLP_DSP		= BIT(1),       /* DevSlp present */
> +	PORT_DEVSLP_ADSE	= BIT(0),       /* Aggressive DevSlp enable */
>  
>  	/* hpriv->flags bits */
>  
>  #define AHCI_HFLAGS(flags)		.private_data	= (void *)(flags)
>  
> -	AHCI_HFLAG_NO_NCQ		= (1 << 0),
> -	AHCI_HFLAG_IGN_IRQ_IF_ERR	= (1 << 1), /* ignore IRQ_IF_ERR */
> -	AHCI_HFLAG_IGN_SERR_INTERNAL	= (1 << 2), /* ignore SERR_INTERNAL */
> -	AHCI_HFLAG_32BIT_ONLY		= (1 << 3), /* force 32bit */
> -	AHCI_HFLAG_MV_PATA		= (1 << 4), /* PATA port */
> -	AHCI_HFLAG_NO_MSI		= (1 << 5), /* no PCI MSI */
> -	AHCI_HFLAG_NO_PMP		= (1 << 6), /* no PMP */
> -	AHCI_HFLAG_SECT255		= (1 << 8), /* max 255 sectors */
> -	AHCI_HFLAG_YES_NCQ		= (1 << 9), /* force NCQ cap on */
> -	AHCI_HFLAG_NO_SUSPEND		= (1 << 10), /* don't suspend */
> -	AHCI_HFLAG_SRST_TOUT_IS_OFFLINE	= (1 << 11), /* treat SRST timeout as
> +	AHCI_HFLAG_NO_NCQ		= BIT(0),
> +	AHCI_HFLAG_IGN_IRQ_IF_ERR	= BIT(1), /* ignore IRQ_IF_ERR */
> +	AHCI_HFLAG_IGN_SERR_INTERNAL	= BIT(2), /* ignore SERR_INTERNAL */
> +	AHCI_HFLAG_32BIT_ONLY		= BIT(3), /* force 32bit */
> +	AHCI_HFLAG_MV_PATA		= BIT(4), /* PATA port */
> +	AHCI_HFLAG_NO_MSI		= BIT(5), /* no PCI MSI */
> +	AHCI_HFLAG_NO_PMP		= BIT(6), /* no PMP */
> +	AHCI_HFLAG_SECT255		= BIT(8), /* max 255 sectors */
> +	AHCI_HFLAG_YES_NCQ		= BIT(9), /* force NCQ cap on */
> +	AHCI_HFLAG_NO_SUSPEND		= BIT(10), /* don't suspend */
> +	AHCI_HFLAG_SRST_TOUT_IS_OFFLINE	= BIT(11), /* treat SRST timeout as
>  							link offline */
> -	AHCI_HFLAG_NO_SNTF		= (1 << 12), /* no sntf */
> -	AHCI_HFLAG_NO_FPDMA_AA		= (1 << 13), /* no FPDMA AA */
> -	AHCI_HFLAG_YES_FBS		= (1 << 14), /* force FBS cap on */
> -	AHCI_HFLAG_DELAY_ENGINE		= (1 << 15), /* do not start engine on
> +	AHCI_HFLAG_NO_SNTF		= BIT(12), /* no sntf */
> +	AHCI_HFLAG_NO_FPDMA_AA		= BIT(13), /* no FPDMA AA */
> +	AHCI_HFLAG_YES_FBS		= BIT(14), /* force FBS cap on */
> +	AHCI_HFLAG_DELAY_ENGINE		= BIT(15), /* do not start engine on
>  						        port start (wait until
>  						        error-handling stage) */
> -	AHCI_HFLAG_NO_DEVSLP		= (1 << 17), /* no device sleep */
> -	AHCI_HFLAG_NO_FBS		= (1 << 18), /* no FBS */
> +	AHCI_HFLAG_NO_DEVSLP		= BIT(17), /* no device sleep */
> +	AHCI_HFLAG_NO_FBS		= BIT(18), /* no FBS */
>  
>  #ifdef CONFIG_PCI_MSI
> -	AHCI_HFLAG_MULTI_MSI		= (1 << 20), /* per-port MSI(-X) */
> +	AHCI_HFLAG_MULTI_MSI		= BIT(20), /* per-port MSI(-X) */
>  #else
>  	/* compile out MSI infrastructure */
>  	AHCI_HFLAG_MULTI_MSI		= 0,
>  #endif
> -	AHCI_HFLAG_WAKE_BEFORE_STOP	= (1 << 22), /* wake before DMA stop */
> -	AHCI_HFLAG_YES_ALPM		= (1 << 23), /* force ALPM cap on */
> -	AHCI_HFLAG_NO_WRITE_TO_RO	= (1 << 24), /* don't write to read
> +	AHCI_HFLAG_WAKE_BEFORE_STOP	= BIT(22), /* wake before DMA stop */
> +	AHCI_HFLAG_YES_ALPM		= BIT(23), /* force ALPM cap on */
> +	AHCI_HFLAG_NO_WRITE_TO_RO	= BIT(24), /* don't write to read
>  							only registers */
> -	AHCI_HFLAG_USE_LPM_POLICY	= (1 << 25), /* chipset that should use
> +	AHCI_HFLAG_USE_LPM_POLICY	= BIT(25), /* chipset that should use
>  							SATA_MOBILE_LPM_POLICY
>  							as default lpm_policy */
> -	AHCI_HFLAG_SUSPEND_PHYS		= (1 << 26), /* handle PHYs during
> +	AHCI_HFLAG_SUSPEND_PHYS		= BIT(26), /* handle PHYs during
>  							suspend/resume */
> -	AHCI_HFLAG_NO_SXS		= (1 << 28), /* SXS not supported */
> +	AHCI_HFLAG_NO_SXS		= BIT(28), /* SXS not supported */
>  
>  	/* ap->flags bits */
>  
> @@ -261,22 +261,22 @@ enum {
>  	EM_MAX_RETRY			= 5,
>  
>  	/* em_ctl bits */
> -	EM_CTL_RST		= (1 << 9), /* Reset */
> -	EM_CTL_TM		= (1 << 8), /* Transmit Message */
> -	EM_CTL_MR		= (1 << 0), /* Message Received */
> -	EM_CTL_ALHD		= (1 << 26), /* Activity LED */
> -	EM_CTL_XMT		= (1 << 25), /* Transmit Only */
> -	EM_CTL_SMB		= (1 << 24), /* Single Message Buffer */
> -	EM_CTL_SGPIO		= (1 << 19), /* SGPIO messages supported */
> -	EM_CTL_SES		= (1 << 18), /* SES-2 messages supported */
> -	EM_CTL_SAFTE		= (1 << 17), /* SAF-TE messages supported */
> -	EM_CTL_LED		= (1 << 16), /* LED messages supported */
> +	EM_CTL_RST		= BIT(9), /* Reset */
> +	EM_CTL_TM		= BIT(8), /* Transmit Message */
> +	EM_CTL_MR		= BIT(0), /* Message Received */
> +	EM_CTL_ALHD		= BIT(26), /* Activity LED */
> +	EM_CTL_XMT		= BIT(25), /* Transmit Only */
> +	EM_CTL_SMB		= BIT(24), /* Single Message Buffer */
> +	EM_CTL_SGPIO		= BIT(19), /* SGPIO messages supported */
> +	EM_CTL_SES		= BIT(18), /* SES-2 messages supported */
> +	EM_CTL_SAFTE		= BIT(17), /* SAF-TE messages supported */
> +	EM_CTL_LED		= BIT(16), /* LED messages supported */
>  
>  	/* em message type */
> -	EM_MSG_TYPE_LED		= (1 << 0), /* LED */
> -	EM_MSG_TYPE_SAFTE	= (1 << 1), /* SAF-TE */
> -	EM_MSG_TYPE_SES2	= (1 << 2), /* SES-2 */
> -	EM_MSG_TYPE_SGPIO	= (1 << 3), /* SGPIO */
> +	EM_MSG_TYPE_LED		= BIT(0), /* LED */
> +	EM_MSG_TYPE_SAFTE	= BIT(1), /* SAF-TE */
> +	EM_MSG_TYPE_SES2	= BIT(2), /* SES-2 */
> +	EM_MSG_TYPE_SGPIO	= BIT(3), /* SGPIO */
>  };
>  
>  struct ahci_cmd_hdr {

-- 
Damien Le Moal
Western Digital Research

