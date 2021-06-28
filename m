Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1873B682F
	for <lists+linux-ide@lfdr.de>; Mon, 28 Jun 2021 20:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234975AbhF1STt (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 28 Jun 2021 14:19:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:59528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234928AbhF1STs (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Mon, 28 Jun 2021 14:19:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9013D61C7D;
        Mon, 28 Jun 2021 18:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624904242;
        bh=7HHViUug75TF7deAlAQd07nJHZ4t4Qk52A/cIlvUC2k=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=L3ILJAfew7XireghSwWdahVDGlM7B/YlOwyFjATSC9VZdGriMmdC0NFRZwdlYYJgf
         TSAeoK7CCrIsILW+EgcwZLqtLuz8v4I53e447WsCMGXNs9pEwwzXFqyhJb+oFFbI/8
         qTF85+oY5fbcVC2Y2v9+dX4ftVcA5odEuyv9m2DUac8M7pvRanWY5E9DxSOc8l9lGm
         QvMrWe2gSf+fAf5VfBAFUHDsbP1vXPvhImXoSPsBzD+1B6mI1iTL4erPefZljX1RrT
         YGztNtPddvPy0Hdmixbq5boCx+NRObAShA+jg5qaWvNu3PbZTLQXCa7ob+L3jEkKQs
         G6WejQCZmnlmw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8949D60A3A;
        Mon, 28 Jun 2021 18:17:22 +0000 (UTC)
Subject: Re: [GIT PULL] libata changes for 5.14-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <6791b727-5820-b8a6-32de-2cd57cebecf6@kernel.dk>
References: <6791b727-5820-b8a6-32de-2cd57cebecf6@kernel.dk>
X-PR-Tracked-List-Id: <linux-ide.vger.kernel.org>
X-PR-Tracked-Message-Id: <6791b727-5820-b8a6-32de-2cd57cebecf6@kernel.dk>
X-PR-Tracked-Remote: git://git.kernel.dk/linux-block.git tags/for-5.14/libata-2021-06-27
X-PR-Tracked-Commit-Id: 1af11d098db18bfda5168dc407513726e1b1bdb3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 43bd8a67cd10e9526656e2bc160e52920bd9e43c
Message-Id: <162490424255.3852.4633078381215547198.pr-tracker-bot@kernel.org>
Date:   Mon, 28 Jun 2021 18:17:22 +0000
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-ide@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The pull request you sent on Sun, 27 Jun 2021 12:42:20 -0600:

> git://git.kernel.dk/linux-block.git tags/for-5.14/libata-2021-06-27

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/43bd8a67cd10e9526656e2bc160e52920bd9e43c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
