Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF074BCDC4
	for <lists+linux-ide@lfdr.de>; Sun, 20 Feb 2022 11:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238128AbiBTJUv (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 20 Feb 2022 04:20:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbiBTJUv (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 20 Feb 2022 04:20:51 -0500
Received: from mxout02.lancloud.ru (mxout02.lancloud.ru [45.84.86.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744933465E
        for <linux-ide@vger.kernel.org>; Sun, 20 Feb 2022 01:20:28 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 5546322F1F30
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] ata: pata_hpt37x: fix PCI clock detection
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
References: <02715925-4a0f-30dd-86b8-85786cf6484a@omp.ru>
 <f37abf49-e11d-f9d7-f247-f296213100ff@opensource.wdc.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <f8df20fe-5219-540a-e3ab-952345662cf9@omp.ru>
Date:   Sun, 20 Feb 2022 12:20:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f37abf49-e11d-f9d7-f247-f296213100ff@opensource.wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 2/20/22 9:44 AM, Damien Le Moal wrote:

>> The f_CNT register (at the PCI config. address 0x78) is 16-bit, not 8-bit!
>> The bug was there from the very srart... :-(
>>
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>> Cc: stable@vger.kernel.org
> 
> Any Fixes tag possible with this one ? I have not checked what "git
> blame" says...

   As I said, it was there from the very start, so should be:

Fixes: 669a5db411d8 ("[libata] Add a bunch of PATA drivers.")

[...]

MBR, Sergey
