Return-Path: <linux-ide+bounces-2441-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7F19A0A71
	for <lists+linux-ide@lfdr.de>; Wed, 16 Oct 2024 14:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0BFE281496
	for <lists+linux-ide@lfdr.de>; Wed, 16 Oct 2024 12:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E2B212F1C;
	Wed, 16 Oct 2024 12:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IZjFKke7"
X-Original-To: linux-ide@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38FD210C30
	for <linux-ide@vger.kernel.org>; Wed, 16 Oct 2024 12:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729082524; cv=none; b=C+oKHfv+bROf78k/Y2SXdXRkG/sdroHtzKzB1sZyBcqHhRNROmlOgTl/ZRhWodGyZnxZgjPdEPHoUNWKkMwJfrT6J2nUJj/0Xs+y4ytPzeJNMtEDtZsU973W+G5CJyFVcVHNLW/0pUrzRV2BMZroSdDYhmXIyToGTdFMApMvceY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729082524; c=relaxed/simple;
	bh=x2AO4woPu9H2aNxl2TylFo7TB42POmIv8HM+dl0TTWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mr1C19icmkuFyQt6yNqJn9p/9UNue2qgDOKYOmdUYVSDzDkzGnkZo2mG1YIA88HeDgDMqrER4tUnRWmRfR0vNAPCzr/M58fIq6RgRMKYgnlr09GDteANy3JDbfgDXpPFDcXFCg+bTR7H3XMrpmseTsxm35xCObPMaIDCL5zJRVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IZjFKke7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729082521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vZ55uYUf11n7K97VlTpkijb2Akz5QQrQmQxQWIeLt9U=;
	b=IZjFKke7QQ5MWKoIuvljUYhosj5NUC9UqI8E++6lrY35p3PT7YIkzW2PGUWVXIzTN7Gt8S
	b+qMD41ZDPNaKtI+Dm+TBTTTd5kGf0OR/P8pg69f8lOfbg4DS2D6D6To4sTbCK/yYcExCf
	hTU1KGxSGNG790MSAo3peI8EUts6nkY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-FTB-TkbONDSBGDRBbDC-4g-1; Wed, 16 Oct 2024 08:42:00 -0400
X-MC-Unique: FTB-TkbONDSBGDRBbDC-4g-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37d589138a9so2469771f8f.1
        for <linux-ide@vger.kernel.org>; Wed, 16 Oct 2024 05:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729082519; x=1729687319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZ55uYUf11n7K97VlTpkijb2Akz5QQrQmQxQWIeLt9U=;
        b=LE5ggH2mkw9KxzzUloYDdcFcIYZ4qGfmIxgwawVVk2pnYBsEC3Te3eairhvak8JBKI
         fOxiupRaeuM3BXAY0dXh/PobL9TvJJK7wxRi1CDnHGsDrMUQuaxPPFovT6Krg8eImqP2
         NrC/YSAwIHAuBFfSzeXQNOrDhf/4TTEo385YHhmF8QEOUjnyGgOjf2VA3kzvnu3PHZ/V
         ZW0CYpN+4BE8BuN/x3E/nT8nBntKHlq1KPRc/UEPcZA+CHeHL5kfuJEoN0/QSZ8h3DNR
         St4tXmiHJhaagOyNTPDXaRqvf483ilDuQif0D2KCzm1a5tdi2VP0tif129bAfPeCL+WR
         4EIA==
X-Forwarded-Encrypted: i=1; AJvYcCVGPrLcaGV16kQri4VMgfp4qgeNX/Ygdceyon+Iz9iA/3HLThwsNxuvRQm8h7IwMNvc3+s2IFU+bJo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2XEgrzjxOYvf6+IOX/mafOZIXinMvGACoanJHqKSfVFvK+EZ3
	oJiWiaZi89Wr86iOBRwosC2CwZZWFsQzjOiMEe22gLrDylkgvSFmpQ1W0KgD5y2PRFR3GJ4syId
	yqokDE2yB/BL05pC1bnF9X2kH1Tv5YRhyXyLm5CATYFgD90sautOy7FYt6Q==
X-Received: by 2002:a5d:63c6:0:b0:37d:45c3:3459 with SMTP id ffacd0b85a97d-37d86bd5846mr2609124f8f.21.1729082519598;
        Wed, 16 Oct 2024 05:41:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcG1vuQQi/7uOxIPnqbA8E3aguDL21o7Zrwz4HGATFpZj6nHRtNeHXDvrH6Vz1nzXFwT9WGg==
X-Received: by 2002:a5d:63c6:0:b0:37d:45c3:3459 with SMTP id ffacd0b85a97d-37d86bd5846mr2609081f8f.21.1729082519100;
        Wed, 16 Oct 2024 05:41:59 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa8ffd6sm4246879f8f.50.2024.10.16.05.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 05:41:58 -0700 (PDT)
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
	Philipp Stanner <pstanner@redhat.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Jie Wang <jie.wang@intel.com>,
	Tero Kristo <tero.kristo@linux.intel.com>,
	Adam Guerin <adam.guerin@intel.com>,
	Shashank Gupta <shashank.gupta@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Breno Leitao <leitao@debian.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	qat-linux@intel.com,
	linux-crypto@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v4 09/10] ALSA: korg1212: Replace deprecated PCI functions
Date: Wed, 16 Oct 2024 14:41:31 +0200
Message-ID: <20241016124136.41540-10-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241016124136.41540-1-pstanner@redhat.com>
References: <20241016124136.41540-1-pstanner@redhat.com>
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
pcim_request_all_regions().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/korg1212/korg1212.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index e62fb1ad6d77..49b71082c485 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -2108,7 +2108,7 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
         for (i=0; i<kAudioChannels; i++)
                 korg1212->volumePhase[i] = 0;
 
-	err = pcim_iomap_regions_request_all(pci, 1 << 0, "korg1212");
+	err = pcim_request_all_regions(pci, "korg1212");
 	if (err < 0)
 		return err;
 
@@ -2130,7 +2130,9 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
 		   korg1212->iomem2, iomem2_size,
 		   stateName[korg1212->cardState]);
 
-	korg1212->iobase = pcim_iomap_table(pci)[0];
+	korg1212->iobase = pcim_iomap(pci, 0, 0);
+	if (!korg1212->iobase)
+		return -ENOMEM;
 
 	err = devm_request_irq(&pci->dev, pci->irq, snd_korg1212_interrupt,
                           IRQF_SHARED,
-- 
2.47.0


