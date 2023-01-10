Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30A786641BA
	for <lists+linux-ide@lfdr.de>; Tue, 10 Jan 2023 14:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232833AbjAJN1f (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 10 Jan 2023 08:27:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbjAJN1U (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 10 Jan 2023 08:27:20 -0500
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6DA73B3
        for <linux-ide@vger.kernel.org>; Tue, 10 Jan 2023 05:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1673357238; x=1704893238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X3kzvQdGX1FhwiReGoda+divC3uvv6Zg1kXuu40s1fM=;
  b=T4QkB8bgiIBOlfFoYxXRktRtLWvvfc3pHT0t26ydknUuv1HMLL1pyU/0
   8ZLyyZCnbL5/t8Bzsf59fNaz7O1O1wKVNXV9k51+fR2FKi7PHnFn839DW
   g+kqPr13EgrLkEDinOl8gQy3TpbgBLKWrJHjRNl6R2HWo58vtoO332XCq
   jF9gDc8KNMZwk7n6FF/8vOaKhtHFD7TYqXlq0Ir1umLHI5VuE35nzcjk/
   aH3KQThu7II7vOuJ04NigokRNURQ3zZHNC/oJBgQFO+G14Q7yQbmOHrK4
   jGcF0z/1Vvh01uKS5oZ4Oevq1jlE1j614k0g6yTaulQZ1z7kiF5upXXKy
   w==;
X-IronPort-AV: E=Sophos;i="5.96,315,1665417600"; 
   d="scan'208";a="220321123"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 10 Jan 2023 21:27:18 +0800
IronPort-SDR: rmBCKzVxjSCi+skjXndgmPV6DNSCoo/lceFkpuYEhb1rffgc6EMRbUquSrhJvpl6jQ+QdBbtjS
 9VWIe8+8wF0KfvJtXB6McqbYVrKoHCeYSU/8uU2sF10Xd4UXm56eEkarf/62VMS8cRJcs6fi3l
 K1T2LsHEf5gtzGzlWYn4uSeK+iuH2iNK7nfNIYPtVMfBJZALQyjaOqbIQ6vs7qiFDG/gUsvjo0
 ayOITqGVBbDfQyQrtN/lSWQw7+5BL9Xx6GzoTWA9044c9KBVocIbcu0VKg3w7RNuMTd/85/Wyp
 pX8=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jan 2023 04:39:24 -0800
IronPort-SDR: xdo00+TzHHpOJVXmkGY2gd/1vmOUAFwKI78D4ob5Bix4ysx9EWSkwFobZF9FpwZh2cP5ayCLXH
 u+c7UwvxFdfCK+iJkFNq3fGGcii96Z4hUqzylqCDoocR6vDucAhZ66hDj185fy005qWCqtvHes
 SDUUGCyZcqVqNL0moOvxR29pEQi+vTKFOHJSEeBPC4u4133nsN3QkeOowcK1Q9xipOhmgPquK9
 dfT21agQAHF0cEXRvpNS5NeR6sWzRnh0I/KANmjRl6Gs/t4B3vz7B73VNrwiugr3YhdSM8YlcG
 3Ak=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jan 2023 05:27:19 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nrs6t3lnfz1RvTr
        for <linux-ide@vger.kernel.org>; Tue, 10 Jan 2023 05:27:18 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1673357237; x=1675949238; bh=X3kzvQdGX1FhwiReGo
        da+divC3uvv6Zg1kXuu40s1fM=; b=i0QnYU0dXOdK3ZjQmAJXdrFXkdPpN5nmgX
        nwmKK6kzaYQk4yevn/untFd9uX9aEs3StiMw196OkMsezMEGOFj4F9wxCF8/LReE
        JegYIsBYMFjRnv0oj9YgwyMlb6gQg5QUdbrHZDPxuSyz1ren1JtcgKqmpbIOKEWN
        D3LE+1xM1fTPflPl7NrLZnwxMamphd/D7fDn97Carw/d7bdTAOOPo2B4XCvrniKB
        M8W729b4RskpUAKVGdn0RbZx4ArE5WBkLjNAv4VBuaDII6kywGQuJ8ngT9poPJAy
        ZyVefVz9DOpxp2F2a+AEo4MhzojxlIdR1YEcACEYU+IyovjijoKg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id GfjDYDmh_7Uy for <linux-ide@vger.kernel.org>;
        Tue, 10 Jan 2023 05:27:17 -0800 (PST)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nrs6r6jmkz1RvLy;
        Tue, 10 Jan 2023 05:27:16 -0800 (PST)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org, linux-block@vger.kernel.org,
        Jens Axboe <axboe@kernel.dk>
Cc:     "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Christoph Hellwig <hch@lst.de>
Subject: [PATCH v9 4/6] ata: libata: cleanup fua support detection
Date:   Tue, 10 Jan 2023 22:27:08 +0900
Message-Id: <20230110132710.252015-5-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110132710.252015-1-damien.lemoal@opensource.wdc.com>
References: <20230110132710.252015-1-damien.lemoal@opensource.wdc.com>
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
index 1c16342dda08..d25a53a873dc 100644
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
index 46109bde8a04..aa338f10cef2 100644
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
index 059ca7f2b69c..a759dfbdcc91 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -90,6 +90,7 @@ enum {
 	ATA_DFLAG_ACPI_FAILED	=3D (1 << 6), /* ACPI on devcfg has failed */
 	ATA_DFLAG_AN		=3D (1 << 7), /* AN configured */
 	ATA_DFLAG_TRUSTED	=3D (1 << 8), /* device supports trusted send/recv */
+	ATA_DFLAG_FUA		=3D (1 << 9), /* device supports FUA */
 	ATA_DFLAG_DMADIR	=3D (1 << 10), /* device requires DMADIR */
 	ATA_DFLAG_NCQ_SEND_RECV =3D (1 << 11), /* device supports NCQ SEND and =
RECV */
 	ATA_DFLAG_NCQ_PRIO	=3D (1 << 12), /* device supports NCQ priority */
@@ -112,9 +113,9 @@ enum {
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

