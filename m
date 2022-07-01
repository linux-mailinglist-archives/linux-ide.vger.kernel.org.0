Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDDAD5638D3
	for <lists+linux-ide@lfdr.de>; Fri,  1 Jul 2022 20:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbiGASCo (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 1 Jul 2022 14:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbiGASCl (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 1 Jul 2022 14:02:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC4242A03
        for <linux-ide@vger.kernel.org>; Fri,  1 Jul 2022 11:02:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CC463B83118
        for <linux-ide@vger.kernel.org>; Fri,  1 Jul 2022 18:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 771F3C3411E;
        Fri,  1 Jul 2022 18:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656698558;
        bh=mcVZxa/P6FD7h8biVyOHYJ2MF5c8gmOH3RXzW1YeKNI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=M0r/qCft+gssyC0fbDMy940rxFxXyGTpxamGWj6ku4w+71YUWPlhyNj/fBJU0qb1N
         DAzEk3BAYZIqd17d6Smg+thyj+o11qvQZDCHxU0sI10sld7IO1uRgRqK/ju7YkQ8ym
         jdB7kR2zd/saeoEBj4OMQz+hiKK/MUbJidM7xGVUfDP+TgFhRGEoSBlRboPgYb2Qhn
         gBn4YFR7ApfehJyWYEBEtHGDKUhoAwH8rwk+mAz6qR3v3FwSVlfcjtw5HiLN05Bjxo
         BEMXwFr/CQktZEeuCJ5s1J9RtMU/z+gsxdJYN66LUkpLQeAmFYHOGgxE4PqivFsowr
         eb3I9imTlQ5Qg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 64491E49BBC;
        Fri,  1 Jul 2022 18:02:38 +0000 (UTC)
Subject: Re: [GIT PULL] ata fixes for 5.19-rc5
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20220701004859.7645-1-damien.lemoal@opensource.wdc.com>
References: <20220701004859.7645-1-damien.lemoal@opensource.wdc.com>
X-PR-Tracked-List-Id: <linux-ide.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220701004859.7645-1-damien.lemoal@opensource.wdc.com>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata tags/ata-5.19-rc5
X-PR-Tracked-Commit-Id: 32788beb103f7f71e0192dce701f387070914651
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 690685ffcdcec3975f45eafe3dcf4bff29aa1676
Message-Id: <165669855840.14842.17515847012465830721.pr-tracker-bot@kernel.org>
Date:   Fri, 01 Jul 2022 18:02:38 +0000
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-ide@vger.kernel.org
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The pull request you sent on Fri,  1 Jul 2022 09:48:59 +0900:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata tags/ata-5.19-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/690685ffcdcec3975f45eafe3dcf4bff29aa1676

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
