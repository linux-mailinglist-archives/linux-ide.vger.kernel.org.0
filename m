Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1E8771341
	for <lists+linux-ide@lfdr.de>; Sun,  6 Aug 2023 04:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbjHFCbI (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 5 Aug 2023 22:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjHFCbI (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 5 Aug 2023 22:31:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 731341FF6
        for <linux-ide@vger.kernel.org>; Sat,  5 Aug 2023 19:31:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1173560F94
        for <linux-ide@vger.kernel.org>; Sun,  6 Aug 2023 02:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7672AC433CC;
        Sun,  6 Aug 2023 02:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691289062;
        bh=bJ1JL0xFL1jr5c0yR5s2Juh8NTOlgbb3yoBnD2GxhxY=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=ma22du8ZVIPSXjZ7YSQSMM3/JtB4zr20DYKcyH5fcXcLy7Eu69wgxIRDPTapmBuQH
         B18b+MneT7+t7zlnmIBeInKvysZaGed05TdGCNJa0zbTebfSJJbh3dngbBDfyZQ1xn
         rBRImDxLa/zrQQo9M58IsIHB/pA3Q7xugY8KjXmbkz3/PxtdGUVsm9G1+Gk3Q1AqAn
         f9psUSdP2O7UqNxRhkkcbC0OYX4aWrjE4WENaeSUWQsxoyftbgYclm8R80f70nfte2
         JIiK1A6aOLNRoAfsBddZ7G+Ti9BGgsUZ3uuzc/1lZp5WZf3KQ42Jp8JVSYx3GcBieN
         6EkaGpwOg9ACQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 63474C3274D;
        Sun,  6 Aug 2023 02:31:02 +0000 (UTC)
Subject: Re: [GIT PULL] ata fixes for 6.5-rc5
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230806012901.250817-1-dlemoal@kernel.org>
References: <20230806012901.250817-1-dlemoal@kernel.org>
X-PR-Tracked-List-Id: <linux-ide.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230806012901.250817-1-dlemoal@kernel.org>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata tags/ata-6.5-rc5
X-PR-Tracked-Commit-Id: 0a8589055936d8feb56477123a8373ac634018fa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fb0d91991cedb51bc604c6b3915df75d8a59a4a3
Message-Id: <169128906240.10789.2132197209455437691.pr-tracker-bot@kernel.org>
Date:   Sun, 06 Aug 2023 02:31:02 +0000
To:     Damien Le Moal <dlemoal@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-ide@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The pull request you sent on Sun,  6 Aug 2023 10:29:01 +0900:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata tags/ata-6.5-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fb0d91991cedb51bc604c6b3915df75d8a59a4a3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
