Return-Path: <linux-ide+bounces-2011-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CC29451FB
	for <lists+linux-ide@lfdr.de>; Thu,  1 Aug 2024 19:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 229131C22E2D
	for <lists+linux-ide@lfdr.de>; Thu,  1 Aug 2024 17:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD6D1BD02F;
	Thu,  1 Aug 2024 17:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P71hHldR"
X-Original-To: linux-ide@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2901BC9F6
	for <linux-ide@vger.kernel.org>; Thu,  1 Aug 2024 17:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722534401; cv=none; b=m6QJ+mpPtkoKOFXtyX7MfQSHFme99+XSv5/06Azg+jHY87bRMrCugRnaBJyxzeqL134efOqkUKiwjcM5Vdy3QJbhwJ2p2kt+20nRbtBilMc4mFq/kSuO1y4NGf5DP5dt4aksaP10YYQvdE7WMFJJVpUsVoisuGk3i1XEwhVQG0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722534401; c=relaxed/simple;
	bh=T/Lr5R3ZpRsNgk4LNzf4i3JOmIq6wzNv8zvkRdHooAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TH2BEwVQ272Z8s0gg0Kq4hy/jtX745Yt6jMk3ogKx33QN7rVelxlU5p6BoP0wcJA8lDgt6oa9ZfzmEvfKp1bXFnomKLjCVgX+Oq8iIfXu1qFXiq1NTH0zTGTQEIrBjdyJBwwDWQgyZ1lltDd2/HHMhvSTFp2u82UynmEe4f2Q/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P71hHldR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722534397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VIcu667vSRZRiKEHakO3GAIgbzPtgHQvNS3his8mZEo=;
	b=P71hHldRKgy1FlzMb9PtVZ4xG9cjvDT97en27RL+JCuNhDtUZ9P4/uTc1AL02bCQgm7YhP
	4TB9TxVZYN3UITZJfBtSVnvMreYlb7FqemEXXPAXcTbtwYtarLPe3SJ+059UQy6awCQmOE
	KqgOEI0zrBGf+MxeeQ/qjkqAr1LTDkc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-3ypzRFjoPiG_DfgX3ainSA-1; Thu, 01 Aug 2024 13:46:36 -0400
X-MC-Unique: 3ypzRFjoPiG_DfgX3ainSA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5af1a5a36feso826500a12.0
        for <linux-ide@vger.kernel.org>; Thu, 01 Aug 2024 10:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722534396; x=1723139196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIcu667vSRZRiKEHakO3GAIgbzPtgHQvNS3his8mZEo=;
        b=dZ4kr+7dv542T3KFhAyJdu4AaZC98h8i44Mdt9yxuo9xISAh72q/O737BibdB80DRh
         7USE/JdpAzkk7egsvPtgmWu4YR0KFOtfX05XUdJe+0ybFS7rxSqt6KCPQXRpSpOIe27F
         +5XybqGOlpTGsXCA4bREl7HgNhPfQUB8dmB2y7teKB3vgtvRDOTMZC5HEd/ADWw3oa9e
         QWeUDfHE5gbv7pJI21bE5wESfvRD2FvBZk8A/3yfJoWXCEozMRRQoOUG2FnmR2HkBeFe
         D3V47Kot+wmOWA8ym8KGHC3Ig6aMbk6HzOtWhy42q3Ea7UTeebECQGwb49yu980NpWGb
         UoSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0+gwAbgodEWRIKwfcsRg1a03kS7q9ulB14X1ZZseMfD5yYnB1AHw9wNiNucz7CP3HRIQ1A2zoBIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuS+0N+ZqUTZaUSSTXkJ52/44gsSch3j6gsTB5CoBXh/Zg6F+c
	yNmJc9T4qa4MQHUo0af2KB9fnLNwN5Ly7nc5SN0wfsT0Bpx4z6qVj2KwQRv2LNVAWQN4I+i1msC
	13Ow0a+Q9KjCnlgDUCeLTfd1XAStgFL1ZTQwwpMS7J5hBvgI/WHzu6bhNgA==
X-Received: by 2002:a17:907:2d21:b0:a7a:9f0f:ab1b with SMTP id a640c23a62f3a-a7dc509f24fmr31650766b.7.1722534395614;
        Thu, 01 Aug 2024 10:46:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHsAm8ay3YLV5X2CKZi8aqVdjkY/Zte8gQFe54oKpkGHtEojyFbBE+V0V3Lk+EwhBeWW6VAw==
X-Received: by 2002:a17:907:2d21:b0:a7a:9f0f:ab1b with SMTP id a640c23a62f3a-a7dc509f24fmr31648666b.7.1722534395021;
        Thu, 01 Aug 2024 10:46:35 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d4b:3000:1a1d:18ca:1d82:9859])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e83848sm5339066b.177.2024.08.01.10.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 10:46:34 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arnaud Ebalard <arno@natisbad.org>,
	Srujana Challa <schalla@marvell.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Kalle Valo <kvalo@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kevin Cernekee <cernekee@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Jie Wang <jie.wang@intel.com>,
	Adam Guerin <adam.guerin@intel.com>,
	Shashank Gupta <shashank.gupta@intel.com>,
	Damian Muszynski <damian.muszynski@intel.com>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	qat-linux@intel.com,
	linux-crypto@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 05/10] intel_th: pci: Replace deprecated PCI functions
Date: Thu,  1 Aug 2024 19:46:03 +0200
Message-ID: <20240801174608.50592-6-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801174608.50592-1-pstanner@redhat.com>
References: <20240801174608.50592-1-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcim_iomap_table() and pcim_iomap_regions_request_all() have been
deprecated by the PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()").

Replace these functions with their successors, pcim_iomap() and
pcim_request_all_regions()

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/hwtracing/intel_th/pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/intel_th/pci.c b/drivers/hwtracing/intel_th/pci.c
index 0d7b9839e5b6..e9d8d28e055f 100644
--- a/drivers/hwtracing/intel_th/pci.c
+++ b/drivers/hwtracing/intel_th/pci.c
@@ -23,7 +23,6 @@ enum {
 	TH_PCI_RTIT_BAR		= 4,
 };
 
-#define BAR_MASK (BIT(TH_PCI_CONFIG_BAR) | BIT(TH_PCI_STH_SW_BAR))
 
 #define PCI_REG_NPKDSC	0x80
 #define NPKDSC_TSACT	BIT(5)
@@ -83,10 +82,16 @@ static int intel_th_pci_probe(struct pci_dev *pdev,
 	if (err)
 		return err;
 
-	err = pcim_iomap_regions_request_all(pdev, BAR_MASK, DRIVER_NAME);
+	err = pcim_request_all_regions(pdev, DRIVER_NAME);
 	if (err)
 		return err;
 
+	if (!pcim_iomap(pdev, TH_PCI_CONFIG_BAR, 0))
+		return -ENOMEM;
+
+	if (!pcim_iomap(pdev, TH_PCI_STH_SW_BAR, 0))
+		return -ENOMEM;
+
 	if (pdev->resource[TH_PCI_RTIT_BAR].start) {
 		resource[TH_MMIO_RTIT] = pdev->resource[TH_PCI_RTIT_BAR];
 		r++;
-- 
2.45.2


