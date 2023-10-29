Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 832BD7DB193
	for <lists+linux-ide@lfdr.de>; Mon, 30 Oct 2023 00:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbjJ2XwX (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 29 Oct 2023 19:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjJ2XwW (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 29 Oct 2023 19:52:22 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECFA391
        for <linux-ide@vger.kernel.org>; Sun, 29 Oct 2023 16:52:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F359C433C8;
        Sun, 29 Oct 2023 23:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698623540;
        bh=+USpA1Hn8SdVnaiCbwCTsOLCuuntj7kA2ZkWgjuXGtA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=syaX4F2m21X1zHuF4cYnLT/uoh09pg2gLyl5KRcodInl4o7dQ3emR+r9hYyvgVGFq
         iMFHECLvVxxqjoQrjnhRfZCVDJ8YMb6Uitgmqc9wijoj34jR8DN/AWJJezBA3z7jJw
         CAz67rmdY2H1UEr6hR+T3X5WOCYaZh9m8GE63Gj2cVlaZDGV+xI5kJeq032MFeRFTc
         0nQ4d2CMe7VAMwsvZmxSlJfGVQ4jaUo14bCz7m7PjSM5S/oeMgyo/g6zcoZVkR6ReH
         cPRbC2IX9pxjmOpL3odyBfmIDSuMYlBZllyyFrdGm0HNUEJ49+WAT8UM8aPDHjaw4t
         TeYiQznyFJBSQ==
Message-ID: <68df1ee3-04ec-431d-b5ac-a5fd26801fe8@kernel.org>
Date:   Mon, 30 Oct 2023 08:52:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ata fixes for 6.6-final
Content-Language: en-US
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-ide@vger.kernel.org
References: <20231027073115.170201-1-dlemoal@kernel.org>
 <CAHk-=wha0w0mOQ9w1OnPcadJK5anM5dM5kanDm3hFRqCu7QaFw@mail.gmail.com>
From:   Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <CAHk-=wha0w0mOQ9w1OnPcadJK5anM5dM5kanDm3hFRqCu7QaFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 10/28/23 08:43, Linus Torvalds wrote:
> On Thu, 26 Oct 2023 at 21:31, Damien Le Moal <dlemoal@kernel.org> wrote:
>>
>> A single patch to fix a regression introduced by the recent
>> suspend/resume fixes. The regression is that ATA disks are not stopped
>> on system shutdown, which is not recommended and increases the disks
>> SMART counters for unclean power off events. This patch fixes this by
>> refining the recent rework of the scsi device manage_xxx flags.
> 
> Side note: I think 'bool' ends up always using a whole byte in 'struct
> scsi_device' (because you can't take an address of a single bit).
> 
> And while it might all end up being unnoticeable due to padding, those
> bools are right next to bitfields.
> 
> Which just makes me go "those should all have been just 'unsigned:1' fields".
> 
> Of course, maybe they actually have their address taken, and it's all
> very intentional.

I will check. Thanks.

> 
>               Linus

-- 
Damien Le Moal
Western Digital Research

