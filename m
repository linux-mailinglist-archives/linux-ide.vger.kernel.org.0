Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBDF24B0954
	for <lists+linux-ide@lfdr.de>; Thu, 10 Feb 2022 10:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238404AbiBJJUK (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 10 Feb 2022 04:20:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238391AbiBJJUK (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 10 Feb 2022 04:20:10 -0500
Received: from mxout01.lancloud.ru (mxout01.lancloud.ru [45.84.86.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5770110A0
        for <linux-ide@vger.kernel.org>; Thu, 10 Feb 2022 01:20:08 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru F075120D4E50
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v3] pata_hpt3x2n: check channel enable bits
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
References: <062c3834-da7e-273e-177b-d7aea4b1ba81@omp.ru>
 <9a9c5fb7-904a-5066-fd30-6288d7cfdff5@opensource.wdc.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <920357d9-16fc-c271-ac58-1f4e0d5f9a7a@omp.ru>
Date:   Thu, 10 Feb 2022 12:20:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <9a9c5fb7-904a-5066-fd30-6288d7cfdff5@opensource.wdc.com>
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

On 2/10/22 6:06 AM, Damien Le Moal wrote:

>> The driver's prereset() method still doesn't check the channel enable bits.
>> The bug was there for the entire time the driver has existed. :-/
>>
>> Alan Cox fixed the HPT37x driver in commit b5bf24b94c65 ("[PATCH] hpt37x:
>> Check the enablebits") but forgot to check the HPT3x2N driver which has
>> the same bug. :-/
>>
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> Applied to for-5.18. Thanks !

   What about the (analogous) pata_hpoet366 paych?

MBR, Sergey
