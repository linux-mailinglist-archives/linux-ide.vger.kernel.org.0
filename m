Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98DA47ABCC6
	for <lists+linux-ide@lfdr.de>; Sat, 23 Sep 2023 02:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbjIWAbF (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 22 Sep 2023 20:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbjIWAaM (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 22 Sep 2023 20:30:12 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA029B9;
        Fri, 22 Sep 2023 17:30:02 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041B9C433CB;
        Sat, 23 Sep 2023 00:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695429002;
        bh=qrUl5SH+B8SP/ZoBFwIfkCLObB6aWz8x19i2XQMuplw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mN3cIRbiQ6MXYU3dISFozdtpm6qQ3DG4GzEf8Y8wFMQVo4lrZkxmq6p0oubg29+ud
         xzHpL0+NcBmUM2zRiT/I9sZdTBZDFBO7js919AITXYsEmtq4LbB+Pi9vZ4NtMb9LJf
         b289EyYn48+Q+HAU3NC3c9L36bNNOuSXPcfr96zxaHtAZmCOLdIdrsJRRwc6w+vTbO
         RFQCptUhzv8gHZwogXiWLOoV2xILqQpjD/Kn7L/veRkiwf4dCukVXu5kvItJs864tQ
         s2xI2ilX7yOW1KeEzidsoI4jt7jrDsqtV7w4kbSeiTOaJh8O0Z+IPLusRvrQKSjtmV
         Urc9NDYd7181g==
From:   Damien Le Moal <dlemoal@kernel.org>
To:     linux-ide@vger.kernel.org
Cc:     linux-scsi@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        John Garry <john.g.garry@oracle.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Paul Ausbeck <paula@soe.ucsc.edu>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Joe Breuer <linux-kernel@jmbreuer.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Chia-Lin Kao <acelan.kao@canonical.com>
Subject: [PATCH v6 18/23] ata: libata-core: Do not poweroff runtime suspended ports
Date:   Sat, 23 Sep 2023 09:29:27 +0900
Message-ID: <20230923002932.1082348-19-dlemoal@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230923002932.1082348-1-dlemoal@kernel.org>
References: <20230923002932.1082348-1-dlemoal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

When powering off, there is no need to suspend a port that has already
been runtime suspended. Skip the EH PM request in ata_port_pm_poweroff()
in this case.

Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Tested-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
---
 drivers/ata/libata-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 6773a1e52dad..df6ed386e6fc 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -5215,7 +5215,8 @@ static int ata_port_pm_freeze(struct device *dev)
 
 static int ata_port_pm_poweroff(struct device *dev)
 {
-	ata_port_suspend(to_ata_port(dev), PMSG_HIBERNATE, false);
+	if (!pm_runtime_suspended(dev))
+		ata_port_suspend(to_ata_port(dev), PMSG_HIBERNATE, false);
 	return 0;
 }
 
-- 
2.41.0

