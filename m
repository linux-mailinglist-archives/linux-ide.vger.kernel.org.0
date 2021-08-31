Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B43843FC0BF
	for <lists+linux-ide@lfdr.de>; Tue, 31 Aug 2021 04:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239382AbhHaCP1 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 30 Aug 2021 22:15:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:47086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239376AbhHaCP0 (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Mon, 30 Aug 2021 22:15:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DCABE6102A;
        Tue, 31 Aug 2021 02:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630376071;
        bh=oYhaArV0NvZ1/JphVSkp7dvmvaOPD6avdfyRk3MW8V4=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=QX4v1cWQGJDdZDhHLpecA29AuLPFuwNaOowDI9Q2cJLZU3o4tyFdS1U8IMjfSJvt2
         SlEAQhEnDICulFMGVh3G5vvYBgo0RL/x/8prZlhfOjkY3y/1tRGZ8moRhytlv/3Ryu
         SZO7y0j9w4IaYDw0SFwITV3zO3wMQMbPCLpuPVl7PfVV05bTNf0D27VsU/NkF/P6fG
         Vz6QIAGuJhsZRyV21QH6YbWINvQd8TdWpl6lX2w9HsJZQT04JVtNF96e/HKhVM4wta
         RS+bjunL9lv7iH3hh8GMW5hUmZsqWkF8aspOlRuFlQb3G69wF8DkdXSDog1RmAi1DA
         ZKfqbl2OmPtGQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D824D60A6C;
        Tue, 31 Aug 2021 02:14:31 +0000 (UTC)
Subject: Re: [GIT PULL] libata changes for 5.15-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <25e33a98-25ad-1db1-98c8-ea74c0b3809e@kernel.dk>
References: <25e33a98-25ad-1db1-98c8-ea74c0b3809e@kernel.dk>
X-PR-Tracked-List-Id: <linux-ide.vger.kernel.org>
X-PR-Tracked-Message-Id: <25e33a98-25ad-1db1-98c8-ea74c0b3809e@kernel.dk>
X-PR-Tracked-Remote: git://git.kernel.dk/linux-block.git tags/for-5.15/libata-2021-08-30
X-PR-Tracked-Commit-Id: 62283c6c9d4c1018badcd0b9c5b6ca66d978fa0d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 44d7d3b0d1cdb2119dba33bbedd602ce30528d6c
Message-Id: <163037607187.28323.506646337651790342.pr-tracker-bot@kernel.org>
Date:   Tue, 31 Aug 2021 02:14:31 +0000
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        ALWAYS copy <linux-ide@vger.kernel.org>
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The pull request you sent on Mon, 30 Aug 2021 08:43:18 -0600:

> git://git.kernel.dk/linux-block.git tags/for-5.15/libata-2021-08-30

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/44d7d3b0d1cdb2119dba33bbedd602ce30528d6c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
