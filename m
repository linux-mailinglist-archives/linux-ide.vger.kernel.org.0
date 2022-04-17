Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0853C5048CB
	for <lists+linux-ide@lfdr.de>; Sun, 17 Apr 2022 20:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234709AbiDQSNU (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 17 Apr 2022 14:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbiDQSNU (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 17 Apr 2022 14:13:20 -0400
Received: from mxout02.lancloud.ru (mxout02.lancloud.ru [45.84.86.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20238BCBA
        for <linux-ide@vger.kernel.org>; Sun, 17 Apr 2022 11:10:42 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru D861F22C6A4C
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 0/5] libata.force improvements
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
References: <20220407123748.1170212-1-damien.lemoal@opensource.wdc.com>
 <8156604b-2d6d-dd3b-612b-ef8a14f96943@opensource.wdc.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <495aec34-b4e7-6205-5ff4-b539a2e048e1@omp.ru>
Date:   Sun, 17 Apr 2022 21:10:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <8156604b-2d6d-dd3b-612b-ef8a14f96943@opensource.wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 4/12/22 3:45 AM, Damien Le Moal wrote:

>> This patch series improves the usefulness of the libata.force kernel
>> boot parameters to facilitate field debugging of ata drives and adapter
>> issues by extending the range of horkage flags and link flags that can
>> be controlled.
>>
>> The first patch is a simple cleanup of the drive blacklist array.
>> Patch 2 refactors the declaration of the force_tbl array defining the
>> possible values that libata.force can take. Patch 3 and 4 extend this
>> array adding most horkage flags and one link flag. Finally, patch 5
>> updates the kernel documentation reflecting these changes.
>>
>> Damien Le Moal (5):
>>   ata: libata-core: cleanup ata_device_blacklist
>>   ata: libata-core: Refactor force_tbl definition
>>   ata: libata-core: Improve link flags forced settings
>>   ata: libata-core: Allow forcing most horkage flags
>>   doc: admin-guide: Update libata kernel parameters
>>
>>  .../admin-guide/kernel-parameters.txt         |  71 +++--
>>  drivers/ata/libata-core.c                     | 271 +++++++++++-------
>>  2 files changed, 217 insertions(+), 125 deletions(-)
>>
> 
> Sergey,
> 
> Could you review this and/or give it a try ?

   Sorry, I'm a bit overloaded at work, couldn't find the time for that (yet?)...

MBR, Sergey
