Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C53946FB4A
	for <lists+linux-ide@lfdr.de>; Fri, 10 Dec 2021 08:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237541AbhLJHcy (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 10 Dec 2021 02:32:54 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:34820 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232117AbhLJHcx (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 10 Dec 2021 02:32:53 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 9486421108;
        Fri, 10 Dec 2021 07:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1639121358; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BttLdQdBuuoxskOxf8F/CrA+FhA3UgnyFay5MLA3Tww=;
        b=uwrTkCFDyyvtdQvkbHxwg+usjx8/7KD7Uxr+Pp0htm0MTfaBF0sPxhOX+SccDScygZxzq/
        6R9ut39nP+xhUzm0Tua3YALETJjIzjEf0qfHUKAW5uvR66lPLNF4P6ze/0SAUij8vGIlhw
        qlErRwhq4kPYruuQdGa4jxJYqtMfyvs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1639121358;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BttLdQdBuuoxskOxf8F/CrA+FhA3UgnyFay5MLA3Tww=;
        b=ETRRuIgn1ss0jhBXI/dQqU4McKGYJLVJEaX8SNuFyrGJkrMJ628iBqmG1TnDk8rW5JeIet
        VmrFNv9BphUG3pCQ==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
        by relay2.suse.de (Postfix) with ESMTP id 6FFC0A3B96;
        Fri, 10 Dec 2021 07:29:18 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
        id 5FB1F5192025; Fri, 10 Dec 2021 08:29:18 +0100 (CET)
From:   Hannes Reinecke <hare@suse.de>
To:     Damien LeMoal <damien.lemoal@wdc.com>
Cc:     linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 02/68] libata: whitespace cleanup
Date:   Fri, 10 Dec 2021 08:27:59 +0100
Message-Id: <20211210072905.15666-3-hare@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211210072905.15666-1-hare@suse.de>
References: <20211210072905.15666-1-hare@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/ata/libata-transport.c | 18 +++++++++---------
 drivers/ata/libata.h           |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/ata/libata-transport.c b/drivers/ata/libata-transport.c
index 34bb4608bdc6..4162d625fc92 100644
--- a/drivers/ata/libata-transport.c
+++ b/drivers/ata/libata-transport.c
@@ -163,7 +163,7 @@ static struct {
 	{ AC_ERR_INVALID,		"InvalidArg" },
 	{ AC_ERR_OTHER,			"Unknown" },
 	{ AC_ERR_NODEV_HINT,		"NoDeviceHint" },
-	{ AC_ERR_NCQ,		 	"NCQError" }
+	{ AC_ERR_NCQ,			"NCQError" }
 };
 ata_bitfield_name_match(err, ata_err_names)
 
@@ -327,7 +327,7 @@ int ata_tport_add(struct device *parent,
  */
 static int noop(int x) { return x; }
 
-#define ata_link_show_linkspeed(field, format)			        \
+#define ata_link_show_linkspeed(field, format)				\
 static ssize_t								\
 show_ata_link_##field(struct device *dev,				\
 		      struct device_attribute *attr, char *buf)		\
@@ -416,7 +416,7 @@ int ata_tlink_add(struct ata_link *link)
 	dev->release = ata_tlink_release;
 	if (ata_is_host_link(link))
 		dev_set_name(dev, "link%d", ap->print_id);
-        else
+	else
 		dev_set_name(dev, "link%d.%d", ap->print_id, link->pmp);
 
 	transport_setup_device(dev);
@@ -472,7 +472,7 @@ ata_dev_attr(xfer, dma_mode);
 ata_dev_attr(xfer, xfer_mode);
 
 
-#define ata_dev_show_simple(field, format_string, cast)		\
+#define ata_dev_show_simple(field, format_string, cast)			\
 static ssize_t								\
 show_ata_dev_##field(struct device *dev,				\
 		     struct device_attribute *attr, char *buf)		\
@@ -482,9 +482,9 @@ show_ata_dev_##field(struct device *dev,				\
 	return scnprintf(buf, 20, format_string, cast ata_dev->field);	\
 }
 
-#define ata_dev_simple_attr(field, format_string, type)	\
+#define ata_dev_simple_attr(field, format_string, type)		\
 	ata_dev_show_simple(field, format_string, (type))	\
-static DEVICE_ATTR(field, S_IRUGO, 			\
+	static DEVICE_ATTR(field, S_IRUGO,			\
 		   show_ata_dev_##field, NULL)
 
 ata_dev_simple_attr(spdn_cnt, "%d\n", int);
@@ -502,7 +502,7 @@ static int ata_show_ering(struct ata_ering_entry *ent, void *void_arg)
 
 	seconds = div_u64_rem(ent->timestamp, HZ, &rem);
 	arg->written += sprintf(arg->buf + arg->written,
-			        "[%5llu.%09lu]", seconds,
+				"[%5llu.%09lu]", seconds,
 				rem * NSEC_PER_SEC / HZ);
 	arg->written += get_ata_err_names(ent->err_mask,
 					  arg->buf + arg->written);
@@ -667,7 +667,7 @@ static int ata_tdev_add(struct ata_device *ata_dev)
 	dev->release = ata_tdev_release;
 	if (ata_is_host_link(link))
 		dev_set_name(dev, "dev%d.%d", ap->print_id,ata_dev->devno);
-        else
+	else
 		dev_set_name(dev, "dev%d.%d.0", ap->print_id, link->pmp);
 
 	transport_setup_device(dev);
@@ -689,7 +689,7 @@ static int ata_tdev_add(struct ata_device *ata_dev)
  */
 
 #define SETUP_TEMPLATE(attrb, field, perm, test)			\
-	i->private_##attrb[count] = dev_attr_##field;		       	\
+	i->private_##attrb[count] = dev_attr_##field;			\
 	i->private_##attrb[count].attr.mode = perm;			\
 	i->attrb[count] = &i->private_##attrb[count];			\
 	if (test)							\
diff --git a/drivers/ata/libata.h b/drivers/ata/libata.h
index 68cdd81d747c..4a8f4623cfe5 100644
--- a/drivers/ata/libata.h
+++ b/drivers/ata/libata.h
@@ -179,7 +179,7 @@ extern int ata_eh_recover(struct ata_port *ap, ata_prereset_fn_t prereset,
 extern void ata_eh_finish(struct ata_port *ap);
 extern int ata_ering_map(struct ata_ering *ering,
 			 int (*map_fn)(struct ata_ering_entry *, void *),
-		  	 void *arg);
+			 void *arg);
 extern unsigned int atapi_eh_tur(struct ata_device *dev, u8 *r_sense_key);
 extern unsigned int atapi_eh_request_sense(struct ata_device *dev,
 					   u8 *sense_buf, u8 dfl_sense_key);
-- 
2.29.2

