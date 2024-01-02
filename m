Return-Path: <linux-ide+bounces-132-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C16A822599
	for <lists+linux-ide@lfdr.de>; Wed,  3 Jan 2024 00:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD90B1C22BD1
	for <lists+linux-ide@lfdr.de>; Tue,  2 Jan 2024 23:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61871774B;
	Tue,  2 Jan 2024 23:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qKc8g0eE"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB54179B0
	for <linux-ide@vger.kernel.org>; Tue,  2 Jan 2024 23:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103D2C433C8;
	Tue,  2 Jan 2024 23:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704238740;
	bh=ik+0RROUX2+KNhYiqBRnzhAo+UQguWcvOKQxo9HBnf4=;
	h=From:To:Cc:Subject:Date:From;
	b=qKc8g0eEPNdKHmeR9OndlUtJvxOCc97zfWS2TbBN2gUH4RT2h6TxVv6Rb3hIEd1zC
	 /Xc1RaHlg1BY1tzi0kkOJn6jn/+AHPLiukW4F4gDp7dWxYhrqWVkXL5yJHYGv+KkPS
	 U3WVuSdZKvvKzdYAYkTxNTBS6dvKXQQWB6ixO5Q6uJ9HRIpVKcIapulRRugT/MszVv
	 b+TJc3MQBhNXV7fYQ7Nj9Nx/EI7cz43PBc17W7eHzzgniWM0O6ZtEF/v1IbGcYc48X
	 xPUco66s0IqVgUnwf0JWXneXejTmJeE8dISpC+tFxGZ08fp49Z7r6txNM5T7qvt/HT
	 KiipU//mZBppw==
From: Damien Le Moal <dlemoal@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-ide@vger.kernel.org
Cc: Niklas Cassel <cassel@kernel.org>
Subject: [GIT PULL] ata changes for 6.8-rc1
Date: Wed,  3 Jan 2024 08:38:58 +0900
Message-ID: <20240102233858.150598-1-dlemoal@kernel.org>
X-Mailer: git-send-email 2.43.0
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

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/libata/linux tags/ata-6.8-rc1

for you to fetch changes up to fa7280e5dd815363af147dc5358b25f5a06c9c68:

  MAINTAINERS: Add Niklas Cassel as libata maintainer (2023-12-29 10:12:33 +0900)

----------------------------------------------------------------
ata changes for 6.8-rc1

 - Cleanup the pxa PATA driver to use dma_request_chan() instead of the
   deprecated dma_request_slave_channel().

 - Add Niklas as co-maintainer of the ata subsystem.

----------------------------------------------------------------
Christophe JAILLET (1):
      ata: pata_pxa: convert not to use dma_request_slave_channel()

Damien Le Moal (1):
      MAINTAINERS: Add Niklas Cassel as libata maintainer

 MAINTAINERS            | 3 ++-
 drivers/ata/pata_pxa.c | 7 +++----
 2 files changed, 5 insertions(+), 5 deletions(-)

