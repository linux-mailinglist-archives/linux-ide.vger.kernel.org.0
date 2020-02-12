Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A59315A813
	for <lists+linux-ide@lfdr.de>; Wed, 12 Feb 2020 12:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgBLLnK (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 12 Feb 2020 06:43:10 -0500
Received: from foss.arm.com ([217.140.110.172]:59850 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbgBLLnJ (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Wed, 12 Feb 2020 06:43:09 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF3F130E;
        Wed, 12 Feb 2020 03:43:08 -0800 (PST)
Received: from [192.168.1.123] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F26533F68F;
        Wed, 12 Feb 2020 03:43:06 -0800 (PST)
Subject: Re: [PATCH] ata: ahci_platform: add 32-bit quirk for dwc-ahci
To:     Hans de Goede <hdegoede@redhat.com>, Roger Quadros <rogerq@ti.com>,
        axboe@kernel.dk
Cc:     vigneshr@ti.com, nsekhar@ti.com, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@ti.com>
References: <20200206111728.6703-1-rogerq@ti.com>
 <d3a80407-a40a-c9e4-830f-138cfe9b163c@redhat.com>
 <1c3ec10c-8505-a067-d51d-667f47d8d55b@ti.com>
 <37c3ca6a-dc64-9ce9-e43b-03b12da6325e@redhat.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <7e5f503f-03df-29d0-baae-af12d0af6f61@arm.com>
Date:   Wed, 12 Feb 2020 11:43:06 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <37c3ca6a-dc64-9ce9-e43b-03b12da6325e@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 2020-02-12 11:32 am, Hans de Goede wrote:
> Hi,
> 
> On 2/12/20 12:01 PM, Roger Quadros wrote:
>> Hi,
>>
>> On 06/02/2020 13:50, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 2/6/20 12:17 PM, Roger Quadros wrote:
>>>> On TI Platforms using LPAE, SATA breaks with 64-bit DMA.
>>>> Restrict it to 32-bit.
>>>>
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>>>> ---
>>>>   drivers/ata/ahci_platform.c | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
>>>> index 3aab2e3d57f3..b925dc54cfa5 100644
>>>> --- a/drivers/ata/ahci_platform.c
>>>> +++ b/drivers/ata/ahci_platform.c
>>>> @@ -62,6 +62,9 @@ static int ahci_probe(struct platform_device *pdev)
>>>>       if (of_device_is_compatible(dev->of_node, "hisilicon,hisi-ahci"))
>>>>           hpriv->flags |= AHCI_HFLAG_NO_FBS | AHCI_HFLAG_NO_NCQ;
>>>> +    if (of_device_is_compatible(dev->of_node, "snps,dwc-ahci"))
>>>> +        hpriv->flags |= AHCI_HFLAG_32BIT_ONLY;
>>>> +
>>>
>>> The "snps,dwc-ahci" is a generic (non TI specific) compatible which
>>> is e.g. also used on some exynos devices. So using that to key the
>>> setting of the 32 bit flag seems wrong to me.
>>>
>>> IMHO it would be better to introduce a TI specific compatible
>>> and use that to match on instead (and also adjust the dts files
>>> accordingly).
>>
>> Thinking further on this I think it is a bad idea to add a special
>> binding because the IP is not different. It is just that it is
>> wired differently on the TI SoC so DMA range is limited.
>>
>> IMO the proper solution is to have the right dma-ranges property in the
>> device tree. However, SATA platform driver is doing the wrong thing
>> by overriding the dma masks.
>> i.e. in ahci_platform_init_host() in libahci_platform.c >
>>          if (hpriv->cap & HOST_CAP_64) {
>>                  rc = dma_coerce_mask_and_coherent(dev, 
>> DMA_BIT_MASK(64));
>>                  if (rc) {
>>                          rc = dma_coerce_mask_and_coherent(dev,
>>                                                            
>> DMA_BIT_MASK(32));
>>                          if (rc) {
>>                                  dev_err(dev, "Failed to enable 64-bit 
>> DMA.\n");
>>                                  return rc;
>>                          }
>>                          dev_warn(dev, "Enable 32-bit DMA instead of 
>> 64-bit.\n");
>>                  }
>>          }
>>
>> This should be removed. Do you agree?
> 
> I agree with you in principal, but I'm afraid this might cause 
> regressions for
> existing hardware. We only do this if the host has set the CAP_64 flag,
> this code is quite old, it comes from the following commit:
> 
> ###
>  From cc7a9e27562cd78a1dc885504086fab24addce40 Mon Sep 17 00:00:00 2001
> From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
> Date: Thu, 12 Jun 2014 12:40:23 -0500
> Subject: [PATCH v3] ahci: Check and set 64-bit DMA mask for platform 
> AHCI driver
> 
> The current platform AHCI driver does not set the dma_mask correctly
> for 64-bit DMA capable AHCI controller. This patch checks the AHCI
> capability bit and set the dma_mask and coherent_dma_mask accordingly.
> 
> Signed-off-by: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Suman Tripathi <stripathi@apm.com>
> Signed-off-by: Tejun Heo <tj@kernel.org>
> ###
> 
> Presumably this was added for a reason, I'm guessing this might come
> from AMD's ARM server chips adventures, but I'm afraid that AHCI support
> on other (ARM) SoC's has become to rely on this behavior too.
> 
> Maybe we can add a check to see if the mask was not already set and skip
> setting the mask in that case ?

If the device *is* inherently 64-bit capable, then setting 64-bit masks 
in the driver is correct - if a 64-bit IP block happens to have been 
integrated with only 32 address bits wired up, but the system has memory 
above the 32-bit boundary, then that should be described via 
"dma-ranges", which should then end up being used to further constrain 
the device masks internally to the DMA API.

Robin.
