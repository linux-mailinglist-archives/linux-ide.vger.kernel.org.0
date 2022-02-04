Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C82AA4A9935
	for <lists+linux-ide@lfdr.de>; Fri,  4 Feb 2022 13:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358717AbiBDMYU (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 4 Feb 2022 07:24:20 -0500
Received: from mxout02.lancloud.ru ([45.84.86.82]:48272 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237442AbiBDMYU (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 4 Feb 2022 07:24:20 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru A6CC1235C292
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v2] libata: use *switch* in artop_init_one()
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
Organization: Open Mobile Platform
Message-ID: <660a1f84-5607-0f9a-be70-e0407c3d85e2@omp.ru>
Date:   Fri, 4 Feb 2022 15:24:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

This driver uses a string of the *if* statements where a *switch* statement
fits better...

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'for-next' branch of Damien Le Moal's 'libata.git'
repo.

Changes in version 2:
- updated #define DRV_VERSION.


 drivers/ata/pata_artop.c |   24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

Index: libata/drivers/ata/pata_artop.c
===================================================================
--- libata.orig/drivers/ata/pata_artop.c
+++ libata/drivers/ata/pata_artop.c
@@ -28,7 +28,7 @@
 #include <linux/ata.h>
 
 #define DRV_NAME	"pata_artop"
-#define DRV_VERSION	"0.4.6"
+#define DRV_VERSION	"0.4.7"
 
 /*
  *	The ARTOP has 33 Mhz and "over clocked" timing tables. Until we
@@ -394,16 +394,22 @@ static int artop_init_one (struct pci_de
 	if (rc)
 		return rc;
 
-	if (id->driver_data == 0)	/* 6210 variant */
+	switch (id->driver_data) {
+	case 0:		/* 6210 variant */
 		ppi[0] = &info_6210;
-	else if (id->driver_data == 1)	/* 6260 */
+		break;
+	case 1:		/* 6260 */
 		ppi[0] = &info_626x;
-	else if (id->driver_data == 2)	{ /* 6280 or 6280 + fast */
-		unsigned long io = pci_resource_start(pdev, 4);
-
-		ppi[0] = &info_628x;
-		if (inb(io) & 0x10)
-			ppi[0] = &info_628x_fast;
+		break;
+	case 2:		/* 6280 or 6280 + fast */
+		{
+			unsigned long io = pci_resource_start(pdev, 4);
+
+			ppi[0] = &info_628x;
+			if (inb(io) & 0x10)
+				ppi[0] = &info_628x_fast;
+		}
+		break;
 	}
 
 	BUG_ON(ppi[0] == NULL);
