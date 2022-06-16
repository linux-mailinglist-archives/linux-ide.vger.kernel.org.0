Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2CAF54EB9F
	for <lists+linux-ide@lfdr.de>; Thu, 16 Jun 2022 22:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbiFPUwG (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 16 Jun 2022 16:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbiFPUwF (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 16 Jun 2022 16:52:05 -0400
Received: from mxout02.lancloud.ru (mxout02.lancloud.ru [45.84.86.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 368485FF0B
        for <linux-ide@vger.kernel.org>; Thu, 16 Jun 2022 13:52:00 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 56C06229B7CB
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
Subject: [PATCH 2/2] ata: make ata_port::fastdrain_cnt *unsigned int*
Date:   Thu, 16 Jun 2022 23:51:49 +0300
Message-ID: <20220616205149.16157-3-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20220616205149.16157-1-s.shtylyov@omp.ru>
References: <20220616205149.16157-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1902.lancloud.ru (fd00:f066::72)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

*unsigned long* ata_port::fastdrain_cnt (64-bit value in a 64-bit kernel)
is always assigned from the 32-bit *unsigned int* variables, thus could
also be made just *unsigned int*...

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 include/linux/libata.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/libata.h b/include/linux/libata.h
index 0f2a59c9c735..d214aa988168 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -850,7 +850,7 @@ struct ata_port {
 	enum ata_lpm_policy	target_lpm_policy;
 
 	struct timer_list	fastdrain_timer;
-	unsigned long		fastdrain_cnt;
+	unsigned int		fastdrain_cnt;
 
 	async_cookie_t		cookie;
 
-- 
2.26.3
