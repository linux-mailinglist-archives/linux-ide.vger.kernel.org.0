Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC9EE393582
	for <lists+linux-ide@lfdr.de>; Thu, 27 May 2021 20:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233827AbhE0SlX (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 27 May 2021 14:41:23 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:51644 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbhE0SlW (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 27 May 2021 14:41:22 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 829A420669A3
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v2] pata_ep93xx: fix deferred probing
To:     Sergey Shtylyov <s.shtylyov@omprussia.ru>,
        Jens Axboe <axboe@kernel.dk>, <linux-ide@vger.kernel.org>
References: <509fda88-2e0d-2cc7-f411-695d7e94b136@omprussia.ru>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <946c838b-0a9f-dfd0-70ac-a0c67c57deea@omp.ru>
Date:   Thu, 27 May 2021 21:39:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <509fda88-2e0d-2cc7-f411-695d7e94b136@omprussia.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1908.lancloud.ru (fd00:f066::208)
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hello!

On 3/20/21 11:32 PM, Sergey Shtylyov wrote:

> The driver overrides the error codes returned by platform_get_irq() to
> -ENXIO, so if it returns -EPROBE_DEFER, the driver would fail the probe
> permanently instead of the deferred probing.  Propagate the error code
> upstream, as it should have been done from the start...
> 
> Fixes: 2fff27512600 ("PATA host controller driver for ep93xx")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

   Again, 2 months has passed and no feedback whatsoever... the patch has fell
thru the cracks?

MBR, Sergey
