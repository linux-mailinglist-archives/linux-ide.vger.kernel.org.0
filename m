Return-Path: <linux-ide+bounces-2365-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2B099635C
	for <lists+linux-ide@lfdr.de>; Wed,  9 Oct 2024 10:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3F24282658
	for <lists+linux-ide@lfdr.de>; Wed,  9 Oct 2024 08:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6914318E377;
	Wed,  9 Oct 2024 08:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ceZhUZAu"
X-Original-To: linux-ide@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2DD18E36B
	for <linux-ide@vger.kernel.org>; Wed,  9 Oct 2024 08:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463086; cv=none; b=iHvZY60pmZnLOXOWqbnsMg+qbgVjWtJdM57X9Z+BkQedBV91t12h0RYDu4E9z9A1xQNTsJCw3aVf6CTUNRHTAaMIEcIhLw8kvbbIB51K1IpO6om1gU3zxJNuQTOnhre5h+tKU78jDpeBa5k9/P9ooZ+dVSXc7WnRdf0x6o1L+Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463086; c=relaxed/simple;
	bh=wqOlnRmOqEmr1Biqs28cC9qTRGWKoz9bCgrIUV8I5Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q72V4i9R0CU/8n2/kU6uJkoFgBfRguyCevpgHDBPC3ipnW0JQfJnsWsLcpgvQVln+4llA8hxI/dh9i+ADH+Aach9IzRbXc2MpnxsHaDKEgWW2iqIrdph910xkuo04n4uhKMUejpRpBpz53zNxp27LDlu9TtKZLcnQ/Ww5HOx0Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ceZhUZAu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728463083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=grA9zY2gCzM0tZ6k8yJzfkYIIGdvtWhZgyLIcbwmBmA=;
	b=ceZhUZAuYMDncVUGQXyXOBTfgKdFQ30uEhzH3B8SjxVK24/vVZ7cBKsv31AAHJ3BDt9n+l
	ed3kpb4vauTNXGzAKm/GkmiGUfjZ4eEkeEwVRoZHMBKUojv7ZBiIB2PGfPEmZBzT0bq3kK
	w+d1iv/lb9MHgSN+07kAyCXpMIMDmkI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-Gq_99sQ_NPuMVQrMzpVe3g-1; Wed, 09 Oct 2024 04:38:02 -0400
X-MC-Unique: Gq_99sQ_NPuMVQrMzpVe3g-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7a9a6251df5so1436469685a.3
        for <linux-ide@vger.kernel.org>; Wed, 09 Oct 2024 01:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463082; x=1729067882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grA9zY2gCzM0tZ6k8yJzfkYIIGdvtWhZgyLIcbwmBmA=;
        b=hlllKrQf9JQ5M451WIm0G4iN2Z2dA6fpjUiH7TXQ3LPUmSwFn4V3ToY8qWAINs8Qhf
         Ad79PtcwOn/vUhISR8zOE1rikdMhNvDh4Dli1BTIxGMntZI/QKD1DUBNYiHLrZZBu7qM
         lTnKhLj93UV78wPx5OaAXbE1lBM863QboHGq7OXsvXnCHA11YLx7LibUwRISTF0AWSyK
         28D+yXnJen6sd7opjg7enJ9OG0sOB4KLMsIhgG1xa4R7XlMUYyibKCaomMfpYoFkGSwb
         pt56E9BHVPo2nPjOCWXFrmuauxM+z37OPVmn7seOxGHcBdiVaFbz73PIfsAn9xWY6pRj
         XUFQ==
X-Gm-Message-State: AOJu0YwbLwCPqpj8reoZZCFrEEqosMTPssmkwZ/gsvXJT5hfq5P4Gxfe
	4g5VwOVvD5cOn8G5KzIecYMUQdgt6UzgqjBfHgtke+qnp59PLzr/DqQJBZ0KwuNwMeaD0ahOPXa
	vqJ1I17DAHk1GpUhAv3MKZO0C6GUeJ5XzP8kN1cRzNzxzug+5TMDKUIXoJw==
X-Received: by 2002:a05:620a:1aa2:b0:7a9:c146:a9eb with SMTP id af79cd13be357-7b06f969756mr273609485a.20.1728463081730;
        Wed, 09 Oct 2024 01:38:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGqTvzl7lkQc723z5ljjdHvDZdrbGrChbwp6g7VVNNzfdZU3qGvLnPUFP5t46Wzl+T4Wyqlg==
X-Received: by 2002:a05:620a:1aa2:b0:7a9:c146:a9eb with SMTP id af79cd13be357-7b06f969756mr273601385a.20.1728463081273;
        Wed, 09 Oct 2024 01:38:01 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae75615aa2sm439643585a.14.2024.10.09.01.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 01:38:01 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
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
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hannes Reinecke <hare@suse.de>,
	John Garry <john.g.garry@oracle.com>,
	Soumya Negi <soumya.negi97@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Christian Brauner <brauner@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ye Bin <yebin10@huawei.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Rui Salvaterra <rsalvaterra@gmail.com>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-sound@vger.kernel.org
Subject: [RFC PATCH 09/13] ata: Use always-managed version of pci_intx()
Date: Wed,  9 Oct 2024 10:35:15 +0200
Message-ID: <20241009083519.10088-10-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241009083519.10088-1-pstanner@redhat.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
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

All users in ata enable their PCI-Device with pcim_enable_device(). Thus,
they need the always-managed version.

Replace pci_intx() with pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/ata/ahci.c       | 2 +-
 drivers/ata/ata_piix.c   | 2 +-
 drivers/ata/pata_rdc.c   | 2 +-
 drivers/ata/sata_sil24.c | 2 +-
 drivers/ata/sata_sis.c   | 2 +-
 drivers/ata/sata_uli.c   | 2 +-
 drivers/ata/sata_vsc.c   | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
index 45f63b09828a..9273ff3d4732 100644
--- a/drivers/ata/ahci.c
+++ b/drivers/ata/ahci.c
@@ -1985,7 +1985,7 @@ static int ahci_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	if (ahci_init_msi(pdev, n_ports, hpriv) < 0) {
 		/* legacy intx interrupts */
-		pci_intx(pdev, 1);
+		pcim_intx(pdev, 1);
 	}
 	hpriv->irq = pci_irq_vector(pdev, 0);
 
diff --git a/drivers/ata/ata_piix.c b/drivers/ata/ata_piix.c
index 093b940bc953..d441246fa357 100644
--- a/drivers/ata/ata_piix.c
+++ b/drivers/ata/ata_piix.c
@@ -1725,7 +1725,7 @@ static int piix_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	 * message-signalled interrupts currently).
 	 */
 	if (port_flags & PIIX_FLAG_CHECKINTR)
-		pci_intx(pdev, 1);
+		pcim_intx(pdev, 1);
 
 	if (piix_check_450nx_errata(pdev)) {
 		/* This writes into the master table but it does not
diff --git a/drivers/ata/pata_rdc.c b/drivers/ata/pata_rdc.c
index 0a9689862f71..09792aac7f9d 100644
--- a/drivers/ata/pata_rdc.c
+++ b/drivers/ata/pata_rdc.c
@@ -340,7 +340,7 @@ static int rdc_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return rc;
 	host->private_data = hpriv;
 
-	pci_intx(pdev, 1);
+	pcim_intx(pdev, 1);
 
 	host->flags |= ATA_HOST_PARALLEL_SCAN;
 
diff --git a/drivers/ata/sata_sil24.c b/drivers/ata/sata_sil24.c
index 72c03cbdaff4..b771ebd41252 100644
--- a/drivers/ata/sata_sil24.c
+++ b/drivers/ata/sata_sil24.c
@@ -1317,7 +1317,7 @@ static int sil24_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	if (sata_sil24_msi && !pci_enable_msi(pdev)) {
 		dev_info(&pdev->dev, "Using MSI\n");
-		pci_intx(pdev, 0);
+		pcim_intx(pdev, 0);
 	}
 
 	pci_set_master(pdev);
diff --git a/drivers/ata/sata_sis.c b/drivers/ata/sata_sis.c
index ef8724986de3..b8b6d9eff3b8 100644
--- a/drivers/ata/sata_sis.c
+++ b/drivers/ata/sata_sis.c
@@ -290,7 +290,7 @@ static int sis_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	pci_set_master(pdev);
-	pci_intx(pdev, 1);
+	pcim_intx(pdev, 1);
 	return ata_host_activate(host, pdev->irq, ata_bmdma_interrupt,
 				 IRQF_SHARED, &sis_sht);
 }
diff --git a/drivers/ata/sata_uli.c b/drivers/ata/sata_uli.c
index 60ea45926cd1..52894ff49dcb 100644
--- a/drivers/ata/sata_uli.c
+++ b/drivers/ata/sata_uli.c
@@ -221,7 +221,7 @@ static int uli_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	pci_set_master(pdev);
-	pci_intx(pdev, 1);
+	pcim_intx(pdev, 1);
 	return ata_host_activate(host, pdev->irq, ata_bmdma_interrupt,
 				 IRQF_SHARED, &uli_sht);
 }
diff --git a/drivers/ata/sata_vsc.c b/drivers/ata/sata_vsc.c
index d39b87537168..a53a2dfc1e17 100644
--- a/drivers/ata/sata_vsc.c
+++ b/drivers/ata/sata_vsc.c
@@ -384,7 +384,7 @@ static int vsc_sata_init_one(struct pci_dev *pdev,
 		pci_write_config_byte(pdev, PCI_CACHE_LINE_SIZE, 0x80);
 
 	if (pci_enable_msi(pdev) == 0)
-		pci_intx(pdev, 0);
+		pcim_intx(pdev, 0);
 
 	/*
 	 * Config offset 0x98 is "Extended Control and Status Register 0"
-- 
2.46.1


