Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACB851F1AD
	for <lists+linux-ide@lfdr.de>; Sun,  8 May 2022 22:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232706AbiEHUpq (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 8 May 2022 16:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232721AbiEHUpi (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 8 May 2022 16:45:38 -0400
Received: from mxout01.lancloud.ru (mxout01.lancloud.ru [45.84.86.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 590CBAE65
        for <linux-ide@vger.kernel.org>; Sun,  8 May 2022 13:41:43 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 42C0920D602F
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
Subject: [PATCH 1/3] ata: make packed transfer mode masks *unsigned int*
Date:   Sun, 8 May 2022 23:41:37 +0300
Message-ID: <20220508204139.4961-2-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20220508204139.4961-1-s.shtylyov@omp.ru>
References: <20220508204139.4961-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The packed transfer mode masks are declared as *unsigned long* (which is
a 64-bit type on 64-bit architectures), however the actual mask occupies
only 20 bits (7 PIO modes, 5 MWDMA modes, and 8 UDMA modes), so we can
safely use 32-bit *unsigned int* variables instead.  Convert all libata
functions taking as a parameter or returning a packed transfer mode mask.
This saves 470 bytes of object code in libata-core.o alone...

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/ata/libata-acpi.c      |  9 +++++----
 drivers/ata/libata-core.c      | 28 ++++++++++++-------------
 drivers/ata/pata_acpi.c        |  2 +-
 drivers/ata/pata_ali.c         |  2 +-
 drivers/ata/pata_amd.c         | 14 ++++++-------
 drivers/ata/pata_hpt366.c      |  2 +-
 drivers/ata/pata_hpt37x.c      |  6 +++---
 drivers/ata/pata_hpt3x2n.c     |  2 +-
 drivers/ata/pata_pdc2027x.c    |  4 ++--
 drivers/ata/pata_serverworks.c |  4 ++--
 drivers/ata/pata_sis.c         |  2 +-
 drivers/ata/pata_via.c         |  2 +-
 include/linux/libata.h         | 37 +++++++++++++++++-----------------
 13 files changed, 57 insertions(+), 57 deletions(-)

diff --git a/drivers/ata/libata-acpi.c b/drivers/ata/libata-acpi.c
index 3d345d173556..cdb7c0238a43 100644
--- a/drivers/ata/libata-acpi.c
+++ b/drivers/ata/libata-acpi.c
@@ -480,10 +480,10 @@ static int ata_dev_get_GTF(struct ata_device *dev, struct ata_acpi_gtf **gtf)
  * RETURNS:
  * Determined xfermask.
  */
-unsigned long ata_acpi_gtm_xfermask(struct ata_device *dev,
-				    const struct ata_acpi_gtm *gtm)
+unsigned int ata_acpi_gtm_xfermask(struct ata_device *dev,
+				   const struct ata_acpi_gtm *gtm)
 {
-	unsigned long xfer_mask = 0;
+	unsigned int xfer_mask = 0;
 	unsigned int type;
 	int unit;
 	u8 mode;
@@ -525,7 +525,8 @@ int ata_acpi_cbl_80wire(struct ata_port *ap, const struct ata_acpi_gtm *gtm)
 	struct ata_device *dev;
 
 	ata_for_each_dev(dev, &ap->link, ENABLED) {
-		unsigned long xfer_mask, udma_mask;
+		unsigned long udma_mask;
+		unsigned int xfer_mask;
 
 		xfer_mask = ata_acpi_gtm_xfermask(dev, gtm);
 		ata_unpack_xfermask(xfer_mask, NULL, NULL, &udma_mask);
diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 95bd028aea4f..2a6f301c3359 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -93,7 +93,7 @@ struct ata_force_param {
 	const char	*name;
 	u8		cbl;
 	u8		spd_limit;
-	unsigned long	xfer_mask;
+	unsigned int	xfer_mask;
 	unsigned int	horkage_on;
 	unsigned int	horkage_off;
 	u16		lflags;
@@ -796,9 +796,9 @@ int ata_build_rw_tf(struct ata_taskfile *tf, struct ata_device *dev,
  *	RETURNS:
  *	Packed xfer_mask.
  */
-unsigned long ata_pack_xfermask(unsigned long pio_mask,
-				unsigned long mwdma_mask,
-				unsigned long udma_mask)
+unsigned int ata_pack_xfermask(unsigned long pio_mask,
+			       unsigned long mwdma_mask,
+			       unsigned long udma_mask)
 {
 	return ((pio_mask << ATA_SHIFT_PIO) & ATA_MASK_PIO) |
 		((mwdma_mask << ATA_SHIFT_MWDMA) & ATA_MASK_MWDMA) |
@@ -816,7 +816,7 @@ EXPORT_SYMBOL_GPL(ata_pack_xfermask);
  *	Unpack @xfer_mask into @pio_mask, @mwdma_mask and @udma_mask.
  *	Any NULL destination masks will be ignored.
  */
-void ata_unpack_xfermask(unsigned long xfer_mask, unsigned long *pio_mask,
+void ata_unpack_xfermask(unsigned int xfer_mask, unsigned long *pio_mask,
 			 unsigned long *mwdma_mask, unsigned long *udma_mask)
 {
 	if (pio_mask)
@@ -850,7 +850,7 @@ static const struct ata_xfer_ent {
  *	RETURNS:
  *	Matching XFER_* value, 0xff if no match found.
  */
-u8 ata_xfer_mask2mode(unsigned long xfer_mask)
+u8 ata_xfer_mask2mode(unsigned int xfer_mask)
 {
 	int highbit = fls(xfer_mask) - 1;
 	const struct ata_xfer_ent *ent;
@@ -874,7 +874,7 @@ EXPORT_SYMBOL_GPL(ata_xfer_mask2mode);
  *	RETURNS:
  *	Matching xfer_mask, 0 if no match found.
  */
-unsigned long ata_xfer_mode2mask(u8 xfer_mode)
+unsigned int ata_xfer_mode2mask(u8 xfer_mode)
 {
 	const struct ata_xfer_ent *ent;
 
@@ -923,7 +923,7 @@ EXPORT_SYMBOL_GPL(ata_xfer_mode2shift);
  *	Constant C string representing highest speed listed in
  *	@mode_mask, or the constant C string "<n/a>".
  */
-const char *ata_mode_string(unsigned long xfer_mask)
+const char *ata_mode_string(unsigned int xfer_mask)
 {
 	static const char * const xfer_mode_str[] = {
 		"PIO0",
@@ -1376,7 +1376,7 @@ static inline void ata_dump_id(struct ata_device *dev, const u16 *id)
  *	RETURNS:
  *	Computed xfermask
  */
-unsigned long ata_id_xfermask(const u16 *id)
+unsigned int ata_id_xfermask(const u16 *id)
 {
 	unsigned long pio_mask, mwdma_mask, udma_mask;
 
@@ -2522,7 +2522,7 @@ int ata_dev_configure(struct ata_device *dev)
 	struct ata_port *ap = dev->link->ap;
 	bool print_info = ata_dev_print_info(dev);
 	const u16 *id = dev->id;
-	unsigned long xfer_mask;
+	unsigned int xfer_mask;
 	unsigned int err_mask;
 	char revbuf[7];		/* XYZ-99\0 */
 	char fwrevbuf[ATA_ID_FW_REV_LEN+1];
@@ -3190,7 +3190,7 @@ u8 ata_timing_cycle2mode(unsigned int xfer_shift, int cycle)
 int ata_down_xfermask_limit(struct ata_device *dev, unsigned int sel)
 {
 	char buf[32];
-	unsigned long orig_mask, xfer_mask;
+	unsigned int orig_mask, xfer_mask;
 	unsigned long pio_mask, mwdma_mask, udma_mask;
 	int quiet, highbit;
 
@@ -3369,7 +3369,7 @@ int ata_do_set_mode(struct ata_link *link, struct ata_device **r_failed_dev)
 
 	/* step 1: calculate xfer_mask */
 	ata_for_each_dev(dev, link, ENABLED) {
-		unsigned long pio_mask, dma_mask;
+		unsigned int pio_mask, dma_mask;
 		unsigned int mode_mask;
 
 		mode_mask = ATA_DMA_MASK_ATA;
@@ -4205,7 +4205,7 @@ static void ata_dev_xfermask(struct ata_device *dev)
 	struct ata_link *link = dev->link;
 	struct ata_port *ap = link->ap;
 	struct ata_host *host = ap->host;
-	unsigned long xfer_mask;
+	unsigned int xfer_mask;
 
 	/* controller modes available */
 	xfer_mask = ata_pack_xfermask(ap->pio_mask,
@@ -5764,7 +5764,7 @@ int ata_host_register(struct ata_host *host, struct scsi_host_template *sht)
 	/* set cable, sata_spd_limit and report */
 	for (i = 0; i < host->n_ports; i++) {
 		struct ata_port *ap = host->ports[i];
-		unsigned long xfer_mask;
+		unsigned int xfer_mask;
 
 		/* set SATA cable type if still unset */
 		if (ap->cbl == ATA_CBL_NONE && (ap->flags & ATA_FLAG_SATA))
diff --git a/drivers/ata/pata_acpi.c b/drivers/ata/pata_acpi.c
index ade4c3eee230..f8706ee427d2 100644
--- a/drivers/ata/pata_acpi.c
+++ b/drivers/ata/pata_acpi.c
@@ -97,7 +97,7 @@ static unsigned long pacpi_discover_modes(struct ata_port *ap, struct ata_device
  *	this case the list of discovered valid modes obtained by ACPI probing
  */
 
-static unsigned long pacpi_mode_filter(struct ata_device *adev, unsigned long mask)
+static unsigned int pacpi_mode_filter(struct ata_device *adev, unsigned int mask)
 {
 	struct pata_acpi *acpi = adev->link->ap->private_data;
 	return mask & acpi->mask[adev->devno];
diff --git a/drivers/ata/pata_ali.c b/drivers/ata/pata_ali.c
index 1b90cda27246..76ad0e73fe2a 100644
--- a/drivers/ata/pata_ali.c
+++ b/drivers/ata/pata_ali.c
@@ -115,7 +115,7 @@ static int ali_c2_cable_detect(struct ata_port *ap)
  *	fix that later on. Also ensure we do not do UDMA on WDC drives
  */
 
-static unsigned long ali_20_filter(struct ata_device *adev, unsigned long mask)
+static unsigned int ali_20_filter(struct ata_device *adev, unsigned int mask)
 {
 	char model_num[ATA_ID_PROD_LEN + 1];
 	/* No DMA on anything but a disk for now */
diff --git a/drivers/ata/pata_amd.c b/drivers/ata/pata_amd.c
index 154748cfcc79..f216f9d7b9ec 100644
--- a/drivers/ata/pata_amd.c
+++ b/drivers/ata/pata_amd.c
@@ -264,8 +264,8 @@ static void amd133_set_dmamode(struct ata_port *ap, struct ata_device *adev)
  * cached during driver attach and are consulted to select transfer
  * mode.
  */
-static unsigned long nv_mode_filter(struct ata_device *dev,
-				    unsigned long xfer_mask)
+static unsigned int nv_mode_filter(struct ata_device *dev,
+				   unsigned int xfer_mask)
 {
 	static const unsigned int udma_mask_map[] =
 		{ ATA_UDMA2, ATA_UDMA1, ATA_UDMA0, 0,
@@ -274,7 +274,7 @@ static unsigned long nv_mode_filter(struct ata_device *dev,
 	char acpi_str[32] = "";
 	u32 saved_udma, udma;
 	const struct ata_acpi_gtm *gtm;
-	unsigned long bios_limit = 0, acpi_limit = 0, limit;
+	unsigned int bios_limit = 0, acpi_limit = 0, limit;
 
 	/* find out what BIOS configured */
 	udma = saved_udma = (unsigned long)ap->host->private_data;
@@ -310,10 +310,10 @@ static unsigned long nv_mode_filter(struct ata_device *dev,
 	   cable detection result */
 	limit |= ata_pack_xfermask(ATA_PIO4, ATA_MWDMA2, ATA_UDMA2);
 
-	ata_port_dbg(ap, "nv_mode_filter: 0x%lx&0x%lx->0x%lx, "
-			"BIOS=0x%lx (0x%x) ACPI=0x%lx%s\n",
-			xfer_mask, limit, xfer_mask & limit, bios_limit,
-			saved_udma, acpi_limit, acpi_str);
+	ata_port_dbg(ap,
+		     "nv_mode_filter: 0x%x&0x%x->0x%x, BIOS=0x%x (0x%x) ACPI=0x%x%s\n",
+		     xfer_mask, limit, xfer_mask & limit, bios_limit,
+		     saved_udma, acpi_limit, acpi_str);
 
 	return xfer_mask & limit;
 }
diff --git a/drivers/ata/pata_hpt366.c b/drivers/ata/pata_hpt366.c
index c99e8f0708b3..7e441fb304d3 100644
--- a/drivers/ata/pata_hpt366.c
+++ b/drivers/ata/pata_hpt366.c
@@ -194,7 +194,7 @@ static int hpt_dma_blacklisted(const struct ata_device *dev, char *modestr,
  *	Block UDMA on devices that cause trouble with this controller.
  */
 
-static unsigned long hpt366_filter(struct ata_device *adev, unsigned long mask)
+static unsigned int hpt366_filter(struct ata_device *adev, unsigned int mask)
 {
 	if (adev->class == ATA_DEV_ATA) {
 		if (hpt_dma_blacklisted(adev, "UDMA",  bad_ata33))
diff --git a/drivers/ata/pata_hpt37x.c b/drivers/ata/pata_hpt37x.c
index 156f304ef051..0e9f490214de 100644
--- a/drivers/ata/pata_hpt37x.c
+++ b/drivers/ata/pata_hpt37x.c
@@ -278,7 +278,7 @@ static const char * const bad_ata100_5[] = {
  *	Block UDMA on devices that cause trouble with this controller.
  */
 
-static unsigned long hpt370_filter(struct ata_device *adev, unsigned long mask)
+static unsigned int hpt370_filter(struct ata_device *adev, unsigned int mask)
 {
 	if (adev->class == ATA_DEV_ATA) {
 		if (hpt_dma_blacklisted(adev, "UDMA", bad_ata33))
@@ -297,7 +297,7 @@ static unsigned long hpt370_filter(struct ata_device *adev, unsigned long mask)
  *	Block UDMA on devices that cause trouble with this controller.
  */
 
-static unsigned long hpt370a_filter(struct ata_device *adev, unsigned long mask)
+static unsigned int hpt370a_filter(struct ata_device *adev, unsigned int mask)
 {
 	if (adev->class == ATA_DEV_ATA) {
 		if (hpt_dma_blacklisted(adev, "UDMA100", bad_ata100_5))
@@ -314,7 +314,7 @@ static unsigned long hpt370a_filter(struct ata_device *adev, unsigned long mask)
  *	The Marvell bridge chips used on the HighPoint SATA cards do not seem
  *	to support the UltraDMA modes 1, 2, and 3 as well as any MWDMA modes...
  */
-static unsigned long hpt372_filter(struct ata_device *adev, unsigned long mask)
+static unsigned int hpt372_filter(struct ata_device *adev, unsigned int mask)
 {
 	if (ata_id_is_sata(adev->id))
 		mask &= ~((0xE << ATA_SHIFT_UDMA) | ATA_MASK_MWDMA);
diff --git a/drivers/ata/pata_hpt3x2n.c b/drivers/ata/pata_hpt3x2n.c
index 1f6afd8ee29b..071b2e4abf1d 100644
--- a/drivers/ata/pata_hpt3x2n.c
+++ b/drivers/ata/pata_hpt3x2n.c
@@ -113,7 +113,7 @@ static u32 hpt3x2n_find_mode(struct ata_port *ap, int speed)
  *	The Marvell bridge chips used on the HighPoint SATA cards do not seem
  *	to support the UltraDMA modes 1, 2, and 3 as well as any MWDMA modes...
  */
-static unsigned long hpt372n_filter(struct ata_device *adev, unsigned long mask)
+static unsigned int hpt372n_filter(struct ata_device *adev, unsigned int mask)
 {
 	if (ata_id_is_sata(adev->id))
 		mask &= ~((0xE << ATA_SHIFT_UDMA) | ATA_MASK_MWDMA);
diff --git a/drivers/ata/pata_pdc2027x.c b/drivers/ata/pata_pdc2027x.c
index 4fbb3eed8b0b..4191aa61c8e4 100644
--- a/drivers/ata/pata_pdc2027x.c
+++ b/drivers/ata/pata_pdc2027x.c
@@ -57,7 +57,7 @@ static int pdc2027x_prereset(struct ata_link *link, unsigned long deadline);
 static void pdc2027x_set_piomode(struct ata_port *ap, struct ata_device *adev);
 static void pdc2027x_set_dmamode(struct ata_port *ap, struct ata_device *adev);
 static int pdc2027x_check_atapi_dma(struct ata_queued_cmd *qc);
-static unsigned long pdc2027x_mode_filter(struct ata_device *adev, unsigned long mask);
+static unsigned int pdc2027x_mode_filter(struct ata_device *adev, unsigned int mask);
 static int pdc2027x_cable_detect(struct ata_port *ap);
 static int pdc2027x_set_mode(struct ata_link *link, struct ata_device **r_failed);
 
@@ -251,7 +251,7 @@ static int pdc2027x_prereset(struct ata_link *link, unsigned long deadline)
  *	Block UDMA on devices that cause trouble with this controller.
  */
 
-static unsigned long pdc2027x_mode_filter(struct ata_device *adev, unsigned long mask)
+static unsigned int pdc2027x_mode_filter(struct ata_device *adev, unsigned int mask)
 {
 	unsigned char model_num[ATA_ID_PROD_LEN + 1];
 	struct ata_device *pair = ata_dev_pair(adev);
diff --git a/drivers/ata/pata_serverworks.c b/drivers/ata/pata_serverworks.c
index e410fe44177f..c0bc4af0d196 100644
--- a/drivers/ata/pata_serverworks.c
+++ b/drivers/ata/pata_serverworks.c
@@ -150,7 +150,7 @@ static u8 serverworks_is_csb(struct pci_dev *pdev)
  *	bug we hit.
  */
 
-static unsigned long serverworks_osb4_filter(struct ata_device *adev, unsigned long mask)
+static unsigned int serverworks_osb4_filter(struct ata_device *adev, unsigned int mask)
 {
 	if (adev->class == ATA_DEV_ATA)
 		mask &= ~ATA_MASK_UDMA;
@@ -166,7 +166,7 @@ static unsigned long serverworks_osb4_filter(struct ata_device *adev, unsigned l
  *	Check the blacklist and disable UDMA5 if matched
  */
 
-static unsigned long serverworks_csb_filter(struct ata_device *adev, unsigned long mask)
+static unsigned int serverworks_csb_filter(struct ata_device *adev, unsigned int mask)
 {
 	const char *p;
 	char model_num[ATA_ID_PROD_LEN + 1];
diff --git a/drivers/ata/pata_sis.c b/drivers/ata/pata_sis.c
index b5b764e18adf..92e4cf05de2c 100644
--- a/drivers/ata/pata_sis.c
+++ b/drivers/ata/pata_sis.c
@@ -525,7 +525,7 @@ static void sis_133_set_dmamode (struct ata_port *ap, struct ata_device *adev)
  *	Block UDMA6 on devices that do not support it.
  */
 
-static unsigned long sis_133_mode_filter(struct ata_device *adev, unsigned long mask)
+static unsigned int sis_133_mode_filter(struct ata_device *adev, unsigned int mask)
 {
 	struct ata_port *ap = adev->link->ap;
 	struct pci_dev *pdev = to_pci_dev(ap->host->dev);
diff --git a/drivers/ata/pata_via.c b/drivers/ata/pata_via.c
index 215c02d4056a..34f00f389932 100644
--- a/drivers/ata/pata_via.c
+++ b/drivers/ata/pata_via.c
@@ -352,7 +352,7 @@ static void via_set_dmamode(struct ata_port *ap, struct ata_device *adev)
  *	one breed of Transcend SSD. Return the updated mask.
  */
 
-static unsigned long via_mode_filter(struct ata_device *dev, unsigned long mask)
+static unsigned int via_mode_filter(struct ata_device *dev, unsigned int mask)
 {
 	struct ata_host *host = dev->link->ap->host;
 	const struct via_isa_bridge *config = host->private_data;
diff --git a/include/linux/libata.h b/include/linux/libata.h
index 732de9014626..1429b7012ae8 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -275,7 +275,7 @@ enum {
 	PORT_DISABLED		= 2,
 
 	/* encoding various smaller bitmaps into a single
-	 * unsigned long bitmap
+	 * unsigned int bitmap
 	 */
 	ATA_NR_PIO_MODES	= 7,
 	ATA_NR_MWDMA_MODES	= 5,
@@ -426,12 +426,9 @@ enum {
 };
 
 enum ata_xfer_mask {
-	ATA_MASK_PIO		= ((1LU << ATA_NR_PIO_MODES) - 1)
-					<< ATA_SHIFT_PIO,
-	ATA_MASK_MWDMA		= ((1LU << ATA_NR_MWDMA_MODES) - 1)
-					<< ATA_SHIFT_MWDMA,
-	ATA_MASK_UDMA		= ((1LU << ATA_NR_UDMA_MODES) - 1)
-					<< ATA_SHIFT_UDMA,
+	ATA_MASK_PIO		= ((1U << ATA_NR_PIO_MODES) - 1) << ATA_SHIFT_PIO,
+	ATA_MASK_MWDMA		= ((1U << ATA_NR_MWDMA_MODES) - 1) << ATA_SHIFT_MWDMA,
+	ATA_MASK_UDMA		= ((1U << ATA_NR_UDMA_MODES) - 1) << ATA_SHIFT_UDMA,
 };
 
 enum hsm_task_states {
@@ -886,7 +883,7 @@ struct ata_port_operations {
 	 * Configuration and exception handling
 	 */
 	int  (*cable_detect)(struct ata_port *ap);
-	unsigned long (*mode_filter)(struct ata_device *dev, unsigned long xfer_mask);
+	unsigned int (*mode_filter)(struct ata_device *dev, unsigned int xfer_mask);
 	void (*set_piomode)(struct ata_port *ap, struct ata_device *dev);
 	void (*set_dmamode)(struct ata_port *ap, struct ata_device *dev);
 	int  (*set_mode)(struct ata_link *link, struct ata_device **r_failed_dev);
@@ -1103,16 +1100,18 @@ extern void ata_msleep(struct ata_port *ap, unsigned int msecs);
 extern u32 ata_wait_register(struct ata_port *ap, void __iomem *reg, u32 mask,
 			u32 val, unsigned long interval, unsigned long timeout);
 extern int atapi_cmd_type(u8 opcode);
-extern unsigned long ata_pack_xfermask(unsigned long pio_mask,
-			unsigned long mwdma_mask, unsigned long udma_mask);
-extern void ata_unpack_xfermask(unsigned long xfer_mask,
-			unsigned long *pio_mask, unsigned long *mwdma_mask,
-			unsigned long *udma_mask);
-extern u8 ata_xfer_mask2mode(unsigned long xfer_mask);
-extern unsigned long ata_xfer_mode2mask(u8 xfer_mode);
+extern unsigned int ata_pack_xfermask(unsigned long pio_mask,
+				      unsigned long mwdma_mask,
+				      unsigned long udma_mask);
+extern void ata_unpack_xfermask(unsigned int xfer_mask,
+				unsigned long *pio_mask,
+				unsigned long *mwdma_mask,
+				unsigned long *udma_mask);
+extern u8 ata_xfer_mask2mode(unsigned int xfer_mask);
+extern unsigned int ata_xfer_mode2mask(u8 xfer_mode);
 extern int ata_xfer_mode2shift(u8 xfer_mode);
-extern const char *ata_mode_string(unsigned long xfer_mask);
-extern unsigned long ata_id_xfermask(const u16 *id);
+extern const char *ata_mode_string(unsigned int xfer_mask);
+extern unsigned int ata_id_xfermask(const u16 *id);
 extern int ata_std_qc_defer(struct ata_queued_cmd *qc);
 extern enum ata_completion_errors ata_noop_qc_prep(struct ata_queued_cmd *qc);
 extern void ata_sg_init(struct ata_queued_cmd *qc, struct scatterlist *sg,
@@ -1284,8 +1283,8 @@ static inline const struct ata_acpi_gtm *ata_acpi_init_gtm(struct ata_port *ap)
 }
 int ata_acpi_stm(struct ata_port *ap, const struct ata_acpi_gtm *stm);
 int ata_acpi_gtm(struct ata_port *ap, struct ata_acpi_gtm *stm);
-unsigned long ata_acpi_gtm_xfermask(struct ata_device *dev,
-				    const struct ata_acpi_gtm *gtm);
+unsigned int ata_acpi_gtm_xfermask(struct ata_device *dev,
+				   const struct ata_acpi_gtm *gtm);
 int ata_acpi_cbl_80wire(struct ata_port *ap, const struct ata_acpi_gtm *gtm);
 #else
 static inline const struct ata_acpi_gtm *ata_acpi_init_gtm(struct ata_port *ap)
-- 
2.26.3

