Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1D9278E03
	for <lists+linux-ide@lfdr.de>; Fri, 25 Sep 2020 18:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbgIYQTk (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 25 Sep 2020 12:19:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43890 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729431AbgIYQTi (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 25 Sep 2020 12:19:38 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601050777;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=juqylsxeQnN8xlFt8c6sVAPHOTqPVpJEMIV/U4qDUJ8=;
        b=ZxqBaWLEeSgaeFGD1ynccHwBkbGCuGC/jGhQpY/v4x2PjyIGh09kEFdrf/jzu9CX41RLJd
        BkTM81d9qCyye4Oe2B2qoIwdj9QGGQMhsKMtCVKgAEOGVXrIN2v+jc8D2e3XhBdlH6NuxI
        eTWbRNqmz4+kfbFXuftNMW0m2P9e69k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-BJlZSyQYPdyld3HWcjUD-w-1; Fri, 25 Sep 2020 12:19:33 -0400
X-MC-Unique: BJlZSyQYPdyld3HWcjUD-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DA8281F03D;
        Fri, 25 Sep 2020 16:19:32 +0000 (UTC)
Received: from sulaco.redhat.com (unknown [10.10.110.11])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7EB5D5D9DC;
        Fri, 25 Sep 2020 16:19:31 +0000 (UTC)
From:   Tony Asleson <tasleson@redhat.com>
To:     linux-scsi@vger.kernel.org, linux-block@vger.kernel.org,
        linux-ide@vger.kernel.org
Subject: [v5 01/12] struct device: Add function callback durable_name
Date:   Fri, 25 Sep 2020 11:19:18 -0500
Message-Id: <20200925161929.1136806-2-tasleson@redhat.com>
In-Reply-To: <20200925161929.1136806-1-tasleson@redhat.com>
References: <20200925161929.1136806-1-tasleson@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Function callback and function to be used to write a persistent
durable name to the supplied character buffer.  This will be used to add
structured key-value data to log messages for hardware related errors
which allows end users to correlate message and specific hardware.

Signed-off-by: Tony Asleson <tasleson@redhat.com>
---
 drivers/base/core.c    | 24 ++++++++++++++++++++++++
 include/linux/device.h |  4 ++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 05d414e9e8a4..88696ade8bfc 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2489,6 +2489,30 @@ int dev_set_name(struct device *dev, const char *fmt, ...)
 }
 EXPORT_SYMBOL_GPL(dev_set_name);
 
+/**
+ * dev_durable_name - Write "DURABLE_NAME"=<durable name> in buffer
+ * @dev: device
+ * @buffer: character buffer to write results
+ * @len: length of buffer
+ * @return: Number of bytes written to buffer
+ */
+int dev_durable_name(const struct device *dev, char *buffer, size_t len)
+{
+	int tmp, dlen;
+
+	if (dev && dev->durable_name) {
+		tmp = snprintf(buffer, len, "DURABLE_NAME=");
+		if (tmp < len) {
+			dlen = dev->durable_name(dev, buffer + tmp,
+							len - tmp);
+			if (dlen > 0 && ((dlen + tmp) < len))
+				return dlen + tmp;
+		}
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dev_durable_name);
+
 /**
  * device_to_dev_kobj - select a /sys/dev/ directory for the device
  * @dev: device
diff --git a/include/linux/device.h b/include/linux/device.h
index 5efed864b387..074125999dd8 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -614,6 +614,8 @@ struct device {
 	struct iommu_group	*iommu_group;
 	struct dev_iommu	*iommu;
 
+	int (*durable_name)(const struct device *dev, char *buff, size_t len);
+
 	bool			offline_disabled:1;
 	bool			offline:1;
 	bool			of_node_reused:1;
@@ -655,6 +657,8 @@ static inline const char *dev_name(const struct device *dev)
 extern __printf(2, 3)
 int dev_set_name(struct device *dev, const char *name, ...);
 
+int dev_durable_name(const struct device *d, char *buffer, size_t len);
+
 #ifdef CONFIG_NUMA
 static inline int dev_to_node(struct device *dev)
 {
-- 
2.26.2

