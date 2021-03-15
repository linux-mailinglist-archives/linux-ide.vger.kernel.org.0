Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE43833C784
	for <lists+linux-ide@lfdr.de>; Mon, 15 Mar 2021 21:15:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhCOUPZ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 15 Mar 2021 16:15:25 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:60474 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231867AbhCOUPI (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 15 Mar 2021 16:15:08 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 4E639209B9AF
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omprussia.ru>
Subject: [PATCH v2] ata: libahci_platform: fix IRQ check
To:     Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        <linux-ide@vger.kernel.org>
Organization: Open Mobile Platform, LLC
Message-ID: <4448c8cc-331f-2915-0e17-38ea34e251c8@omprussia.ru>
Date:   Mon, 15 Mar 2021 23:15:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1908.lancloud.ru (fd00:f066::208)
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Iff platform_get_irq() returns 0, ahci_platform_init_host() would return 0
early (as if the call was successful). Override IRQ0 with -EINVAL instead
as the 'libata' regards 0 as "no IRQ" (thus polling) anyway...

Fixes: c034640a32f8 ("ata: libahci: properly propagate return value of platform_get_irq()")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

---
Changes in version 2:
- added the "Fixes:" tag.

This patch is against the 'master' branch of Jens Axboe's 'linux-block.git'
repo.

 drivers/ata/libahci_platform.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: linux-block/drivers/ata/libahci_platform.c
===================================================================
--- linux-block.orig/drivers/ata/libahci_platform.c
+++ linux-block/drivers/ata/libahci_platform.c
@@ -582,11 +582,13 @@ int ahci_platform_init_host(struct platf
 	int i, irq, n_ports, rc;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
+	if (irq < 0) {
 		if (irq != -EPROBE_DEFER)
 			dev_err(dev, "no irq\n");
 		return irq;
 	}
+	if (!irq)
+		return -EINVAL;
 
 	hpriv->irq = irq;
 
