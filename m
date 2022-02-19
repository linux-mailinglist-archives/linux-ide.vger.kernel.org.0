Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 938B14BC991
	for <lists+linux-ide@lfdr.de>; Sat, 19 Feb 2022 18:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242247AbiBSRpJ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 19 Feb 2022 12:45:09 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241151AbiBSRpJ (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 19 Feb 2022 12:45:09 -0500
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1363147AE3
        for <linux-ide@vger.kernel.org>; Sat, 19 Feb 2022 09:44:46 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 7961020991ED
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] ata: pata_hpt37x: disable primary channel on HPT371
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
Organization: Open Mobile Platform
Message-ID: <e398d6e3-05f2-409f-6818-812f24e325eb@omp.ru>
Date:   Sat, 19 Feb 2022 20:44:43 +0300
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

HPT371 chips physically have only one channel, the secondary one, however
the primary channel registers do exist!  Thus we have to manually disable
the non-existing channel (if the BIOS hasn't done this already).  Alan Cox
has only added such code to the 'pata_hpt3x2n' driver, forgetting about
this one... :-/

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'for-next' branch of Damien Le Moal's 'libata.git'
repo.

 drivers/ata/pata_hpt37x.c |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

Index: libata/drivers/ata/pata_hpt37x.c
===================================================================
--- libata.orig/drivers/ata/pata_hpt37x.c
+++ libata/drivers/ata/pata_hpt37x.c
@@ -867,6 +867,20 @@ static int hpt37x_init_one(struct pci_de
 	pci_write_config_byte(dev, 0x5a, irqmask);
 
 	/*
+	 * HPT371 chips physically have only one channel, the secondary one,
+	 * but the primary channel registers do exist!  Go figure...
+	 * So,  we manually disable the non-existing channel here
+	 * (if the BIOS hasn't done this already).
+	 */
+	if (dev->device == PCI_DEVICE_ID_TTI_HPT371) {
+		u8 mcr1;
+
+		pci_read_config_byte(dev, 0x50, &mcr1);
+		mcr1 &= ~0x04;
+		pci_write_config_byte(dev, 0x50, mcr1);
+	}
+
+	/*
 	 * default to pci clock. make sure MA15/16 are set to output
 	 * to prevent drives having problems with 40-pin cables. Needed
 	 * for some drives such as IBM-DTLA which will not enter ready
