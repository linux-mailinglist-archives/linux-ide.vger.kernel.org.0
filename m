Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0D6D3D510F
	for <lists+linux-ide@lfdr.de>; Mon, 26 Jul 2021 03:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbhGZA5t (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 25 Jul 2021 20:57:49 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:5182 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbhGZA5n (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 25 Jul 2021 20:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1627263492; x=1658799492;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=obRrtrdNI8ZnmW532ciGoaL+n+JdATCeY+pJxx35DX8=;
  b=DRE29IWJphP9BCS4M9+0N8rlDAdVt9A2/KFcI7BalDlQThDHLVPMqm/A
   OA8kiIKMs32wWUQsgmxJO3z9zXXhmDADtNHNHeniKx5Gtnxw/dNu9Hi/Y
   4xke9eJRZL/ZhHG6XngV5izbmgkrzkrd8qZBzM0OAhphm8hIqNhL+PmId
   DsgVlRxKnrs/WKqlbElEW3B1/JW1CT9S1jy7JX/P84Pl5sxYvalERntVG
   MmObToHResKYcR4S5tMmcCdA+2j6JA/a35iWrkGd6AB2GI7HSfvZt7dVz
   fz9FyyYZh1c5sp1Twa+IgWZjicaL5jorR+8fPznG9OtzIBK+mWvVmh9S5
   w==;
X-IronPort-AV: E=Sophos;i="5.84,269,1620662400"; 
   d="scan'208";a="279290745"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 26 Jul 2021 09:38:12 +0800
IronPort-SDR: KfShcnFvXHgq4u9Epv+dL8TIszYdmiG2a0QLf1Kw87jJ2J/LCyXN8BAJEdLJVI9QFvbFB0z9OX
 isD5nkjHLsYRZ3IgH0gyCqd/eMcbLsD3VMtjM+Q9kcKqjJztPnd3pnAZME16OyG5O3QjN9iUdI
 JyF232yX2u+qG8n3QyhhkzVdiJrdFJ4UgXmS73HI13/jcZHq5CGl3FmsokGhh7fLPSdChsNpkD
 3+bv6Tqxt7+kiX0RN2hiICJQGb2TPZ3Q+H5ANFPUq+NtvOaWOLxpUDw2mSMVvfbRy/2RQDcO73
 p1whTWPsZr+RPuzkFSYLwaQq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2021 18:14:12 -0700
IronPort-SDR: Z+6kpdAVd82SZ/tNsjhFpOyVK4qM9orG5daVgHZB+eghjAsp2IlKv3115BR/Vt+/5RJhRilX54
 x7nXjW3y+jZ9+y8y0TCaUEJyIX35TOC+/HxbzTiU7amrQR3yhz4jjJDviw7usbfTlRSCjz5qZD
 uBvBhZ4bU2lB/zYZqkR0rpi2UNe7DtYJ64XLqGRXUxIdoHD2AnINCuuoiwrDF/tyZ2aM5KzbSZ
 c1JSlsbLKT5owJA4LbchIRT0BczHEW18v8XInw2c2d7ehM8hSNMiz9GT/2PXnGtVfXN6Cw7bu5
 iRA=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
  by uls-op-cesaip02.wdc.com with ESMTP; 25 Jul 2021 18:38:11 -0700
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        linux-scsi@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-ide@vger.kernel.org
Cc:     Hannes Reinecke <hare@suse.de>
Subject: [PATCH v3 2/4] scsi: sd: add concurrent positioning ranges support
Date:   Mon, 26 Jul 2021 10:38:04 +0900
Message-Id: <20210726013806.84815-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726013806.84815-1-damien.lemoal@wdc.com>
References: <20210726013806.84815-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Add the sd_read_cpr() function to the sd scsi disk driver to discover
if a device has multiple concurrent positioning ranges (i.e. multiple
actuators on an HDD). This new function is called from
sd_revalidate_disk() and uses the block layer functions
blk_alloc_cranges() and blk_queue_set_cranges() to set a device
cranges according to the information retrieved from log page B9h,
if the device supports it.

The format of the Concurrent Positioning Ranges VPD page B9h is defined
in section 6.6.6 of SBC-5.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 drivers/scsi/sd.c | 81 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/scsi/sd.h |  1 +
 2 files changed, 82 insertions(+)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index b8d55af763f9..8e83099b49f6 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -3125,6 +3125,86 @@ static void sd_read_security(struct scsi_disk *sdkp, unsigned char *buffer)
 		sdkp->security = 1;
 }
 
+static inline sector_t sd64_to_sectors(struct scsi_disk *sdkp, u8 *buf)
+{
+	return logical_to_sectors(sdkp->device, get_unaligned_be64(buf));
+}
+
+/**
+ * sd_read_cpr - Query concurrent positioning ranges
+ * @sdkp:	disk to query
+ */
+static void sd_read_cpr(struct scsi_disk *sdkp)
+{
+	unsigned char *buffer = NULL;
+	struct blk_cranges *cr = NULL;
+	unsigned int nr_cpr = 0;
+	int i, vpd_len, buf_len = SD_BUF_SIZE;
+	u8 *desc;
+
+	/*
+	 * We need to have the capacity set first for the block layer to be
+	 * able to check the ranges.
+	 */
+	if (sdkp->first_scan)
+		return;
+
+	if (!sdkp->capacity)
+		goto out;
+
+	/*
+	 * Concurrent Positioning Ranges VPD: there can be at most 256 ranges,
+	 * leading to a maximum page size of 64 + 256*32 bytes.
+	 */
+	buf_len = 64 + 256*32;
+	buffer = kmalloc(buf_len, GFP_KERNEL);
+	if (!buffer || scsi_get_vpd_page(sdkp->device, 0xb9, buffer, buf_len))
+		goto out;
+
+	/* We must have at least a 64B header and one 32B range descriptor */
+	vpd_len = get_unaligned_be16(&buffer[2]) + 3;
+	if (vpd_len > buf_len || vpd_len < 64 + 32 || (vpd_len & 31)) {
+		sd_printk(KERN_ERR, sdkp,
+			  "Invalid Concurrent Positioning Ranges VPD page\n");
+		goto out;
+	}
+
+	nr_cpr = (vpd_len - 64) / 32;
+	if (nr_cpr == 1) {
+		nr_cpr = 0;
+		goto out;
+	}
+
+	cr = blk_alloc_cranges(sdkp->disk, nr_cpr);
+	if (!cr) {
+		nr_cpr = 0;
+		goto out;
+	}
+
+	desc = &buffer[64];
+	for (i = 0; i < nr_cpr; i++, desc += 32) {
+		if (desc[0] != i) {
+			sd_printk(KERN_ERR, sdkp,
+				"Invalid Concurrent Positioning Range number\n");
+			nr_cpr = 0;
+			break;
+		}
+
+		cr->ranges[i].sector = sd64_to_sectors(sdkp, desc + 8);
+		cr->ranges[i].nr_sectors = sd64_to_sectors(sdkp, desc + 16);
+	}
+
+out:
+	blk_queue_set_cranges(sdkp->disk, cr);
+	if (nr_cpr && sdkp->nr_actuators != nr_cpr) {
+		sd_printk(KERN_NOTICE, sdkp,
+			  "%u concurrent positioning ranges\n", nr_cpr);
+		sdkp->nr_actuators = nr_cpr;
+	}
+
+	kfree(buffer);
+}
+
 /*
  * Determine the device's preferred I/O size for reads and writes
  * unless the reported value is unreasonably small, large, not a
@@ -3240,6 +3320,7 @@ static int sd_revalidate_disk(struct gendisk *disk)
 		sd_read_app_tag_own(sdkp, buffer);
 		sd_read_write_same(sdkp, buffer);
 		sd_read_security(sdkp, buffer);
+		sd_read_cpr(sdkp);
 	}
 
 	/*
diff --git a/drivers/scsi/sd.h b/drivers/scsi/sd.h
index b59136c4125b..2e5932bde43d 100644
--- a/drivers/scsi/sd.h
+++ b/drivers/scsi/sd.h
@@ -106,6 +106,7 @@ struct scsi_disk {
 	u8		protection_type;/* Data Integrity Field */
 	u8		provisioning_mode;
 	u8		zeroing_mode;
+	u8		nr_actuators;		/* Number of actuators */
 	unsigned	ATO : 1;	/* state of disk ATO bit */
 	unsigned	cache_override : 1; /* temp override of WCE,RCD */
 	unsigned	WCE : 1;	/* state of disk WCE bit */
-- 
2.31.1

