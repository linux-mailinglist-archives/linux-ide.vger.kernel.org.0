Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C55578639D
	for <lists+linux-ide@lfdr.de>; Thu, 24 Aug 2023 00:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236151AbjHWWwx (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 23 Aug 2023 18:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238851AbjHWWwi (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 23 Aug 2023 18:52:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6AC1AD
        for <linux-ide@vger.kernel.org>; Wed, 23 Aug 2023 15:52:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DE505639F3
        for <linux-ide@vger.kernel.org>; Wed, 23 Aug 2023 22:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71475C433C8;
        Wed, 23 Aug 2023 22:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692831156;
        bh=AeKvyONfWzkOqRCnUm3QYz6X7XhML7H+OhaIDY8pJ/Y=;
        h=From:To:Cc:Subject:Date:From;
        b=uZguXIkQTSd98UrmV6dAcAmsP8UBxewb8wiF958DygKVHPQCEJZVLRALKlK1i7oU0
         7pVv9vMHNLemKPX+eJxyG/J7tMA17HK2vWSKuoYFzY0C2axyV4bLgd9YJQtoPusRNt
         VfQSBD9KD9EYfOIfGMlEIimvjz13z7kS7IzUA7uP6WeUl86bqrYgwQy3noMN5O166g
         Nik5hMR49syVfXOxsLKaURO0Np3JsTr7HBxVF0K23FZd37vJPfbvGlGJs2Tji8eJsD
         z4GFyeln+piIB0IAxlkgb1KChF6SGuVMT8Ps4ErVEDY7JNsrC2EAj78Q+aMoNPlETm
         +YPKNybgKjSaw==
From:   Damien Le Moal <dlemoal@kernel.org>
To:     linux-ide@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH 0/2] Fix compilation warnings
Date:   Thu, 24 Aug 2023 07:52:31 +0900
Message-ID: <20230823225234.36354-1-dlemoal@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Add missing MODULE_DESCRIPTION to avoid warnings when compiling
with W=1.

Damien Le Moal (2):
  ata: pata_ftide010: Add missing MODULE_DESCRIPTION
  ata: sata_gemini: Add missing MODULE_DESCRIPTION

 drivers/ata/pata_ftide010.c | 1 +
 drivers/ata/sata_gemini.c   | 1 +
 2 files changed, 2 insertions(+)

-- 
2.41.0

