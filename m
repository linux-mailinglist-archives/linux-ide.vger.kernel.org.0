Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8D294AFEBD
	for <lists+linux-ide@lfdr.de>; Wed,  9 Feb 2022 21:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232424AbiBIUyC (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 9 Feb 2022 15:54:02 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:36008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232425AbiBIUxy (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 9 Feb 2022 15:53:54 -0500
Received: from mxout01.lancloud.ru (mxout01.lancloud.ru [45.84.86.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BB6C0045A5
        for <linux-ide@vger.kernel.org>; Wed,  9 Feb 2022 12:53:55 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 24CDE209D2CC
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
Subject: [PATCH 1/2] ata: pata_hpt3x2n: drop unused HPT_PCI_FAST
Date:   Wed, 9 Feb 2022 23:53:50 +0300
Message-ID: <20220209205351.10912-2-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20220209205351.10912-1-s.shtylyov@omp.ru>
References: <20220209205351.10912-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
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

The driver has never used HPT_PCI_FAST -- drop it.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/ata/pata_hpt3x2n.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ata/pata_hpt3x2n.c b/drivers/ata/pata_hpt3x2n.c
index 1d9d4eec5b8a..ab089b79fa20 100644
--- a/drivers/ata/pata_hpt3x2n.c
+++ b/drivers/ata/pata_hpt3x2n.c
@@ -27,7 +27,6 @@
 #define DRV_VERSION	"0.3.15"
 
 enum {
-	HPT_PCI_FAST	=	(1 << 31),
 	PCI66		=	(1 << 1),
 	USE_DPLL	=	(1 << 0)
 };
-- 
2.26.3

