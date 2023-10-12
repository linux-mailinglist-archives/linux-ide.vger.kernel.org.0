Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F95D7C6637
	for <lists+linux-ide@lfdr.de>; Thu, 12 Oct 2023 09:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347095AbjJLHSG (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 12 Oct 2023 03:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347096AbjJLHSF (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 12 Oct 2023 03:18:05 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA84C0
        for <linux-ide@vger.kernel.org>; Thu, 12 Oct 2023 00:18:02 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07872C433C8;
        Thu, 12 Oct 2023 07:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697095082;
        bh=Db17adVfC3SM75AQgGJMoQoWjRkJ73u65gmSOcf+FNA=;
        h=From:To:Cc:Subject:Date:From;
        b=gMbmoufNvKueG/uhhMNbcJ1yLQFgY9ODXM/sUxINwqEQlyedLBdhD6w40P4j7WEPw
         2ahDcIYU9Xu1ZTFIjmifMHReOcedkfNk40qLSVqNBbJiOZxRo3CXVAx8CC9wtwynfa
         KwKkUfqn73iuGssovyjBrb18rlKjrfQySnXUUp+9hkmEkRSIw1Ubiyd6pZCUFmPNIn
         MMu7515o5Td45VT75HZwfwtdhTsJDwZVs+7L/X8KxKj5bzGZTH2FiNYYVt8/+rA/Ms
         pQkvmzDvS3lPptKZRdtdIT/IrkcV31ng944waqlq9OCY9mgqk2gHam9RBxi1Qt4miu
         WP8ej5IPpML9A==
From:   Damien Le Moal <dlemoal@kernel.org>
To:     linux-ide@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Phillip Susi <phill@thesusis.net>
Subject: [PATCH 0/2] Improve drive spinup on resume
Date:   Thu, 12 Oct 2023 16:17:58 +0900
Message-ID: <20231012071800.468868-1-dlemoal@kernel.org>
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

Two patches to improve disk spinup on resume:
 - Patch 1: Move the spinup operation to after the drive revalidation to
   ensure that the VERIFY command is executed with the link speed
   properly setup.
 - Patch 2: Attempt to spinup the drive only if it is not already spun
   up.

Geert,

It would be great if you could test this with your RCAR setup. I ran
this on my usual machines and qemu. All good. But your setup has been
useful to flush out issues before :)
Thanks !

Damien Le Moal (2):
  ata: libata-eh: Spinup disk on resume after revalidation
  ata: libata-core: Improve ata_dev_power_set_active()

 drivers/ata/libata-core.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/ata/libata-eh.c   | 20 +++++++++++---------
 2 files changed, 45 insertions(+), 9 deletions(-)

-- 
2.41.0

