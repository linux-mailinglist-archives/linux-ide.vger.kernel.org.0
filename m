Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2B54F6245
	for <lists+linux-ide@lfdr.de>; Wed,  6 Apr 2022 16:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235390AbiDFO4T (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 6 Apr 2022 10:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235352AbiDFO4H (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 6 Apr 2022 10:56:07 -0400
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BDB127E86B
        for <linux-ide@vger.kernel.org>; Tue,  5 Apr 2022 19:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649211855; x=1680747855;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=76ue1Ttf5vnIL4kZpx1YCVbMRtTV2iZhm01orB2r1W4=;
  b=lKFgFBQ9sNFu4mI4/TKyBBVN7Hij+UmH5bmtARzQkGWF8CLNMg2PvvfN
   rweDtxKfykRR7CPSNt6awY9uTutis1+RULFep9AD/SnfMpRPU8LtjF8cp
   u0AXnQiZl2HlxOSIlzPZrMTAiT4T0GhN58OCYgxDKjW2wV3cBJOvWlBvD
   XgPFN+QalAiGMFqAf+wznkcgvRPau73X3f5pD4eBI0R9k4Obg+1HcLn+A
   4yO8GpehDFFlkrDy66GZ5xC4kyEUx1zR/YbzKsohvJgnJLFEYiqTZ6j5t
   6W719B106znNyiTxknWvIPO44xRB2lCK9fYg+Vdno/YAVCG8dQrB0usQ2
   w==;
X-IronPort-AV: E=Sophos;i="5.90,238,1643644800"; 
   d="scan'208";a="198093234"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 06 Apr 2022 10:24:13 +0800
IronPort-SDR: YH6INOgqF2JPZQgwekhFXy1L+TxNfurPp3GzOa9AvpNrOxg6alNfvr2WzDbDDjc5ppwHg7dxo7
 08s7qsi8gkM+aentu0mp07x/IKDwv5MLMcUZO4R2P4otqipHK6+1AiKmwz67yZ/xnV44jtMoyT
 GNMI4je0SmC3pw+JMoYFq3KJENXH09YNbsQ3Zc2aH7Iwm+JiWerVQn/6rAdhHp2ZPmuh3NOy0c
 gpHFPyKBFmfiP3nojDW29y6RSnaQqa7rS8T4Wcv7TDhExWQ2ohXbrq5bKf9qa2ziLphP6I7RRA
 RrWu6EV+toDTmsqxxc3OGUBL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Apr 2022 18:55:44 -0700
IronPort-SDR: E8iFahtweD7plESw+ls1Lwlu33YZLLXecegIXe5QtD5W+Tpk467N/sIXTno26X4Vy2r6OYKNOT
 doMGt6mYAiLLtWTIh2bpdSe0a/Tn4JpqZ4/94QgAw3GaeAVT1IGLTznFa4Fp/fyG48TulxMHHn
 SjEuunmQWIItWk2CK9FZgnX424NVb23/JaCQFSdJy5yiwZLrtKUMl1d6sH/SRH4BYOUMSbVyAB
 NmWP/0I08WsgeQbmEpnI8yaKuAvP0PV8I1fi/e0NESFK2FrF7Wz8LI4hk9kJyR0n0ZAizZ9SLl
 Rj8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Apr 2022 19:24:12 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KY7cX2bZwz1SHwl
        for <linux-ide@vger.kernel.org>; Tue,  5 Apr 2022 19:24:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1649211851; x=1651803852; bh=76ue1Ttf5vnIL4kZpx1YCVbMRtTV2iZhm01
        orB2r1W4=; b=UFPCzE2Dejmr9iSvNu0as+Apv5l9Oowo7E9ptguYVnIlHQLJBWp
        GjrEO0PrfSy638qeB2dKzEHGSZmkL6q5tGCGrsqCq9eUhwqCK7+b24miJtqKWAgB
        4MwNvTv7EpJmJk++x888msc6zXOc6GI1MwylD9+pGqg5tlr1XZY6oe9NrB+xUbew
        2Xyu+Hy/f73asfYqKFQHhNFhM2LoOpnJbZkKpL8HBWrhbtA0q73UbwIuEMxSqaTe
        tNnKeWGQ3kQ2MY9ATkRYQAMkkwXIS4E6M6mKXhk5i4DSS8g5I8pZ7e7Vfmh38Oz4
        uXAv++JqijEwgkJfH2+E51OlSaiGtHqAb8w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id PESmSHNIUPzn for <linux-ide@vger.kernel.org>;
        Tue,  5 Apr 2022 19:24:11 -0700 (PDT)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KY7cW1YP2z1Rvlx;
        Tue,  5 Apr 2022 19:24:11 -0700 (PDT)
Message-ID: <67c7780d-79aa-cfc2-82bc-ccca8ca4af69@opensource.wdc.com>
Date:   Wed, 6 Apr 2022 11:24:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/2] ata: ahci: Protect users from setting policies
 their drives don't support
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>, hdegoede@redhat.com
References: <20220404194510.9206-1-mario.limonciello@amd.com>
 <20220404194510.9206-2-mario.limonciello@amd.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220404194510.9206-2-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 4/5/22 04:45, Mario Limonciello wrote:
> As the default low power policy applies to more chipsets and drives, it's
> important to make sure that drives actually support the policy that a user
> selected in their kernel configuration.
> 
> If the drive doesn't support slumber, don't let the default policy for the
> ATA port be `min_power` or `min_power_with_partial`.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v2->v3:
>   * Fix typo
>   * Try to reset to CONFIG_SATA_LPM_POLICY unless that's too aggressive
>     then take MED_POWER.
>   drivers/ata/libata-sata.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/ata/libata-sata.c b/drivers/ata/libata-sata.c
> index 044a16daa2d4..b41de7e03dce 100644
> --- a/drivers/ata/libata-sata.c
> +++ b/drivers/ata/libata-sata.c
> @@ -13,6 +13,7 @@
>   #include <scsi/scsi_device.h>
>   #include <linux/libata.h>
>   
> +#include "ahci.h"
>   #include "libata.h"
>   #include "libata-transport.h"
>   
> @@ -368,10 +369,21 @@ int sata_link_scr_lpm(struct ata_link *link, enum ata_lpm_policy policy,
>   		      bool spm_wakeup)
>   {
>   	struct ata_eh_context *ehc = &link->eh_context;
> +	struct ata_port *ap = link->ap;
> +	struct ahci_host_priv *hpriv;

That does not work. This function is used by the ata_piix driver too, 
which is not ahci...

>   	bool woken_up = false;
>   	u32 scontrol;
>   	int rc;
>   
> +	hpriv = ap->host->private_data;
> +	if (policy >= ATA_LPM_MIN_POWER_WITH_PARTIAL &&
> +	  !(hpriv->cap & HOST_CAP_SSC)) {

...which mean that this flag needs to be moved to struct ata_host to 
keep this function generic for different LLDDs.

> +		policy = (CONFIG_SATA_LPM_POLICY < ATA_LPM_MIN_POWER_WITH_PARTIAL) ?
> +			 CONFIG_SATA_LPM_POLICY : ATA_LPM_MED_POWER;

I really prefer an explicit "if () else" for readability.
Also, please revert here to CONFIG_SATA_MOBILE_LPM_POLICY.

> +		dev_warn(ap->host->dev,
> +			"This drive doesn't support slumber; resetting policy to %d\n", policy);

s/doesn't/does not

> +	}
> +
>   	rc = sata_scr_read(link, SCR_CONTROL, &scontrol);
>   	if (rc)
>   		return rc;

Also, as patch 3 of this series, can you add the patch that changes 
CONFIG_SATA_MOBILE_LPM_POLICY to being "3" by default ?

And please use a cover letter when you have more than 1 patch. The 
change log can then be in the cover letter instead of in each patch.

-- 
Damien Le Moal
Western Digital Research
