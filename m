Return-Path: <linux-ide+bounces-2036-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB679476B8
	for <lists+linux-ide@lfdr.de>; Mon,  5 Aug 2024 10:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C528A281AD5
	for <lists+linux-ide@lfdr.de>; Mon,  5 Aug 2024 08:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252C4156980;
	Mon,  5 Aug 2024 08:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UND3VqGh"
X-Original-To: linux-ide@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE8A155A47
	for <linux-ide@vger.kernel.org>; Mon,  5 Aug 2024 08:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722844941; cv=none; b=kozBWOS44h6hDzF/8hfRepg75Pijwn83Samu1krxUZDCCPVkOzLEeMzDdFPz2BHY9N6J/8hgzYXj+mbgNmtFRpxRehI9pgG5F/bGASu8pvRx9hze03BeL5Jr4LyygG1Aa///xkvkeh4D+Ev2gwLDvgyQEWg0o9hdQlCEMuqNUvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722844941; c=relaxed/simple;
	bh=sx3ZEwTjacZymq7l5dYNsMmwiEx06cPeBRmHfSff+fI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U55KeU9q/d2zoBXRJlHs32r2h86EsTnArkpFDQBbnuJBZTWZesZSfUndu9M7o34ug81vBdLklaPxm9RlkRyhgc9bpowdyiLGA0NosTkUYxFDPvlHbIaoyb3IFClPto9HLQH79RS2I7iz23IpUACfgw37bN1dd1GYNaiz6ZXRfXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UND3VqGh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722844938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i/TqVki/K+bVEwX1UU3KMe0GQzdgKV3EwUwnH23Fjlo=;
	b=UND3VqGh2N4E0iUvhR+oG/czKyY8NFx5fapFbYAoI+4ktoOTkVYvF7CzSF2TFQ3KXImI57
	w1FrLmfOUULp7dLCNYVFPp3BsaOpwftippJBwQIbfS86KQmAZGmAQlj31GqzxpglZMdP0p
	qEK6gkXAN+JwlsjfBFMckbgrEcipJvw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-lF-JMbgzPT-yyVvzTLZ5_w-1; Mon, 05 Aug 2024 04:02:12 -0400
X-MC-Unique: lF-JMbgzPT-yyVvzTLZ5_w-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a7aa22266aaso95460266b.1
        for <linux-ide@vger.kernel.org>; Mon, 05 Aug 2024 01:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722844931; x=1723449731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/TqVki/K+bVEwX1UU3KMe0GQzdgKV3EwUwnH23Fjlo=;
        b=MGvjxjEF4QmwA6NiN6To0K4ytnipuGHP4ozmli+BoHyW0iEY6BvYUNfQ7ESiIp/1+4
         4gQXVqiKZUzv8ZX/tRj7pQiv8Nv0fUxmcPgwiOKzojV7JtBIbns2bRVriQyIDDEVgDN6
         ZVT9nLfhlHeo/O0WKthV/uaCp6MoSYGiv/hReTcOYKWjlO5H4zCt3IoeXzOTtFv2OXfU
         cfCKdZxVw7+yn8UBsoXLc4kupJDp5hFDaq8ab9vmeKVuj+Ru4GCRxT3L13L6HMNdBSdV
         XXM5YFWn21PMoT6WwkV7GfPUZyTYqiMUREpw65rRG45pvsnLJNxL1fHUjhQHmrcXE0Td
         c6YA==
X-Forwarded-Encrypted: i=1; AJvYcCU/2H9Vsb0TACAPRUwnk94pIyvhLn468nQ0b74nb+xomn7UnCcM9azE0G54z3vpGdUHzd4kr0Jn7MA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg0YdSpZNAjChyF5x3QC9jWzOoUwOlN6LylNoa+qNRXiE/3+a1
	x1YQH+OOLgN9JRQCKb72aEmCWKtZHfY/YWZwjmXuBCKtUfbV6xNShTFrozeAv3Fd24B++UUNjXX
	WLqsbbR05f2GoK80fq+rT2dEvVtKzOkTOiBuHeR3r6Fr7VhwbNBbHV4Jblg==
X-Received: by 2002:a17:907:3faa:b0:a7d:a4d2:a2c2 with SMTP id a640c23a62f3a-a7dc5167bcfmr402225566b.10.1722844931019;
        Mon, 05 Aug 2024 01:02:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYjjLsJD48h2GecBYBR7wt9098g8Cow53ABCQrETBiWavHTFkjy//1sxrj05YHxx3EiitJTQ==
X-Received: by 2002:a17:907:3faa:b0:a7d:a4d2:a2c2 with SMTP id a640c23a62f3a-a7dc5167bcfmr402222366b.10.1722844930599;
        Mon, 05 Aug 2024 01:02:10 -0700 (PDT)
Received: from eisenberg.fritz.box (200116b82df07e000a5f4891a3b0b190.dip.versatel-1u1.de. [2001:16b8:2df0:7e00:a5f:4891:a3b0:b190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7de8d0868bsm277958966b.143.2024.08.05.01.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 01:02:10 -0700 (PDT)
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
Subject: [PATCH v2 04/10] crypto: marvell - replace deprecated PCI functions
Date: Mon,  5 Aug 2024 10:01:31 +0200
Message-ID: <20240805080150.9739-6-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805080150.9739-2-pstanner@redhat.com>
References: <20240805080150.9739-2-pstanner@redhat.com>
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
 drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c | 14 +++++++++-----
 drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c | 13 +++++++++----
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c b/drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c
index 400e36d9908f..94d0e73e42de 100644
--- a/drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c
+++ b/drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c
@@ -739,18 +739,22 @@ static int otx2_cptpf_probe(struct pci_dev *pdev,
 		dev_err(dev, "Unable to get usable DMA configuration\n");
 		goto clear_drvdata;
 	}
-	/* Map PF's configuration registers */
-	err = pcim_iomap_regions_request_all(pdev, 1 << PCI_PF_REG_BAR_NUM,
-					     OTX2_CPT_DRV_NAME);
+	err = pcim_request_all_regions(pdev, OTX2_CPT_DRV_NAME);
 	if (err) {
-		dev_err(dev, "Couldn't get PCI resources 0x%x\n", err);
+		dev_err(dev, "Couldn't request PCI resources 0x%x\n", err);
 		goto clear_drvdata;
 	}
 	pci_set_master(pdev);
 	pci_set_drvdata(pdev, cptpf);
 	cptpf->pdev = pdev;
 
-	cptpf->reg_base = pcim_iomap_table(pdev)[PCI_PF_REG_BAR_NUM];
+	/* Map PF's configuration registers */
+	cptpf->reg_base = pcim_iomap(pdev, PCI_PF_REG_BAR_NUM, 0);
+	if (!cptpf->reg_base) {
+		err = -ENOMEM;
+		dev_err(dev, "Couldn't ioremap PCI resource 0x%x\n", err);
+		goto clear_drvdata;
+	}
 
 	/* Check if AF driver is up, otherwise defer probe */
 	err = cpt_is_pf_usable(cptpf);
diff --git a/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c b/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c
index 527d34cc258b..d0b6ee901f62 100644
--- a/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c
+++ b/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c
@@ -358,9 +358,8 @@ static int otx2_cptvf_probe(struct pci_dev *pdev,
 		dev_err(dev, "Unable to get usable DMA configuration\n");
 		goto clear_drvdata;
 	}
-	/* Map VF's configuration registers */
-	ret = pcim_iomap_regions_request_all(pdev, 1 << PCI_PF_REG_BAR_NUM,
-					     OTX2_CPTVF_DRV_NAME);
+
+	ret = pcim_request_all_regions(pdev, OTX2_CPTVF_DRV_NAME);
 	if (ret) {
 		dev_err(dev, "Couldn't get PCI resources 0x%x\n", ret);
 		goto clear_drvdata;
@@ -369,7 +368,13 @@ static int otx2_cptvf_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, cptvf);
 	cptvf->pdev = pdev;
 
-	cptvf->reg_base = pcim_iomap_table(pdev)[PCI_PF_REG_BAR_NUM];
+	/* Map VF's configuration registers */
+	cptvf->reg_base = pcim_iomap(pdev, PCI_PF_REG_BAR_NUM, 0);
+	if (!cptvf->reg_base) {
+		ret = -ENOMEM;
+		dev_err(dev, "Couldn't ioremap PCI resource 0x%x\n", ret);
+		goto clear_drvdata;
+	}
 
 	otx2_cpt_set_hw_caps(pdev, &cptvf->cap_flag);
 
-- 
2.45.2


