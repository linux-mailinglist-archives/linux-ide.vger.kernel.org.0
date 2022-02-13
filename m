Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85ADE4B3B2C
	for <lists+linux-ide@lfdr.de>; Sun, 13 Feb 2022 12:50:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231678AbiBMLuN (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 13 Feb 2022 06:50:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbiBMLuN (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 13 Feb 2022 06:50:13 -0500
Received: from mxout01.lancloud.ru (mxout01.lancloud.ru [45.84.86.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4A05B895
        for <linux-ide@vger.kernel.org>; Sun, 13 Feb 2022 03:50:04 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru E76FE20DDDD3
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] ata: libata-sff: make ata_resources_present() return 'bool'
Organization: Open Mobile Platform
Message-ID: <7f7ed86e-16a4-3f5c-67d8-8fbc49bb626c@omp.ru>
Date:   Sun, 13 Feb 2022 14:50:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

ata_resources_present() returns 1 if the primary/secondary channel's PCI
resources are present,  0 if not -- the 'bool' type fits somewhat better
here than 'int'...

Use the *= operator, while at it...

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'for-next' branch of Damien Le Moal's 'libata.git'
repo.

 drivers/ata/libata-sff.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

Index: libata/drivers/ata/libata-sff.c
===================================================================
--- libata.orig/drivers/ata/libata-sff.c
+++ libata/drivers/ata/libata-sff.c
@@ -2174,18 +2174,18 @@ EXPORT_SYMBOL_GPL(ata_sff_std_ports);
 
 #ifdef CONFIG_PCI
 
-static int ata_resources_present(struct pci_dev *pdev, int port)
+static bool ata_resources_present(struct pci_dev *pdev, int port)
 {
 	int i;
 
 	/* Check the PCI resources for this channel are enabled */
-	port = port * 2;
+	port *= 2;
 	for (i = 0; i < 2; i++) {
 		if (pci_resource_start(pdev, port + i) == 0 ||
 		    pci_resource_len(pdev, port + i) == 0)
-			return 0;
+			return false;
 	}
-	return 1;
+	return true;
 }
 
 /**
