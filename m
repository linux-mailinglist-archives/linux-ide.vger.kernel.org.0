Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98B3B4B7F98
	for <lists+linux-ide@lfdr.de>; Wed, 16 Feb 2022 05:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344499AbiBPEm4 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 15 Feb 2022 23:42:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344491AbiBPEmp (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 15 Feb 2022 23:42:45 -0500
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 667CCF406B
        for <linux-ide@vger.kernel.org>; Tue, 15 Feb 2022 20:42:32 -0800 (PST)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
        by 156.147.23.53 with ESMTP; 16 Feb 2022 13:12:31 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
        by 156.147.1.125 with ESMTP; 16 Feb 2022 13:12:31 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From:   Byungchul Park <byungchul.park@lge.com>
To:     damien.lemoal@opensource.wdc.com, linux-ide@vger.kernel.org
Cc:     torvalds@linux-foundation.org, mingo@redhat.com,
        linux-kernel@vger.kernel.org, peterz@infradead.org,
        will@kernel.org, tglx@linutronix.de, rostedt@goodmis.org,
        joel@joelfernandes.org, sashal@kernel.org, daniel.vetter@ffwll.ch,
        chris@chris-wilson.co.uk, duyuyang@gmail.com,
        johannes.berg@intel.com, tj@kernel.org, tytso@mit.edu,
        willy@infradead.org, david@fromorbit.com, amir73il@gmail.com,
        bfields@fieldses.org, gregkh@linuxfoundation.org,
        kernel-team@lge.com, linux-mm@kvack.org, akpm@linux-foundation.org,
        mhocko@kernel.org, minchan@kernel.org, hannes@cmpxchg.org,
        vdavydov.dev@gmail.com, sj@kernel.org, jglisse@redhat.com,
        dennis@kernel.org, cl@linux.com, penberg@kernel.org,
        rientjes@google.com, vbabka@suse.cz, ngupta@vflare.org,
        linux-block@vger.kernel.org, axboe@kernel.dk,
        paolo.valente@linaro.org, josef@toxicpanda.com,
        linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk,
        jack@suse.cz, jlayton@kernel.org, dan.j.williams@intel.com,
        hch@infradead.org, djwong@kernel.org,
        dri-devel@lists.freedesktop.org, airlied@linux.ie,
        rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
        hamohammed.sa@gmail.com
Subject: [REPORT] libata deadlock possibilities by DEPT
Date:   Wed, 16 Feb 2022 13:12:27 +0900
Message-Id: <1644984747-26706-1-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi Damien and libata folks,

I've been developing a tool for detecting deadlock possibilities by
tracking wait/event rather than lock(?) acquisition order to try to
cover all synchonization machanisms. It's done on v5.17-rc1 tag.

https://github.com/lgebyungchulpark/linux-dept/commits/dept1.11_on_v5.17-rc1

Benifit:

	0. Works with all lock primitives.
	1. Works with wait_for_completion()/complete().
	2. Works with 'wait' on PG_locked.
	3. Works with 'wait' on PG_writeback.
	4. Works with swait/wakeup.
	5. Works with waitqueue.
	6. Multiple reports are allowed.
	7. Deduplication control on multiple reports.
	8. Withstand false positives thanks to 6.
	9. Easy to tag any wait/event.

Future work:

	0. To make it more stable.
	1. To separates Dept from Lockdep.
	2. To improves performance in terms of time and space.
	3. To use Dept as a dependency engine for Lockdep.
	4. To add any missing tags of wait/event in the kernel.
	5. To deduplicate stack trace.

I've got several reports from the tool. Some of them look like false
alarms caused by Lockdep's fake annotations added for better detection.
However, some others look like real deadlock possibility. Because of my
unfamiliarity of the domain, it's hard to confirm if it's a real one.
I'd like to ask for your opinion on it and it'd be appreciated.

How to interpret the report is:

	1. E(event) in each context cannot be triggered because of the
	   W(wait) that cannot be woken.
	2. The stack trace helping find the problematic code is located
	   in each conext's detail.

Let me add the reports on this email thread.

---
Thanks,
Byungchul

