Return-Path: <linux-ide+bounces-2787-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE7D9E9607
	for <lists+linux-ide@lfdr.de>; Mon,  9 Dec 2024 14:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7595282327
	for <lists+linux-ide@lfdr.de>; Mon,  9 Dec 2024 13:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9EAB1ACEBE;
	Mon,  9 Dec 2024 13:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TFkY59K+"
X-Original-To: linux-ide@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312F5233D69
	for <linux-ide@vger.kernel.org>; Mon,  9 Dec 2024 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733749626; cv=none; b=euesGzC6aNnTpc2C8Cum9cuHyn8EzewTwSOzqTQNxVj63skIGVhd0/dxyx+f5nneidEYwETGxV5q7+YAntWcD36m5ehBuJ6B0XRta2TN81lxkDcdohaRRxVgj0Zvz+5M+wFpvbXg8PzxMNV1/pnpztb/O1OIawYFcVQuqpnn+co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733749626; c=relaxed/simple;
	bh=0TEaieIECTc3OVhk8DBvWvo0jSHs3A2Aqh2fvN636xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u1+muyTGyIRA9C0SujB1Sb8+A43Kok9X3YMZT9rvp7AjdmZ8pAUIOIhwU4l9ILEATTqw/xrkpHuwtApZrnYODwZL2okKXUQAo9TMDUEDkNy9fkUEILUaN2DChz0BpI8RuF0U5apVsLX+GERz7ZY1dSaLQnxLhO/qLtuOhgsedfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TFkY59K+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733749622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6O49TnPkNeMtIPoWkV2XdJjg3ziNzZQ3FlPq3drZuU=;
	b=TFkY59K+0YI6oq2tdTrR/JKZAyzRPZrCVX4vUguTgB6YNx1kmrcZN2aO5GaXC1Op7U2mA1
	rpNIDG9cGgs194xg10ZamDxlALJBAySu42OGaBRFRjX6BuLASD2UAIg5kpOYVx71/cP6iP
	P1isAdQPpt95N/h7g8WLRQBbBUGAi3Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-Eg8MST3UMJuMfyoJ252Bfw-1; Mon, 09 Dec 2024 08:07:01 -0500
X-MC-Unique: Eg8MST3UMJuMfyoJ252Bfw-1
X-Mimecast-MFC-AGG-ID: Eg8MST3UMJuMfyoJ252Bfw
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-385e3cbf308so811407f8f.2
        for <linux-ide@vger.kernel.org>; Mon, 09 Dec 2024 05:07:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733749620; x=1734354420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6O49TnPkNeMtIPoWkV2XdJjg3ziNzZQ3FlPq3drZuU=;
        b=loDEyRFKS6XHVj0Jv2NFT4MOI6L30TZROdgYq+beQjVu20MyB+yu5DnxSCI7rFRNQt
         vH9uC5uvOwnu01+/7nF0fV/WyQu2N1DImYKuxvIaguFd6IR6q+wZSbkbf/H7skjbTreI
         IfcGALIrKa7/6hkR7jJTyTSvFl2S58N549Y20GpUkHKHqK3wjFGVnxvtWywWwix5nqy7
         CmwXr+Bg8ElPyMuO3vMP/1YwVUZ8nCxaBs56w7n/iWlSa83IWPKcXG8NtQh2za+nHsQS
         8aMJ+PfUYv/zRfqcUPP02KFzaTkSIHmBKOEatEgDk3X+qpTHnHa+jJXPBKkp28qRRfn0
         5iTQ==
X-Gm-Message-State: AOJu0YxuclWAqTSPxK2cFo4R5ibz8y43/UVRwAi14oRo5xYdrjoZBL+u
	BFMUBwT68T3ID/5xc6tiDKz05syPT8faqoM8x4r3UxenKmYyiMV4XdKK473x/K4FNg+BTUHAVNF
	2juFu2toANGqfUQZOvBlm/yEsWAzytSL3SliMNzlslN5MkOVvtWEXiwaquQ==
X-Gm-Gg: ASbGncvnHHwENf7njUA58bcMB1+77CmzOPwXjXwtlIqH3xxDivkPkDxpVtnLfHIb2FF
	i9oGRq0+1U5t7L8RlPC5Yr0x8SASTENPw1SRKDWeAnsd/XjwETYxLh15Z6/AZT0r0kAh+XBTPtL
	wonpCh4pQe6EXyf+jTnGb7i87D8di8jVjWorwB4+9MzFvosTOtq5ZfFhZDGTmymEHs6GmnRDD4v
	OJC/E0/kqqFFfq3L6SOEMftF+pisGCMXWTu+FbOG/M7n5+20iScucDYEPrDP1JFAsjTd073MQiy
	8YySMTGF
X-Received: by 2002:a05:6000:481d:b0:386:1cd3:8a05 with SMTP id ffacd0b85a97d-38645402350mr183790f8f.54.1733749619730;
        Mon, 09 Dec 2024 05:06:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtkNHnOC202GyBKEBPTwiG4UTLfJs2pkouVC4IktFgJYuC2xwE//LEhilVtJ79VvBlgBAiYw==
X-Received: by 2002:a05:6000:481d:b0:386:1cd3:8a05 with SMTP id ffacd0b85a97d-38645402350mr183738f8f.54.1733749619256;
        Mon, 09 Dec 2024 05:06:59 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862190965asm13200127f8f.82.2024.12.09.05.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 05:06:58 -0800 (PST)
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
Subject: [PATCH v3 06/11] vfio/pci: Use never-managed version of pci_intx()
Date: Mon,  9 Dec 2024 14:06:28 +0100
Message-ID: <20241209130632.132074-8-pstanner@redhat.com>
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

pci_intx() is a hybrid function which can sometimes be managed through
devres. To remove this hybrid nature from pci_intx(), it is necessary to
port users to either an always-managed or a never-managed version.

vfio enables its PCI-Device with pci_enable_device(). Thus, it
needs the never-managed version.

Replace pci_intx() with pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/vfio/pci/vfio_pci_core.c  |  2 +-
 drivers/vfio/pci/vfio_pci_intrs.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 1ab58da9f38a..90240c8d51aa 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -498,7 +498,7 @@ int vfio_pci_core_enable(struct vfio_pci_core_device *vdev)
 		if (vfio_pci_nointx(pdev)) {
 			pci_info(pdev, "Masking broken INTx support\n");
 			vdev->nointx = true;
-			pci_intx(pdev, 0);
+			pci_intx_unmanaged(pdev, 0);
 		} else
 			vdev->pci_2_3 = pci_intx_mask_supported(pdev);
 	}
diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
index 8382c5834335..40abb0b937a2 100644
--- a/drivers/vfio/pci/vfio_pci_intrs.c
+++ b/drivers/vfio/pci/vfio_pci_intrs.c
@@ -118,7 +118,7 @@ static bool __vfio_pci_intx_mask(struct vfio_pci_core_device *vdev)
 	 */
 	if (unlikely(!is_intx(vdev))) {
 		if (vdev->pci_2_3)
-			pci_intx(pdev, 0);
+			pci_intx_unmanaged(pdev, 0);
 		goto out_unlock;
 	}
 
@@ -132,7 +132,7 @@ static bool __vfio_pci_intx_mask(struct vfio_pci_core_device *vdev)
 		 * mask, not just when something is pending.
 		 */
 		if (vdev->pci_2_3)
-			pci_intx(pdev, 0);
+			pci_intx_unmanaged(pdev, 0);
 		else
 			disable_irq_nosync(pdev->irq);
 
@@ -178,7 +178,7 @@ static int vfio_pci_intx_unmask_handler(void *opaque, void *data)
 	 */
 	if (unlikely(!is_intx(vdev))) {
 		if (vdev->pci_2_3)
-			pci_intx(pdev, 1);
+			pci_intx_unmanaged(pdev, 1);
 		goto out_unlock;
 	}
 
@@ -296,7 +296,7 @@ static int vfio_intx_enable(struct vfio_pci_core_device *vdev,
 	 */
 	ctx->masked = vdev->virq_disabled;
 	if (vdev->pci_2_3) {
-		pci_intx(pdev, !ctx->masked);
+		pci_intx_unmanaged(pdev, !ctx->masked);
 		irqflags = IRQF_SHARED;
 	} else {
 		irqflags = ctx->masked ? IRQF_NO_AUTOEN : 0;
@@ -569,7 +569,7 @@ static void vfio_msi_disable(struct vfio_pci_core_device *vdev, bool msix)
 	 * via their shutdown paths.  Restore for NoINTx devices.
 	 */
 	if (vdev->nointx)
-		pci_intx(pdev, 0);
+		pci_intx_unmanaged(pdev, 0);
 
 	vdev->irq_type = VFIO_PCI_NUM_IRQS;
 }
-- 
2.47.1


