Return-Path: <linux-ide+bounces-2412-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCE799F60E
	for <lists+linux-ide@lfdr.de>; Tue, 15 Oct 2024 20:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C203281706
	for <lists+linux-ide@lfdr.de>; Tue, 15 Oct 2024 18:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4F9175D48;
	Tue, 15 Oct 2024 18:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Iu4EEd5U"
X-Original-To: linux-ide@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838CB2036F1
	for <linux-ide@vger.kernel.org>; Tue, 15 Oct 2024 18:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729018305; cv=none; b=khfzvOAoQMDSDlUtqsh2QjaSxvR5qpz6hRVSA7UFn+zOFJNDAv+Aqop9Z3yxO3RWzlaUx6J1Qy9nZHkhBYrgIT68RG1/ZxozWZQhjf9sVHJqzGczBMU0ptv+YZ06/shCq5xl/XafvJ4iBCJ2sq4Jb1vb4JYmAYZ/HQ+ejjG144U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729018305; c=relaxed/simple;
	bh=YYwOSyuNwzPMG+/oq7uN2BePBtYq5BuqWQxzXADBcmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UgkGG9d7CaxjabZGsBmj+Rs/uq+J9yafXtSXsL/p7ERzVioKd3YGYd7UW+JMzeRt2Ll3q7sV2gm5Td339gai3ImDS9OdQNhnUVLfvbqGKlDEmYJJlJrrDolL/y4CH6Fh/mZLJr/fMu8x9rfLmk1oLBej59in7nfJqYvBt2Xztc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Iu4EEd5U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729018302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N0GRF4pPtSOgd1WabJUy8wYxVfX9TEQxA2AbPtBzocc=;
	b=Iu4EEd5Ungz9TYIabB7OQoafM2FugMHu+IEHY+MJU2v1rpk4B8WTbvCs5wF/3X848emf4u
	lVLtjoKUo6slnKtSu/ZRcmqKSuK57Ud5UxeIQqoJFtsvSBEWVh7FjQKkp0kgz76FPLr4Nt
	W8u8VXqQp1WlrQ88Ft9sMaRJMTj3MpY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-nMmtI5uLMi65uS0VXZsFPw-1; Tue, 15 Oct 2024 14:51:41 -0400
X-MC-Unique: nMmtI5uLMi65uS0VXZsFPw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5c94ccfb210so3348105a12.1
        for <linux-ide@vger.kernel.org>; Tue, 15 Oct 2024 11:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018300; x=1729623100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0GRF4pPtSOgd1WabJUy8wYxVfX9TEQxA2AbPtBzocc=;
        b=BsW9KqCIifgLe/rYVa0PCgCobEzjDTlOJKLZaDuOVAJ+jwBWc/cvOMuiTJ8T8fbx7T
         k3r0Pv/u0ll14ZhrnzwuFjt/AuKmF0VTS/dL/U6gruAKwPqNOrw6gjrrF5S7PH48RjYx
         BhRBjzzI/fBoYSWzpNiVTdPJOavc7kr1E9ZG2SEmwq6r/y62a9r2Lsz0bbHCNuylttVL
         xb21pdikpdsBxJ4rXUnNnvVlnKJSlryMzvjfVy4AvWHjhqybMN0AHXZJ1gNYlUH5rq3/
         jlEm2Wm4xmt5E38V96950FeotEw5t3G8JNZoB1kika7fXh9e1cPHC7/gt8Ga9cVyPuBl
         /GuQ==
X-Gm-Message-State: AOJu0Yz1LrIjm1w9huyNbW9P0PDTSKtD7GLBnhrASDVRDKOn/ZNw79k7
	5WH18YliFc40ah0jqTrI1ZDBYqNEmD/i0fPrvXwfbPSWb1Tv/inSxVJzmfTD9Vsv8iutiIXo9ZD
	QmS4FzduXvTe5qTTE+wr0K9lS5ZuzizQYQDK4ygCVtIMnB5p9UirdhBJFQQ==
X-Received: by 2002:a05:6402:5212:b0:5c9:547d:99 with SMTP id 4fb4d7f45d1cf-5c99501ced5mr1032550a12.2.1729018300227;
        Tue, 15 Oct 2024 11:51:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoUi+m94pA/sZ0UkPSNqunOeFPcNR+QjlgzRmDDQ7K7kAorm0A07Mz2aeKaa+48zMcVX+P9g==
X-Received: by 2002:a05:6402:5212:b0:5c9:547d:99 with SMTP id 4fb4d7f45d1cf-5c99501ced5mr1032505a12.2.1729018299657;
        Tue, 15 Oct 2024 11:51:39 -0700 (PDT)
Received: from eisenberg.fritz.box (200116b82d5d5a0006e2615320d1d4db.dip.versatel-1u1.de. [2001:16b8:2d5d:5a00:6e2:6153:20d1:d4db])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d39a9a2sm974438a12.0.2024.10.15.11.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:38 -0700 (PDT)
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
	Chen Ni <nichen@iscas.ac.cn>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	Christian Brauner <brauner@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Eric Auger <eric.auger@redhat.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Ye Bin <yebin10@huawei.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Rui Salvaterra <rsalvaterra@gmail.com>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 00/13] Remove implicit devres from pci_intx()
Date: Tue, 15 Oct 2024 20:51:10 +0200
Message-ID: <20241015185124.64726-1-pstanner@redhat.com>
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

Philipp Stanner (13):
  PCI: Prepare removing devres from pci_intx()
  ALSA: hda_intel: Use always-managed version of pcim_intx()
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
  PCI: Deprecate pci_intx(), pcim_intx()

 drivers/ata/ahci.c                            |  2 +-
 drivers/ata/ata_piix.c                        |  2 +-
 drivers/ata/pata_rdc.c                        |  2 +-
 drivers/ata/sata_sil24.c                      |  2 +-
 drivers/ata/sata_sis.c                        |  2 +-
 drivers/ata/sata_uli.c                        |  2 +-
 drivers/ata/sata_vsc.c                        |  2 +-
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  4 +--
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  2 +-
 .../wireless/quantenna/qtnfmac/pcie/pcie.c    |  2 +-
 drivers/pci/devres.c                          | 29 +++++--------------
 drivers/pci/pci.c                             | 19 ++++--------
 include/linux/pci.h                           |  1 +
 sound/pci/hda/hda_intel.c                     |  2 +-
 14 files changed, 26 insertions(+), 47 deletions(-)

-- 
2.47.0


