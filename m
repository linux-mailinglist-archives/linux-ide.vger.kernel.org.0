Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23E00732935
	for <lists+linux-ide@lfdr.de>; Fri, 16 Jun 2023 09:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbjFPHti (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 16 Jun 2023 03:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234196AbjFPHth (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 16 Jun 2023 03:49:37 -0400
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107CF26B8
        for <linux-ide@vger.kernel.org>; Fri, 16 Jun 2023 00:49:34 -0700 (PDT)
X-ASG-Debug-ID: 1686901766-086e2331331b000002-WJxGKN
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx1.zhaoxin.com with ESMTP id y1nC2yySf7bT2RCI (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 16 Jun 2023 15:49:29 +0800 (CST)
X-Barracuda-Envelope-From: RunaGuo-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 16 Jun
 2023 15:49:26 +0800
Received: from zx.zhaoxin.com (10.29.8.9) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 16 Jun
 2023 15:49:26 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
From:   Runa Guo-oc <RunaGuo-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.163
To:     Damien Le Moal <dlemoal@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-ide@vger.kernel.org>
CC:     <CobeChen@zhaoxin.com>, <TimGuo@zhaoxin.com>,
        <TonyWWang@zhaoxin.com>, <LeoLiu@zhaoxin.com>
Subject: [PATCH] Signed-off-by: Runa Guo-oc <RunaGuo-oc@zhaoxin.com>
Date:   Fri, 16 Jun 2023 15:49:26 +0800
X-ASG-Orig-Subj: [PATCH] Signed-off-by: Runa Guo-oc <RunaGuo-oc@zhaoxin.com>
Message-ID: <1686901766-4928-1-git-send-email-RunaGuo-oc@zhaoxin.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.29.8.9]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1686901766
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 11709
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.110108
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

[PATCH] ata:sata_zhaoxin: Add support for ZhaoXin Serial ATA

Add ZhaoXin Serial ATA support for ZhaoXin CUPs.

Signed-off-by: Runa Guo-oc <RunaGuo-oc@zhaoxin.com>
---
 drivers/ata/Kconfig        |   8 +
 drivers/ata/Makefile       |   1 +
 drivers/ata/sata_zhaoxin.c | 384 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 393 insertions(+)
 create mode 100644 drivers/ata/sata_zhaoxin.c

diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index 42b51c9..ae327f3 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -553,6 +553,14 @@ config SATA_VITESSE
 
 	  If unsure, say N.
 
+config SATA_ZHAOXIN
+	tristate "ZhaoXin SATA support"
+	depends on PCI
+	help
+	  This option enables support for ZhaoXin Serial ATA.
+
+	  If unsure, say N.
+
 comment "PATA SFF controllers with BMDMA"
 
 config PATA_ALI
diff --git a/drivers/ata/Makefile b/drivers/ata/Makefile
index 20e6645..4b84669 100644
--- a/drivers/ata/Makefile
+++ b/drivers/ata/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_SATA_SIL)		+= sata_sil.o
 obj-$(CONFIG_SATA_SIS)		+= sata_sis.o
 obj-$(CONFIG_SATA_SVW)		+= sata_svw.o
 obj-$(CONFIG_SATA_ULI)		+= sata_uli.o
+obj-$(CONFIG_SATA_ZHAOXIN)	+= sata_zhaoxin.o
 obj-$(CONFIG_SATA_VIA)		+= sata_via.o
 obj-$(CONFIG_SATA_VITESSE)	+= sata_vsc.o
 
diff --git a/drivers/ata/sata_zhaoxin.c b/drivers/ata/sata_zhaoxin.c
new file mode 100644
index 0000000..ef8c73a
--- /dev/null
+++ b/drivers/ata/sata_zhaoxin.c
@@ -0,0 +1,384 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  sata_zhaoxin.c - ZhaoXin Serial ATA controllers
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/blkdev.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <scsi/scsi.h>
+#include <scsi/scsi_cmnd.h>
+#include <scsi/scsi_host.h>
+#include <linux/libata.h>
+
+#define DRV_NAME	"sata_zx"
+#define DRV_VERSION	"2.6.1"
+
+enum board_ids_enum {
+	zx100s,
+};
+
+enum {
+	SATA_CHAN_ENAB		= 0x40, /* SATA channel enable */
+	SATA_INT_GATE		= 0x41, /* SATA interrupt gating */
+	SATA_NATIVE_MODE	= 0x42, /* Native mode enable */
+	PATA_UDMA_TIMING	= 0xB3, /* PATA timing for DMA/ cable detect */
+	PATA_PIO_TIMING		= 0xAB, /* PATA timing register */
+
+	PORT0			= (1 << 1),
+	PORT1			= (1 << 0),
+	ALL_PORTS		= PORT0 | PORT1,
+
+	NATIVE_MODE_ALL		= (1 << 7) | (1 << 6) | (1 << 5) | (1 << 4),
+
+	SATA_EXT_PHY		= (1 << 6), /* 0==use PATA, 1==ext phy */
+};
+
+static int zx_init_one(struct pci_dev *pdev, const struct pci_device_id *ent);
+static int zx_scr_read(struct ata_link *link, unsigned int scr, u32 *val);
+static int zx_scr_write(struct ata_link *link, unsigned int scr, u32 val);
+static int zx_hardreset(struct ata_link *link, unsigned int *class,
+				unsigned long deadline);
+
+static void zx_tf_load(struct ata_port *ap, const struct ata_taskfile *tf);
+
+static const struct pci_device_id zx_pci_tbl[] = {
+	{ PCI_VDEVICE(ZHAOXIN, 0x9002), zx100s },
+	{ PCI_VDEVICE(ZHAOXIN, 0x9003), zx100s },
+
+	{ }	/* terminate list */
+};
+
+static struct pci_driver zx_pci_driver = {
+	.name			= DRV_NAME,
+	.id_table		= zx_pci_tbl,
+	.probe			= zx_init_one,
+#ifdef CONFIG_PM_SLEEP
+	.suspend		= ata_pci_device_suspend,
+	.resume			= ata_pci_device_resume,
+#endif
+	.remove			= ata_pci_remove_one,
+};
+
+static struct scsi_host_template zx_sht = {
+	ATA_BMDMA_SHT(DRV_NAME),
+};
+
+static struct ata_port_operations zx_base_ops = {
+	.inherits		= &ata_bmdma_port_ops,
+	.sff_tf_load		= zx_tf_load,
+};
+
+static struct ata_port_operations zx_ops = {
+	.inherits		= &zx_base_ops,
+	.hardreset		= zx_hardreset,
+	.scr_read		= zx_scr_read,
+	.scr_write		= zx_scr_write,
+};
+
+static struct ata_port_info zx100s_port_info = {
+	.flags		= ATA_FLAG_SATA | ATA_FLAG_SLAVE_POSS,
+	.pio_mask	= ATA_PIO4,
+	.mwdma_mask	= ATA_MWDMA2,
+	.udma_mask	= ATA_UDMA6,
+	.port_ops	= &zx_ops,
+};
+
+
+static int zx_hardreset(struct ata_link *link, unsigned int *class,
+				unsigned long deadline)
+{
+	int rc;
+
+	rc = sata_std_hardreset(link, class, deadline);
+	if (!rc || rc == -EAGAIN) {
+		struct ata_port *ap = link->ap;
+		int pmp = link->pmp;
+		int tmprc;
+
+		if (pmp) {
+			ap->ops->sff_dev_select(ap, pmp);
+			tmprc = ata_sff_wait_ready(&ap->link, deadline);
+		} else {
+			tmprc = ata_sff_wait_ready(link, deadline);
+		}
+		if (tmprc)
+			ata_link_err(link, "COMRESET failed for wait (errno=%d)\n",
+					rc);
+		else
+			ata_link_err(link, "wait for bsy success\n");
+
+		ata_link_err(link, "COMRESET success (errno=%d) ap=%d link %d\n",
+					rc, link->ap->port_no, link->pmp);
+	} else {
+		ata_link_err(link, "COMRESET failed (errno=%d) ap=%d link %d\n",
+					rc, link->ap->port_no, link->pmp);
+	}
+	return rc;
+}
+
+static int zx_scr_read(struct ata_link *link, unsigned int scr, u32 *val)
+{
+	static const u8 ipm_tbl[] = { 1, 2, 6, 0 };
+	struct pci_dev *pdev = to_pci_dev(link->ap->host->dev);
+	int slot = 2 * link->ap->port_no + link->pmp;
+	u32 v = 0;
+	u8 raw;
+
+	switch (scr) {
+	case SCR_STATUS:
+		pci_read_config_byte(pdev, 0xA0 + slot, &raw);
+
+		/* read the DET field, bit0 and 1 of the config byte */
+		v |= raw & 0x03;
+
+		/* read the SPD field, bit4 of the configure byte */
+		v |= raw & 0x30;
+
+		/* read the IPM field, bit2 and 3 of the config byte */
+		v |= ((ipm_tbl[(raw >> 2) & 0x3])<<8);
+		break;
+
+	case SCR_ERROR:
+		/* devices other than 5287 uses 0xA8 as base */
+		WARN_ON(pdev->device != 0x9002 && pdev->device != 0x9003);
+		pci_write_config_byte(pdev, 0x42, slot);
+		pci_read_config_dword(pdev, 0xA8, &v);
+		break;
+
+	case SCR_CONTROL:
+		pci_read_config_byte(pdev, 0xA4 + slot, &raw);
+
+		/* read the DET field, bit0 and bit1 */
+		v |= ((raw & 0x02) << 1) | (raw & 0x01);
+
+		/* read the IPM field, bit2 and bit3 */
+		v |= ((raw >> 2) & 0x03) << 8;
+
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	*val = v;
+	return 0;
+}
+
+static int zx_scr_write(struct ata_link *link, unsigned int scr, u32 val)
+{
+	struct pci_dev *pdev = to_pci_dev(link->ap->host->dev);
+	int slot = 2 * link->ap->port_no + link->pmp;
+	u32 v = 0;
+
+	WARN_ON(pdev == NULL);
+
+	switch (scr) {
+	case SCR_ERROR:
+		/* devices 0x9002 uses 0xA8 as base */
+		WARN_ON(pdev->device != 0x9002 && pdev->device != 0x9003);
+		pci_write_config_byte(pdev, 0x42, slot);
+		pci_write_config_dword(pdev, 0xA8, val);
+		return 0;
+
+	case SCR_CONTROL:
+		/* set the DET field */
+		v |= ((val & 0x4) >> 1) | (val & 0x1);
+
+		/* set the IPM field */
+		v |= ((val >> 8) & 0x3) << 2;
+
+
+		pci_write_config_byte(pdev, 0xA4 + slot, v);
+
+
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+
+/**
+ *	zx_tf_load - send taskfile registers to host controller
+ *	@ap: Port to which output is sent
+ *	@tf: ATA taskfile register set
+ *
+ *	Outputs ATA taskfile to standard ATA host controller.
+ *
+ *	This is to fix the internal bug of zx chipsets, which will
+ *	reset the device register after changing the IEN bit on ctl
+ *	register.
+ */
+static void zx_tf_load(struct ata_port *ap, const struct ata_taskfile *tf)
+{
+	struct ata_taskfile ttf;
+
+	if (tf->ctl != ap->last_ctl)  {
+		ttf = *tf;
+		ttf.flags |= ATA_TFLAG_DEVICE;
+		tf = &ttf;
+	}
+	ata_sff_tf_load(ap, tf);
+}
+
+static const unsigned int zx_bar_sizes[] = {
+	8, 4, 8, 4, 16, 256
+};
+
+static const unsigned int zx100s_bar_sizes0[] = {
+	8, 4, 8, 4, 16, 0
+};
+
+static const unsigned int zx100s_bar_sizes1[] = {
+	8, 4, 0, 0, 16, 0
+};
+
+static int zx_prepare_host(struct pci_dev *pdev, struct ata_host **r_host)
+{
+	const struct ata_port_info *ppi0[] = {
+		&zx100s_port_info, NULL
+	};
+	const struct ata_port_info *ppi1[] = {
+		&zx100s_port_info, &ata_dummy_port_info
+	};
+	struct ata_host *host;
+	int i, rc;
+
+	if (pdev->device == 0x9002)
+		rc = ata_pci_bmdma_prepare_host(pdev, ppi0, &host);
+	else if (pdev->device == 0x9003)
+		rc = ata_pci_bmdma_prepare_host(pdev, ppi1, &host);
+	else
+		rc = -EINVAL;
+
+	if (rc)
+		return rc;
+
+	*r_host = host;
+
+	/* 9002 hosts four sata ports as M/S of the two channels */
+	/* 9003 hosts two sata ports as M/S of the one channel */
+	for (i = 0; i < host->n_ports; i++)
+		ata_slave_link_init(host->ports[i]);
+
+	return 0;
+}
+
+static void zx_configure(struct pci_dev *pdev, int board_id)
+{
+	u8 tmp8;
+
+	pci_read_config_byte(pdev, PCI_INTERRUPT_LINE, &tmp8);
+	dev_info(&pdev->dev, "routed to hard irq line %d\n",
+		 (int) (tmp8 & 0xf0) == 0xf0 ? 0 : tmp8 & 0x0f);
+
+	/* make sure SATA channels are enabled */
+	pci_read_config_byte(pdev, SATA_CHAN_ENAB, &tmp8);
+	if ((tmp8 & ALL_PORTS) != ALL_PORTS) {
+		dev_dbg(&pdev->dev, "enabling SATA channels (0x%x)\n",
+			(int)tmp8);
+		tmp8 |= ALL_PORTS;
+		pci_write_config_byte(pdev, SATA_CHAN_ENAB, tmp8);
+	}
+
+	/* make sure interrupts for each channel sent to us */
+	pci_read_config_byte(pdev, SATA_INT_GATE, &tmp8);
+	if ((tmp8 & ALL_PORTS) != ALL_PORTS) {
+		dev_dbg(&pdev->dev, "enabling SATA channel interrupts (0x%x)\n",
+			(int) tmp8);
+		tmp8 |= ALL_PORTS;
+		pci_write_config_byte(pdev, SATA_INT_GATE, tmp8);
+	}
+
+	/* make sure native mode is enabled */
+	pci_read_config_byte(pdev, SATA_NATIVE_MODE, &tmp8);
+	if ((tmp8 & NATIVE_MODE_ALL) != NATIVE_MODE_ALL) {
+		dev_dbg(&pdev->dev,
+			"enabling SATA channel native mode (0x%x)\n",
+			(int) tmp8);
+		tmp8 |= NATIVE_MODE_ALL;
+		pci_write_config_byte(pdev, SATA_NATIVE_MODE, tmp8);
+	}
+}
+
+static int zx_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
+{
+	unsigned int i;
+	int rc;
+	struct ata_host *host = NULL;
+	int board_id = (int) ent->driver_data;
+	const unsigned int *bar_sizes;
+	int legacy_mode = 0;
+
+	ata_print_version_once(&pdev->dev, DRV_VERSION);
+
+	if (pdev->device == 0x9002 || pdev->device == 0x9003) {
+		if ((pdev->class >> 8) == PCI_CLASS_STORAGE_IDE) {
+			u8 tmp8, mask;
+
+			/* TODO: What if one channel is in native mode ... */
+			pci_read_config_byte(pdev, PCI_CLASS_PROG, &tmp8);
+			mask = (1 << 2) | (1 << 0);
+			if ((tmp8 & mask) != mask)
+				legacy_mode = 1;
+		}
+		if (legacy_mode)
+			return -EINVAL;
+	}
+
+	rc = pcim_enable_device(pdev);
+	if (rc)
+		return rc;
+
+	if (board_id == zx100s && pdev->device == 0x9002)
+		bar_sizes = &zx100s_bar_sizes0[0];
+	else if (board_id == zx100s && pdev->device == 0x9003)
+		bar_sizes = &zx100s_bar_sizes1[0];
+	else
+		bar_sizes = &zx_bar_sizes[0];
+
+	for (i = 0; i < ARRAY_SIZE(zx_bar_sizes); i++) {
+		if ((pci_resource_start(pdev, i) == 0) ||
+		    (pci_resource_len(pdev, i) < bar_sizes[i])) {
+			if (bar_sizes[i] == 0)
+				continue;
+
+			dev_err(&pdev->dev,
+				"invalid PCI BAR %u (sz 0x%llx, val 0x%llx)\n",
+				i,
+				(unsigned long long)pci_resource_start(pdev, i),
+				(unsigned long long)pci_resource_len(pdev, i));
+
+			return -ENODEV;
+		}
+	}
+
+	switch (board_id) {
+	case zx100s:
+		rc = zx_prepare_host(pdev, &host);
+		break;
+	default:
+		rc = -EINVAL;
+	}
+	if (rc)
+		return rc;
+
+	zx_configure(pdev, board_id);
+
+	pci_set_master(pdev);
+	return ata_host_activate(host, pdev->irq, ata_bmdma_interrupt,
+				 IRQF_SHARED, &zx_sht);
+}
+
+module_pci_driver(zx_pci_driver);
+
+MODULE_AUTHOR("Yanchen:YanchenSun@zhaoxin.com");
+MODULE_DESCRIPTION("SCSI low-level driver for ZX SATA controllers");
+MODULE_LICENSE("GPL");
+MODULE_DEVICE_TABLE(pci, zx_pci_tbl);
+MODULE_VERSION(DRV_VERSION);
-- 
1.9.1

