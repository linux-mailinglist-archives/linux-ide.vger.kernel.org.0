Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A43034CBAB4
	for <lists+linux-ide@lfdr.de>; Thu,  3 Mar 2022 10:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbiCCJwz (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 3 Mar 2022 04:52:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbiCCJwy (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 3 Mar 2022 04:52:54 -0500
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66426179241
        for <linux-ide@vger.kernel.org>; Thu,  3 Mar 2022 01:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1646301127; x=1677837127;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=q8qxz42HaO+JR55NT5n/z+nUeTPKq/2B9ARU+jmiFTI=;
  b=CobDq3qOJ65Yyxqh4bNrMyVR7InYIvgRK3PJCDqs80JsDyyJs1MHXy8x
   WTbQoxecYq8OqiqGzrvgpE0MA7vXLLpA1iv/bfLusjGImbd8z35dga1Mn
   xxAM3AiYVTssk3L7J8tMnmaiTUWrqj28myMylybd3iejexgNElMnQCSio
   cHtg9maDAIjFCwija8Yuh0Co6SoODJQDAskw6HPLgmoshXqTfjoXsqsme
   MSO73naF4XKyjiE2iUIQkO1umBjKf2iZBYYA8SP4ls5/FZ68cr9bz/YkF
   +QuOAedjIVVymW7B2EOnHQZhKDJue4L//DBUIDltET4SaqGfpmoq2/4dY
   w==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; 
   d="scan'208";a="199215163"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 17:52:06 +0800
IronPort-SDR: YKNiicB7rFfSt5FSr5OyDJDoO8zufaxw4sMhEi+dVKI0uLq3l2YFwHfPaoCk5f3NIvRZzRv/qc
 1y6vtkPbljf8tr8L3h70yWeZf90guHsLbrqZqKyRn2foAGesRLZYkRP+zitAJ/Hfbw1abxxzEh
 mVzXyiLG5rUSIn5v1wjoVGqicSlVE3mRfjpYTwNei4CAur2eoHWQbrNKWcxDIJGfh3KdGdHQ5A
 zo5gVzVoJr9Dyi34EOPCb8trdpjk8fJHILKXgmObn+xY4OTgstrgr+VjO4tfb/Y4VaQOTaRG67
 hkl/yoXD0pHWiUklelJ8TfyX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 01:23:30 -0800
IronPort-SDR: OGHPzKreUR9lp1hCOisxbrRolUIFNzM9tsravAfS3Mlq4stCAO0RTlQBMP6Az8JHfLO8tGMLdG
 uuCwCP63hqD1kQloP4GBnluinwAH2joLmPRPg863r6d/PSKjg/HV8274cIQbiyza5kT5N59uVk
 Tuo+ktsfsfxxXbuHpCCBrtM5jxPYz8MttgARaS5EaHQP1Rh8AEf7+swyNRiA/PTJrVRAREjz5y
 A1vmhGtF5VJGvD9KTD1xNqIjlVJ6ww8EvzTsRFEDZ2uDiYW4E8jiVwYGsCY6k3p3Ofo7HJTGHh
 5Kk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 01:52:08 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K8R9329flz1SVnx
        for <linux-ide@vger.kernel.org>; Thu,  3 Mar 2022 01:52:07 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1646301126; x=1648893127; bh=q8qxz42HaO+JR55NT5n/z+nUeTPKq/2B9AR
        U+jmiFTI=; b=V95OPQWNQJcum+7QVTyr3LqR0oYpKPCX0pH0GMuL9NEH5Y37bTf
        yQ4BPBql5jyCK8tNMqh8nWSM0J9qDzhs9cCZu65O0N3R5biJIA7eq2x2skRlHMFx
        6xXI4Lnc5IHpdfvw5Tc+ddFTrOE7DVmG2iArozgwq/dSCMaXWF4F+jUFKcFeruZa
        MRkFiDujZkLJ0cDnB9BnUtFBM1bvQbLy2eXQ597ktlmXPEWEzf3zxSbhjQx9S4E+
        M/wbvMKdpaMW5vUR0m2kx339uA3Dzd1DtM2MowSt48aHxZbyPNHA0wzppNJkiOe/
        uYITJcr7NNTqArVrSTscAW4FF21QFGVDVSA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id MRXGKHw_1HWk for <linux-ide@vger.kernel.org>;
        Thu,  3 Mar 2022 01:52:06 -0800 (PST)
Received: from [10.225.33.67] (unknown [10.225.33.67])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K8R914Prlz1Rvlx;
        Thu,  3 Mar 2022 01:52:05 -0800 (PST)
Message-ID: <3a8c29c7-515f-6e0e-323c-b2b00a9f9d8c@opensource.wdc.com>
Date:   Thu, 3 Mar 2022 11:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 2/2] ata: ahci: Protect users from setting policies
 their drives don't support
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>, hdegoede@redhat.com
References: <20220303034912.3615390-1-mario.limonciello@amd.com>
 <20220303034912.3615390-2-mario.limonciello@amd.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220303034912.3615390-2-mario.limonciello@amd.com>
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

On 2022/03/03 5:49, Mario Limonciello wrote:
> As the default low power policy applies to more chipsets and drives, it's
> important to make sure that drives actually support the policy that a user
> selected in their kernel configuration.
> 
> If the drive doesn't support slumber, don't let the default policies
> dependent upon slumber (`min_power` or `min_power_with_partial`) affect the
> disk.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> Changes from v1->v2:
> * Move deeper into codepaths
> * Reset to MED_POWER rather than ignore
>  drivers/ata/libata-sata.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/ata/libata-sata.c b/drivers/ata/libata-sata.c
> index 071158c0c44c..0dc03888c62b 100644
> --- a/drivers/ata/libata-sata.c
> +++ b/drivers/ata/libata-sata.c
> @@ -13,6 +13,7 @@
>  #include <scsi/scsi_device.h>
>  #include <linux/libata.h>
>  
> +#include "ahci.h"
>  #include "libata.h"
>  #include "libata-transport.h"
>  
> @@ -368,10 +369,20 @@ int sata_link_scr_lpm(struct ata_link *link, enum ata_lpm_policy policy,
>  		      bool spm_wakeup)
>  {
>  	struct ata_eh_context *ehc = &link->eh_context;
> +	struct ata_port *ap = link->ap;
> +	struct ahci_host_priv *hpriv;
>  	bool woken_up = false;
>  	u32 scontrol;
>  	int rc;
>  
> +	hpriv = ap->host->private_data;
> +	if (policy >= ATA_LPM_MIN_POWER_WITH_PARTIAL &&
> +	  !(hpriv->cap & HOST_CAP_SSC)) {

Weird indentation.

> +		dev_warn(ap->host->dev,
> +			"This drive doesn't support slumber; restting policy to MED_POWER\n");

Typo. I would change this to:

"This device does not support slumber; defaulting to MED_POWER policy\n"

> +		policy = ATA_LPM_MED_POWER;
> +	}
> +
>  	rc = sata_scr_read(link, SCR_CONTROL, &scontrol);
>  	if (rc)
>  		return rc;


-- 
Damien Le Moal
Western Digital Research
