Return-Path: <linux-ide+bounces-2782-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E54549E95FC
	for <lists+linux-ide@lfdr.de>; Mon,  9 Dec 2024 14:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B18B168307
	for <lists+linux-ide@lfdr.de>; Mon,  9 Dec 2024 13:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024B522E3FA;
	Mon,  9 Dec 2024 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QZ0hDC2w"
X-Original-To: linux-ide@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A580E3595F
	for <linux-ide@vger.kernel.org>; Mon,  9 Dec 2024 13:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733749614; cv=none; b=qvwdALw1br8Y68B8X58EEq+2Rodj3/NEc0FqLMrnilcdII9leUkS+tpy3wYJUzJuDqwHaqPxlxrw6IJtMAcVsN6KwVUVXlveWLUGUYFI/oSQX2nZ6PW/rjywdLyQJbfroKP8lUJ2dqS/b7wkZH+mLJgu1Nn9XVW+JIUKCt67q4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733749614; c=relaxed/simple;
	bh=Pp8IL9cwVd3G7A/P5OrgHCKDWhxnnnGxe9vEBoWdRJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V/B8E2PMwXOlNLxTnfYnppAEtzIGn4fRYKcnqhR78YDKkiHHLygyqyGwmWSgQF2MULEq21zfLlAfkX22quCuB/14cmZ2asbSF1TKb6Hwnckyg2yb2HzAoSVMI+ovYYs3XYx6RfqK2dVnHkxE4swA0usx/7DTNR0cP1ZWpzxAscE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QZ0hDC2w; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733749611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LjtlDqjVbjjdLVPvux+VnzDcjHru5NMyBrbq6sIUPEE=;
	b=QZ0hDC2wd66YsQL+7gEaYVHkeKeFM44CfRTgzX6W0FD3YprQOdtG8HVMp0hJKsM8zvl/Z1
	NEX54UzzqbEvgqNfWP22IQ9tk+LSYMxMSNrVZXysQr8Jj/q3rIPO6OHFBx/cBYvU9LYlpr
	injkYXHzDDpcWqN8BujGxPZ/YA+Bti0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-tRFyflNZNgGYHRQCWq4BCw-1; Mon, 09 Dec 2024 08:06:50 -0500
X-MC-Unique: tRFyflNZNgGYHRQCWq4BCw-1
X-Mimecast-MFC-AGG-ID: tRFyflNZNgGYHRQCWq4BCw
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385f0829430so2934749f8f.1
        for <linux-ide@vger.kernel.org>; Mon, 09 Dec 2024 05:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733749608; x=1734354408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LjtlDqjVbjjdLVPvux+VnzDcjHru5NMyBrbq6sIUPEE=;
        b=CX3Fh9WKujpi4TDhe3Slm3MEIkRUAVP7oyNLXrvp3bzQhQ7M0cKBQagqXNM03SafYo
         5Zq80OfHEFE5SE8WYR4DSnSTAB67HAH4bs3QI3D7YKZc5vjm4npkDehcKQIqxDp/hTLL
         7uUvHebKW/o0RkC3YDcOYxX1jE0O5FXy8RweAol3RwYLYcbJSjcJVBMRVqJ71t9BbCvL
         ikEJIB2dRPsLr68O9Nf3dJDTGZB2DfgwGLz/VA+6E0BFkSPW1AlFO2/zahc4t6e2vzxP
         kCVqPW2PSEJgZSB23JSaEgZooR/6Nx7pRzj+lDA6+tgJeV7VGEm0ZlkpiBlKHNE6k6bd
         1kGA==
X-Gm-Message-State: AOJu0YwuqF7fGo9RvvjZiXAqDPyVCdlNOSnxdNORdAfEm5Hw+KBQAfua
	/YAVtNiU6IDDmSTcKDCUp8qHuhx24TtOV60lTZWZ42DLTQOJ+/zDbpHNmwSswAciIx8xRPm8gU7
	5wVGf3EQ/u5jTOTfh8ijSxq/oyKeglR0MI1D3i4UaCjw7XBZraTHoABGoKQ==
X-Gm-Gg: ASbGncs8wUfVL4aS1L6i7cBzmovjxDvf4zuRstuPxmtLhmHiaeiH1uJY4SfIkLev1bx
	JM4fDnGL+hwMf++DELt5K8m9dIXQfKII24ynEjpuN9ge+bM8i0aT4QzZdlMso3lYHga2nF/slcA
	9j1B6dzY9j1EF4svvL8aD3DBwjxZmR4ws5dtT2h8nm5qICJo48rmfVJjBjUd/wGerXEXTGpzD1A
	kphI/0ev+PVneonaHArNpGOSy33vFo5ei11dWbxplSJeN+TeCGkXlgDrl7mfJKdwnDOMNHzxqlx
	YPd60869
X-Received: by 2002:a5d:6c65:0:b0:385:ebaf:3824 with SMTP id ffacd0b85a97d-386453e1638mr347883f8f.27.1733749608208;
        Mon, 09 Dec 2024 05:06:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFe4lx/EENwtCaRxhJCz0NOg0TrCmZKbhSzjlYB6+7PsBpCd1abctGiIUuR4mdyx/fkgNv7cA==
X-Received: by 2002:a5d:6c65:0:b0:385:ebaf:3824 with SMTP id ffacd0b85a97d-386453e1638mr347789f8f.27.1733749607612;
        Mon, 09 Dec 2024 05:06:47 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862190965asm13200127f8f.82.2024.12.09.05.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 05:06:47 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: amien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rasesh Mody <rmody@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Igor Mitsyanko <imitsyanko@quantenna.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Philipp Stanner <pstanner@redhat.com>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Kevin Tian <kevin.tian@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	Kunwu Chan <chentao@kylinos.cn>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ye Bin <yebin10@huawei.com>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 01/11] PCI: Prepare removing devres from pci_intx()
Date: Mon,  9 Dec 2024 14:06:23 +0100
Message-ID: <20241209130632.132074-3-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209130632.132074-2-pstanner@redhat.com>
References: <20241209130632.132074-2-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pci_intx() is a hybrid function which sometimes performs devres
operations, depending on whether pcim_enable_device() has been used to
enable the pci_dev. This sometimes-managed nature of the function is
problematic. Notably, it causes the function to allocate under some
circumstances which makes it unusable from interrupt context.

To, ultimately, remove the hybrid nature from pci_intx(), it is first
necessary to provide an always-managed and a never-managed version
of that function. Then, all callers of pci_intx() can be ported to the
version they need, depending whether they use pci_enable_device() or
pcim_enable_device().

An always-managed function exists, namely pcim_intx(), for which
__pcim_intx(), a never-managed version of pci_intx() has been
implemented.

Make __pcim_intx() a public function under the name
pci_intx_unmanaged(). Make pcim_intx() a public function.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/pci/devres.c | 24 +++---------------------
 drivers/pci/pci.c    | 29 +++++++++++++++++++++++++++++
 include/linux/pci.h  |  2 ++
 3 files changed, 34 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 3b59a86a764b..3594eea37993 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -411,31 +411,12 @@ static inline bool mask_contains_bar(int mask, int bar)
 	return mask & BIT(bar);
 }
 
-/*
- * This is a copy of pci_intx() used to bypass the problem of recursive
- * function calls due to the hybrid nature of pci_intx().
- */
-static void __pcim_intx(struct pci_dev *pdev, int enable)
-{
-	u16 pci_command, new;
-
-	pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
-
-	if (enable)
-		new = pci_command & ~PCI_COMMAND_INTX_DISABLE;
-	else
-		new = pci_command | PCI_COMMAND_INTX_DISABLE;
-
-	if (new != pci_command)
-		pci_write_config_word(pdev, PCI_COMMAND, new);
-}
-
 static void pcim_intx_restore(struct device *dev, void *data)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct pcim_intx_devres *res = data;
 
-	__pcim_intx(pdev, res->orig_intx);
+	pci_intx_unmanaged(pdev, res->orig_intx);
 }
 
 static struct pcim_intx_devres *get_or_create_intx_devres(struct device *dev)
@@ -472,10 +453,11 @@ int pcim_intx(struct pci_dev *pdev, int enable)
 		return -ENOMEM;
 
 	res->orig_intx = !enable;
-	__pcim_intx(pdev, enable);
+	pci_intx_unmanaged(pdev, enable);
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pcim_intx);
 
 static void pcim_disable_device(void *pdev_raw)
 {
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 0b29ec6e8e5e..30d17ec771fc 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4482,6 +4482,35 @@ void pci_disable_parity(struct pci_dev *dev)
 	}
 }
 
+/**
+ * pci_intx_unmanaged - enables/disables PCI INTx for device dev,
+ * unmanaged version
+ * @pdev: the PCI device to operate on
+ * @enable: boolean: whether to enable or disable PCI INTx
+ *
+ * Enables/disables PCI INTx for device @pdev
+ *
+ * This function behavios identically to pci_intx(), but is never managed with
+ * devres.
+ */
+void pci_intx_unmanaged(struct pci_dev *pdev, int enable)
+{
+	u16 pci_command, new;
+
+	pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
+
+	if (enable)
+		new = pci_command & ~PCI_COMMAND_INTX_DISABLE;
+	else
+		new = pci_command | PCI_COMMAND_INTX_DISABLE;
+
+	if (new == pci_command)
+		return;
+
+	pci_write_config_word(pdev, PCI_COMMAND, new);
+}
+EXPORT_SYMBOL_GPL(pci_intx_unmanaged);
+
 /**
  * pci_intx - enables/disables PCI INTx for device dev
  * @pdev: the PCI device to operate on
diff --git a/include/linux/pci.h b/include/linux/pci.h
index db9b47ce3eef..b5eb8bda655d 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1350,6 +1350,7 @@ int __must_check pcim_set_mwi(struct pci_dev *dev);
 int pci_try_set_mwi(struct pci_dev *dev);
 void pci_clear_mwi(struct pci_dev *dev);
 void pci_disable_parity(struct pci_dev *dev);
+void pci_intx_unmanaged(struct pci_dev *pdev, int enable);
 void pci_intx(struct pci_dev *dev, int enable);
 bool pci_check_and_mask_intx(struct pci_dev *dev);
 bool pci_check_and_unmask_intx(struct pci_dev *dev);
@@ -2297,6 +2298,7 @@ static inline void pci_fixup_device(enum pci_fixup_pass pass,
 				    struct pci_dev *dev) { }
 #endif
 
+int pcim_intx(struct pci_dev *pdev, int enabled);
 int pcim_request_all_regions(struct pci_dev *pdev, const char *name);
 void __iomem *pcim_iomap(struct pci_dev *pdev, int bar, unsigned long maxlen);
 void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
-- 
2.47.1


