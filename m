Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 018EC4DA854
	for <lists+linux-ide@lfdr.de>; Wed, 16 Mar 2022 03:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353158AbiCPC3Q (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 15 Mar 2022 22:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353149AbiCPC2g (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 15 Mar 2022 22:28:36 -0400
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 583763B29F
        for <linux-ide@vger.kernel.org>; Tue, 15 Mar 2022 19:27:14 -0700 (PDT)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
        by 156.147.23.51 with ESMTP; 16 Mar 2022 11:27:12 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
        by 156.147.1.151 with ESMTP; 16 Mar 2022 11:27:12 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From:   Byungchul Park <byungchul.park@lge.com>
To:     torvalds@linux-foundation.org
Cc:     damien.lemoal@opensource.wdc.com, linux-ide@vger.kernel.org,
        adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org,
        mingo@redhat.com, linux-kernel@vger.kernel.org,
        peterz@infradead.org, will@kernel.org, tglx@linutronix.de,
        rostedt@goodmis.org, joel@joelfernandes.org, sashal@kernel.org,
        daniel.vetter@ffwll.ch, chris@chris-wilson.co.uk,
        duyuyang@gmail.com, johannes.berg@intel.com, tj@kernel.org,
        tytso@mit.edu, willy@infradead.org, david@fromorbit.com,
        amir73il@gmail.com, bfields@fieldses.org,
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
Subject: [PATCH RFC v5 20/21] dept: Disable Dept on struct crypto_larval's completion for now
Date:   Wed, 16 Mar 2022 11:26:32 +0900
Message-Id: <1647397593-16747-21-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1647397593-16747-1-git-send-email-byungchul.park@lge.com>
References: <1647397593-16747-1-git-send-email-byungchul.park@lge.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

struct crypto_larval's completion is used for multiple purposes e.g.
waiting for test to complete or waiting for probe to complete.

The completion variable needs to be split according to what it's used
for. Otherwise, Dept cannot distinguish one from another and doesn't
work properly. Now that it isn't, disable Dept on it.

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 crypto/api.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/crypto/api.c b/crypto/api.c
index 7ddfe94..97ed1d7 100644
--- a/crypto/api.c
+++ b/crypto/api.c
@@ -115,7 +115,12 @@ struct crypto_larval *crypto_larval_alloc(const char *name, u32 type, u32 mask)
 	larval->alg.cra_destroy = crypto_larval_destroy;
 
 	strlcpy(larval->alg.cra_name, name, CRYPTO_MAX_ALG_NAME);
-	init_completion(&larval->completion);
+	/*
+	 * TODO: Split ->completion according to what it's used for e.g.
+	 * ->test_completion, ->probe_completion and the like, so that
+	 *  Dept can track its dependency properly.
+	 */
+	init_completion_nocheck(&larval->completion);
 
 	return larval;
 }
-- 
1.9.1

