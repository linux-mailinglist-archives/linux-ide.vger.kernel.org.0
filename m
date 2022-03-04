Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D15AC4CCAE1
	for <lists+linux-ide@lfdr.de>; Fri,  4 Mar 2022 01:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234473AbiCDAnv (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 3 Mar 2022 19:43:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232500AbiCDAnv (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 3 Mar 2022 19:43:51 -0500
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0210C49CA0
        for <linux-ide@vger.kernel.org>; Thu,  3 Mar 2022 16:43:01 -0800 (PST)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
        by 156.147.23.52 with ESMTP; 4 Mar 2022 09:42:59 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
        by 156.147.1.126 with ESMTP; 4 Mar 2022 09:42:59 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date:   Fri, 4 Mar 2022 09:42:37 +0900
From:   Byungchul Park <byungchul.park@lge.com>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     damien.lemoal@opensource.wdc.com, linux-ide@vger.kernel.org,
        adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org,
        torvalds@linux-foundation.org, mingo@redhat.com,
        linux-kernel@vger.kernel.org, peterz@infradead.org,
        will@kernel.org, tglx@linutronix.de, rostedt@goodmis.org,
        joel@joelfernandes.org, sashal@kernel.org, daniel.vetter@ffwll.ch,
        chris@chris-wilson.co.uk, duyuyang@gmail.com,
        johannes.berg@intel.com, tj@kernel.org, willy@infradead.org,
        david@fromorbit.com, amir73il@gmail.com, bfields@fieldses.org,
        gregkh@linuxfoundation.org, kernel-team@lge.com,
        linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
        minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com,
        sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
        penberg@kernel.org, rientjes@google.com, vbabka@suse.cz,
        ngupta@vflare.org, linux-block@vger.kernel.org,
        paolo.valente@linaro.org, josef@toxicpanda.com,
        linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk,
        jack@suse.cz, jack@suse.com, jlayton@kernel.org,
        dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org,
        dri-devel@lists.freedesktop.org, airlied@linux.ie,
        rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
        hamohammed.sa@gmail.com
Subject: Re: Report 2 in ext4 and journal based on v5.17-rc1
Message-ID: <20220304004237.GB6112@X58A-UD3R>
References: <YiAow5gi21zwUT54@mit.edu>
 <1646285013-3934-1-git-send-email-byungchul.park@lge.com>
 <YiDSabde88HJ/aTt@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiDSabde88HJ/aTt@mit.edu>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Thu, Mar 03, 2022 at 09:36:25AM -0500, Theodore Ts'o wrote:
> On Thu, Mar 03, 2022 at 02:23:33PM +0900, Byungchul Park wrote:
> > I totally agree with you. *They aren't really locks but it's just waits
> > and wakeups.* That's exactly why I decided to develop Dept. Dept is not
> > interested in locks unlike Lockdep, but fouces on waits and wakeup
> > sources itself. I think you get Dept wrong a lot. Please ask me more if
> > you have things you doubt about Dept.
> 
> So the question is this --- do you now understand why, even though
> there is a circular dependency, nothing gets stalled in the
> interactions between the two wait channels?

??? I'm afraid I don't get you.

All contexts waiting for any of the events in the circular dependency
chain will be definitely stuck if there is a circular dependency as I
explained. So we need another wakeup source to break the circle. In
ext4 code, you might have the wakeup source for breaking the circle.

What I agreed with is:

   The case that 1) the circular dependency is unevitable 2) there are
   another wakeup source for breadking the circle and 3) the duration
   in sleep is short enough, should be acceptable.

Sounds good?

Thanks,
Byungchul
