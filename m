Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 581143DBE21
	for <lists+linux-ide@lfdr.de>; Fri, 30 Jul 2021 20:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhG3SLb (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 30 Jul 2021 14:11:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:37078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230335AbhG3SLb (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Fri, 30 Jul 2021 14:11:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4BDDA60F4A;
        Fri, 30 Jul 2021 18:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627668686;
        bh=gwPoLg9qj597G2ZdJZmKuxS0BJsONv0reCKWIz83WmI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=rQ1gq8b/28QCh+Lve41/o+67ovcOyEnD1rWfdBukoe1tph2MUZyDoKLxw1GhsNxpF
         xQD0rkxNtQ7mydih6vdZFvi/7s1MEroKxnyEoNx9DZbFp+N2ANeTHNyRvUYpFXmoRi
         zBFf9Ny/zzcdnQZXGUgr9+1qC/Ps1EU4JNEz8/szWwRPDPiygbYKyRM1MpIRAQ3Ou/
         nwVE74x+yXb8dfR70+KoXFf1XnZi32dQEDznp2y17+2qeEEm5EXNuHZqWpdEW96Zqk
         0LJ04gGJeqmuKicc6nSBXcydURY0F3PkISGdIwODuM2bwWGY9nd448A76VTVI7Rm7X
         j3e/0CbNeca9g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 46CE9609E4;
        Fri, 30 Jul 2021 18:11:26 +0000 (UTC)
Subject: Re: [GIT PULL] libata updates for 5.14-rc
From:   pr-tracker-bot@kernel.org
In-Reply-To: <74d44c00-40df-9376-2c2f-37881547e8fa@kernel.dk>
References: <74d44c00-40df-9376-2c2f-37881547e8fa@kernel.dk>
X-PR-Tracked-List-Id: <linux-ide.vger.kernel.org>
X-PR-Tracked-Message-Id: <74d44c00-40df-9376-2c2f-37881547e8fa@kernel.dk>
X-PR-Tracked-Remote: git://git.kernel.dk/linux-block.git tags/libata-5.14-2021-07-30
X-PR-Tracked-Commit-Id: 094121ef815f29d9e6a01fafca365831454ce293
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f6c5971bb78ee5c4b9659f2764e58c175b75638c
Message-Id: <162766868628.11392.8494347579869785157.pr-tracker-bot@kernel.org>
Date:   Fri, 30 Jul 2021 18:11:26 +0000
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        ALWAYS copy <linux-ide@vger.kernel.org>
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The pull request you sent on Fri, 30 Jul 2021 08:58:38 -0600:

> git://git.kernel.dk/linux-block.git tags/libata-5.14-2021-07-30

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f6c5971bb78ee5c4b9659f2764e58c175b75638c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
