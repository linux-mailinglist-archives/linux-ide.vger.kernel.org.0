Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 996744A665F
	for <lists+linux-ide@lfdr.de>; Tue,  1 Feb 2022 21:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiBAUv7 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 1 Feb 2022 15:51:59 -0500
Received: from mxout04.lancloud.ru ([45.84.86.114]:34284 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbiBAUv6 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 1 Feb 2022 15:51:58 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 94B8220A9B90
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v2] libata: ata_{sff|std}_prereset() always return 0
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
Organization: Open Mobile Platform
Message-ID: <075a5bb1-b380-4735-3202-75a4ef565831@omp.ru>
Date:   Tue, 1 Feb 2022 23:51:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

ata_std_prereset() always returns 0, hence the check in ata_sff_prereset()
is pointless and thus it also can return only 0 (however, we cannot change
the prototypes of ata_{sff|std}_prereset() as they implement the driver's
prereset() method).

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'for-next' branch of Damien Le Moal's 'libata.git'
repo.

Changes in version 2:
- fixed up the 'kernel-doc' comments on the function results.

 drivers/ata/libata-core.c |    2 +-
 drivers/ata/libata-sff.c  |    6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

Index: libata/drivers/ata/libata-core.c
===================================================================
--- libata.orig/drivers/ata/libata-core.c
+++ libata/drivers/ata/libata-core.c
@@ -3568,7 +3568,7 @@ EXPORT_SYMBOL_GPL(ata_wait_after_reset);
  *	Kernel thread context (may sleep)
  *
  *	RETURNS:
- *	0 on success, -errno otherwise.
+ *	Always 0.
  */
 int ata_std_prereset(struct ata_link *link, unsigned long deadline)
 {
Index: libata/drivers/ata/libata-sff.c
===================================================================
--- libata.orig/drivers/ata/libata-sff.c
+++ libata/drivers/ata/libata-sff.c
@@ -1708,16 +1708,14 @@ EXPORT_SYMBOL_GPL(ata_sff_thaw);
  *	Kernel thread context (may sleep)
  *
  *	RETURNS:
- *	0 on success, -errno otherwise.
+ *	Always 0.
  */
 int ata_sff_prereset(struct ata_link *link, unsigned long deadline)
 {
 	struct ata_eh_context *ehc = &link->eh_context;
 	int rc;
 
-	rc = ata_std_prereset(link, deadline);
-	if (rc)
-		return rc;
+	ata_std_prereset(link, deadline);
 
 	/* if we're about to do hardreset, nothing more to do */
 	if (ehc->i.action & ATA_EH_HARDRESET)
