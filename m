Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2BB74B6C03
	for <lists+linux-ide@lfdr.de>; Tue, 15 Feb 2022 13:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237667AbiBOM2N (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 15 Feb 2022 07:28:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233510AbiBOM2M (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 15 Feb 2022 07:28:12 -0500
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73246107D13;
        Tue, 15 Feb 2022 04:28:01 -0800 (PST)
Received: from [192.168.0.2] (ip5f5aee0e.dynamic.kabel-deutschland.de [95.90.238.14])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 8CB0161EA1928;
        Tue, 15 Feb 2022 13:27:59 +0100 (CET)
Message-ID: <e146ff4c-a1c2-dfbd-d736-2515bb8201a9@molgen.mpg.de>
Date:   Tue, 15 Feb 2022 13:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] ahci: Add Green Sardine vendor ID as
 board_ahci_mobile
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>
Cc:     linux-ide@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Nehal-bakulchandra Shah <Nehal-bakulchandra.Shah@amd.com>
References: <20211112201539.17377-1-mario.limonciello@amd.com>
 <960946b8-8f73-9f81-735a-64e5cc555a9c@molgen.mpg.de>
 <DM4PR12MB516853204C9D7E7EAAFBC91FE2339@DM4PR12MB5168.namprd12.prod.outlook.com>
 <6c846941-151d-e8a5-3ce8-a392b97186a8@molgen.mpg.de>
 <6e7678ba-1d56-155f-f5b7-3257bbd0d929@redhat.com>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <6e7678ba-1d56-155f-f5b7-3257bbd0d929@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Dear Hans,


Am 15.02.22 um 12:43 schrieb Hans de Goede:

> On 2/15/22 08:05, Paul Menzel wrote:

>> Am 14.02.22 um 17:07 schrieb Limonciello, Mario:
>>
>>> +Hans
>>>
>>>> (For the records, is part of Linux since 5.16-rc2 (commit 1527f69204fe).)
>>>>
>>>> Am 12.11.21 um 21:15 schrieb Mario Limonciello:
>>>>> AMD requires that the SATA controller be configured for devsleep in order
>>>>> for S0i3 entry to work properly.
>>>>>
>>>>> commit b1a9585cc396 ("ata: ahci: Enable DEVSLP by default on x86 with
>>>>> SLP_S0") sets up a kernel policy to enable devsleep on Intel mobile
>>>>> platforms that are using s0ix.  Add the PCI ID for the SATA controller in
>>>>> Green Sardine platforms to extend this policy by default for AMD based
>>>>> systems using s0i3 as well.
>>>>>
>>>>> Cc: Nehal-bakulchandra Shah <Nehal-bakulchandra.Shah@amd.com>
>>>>> BugLink:
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugz
>>>> illa.kernel.org%2Fshow_bug.cgi%3Fid%3D214091&amp;data=04%7C01%7Cm
>>>> ario.limonciello%40amd.com%7Ca32a202d437544cd2cbb08d9ef9112c0%7C3d
>>>> d8961fe4884e608e11a82d994e183d%7C0%7C0%7C637804228648002522%7CU
>>>> nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI
>>>> 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=CbfImBnwc8uV1L5QRBuV
>>>> PLkP72wpS9yif1UbUwykhNI%3D&amp;reserved=0
>>
>> You have to love Microsoft Outlook.
>>
>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> ---
>>>>>     drivers/ata/ahci.c | 1 +
>>>>>     1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
>>>>> index d60f34718b5d..1e1167e725a4 100644
>>>>> --- a/drivers/ata/ahci.c
>>>>> +++ b/drivers/ata/ahci.c
>>>>> @@ -438,6 +438,7 @@ static const struct pci_device_id ahci_pci_tbl[] = {
>>>>>         /* AMD */
>>>>>         { PCI_VDEVICE(AMD, 0x7800), board_ahci }, /* AMD Hudson-2 */
>>>>>         { PCI_VDEVICE(AMD, 0x7900), board_ahci }, /* AMD CZ */
>>>>> +    { PCI_VDEVICE(AMD, 0x7901), board_ahci_mobile }, /* AMD Green Sardine */
>>>>
>>>> Aren't 0x7900 and 0x7901 the same device only in different modes? I
>>>> wonder, why different boards and different comments are used.
>>>
>>> No they aren't the same device in different modes.
>>>
>>> Reference:
>>> https://www.amd.com/en/support/tech-docs/processor-programming-reference-ppr-for-amd-family-19h-model-51h-revision-a1
>>> Page 33 has a table.
>>
>> That table misses 0x7900h. (Where can I find it?) coreboot has 0x7900 defined for Cezanne:
>>
>>      src/include/device/pci_ids.h:#define PCI_DEVICE_ID_AMD_CZ_SATA  0x7900
>>      src/soc/amd/stoneyridge/include/soc/pci_devs.h: * SATA_IDE_IDEVID              0x7900
>>
>> The PCI database too [3]:
>>
>>> FCH SATA Controller [IDE mode]
>>
>>
>>>> Additionally, the device 0x7901 is also present in desktop systems like
>>>> Dell OptiPlex 5055 and MSI B350 MORTAR. Is `board_ahci_mobile` the right
>>>> board then? Or should the flag `AHCI_HFLAG_IS_MOBILE` be renamed to
>>>> avoid confusion?
>>>
>>> Are you having a problem or just want clarity in the enum definition?
>>
>> It’s more about clarity, and understanding the two different entries.
>>
>>> This was introduced by Hans in commit ebb82e3c79d2a to set LPM policy properly
>>> for a number of mobile devices.
>>>
>>> My opinion here is that the policy being for "mobile" devices only is short sighted as power
>>> consumption policy on desktops is also relevant as OEMs ship desktops that need to meet
>>> various power regulations for those too.
>>>
>>> So I would be in the camp for renaming the flags.
>>
>> Why can’t the LPM policy, if available(?), not be set for `board_ahci` by default, so `board_ahci_mobile` could be removed?
> 
> When I added this, which was around the Haswell / Broadwell times, enabling
> LPM on mobile devices was not so much important for the direct power-saving,
> but to allow the entire package (integrated southbridge-ish) to go to deeper
> sleep (aka PC) states.
> 
> Without this laptops would drain their batteries much faster, but at the same
> time there were reports of LPM causing crashes and data corruption on some
> systems, also see the list of ATA ids with a ATA_HORKAGE_NOLPM flag in
> drivers/ata/libata-core.c . Which was added and grown over time to allow
> enabling LPM by default without causing regressions.

This seems to be related to the hard driver though, and not the chipset?

> So when adding support for enabling LPM modes by default, to get the
> desired power-savings by default I tried to do this on a minimal set of
> devices, to avoid causing regressions.
> 
> Another factor here is that in some cases LPM related issues went away
> after either BIOS or disk/ssd firmware updates. So the motherboard firmware
> is also a factor here and enabling LPM by default on non laptop(ish)
> motherboards has never been tested.
> 
> Also enabling some of the deeper LPM modes comes at a latency cost which
> may be undesirable at servers. Note this just sets the initial default
> LPM mode, this can always be changed by userspace later.

Thank you for the elaborate explanation. What do you suggest in regards 
the 1022:7901, present in laptops and desktop systems?

>>>>>         /* AMD is using RAID class only for ahci controllers */
>>>>>         { PCI_VENDOR_ID_AMD, PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
>>>>>           PCI_CLASS_STORAGE_RAID << 8, 0xffffff, board_ahci },


Kind regards,

Paul


>> [1]: https://review.coreboot.org/10418
>> [2]: https://review.coreboot.org/20200
>> [3]: https://pci-ids.ucw.cz/read/PC/1022/7900
