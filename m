Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 220F33E9CA7
	for <lists+linux-ide@lfdr.de>; Thu, 12 Aug 2021 04:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233716AbhHLCoc (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 11 Aug 2021 22:44:32 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:60783 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233659AbhHLCob (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 11 Aug 2021 22:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1628736246; x=1660272246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EIH026mlpK847URWOEkIJeSWTxgkrb13VQ8oOv5tb/A=;
  b=Vj11t3r3g2tHt9sgyIQ5pf8963uNdyoOxF5DvTun8Qp0K0ASUPtD8Gi9
   6XcVpIip94NoqB5qDEMuq0nS1U7HhifhL1NweD8Q/8NmA6Y1rKrX1tgUW
   Ab/E39won4aKbddw8lLyZKJXE6e4FoxwSIQ6asSvWeuWzDCGsYeCX9nHF
   PygU6wvE0RMHB/f+wqmhU7jfQAM6kSyZCmValebf7valRiQp2tK7b8TX2
   mpdivSxvjdZLF6cte70mTn5SJbgZTbcLb4QKb4TcycdBYdFKN4T85Q1dL
   npWFtdeubem/NaWQd/4X+g7Pu9ul9P94mZpJiK0gavlbG/5hAHggU9Eub
   A==;
X-IronPort-AV: E=Sophos;i="5.84,314,1620662400"; 
   d="scan'208";a="176999859"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 12 Aug 2021 10:44:06 +0800
IronPort-SDR: WhqVUhbcYnFxY+5i9pJf0DrlqT1nPcdtjMG412rmcog+YtPzqFjA4QMQXmA+28RsYIldSMQCs+
 loNqvj/t5mCKG5io1sTgxmvG0w3PHvoOcbQqUtwhW7Vs4LYOa+Ew1SeS17ceKeQN31mlWLa7Cf
 +TTnDH7IpPfSGht1ap6koxYiT9jpLgw7N9CxJH37722KlmUihM2NHpMykjDaog+LlJkZsGVbqv
 VuBdzOMfF9pXnnytiz87qOqDKxqmDl4IyzPs0AbLhruhOU5ByNkivEHe5ZA15EUyhQmRCmrXOA
 GLGYjSyERAPTkgQWoMSpjbzn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 19:19:36 -0700
IronPort-SDR: 4YARjhaKZdjltWHRHtZQGGMjuzxr96RHSMRCJNmLKXllbhnlL8uJUSiRD2BLmqRbCsfN5JslSz
 IvCZUzGbkHYqzIgR5s/FskUnowxHqxebOAwIFXwDv+08OyQipBqfZnl0Cr2hITD5fwMlp0kwUp
 0jbir9srf0wuf2MnYtg0oOdRtGedDoE1bBE+yVrcVO3IAttaWbyJFqBJLYnun7M7JNxvk/7smL
 VOgu0BWTtrR7kyY+q2wVqD0sJ6vzTfM7USpe1PRZnA7llOMWRb21tcg2Ve+OIj4hlRM1xZIswa
 e5o=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
  by uls-op-cesaip02.wdc.com with ESMTP; 11 Aug 2021 19:44:06 -0700
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org
Cc:     linux-block@vger.kernel.org
Subject: [PATCH v6 2/9] libata: fix ata_host_start()
Date:   Thu, 12 Aug 2021 11:43:56 +0900
Message-Id: <20210812024403.765819-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210812024403.765819-1-damien.lemoal@wdc.com>
References: <20210812024403.765819-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The loop on entry of ata_host_start() may not initialize host->ops to a
non NULL value. The test on the host_stop field of host->ops must then
be preceded by a check that host->ops is not NULL.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/libata-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index b237a718ea0f..d3f7830bda2e 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -5583,7 +5583,7 @@ int ata_host_start(struct ata_host *host)
 			have_stop = 1;
 	}
 
-	if (host->ops->host_stop)
+	if (host->ops && host->ops->host_stop)
 		have_stop = 1;
 
 	if (have_stop) {
-- 
2.31.1

