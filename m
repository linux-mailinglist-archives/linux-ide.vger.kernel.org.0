Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3736B66ABE4
	for <lists+linux-ide@lfdr.de>; Sat, 14 Jan 2023 15:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjANORd (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 14 Jan 2023 09:17:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbjANORa (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 14 Jan 2023 09:17:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562A57EF6
        for <linux-ide@vger.kernel.org>; Sat, 14 Jan 2023 06:17:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E61A260B4B
        for <linux-ide@vger.kernel.org>; Sat, 14 Jan 2023 14:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56DCCC433EF;
        Sat, 14 Jan 2023 14:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673705849;
        bh=DAJjVdegFm+44RLdiFuEzgYuxHA3icbcuo/Orb0mnbc=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=HDRshA2QhdYVNgF5EaqsjQrVBUJ94hvkX09bx+m9Td4O+Bhp3vdbgTjfvc81Q1/eq
         Vb/QxgarIBZcHSophx1uDj7EMNTgsw5X/AYs/RdsV7jaVsSniKassTo2v0dxKODehJ
         IVEeo+vTzD1bEPdoXcYezLc8y5fNirsRAaeJLaLDp8fn1NJ0SmthiXjSuEV4k7iKC/
         WKJ//uwKaKLRNi/Hk9sZXvQHvHFkcsHvxLBGJDpg6oKtgLsyGt/BQhSKIvZuAhHPsi
         m4OOMVy6GjVQxyy2KOo2q5a+9Y7RcpXnere6+N/Ut4ImOXuRcR/Fmih9JFf4js13iD
         uNZ0QFj22BIaQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 44D2BC395CA;
        Sat, 14 Jan 2023 14:17:29 +0000 (UTC)
Subject: Re: [GIT PULL] ata fixes for 6.2-rc4
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230113232255.487691-1-damien.lemoal@opensource.wdc.com>
References: <20230113232255.487691-1-damien.lemoal@opensource.wdc.com>
X-PR-Tracked-List-Id: <linux-ide.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230113232255.487691-1-damien.lemoal@opensource.wdc.com>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata tags/ata-6.2-rc4
X-PR-Tracked-Commit-Id: 22eebaa631c40f3dac169ba781e0de471b83bf45
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 34cbf89afc866df36d6b9177e4f99160a4823382
Message-Id: <167370584927.24149.6369999256825164988.pr-tracker-bot@kernel.org>
Date:   Sat, 14 Jan 2023 14:17:29 +0000
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-ide@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The pull request you sent on Sat, 14 Jan 2023 08:22:55 +0900:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata tags/ata-6.2-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/34cbf89afc866df36d6b9177e4f99160a4823382

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
