Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A123465BA5B
	for <lists+linux-ide@lfdr.de>; Tue,  3 Jan 2023 06:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbjACFWV (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 3 Jan 2023 00:22:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbjACFVr (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 3 Jan 2023 00:21:47 -0500
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96CF0BC91
        for <linux-ide@vger.kernel.org>; Mon,  2 Jan 2023 21:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1672723174; x=1704259174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NuPYY3rlZUaBM9lp8igq7CNP3hZGim+0FJY4yALHC60=;
  b=WThmWUqupMrxGWJT4LZiMYSRf6bf4p0CVGPxhisu+4Z7hNdGXD4MlbUq
   oHELbauNVknMIW8mRpZMrLcLeGmKx7MtBGdGcks/qQ8tA8lRUDCS7QEJI
   bj8htupLwoXoOkE4+hFdedcbQbziDWvj1BP4YWCehODBje7lkoubg6Y+S
   eibx7wViYiaVz/zaFO8XD1hin9TKbe2PFI3+KC56QKCGSDY5XRNG9MGlg
   1fJTJSFp4ei5EHh7XP8SLWGBGHm2irIOK2eK0SmZchU81Xix9Rv09jtB1
   HzbgpAayKo9ziV53WNVGOBX97qSGoOgp3kg5796PdAOgaig7btuD6nwGv
   w==;
X-IronPort-AV: E=Sophos;i="5.96,295,1665417600"; 
   d="scan'208";a="219794880"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 03 Jan 2023 13:19:34 +0800
IronPort-SDR: /4fsQ+J3sJK9eskyT2VPIXHhj57VE10Q0cLHHI7OrIJI3xXGJzmbZK9EUrH0ZxjWtSw6j1fGuh
 7yybhJ2vaiw49HtgF9UQrAvBzCa25C7prP0TKhRcN36xOr4e1iHw+slnNFK8AppLUYl0ZT8yXC
 xWKqXdKE+cV/R/56Kxl913eUEo/r5UkY04JUmB6Pl3j4E5wzrvW1868LjZuRShkABo8PocmGsW
 ua/+/cjGGG/7K9g8eDvQ5IS8H7vB/vU1P30cEP/EI3I6X5zQGVXSI1OPf94hq3rE1a0/AMFLFJ
 Gts=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jan 2023 20:31:48 -0800
IronPort-SDR: 1NmWwsxsFcjlqatFindksJk2cQ2GKPqAT9ZHJWtBolgdox0t8FsCnABYmhVC7pF3YwCwRsCcml
 hd+NNCMiuDsLvkvS4CVyhRDHyipqrkcqgBJdchtOetfP9SE4Csd8gR/xbgNg7mgQyikmHvThy/
 9tlazhzUT1GP++id3sM7EaXxL8Gz4fnHMZUxiHofva0iRBIaTrlhKF3FDumqDcqM8i3N4jHfCx
 CF7R0IW79apwATgeY+bmnwXhEneeqvYgyos7RuziyDd85D1oJ1+kxUXvvV7XR2pp6JwBIJm+V/
 rIQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jan 2023 21:19:35 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NmLdL16L7z1Rwrq
        for <linux-ide@vger.kernel.org>; Mon,  2 Jan 2023 21:19:34 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1672723173; x=1675315174; bh=NuPYY3rlZUaBM9lp8i
        gq7CNP3hZGim+0FJY4yALHC60=; b=i6jHkRPRRekIGudUrWrbPGrNZXTy3YMbQ0
        THNcWBoeTkNYa34FAHOvI9PFwcBi7fBt9mL8hlD7sbMhRlpW8uTBCIuNs2PBUIww
        Ma3FJKaxtZfdv9X/wyXq+0wQw0iaan0eUIyoDlve3PJtejWHLuEXimGJTroKXXF2
        woPPKGzannz/BUheFl9J5ZcxF2NkiABo5V0cP93rq1TOhPaLDKFV4fGqYu6EBOIW
        3YUzSNMA1DfMGGCtIapnsImAynJN4g2E8PlmCzv3+DHKdbiaR7rGJm0FnGDjdRzW
        9nPHGAewL9uXGF7O65pjg9apxg8l8KdlXe4mzk7InTzwwFELV+iw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id BOvolS5-aVTt for <linux-ide@vger.kernel.org>;
        Mon,  2 Jan 2023 21:19:33 -0800 (PST)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NmLdJ0XmCz1RvLy;
        Mon,  2 Jan 2023 21:19:31 -0800 (PST)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org, linux-block@vger.kernel.org,
        Jens Axboe <axboe@kernel.dk>
Cc:     "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>,
        Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH v7 4/7] ata: libata: cleanup fua support detection
Date:   Tue,  3 Jan 2023 14:19:21 +0900
Message-Id: <20230103051924.233796-5-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103051924.233796-1-damien.lemoal@opensource.wdc.com>
References: <20230103051924.233796-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Move the detection of a device FUA support from
ata_scsiop_mode_sense()/ata_dev_supports_fua() to device scan time in
ata_dev_configure().

The function ata_dev_config_fua() is introduced to detect if a device
supports FUA and this support is indicated using the new device flag
ATA_DFLAG_FUA.

In order to blacklist known buggy devices, the horkage flag
ATA_HORKAGE_NO_FUA is introduced. Similarly to other horkage flags, the
libata.force=3D arguments "fua" and "nofua" are also introduced to allow
a user to control this horkage flag through the "force" libata
module parameter.

The ATA_DFLAG_FUA device flag is set only and only if all the following
conditions are met:
* libata.fua module parameter is set to 1
* The device supports the WRITE DMA FUA EXT command,
* The device is not marked with the ATA_HORKAGE_NO_FUA flag, either from
  the blacklist or set by the user with libata.force=3Dnofua
* The device supports NCQ (while this is not mandated by the standards,
  this restriction is introduced to avoid problems with older non-NCQ
  devices).

Enabling or diabling libata FUA support for all devices can now also be
done using the "force=3D[no]fua" module parameter when libata.fua is set
to 1.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 .../admin-guide/kernel-parameters.txt         |  3 ++
 drivers/ata/libata-core.c                     | 30 ++++++++++++++++++-
 drivers/ata/libata-scsi.c                     | 30 ++-----------------
 include/linux/libata.h                        |  8 +++--
 4 files changed, 39 insertions(+), 32 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
index 6cfa6e3996cf..3d0f2de7dc03 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2816,6 +2816,9 @@
 			* [no]setxfer: Indicate if transfer speed mode setting
 			  should be skipped.
=20
+			* [no]fua: Disable or enable FUA (Force Unit Access)
+			  support for devices supporting this feature.
+
 			* dump_id: Dump IDENTIFY data.
=20
 			* disable: Disable this device.
diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 6ee1cbac3ab0..30adae16efff 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -2422,6 +2422,28 @@ static void ata_dev_config_chs(struct ata_device *=
dev)
 			     dev->heads, dev->sectors);
 }
=20
+static void ata_dev_config_fua(struct ata_device *dev)
+{
+	/* Ignore FUA support if its use is disabled globally */
+	if (!libata_fua)
+		goto nofua;
+
+	/* Ignore devices without support for WRITE DMA FUA EXT */
+	if (!(dev->flags & ATA_DFLAG_LBA48) || !ata_id_has_fua(dev->id))
+		goto nofua;
+
+	/* Ignore known bad devices and devices that lack NCQ support */
+	if (!ata_ncq_supported(dev) || (dev->horkage & ATA_HORKAGE_NO_FUA))
+		goto nofua;
+
+	dev->flags |=3D ATA_DFLAG_FUA;
+
+	return;
+
+nofua:
+	dev->flags &=3D ~ATA_DFLAG_FUA;
+}
+
 static void ata_dev_config_devslp(struct ata_device *dev)
 {
 	u8 *sata_setting =3D dev->link->ap->sector_buf;
@@ -2510,7 +2532,8 @@ static void ata_dev_print_features(struct ata_devic=
e *dev)
 		return;
=20
 	ata_dev_info(dev,
-		     "Features:%s%s%s%s%s%s\n",
+		     "Features:%s%s%s%s%s%s%s\n",
+		     dev->flags & ATA_DFLAG_FUA ? " FUA" : "",
 		     dev->flags & ATA_DFLAG_TRUSTED ? " Trust" : "",
 		     dev->flags & ATA_DFLAG_DA ? " Dev-Attention" : "",
 		     dev->flags & ATA_DFLAG_DEVSLP ? " Dev-Sleep" : "",
@@ -2671,6 +2694,7 @@ int ata_dev_configure(struct ata_device *dev)
 			ata_dev_config_chs(dev);
 		}
=20
+		ata_dev_config_fua(dev);
 		ata_dev_config_devslp(dev);
 		ata_dev_config_sense_reporting(dev);
 		ata_dev_config_zac(dev);
@@ -4105,6 +4129,9 @@ static const struct ata_blacklist_entry ata_device_=
blacklist [] =3D {
 	 */
 	{ "SATADOM-ML 3ME",		NULL,	ATA_HORKAGE_NO_LOG_DIR },
=20
+	/* Buggy FUA */
+	{ "Maxtor",		"BANC1G10",	ATA_HORKAGE_NO_FUA },
+
 	/* End Marker */
 	{ }
 };
@@ -6216,6 +6243,7 @@ static const struct ata_force_param force_tbl[] __i=
nitconst =3D {
 	force_horkage_onoff(lpm,	ATA_HORKAGE_NOLPM),
 	force_horkage_onoff(setxfer,	ATA_HORKAGE_NOSETXFER),
 	force_horkage_on(dump_id,	ATA_HORKAGE_DUMP_ID),
+	force_horkage_onoff(fua,	ATA_HORKAGE_NO_FUA),
=20
 	force_horkage_on(disable,	ATA_HORKAGE_DISABLE),
 };
diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
index cbb3a7a50816..f1622b8cdb55 100644
--- a/drivers/ata/libata-scsi.c
+++ b/drivers/ata/libata-scsi.c
@@ -2240,30 +2240,6 @@ static unsigned int ata_msense_rw_recovery(u8 *buf=
, bool changeable)
 	return sizeof(def_rw_recovery_mpage);
 }
=20
-/*
- * We can turn this into a real blacklist if it's needed, for now just
- * blacklist any Maxtor BANC1G10 revision firmware
- */
-static int ata_dev_supports_fua(u16 *id)
-{
-	unsigned char model[ATA_ID_PROD_LEN + 1], fw[ATA_ID_FW_REV_LEN + 1];
-
-	if (!libata_fua)
-		return 0;
-	if (!ata_id_has_fua(id))
-		return 0;
-
-	ata_id_c_string(id, model, ATA_ID_PROD, sizeof(model));
-	ata_id_c_string(id, fw, ATA_ID_FW_REV, sizeof(fw));
-
-	if (strcmp(model, "Maxtor"))
-		return 1;
-	if (strcmp(fw, "BANC1G10"))
-		return 1;
-
-	return 0; /* blacklisted */
-}
-
 /**
  *	ata_scsiop_mode_sense - Simulate MODE SENSE 6, 10 commands
  *	@args: device IDENTIFY data / SCSI command of interest.
@@ -2287,7 +2263,7 @@ static unsigned int ata_scsiop_mode_sense(struct at=
a_scsi_args *args, u8 *rbuf)
 	};
 	u8 pg, spg;
 	unsigned int ebd, page_control, six_byte;
-	u8 dpofua, bp =3D 0xff;
+	u8 dpofua =3D 0, bp =3D 0xff;
 	u16 fp;
=20
 	six_byte =3D (scsicmd[0] =3D=3D MODE_SENSE);
@@ -2350,9 +2326,7 @@ static unsigned int ata_scsiop_mode_sense(struct at=
a_scsi_args *args, u8 *rbuf)
 		goto invalid_fld;
 	}
=20
-	dpofua =3D 0;
-	if (ata_dev_supports_fua(args->id) && (dev->flags & ATA_DFLAG_LBA48) &&
-	    (!(dev->flags & ATA_DFLAG_PIO) || dev->multi_count))
+	if (dev->flags & ATA_DFLAG_FUA)
 		dpofua =3D 1 << 4;
=20
 	if (six_byte) {
diff --git a/include/linux/libata.h b/include/linux/libata.h
index 650543afad32..6352f7f25a6d 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -91,6 +91,7 @@ enum {
 	ATA_DFLAG_AN		=3D (1 << 7), /* AN configured */
 	ATA_DFLAG_TRUSTED	=3D (1 << 8), /* device supports trusted send/recv */
 	ATA_DFLAG_DMADIR	=3D (1 << 10), /* device requires DMADIR */
+	ATA_DFLAG_FUA		=3D (1 << 11), /* device supports FUA */
 	ATA_DFLAG_CFG_MASK	=3D (1 << 12) - 1,
=20
 	ATA_DFLAG_PIO		=3D (1 << 12), /* device limited to PIO mode */
@@ -113,9 +114,9 @@ enum {
 	ATA_DFLAG_D_SENSE	=3D (1 << 29), /* Descriptor sense requested */
 	ATA_DFLAG_ZAC		=3D (1 << 30), /* ZAC device */
=20
-	ATA_DFLAG_FEATURES_MASK	=3D ATA_DFLAG_TRUSTED | ATA_DFLAG_DA | \
-				  ATA_DFLAG_DEVSLP | ATA_DFLAG_NCQ_SEND_RECV | \
-				  ATA_DFLAG_NCQ_PRIO,
+	ATA_DFLAG_FEATURES_MASK	=3D (ATA_DFLAG_TRUSTED | ATA_DFLAG_DA |	\
+				   ATA_DFLAG_DEVSLP | ATA_DFLAG_NCQ_SEND_RECV | \
+				   ATA_DFLAG_NCQ_PRIO | ATA_DFLAG_FUA),
=20
 	ATA_DEV_UNKNOWN		=3D 0,	/* unknown device */
 	ATA_DEV_ATA		=3D 1,	/* ATA device */
@@ -381,6 +382,7 @@ enum {
 	ATA_HORKAGE_NO_NCQ_ON_ATI =3D (1 << 27),	/* Disable NCQ on ATI chipset =
*/
 	ATA_HORKAGE_NO_ID_DEV_LOG =3D (1 << 28),	/* Identify device log missing=
 */
 	ATA_HORKAGE_NO_LOG_DIR	=3D (1 << 29),	/* Do not read log directory */
+	ATA_HORKAGE_NO_FUA	=3D (1 << 30),	/* Do not use FUA */
=20
 	 /* DMA mask for user DMA control: User visible values; DO NOT
 	    renumber */
--=20
2.39.0

