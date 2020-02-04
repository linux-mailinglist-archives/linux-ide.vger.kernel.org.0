Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF0BB151EA0
	for <lists+linux-ide@lfdr.de>; Tue,  4 Feb 2020 17:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgBDQ4K (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 4 Feb 2020 11:56:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:34806 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727379AbgBDQ4J (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 4 Feb 2020 11:56:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id DF580B0B7;
        Tue,  4 Feb 2020 16:56:04 +0000 (UTC)
From:   Hannes Reinecke <hare@suse.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Bartolomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 08/46] libata: Add ata_port_classify() helper
Date:   Tue,  4 Feb 2020 17:55:09 +0100
Message-Id: <20200204165547.115220-9-hare@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200204165547.115220-1-hare@suse.de>
References: <20200204165547.115220-1-hare@suse.de>
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Add an ata_port_classify() helper to print out the results from
the device classification and remove the debugging statements
from ata_dev_classify(). Also provide a mapping ata_dev_class_string()
to provide a string representation for those instances calling
ata_dev_classify() directly.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/libahci.c       |  2 +-
 drivers/ata/libata-core.c   | 68 ++++++++++++++++++++++++++++++++++-----------
 drivers/ata/libata-sff.c    |  5 ++++
 drivers/ata/sata_fsl.c      |  2 +-
 drivers/ata/sata_inic162x.c |  2 +-
 drivers/ata/sata_sil24.c    |  2 +-
 include/linux/libata.h      |  3 ++
 7 files changed, 64 insertions(+), 20 deletions(-)

diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
index 4055071f213f..c1bc973ecc16 100644
--- a/drivers/ata/libahci.c
+++ b/drivers/ata/libahci.c
@@ -1276,7 +1276,7 @@ unsigned int ahci_dev_classify(struct ata_port *ap)
 	tf.lbal		= (tmp >> 8)	& 0xff;
 	tf.nsect	= (tmp)		& 0xff;
 
-	return ata_dev_classify(&tf);
+	return ata_port_classify(ap, &tf);
 }
 EXPORT_SYMBOL_GPL(ahci_dev_classify);
 
diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 0f5715cfa1c4..b2b96420a2f2 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -1025,6 +1025,27 @@ const char *sata_spd_string(unsigned int spd)
 	return spd_str[spd - 1];
 }
 
+const char *ata_dev_class_string(unsigned int class)
+{
+	static const char * const class_str[] = {
+		"unknown",
+		"ATA",
+		"ATA (unsupported)",
+		"ATAPI",
+		"ATAPI (unsupported",
+		"PMP",
+		"PMP (unsupported)",
+		"SEMB",
+		"SEMB (unsupported)",
+		"ZAC",
+		"ZAC (unsupported)",
+		"none",
+	};
+	if (class == 0 || (class - 1) >= ARRAY_SIZE(class_str))
+		return "unknown";
+	return class_str[class - 1];
+}
+
 /**
  *	ata_dev_classify - determine device type based on ATA-spec signature
  *	@tf: ATA taskfile register set for device to be identified
@@ -1063,35 +1084,48 @@ unsigned int ata_dev_classify(const struct ata_taskfile *tf)
 	 * SEMB signature.  This is worked around in
 	 * ata_dev_read_id().
 	 */
-	if ((tf->lbam == 0) && (tf->lbah == 0)) {
-		DPRINTK("found ATA device by sig\n");
+	if ((tf->lbam == 0) && (tf->lbah == 0))
 		return ATA_DEV_ATA;
-	}
 
-	if ((tf->lbam == 0x14) && (tf->lbah == 0xeb)) {
-		DPRINTK("found ATAPI device by sig\n");
+	if ((tf->lbam == 0x14) && (tf->lbah == 0xeb))
 		return ATA_DEV_ATAPI;
-	}
 
-	if ((tf->lbam == 0x69) && (tf->lbah == 0x96)) {
-		DPRINTK("found PMP device by sig\n");
+	if ((tf->lbam == 0x69) && (tf->lbah == 0x96))
 		return ATA_DEV_PMP;
-	}
 
-	if ((tf->lbam == 0x3c) && (tf->lbah == 0xc3)) {
-		DPRINTK("found SEMB device by sig (could be ATA device)\n");
+	if ((tf->lbam == 0x3c) && (tf->lbah == 0xc3))
 		return ATA_DEV_SEMB;
-	}
 
-	if ((tf->lbam == 0xcd) && (tf->lbah == 0xab)) {
-		DPRINTK("found ZAC device by sig\n");
+	if ((tf->lbam == 0xcd) && (tf->lbah == 0xab))
 		return ATA_DEV_ZAC;
-	}
 
-	DPRINTK("unknown device\n");
 	return ATA_DEV_UNKNOWN;
 }
 
+/**
+ *	ata_port_classify - determine device type based on ATA-spec signature
+ *	@ap: ATA port device on which the classification should be run
+ *	@tf: ATA taskfile register set for device to be identified
+ *
+ *	A wrapper around ata_dev_classify() to provide additional logging
+ *
+ *	RETURNS:
+ *	Device type, %ATA_DEV_ATA, %ATA_DEV_ATAPI, %ATA_DEV_PMP,
+ *	%ATA_DEV_ZAC, or %ATA_DEV_UNKNOWN the event of failure.
+ */
+unsigned int ata_port_classify(struct ata_port *ap,
+			      const struct ata_taskfile *tf)
+{
+	unsigned int class = ata_dev_classify(tf);
+
+	if (class != ATA_DEV_UNKNOWN)
+		ata_port_dbg(ap, "found %s device by sig\n",
+			     ata_dev_class_string(class));
+	else
+		ata_port_dbg(ap, "found unknown device\n");
+	return class;
+}
+
 /**
  *	ata_id_string - Convert IDENTIFY DEVICE page into string
  *	@id: IDENTIFY DEVICE results we will examine
@@ -7267,6 +7301,7 @@ EXPORT_SYMBOL_GPL(ata_xfer_mask2mode);
 EXPORT_SYMBOL_GPL(ata_xfer_mode2mask);
 EXPORT_SYMBOL_GPL(ata_xfer_mode2shift);
 EXPORT_SYMBOL_GPL(ata_mode_string);
+EXPORT_SYMBOL_GPL(ata_dev_class_string);
 EXPORT_SYMBOL_GPL(ata_id_xfermask);
 EXPORT_SYMBOL_GPL(ata_do_set_mode);
 EXPORT_SYMBOL_GPL(ata_std_qc_defer);
@@ -7282,6 +7317,7 @@ EXPORT_SYMBOL_GPL(sata_link_hardreset);
 EXPORT_SYMBOL_GPL(sata_std_hardreset);
 EXPORT_SYMBOL_GPL(ata_std_postreset);
 EXPORT_SYMBOL_GPL(ata_dev_classify);
+EXPORT_SYMBOL_GPL(ata_port_classify);
 EXPORT_SYMBOL_GPL(ata_dev_pair);
 EXPORT_SYMBOL_GPL(ata_ratelimit);
 EXPORT_SYMBOL_GPL(ata_msleep);
diff --git a/drivers/ata/libata-sff.c b/drivers/ata/libata-sff.c
index 931ae61d69fb..60509997137f 100644
--- a/drivers/ata/libata-sff.c
+++ b/drivers/ata/libata-sff.c
@@ -1839,6 +1839,11 @@ unsigned int ata_sff_dev_classify(struct ata_device *dev, int present,
 
 	/* determine if device is ATA or ATAPI */
 	class = ata_dev_classify(&tf);
+	if (class != ATA_DEV_UNKNOWN)
+		ata_dev_dbg(dev, "found %s device by sig\n",
+			     ata_dev_class_string(class));
+	else
+		ata_dev_dbg(dev, "found unknown device\n");
 
 	if (class == ATA_DEV_UNKNOWN) {
 		/* If the device failed diagnostic, it's likely to
diff --git a/drivers/ata/sata_fsl.c b/drivers/ata/sata_fsl.c
index d55ee244d693..0864c4fafa39 100644
--- a/drivers/ata/sata_fsl.c
+++ b/drivers/ata/sata_fsl.c
@@ -812,7 +812,7 @@ static unsigned int sata_fsl_dev_classify(struct ata_port *ap)
 	tf.lbal = (temp >> 8) & 0xff;
 	tf.nsect = temp & 0xff;
 
-	return ata_dev_classify(&tf);
+	return ata_port_classify(ap, &tf);
 }
 
 static int sata_fsl_hardreset(struct ata_link *link, unsigned int *class,
diff --git a/drivers/ata/sata_inic162x.c b/drivers/ata/sata_inic162x.c
index a6b76cc12a66..12f189f2ab1e 100644
--- a/drivers/ata/sata_inic162x.c
+++ b/drivers/ata/sata_inic162x.c
@@ -657,7 +657,7 @@ static int inic_hardreset(struct ata_link *link, unsigned int *class,
 		}
 
 		inic_tf_read(ap, &tf);
-		*class = ata_dev_classify(&tf);
+		*class = ata_port_classify(ap, &tf);
 	}
 
 	return 0;
diff --git a/drivers/ata/sata_sil24.c b/drivers/ata/sata_sil24.c
index 560070d4f1d0..2373cf5d8d14 100644
--- a/drivers/ata/sata_sil24.c
+++ b/drivers/ata/sata_sil24.c
@@ -677,7 +677,7 @@ static int sil24_softreset(struct ata_link *link, unsigned int *class,
 	}
 
 	sil24_read_tf(ap, 0, &tf);
-	*class = ata_dev_classify(&tf);
+	*class = ata_port_classify(ap, &tf);
 
 	DPRINTK("EXIT, class=%u\n", *class);
 	return 0;
diff --git a/include/linux/libata.h b/include/linux/libata.h
index 437d2f27bfdd..c7ffe6fb39f1 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -1173,7 +1173,10 @@ extern int ata_std_qc_defer(struct ata_queued_cmd *qc);
 extern enum ata_completion_errors ata_noop_qc_prep(struct ata_queued_cmd *qc);
 extern void ata_sg_init(struct ata_queued_cmd *qc, struct scatterlist *sg,
 		 unsigned int n_elem);
+extern const char *ata_dev_class_string(unsigned int class);
 extern unsigned int ata_dev_classify(const struct ata_taskfile *tf);
+extern unsigned int ata_port_classify(struct ata_port *ap,
+				      const struct ata_taskfile *tf);
 extern void ata_dev_disable(struct ata_device *adev);
 extern void ata_id_string(const u16 *id, unsigned char *s,
 			  unsigned int ofs, unsigned int len);
-- 
2.16.4

