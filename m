Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43A717ABCAF
	for <lists+linux-ide@lfdr.de>; Sat, 23 Sep 2023 02:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbjIWA34 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 22 Sep 2023 20:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbjIWA3x (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 22 Sep 2023 20:29:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A431A8;
        Fri, 22 Sep 2023 17:29:47 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5B3C433C8;
        Sat, 23 Sep 2023 00:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695428986;
        bh=CljvVIVxFNHJc2Ic3izyRBe4muX/ukU24KeSDfkZp7E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qwc/9rJq7pIQBfSb3Es/YiecXJEQ9nqd7vKzpmknLDZRzjHbUKwnhYCzmcNgWLcca
         EzlMjIyEKOi5lFQWPKQJXxX2eKC5zyXWX2TudvJoXc80N4wZJxTPkL3xnElTy+VAGg
         xyUelZhH1aEj1z3vtCOa/Kf0acnOlPDzd9AssvMkCAwrcyoyomT8sHlKN6Aef6eu51
         IF/NcDN3at1iwX1+VSGXwcDhwOdFNBezF8q1OrlUrqF4xIc0jecd86ncYj8yYc77on
         AKK6jzqpPNzidlOAC7kdRBZ4fr1QdP1P9GVm4YbeOfH6KIP8r+qoFni3uf7MCLiVVt
         kXUV+wVxamRJw==
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
Subject: [PATCH v6 08/23] ata: libata-core: Do not register PM operations for SAS ports
Date:   Sat, 23 Sep 2023 09:29:17 +0900
Message-ID: <20230923002932.1082348-9-dlemoal@kernel.org>
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

libsas does its own domain based power management of ports. For such
ports, libata should not use a device type defining power management
operations as executing these operations for suspend/resume in addition
to libsas calls to ata_sas_port_suspend() and ata_sas_port_resume() is
not necessary (and likely dangerous to do, even though problems are not
seen currently).

Introduce the new ata_port_sas_type device_type for ports managed by
libsas. This new device type is used in ata_tport_add() and is defined
without power management operations.

Fixes: 2fcbdcb4c802 ("[SCSI] libata: export ata_port suspend/resume infrastructure for sas")
Cc: stable@vger.kernel.org
Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Tested-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: John Garry <john.g.garry@oracle.com>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
---
 drivers/ata/libata-core.c      | 2 +-
 drivers/ata/libata-transport.c | 9 ++++++++-
 drivers/ata/libata.h           | 2 ++
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 092372334e92..261445c1851b 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -5335,7 +5335,7 @@ EXPORT_SYMBOL_GPL(ata_host_resume);
 #endif
 
 const struct device_type ata_port_type = {
-	.name = "ata_port",
+	.name = ATA_PORT_TYPE_NAME,
 #ifdef CONFIG_PM
 	.pm = &ata_port_pm_ops,
 #endif
diff --git a/drivers/ata/libata-transport.c b/drivers/ata/libata-transport.c
index e4fb9d1b9b39..3e49a877500e 100644
--- a/drivers/ata/libata-transport.c
+++ b/drivers/ata/libata-transport.c
@@ -266,6 +266,10 @@ void ata_tport_delete(struct ata_port *ap)
 	put_device(dev);
 }
 
+static const struct device_type ata_port_sas_type = {
+	.name = ATA_PORT_TYPE_NAME,
+};
+
 /** ata_tport_add - initialize a transport ATA port structure
  *
  * @parent:	parent device
@@ -283,7 +287,10 @@ int ata_tport_add(struct device *parent,
 	struct device *dev = &ap->tdev;
 
 	device_initialize(dev);
-	dev->type = &ata_port_type;
+	if (ap->flags & ATA_FLAG_SAS_HOST)
+		dev->type = &ata_port_sas_type;
+	else
+		dev->type = &ata_port_type;
 
 	dev->parent = parent;
 	ata_host_get(ap->host);
diff --git a/drivers/ata/libata.h b/drivers/ata/libata.h
index 820299bd9d06..05ac80da8ebc 100644
--- a/drivers/ata/libata.h
+++ b/drivers/ata/libata.h
@@ -30,6 +30,8 @@ enum {
 	ATA_DNXFER_QUIET	= (1 << 31),
 };
 
+#define ATA_PORT_TYPE_NAME	"ata_port"
+
 extern atomic_t ata_print_id;
 extern int atapi_passthru16;
 extern int libata_fua;
-- 
2.41.0

