Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E15237C146
	for <lists+linux-ide@lfdr.de>; Wed, 31 Jul 2019 14:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387509AbfGaM05 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 31 Jul 2019 08:26:57 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:60997 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387423AbfGaM05 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 31 Jul 2019 08:26:57 -0400
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id AD55D240003;
        Wed, 31 Jul 2019 12:26:54 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc:     linux-ide@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] ata: libahci: do not complain in case of deferred probe
Date:   Wed, 31 Jul 2019 14:26:51 +0200
Message-Id: <20190731122651.3378-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Retrieving PHYs can deffer the probe, do not spawn an error when
-EPROBE_DEFER is returned, it is normal behavior.

Fixes: b1a9edbda040 ("ata: libahci: allow to use multiple PHYs")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/ata/libahci_platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platform.c
index 72312ad2e142..c25cdbf817f1 100644
--- a/drivers/ata/libahci_platform.c
+++ b/drivers/ata/libahci_platform.c
@@ -338,6 +338,9 @@ static int ahci_platform_get_phy(struct ahci_host_priv *hpriv, u32 port,
 		hpriv->phys[port] = NULL;
 		rc = 0;
 		break;
+	case -EPROBE_DEFER:
+		/* Do not complain yet */
+		break;
 
 	default:
 		dev_err(dev,
-- 
2.20.1

