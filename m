Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 540F351F1AB
	for <lists+linux-ide@lfdr.de>; Sun,  8 May 2022 22:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232305AbiEHUpo (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 8 May 2022 16:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbiEHUph (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 8 May 2022 16:45:37 -0400
Received: from mxout03.lancloud.ru (mxout03.lancloud.ru [45.84.86.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591E0AE6C
        for <linux-ide@vger.kernel.org>; Sun,  8 May 2022 13:41:43 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru CAEC520EBE75
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
Subject: [PATCH 0/3] Make PATA transfer mode masks always being 32-bit
Date:   Sun, 8 May 2022 23:41:36 +0300
Message-ID: <20220508204139.4961-1-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The PATA transfer mode masks (direct and packed) in libata are sometimes
declared as *unsigned int* and sometimes as *unsigned long* (which is a
64-bit type on 64-bit architectures), while the packed mask really only
uses 20 bits and the PIO/MWDMA/UDMA masks use up to 8 bits. Switching to
the uniform 32-bit masks saves siginificant amount of the object code...

Sergey Shtylyov (3):
  ata: make packed transfer mode masks *unsigned int*
  ata: make ata_device::{pio|mwdma|udma}_mask *unsigned int*
  ata: make ata_port_info::{pio|mwdma|udma}_mask *unsigned int*

 drivers/ata/libata-acpi.c      |  8 +++---
 drivers/ata/libata-core.c      | 38 +++++++++++++-------------
 drivers/ata/pata_acpi.c        |  2 +-
 drivers/ata/pata_ali.c         |  2 +-
 drivers/ata/pata_amd.c         | 14 +++++-----
 drivers/ata/pata_hpt366.c      |  2 +-
 drivers/ata/pata_hpt37x.c      |  6 ++---
 drivers/ata/pata_hpt3x2n.c     |  2 +-
 drivers/ata/pata_pdc2027x.c    |  4 +--
 drivers/ata/pata_serverworks.c |  4 +--
 drivers/ata/pata_sis.c         |  2 +-
 drivers/ata/pata_via.c         |  2 +-
 include/linux/libata.h         | 49 +++++++++++++++++-----------------
 13 files changed, 67 insertions(+), 68 deletions(-)

-- 
2.26.3

