Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 748D84AAC7F
	for <lists+linux-ide@lfdr.de>; Sat,  5 Feb 2022 21:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381288AbiBEUei (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 5 Feb 2022 15:34:38 -0500
Received: from mxout04.lancloud.ru ([45.84.86.114]:39676 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232428AbiBEUeh (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 5 Feb 2022 15:34:37 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru E63AE20AACB3
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>
Subject: [PATCH v4 0/3] Use *switch*es instead of *if*s in the Artop PATA driver
Date:   Sat, 5 Feb 2022 23:34:31 +0300
Message-ID: <20220205203434.15339-1-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Here are 3 patches against the 'for-next' branch of Damien Le Moal's
'libata.git' repo. The driver abuses the strings of the *if* statements
where a *switch* statements would fit better...

Sergey Shtylyov (3):
  pata_artop: eliminate local variable in artop_init_one()
  pata_artop: use *switch* in artop_init_one()
  pata_artop: use *switch* in atp8xx_fixup()

 drivers/ata/pata_artop.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

-- 
2.26.3

