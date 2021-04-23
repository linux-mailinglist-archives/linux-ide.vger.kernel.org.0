Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9681369B6E
	for <lists+linux-ide@lfdr.de>; Fri, 23 Apr 2021 22:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbhDWUmQ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 23 Apr 2021 16:42:16 -0400
Received: from mxout04.lancloud.ru ([45.84.86.114]:47170 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232255AbhDWUmN (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 23 Apr 2021 16:42:13 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 6361B20B6560
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH 1/2] tx4938ide: fix deferred probing
From:   Sergey Shtylyov <s.shtylyov@omprussia.ru>
To:     "David S. Miller" <davem@davemloft.net>,
        <linux-ide@vger.kernel.org>
References: <35757c7b-d25f-5ef6-0088-5b0fb568a0de@omprussia.ru>
Organization: Open Mobile Platform, LLC
Message-ID: <85faea4c-4165-2a3f-1806-8f6d3f9d4de5@omprussia.ru>
Date:   Fri, 23 Apr 2021 23:41:32 +0300
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

Fixes: 28502848f52f ("ide: Add tx4938ide driver (v2)")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

---
 drivers/ide/tx4938ide.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: ide/drivers/ide/tx4938ide.c
===================================================================
--- ide.orig/drivers/ide/tx4938ide.c
+++ ide/drivers/ide/tx4938ide.c
@@ -139,7 +139,7 @@ static int __init tx4938ide_probe(struct
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return -ENODEV;
+		return irq;
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return -ENODEV;
