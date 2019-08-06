Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F83082DC1
	for <lists+linux-ide@lfdr.de>; Tue,  6 Aug 2019 10:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbfHFIbL (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 6 Aug 2019 04:31:11 -0400
Received: from gateway21.websitewelcome.com ([192.185.45.147]:18927 "EHLO
        gateway21.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726713AbfHFIbL (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 6 Aug 2019 04:31:11 -0400
X-Greylist: delayed 1378 seconds by postgrey-1.27 at vger.kernel.org; Tue, 06 Aug 2019 04:31:11 EDT
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway21.websitewelcome.com (Postfix) with ESMTP id EEDDC400CFFAC
        for <linux-ide@vger.kernel.org>; Tue,  6 Aug 2019 03:08:10 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id uuVuhIqdmdnCeuuVuhklIb; Tue, 06 Aug 2019 03:08:10 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tqouW1qc7UK4ejwDOesOIcmQuJMwuxvioRsJeeb5IM4=; b=jRJr7JqsYbSOKqd3gMKqlUEGdo
        P3OgHdi2UEwTbXofL3M+SRi1gJ2Z4GjkdghudNwCHsdYrMJkwpFcWX+0UbTYUX+g2UZYBDHMss7RY
        1v9RcUlL3gZI0JB/wonWbx1xTppZ7c0L5/luX6ETiDSh8PCNRtX/j04bfAx5Km1AjSASCjRQXvtKU
        wUmmu0YtI2mqcVQPswZx5+FrCe2CAUgQxi9y8xu+4J2WGaeKjzKpsr+GbBhAf8ySTfcs8Xj5AyCSU
        yabIKstVHzxCdxNqDLqDCNAXwfAO/3idG1hHr3reEdXk2bmjvHo+fU2n7tXGGVY68sT47qwcBqP1j
        CCkwmx0Q==;
Received: from [187.192.11.120] (port=43488 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1huuVt-000ibV-Rp; Tue, 06 Aug 2019 03:08:09 -0500
Date:   Tue, 6 Aug 2019 03:08:08 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jens Axboe <axboe@kernel.dk>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] ata: rb532_cf: Fix unused variable warning in
 rb532_pata_driver_probe
Message-ID: <20190806080808.GA30026@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1huuVt-000ibV-Rp
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:43488
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Fix the following warning (Building: rb532_defconfig mips):

drivers/ata/pata_rb532_cf.c: In function ‘rb532_pata_driver_remove’:
drivers/ata/pata_rb532_cf.c:161:24: warning: unused variable ‘info’ [-Wunused-variable]
  struct rb532_cf_info *info = ah->private_data;
                        ^~~~

Fixes: cd56f35e52d9 ("ata: rb532_cf: Convert to use GPIO descriptors")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/ata/pata_rb532_cf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ata/pata_rb532_cf.c b/drivers/ata/pata_rb532_cf.c
index 7c37f2ff09e4..deae466395de 100644
--- a/drivers/ata/pata_rb532_cf.c
+++ b/drivers/ata/pata_rb532_cf.c
@@ -158,7 +158,6 @@ static int rb532_pata_driver_probe(struct platform_device *pdev)
 static int rb532_pata_driver_remove(struct platform_device *pdev)
 {
 	struct ata_host *ah = platform_get_drvdata(pdev);
-	struct rb532_cf_info *info = ah->private_data;
 
 	ata_host_detach(ah);
 
-- 
2.22.0

