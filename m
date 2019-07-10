Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F14B63A74
	for <lists+linux-ide@lfdr.de>; Tue,  9 Jul 2019 20:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbfGISFQ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 9 Jul 2019 14:05:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:36536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727455AbfGISFQ (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 9 Jul 2019 14:05:16 -0400
Subject: Re: [GIT PULL] libata changes for 5.3-rc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562695515;
        bh=EHIkK3c8czgFLWumz3mFgk+I8hffhkW4OOQtrDs7jNM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=oGBxPm33dtpPjq8fhDLGrDpf2GvpNDOdxWdDXZ2RJunKKI+qJYp82RYG6XVeIXa4A
         b7EJCxNgNHEHubSnW7w2bhyii7j4UjWat3vtoRIN09LsVE+qkxtu4PZEsxedxa3Rbr
         Asb0ravcg4BJeiqD49hEmtDmsDgLQMbbwEbAC1cw=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ad0ffbb9-d38c-fc3a-1963-ed1bd12437db@kernel.dk>
References: <ad0ffbb9-d38c-fc3a-1963-ed1bd12437db@kernel.dk>
X-PR-Tracked-List-Id: <linux-block.vger.kernel.org>
X-PR-Tracked-Message-Id: <ad0ffbb9-d38c-fc3a-1963-ed1bd12437db@kernel.dk>
X-PR-Tracked-Remote: git://git.kernel.dk/linux-block.git
 tags/for-5.3/libata-20190708
X-PR-Tracked-Commit-Id: 120357ea176e420d313cf8cf2ff35fbe233d3bab
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cdc5ffc4100549654e19e6f068cf1fc0871a85c2
Message-Id: <156269551570.14383.1859456514082548713.pr-tracker-bot@kernel.org>
Date:   Tue, 09 Jul 2019 18:05:15 +0000
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        IDE/ATA development list <linux-ide@vger.kernel.org>
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The pull request you sent on Mon, 8 Jul 2019 15:23:50 -0600:

> git://git.kernel.dk/linux-block.git tags/for-5.3/libata-20190708

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cdc5ffc4100549654e19e6f068cf1fc0871a85c2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
