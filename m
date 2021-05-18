Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D70D7387FA7
	for <lists+linux-ide@lfdr.de>; Tue, 18 May 2021 20:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235962AbhERSd6 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 18 May 2021 14:33:58 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:52358 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234536AbhERSd5 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 18 May 2021 14:33:57 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru F1008206F618
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] pata_rb532_cf: fix deferred probing
To:     Sergey Shtylyov <s.shtylyov@omprussia.ru>,
        Jens Axboe <axboe@kernel.dk>, <linux-ide@vger.kernel.org>
References: <771ced55-3efb-21f5-f21c-b99920aae611@omprussia.ru>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <1f82776f-6d61-284c-018c-ef7c00fa284a@omp.ru>
Date:   Tue, 18 May 2021 21:32:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <771ced55-3efb-21f5-f21c-b99920aae611@omprussia.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1908.lancloud.ru (fd00:f066::208)
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 3/15/21 2:46 PM, Sergey Shtylyov wrote:

> The driver overrides the error codes returned by platform_get_irq() to
> -ENOENT, so if it returns -EPROBE_DEFER, the driver would fail the probe
> permanently instead of the deferred probing. Switch to propagating the
> error code upstream, still checking/overriding IRQ0 as libata regards it
> as "no IRQ" (thus polling) anyway...
> 
> Fixes: 9ec36cafe43b ("of/irq: do irq resolution in platform_get_irq")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>
[...]

   Again, 2 months have passed, and it seems the patch has been lost somewhere...

MNR, Sergey
