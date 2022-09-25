Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E575E96D3
	for <lists+linux-ide@lfdr.de>; Mon, 26 Sep 2022 01:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbiIYXI1 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 25 Sep 2022 19:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbiIYXIZ (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 25 Sep 2022 19:08:25 -0400
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A02A29C86
        for <linux-ide@vger.kernel.org>; Sun, 25 Sep 2022 16:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1664147304; x=1695683304;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=rWNJcFnvuOopT48ualRZvSFCvO4CnoU/GS9dq6m/Kps=;
  b=fbX5C6OlIPub0nJ2Y/uYoUDhKihZFBs5N+NaK+ZiQrqY3B4OqsBxGSU+
   OAty57ZwNYke81zKkwj6r1MNoh2AcGbaHVnWU8WQIFL5HEgBFrbaYulmt
   A715Xd++RI2fhsuiX9CcG+pbiV1J21KJdVfjwnvsBm/et2SpsrSKNIgti
   Ve1VbA4ybRMadkKloEKLXnMB8Y4+BbdyerzZ1R1jNZKiJFi2iFAnw5M87
   5jpI74mUx/IlHQbD9twaai6Z5nhVzYCsRFyY/ZuHm825kF0Ww5MF9fgub
   dCi5HClQnjLj9yck5+nbItczWACKMfahEw5N46H14jV9sGPZQO1OfzKiC
   g==;
X-IronPort-AV: E=Sophos;i="5.93,345,1654531200"; 
   d="scan'208";a="217414826"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 26 Sep 2022 07:08:23 +0800
IronPort-SDR: sE2k1veYRSr+/NF8QeMGCZFOrmfvRj5D1NdBZyfOW+X0bfwcr0h6Kgi/OOasDDvlojYILXW8DT
 Bb1v2+uY6q5uFv8wYpTN5dX9M1qUKZ5qYBFi6eiSFhMuwASL13ehmRxKUZtZ1Cj1DBzl9ZmELK
 6iO6atrpMCKbU8M08Sa1/NSuGy9rCE566uyoKsaEabZM16oj+FrsogxI+pgoj/n9rrkZ9Ev9CJ
 0oz+lqIzUXvg0WipiAq86XLVzn9wSpONiQXqyTW9LRPI07SF2uY6g/Kkf0b1vmKp9TNot31wJ8
 AlxcOZJymHeLI5kQ0ZVKGx8K
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Sep 2022 15:28:22 -0700
IronPort-SDR: HFY5QgNW9ye68eKb8+4lDztX5A1Dgc3+/YK9DXmMTVKqXY7xKvax4qWHQYuictwfet291JYoA6
 CtzvbzBHdSSIh6uB/iZpMFdrQR72kG3ONWw6WMewhH4OdE0o0/4dSgmKcoUkhHqA8kW3Zrtl7C
 t4hhVx5fk1ZZrYBqwNXDP+Bgf9XDsMScad2OabM7m3R/uflV3cbNmTp3nX+Wwu0asPl9VAZ0wl
 LvjIbHJgJz9KJ9Jb8ZNytYqTyuUB/LX9m+T5xS3swtubNI/o3ujSPe6G+FYDvIJeqs2XKIOUE0
 2/o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Sep 2022 16:08:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MbM4k5mxWz1RwqL
        for <linux-ide@vger.kernel.org>; Sun, 25 Sep 2022 16:08:22 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1664147302; x=1666739303; bh=rWNJcFnvuOopT48ual
        RZvSFCvO4CnoU/GS9dq6m/Kps=; b=Z8NwqTg+eMOgvIVDPgqjHFHVIcdAAbnZx4
        UztvSOa71TfiJCJeuVwizSDkdEf4k9t2Zc07NuAmze2ejMLaWXzObFoHqgukbiO2
        oEyYcSOaczu7J4K/RV3intyGqZKLyduoMdM9vSj+930QlDptgz4kGty21Rx3JVN+
        dTmMuPs6mtjBrvl+R4LFJ99MaF2AqaJHrc6MgOd8D6j/LBoZTrOsLjxKb0qyWTH3
        FyrVmbmCmzsKrYAcFBNKn4mI6zz2v/THqPYQeGyP+1OchOpb68PQ9qxuiKS2d9Pf
        cXhYydzmzDM99AC6tE++mV4PR8VCqsfSJVyU3ycGEUjJdPWVRA/g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 9vwa5DCKCsF8 for <linux-ide@vger.kernel.org>;
        Sun, 25 Sep 2022 16:08:22 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MbM4j3zYvz1RvLy;
        Sun, 25 Sep 2022 16:08:21 -0700 (PDT)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        John Garry <john.garry@huawei.com>
Subject: [PATCH v2 2/2] ata: libata-sata: Fix device queue depth control
Date:   Mon, 26 Sep 2022 08:08:17 +0900
Message-Id: <20220925230817.91542-3-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925230817.91542-1-damien.lemoal@opensource.wdc.com>
References: <20220925230817.91542-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The function __ata_change_queue_depth() uses the helper
ata_scsi_find_dev() to get the ata_device structure of a scsi device and
set that device maximum queue depth. However, when the ata device is
managed by libsas, ata_scsi_find_dev() returns NULL, turning
__ata_change_queue_depth() into a nop, which prevents the user from
setting the maximum queue depth of ATA devices used with libsas based
HBAs.

Fix this by renaming __ata_change_queue_depth() to
ata_change_queue_depth() and adding a pointer to the ata_device
structure of the target device as argument. This pointer is provided by
ata_scsi_change_queue_depth() using ata_scsi_find_dev() in the case of
a libata managed device and by sas_change_queue_depth() using
sas_to_ata_dev() in the case of a libsas managed ata device.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 drivers/ata/libata-sata.c           | 24 ++++++++++++------------
 drivers/scsi/libsas/sas_scsi_host.c |  3 ++-
 include/linux/libata.h              |  4 ++--
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/ata/libata-sata.c b/drivers/ata/libata-sata.c
index 7a5fe41aa5ae..13b9d0fdd42c 100644
--- a/drivers/ata/libata-sata.c
+++ b/drivers/ata/libata-sata.c
@@ -1018,26 +1018,25 @@ DEVICE_ATTR(sw_activity, S_IWUSR | S_IRUGO, ata_s=
csi_activity_show,
 EXPORT_SYMBOL_GPL(dev_attr_sw_activity);
=20
 /**
- *	__ata_change_queue_depth - helper for ata_scsi_change_queue_depth
- *	@ap: ATA port to which the device change the queue depth
+ *	ata_change_queue_depth - Set a device maximum queue depth
+ *	@ap: ATA port of the target device
+ *	@dev: target ATA device
  *	@sdev: SCSI device to configure queue depth for
  *	@queue_depth: new queue depth
  *
- *	libsas and libata have different approaches for associating a sdev to
- *	its ata_port.
+ *	Helper to set a device maximum queue depth, usable with both libsas
+ *	and libata.
  *
  */
-int __ata_change_queue_depth(struct ata_port *ap, struct scsi_device *sd=
ev,
-			     int queue_depth)
+int ata_change_queue_depth(struct ata_port *ap, struct ata_device *dev,
+			   struct scsi_device *sdev, int queue_depth)
 {
-	struct ata_device *dev;
 	unsigned long flags;
=20
-	if (queue_depth < 1 || queue_depth =3D=3D sdev->queue_depth)
+	if (!dev || !ata_dev_enabled(dev))
 		return sdev->queue_depth;
=20
-	dev =3D ata_scsi_find_dev(ap, sdev);
-	if (!dev || !ata_dev_enabled(dev))
+	if (queue_depth < 1 || queue_depth =3D=3D sdev->queue_depth)
 		return sdev->queue_depth;
=20
 	/* NCQ enabled? */
@@ -1059,7 +1058,7 @@ int __ata_change_queue_depth(struct ata_port *ap, s=
truct scsi_device *sdev,
=20
 	return scsi_change_queue_depth(sdev, queue_depth);
 }
-EXPORT_SYMBOL_GPL(__ata_change_queue_depth);
+EXPORT_SYMBOL_GPL(ata_change_queue_depth);
=20
 /**
  *	ata_scsi_change_queue_depth - SCSI callback for queue depth config
@@ -1080,7 +1079,8 @@ int ata_scsi_change_queue_depth(struct scsi_device =
*sdev, int queue_depth)
 {
 	struct ata_port *ap =3D ata_shost_to_port(sdev->host);
=20
-	return __ata_change_queue_depth(ap, sdev, queue_depth);
+	return ata_change_queue_depth(ap, ata_scsi_find_dev(ap, sdev),
+				      sdev, queue_depth);
 }
 EXPORT_SYMBOL_GPL(ata_scsi_change_queue_depth);
=20
diff --git a/drivers/scsi/libsas/sas_scsi_host.c b/drivers/scsi/libsas/sa=
s_scsi_host.c
index 9c82e5dc4fcc..a36fa1c128a8 100644
--- a/drivers/scsi/libsas/sas_scsi_host.c
+++ b/drivers/scsi/libsas/sas_scsi_host.c
@@ -872,7 +872,8 @@ int sas_change_queue_depth(struct scsi_device *sdev, =
int depth)
 	struct domain_device *dev =3D sdev_to_domain_dev(sdev);
=20
 	if (dev_is_sata(dev))
-		return __ata_change_queue_depth(dev->sata_dev.ap, sdev, depth);
+		return ata_change_queue_depth(dev->sata_dev.ap,
+					      sas_to_ata_dev(dev), sdev, depth);
=20
 	if (!sdev->tagged_supported)
 		depth =3D 1;
diff --git a/include/linux/libata.h b/include/linux/libata.h
index 698032e5ef2d..20765d1c5f80 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -1136,8 +1136,8 @@ extern int ata_scsi_slave_config(struct scsi_device=
 *sdev);
 extern void ata_scsi_slave_destroy(struct scsi_device *sdev);
 extern int ata_scsi_change_queue_depth(struct scsi_device *sdev,
 				       int queue_depth);
-extern int __ata_change_queue_depth(struct ata_port *ap, struct scsi_dev=
ice *sdev,
-				    int queue_depth);
+extern int ata_change_queue_depth(struct ata_port *ap, struct ata_device=
 *dev,
+				  struct scsi_device *sdev, int queue_depth);
 extern struct ata_device *ata_dev_pair(struct ata_device *adev);
 extern int ata_do_set_mode(struct ata_link *link, struct ata_device **r_=
failed_dev);
 extern void ata_scsi_port_error_handler(struct Scsi_Host *host, struct a=
ta_port *ap);
--=20
2.37.3

