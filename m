Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 605977AE7BA
	for <lists+linux-ide@lfdr.de>; Tue, 26 Sep 2023 10:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233947AbjIZIPh (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 26 Sep 2023 04:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233929AbjIZIP3 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 26 Sep 2023 04:15:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68EBE116;
        Tue, 26 Sep 2023 01:15:22 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1DAC433C9;
        Tue, 26 Sep 2023 08:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695716122;
        bh=k/n1E/0sX1Kh1J/5A7PeVx3HzBPcsCroCRQBlVX2+y4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xuwgpr3n/fB+h8EdFfzEwH+uWC4caIaFa+P83BoiwdKp7UupqbE4a6I/bNPg0H6o4
         xYL1+mAsW4ql0Kkaq+eO8Eon1iFgEzd5ZIiQB+L2ZtibSdWUp3+dp6KFQI33b/8yVS
         DV9u/OGZh6Q+w1XwPsFoGqta3XNcWtUOAkSyV4TMAfcpWvzLPZ0IBreUQMbin4aYTu
         V9Lfsm2UD1kp58Tu2mzN6bHvXgnw/kRtgmHZpDZPjqxdZbHlLvZisbQcU0ifQ0uhEG
         IvwuPLyf94PYYvIMrJzj93Q+1oVqFUVeciQ556a8xmcs+wYyPA1yg+/Q7HJkgOn6xM
         rE9KmOjSCDE0Q==
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
Subject: [PATCH v7 06/23] scsi: Do not attempt to rescan suspended devices
Date:   Tue, 26 Sep 2023 17:14:50 +0900
Message-ID: <20230926081507.69346-7-dlemoal@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230926081507.69346-1-dlemoal@kernel.org>
References: <20230926081507.69346-1-dlemoal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

scsi_rescan_device() takes a scsi device lock before executing a device
handler and device driver rescan methods. Waiting for the completion of
any command issued to the device by these methods will thus be done with
the device lock held. As a result, there is a risk of deadlocking within
the power management code if scsi_rescan_device() is called to handle a
device resume with the associated scsi device not yet resumed.

Avoid such situation by checking that the target scsi device is in the
running state, that is, fully capable of executing commands, before
proceeding with the rescan and bailout returning -EWOULDBLOCK otherwise.
With this error return, the caller can retry rescaning the device after
a delay.

The state check is done with the device lock held and is thus safe
against incoming suspend power management operations.

Fixes: 6aa0365a3c85 ("ata: libata-scsi: Avoid deadlock on rescan after device resume")
Cc: stable@vger.kernel.org
Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
---
 drivers/scsi/scsi_scan.c | 18 +++++++++++++++++-
 include/scsi/scsi_host.h |  2 +-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
index 52014b2d39e1..3db4d31a03a1 100644
--- a/drivers/scsi/scsi_scan.c
+++ b/drivers/scsi/scsi_scan.c
@@ -1619,12 +1619,24 @@ int scsi_add_device(struct Scsi_Host *host, uint channel,
 }
 EXPORT_SYMBOL(scsi_add_device);
 
-void scsi_rescan_device(struct scsi_device *sdev)
+int scsi_rescan_device(struct scsi_device *sdev)
 {
 	struct device *dev = &sdev->sdev_gendev;
+	int ret = 0;
 
 	device_lock(dev);
 
+	/*
+	 * Bail out if the device is not running. Otherwise, the rescan may
+	 * block waiting for commands to be executed, with us holding the
+	 * device lock. This can result in a potential deadlock in the power
+	 * management core code when system resume is on-going.
+	 */
+	if (sdev->sdev_state != SDEV_RUNNING) {
+		ret = -EWOULDBLOCK;
+		goto unlock;
+	}
+
 	scsi_attach_vpd(sdev);
 	scsi_cdl_check(sdev);
 
@@ -1638,7 +1650,11 @@ void scsi_rescan_device(struct scsi_device *sdev)
 			drv->rescan(dev);
 		module_put(dev->driver->owner);
 	}
+
+unlock:
 	device_unlock(dev);
+
+	return ret;
 }
 EXPORT_SYMBOL(scsi_rescan_device);
 
diff --git a/include/scsi/scsi_host.h b/include/scsi/scsi_host.h
index 49f768d0ff37..4c2dc8150c6d 100644
--- a/include/scsi/scsi_host.h
+++ b/include/scsi/scsi_host.h
@@ -764,7 +764,7 @@ scsi_template_proc_dir(const struct scsi_host_template *sht);
 #define scsi_template_proc_dir(sht) NULL
 #endif
 extern void scsi_scan_host(struct Scsi_Host *);
-extern void scsi_rescan_device(struct scsi_device *);
+extern int scsi_rescan_device(struct scsi_device *sdev);
 extern void scsi_remove_host(struct Scsi_Host *);
 extern struct Scsi_Host *scsi_host_get(struct Scsi_Host *);
 extern int scsi_host_busy(struct Scsi_Host *shost);
-- 
2.41.0

