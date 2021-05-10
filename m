Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC9D37989F
	for <lists+linux-ide@lfdr.de>; Mon, 10 May 2021 22:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232335AbhEJU44 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 10 May 2021 16:56:56 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:32940 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbhEJU44 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 10 May 2021 16:56:56 -0400
X-Greylist: delayed 465 seconds by postgrey-1.27 at vger.kernel.org; Mon, 10 May 2021 16:56:55 EDT
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 1E02F20D2975
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 0/4] Explicitly deny IRQ0 in the libata drivers
To:     Sergey Shtylyov <s.shtylyov@omprussia.ru>,
        Jens Axboe <axboe@kernel.dk>, <linux-ide@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <2e552c36-84a5-a642-a8f0-1395f77a1a6a@omprussia.ru>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <e167d421-1456-9211-86ff-979792245b48@omp.ru>
Date:   Mon, 10 May 2021 23:48:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2e552c36-84a5-a642-a8f0-1395f77a1a6a@omprussia.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1908.lancloud.ru (fd00:f066::208)
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hello!

   What about this series?
   I got no feedback whatsoever -- it seems to have been lost.

On 3/21/21 9:50 PM, Sergey Shtylyov wrote:

> Here are 4 patches against the 'master' branch of the Jens Axboe's 'linux-blobk.git'
> repo plus the 'pataep_93xx' driver patch re-posted yesterday.  The affected drivers
> use platform_get_irq() which may return IRQ0 (considered invalid, according to Linus)
> that means polling when passed to ata_host_activate() called at the end of the probe
> methods.

   I might not have been clear enough: 'irq == 0' means that the libata core would WARN about
the non-NULL 'handler' paramter which seems a to be a problem...

> I think that the solution to this issue is to explicitly deny IRQ0 returned
> by platform_get_irq()...
[...]

MBR, Sergei
