Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44765643D43
	for <lists+linux-ide@lfdr.de>; Tue,  6 Dec 2022 07:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbiLFGqq (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 6 Dec 2022 01:46:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232616AbiLFGqo (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 6 Dec 2022 01:46:44 -0500
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F8F220DE
        for <linux-ide@vger.kernel.org>; Mon,  5 Dec 2022 22:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1670309204; x=1701845204;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AzsErKObOeSdHVU0v+2ELRRiNknYBWmasc2TFqZExXk=;
  b=q+/bV/fenyk7kv7ru6QXYJNTVbRT5BD6wvtYdYBFn2al2naFhNu5VF8I
   zY8B56SdrrfXHngKqZZUkI9v6EeKaDUksBj+mH7U7sj+VwP1LqBOKvvkG
   6zeMCvJjcsXexePROxbeCeTm0cHmT3ee4E4gJYHncfQpdmrRRTK538XPV
   4130Q5YbP7hp97extN9eAtxITBZuM6Zt5fpIoF1wicl4R6I9jVma1F7jv
   CUnasuU4yQUrkRYgNDgCoVaPp58zlFtXMDpq9CgyZa42IOTw9M/YoUfPu
   4kH8Firft2reoiKFumbBmXxJ4IeB2qB2vWeQlZIiSbH1ut5nj7PBv1QnK
   A==;
X-IronPort-AV: E=Sophos;i="5.96,220,1665417600"; 
   d="scan'208";a="217980025"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 06 Dec 2022 14:46:43 +0800
IronPort-SDR: zj3IMeL7H1IUqHxzqqhjxDDjYfHXqcqPkJgmG2PVLz6fCvlByhIQx6lB8zpnIddffofXX4btCY
 MpC/jZbxTG9ZiLfJydvSXBQvWUcdNbMCEagzx+VQFbGwtQIWuZX+zzd1JsSRWa5zIC3+p+Ilr3
 V9iwAYzHpr6KVMNfd5R+3sjQ2GaX+i+WO1NNMyyMM5VLf7Vrs01DraNHkbM3MAVLVNoJu+6Stp
 Rc5JhrtTz8RurprFJAuUiZpat4sPyjdUEBvKW28CWqmCJuQbyxFj8mXnrfwusM0kb1oDwJJCct
 mps=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2022 21:59:31 -0800
IronPort-SDR: sjQ3aM1KwrD6rI6+xBOAOTA7X8XPTp/8HVTXxRvorrNG3mJEw8PLD2hrrIOQDS1Uk9Dvlt4Vl3
 WDGUH5IBmYpwJRc6m1NWxmG0fWsPXg7QmWPErxH0G/eM3bFu3ECMHEhd0gDbjLjgDrUNxIA7BA
 ZFzYlgHk8BUwmBFiSIKP5fQGUaKONA56x63HwRcx0M/ff/uprLXEKWOkM8Td3QLMovlqcj6JBx
 jlSsw7Hk9wkWEw2vnExYJ6cNMXIFSzVTYLM47lQlEh8gdLU0TEl4em0yqHUvV7jyAm5AEX1GiS
 HgU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2022 22:46:44 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NR9tq3Z7Lz1RvTp
        for <linux-ide@vger.kernel.org>; Mon,  5 Dec 2022 22:46:43 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1670309202; x=1672901203; bh=AzsErKObOeSdHVU0v+2ELRRiNknYBWmasc2
        TFqZExXk=; b=VYuF/8CiJ3Lrhvp7uvRKf8KKoqbLhlWoPhOBrCWDKZKwgyoRLid
        t6D9UMa3vdbAy9gOQ2q9nwje1ObwQML9LihKbmIV7mZCTN/h5aAmLUY4B5xmSxaA
        Za1WowfrhTtU1ta28/vZIf+AJz/v3VeoRkIsXEXWyRpFaRQvT/EQapLJx01txmjj
        oyldzBaogIJN9r23Wv+03NUYigTA7LzvzFlsomaRt2CRXTin9vxYGbCiDYe+T4Cv
        Ul00b1M/THk3A8cIpNpBIFsYdw34UGLZdm4JUk6Nzg7P4YD6mVxuQ3FgUOnRStNQ
        m3O4mvY81fYNGaRMEpOvWtwheXgZphAyRrw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 2ss2id8Zunai for <linux-ide@vger.kernel.org>;
        Mon,  5 Dec 2022 22:46:42 -0800 (PST)
Received: from [10.225.163.74] (unknown [10.225.163.74])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NR9tn5nrNz1RvLy;
        Mon,  5 Dec 2022 22:46:41 -0800 (PST)
Message-ID: <95785bc5-ac4b-9c44-74ea-6b3afb11cf14@opensource.wdc.com>
Date:   Tue, 6 Dec 2022 15:46:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] [v2] ata: ahci: fix enum constants for gcc-13
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Luis Machado <luis.machado@arm.com>, linux-ide@vger.kernel.org,
        stable@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
References: <20221203105425.180641-1-arnd@kernel.org>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20221203105425.180641-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 12/3/22 19:54, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-13 slightly changes the type of constant expressions that are defined
> in an enum, which triggers a compile time sanity check in libata:
> 
> linux/drivers/ata/libahci.c: In function 'ahci_led_store':
> linux/include/linux/compiler_types.h:357:45: error: call to '__compiletime_assert_302' declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)
> 357 | _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> 
> The new behavior is that sizeof() returns the same value for the
> constant as it does for the enum type, which is generally more sensible
> and consistent.
> 
> The problem in libata is that it contains a single enum definition for
> lots of unrelated constants, some of which are large positive (unsigned)
> integers like 0xffffffff, while others like (1<<31) are interpreted as
> negative integers, and this forces the enum type to become 64 bit wide
> even though most constants would still fit into a signed 32-bit 'int'.
> 
> Fix this by changing the entire enum definition to use BIT(x) in place
> of (1<<x), which results in all values being seen as 'unsigned' and
> fitting into an unsigned 32-bit type.
> 
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107917
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107405
> Reported-by: Luis Machado <luis.machado@arm.com>
> Cc: linux-ide@vger.kernel.org
> Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Cc: stable@vger.kernel.org
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to for-6.2. Thanks !

-- 
Damien Le Moal
Western Digital Research

