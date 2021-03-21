Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDFF343436
	for <lists+linux-ide@lfdr.de>; Sun, 21 Mar 2021 19:56:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhCUSz5 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 21 Mar 2021 14:55:57 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:47026 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbhCUSzv (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 21 Mar 2021 14:55:51 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 50B14205FD45
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH 2/4] pata_ep93xx: deny IRQ0
From:   Sergey Shtylyov <s.shtylyov@omprussia.ru>
To:     Jens Axboe <axboe@kernel.dk>, <linux-ide@vger.kernel.org>
References: <2e552c36-84a5-a642-a8f0-1395f77a1a6a@omprussia.ru>
Organization: Open Mobile Platform, LLC
Message-ID: <747c195a-25b9-1cc0-e65e-f66225b91c28@omprussia.ru>
Date:   Sun, 21 Mar 2021 21:55:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2e552c36-84a5-a642-a8f0-1395f77a1a6a@omprussia.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1908.lancloud.ru (fd00:f066::208)
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
the driver blithely passes it to ata_host_activate() that treats IRQ0 as
a sign that libata should use polling and thus complains about non-NULL 
IRQ handler passed to it. Deny IRQ0 right away, returning -EINVAL from
the probe() method...

Fixes: 2fff27512600 ("PATA host controller driver for ep93xx")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

---
 drivers/ata/pata_ep93xx.c |    4 ++++
 1 file changed, 4 insertions(+)

Index: linux-block/drivers/ata/pata_ep93xx.c
===================================================================
--- linux-block.orig/drivers/ata/pata_ep93xx.c
+++ linux-block/drivers/ata/pata_ep93xx.c
@@ -931,6 +931,10 @@ static int ep93xx_pata_probe(struct plat
 		err = irq;
 		goto err_rel_gpio;
 	}
+	if (!irq) {
+		err = -EINVAL;
+		goto err_rel_gpio;
+	}
 
 	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ide_base = devm_ioremap_resource(&pdev->dev, mem_res);
