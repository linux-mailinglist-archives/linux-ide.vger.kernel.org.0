Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0588F5279F8
	for <lists+linux-ide@lfdr.de>; Sun, 15 May 2022 22:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbiEOUlk (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 15 May 2022 16:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbiEOUlf (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 15 May 2022 16:41:35 -0400
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415751ADA9
        for <linux-ide@vger.kernel.org>; Sun, 15 May 2022 13:41:31 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru D6AB920A4D51
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
Subject: [PATCH 0/4] Unify PCI clock detection in the HPT37x/HPT3x2N drivers
Date:   Sun, 15 May 2022 23:41:22 +0300
Message-ID: <20220515204126.4866-1-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Here are 4 patches against the 'for-next' branch of Damien Le Moal's
'libata.git' repo.
The PCI clock frequency detection code in the HighPoint HPT37x/HPT3x2N drivers
has needlessly diverged, so trying to unify it...

Sergey Shtylyov (4):
  ata: pata_hpt37x: move claculating PCI clock from hpt37x_clock_slot()
  ata: pata_hpt37x: factor out hpt37x_pci_clock()
  ata: pata_hpt37x: merge hpt374_read_freq() to hpt37x_pci_clock()
  ata: pata_hpt3x2n: pass base DPLL frequency to hpt3x2n_pci_clock()

 drivers/ata/pata_hpt37x.c  | 113 +++++++++++++++++++------------------
 drivers/ata/pata_hpt3x2n.c |  19 ++++---
 2 files changed, 70 insertions(+), 62 deletions(-)

-- 
2.26.3

