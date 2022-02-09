Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A86E4AFF5E
	for <lists+linux-ide@lfdr.de>; Wed,  9 Feb 2022 22:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233733AbiBIVqf (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 9 Feb 2022 16:46:35 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:58786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233627AbiBIVqe (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 9 Feb 2022 16:46:34 -0500
Received: from mxout01.lancloud.ru (mxout01.lancloud.ru [45.84.86.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00EDC03BFF4
        for <linux-ide@vger.kernel.org>; Wed,  9 Feb 2022 13:46:34 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 7CBB520AC538
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
Subject: [PATCH 0/3] Make all the devchk() functions return 'bool`
Date:   Thu, 10 Feb 2022 00:46:27 +0300
Message-ID: <20220209214630.13340-1-s.shtylyov@omp.ru>
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

Here are 3 patches against the 'for-next' branch of Damien Le Moal's
'libata.git' repo. Make all the devchk() functions return 'bool` inbstead
of 'unsigned int'.

Sergey Shtylyov (3):
  ata: libata-sff: make ata_devchk() return 'bool'
  ata: pata_samsung_cf: make pata_s3c_devchk() return 'bool'
  ata: sata_rcar: make sata_rcar_ata_devchk() return 'bool'

 drivers/ata/libata-sff.c      | 9 ++++++---
 drivers/ata/pata_samsung_cf.c | 7 +++----
 drivers/ata/sata_rcar.c       | 7 +++----
 3 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.26.3

