Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B292320D19
	for <lists+linux-ide@lfdr.de>; Sun, 21 Feb 2021 20:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhBUTPg (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 21 Feb 2021 14:15:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:34090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230107AbhBUTPd (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Sun, 21 Feb 2021 14:15:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id CBF4D64DD3;
        Sun, 21 Feb 2021 19:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613934892;
        bh=GvaimUz6cl6aRKpyFLmS9o66v96sR+pdhEfHPpi5tGE=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=daDTGF8vf3bUofA7zyjwGcK8Ty3C26sBqjwGgqcvuiglW5WQkiNNm8n9cost5ZzqY
         OfO1P8OMea2KRQB+QKy9dR8fFRiHWcpYGNks29cLyzSGrP8qPFnjcEfbMCu7AL/hBh
         Dwp/IyMlx/roMbDnWZ0mJKCGxHyeE8LOzDx6fIQBRLoeqv3Jgop4bHkzhLoI/FgsD4
         qW0xh/RPTrqgJc8pBAw5LaLKhFo8OnP/c0KGs+EG8N+atMRSXl3U3Bwz2lNXIFSuLl
         eGm9Vnmqg26k1fEISuc7nhJxsoIDK0FT7Dl17jdntKH0lMnZdtghzlvq3xfQDdjetU
         giJmT7rVjFu5A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C716660967;
        Sun, 21 Feb 2021 19:14:52 +0000 (UTC)
Subject: Re: [GIT PULL] libata changes for 5.12-rc
From:   pr-tracker-bot@kernel.org
In-Reply-To: <91a99b47-409c-024c-8e50-ce64fa662aad@kernel.dk>
References: <91a99b47-409c-024c-8e50-ce64fa662aad@kernel.dk>
X-PR-Tracked-List-Id: <linux-ide.vger.kernel.org>
X-PR-Tracked-Message-Id: <91a99b47-409c-024c-8e50-ce64fa662aad@kernel.dk>
X-PR-Tracked-Remote: git://git.kernel.dk/linux-block.git tags/for-5.12/libata-2021-02-17
X-PR-Tracked-Commit-Id: e53d76e61ec0dbd52cf784993fde927cb9fe0fed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bd018bbaa58640da786d4289563e71c5ef3938c7
Message-Id: <161393489280.9182.6175401189283934253.pr-tracker-bot@kernel.org>
Date:   Sun, 21 Feb 2021 19:14:52 +0000
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        IDE/ATA development list <linux-ide@vger.kernel.org>
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The pull request you sent on Wed, 17 Feb 2021 15:28:04 -0700:

> git://git.kernel.dk/linux-block.git tags/for-5.12/libata-2021-02-17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bd018bbaa58640da786d4289563e71c5ef3938c7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
