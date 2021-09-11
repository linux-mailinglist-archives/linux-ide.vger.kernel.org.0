Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFAE54079E7
	for <lists+linux-ide@lfdr.de>; Sat, 11 Sep 2021 19:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbhIKRbg (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 11 Sep 2021 13:31:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:49922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233294AbhIKRbc (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Sat, 11 Sep 2021 13:31:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 710DD61208;
        Sat, 11 Sep 2021 17:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631381419;
        bh=g71RbikB46BXC8/ScumWtmVpiZ8EB7qpYmxzFrHj6ls=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=XQdF3QypikNefXbPxOiZSCmBhQO+ei1PTOdYviXko0/6lfHaEGGLikn3Ww0kmdGfb
         y8B0j5GpEAIKXYr3CZdnr85SVtzqlV6N0of2eEKo/LyB7TzloOvd/zrdCkzj1BgEtj
         3ZfuZ4ql6yK1WhnF4uPuxcbQgk+GU0DYm9F19M0l/TA1KBk8wRx8cUCFFlRTzvtC/9
         JRl6LvioBRJ7xjCFdeKbqaCix15n6F4eWahrWrk0iEu1EZ6/6OJm6GGOeMFkM8Jqvu
         6OZdqy2K9gmJ/KlVZTkTbwajmTKbbiBRB/9yeCNDYBifmw9GQ/prPt75FxyUbKG4OC
         vF+Qx3vNI9SDw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6C86F600E8;
        Sat, 11 Sep 2021 17:30:19 +0000 (UTC)
Subject: Re: [GIT PULL] libata maintainers update
From:   pr-tracker-bot@kernel.org
In-Reply-To: <539469f5-f812-ec9a-2204-1591fff283f1@kernel.dk>
References: <539469f5-f812-ec9a-2204-1591fff283f1@kernel.dk>
X-PR-Tracked-List-Id: <linux-ide.vger.kernel.org>
X-PR-Tracked-Message-Id: <539469f5-f812-ec9a-2204-1591fff283f1@kernel.dk>
X-PR-Tracked-Remote: git://git.kernel.dk/linux-block.git tags/libata-5.15-2021-09-11
X-PR-Tracked-Commit-Id: 5ac749a57e0ebb334b1b2c3d28d4d5b1ef85f8ed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8177a5c96229ff24da1e362789e359b68b4f34f5
Message-Id: <163138141943.31565.2753184269349444027.pr-tracker-bot@kernel.org>
Date:   Sat, 11 Sep 2021 17:30:19 +0000
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        ALWAYS copy <linux-ide@vger.kernel.org>
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The pull request you sent on Sat, 11 Sep 2021 08:14:28 -0600:

> git://git.kernel.dk/linux-block.git tags/libata-5.15-2021-09-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8177a5c96229ff24da1e362789e359b68b4f34f5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
