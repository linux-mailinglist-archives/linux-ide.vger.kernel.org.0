Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC7B0626F9
	for <lists+linux-ide@lfdr.de>; Mon,  8 Jul 2019 19:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729574AbfGHRSX (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 8 Jul 2019 13:18:23 -0400
Received: from enpas.org ([46.38.239.100]:47980 "EHLO mail.enpas.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727646AbfGHRSW (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Mon, 8 Jul 2019 13:18:22 -0400
X-Greylist: delayed 481 seconds by postgrey-1.27 at vger.kernel.org; Mon, 08 Jul 2019 13:18:22 EDT
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by mail.enpas.org (Postfix) with ESMTPSA id 6C3C6100077
        for <linux-ide@vger.kernel.org>; Mon,  8 Jul 2019 17:10:20 +0000 (UTC)
To:     linux-ide@vger.kernel.org
From:   Max Staudt <max-linux@enpas.org>
Subject: Legacy IDE driver for Buddha IDE is still in use
Message-ID: <6c74d6b1-1dad-e76e-6499-b677991c40c4@enpas.org>
Date:   Mon, 8 Jul 2019 19:10:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi [linux-ide],

Just popping in to respond to your deprecating the legacy IDE stack [1].


First of all, thanks for providing a grace period and for pointing people to [linux-ide].

I'd like to mention that there are still users left for the Buddha IDE controller for the Amiga (at least myself), and its driver [2] has still not been ported to libata.

Given that the Buddha IDE has been re-released in 2018 and is still being produced in 2019 [3, 4], I'd say this card is far from dead. As for the Amiga itself, a kernel as recent as 4.19 (from Debian sid) boots on my Amiga 2000 quite nicely - great work!


For the time being, I'd just like to raise my hand and say "yes, this driver is still in use". Maybe I'll get to port it in the future, but until then I have to tend to other things first.


Thanks for keeping the IDE stack alive,

Max



[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7ad19a99ad431b5cae005c30b09096517058e84e

[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/ide/buddha.c

[3] https://icomp.de/shop-icomp/en/shop/product/buddha-ide.html

[4] https://icomp.de/shop-icomp/en/33/items/buddha-flash-software-update-89.html

