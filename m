Return-Path: <linux-ide+bounces-2737-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5686A9C6F78
	for <lists+linux-ide@lfdr.de>; Wed, 13 Nov 2024 13:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29751B28FB3
	for <lists+linux-ide@lfdr.de>; Wed, 13 Nov 2024 12:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218B8200B9B;
	Wed, 13 Nov 2024 12:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EZgbBo7e"
X-Original-To: linux-ide@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437CD1DFDBE
	for <linux-ide@vger.kernel.org>; Wed, 13 Nov 2024 12:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731501757; cv=none; b=Z72ubZJRDgw1GmcZ3UQ1lp0rGC9t6+E8BgO6Er/o9wQF+DvUBFSPTGIMXKT7GjAh71G1Rf4fbUD2gj2BomZMKLlPtNjul9lnhljjxygb7eZcfW6PM6gEkeG17OHooBh6MgCCLIY4vZmxf1Z7j70WIrk/mO9Ubip1FYCe60qvt1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731501757; c=relaxed/simple;
	bh=5Ui9MCE1qEQAOh4WSjvlu7OY8Q34KrD5J6SmFsm5KGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C35WmZD/xWVA1HHm+7pzRWjootZG9Z+KXg/N434WLvcMb9ISy6k87Pg9nCiEonfLXb3/uR70EDILc0FEysFkn3lEsmCfHiq0nxghfzERXvKDruRChfyVJzMAnBy9vID1GfBcqbVu1VqZ/y8oedFu6K2HO1m2HmmNsWQD8GJoEGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EZgbBo7e; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731501754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gi/nDuPOQh+kW8YCVePTGgMsqduTQsEMI/h4REBTyU8=;
	b=EZgbBo7ecpDLB56zwQF2MbCGuMcBqf/4VhJbCEO1Nc2e3pI1y/mw4OP53PtyyeS4McBMNl
	FXja87pWShVPabJMceFJx2pU31+g7ol9lcjbwj6xspYSUQYIrRxye4HUSRw3xlsciI3UXy
	5ir/OrLS6JIIOjYVzav2PluBhddl01k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-LZVIk8K3MtqRvpGqsEqywA-1; Wed, 13 Nov 2024 07:42:31 -0500
X-MC-Unique: LZVIk8K3MtqRvpGqsEqywA-1
X-Mimecast-MFC-AGG-ID: LZVIk8K3MtqRvpGqsEqywA
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-37d56061a4cso3668819f8f.2
        for <linux-ide@vger.kernel.org>; Wed, 13 Nov 2024 04:42:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731501751; x=1732106551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gi/nDuPOQh+kW8YCVePTGgMsqduTQsEMI/h4REBTyU8=;
        b=jExJiDZ95UvsyDyVnH/r+nvTW5vdRYf3Q/izcsG4w5Uh+flEKebEhxq488KKb4ejOG
         QfGe7TOxXMx0Gx8FLRehWGOJ55hNGgfy1tkDiDBeHD+jrpd6r2nPkoKjel8t58wufRRx
         gjEJPlFn9CW/AtQ2yBfpt3ds1YXsF9YqJLRx2HjrbRTZ1XVPuWFx4DBrYIV9FAje7a7f
         zfnakvS9Du54BS3a0yvfXRnc3yFqZcgOIYw2v0CdU8oOIbZL7sDalYv93TLsXvsBBREk
         Yd5WctTGciBOSoQdRQ1K3ndwL2xa4+/y+xJ8uf9HsVh2F8V+5H7agKbiHUWu5L249JGv
         nXkg==
X-Gm-Message-State: AOJu0Yx6rY5GQSyJUHZqRoPuceY0ae4UjkyEudmZ0EFOssUXoychlqTS
	bFlL9uVVeSpi5WuejKjmPOiyizGwe+RMLlrPANux5L8N7AftnDHa+iW30sJ1UzaIs4x2giqDcda
	lXIk2C/fDaEbc/6gQjb3YTKFtSX5j3Wx52OOK/tdA4uUVYdSdZH/4OfKTjg==
X-Received: by 2002:a5d:5f53:0:b0:381:f595:fd0a with SMTP id ffacd0b85a97d-3820810ffc0mr4675175f8f.16.1731501750641;
        Wed, 13 Nov 2024 04:42:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkW+KWr+FGBC4soAeZ9AbHODqoGfzXwj1GlUIlZwp3/7RfEbVzZfIvsQ3hNUEE9XJJckqbgQ==
X-Received: by 2002:a5d:5f53:0:b0:381:f595:fd0a with SMTP id ffacd0b85a97d-3820810ffc0mr4675138f8f.16.1731501750223;
        Wed, 13 Nov 2024 04:42:30 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed99aa18sm18023528f8f.61.2024.11.13.04.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 04:42:29 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Damien Le Moal <dlemoal@kernel.org>,
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
	Philipp Stanner <pstanner@redhat.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mostafa Saleh <smostafa@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	Kunwu Chan <chentao@kylinos.cn>,
	Ankit Agrawal <ankita@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
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
Subject: [PATCH v2 00/11] Remove implicit devres from pci_intx()
Date: Wed, 13 Nov 2024 13:41:48 +0100
Message-ID: <20241113124158.22863-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

@Driver-Maintainers: Your driver might be touched by patch "Remove
devres from pci_intx()". You might want to take a look.

Changes in v2:
  - Drop pci_intx() deprecation patch.
  - ata: Add RB from Sergey and Niklas.
  - wifi: Add AB by Kalle.
  - Drop INTx deprecation patch
  - Drop ALSA / hda_intel patch because pci_intx() was removed from
    there in the meantime.

Changes since the RFC [1]:
  - Add a patch deprecating pci{m}_intx(). (Heiner, Andy, Me)
  - Add Acked-by's already given.
  - Export pcim_intx() as a GPL function. (Alex)
  - Drop patch for rts5280, since this driver will be removed quite
    soon. (Philipp Hortmann, Greg)
  - Use early-return in pci_intx_unmanaged() and pci_intx(). (Andy)

Hi all,

this series removes a problematic feature from pci_intx(). That function
sometimes implicitly uses devres for automatic cleanup. We should get
rid of this implicit behavior.

To do so, a pci_intx() version that is always-managed, and one that is
never-managed are provided. Then, all pci_intx() users are ported to the
version they need. Afterwards, pci_intx() can be cleaned up and the
users of the never-managed version be ported back to pci_intx().

This way we'd get this PCI API consistent again.

Patch "Remove devres from pci_intx()" obviously reverts the previous
patches that made drivers use pci_intx_unmanaged(). But this way it's
easier to review and approve. It also makes sure that each checked out
commit should provide correct behavior, not just the entire series as a
whole.

Merge plan for this is to enter through the PCI tree.

[1] https://lore.kernel.org/all/20241009083519.10088-1-pstanner@redhat.com/


Regards,
P.


Philipp Stanner (11):
  PCI: Prepare removing devres from pci_intx()
  drivers/xen: Use never-managed version of pci_intx()
  net/ethernet: Use never-managed version of pci_intx()
  net/ntb: Use never-managed version of pci_intx()
  misc: Use never-managed version of pci_intx()
  vfio/pci: Use never-managed version of pci_intx()
  PCI: MSI: Use never-managed version of pci_intx()
  ata: Use always-managed version of pci_intx()
  wifi: qtnfmac: use always-managed version of pcim_intx()
  HID: amd_sfh: Use always-managed version of pcim_intx()
  Remove devres from pci_intx()

 drivers/ata/ahci.c                            |  2 +-
 drivers/ata/ata_piix.c                        |  2 +-
 drivers/ata/pata_rdc.c                        |  2 +-
 drivers/ata/sata_sil24.c                      |  2 +-
 drivers/ata/sata_sis.c                        |  2 +-
 drivers/ata/sata_uli.c                        |  2 +-
 drivers/ata/sata_vsc.c                        |  2 +-
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  4 ++--
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  2 +-
 .../wireless/quantenna/qtnfmac/pcie/pcie.c    |  2 +-
 drivers/pci/devres.c                          | 24 +++----------------
 drivers/pci/pci.c                             | 16 +++----------
 include/linux/pci.h                           |  1 +
 13 files changed, 18 insertions(+), 45 deletions(-)

-- 
2.47.0


