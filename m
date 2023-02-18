Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A588669BD45
	for <lists+linux-ide@lfdr.de>; Sat, 18 Feb 2023 23:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbjBRWCK (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 18 Feb 2023 17:02:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjBRWCH (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 18 Feb 2023 17:02:07 -0500
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6E26D12874;
        Sat, 18 Feb 2023 14:02:04 -0800 (PST)
Received: from gsql.ggedos.sk (off-20.infotel.telecom.sk [212.5.213.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by hosting.gsystem.sk (Postfix) with ESMTPSA id 4FFBB7A0400;
        Sat, 18 Feb 2023 23:02:02 +0100 (CET)
From:   Ondrej Zary <linux@zary.sk>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Jens Axboe <axboe@kernel.dk>, Tim Waugh <tim@cyberelk.net>,
        linux-block@vger.kernel.org, linux-parport@lists.infradead.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/18] pata_parport: fix EPAT C7/C8 Kconfig
Date:   Sat, 18 Feb 2023 23:01:21 +0100
Message-Id: <20230218220138.5692-2-linux@zary.sk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230218220138.5692-1-linux@zary.sk>
References: <20230218220138.5692-1-linux@zary.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

CONFIG_PARIDE_EPATC8 was renamed to CONFIG_PATA_PARPORT_EPATC8 but
epat.c was not updated to reflect that. Update it.

Reported-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Ondrej Zary <linux@zary.sk>
---
 drivers/ata/pata_parport/epat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/pata_parport/epat.c b/drivers/ata/pata_parport/epat.c
index 6ce2dee7657f..93ee91d9338b 100644
--- a/drivers/ata/pata_parport/epat.c
+++ b/drivers/ata/pata_parport/epat.c
@@ -324,7 +324,7 @@ static struct pi_protocol epat = {
 
 static int __init epat_init(void)
 {
-#ifdef CONFIG_PARIDE_EPATC8
+#ifdef CONFIG_PATA_PARPORT_EPATC8
 	epatc8 = 1;
 #endif
 	return paride_register(&epat);
-- 
Ondrej Zary

