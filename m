Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4904B7681C5
	for <lists+linux-ide@lfdr.de>; Sat, 29 Jul 2023 22:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbjG2USQ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 29 Jul 2023 16:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjG2USO (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 29 Jul 2023 16:18:14 -0400
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5068F271D
        for <linux-ide@vger.kernel.org>; Sat, 29 Jul 2023 13:18:12 -0700 (PDT)
Received: from localhost.localdomain (178.176.75.102) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Sat, 29 Jul
 2023 23:18:02 +0300
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Damien Le Moal <dlemoal@kernel.org>, <linux-ide@vger.kernel.org>
Subject: [PATCH v2 4/8] ata: fix debounce timings type
Date:   Sat, 29 Jul 2023 23:17:49 +0300
Message-ID: <20230729201753.37600-5-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20230729201753.37600-1-s.shtylyov@omp.ru>
References: <20230729201753.37600-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [178.176.75.102]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 07/29/2023 19:54:20
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 178952 [Jul 29 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 526 526 7a6a9b19f6b9b3921b5701490f189af0e0cd5310
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.75.102 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: {rdns complete}
X-KSE-AntiSpam-Info: {fromrtbl complete}
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.75.102
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=none header.from=omp.ru;spf=none
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 07/29/2023 19:59:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 7/29/2023 4:55:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=1.4 required=5.0 tests=BAYES_00,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

sata_deb_timing_{hotplug|long|normal}[] store 'unsigned long' debounce
timeouts in ms, while sata_link_debounce() eventually uses those timeouts
by calling ata_{deadline|msleep}( which take just 'unsigned int'.  Change
the debounce timeout table element's type to 'unsigned int' -- all these
timeouts happily fit into 'unsigned int'...

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
Changes in version 2:
- resolved reject in <linux/lbata.h>;
- refreshed the patch.

 drivers/ata/ahci.c          |  2 +-
 drivers/ata/ahci_qoriq.c    |  2 +-
 drivers/ata/ahci_xgene.c    |  2 +-
 drivers/ata/libahci.c       |  2 +-
 drivers/ata/libata-core.c   |  4 ++--
 drivers/ata/libata-sata.c   | 16 ++++++++--------
 drivers/ata/libata-sff.c    |  2 +-
 drivers/ata/sata_highbank.c |  2 +-
 drivers/ata/sata_inic162x.c |  2 +-
 drivers/ata/sata_mv.c       |  2 +-
 drivers/ata/sata_nv.c       |  2 +-
 include/linux/libata.h      | 20 ++++++++++----------
 12 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
index addba109406b..02503e903e4a 100644
--- a/drivers/ata/ahci.c
+++ b/drivers/ata/ahci.c
@@ -807,7 +807,7 @@ static int ahci_p5wdh_hardreset(struct ata_link *link, unsigned int *class,
 static int ahci_avn_hardreset(struct ata_link *link, unsigned int *class,
 			      unsigned long deadline)
 {
-	const unsigned long *timing = sata_ehc_deb_timing(&link->eh_context);
+	const unsigned int *timing = sata_ehc_deb_timing(&link->eh_context);
 	struct ata_port *ap = link->ap;
 	struct ahci_port_priv *pp = ap->private_data;
 	struct ahci_host_priv *hpriv = ap->host->private_data;
diff --git a/drivers/ata/ahci_qoriq.c b/drivers/ata/ahci_qoriq.c
index 7bb9ad40605e..b1a4e57578e2 100644
--- a/drivers/ata/ahci_qoriq.c
+++ b/drivers/ata/ahci_qoriq.c
@@ -88,7 +88,7 @@ MODULE_DEVICE_TABLE(acpi, ahci_qoriq_acpi_match);
 static int ahci_qoriq_hardreset(struct ata_link *link, unsigned int *class,
 			  unsigned long deadline)
 {
-	const unsigned long *timing = sata_ehc_deb_timing(&link->eh_context);
+	const unsigned int *timing = sata_ehc_deb_timing(&link->eh_context);
 	void __iomem *port_mmio = ahci_port_base(link->ap);
 	u32 px_cmd, px_is, px_val;
 	struct ata_port *ap = link->ap;
diff --git a/drivers/ata/ahci_xgene.c b/drivers/ata/ahci_xgene.c
index f5deaf648663..8e88c86a2a78 100644
--- a/drivers/ata/ahci_xgene.c
+++ b/drivers/ata/ahci_xgene.c
@@ -350,7 +350,7 @@ static void xgene_ahci_set_phy_cfg(struct xgene_ahci_context *ctx, int channel)
 static int xgene_ahci_do_hardreset(struct ata_link *link,
 				   unsigned long deadline, bool *online)
 {
-	const unsigned long *timing = sata_ehc_deb_timing(&link->eh_context);
+	const unsigned int *timing = sata_ehc_deb_timing(&link->eh_context);
 	struct ata_port *ap = link->ap;
 	struct ahci_host_priv *hpriv = ap->host->private_data;
 	struct xgene_ahci_context *ctx = hpriv->plat_data;
diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
index 06aec35f88f2..ad2bfcbff3bc 100644
--- a/drivers/ata/libahci.c
+++ b/drivers/ata/libahci.c
@@ -1587,7 +1587,7 @@ static int ahci_pmp_retry_softreset(struct ata_link *link, unsigned int *class,
 int ahci_do_hardreset(struct ata_link *link, unsigned int *class,
 		      unsigned long deadline, bool *online)
 {
-	const unsigned long *timing = sata_ehc_deb_timing(&link->eh_context);
+	const unsigned int *timing = sata_ehc_deb_timing(&link->eh_context);
 	struct ata_port *ap = link->ap;
 	struct ahci_port_priv *pp = ap->private_data;
 	struct ahci_host_priv *hpriv = ap->host->private_data;
diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 74ec9cfac7d9..821d8653cbb8 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -3782,7 +3782,7 @@ int ata_std_prereset(struct ata_link *link, unsigned long deadline)
 {
 	struct ata_port *ap = link->ap;
 	struct ata_eh_context *ehc = &link->eh_context;
-	const unsigned long *timing = sata_ehc_deb_timing(ehc);
+	const unsigned int *timing = sata_ehc_deb_timing(ehc);
 	int rc;
 
 	/* if we're about to do hardreset, nothing more to do */
@@ -3824,7 +3824,7 @@ EXPORT_SYMBOL_GPL(ata_std_prereset);
 int sata_std_hardreset(struct ata_link *link, unsigned int *class,
 		       unsigned long deadline)
 {
-	const unsigned long *timing = sata_ehc_deb_timing(&link->eh_context);
+	const unsigned int *timing = sata_ehc_deb_timing(&link->eh_context);
 	bool online;
 	int rc;
 
diff --git a/drivers/ata/libata-sata.c b/drivers/ata/libata-sata.c
index 85e279a12f62..5d393432fa06 100644
--- a/drivers/ata/libata-sata.c
+++ b/drivers/ata/libata-sata.c
@@ -19,11 +19,11 @@
 #include "libata-transport.h"
 
 /* debounce timing parameters in msecs { interval, duration, timeout } */
-const unsigned long sata_deb_timing_normal[]		= {   5,  100, 2000 };
+const unsigned int sata_deb_timing_normal[]		= {   5,  100, 2000 };
 EXPORT_SYMBOL_GPL(sata_deb_timing_normal);
-const unsigned long sata_deb_timing_hotplug[]		= {  25,  500, 2000 };
+const unsigned int sata_deb_timing_hotplug[]		= {  25,  500, 2000 };
 EXPORT_SYMBOL_GPL(sata_deb_timing_hotplug);
-const unsigned long sata_deb_timing_long[]		= { 100, 2000, 5000 };
+const unsigned int sata_deb_timing_long[]		= { 100, 2000, 5000 };
 EXPORT_SYMBOL_GPL(sata_deb_timing_long);
 
 /**
@@ -232,11 +232,11 @@ EXPORT_SYMBOL_GPL(ata_tf_from_fis);
  *	RETURNS:
  *	0 on success, -errno on failure.
  */
-int sata_link_debounce(struct ata_link *link, const unsigned long *params,
+int sata_link_debounce(struct ata_link *link, const unsigned int *params,
 		       unsigned long deadline)
 {
-	unsigned long interval = params[0];
-	unsigned long duration = params[1];
+	unsigned int interval = params[0];
+	unsigned int duration = params[1];
 	unsigned long last_jiffies, t;
 	u32 last, cur;
 	int rc;
@@ -295,7 +295,7 @@ EXPORT_SYMBOL_GPL(sata_link_debounce);
  *	RETURNS:
  *	0 on success, -errno on failure.
  */
-int sata_link_resume(struct ata_link *link, const unsigned long *params,
+int sata_link_resume(struct ata_link *link, const unsigned int *params,
 		     unsigned long deadline)
 {
 	int tries = ATA_LINK_RESUME_TRIES;
@@ -528,7 +528,7 @@ EXPORT_SYMBOL_GPL(sata_set_spd);
  *	RETURNS:
  *	0 on success, -errno otherwise.
  */
-int sata_link_hardreset(struct ata_link *link, const unsigned long *timing,
+int sata_link_hardreset(struct ata_link *link, const unsigned int *timing,
 			unsigned long deadline,
 			bool *online, int (*check_ready)(struct ata_link *))
 {
diff --git a/drivers/ata/libata-sff.c b/drivers/ata/libata-sff.c
index 9d28badfe41d..ac55dfc2d85f 100644
--- a/drivers/ata/libata-sff.c
+++ b/drivers/ata/libata-sff.c
@@ -1971,7 +1971,7 @@ int sata_sff_hardreset(struct ata_link *link, unsigned int *class,
 		       unsigned long deadline)
 {
 	struct ata_eh_context *ehc = &link->eh_context;
-	const unsigned long *timing = sata_ehc_deb_timing(ehc);
+	const unsigned int *timing = sata_ehc_deb_timing(ehc);
 	bool online;
 	int rc;
 
diff --git a/drivers/ata/sata_highbank.c b/drivers/ata/sata_highbank.c
index 7a6d41b7a02d..63ef7bb073ce 100644
--- a/drivers/ata/sata_highbank.c
+++ b/drivers/ata/sata_highbank.c
@@ -385,7 +385,7 @@ static int highbank_initialize_phys(struct device *dev, void __iomem *addr)
 static int ahci_highbank_hardreset(struct ata_link *link, unsigned int *class,
 				unsigned long deadline)
 {
-	static const unsigned long timing[] = { 5, 100, 500};
+	static const unsigned int timing[] = { 5, 100, 500};
 	struct ata_port *ap = link->ap;
 	struct ahci_port_priv *pp = ap->private_data;
 	struct ahci_host_priv *hpriv = ap->host->private_data;
diff --git a/drivers/ata/sata_inic162x.c b/drivers/ata/sata_inic162x.c
index 2c8c78ed86c1..db9c255dc9f2 100644
--- a/drivers/ata/sata_inic162x.c
+++ b/drivers/ata/sata_inic162x.c
@@ -619,7 +619,7 @@ static int inic_hardreset(struct ata_link *link, unsigned int *class,
 	struct ata_port *ap = link->ap;
 	void __iomem *port_base = inic_port_base(ap);
 	void __iomem *idma_ctl = port_base + PORT_IDMA_CTL;
-	const unsigned long *timing = sata_ehc_deb_timing(&link->eh_context);
+	const unsigned int *timing = sata_ehc_deb_timing(&link->eh_context);
 	int rc;
 
 	/* hammer it into sane state */
diff --git a/drivers/ata/sata_mv.c b/drivers/ata/sata_mv.c
index d404e631d152..41c107e15c40 100644
--- a/drivers/ata/sata_mv.c
+++ b/drivers/ata/sata_mv.c
@@ -3633,7 +3633,7 @@ static int mv_hardreset(struct ata_link *link, unsigned int *class,
 
 	/* Workaround for errata FEr SATA#10 (part 2) */
 	do {
-		const unsigned long *timing =
+		const unsigned int *timing =
 				sata_ehc_deb_timing(&link->eh_context);
 
 		rc = sata_link_hardreset(link, timing, deadline + extra,
diff --git a/drivers/ata/sata_nv.c b/drivers/ata/sata_nv.c
index abf5651c87ab..0a0cee755bde 100644
--- a/drivers/ata/sata_nv.c
+++ b/drivers/ata/sata_nv.c
@@ -1529,7 +1529,7 @@ static int nv_hardreset(struct ata_link *link, unsigned int *class,
 		sata_link_hardreset(link, sata_deb_timing_hotplug, deadline,
 				    NULL, NULL);
 	else {
-		const unsigned long *timing = sata_ehc_deb_timing(ehc);
+		const unsigned int *timing = sata_ehc_deb_timing(ehc);
 		int rc;
 
 		if (!(ehc->i.flags & ATA_EHI_QUIET))
diff --git a/include/linux/libata.h b/include/linux/libata.h
index 4772f64af734..8d510fb00591 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -1166,11 +1166,11 @@ extern void ata_scsi_cmd_error_handler(struct Scsi_Host *host, struct ata_port *
  * SATA specific code - drivers/ata/libata-sata.c
  */
 #ifdef CONFIG_SATA_HOST
-extern const unsigned long sata_deb_timing_normal[];
-extern const unsigned long sata_deb_timing_hotplug[];
-extern const unsigned long sata_deb_timing_long[];
+extern const unsigned int sata_deb_timing_normal[];
+extern const unsigned int sata_deb_timing_hotplug[];
+extern const unsigned int sata_deb_timing_long[];
 
-static inline const unsigned long *
+static inline const unsigned int *
 sata_ehc_deb_timing(struct ata_eh_context *ehc)
 {
 	if (ehc->i.flags & ATA_EHI_HOTPLUGGED)
@@ -1185,14 +1185,14 @@ extern int sata_scr_write(struct ata_link *link, int reg, u32 val);
 extern int sata_scr_write_flush(struct ata_link *link, int reg, u32 val);
 extern int sata_set_spd(struct ata_link *link);
 extern int sata_link_hardreset(struct ata_link *link,
-			const unsigned long *timing, unsigned long deadline,
+			const unsigned int *timing, unsigned long deadline,
 			bool *online, int (*check_ready)(struct ata_link *));
-extern int sata_link_resume(struct ata_link *link, const unsigned long *params,
+extern int sata_link_resume(struct ata_link *link, const unsigned int *params,
 			    unsigned long deadline);
 extern int ata_eh_read_sense_success_ncq_log(struct ata_link *link);
 extern void ata_eh_analyze_ncq_error(struct ata_link *link);
 #else
-static inline const unsigned long *
+static inline const unsigned int *
 sata_ehc_deb_timing(struct ata_eh_context *ehc)
 {
 	return NULL;
@@ -1212,7 +1212,7 @@ static inline int sata_scr_write_flush(struct ata_link *link, int reg, u32 val)
 }
 static inline int sata_set_spd(struct ata_link *link) { return -EOPNOTSUPP; }
 static inline int sata_link_hardreset(struct ata_link *link,
-				      const unsigned long *timing,
+				      const unsigned int *timing,
 				      unsigned long deadline,
 				      bool *online,
 				      int (*check_ready)(struct ata_link *))
@@ -1222,7 +1222,7 @@ static inline int sata_link_hardreset(struct ata_link *link,
 	return -EOPNOTSUPP;
 }
 static inline int sata_link_resume(struct ata_link *link,
-				   const unsigned long *params,
+				   const unsigned int *params,
 				   unsigned long deadline)
 {
 	return -EOPNOTSUPP;
@@ -1234,7 +1234,7 @@ static inline int ata_eh_read_sense_success_ncq_log(struct ata_link *link)
 static inline void ata_eh_analyze_ncq_error(struct ata_link *link) { }
 #endif
 extern int sata_link_debounce(struct ata_link *link,
-			const unsigned long *params, unsigned long deadline);
+			      const unsigned int *params, unsigned long deadline);
 extern int sata_link_scr_lpm(struct ata_link *link, enum ata_lpm_policy policy,
 			     bool spm_wakeup);
 extern int ata_slave_link_init(struct ata_port *ap);
-- 
2.26.3

