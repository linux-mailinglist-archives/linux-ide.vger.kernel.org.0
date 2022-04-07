Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A708F4F8519
	for <lists+linux-ide@lfdr.de>; Thu,  7 Apr 2022 18:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345778AbiDGQpJ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 7 Apr 2022 12:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245111AbiDGQpI (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 7 Apr 2022 12:45:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C141AC734
        for <linux-ide@vger.kernel.org>; Thu,  7 Apr 2022 09:43:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4783C60E09
        for <linux-ide@vger.kernel.org>; Thu,  7 Apr 2022 16:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A329FC385A4;
        Thu,  7 Apr 2022 16:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649349787;
        bh=udAWzOm7jgi9yJIZUcCpdA1zBQ1uWcBc7gmgm1N/RRM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=VNrcEWlGkCoPtctmYE0MO1ebDUIwHtRatpDSxtf7HGj8h6a/x8SuVqKb+Gv/pUbu0
         S6li8FIysjLspVhdvVG2gq3WVj0psLKYvjheW105XnH9Xt5YPqIzveYrPPZXR+w1NA
         NrwewqsR6ktMbpRN0mQG5ul8PdXHCBXfuZPTysc5fF/bk0dwX6kqVD8LWiw6DP+o/V
         4OYDWQcQpmK/nRhuJcRlctaGzqUCC5glWcvohbD+mZrCCi1OiXBBQi/irlmr3hpWDv
         mgC9/ocgWupdpB7n8dTIX4bazJkzdkXI02bC6g9z2fsH8H/OH+KCaQuCvwCvRT4WML
         BCAvaOsLi9kZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8F718E85BCB;
        Thu,  7 Apr 2022 16:43:07 +0000 (UTC)
Subject: Re: [GIT PULL] ata fixes for 5.18-rc2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20220407122856.1170057-1-damien.lemoal@opensource.wdc.com>
References: <20220407122856.1170057-1-damien.lemoal@opensource.wdc.com>
X-PR-Tracked-List-Id: <linux-ide.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220407122856.1170057-1-damien.lemoal@opensource.wdc.com>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata tags/ata-5.18-rc2
X-PR-Tracked-Commit-Id: 55b014159ee7af63770cd7f2b6fe926f6dd99335
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 640b5037da8edfaa98d102183ccfe3af5898f94b
Message-Id: <164934978758.4180.18384229983659080471.pr-tracker-bot@kernel.org>
Date:   Thu, 07 Apr 2022 16:43:07 +0000
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-ide@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The pull request you sent on Thu,  7 Apr 2022 21:28:56 +0900:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata tags/ata-5.18-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/640b5037da8edfaa98d102183ccfe3af5898f94b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
