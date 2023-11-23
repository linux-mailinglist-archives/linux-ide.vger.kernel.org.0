Return-Path: <linux-ide+bounces-40-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B33687F69D8
	for <lists+linux-ide@lfdr.de>; Fri, 24 Nov 2023 01:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D7D4B20D0F
	for <lists+linux-ide@lfdr.de>; Fri, 24 Nov 2023 00:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F594816
	for <lists+linux-ide@lfdr.de>; Fri, 24 Nov 2023 00:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/4VBGmq"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46267405FD
	for <linux-ide@vger.kernel.org>; Thu, 23 Nov 2023 23:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43340C433C7;
	Thu, 23 Nov 2023 23:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700783236;
	bh=uehVteHjhX5v7aiIdl3BDpoGRy6w1Uf0NE7KBkTNb5k=;
	h=From:To:Subject:Date:From;
	b=G/4VBGmq3iNXFotdBiS1IbYrSb2ZDsdqvSDenuX0cR7iAqcpT/kZVih65aNgp+dYs
	 RXD4sFZhBIbjR5pHVgCVb30WkJpeEvJNlBl5WyBmnm2wgbD9/2rooFkhN8/PvvYR9m
	 s/dxDq1FRSbkkslnBtox5OKyu6NezgWnH8Pl3NIBBQfoEeqk1Ln1keCXqjltqbmYfI
	 UkMXuln2XCPnn+3oUzijD1hFmKfgfrp6t20d2sH3BRjiBZgb1reLGNl/sjG233XAB7
	 PpCFcZLfDsCCsh3iqvzHQ4cYyliwRXD+AUOEF2kVp8mgs49tC8jtYPSamMfUFIgrnP
	 oQU68MQYMnTXg==
From: Damien Le Moal <dlemoal@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-ide@vger.kernel.org
Subject: [GIT PULL] ata fixes for 6.7-rc3
Date: Fri, 24 Nov 2023 08:47:14 +0900
Message-ID: <20231123234715.35765-1-dlemoal@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

The following changes since commit 98b1cc82c4affc16f5598d4fa14b1858671b2263:

  Linux 6.7-rc2 (2023-11-19 15:02:14 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata tags/ata-6.7-rc3

for you to fetch changes up to a6925165ea82b7765269ddd8dcad57c731aa00de:

  ata: pata_isapnp: Add missing error check for devm_ioport_map() (2023-11-20 09:22:26 +0900)

----------------------------------------------------------------
ata fixes for 6.7-rc3

 - Add a missing error check in the adapter initialization of the
   pata_isapnp driver (Chen).

----------------------------------------------------------------
Chen Ni (1):
      ata: pata_isapnp: Add missing error check for devm_ioport_map()

 drivers/ata/pata_isapnp.c | 3 +++
 1 file changed, 3 insertions(+)

