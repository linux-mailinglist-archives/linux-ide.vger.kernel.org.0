Return-Path: <linux-ide+bounces-2358-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AAE996327
	for <lists+linux-ide@lfdr.de>; Wed,  9 Oct 2024 10:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1DFA286042
	for <lists+linux-ide@lfdr.de>; Wed,  9 Oct 2024 08:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AB5191F89;
	Wed,  9 Oct 2024 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UsSg2NMZ"
X-Original-To: linux-ide@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483BD1917D0
	for <linux-ide@vger.kernel.org>; Wed,  9 Oct 2024 08:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463025; cv=none; b=Ox8spLqLPDyw6y7Es+gs9MW4DJPzSIbDMxZ/6yLt+H+n40gpnIcd7PG9OQ2zkC1a8bXkVM6rWOWgXN1psZroJjnq50RL1sYhprvd0dissCQiAfa+QdhoOd4uSde9Frk98OlhYHgZmMPZW5/kFbhEVomge8JXn5f93lbC8x14LDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463025; c=relaxed/simple;
	bh=mnlbyKVHuZwz2vfwiuiGqUk5LIdw1w6V3s4ejKqAsNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=agGQkPsq1tvF8DNcA2raZM/5uba1fVxy03uFcszE0gSIMkTZl56cZnICfDRlE7vLKjrFT1WUQDs6TESVzAjlcHh+WQxNst6938Q8genwPtR+9CNrJVp6avj/8EdcyM6hRxSGbveRijBbnWh4YdzQxkRlXbd/pvOQAu7iUTPWUWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UsSg2NMZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728463023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1PPm9S1zRcO86dlq3mHzZGXnJgcIWsisXbqhvFp0Kes=;
	b=UsSg2NMZ897ahx2Hxy9gM9AWiGxRZ6fLMZNjp+8f45V5VjnAAnRbmcAg7Dyq4MDCv0JKua
	f+VWdzqcL2pwfVi8Cl9khEyieEXDCWxja0kV19y9Z/sGfPxmEuMUSy5sIYptFyj982++Yr
	jME2ar96DFr3lZSY8/n8WvSop+tuf9I=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-8nZ8MQuaNDqaFqv_KTw8Kw-1; Wed, 09 Oct 2024 04:36:59 -0400
X-MC-Unique: 8nZ8MQuaNDqaFqv_KTw8Kw-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b02e01d8fcso90799085a.0
        for <linux-ide@vger.kernel.org>; Wed, 09 Oct 2024 01:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463018; x=1729067818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1PPm9S1zRcO86dlq3mHzZGXnJgcIWsisXbqhvFp0Kes=;
        b=pRFOOKEqP9dYzjTUMZFfZeJZg9Wv1O27PwcYIW/oufHUV9hFB9uPAtCesz42etPrOT
         iAp2OBgZP62keFPLYq239iq1X3rDftyVvPdG/xb1QWg3f+YRd9yEHTGedba72KsggDLj
         btIgNfjchLj/1ki3PI+seisS0/it5TtJGGWMHow1oVKX6ImpGezjStDe+bFE1mKoS/Yl
         DrTu5WOOCgqQMHyB+Amj3UDTWNlFuC0hdkr8oxuEE/dM2bBd2UDSSjdMUI3UJFVVRfNv
         rabb8lvJs1uTKG3BHb5haYG4/vMY5dM2IoH6LS6XrIXrjn7vYliLPbtV8lika1BSSg+g
         7YmQ==
X-Gm-Message-State: AOJu0Yz4Ix9Z4PGMStZ9e5IwGsfL2smxpBdme1E6DeMKWaUAHtujnrkD
	b357uFxSt8iVxCLkGKjOMTJzLK/qJncDDkr7gPqvmiw7bVF3JDukSJ5xle2+ZXQPQay7UTcPccQ
	scmpkDePMDqf94RsgzWY+zlCxR6o9jRmN0WVF3Q1i4Y+73KuJB2+yJOXslw==
X-Received: by 2002:a05:620a:40d2:b0:7af:cea1:2dd6 with SMTP id af79cd13be357-7afcea13062mr575430585a.9.1728463017680;
        Wed, 09 Oct 2024 01:36:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvN3DzIDBf5agA7u3XzrMCdDXSCcUz6hrKViBRxZsE1bbVXxxuhuZe+LfXJzoxle8rULiRWQ==
X-Received: by 2002:a05:620a:40d2:b0:7af:cea1:2dd6 with SMTP id af79cd13be357-7afcea13062mr575422585a.9.1728463017195;
        Wed, 09 Oct 2024 01:36:57 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae75615aa2sm439643585a.14.2024.10.09.01.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 01:36:56 -0700 (PDT)
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
Subject: [RFC PATCH 02/13] ALSA: hda: hda_intel: Use always-managed version of pcim_intx()
Date: Wed,  9 Oct 2024 10:35:08 +0200
Message-ID: <20241009083519.10088-3-pstanner@redhat.com>
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

hda_intel enables its PCI-Device with pcim_enable_device(). Thus, it needs
the always-managed version.

Replace pci_intx() with pcim_intx().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 sound/pci/hda/hda_intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index b4540c5cd2a6..b44ca7b6e54f 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -786,7 +786,7 @@ static int azx_acquire_irq(struct azx *chip, int do_disconnect)
 	}
 	bus->irq = chip->pci->irq;
 	chip->card->sync_irq = bus->irq;
-	pci_intx(chip->pci, !chip->msi);
+	pcim_intx(chip->pci, !chip->msi);
 	return 0;
 }
 
-- 
2.46.1


