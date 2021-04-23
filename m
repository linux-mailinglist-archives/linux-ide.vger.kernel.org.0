Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25453369B74
	for <lists+linux-ide@lfdr.de>; Fri, 23 Apr 2021 22:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232255AbhDWUnO (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 23 Apr 2021 16:43:14 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:59228 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231721AbhDWUnN (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 23 Apr 2021 16:43:13 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 16A5B205EE82
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH 2/2] tx4939ide: fix deferred probing
From:   Sergey Shtylyov <s.shtylyov@omprussia.ru>
To:     "David S. Miller" <davem@davemloft.net>,
        <linux-ide@vger.kernel.org>
References: <35757c7b-d25f-5ef6-0088-5b0fb568a0de@omprussia.ru>
Organization: Open Mobile Platform, LLC
Message-ID: <153446a9-a5a9-1ce5-b224-6e0d5dd14eff@omprussia.ru>
Date:   Fri, 23 Apr 2021 23:42:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <35757c7b-d25f-5ef6-0088-5b0fb568a0de@omprussia.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1908.lancloud.ru (fd00:f066::208)
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The driver overrides the error codes returned by platform_get_irq() to
-ENODEV, so if it returns -EPROBE_DEFER,  the driver will fail the probe
permanently instead of the deferred probing.  Switch to propagating the
error code upstream.

Fixes: 37897989232e ("ide: Add tx4939ide driver (v6)")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

---
 drivers/ide/tx4939ide.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: ide/drivers/ide/tx4939ide.c
===================================================================
--- ide.orig/drivers/ide/tx4939ide.c
+++ ide/drivers/ide/tx4939ide.c
@@ -543,7 +543,7 @@ static int __init tx4939ide_probe(struct
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return -ENODEV;
+		return irq;
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return -ENODEV;
