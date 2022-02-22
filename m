Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E014BF4FE
	for <lists+linux-ide@lfdr.de>; Tue, 22 Feb 2022 10:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbiBVJsx (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 22 Feb 2022 04:48:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbiBVJsx (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 22 Feb 2022 04:48:53 -0500
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC2FA98F6C
        for <linux-ide@vger.kernel.org>; Tue, 22 Feb 2022 01:48:25 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 65CC820DA1EC
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] ata: pata_hpt37x: disable primary channel on HPT371
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
References: <e398d6e3-05f2-409f-6818-812f24e325eb@omp.ru>
 <feb0d6ba-baa2-6482-e6b4-eb5baed2a728@opensource.wdc.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <6604b1f6-adcf-96f6-f736-4ade3642f6f7@omp.ru>
Date:   Tue, 22 Feb 2022 12:48:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <feb0d6ba-baa2-6482-e6b4-eb5baed2a728@opensource.wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 2/22/22 3:37 AM, Damien Le Moal wrote:

>> HPT371 chips physically have only one channel, the secondary one, however
>> the primary channel registers do exist!  Thus we have to manually disable
>> the non-existing channel (if the BIOS hasn't done this already).  Alan Cox
>> has only added such code to the 'pata_hpt3x2n' driver, forgetting about
>> this one... :-/
> 
> No need to assign blame by name :) Something more neutral like:
> 
> "Similarly to the pata_hpt3x2n driver, always disable the primary channel."

   Should I now repost?

> will do. Also, do you have a fixes tag for this one ? Is it again:
> 
> Fixes: 669a5db411d8 ("[libata] Add a bunch of PATA drivers.")> ?

   Yes.

>>
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

[...]

MBR, Sergey
