Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAE37A18B8
	for <lists+linux-ide@lfdr.de>; Fri, 15 Sep 2023 10:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232915AbjIOI05 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 15 Sep 2023 04:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233116AbjIOI0t (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 15 Sep 2023 04:26:49 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8CAF3AA5;
        Fri, 15 Sep 2023 01:25:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32BAC433B8;
        Fri, 15 Sep 2023 08:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694765743;
        bh=0GOi0mloXAEJIC+S6NGXQSMf1o5GU58qEdFx1YeNYX0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WdmunzguMNXTPhYSlEoHlAMqPrzwRKDNUeWTiYFWy2kNbvyZ/dG7YWWNv/YaV9PcZ
         Kde3++KNSfxVoZICOYJ3KBkSjKRejHslgiLy2TgqX3p48esXDSWNcgAgVOHSHu7h2y
         OHOJ5mALKtqjhIfZ1UM1ncsV1oCleoUYQkIdVjoDlcBiRCS6pSOjiZEyFb6wky94fi
         yLxK4DiNHTk3gtao1FT+uPdPcO/16kq0w9LNRHzAopkqvMXqGxbGG4QWVXnusX2Ve5
         rJPEB0a/z3i/Vg7Cf2M/5tiCZsb/WCEqv+VGZVogkmggYndRrLZtLTf4rkXk56csfq
         8ZlikM/8czz2A==
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
Subject: [PATCH v3 18/23] ata: libata-core: Do not poweroff runtime suspended ports
Date:   Fri, 15 Sep 2023 17:15:02 +0900
Message-ID: <20230915081507.761711-19-dlemoal@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230915081507.761711-1-dlemoal@kernel.org>
References: <20230915081507.761711-1-dlemoal@kernel.org>
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
---
 drivers/ata/libata-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index a4389dd807e5..c3adaa01cbe3 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -5219,7 +5219,8 @@ static int ata_port_pm_freeze(struct device *dev)
 
 static int ata_port_pm_poweroff(struct device *dev)
 {
-	ata_port_suspend(to_ata_port(dev), PMSG_HIBERNATE, false);
+	if (!pm_runtime_suspended(dev))
+		ata_port_suspend(to_ata_port(dev), PMSG_HIBERNATE, false);
 	return 0;
 }
 
-- 
2.41.0

