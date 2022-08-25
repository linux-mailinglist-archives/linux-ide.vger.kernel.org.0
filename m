Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8D15A14DA
	for <lists+linux-ide@lfdr.de>; Thu, 25 Aug 2022 16:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235500AbiHYOwm (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 25 Aug 2022 10:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234556AbiHYOwm (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 25 Aug 2022 10:52:42 -0400
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8F4B4407
        for <linux-ide@vger.kernel.org>; Thu, 25 Aug 2022 07:52:40 -0700 (PDT)
X-QQ-mid: bizesmtp72t1661439143txrca0sn
Received: from localhost.localdomain ( [182.148.14.124])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Thu, 25 Aug 2022 22:52:16 +0800 (CST)
X-QQ-SSF: 01000000002000B0C000B00A0000000
X-QQ-FEAT: +ynUkgUhZJnEiWTGt3s4ZveE3rPhrTCFH2l+bssblUgdiU0woy+XW1KjykACW
        roRiTrDzK4mWkO+pbbzgiW+L/6qo9ye/v+tWti9mt2+BNtcxakohisDx+ooPcoX/mUdT3ui
        pOUkEOYwGFqF4TfZWcgREzFX/ER389QAy6zJ09PDclSngTzExXJWibXXEvtxxoiwmEsHfXz
        RjiqRVzqCC161VkZFCNhClk5NFmXcKfs36tpxGsUiLJh/Xvjyx9LqvT8w/Zk0UN7VoFTADd
        kj687f4KipMICJBl+MJEhy8wEobsqUGfa3yfkjEsDI+jZT9WivEqx9PokVg18EkZYKchxV0
        PnbJqVuTwzrr7DoIVNSkM2/JsPczJy4vwqk9M+wZUMozENBgVfDqWeILSaAcY9DPPpZKSiW
X-QQ-GoodBg: 0
From:   Shaomin Deng <dengshaomin@cdjrlc.com>
To:     damien.lemoal@opensource.wdc.com, linux-ide@vger.kernel.org
Cc:     s.shtylyov@omp.ru, Shaomin Deng <dengshaomin@cdjrlc.com>
Subject: [PATCH] ata: pata_macio: Remove unneeded word in comments
Date:   Thu, 25 Aug 2022 10:52:15 -0400
Message-Id: <20220825145215.5542-1-dengshaomin@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

There is unneeded word "to" in line 669, so remove it.

Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
---
 drivers/ata/pata_macio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
index bfea2be2959a..076212fdb9d9 100644
--- a/drivers/ata/pata_macio.c
+++ b/drivers/ata/pata_macio.c
@@ -666,7 +666,7 @@ static u8 pata_macio_bmdma_status(struct ata_port *ap)
 	 * a multi-block transfer.
 	 *
 	 * - The dbdma fifo hasn't yet finished flushing to
-	 * to system memory when the disk interrupt occurs.
+	 * system memory when the disk interrupt occurs.
 	 *
 	 */
 
-- 
2.35.1

