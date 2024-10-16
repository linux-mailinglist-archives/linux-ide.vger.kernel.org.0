Return-Path: <linux-ide+bounces-2432-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FABC9A0A1D
	for <lists+linux-ide@lfdr.de>; Wed, 16 Oct 2024 14:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5326E1C249DB
	for <lists+linux-ide@lfdr.de>; Wed, 16 Oct 2024 12:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B25208D70;
	Wed, 16 Oct 2024 12:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nvt28Qux"
X-Original-To: linux-ide@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C852207A03
	for <linux-ide@vger.kernel.org>; Wed, 16 Oct 2024 12:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729082507; cv=none; b=pOektOpms65ZzQ7Ms8/fvNhz+dsOlAputLOfWoEwtlCKGbOZjYM/JpAfwzcLbnitHwEgTRbZXdg9LTwg2srAe4HvejCwjCHgA26fm1+c1BcKcQwDjkKGDWhpgEh5VaS4aX1EKVSDQccymFco1L+GPZuqFGk519tTcZWW7P+ZHt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729082507; c=relaxed/simple;
	bh=7s7mxb8AWORUrhpnBZAuRs0KJYeixrfxteXdwF3mTU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fuNvEDxhCaEbPsqA6uWktMbvfkLEhZeiUc7KrM16OP/lJojHdCaiKXRBSZMI0nTM0P35eXMfNMRW4cbog/5yJ3d0/LPbXEQLfiP32yHuG0qKQ9kJTKh8h6MLMsoAA6TO2wdNKpsnyugwhASB6ASAATxLbdAbH9k1YIgH7zP2BjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nvt28Qux; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729082505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sR2BJapihNLggAZsP9A0NQSPFnGH7MhHauwtA745mN0=;
	b=Nvt28QuxR9kNPbcjfnPgDIpDNASRY+0u/CQxTVu7WMUvohaeSN8x1to+s3fV72eUJkKrPT
	M05VY7N8UAxLbLK90NvPFOHNCPgacV++JkBj7HaMH473fYl7F9XLat7z2eoTKFyNUNE1eO
	7DzkwhTKlCy9xro/O/Q+DL8GZmGtWPM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-yw_913TmPduNK_bkJMruKg-1; Wed, 16 Oct 2024 08:41:44 -0400
X-MC-Unique: yw_913TmPduNK_bkJMruKg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-430581bd920so42343885e9.3
        for <linux-ide@vger.kernel.org>; Wed, 16 Oct 2024 05:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729082503; x=1729687303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sR2BJapihNLggAZsP9A0NQSPFnGH7MhHauwtA745mN0=;
        b=ldfzB3MOsJeGjiGKdqOrEeSNIpijb0N0AahCyw4MX2sgCn2CFEevgATyP2Fhga6c/G
         WuC0HolOghgg+Xv5/7zH+U0BRbHrTkCmw59k+QrR7DK6LR/zHJ/aUztmMc8LWFSjGT4k
         4LwY7KyU5tDeW2hDPdvEgEKX+FYEmSnPjPijXo66dkpYKjhs+JOceqQZr4waEiShEA00
         JCds3b/bw7mp7q5LkohL13U7GvzB1vr97iXepC0p+kZrfAJU2lidL0DybERwDE2nrfEk
         zvtqxferYZ0W5YnzbKc6pJ61WrAAoJYzLhtYnGbAZmB7738DeqYmyG5xaC1VY81MHH1P
         n8bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs1RH9NEmydO11fzLJ1CGT8FN+NwIWZq4PZtiC5SAhqRJEcg0/DoYNWD4j3JAps5s8/A/EqNpXlMw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrs43txJkO1kEvw3fhG2huT5r+ukeDIUa7cQMsBDEndxUASTi1
	5UdyvbrlCFUNCtgt2PL1FoCAyN2fCVmelXlzyDzrXJKQYEYPu/Myrzaxp4Rd1UI2mTLqk25VmBH
	iQzU3Vn83E+ucVrc2KtZYqARuUHYxvVUHcvgoSwlEiGkuhCF/3w5YSvPuKw==
X-Received: by 2002:a05:600c:4514:b0:431:157a:986e with SMTP id 5b1f17b1804b1-4314a31d357mr28400955e9.20.1729082502966;
        Wed, 16 Oct 2024 05:41:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEf6DkLObKhMSbcWX25Z8cQR8BxA15anQyPPh8evt92tsHg1K+r+MKmZynxnhYXfRl0KAulLQ==
X-Received: by 2002:a05:600c:4514:b0:431:157a:986e with SMTP id 5b1f17b1804b1-4314a31d357mr28400355e9.20.1729082502483;
        Wed, 16 Oct 2024 05:41:42 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa8ffd6sm4246879f8f.50.2024.10.16.05.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 05:41:42 -0700 (PDT)
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
	linux-sound@vger.kernel.org
Subject: [PATCH v4 00/10] Remove pcim_iomap_regions_request_all()
Date: Wed, 16 Oct 2024 14:41:22 +0200
Message-ID: <20241016124136.41540-1-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v4:
  - Add Acked-by's from Giovanni and Kalle.

Changes in v3:
  - Add missing full stops to commit messages (Andy).

Changes in v2:
  - Fix a bug in patch №4 ("crypto: marvell ...") where an error code
    was not set before printing it. (Me)
  - Apply Damien's Reviewed- / Acked-by to patches 1, 2 and 10. (Damien)
  - Apply Serge's Acked-by to patch №7. (Serge)
  - Apply Jiri's Reviewed-by to patch №8. (Jiri)
  - Apply Takashi Iwai's Reviewed-by to patch №9. (Takashi)


Hi all,

the PCI subsystem is currently working on cleaning up its devres API. To
do so, a few functions will be replaced with better alternatives.

This series removes pcim_iomap_regions_request_all(), which has been
deprecated already, and accordingly replaces the calls to
pcim_iomap_table() (which were only necessary because of
pcim_iomap_regions_request_all() in the first place) with calls to
pcim_iomap().

Would be great if you can take a look whether this behaves as you
intended for your respective component.

Cheers,
Philipp

Philipp Stanner (10):
  PCI: Make pcim_request_all_regions() a public function
  ata: ahci: Replace deprecated PCI functions
  crypto: qat - replace deprecated PCI functions
  crypto: marvell - replace deprecated PCI functions
  intel_th: pci: Replace deprecated PCI functions
  wifi: iwlwifi: replace deprecated PCI functions
  ntb: idt: Replace deprecated PCI functions
  serial: rp2: Replace deprecated PCI functions
  ALSA: korg1212: Replace deprecated PCI functions
  PCI: Remove pcim_iomap_regions_request_all()

 .../driver-api/driver-model/devres.rst        |  1 -
 drivers/ata/acard-ahci.c                      |  6 +-
 drivers/ata/ahci.c                            |  6 +-
 drivers/crypto/intel/qat/qat_420xx/adf_drv.c  | 11 +++-
 drivers/crypto/intel/qat/qat_4xxx/adf_drv.c   | 11 +++-
 .../marvell/octeontx2/otx2_cptpf_main.c       | 14 +++--
 .../marvell/octeontx2/otx2_cptvf_main.c       | 13 ++--
 drivers/hwtracing/intel_th/pci.c              |  9 ++-
 .../net/wireless/intel/iwlwifi/pcie/trans.c   | 16 ++---
 drivers/ntb/hw/idt/ntb_hw_idt.c               | 13 ++--
 drivers/pci/devres.c                          | 59 +------------------
 drivers/tty/serial/rp2.c                      | 12 ++--
 include/linux/pci.h                           |  3 +-
 sound/pci/korg1212/korg1212.c                 |  6 +-
 14 files changed, 76 insertions(+), 104 deletions(-)

-- 
2.47.0


