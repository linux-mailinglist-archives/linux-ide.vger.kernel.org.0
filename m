Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5DA334342E
	for <lists+linux-ide@lfdr.de>; Sun, 21 Mar 2021 19:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhCUSvA (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 21 Mar 2021 14:51:00 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:43746 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbhCUSum (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 21 Mar 2021 14:50:42 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru B0D92205F338
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
To:     Jens Axboe <axboe@kernel.dk>, <linux-ide@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "NXP Linux Team" <linux-imx@nxp.com>,
        <linux-arm-kernel@lists.infradead.org>
From:   Sergey Shtylyov <s.shtylyov@omprussia.ru>
Subject: [PATCH 0/4] Explicitly deny IRQ0 in the libata drivers
Organization: Open Mobile Platform, LLC
Message-ID: <2e552c36-84a5-a642-a8f0-1395f77a1a6a@omprussia.ru>
Date:   Sun, 21 Mar 2021 21:50:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1908.lancloud.ru (fd00:f066::208)
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Here are 4 patches against the 'master' branch of the Jens Axboe's 'linux-blobk.git'
repo plus the 'pataep_93xx' driver patch re-posted yesterday.  The affected drivers
use platform_get_irq() which may return IRQ0 (considered invalid, according to Linus)
that means polling when passed to ata_host_activate() called at the end of the probe
methods. I think that the solution to this issue is to explicitly deny IRQ0 returned
by platform_get_irq()...

[1/4] pata_bk3710: deny IRQ0
[2/4] pata_ep93xx: deny IRQ0
[3/4] pata_ftide010: deny IRQ0
[4/4] pata_imx: deny IRQ0

