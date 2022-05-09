Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 696E352040B
	for <lists+linux-ide@lfdr.de>; Mon,  9 May 2022 19:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239899AbiEISCN (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 9 May 2022 14:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239984AbiEISCK (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 9 May 2022 14:02:10 -0400
Received: from mxout02.lancloud.ru (mxout02.lancloud.ru [45.84.86.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF53722905E
        for <linux-ide@vger.kernel.org>; Mon,  9 May 2022 10:58:03 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru C8B8020C097E
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 0/3] Make PATA transfer mode masks always being 32-bit
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
References: <20220508204139.4961-1-s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <922c9d70-70b4-98be-3c12-8d867c0b16b6@omp.ru>
Date:   Mon, 9 May 2022 20:57:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220508204139.4961-1-s.shtylyov@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 5/8/22 11:41 PM, Sergey Shtylyov wrote:

> The PATA transfer mode masks (direct and packed) in libata are sometimes
> declared as *unsigned int* and sometimes as *unsigned long* (which is a
> 64-bit type on 64-bit architectures), while the packed mask really only
> uses 20 bits and the PIO/MWDMA/UDMA masks use up to 8 bits. Switching to
> the uniform 32-bit masks saves siginificant amount of the object code...

   Forgot to mention the patchset was against the 'for-next' branch of
Damien's 'libata.git' repo.
   In fact, I did even forgot to use a working branch while preparing the
patches to posting -- did that atop of the real local copy of the 'for-next'
branch. :-/

[...]

MBR, Sergey
