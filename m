Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7376702058
	for <lists+linux-ide@lfdr.de>; Mon, 15 May 2023 00:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbjENWBX (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 14 May 2023 18:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjENWBW (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 14 May 2023 18:01:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E571B1
        for <linux-ide@vger.kernel.org>; Sun, 14 May 2023 15:01:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F290560F7D
        for <linux-ide@vger.kernel.org>; Sun, 14 May 2023 22:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6568C433EF;
        Sun, 14 May 2023 22:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684101680;
        bh=7TgvFSw6P+8V8/aVIG2jFpJY1U22FTPyXuEuCH8hHPE=;
        h=From:To:Cc:Subject:Date:From;
        b=lC6YTeM9lq49ioyTRQO9Z0OinM+dv4NNxWwV6+94S12LejpoNPcqlgeiOaOyR5GtA
         hJUDuudMZzt2IVQvGaVJCwzFU6fViQlLiMysOKRGLxucAH79viHm76Fi2QjJ3ygsJw
         TlpUoyJJUb85c0ZbX8fh1E8qxSWy8plGuKocvfUrhEb01p6bxx9MY215Glc5WJTvwx
         2whGl49jgBHetKu53N3RgBM1ypWgcllNcM9ej1oXsX1d/UsBzWXqYbBDRoIQYli9VS
         ManSpTGu25vEnruMJcpOsWUIfXcOxMFA53LpbF3g+T/4SIKelKm1XHBQVDzg//Szza
         jWeH+kl3ZIysw==
From:   Damien Le Moal <dlemoal@kernel.org>
To:     linux-ide@vger.kernel.org, Ondrej Zary <linux@zary.sk>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH 0/2] Cleanup pata_parport code
Date:   Mon, 15 May 2023 07:01:16 +0900
Message-Id: <20230514220118.114385-1-dlemoal@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

A couple of patches to fix code indentation and style in the bpck and
frpw protocol modules to suppress smatch warnings.

Damien Le Moal (2):
  ata: pata_parport: Fix bpck module code indentation and style
  ata: pata_parport: Fix frpw module code indentation and style

 drivers/ata/pata_parport/bpck.c | 446 ++++++++++++++++++--------------
 drivers/ata/pata_parport/frpw.c | 310 +++++++++++-----------
 2 files changed, 418 insertions(+), 338 deletions(-)

-- 
2.40.1

