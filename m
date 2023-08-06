Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29642771326
	for <lists+linux-ide@lfdr.de>; Sun,  6 Aug 2023 03:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjHFB3G (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 5 Aug 2023 21:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjHFB3F (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 5 Aug 2023 21:29:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D3F19AC
        for <linux-ide@vger.kernel.org>; Sat,  5 Aug 2023 18:29:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 810C960F55
        for <linux-ide@vger.kernel.org>; Sun,  6 Aug 2023 01:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0E0C433C7;
        Sun,  6 Aug 2023 01:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691285342;
        bh=ijPC0/7Ga9J3WSKn15DTBSx7l8yOXo+0Dia7o9QRxFE=;
        h=From:To:Subject:Date:From;
        b=jPILOAUYbQBjjxGgcjmgFSafUd9BUKYJ+yCw0lL4+YafA1OJeCz+h0+Z6t///VgGY
         SQpeJ4tCn400p5eVaxq2wGaHJpHKhsFXtb4WRLEarMPjUADMtZKRHH+g+x8JMeZ19k
         GbJasFhjUNGMZeVzXQu9vQttkMPhkIE0N+TH79naPIzw+cN5mpGrWqySqitKPyCTRt
         hAdyXBxa5uLuV48NiKv6vPN0t3ZSMl1ruSntQgJ90959DhIsV3qP77FrWembYGb37B
         dHmZf6hUXckbnp37jGIGEvMXbECy5G9lkx+s1EdzhaMN7AH2p9Wyc6yNH67dvdT2MJ
         MDSILwR9BieXQ==
From:   Damien Le Moal <dlemoal@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-ide@vger.kernel.org
Subject: [GIT PULL] ata fixes for 6.5-rc5
Date:   Sun,  6 Aug 2023 10:29:01 +0900
Message-ID: <20230806012901.250817-1-dlemoal@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Linus,

The following changes since commit 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4:

  Linux 6.5-rc4 (2023-07-30 13:23:47 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata tags/ata-6.5-rc5

for you to fetch changes up to 0a8589055936d8feb56477123a8373ac634018fa:

  ata,scsi: do not issue START STOP UNIT on resume (2023-08-02 17:01:12 +0900)

----------------------------------------------------------------
ata fixes for 6.5-rc5

 - Prevent the scsi disk driver from issuing a START STOP UNIT command
   for ATA devices during system resume as this causes various issues
   reported by multiple users.

----------------------------------------------------------------
Damien Le Moal (1):
      ata,scsi: do not issue START STOP UNIT on resume

 drivers/ata/libata-scsi.c  | 7 +++++++
 drivers/scsi/sd.c          | 9 ++++++---
 include/scsi/scsi_device.h | 1 +
 3 files changed, 14 insertions(+), 3 deletions(-)
