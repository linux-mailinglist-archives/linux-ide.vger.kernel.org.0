Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6180147C3B8
	for <lists+linux-ide@lfdr.de>; Tue, 21 Dec 2021 17:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239536AbhLUQ0l (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 21 Dec 2021 11:26:41 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:27173 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233360AbhLUQ0l (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 21 Dec 2021 11:26:41 -0500
X-IronPort-AV: E=Sophos;i="5.88,224,1635174000"; 
   d="scan'208";a="104724089"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Dec 2021 01:26:39 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 497ED40A64B7;
        Wed, 22 Dec 2021 01:26:38 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/4] ata: pata_platform: Refurbish the driver
Date:   Tue, 21 Dec 2021 16:26:10 +0000
Message-Id: <20211221162614.25308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi All,

This patch series aims to merge pata_of_platform into pata_platform
driver.

Cheers,
Prabhakar

Changes for v2:
* Dropped check for IRQ0
* Dropped setting the irqflags as suggested by Rob
* Fixed freeing up irq_res when not present in DT
* Dropped PATA_OF_PLATFORM entry
* Split up sorting of headers in separate patch
* Dropped sht from struct pata_platform_priv
* Used GENMASK() to calculate mask

Lad Prabhakar (4):
  ata: pata_platform: make use of platform_get_mem_or_io()
  ata: pata_platform: Merge pata_of_platform into pata_platform
  ata: pata_platform: Sort the #includes alphabetically
  ata: pata_platform: Make use of GENMASK() macro

 drivers/ata/Kconfig            |  10 --
 drivers/ata/Makefile           |   1 -
 drivers/ata/pata_of_platform.c |  90 ---------------
 drivers/ata/pata_platform.c    | 199 ++++++++++++++++++++++++---------
 include/linux/ata_platform.h   |   9 --
 5 files changed, 144 insertions(+), 165 deletions(-)
 delete mode 100644 drivers/ata/pata_of_platform.c

-- 
2.17.1

