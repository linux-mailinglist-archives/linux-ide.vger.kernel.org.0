Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC2A54EB9E
	for <lists+linux-ide@lfdr.de>; Thu, 16 Jun 2022 22:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbiFPUwG (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 16 Jun 2022 16:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbiFPUwF (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 16 Jun 2022 16:52:05 -0400
Received: from mxout03.lancloud.ru (mxout03.lancloud.ru [45.84.86.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B0055FF06
        for <linux-ide@vger.kernel.org>; Thu, 16 Jun 2022 13:52:00 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 17CC520EC994
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
Subject: [PATCH 0/2] Fix sloppy typing in the fast drain logic
Date:   Thu, 16 Jun 2022 23:51:47 +0300
Message-ID: <20220616205149.16157-1-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1902.lancloud.ru (fd00:f066::72)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Here are 2 patches against the 'for-next' branch of Damien Le Moal's
'libata.git' repo.
The libata's fast drain logic unfortunately boasts of some sloppy typing --
unify it by using *unsigned int* everyhere...

Sergey Shtylyov (2):
  ata: libata-eh: fix sloppy result type of ata_eh_nr_in_flight()
  ata: make ata_port::fastdrain_cnt *unsigned int*

 drivers/ata/libata-eh.c | 8 ++++----
 include/linux/libata.h  | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.26.3
