Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 307B8734727
	for <lists+linux-ide@lfdr.de>; Sun, 18 Jun 2023 19:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjFRRBh (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 18 Jun 2023 13:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjFRRBe (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 18 Jun 2023 13:01:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D53130
        for <linux-ide@vger.kernel.org>; Sun, 18 Jun 2023 10:01:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9D722612A5
        for <linux-ide@vger.kernel.org>; Sun, 18 Jun 2023 17:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11EDBC433C8;
        Sun, 18 Jun 2023 17:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687107691;
        bh=Y2UtqSpk69xmyrhe5J61CUP5hIWMjrwK0nhV0QC7bGw=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=uX1Xy8Fzj0BTcVkELISC0O69oFr/DiDu2NxiNZs47tWTMVoDU6FrTM4Blt09Bgdt4
         s3fLdjgl7OiXFcq0IsNpRj7exXgEW94Iasqf2n3DuO5Isces9eI6apbsAnfWnlhSNs
         roXCoDKsAUXKWDq4mgimvV6zV9VFyrW8qtBXez4evCRWCw/3AH5Pbuu02ir8CDdPNF
         5uuqwBA+pUQovSwkLiTjGu+9dOhhMVggigJ61qUU/HcyDM6jH43PMmECAwpFFKvBzh
         smYP0Mn21oPuVQjcqyyz+QSm7NKM/UYLHSDqeBAPvkYV1mJrzJGv1guhqvdSB41LtS
         QsYYFOJJvSkcA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E453BE29F3A;
        Sun, 18 Jun 2023 17:01:30 +0000 (UTC)
Subject: Re: [GIT PULL] ata fixes for 6.4-rc7
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230618030506.293308-1-dlemoal@kernel.org>
References: <20230618030506.293308-1-dlemoal@kernel.org>
X-PR-Tracked-List-Id: <linux-ide.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230618030506.293308-1-dlemoal@kernel.org>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata tags/ata-6.4-rc7
X-PR-Tracked-Commit-Id: 6aa0365a3c8512587fffd42fe438768709ddef8e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ecbcffe3b7edc9a42b4e29ed8dafd56855ee675c
Message-Id: <168710769093.15251.7038203783273366415.pr-tracker-bot@kernel.org>
Date:   Sun, 18 Jun 2023 17:01:30 +0000
To:     Damien Le Moal <dlemoal@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-ide@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The pull request you sent on Sun, 18 Jun 2023 12:05:06 +0900:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata tags/ata-6.4-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ecbcffe3b7edc9a42b4e29ed8dafd56855ee675c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
