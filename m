Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0E04769161
	for <lists+linux-ide@lfdr.de>; Mon, 31 Jul 2023 11:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbjGaJSJ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 31 Jul 2023 05:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232069AbjGaJRk (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 31 Jul 2023 05:17:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCE2B19F
        for <linux-ide@vger.kernel.org>; Mon, 31 Jul 2023 02:16:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qQP1B-0000A7-4C; Mon, 31 Jul 2023 11:16:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qQP19-0005kX-Iv; Mon, 31 Jul 2023 11:16:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qQP18-009GVJ-KT; Mon, 31 Jul 2023 11:16:42 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Viresh Kumar <vireshk@kernel.org>,
        Damien Le Moal <dlemoal@kernel.org>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 01/12] ata/pata_arasan_cf: Convert to platform remove callback returning void
Date:   Mon, 31 Jul 2023 11:16:25 +0200
Message-Id: <20230731091636.693193-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731091636.693193-1-u.kleine-koenig@pengutronix.de>
References: <20230731091636.693193-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=4RHNeQCZmIXpEzfkugYOx61xCrtB/xVdCw8NHrfU6Fw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkx3t+MmXRbAdgjz9qQTxvnpbmNPva6uTT+GUCz 4Cno0brsDmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMd7fgAKCRCPgPtYfRL+ TvdpB/sEaSuztyYIURteHavQLXkA/hec5jJei7RxUegIMNFhcFepFpTOIgepgnur9ym3rWWp+WZ +WweF2L0fQm/XlXmqveMcw2vylhv7GzR8HrHuxbAUmhFdBKjlIhKXFSbWHpxFn/b1P4hG/ngIwv 8MMyRSL36n52fhqneWceoi/Kz0kjQ/i1BC1aU4i/YBt7B2L28eQPaty7200tqvHw5VEYpNMQB4+ PElcf+ZgslVTBRV5lhrPg7NhQRDUqTXeoVz/+qBQXsbmhJebvvDWxyqF1jSNw/Qad7RDdKuv8dq EppaZeKkq5NStX91Ac5+Og226hCbxSS1Igpw7SDxdJ1E6xOH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-ide@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/ata/pata_arasan_cf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/pata_arasan_cf.c b/drivers/ata/pata_arasan_cf.c
index 6ab294322e79..e11eea2e749a 100644
--- a/drivers/ata/pata_arasan_cf.c
+++ b/drivers/ata/pata_arasan_cf.c
@@ -916,15 +916,13 @@ static int arasan_cf_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int arasan_cf_remove(struct platform_device *pdev)
+static void arasan_cf_remove(struct platform_device *pdev)
 {
 	struct ata_host *host = platform_get_drvdata(pdev);
 	struct arasan_cf_dev *acdev = host->ports[0]->private_data;
 
 	ata_host_detach(host);
 	cf_exit(acdev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -965,7 +963,7 @@ MODULE_DEVICE_TABLE(of, arasan_cf_id_table);
 
 static struct platform_driver arasan_cf_driver = {
 	.probe		= arasan_cf_probe,
-	.remove		= arasan_cf_remove,
+	.remove_new	= arasan_cf_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.pm	= &arasan_cf_pm_ops,
-- 
2.39.2

