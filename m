Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE13E51F1AA
	for <lists+linux-ide@lfdr.de>; Sun,  8 May 2022 22:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232724AbiEHUpl (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 8 May 2022 16:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232305AbiEHUph (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 8 May 2022 16:45:37 -0400
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E62DAE5A
        for <linux-ide@vger.kernel.org>; Sun,  8 May 2022 13:41:43 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru DCC7A209A449
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
Subject: [PATCH 3/3] ata: make ata_port_info::{pio|mwdma|udma}_mask *unsigned int*
Date:   Sun, 8 May 2022 23:41:39 +0300
Message-ID: <20220508204139.4961-4-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20220508204139.4961-1-s.shtylyov@omp.ru>
References: <20220508204139.4961-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The {pio|mwdma|udma}_mask fields of the *struct* ata_port_info are declared
as *unsigned long* (which is a 64-bit type on 64-bit architectures) while
the actual masks should easily fit into just 8 bits. The alike fields in
the *struct* ata_port are declared as *unsigned int*, so there are silent
truncations going on in ata_host_alloc_pinfo() anyway... Using *unsigned*
*int* fields instead saves some object code in many LLDDs too...

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 include/linux/libata.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/libata.h b/include/linux/libata.h
index f6fc482d767a..6417f1fd4852 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -979,9 +979,9 @@ struct ata_port_operations {
 struct ata_port_info {
 	unsigned long		flags;
 	unsigned long		link_flags;
-	unsigned long		pio_mask;
-	unsigned long		mwdma_mask;
-	unsigned long		udma_mask;
+	unsigned int		pio_mask;
+	unsigned int		mwdma_mask;
+	unsigned int		udma_mask;
 	struct ata_port_operations *port_ops;
 	void 			*private_data;
 };
-- 
2.26.3

