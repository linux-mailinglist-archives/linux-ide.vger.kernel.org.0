Return-Path: <linux-ide+bounces-1407-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F96A8D2F69
	for <lists+linux-ide@lfdr.de>; Wed, 29 May 2024 10:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A286C1C24800
	for <lists+linux-ide@lfdr.de>; Wed, 29 May 2024 08:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F6116F0C4;
	Wed, 29 May 2024 08:01:52 +0000 (UTC)
X-Original-To: linux-ide@vger.kernel.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp [153.127.30.23])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0561168C19;
	Wed, 29 May 2024 08:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=153.127.30.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716969711; cv=none; b=o26+Xv14F/jIhcSiD0i3ulzYQG7ONgc/LD6rGSF4f2Nskl1IkiuZcL7AALciq+1uwhUz/ZLTZR6XcXacp9+eInauLevRtgwWWPXj8+fsZbDLiwaLV6esMiRcffAWYIC51Lcs7Q5k6qQMr45XPGm3jvNgYDiQgqW/ZSfbBX/wyYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716969711; c=relaxed/simple;
	bh=sLbTYAMzZyQ8pRDqLCryisybva0I4q0vAgBJlm0LX8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DSR/i5V5ANLVlT+8HO1Vci50nP8tb/1ZlEJYkLylt54k8A/8M0TuQGGKJwncmhB20WTKEnz2tzvTjZ5gULWNK2MCXS5GYD5q4DymVM5OQ4rAgdBG+FiPNMUYa9K4SJZ7zGrfMEDVTBZonkrtsWE7UcJsbEdukbbqcGoJa+tGZKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=users.sourceforge.jp; spf=fail smtp.mailfrom=users.sourceforge.jp; arc=none smtp.client-ip=153.127.30.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=users.sourceforge.jp
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=users.sourceforge.jp
Received: from SIOS1075.ysato.name (al128006.dynamic.ppp.asahi-net.or.jp [111.234.128.6])
	by sakura.ysato.name (Postfix) with ESMTPSA id B37D71C09E7;
	Wed, 29 May 2024 17:01:47 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Lee Jones <lee@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Azeem Shaikh <azeemshaikh38@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sam Ravnborg <sam@ravnborg.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-ide@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [DO NOT MERGE v8 11/36] pci: pci-sh7751: Add SH7751 PCI driver
Date: Wed, 29 May 2024 17:00:57 +0900
Message-Id: <1f1420a50fbdee5f5e07a3345a6dd6b921c78969.1716965617.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1716965617.git.ysato@users.sourceforge.jp>
References: <cover.1716965617.git.ysato@users.sourceforge.jp>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renesas SH7751 CPU Internal PCI Controller driver.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 drivers/pci/controller/Kconfig      |   9 +
 drivers/pci/controller/Makefile     |   1 +
 drivers/pci/controller/pci-sh7751.c | 335 ++++++++++++++++++++++++++++
 3 files changed, 345 insertions(+)
 create mode 100644 drivers/pci/controller/pci-sh7751.c

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index e534c02ee34f..a2fd917a2e03 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -353,6 +353,15 @@ config PCIE_XILINX_CPM
 	  Say 'Y' here if you want kernel support for the
 	  Xilinx Versal CPM host bridge.
 
+config PCI_SH7751
+	bool "Renesas SH7751 PCI controller"
+	depends on OF
+	depends on CPU_SUBTYPE_SH7751 || CPU_SUBTYPE_SH7751R || COMPILE_TEST
+	select PCI_HOST_COMMON
+	help
+	  Say 'Y' here if you want kernel to support the Renesas SH7751 PCI
+	  Host Bridge driver.
+
 source "drivers/pci/controller/cadence/Kconfig"
 source "drivers/pci/controller/dwc/Kconfig"
 source "drivers/pci/controller/mobiveil/Kconfig"
diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Makefile
index f2b19e6174af..aa97e5d74e58 100644
--- a/drivers/pci/controller/Makefile
+++ b/drivers/pci/controller/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_PCI_LOONGSON) += pci-loongson.o
 obj-$(CONFIG_PCIE_HISI_ERR) += pcie-hisi-error.o
 obj-$(CONFIG_PCIE_APPLE) += pcie-apple.o
 obj-$(CONFIG_PCIE_MT7621) += pcie-mt7621.o
+obj-$(CONFIG_PCI_SH7751) += pci-sh7751.o
 
 # pcie-hisi.o quirks are needed even without CONFIG_PCIE_DW
 obj-y				+= dwc/
diff --git a/drivers/pci/controller/pci-sh7751.c b/drivers/pci/controller/pci-sh7751.c
new file mode 100644
index 000000000000..73ccc14800f7
--- /dev/null
+++ b/drivers/pci/controller/pci-sh7751.c
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SH7751 PCI driver
+ * Copyright (C) 2023 Yoshinori Sato
+ */
+
+#include <linux/dma-direct.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_pci.h>
+#include <linux/of_platform.h>
+#include <linux/pci.h>
+#include <linux/pci-ecam.h>
+#include <linux/platform_device.h>
+#include <asm/addrspace.h>
+
+/* PCICR and PCICLKCR write enable magic key */
+#define PCIC_WE_KEY		(0xa5 << 24)
+
+/* PCIC registers */
+/* 0x0000 - 0x00ff mapped to PCI device configuration space */
+#define PCIC_PCICR		0x100	/* PCI Control Register */
+#define PCIC_PCICR_TRSB		BIT(9)	/* Target Read Single */
+#define PCIC_PCICR_BSWP		BIT(8)	/* Target Byte Swap */
+#define PCIC_PCICR_PLUP		BIT(7)	/* Enable PCI Pullup */
+#define PCIC_PCICR_ARBM		BIT(6)	/* PCI Arbitration Mode */
+#define PCIC_PCICR_MD10		BIT(5)	/* MD10 status */
+#define PCIC_PCICR_MD9		BIT(4)	/* MD9 status */
+#define PCIC_PCICR_SERR		BIT(3)	/* SERR output assert */
+#define PCIC_PCICR_INTA		BIT(2)	/* INTA output assert */
+#define PCIC_PCICR_PRST		BIT(1)	/* PCI Reset Assert */
+#define PCIC_PCICR_CFIN		BIT(0)	/* Central Fun. Init Done */
+
+#define PCIC_PCILSR0		0x104	/* PCI Local Space Register0 */
+#define PCIC_PCILSR1		0x108	/* PCI Local Space Register1 */
+#define PCIC_PCILAR0		0x10c	/* PCI Local Addr Register1 */
+#define PCIC_PCILAR1		0x110	/* PCI Local Addr Register1 */
+#define PCIC_PCIINT		0x114	/* PCI Interrupt Register */
+#define PCIC_PCIINTM		0x118	/* PCI Interrupt Mask */
+#define PCIC_PCIALR		0x11c	/* Error Address Register */
+#define PCIC_PCICLR		0x120	/* Error Command/Data */
+#define PCIC_PCIAINT		0x130	/* Arbiter Interrupt Register */
+#define PCIC_PCIAINTM		0x134	/* Arbiter Int. Mask Register */
+#define PCIC_PCIBMLR		0x138	/* Error Bus Master Register */
+#define PCIC_PCIDMABT		0x140	/* DMA Transfer Arb. Register */
+#define PCIC_PCIPAR		0x1c0	/* PIO Address Register */
+#define PCIC_PCIMBR		0x1c4	/* Memory Base Address */
+#define PCIC_PCIIOBR		0x1c8	/* I/O Base Address Register */
+
+#define PCIC_PCIPINT		0x1cc	/* Power Mgmnt Int. Register */
+#define PCIC_PCIPINT_D3		BIT(1)	/* D3 Pwr Mgmt. Interrupt */
+#define PCIC_PCIPINT_D0		BIT(0)	/* D0 Pwr Mgmt. Interrupt */
+
+#define PCIC_PCIPINTM		0x1d0	/* Power Mgmnt Mask Register */
+#define PCIC_PCICLKR		0x1d4	/* Clock Ctrl. Register */
+#define PCIC_PCIBCR1		0x1e0	/* Memory BCR1 Register */
+#define PCIC_PCIBCR2		0x1e4	/* Memory BCR2 Register */
+#define PCIC_PCIWCR1		0x1e8	/* Wait Control 1 Register */
+#define PCIC_PCIWCR2		0x1ec	/* Wait Control 2 Register */
+#define PCIC_PCIWCR3		0x1f0	/* Wait Control 3 Register */
+#define PCIC_PCIMCR		0x1f4	/* Memory Control Register */
+#define PCIC_PCIBCR3		0x1f8	/* Memory BCR3 Register */
+#define PCIC_PCIPDR		0x220	/* Port IO Data Register */
+
+/* PCI IDs */
+/*
+ * Hitachi is the company that led to Renesas.
+ * The SH7751 was designed by Hitachi, so it has a Hitachi ID.
+ */
+#define PCI_VENDOR_ID_HITACHI	0x1054
+#define PCI_DEVICE_ID_SH7751	0x3505
+#define PCI_DEVICE_ID_SH7751R	0x350e
+
+/* BSC registers */
+/* Copy BSC setting to PCI BSC */
+#define BSC_BCR1		0x0000
+#define BSC_BCR1_SLAVE		BIT(30)
+#define BSC_BCR1_BRQEN		BIT(19)
+#define BSC_BCR2		0x0004
+#define BSC_BCR3		0x0050
+#define BSC_WCR1		0x0008
+#define BSC_WCR2		0x000c
+#define BSC_WCR3		0x0010
+#define BSC_MCR			0x0014
+#define BSC_MCR_MRSET		BIT(30)
+#define BSC_MCR_RFSH		BIT(2)
+
+/*
+ * We need to avoid collisions with `mirrored' VGA ports
+ * and other strange ISA hardware, so we always want the
+ * addresses to be allocated in the 0x000-0x0ff region
+ * modulo 0x400.
+ */
+#define IO_REGION_BASE 0x1000
+resource_size_t pcibios_align_resource(void *data, const struct resource *res,
+				resource_size_t size, resource_size_t align)
+{
+	resource_size_t start = res->start;
+
+	if (res->flags & IORESOURCE_IO) {
+		if (start < PCIBIOS_MIN_IO + IO_REGION_BASE)
+			start = PCIBIOS_MIN_IO + IO_REGION_BASE;
+
+		/*
+		 * Put everything into 0x00-0xff region modulo 0x400.
+		 */
+		if (start & 0x300)
+			start = (start + 0x3ff) & ~0x3ff;
+	}
+
+	return start;
+}
+
+static int setup_pci_bsc(struct device *dev, void __iomem *pcic,
+			 void __iomem *bsc, unsigned int area, bool bcr3)
+{
+	u32 word;
+
+	word = __raw_readl(bsc + BSC_BCR1);
+	/* check BCR for SDRAM in area */
+	if (((word >> area) & 1) == 0) {
+		dev_err(dev, "Area %u is not configured for SDRAM. BCR1=0x%x\n",
+			area, word);
+		return -EINVAL;
+	}
+	word |= BSC_BCR1_SLAVE;		/* PCIC BSC is slave only */
+	writel(word, pcic + PCIC_PCIBCR1);
+
+	word = __raw_readw(bsc + BSC_BCR2);
+	/* check BCR2 for 32bit SDRAM interface*/
+	if (((word >> (area << 1)) & 0x3) != 0x3) {
+		dev_err(dev, "Area %u is not 32 bit SDRAM. BCR2=0x%x\n",
+			area, word);
+		return -EINVAL;
+	}
+	writel(word, pcic + PCIC_PCIBCR2);
+
+	if (bcr3) {
+		/* BCR3 have only SH7751R */
+		word = __raw_readw(bsc + BSC_BCR3);
+		writel(word, pcic + PCIC_PCIBCR3);
+	}
+
+	/* configure the wait control registers */
+	word = __raw_readl(bsc + BSC_WCR1);
+	writel(word, pcic + PCIC_PCIWCR1);
+	word = __raw_readl(bsc + BSC_WCR2);
+	writel(word, pcic + PCIC_PCIWCR2);
+	word = __raw_readl(bsc + BSC_WCR3);
+	writel(word, pcic + PCIC_PCIWCR3);
+	word = __raw_readl(bsc + BSC_MCR);
+	/* Clear MRSET and RFSH bit */
+	word &= ~(BSC_MCR_MRSET | BSC_MCR_RFSH);
+	writel(word, pcic + PCIC_PCIMCR);
+
+	return 0;
+}
+
+#define NUM_AREA 7
+static int set_pci_ranges(struct device *dev,
+			  void __iomem *pcic, void __iomem *bsc, bool bcr3)
+{
+	struct resource_entry *dma, *tmp;
+	struct pci_host_bridge *bridge;
+	u32 bsc_done[NUM_AREA];
+	unsigned int la;
+
+	bridge = dev_get_drvdata(dev);
+	writel(0, pcic + PCIC_PCILAR0);
+	writel(0, pcic + PCIC_PCILAR1);
+	la = 0;
+	memset(&bsc_done, 0, sizeof(bsc_done));
+	resource_list_for_each_entry_safe(dma, tmp, &bridge->dma_ranges) {
+		struct resource *res = dma->res;
+		unsigned int area;
+		u32 word;
+
+		switch (resource_type(res)) {
+		case IORESOURCE_REG:
+			word = res->start | 1;
+			writel(word, pcic + PCI_BASE_ADDRESS_0);
+			word = readl(pcic + PCI_COMMAND);
+			word |= PCI_COMMAND_IO;
+			writel(word, pcic + PCI_COMMAND);
+			break;
+		case IORESOURCE_MEM:
+			if (la > 4) {
+				dev_err(dev, "Invalid range definition.\n");
+				return -EINVAL;
+			}
+			area = (res->start >> 26) & 0x07;
+			if (area >= NUM_AREA) {
+				/* Area 7 is reserved. */
+				dev_info(dev, "Invalid local address 0x%08x. Ignore it.\n",
+					 res->start);
+				break;
+			}
+			writel(res->start, pcic + PCI_BASE_ADDRESS_1 + la);
+			word = res->end - res->start;
+			/* if dummy entry, skip BSC setup */
+			if (word <= 4)
+				break;
+			/* BAR1 is local area 0, BAR2 is local area 1 */
+			writel(word, pcic + PCIC_PCILSR0 + la);
+			word = P2SEGADDR(res->start);
+			writel(word, pcic + PCIC_PCILAR0 + la);
+			la += 4;
+			if (!bsc_done[area]) {
+				/* check BCR for SDRAM in specified area. And setup PCI BSC. */
+				if (setup_pci_bsc(dev, pcic, bsc, area, bcr3))
+					return -EINVAL;
+				bsc_done[area] = 1;
+			}
+			break;
+		}
+	}
+	return 0;
+}
+
+static int sh7751_pci_probe(struct platform_device *pdev)
+{
+	struct resource *res, *bscres;
+	void __iomem *pcic;
+	void __iomem *bsc;
+	u16 vid, did;
+	u32 word;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (IS_ERR(res))
+		return PTR_ERR(res);
+	pcic = ioremap(res->start, res->end - res->start + 1);
+
+	bscres = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	bsc = devm_ioremap_resource(&pdev->dev, bscres);
+	if (IS_ERR(bsc))
+		return PTR_ERR(bsc);
+
+	/* check for SH7751/SH7751R hardware */
+	word = readl(pcic + PCI_VENDOR_ID);
+	vid = word & 0xffff;
+	did = word >> 16;
+	if ((vid != PCI_VENDOR_ID_HITACHI) ||
+	    ((did != PCI_DEVICE_ID_SH7751) &&
+	     (did != PCI_DEVICE_ID_SH7751R))) {
+		dev_err(&pdev->dev, "This is not an SH7751(R)\n");
+		return -ENODEV;
+	}
+	dev_info(&pdev->dev, "PCI core found at %pR\n", res);
+
+	/* Set the BCR's to enable PCI access */
+	word = __raw_readl(bsc + BSC_BCR1);
+	word |= BSC_BCR1_BRQEN;
+	__raw_writel(word, bsc + BSC_BCR1);
+
+	/* Turn the clocks back on (not done in reset)*/
+	writel(PCIC_WE_KEY | 0, pcic + PCIC_PCICLKR);
+	/* Clear Powerdown IRQ's (not done in reset) */
+	writel(PCIC_PCIPINT_D3 | PCIC_PCIPINT_D0, pcic + PCIC_PCIPINT);
+	/* set the command/status */
+	word = PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER |
+		PCI_COMMAND_PARITY | PCI_COMMAND_WAIT;
+	writel(word, pcic + PCI_COMMAND);
+
+	/* define this host as the host bridge */
+	writel(PCI_BASE_CLASS_BRIDGE << 24, pcic + PCI_CLASS_REVISION);
+
+	ret = pci_host_common_probe(pdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Initialize failed (%d)\n", ret);
+		return ret;
+	}
+
+	/* Set IO and Mem windows to local address */
+	if (set_pci_ranges(&pdev->dev, pcic, bsc,
+			   did == PCI_DEVICE_ID_SH7751R))
+		return -EINVAL;
+	writel(0, pcic + PCIC_PCIIOBR);
+
+	if (of_property_read_bool(pdev->dev.of_node, "renesas,bus-arbit-round-robin"))
+		word = BIT(0);
+	else
+		word = 0;
+	writel(word, pcic + PCIC_PCIDMABT);
+
+	/* SH7751 init done, set central function init complete */
+	/* use round robin mode to stop a device starving/overrunning */
+	writel(PCIC_WE_KEY | PCIC_PCICR_CFIN | PCIC_PCICR_ARBM, pcic + PCIC_PCICR);
+
+	return 0;
+}
+
+/*
+ * Direct access to PCI hardware...
+ */
+#define CONFIG_CMD(bus, devfn, where) \
+	(0x80000000 | (bus->number << 16) | (devfn << 8) | (where & ~3))
+
+static void __iomem *sh4_pci_map_bus(struct pci_bus *bus,
+				     unsigned int devfn, int where)
+{
+	struct pci_config_window *cfg = bus->sysdata;
+	void __iomem *pcic = (void __iomem *)cfg->res.start;
+
+	writel(CONFIG_CMD(bus, devfn, where), pcic + PCIC_PCIPAR);
+	return pcic + PCIC_PCIPDR;
+}
+
+static const struct pci_ecam_ops pci_sh7751_bus_ops = {
+	.pci_ops	= {
+		.map_bus = sh4_pci_map_bus,
+		.read    = pci_generic_config_read32,
+		.write   = pci_generic_config_write32,
+	}
+};
+
+static const struct of_device_id sh7751_pci_of_match[] = {
+	{ .compatible = "renesas,sh7751-pci",
+	  .data = &pci_sh7751_bus_ops },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sh7751_pci_of_match);
+
+static struct platform_driver sh7751_pci_driver = {
+	.driver = {
+		.name = "sh7751-pci",
+		.of_match_table = sh7751_pci_of_match,
+	},
+	.probe = sh7751_pci_probe,
+};
+module_platform_driver(sh7751_pci_driver);
+
+MODULE_DESCRIPTION("SH7751 PCI driver");
-- 
2.39.2


