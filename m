Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF10B4E5D0E
	for <lists+linux-ide@lfdr.de>; Thu, 24 Mar 2022 03:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347643AbiCXCHg (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 23 Mar 2022 22:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347638AbiCXCHf (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 23 Mar 2022 22:07:35 -0400
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E95C86342
        for <linux-ide@vger.kernel.org>; Wed, 23 Mar 2022 19:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1648087564; x=1679623564;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MTvnmURHIiuD/0YzjAHRtOKmiYi3mdmVmQbf4j6ogVU=;
  b=nq+aLKT/uUPACfg2wr0soxHV2Vu1M9ZZ/4Zd80I8FO4xKNXfH7V778BB
   On8KpfPiLuJvKSiF+55cgaFBYN80GJtis2Co52eUI9iAroZoduC11ImWz
   84G7JZNjDmAJRQT2LnrhZwj5zRHbC/ZRQVVZDYglNvedp0fGJ6HhXqsB6
   kdMn5NHVSr4p1kdAiHH1JSGzGN2Ei8T3n+kPv/isFq+wh6VaXRtOpS/sl
   k8E5TlceXno/RO/usFK0XiqXkE6txTlBC6IECoJfUY22+9wphqFMk7Bfm
   CMpcZl9U2c956dVmRTQJWpbwDU2ci+le6a5iiHX3q1NVnALit1NuOCAJx
   A==;
X-IronPort-AV: E=Sophos;i="5.90,206,1643644800"; 
   d="scan'208";a="195022377"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 24 Mar 2022 10:06:03 +0800
IronPort-SDR: px9lMrF121BdbfHgwGYqEnkOOKsyk/qXBatclm90uRScCxQQPxfLdztxNQud4ygXXJZM9OCwEa
 Aua4EN5zEl2hYBamFbUy0i3CRdtjdw/+Y5O6XcLoSwe1LRdJwYBn5yLc+guFOx8yVl1IpNoZaX
 X5V0mauh/17kdaErzxI5magEOOjGhXOajlI7HF2y2WrxuiQt0KT8oTOhqhxs1KEjy3EBK0DFsb
 ALCnKaQuC7Cp6mN05lg3/aX/zSQgrZeBCdMTyo9QtcwOhgI8troFP8bAfQZog84JUAMAYy3Cgs
 XMR9pMeBpPKgiP09zLFIbugU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 18:37:56 -0700
IronPort-SDR: Ds8IeS3dlf/uXqtWej+O+8OAcCQvVPL5VQHJxp+nLH8lnEJdeGvUxIYw0v5wPvfHu4QJrXW3sP
 BQNhxUR2wZjCKyV09Ssmp55s7FEcnDJEk8LbKkRPsIp2uDP0epARIwlK7AAk2594U6GGWF/eyd
 zRTYe4d4tIWa+1LiHQhmTEdFQV2BpXLphuKZ99AnvuAvEisPhsv1NeUyqSwEvvSau9H821RbZf
 Mnq2TDRdSzOR6r3QrRajcgQ5qEEJ9iUWB8vBEEhXvLhMGEnDd7QjAmBKuOgi5fVny4/sybFDCl
 XY4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 19:06:03 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KP7qb0nzvz1SVp4
        for <linux-ide@vger.kernel.org>; Wed, 23 Mar 2022 19:06:03 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1648087562; x=1650679563; bh=MTvnmURHIiuD/0YzjAHRtOKmiYi3mdmVmQb
        f4j6ogVU=; b=YhcWr3cTaM/O7XfsYXsQq8Qd9s9Vh8tkAsHLig29oT9jGWkTIgq
        m1W/CW4qaIks1fXNme1BHfX4pPIzLyieWwUm5w4pBg+i09vrUzyR2OWLu3vEqQot
        1TNwyBXlQIePG2gRfjYUnchijJi0Tt96DiZ7OggHEEBv4m0h/OCjnw1EVN3VQ0fc
        QqSm8abgs2H/KbBY9i+nuWK5dKDzS1fLM9N2qkmlAsra9VwP2wVA8kxRP6fEnVeb
        z27hwvyZXA11AwSnOytwZx3k3Kj+Ds45BqVQpDZWXi00Y5kJS1essPoyxtxCh7qc
        +DN9lKWkDI7TO18pfuvSBwBeNx0wbPHrkcQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id XgZORT-kq8UI for <linux-ide@vger.kernel.org>;
        Wed, 23 Mar 2022 19:06:02 -0700 (PDT)
Received: from [10.225.163.114] (unknown [10.225.163.114])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KP7qX1G8Yz1Rvlx;
        Wed, 23 Mar 2022 19:05:59 -0700 (PDT)
Message-ID: <b06a8382-d5c1-e3a5-8577-692fa82cb3c1@opensource.wdc.com>
Date:   Thu, 24 Mar 2022 11:05:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 12/21] ata: libahci: Discard redundant force_port_map
 parameter
Content-Language: en-US
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Hans de Goede <hdegoede@redhat.com>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220324001628.13028-1-Sergey.Semin@baikalelectronics.ru>
 <20220324001628.13028-13-Sergey.Semin@baikalelectronics.ru>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220324001628.13028-13-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 3/24/22 09:16, Serge Semin wrote:
> Currently there are four port-map-related fields declared in the
> ahci_host_priv structure and used to setup the HBA ports mapping. First
> the ports-mapping is read from the PI register and immediately stored in
> the saved_port_map field. If forced_port_map is initialized with non-zero
> value then its value will have greater priority over the value read from
> PI, thus it will override the saved_port_map field. That value will be then
> masked by a non-zero mask_port_map field and after some sanity checks it
> will be stored in the ahci_host_priv.port_map field as a final port
> mapping.
> 
> As you can see the logic is a bit too complicated for such a simple task.
> We can freely get rid from at least one of the fields with no change to
> the implemented semantic. The force_port_map field can be replaced with
> taking non-zero saved_port_map value into account. So if saved_port_map is
> pre-initialized by the glue-driver/platform-specific code then it will

glue-driver == LLDD (low level device driver), for the entire series please.

> have greater priority over the value read from PI register and will be
> used as actual HBA ports mapping later on. Thus the ports map forcing task
> will be just transferred from the force_port_map to saved_port_map field.
> 
> This modification will perfectly fit into the feature of having OF-based
> initialization of the HW-init HBA CSR fields we are about to introduce in
> the next commit.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  drivers/ata/ahci.c             |  2 +-
>  drivers/ata/ahci.h             |  1 -
>  drivers/ata/libahci.c          | 10 ++++++----
>  drivers/ata/libahci_platform.c |  2 +-
>  4 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
> index ab5811ef5a53..8ce0d166cc8d 100644
> --- a/drivers/ata/ahci.c
> +++ b/drivers/ata/ahci.c
> @@ -654,7 +654,7 @@ static void ahci_pci_save_initial_config(struct pci_dev *pdev,
>  {
>  	if (pdev->vendor == PCI_VENDOR_ID_JMICRON && pdev->device == 0x2361) {
>  		dev_info(&pdev->dev, "JMB361 has only one port\n");
> -		hpriv->force_port_map = 1;
> +		hpriv->saved_port_map = 1;
>  	}
>  
>  	/*
> diff --git a/drivers/ata/ahci.h b/drivers/ata/ahci.h
> index 04690b4168a3..519d148ecaea 100644
> --- a/drivers/ata/ahci.h
> +++ b/drivers/ata/ahci.h
> @@ -329,7 +329,6 @@ struct ahci_port_priv {
>  struct ahci_host_priv {
>  	/* Input fields */
>  	unsigned int		flags;		/* AHCI_HFLAG_* */
> -	u32			force_port_map;	/* force port map */
>  	u32			mask_port_map;	/* mask out particular bits */
>  
>  	void __iomem *		mmio;		/* bus-independent mem map */
> diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
> index 0ed484e04fd6..011175e82174 100644
> --- a/drivers/ata/libahci.c
> +++ b/drivers/ata/libahci.c
> @@ -453,7 +453,6 @@ void ahci_save_initial_config(struct device *dev, struct ahci_host_priv *hpriv)
>  	 * reset.  Values without are used for driver operation.
>  	 */
>  	hpriv->saved_cap = cap = readl(mmio + HOST_CAP);
> -	hpriv->saved_port_map = port_map = readl(mmio + HOST_PORTS_IMPL);
>  
>  	/* CAP2 register is only defined for AHCI 1.2 and later */
>  	vers = readl(mmio + HOST_VERSION);
> @@ -517,10 +516,13 @@ void ahci_save_initial_config(struct device *dev, struct ahci_host_priv *hpriv)
>  		cap &= ~HOST_CAP_SXS;
>  	}
>  
> -	if (hpriv->force_port_map && port_map != hpriv->force_port_map) {
> +	/* Override the HBA ports mapping if the platform needs it */
> +	port_map = readl(mmio + HOST_PORTS_IMPL);
> +	if (hpriv->saved_port_map && port_map != hpriv->saved_port_map) {
>  		dev_info(dev, "forcing port_map 0x%x -> 0x%x\n",
> -			 port_map, hpriv->force_port_map);
> -		port_map = hpriv->force_port_map;
> +			 port_map, hpriv->saved_port_map);
> +		port_map = hpriv->saved_port_map;
> +	} else {
>  		hpriv->saved_port_map = port_map;
>  	}
>  
> diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platform.c
> index febad33aa43c..5cbc2c42164d 100644
> --- a/drivers/ata/libahci_platform.c
> +++ b/drivers/ata/libahci_platform.c
> @@ -539,7 +539,7 @@ struct ahci_host_priv *ahci_platform_get_resources(struct platform_device *pdev,
>  	}
>  
>  	of_property_read_u32(dev->of_node,
> -			     "ports-implemented", &hpriv->force_port_map);
> +			     "ports-implemented", &hpriv->saved_port_map);
>  
>  	if (child_nodes) {
>  		for_each_child_of_node(dev->of_node, child) {


-- 
Damien Le Moal
Western Digital Research
