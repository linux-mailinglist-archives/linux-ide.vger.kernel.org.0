Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6FD400EDE
	for <lists+linux-ide@lfdr.de>; Sun,  5 Sep 2021 11:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233856AbhIEJst (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 5 Sep 2021 05:48:49 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:44864 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbhIEJst (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 5 Sep 2021 05:48:49 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru DB4B720E7B56
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 0/4] Explicitly deny IRQ0 in the libata drivers
To:     Jens Axboe <axboe@kernel.dk>, Sergey Shtylyov <s.shtylyov@omp.ru>,
        "Sergey Shtylyov" <s.shtylyov@omprussia.ru>,
        <linux-ide@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <2e552c36-84a5-a642-a8f0-1395f77a1a6a@omprussia.ru>
 <e167d421-1456-9211-86ff-979792245b48@omp.ru>
 <86087864-2023-890b-5e9e-f229aa4b9db6@omp.ru>
 <63a4cec1-26e7-2f95-1de6-6ba5adb013f9@kernel.dk>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <96800f75-9d0f-5b57-7f54-2f3b375eb21b@omp.ru>
Date:   Sun, 5 Sep 2021 12:47:37 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <63a4cec1-26e7-2f95-1de6-6ba5adb013f9@kernel.dk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 05.09.2021 0:25, Jens Axboe wrote:

[...]
>>>     What about this series?
>>>     I got no feedback whatsoever -- it seems to have been lost.
>>
>>     Almost 4 months have paseed from this reminder. Still no commnets whatsoever...
> 
> You did get a review almost immediately, but it wasn't responded to.

     Oh, seeing it now (again)! Indeed, I forgot to reply back then, sorry!

MBR, Sergey
