Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5B9C519AA5
	for <lists+linux-ide@lfdr.de>; Wed,  4 May 2022 10:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347230AbiEDIym (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 4 May 2022 04:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346716AbiEDIxY (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 4 May 2022 04:53:24 -0400
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 983CE2529B
        for <linux-ide@vger.kernel.org>; Wed,  4 May 2022 01:49:21 -0700 (PDT)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
        by 156.147.23.53 with ESMTP; 4 May 2022 17:19:20 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
        by 156.147.1.125 with ESMTP; 4 May 2022 17:19:20 +0900
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
        hamohammed.sa@gmail.com, 42.hyeyoo@gmail.com
Subject: [PATCH RFC v6 10/21] dept: Introduce split map concept and new APIs for them
Date:   Wed,  4 May 2022 17:17:38 +0900
Message-Id: <1651652269-15342-11-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
References: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

There is a case where total maps for its wait/event is so large in size.
For instance, struct page for PG_locked and PG_writeback is the case.
The additional memory size for the maps would be 'the # of pages *
sizeof(struct dept_map)' if each struct page keeps its map all the way,
which might be too big to accept in some systems.

It'd better have split map. One is for each instance and the other is
for what is commonly used. So split map and added new APIs for them.

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 include/linux/dept.h     |  78 ++++++++++++++++++-------
 kernel/dependency/dept.c | 146 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 203 insertions(+), 21 deletions(-)

diff --git a/include/linux/dept.h b/include/linux/dept.h
index c498060..9698134 100644
--- a/include/linux/dept.h
+++ b/include/linux/dept.h
@@ -367,6 +367,30 @@ struct dept_map {
 	.nocheck = false,						\
 }
 
+struct dept_map_each {
+	/*
+	 * wait timestamp associated to this map
+	 */
+	unsigned int wgen;
+};
+
+struct dept_map_common {
+	const char *name;
+	struct dept_key *keys;
+	int sub_usr;
+
+	/*
+	 * It's local copy for fast acces to the associated classes. And
+	 * Also used for dept_key instance for statically defined map.
+	 */
+	struct dept_key keys_local;
+
+	/*
+	 * whether this map should be going to be checked or not
+	 */
+	bool nocheck;
+};
+
 struct dept_task {
 	/*
 	 * all event contexts that have entered and before exiting
@@ -468,6 +492,11 @@ struct dept_task {
 extern void dept_ask_event(struct dept_map *m);
 extern void dept_event(struct dept_map *m, unsigned long e_f, unsigned long ip, const char *e_fn);
 extern void dept_ecxt_exit(struct dept_map *m, unsigned long e_f, unsigned long ip);
+extern void dept_split_map_each_init(struct dept_map_each *me);
+extern void dept_split_map_common_init(struct dept_map_common *mc, struct dept_key *k, const char *n);
+extern void dept_wait_split_map(struct dept_map_each *me, struct dept_map_common *mc, unsigned long ip, const char *w_fn, int ne);
+extern void dept_event_split_map(struct dept_map_each *me, struct dept_map_common *mc, unsigned long ip, const char *e_fn);
+extern void dept_ask_event_split_map(struct dept_map_each *me, struct dept_map_common *mc);
 
 static inline void dept_ecxt_enter_nokeep(struct dept_map *m)
 {
@@ -490,32 +519,39 @@ static inline void dept_ecxt_enter_nokeep(struct dept_map *m)
 #else /* !CONFIG_DEPT */
 struct dept_key  { };
 struct dept_map  { };
+struct dept_map_each    { };
+struct dept_map_commmon { };
 struct dept_task { };
 
 #define DEPT_MAP_INITIALIZER(n) { }
 #define DEPT_TASK_INITIALIZER(t) { }
 
-#define dept_on()				do { } while (0)
-#define dept_off()				do { } while (0)
-#define dept_init()				do { } while (0)
-#define dept_task_init(t)			do { } while (0)
-#define dept_task_exit(t)			do { } while (0)
-#define dept_free_range(s, sz)			do { } while (0)
-#define dept_map_init(m, k, s, n)		do { (void)(n); (void)(k); } while (0)
-#define dept_map_reinit(m)			do { } while (0)
-#define dept_map_nocheck(m)			do { } while (0)
-
-#define dept_wait(m, w_f, ip, w_fn, ne)		do { (void)(w_fn); } while (0)
-#define dept_stage_wait(m, w_f, w_fn, ne)	do { (void)(w_fn); } while (0)
-#define dept_ask_event_wait_commit(ip)		do { } while (0)
-#define dept_clean_stage()			do { } while (0)
-#define dept_ecxt_enter(m, e_f, ip, c_fn, e_fn, ne) do { (void)(c_fn); (void)(e_fn); } while (0)
-#define dept_ask_event(m)			do { } while (0)
-#define dept_event(m, e_f, ip, e_fn)		do { (void)(e_fn); } while (0)
-#define dept_ecxt_exit(m, e_f, ip)		do { } while (0)
-#define dept_ecxt_enter_nokeep(m)		do { } while (0)
-#define dept_key_init(k)			do { (void)(k); } while (0)
-#define dept_key_destroy(k)			do { (void)(k); } while (0)
+#define dept_on()					do { } while (0)
+#define dept_off()					do { } while (0)
+#define dept_init()					do { } while (0)
+#define dept_task_init(t)				do { } while (0)
+#define dept_task_exit(t)				do { } while (0)
+#define dept_free_range(s, sz)				do { } while (0)
+#define dept_map_init(m, k, s, n)			do { (void)(n); (void)(k); } while (0)
+#define dept_map_reinit(m)				do { } while (0)
+#define dept_map_nocheck(m)				do { } while (0)
+
+#define dept_wait(m, w_f, ip, w_fn, ne)			do { (void)(w_fn); } while (0)
+#define dept_stage_wait(m, w_f, w_fn, ne)		do { (void)(w_fn); } while (0)
+#define dept_ask_event_wait_commit(ip)			do { } while (0)
+#define dept_clean_stage()				do { } while (0)
+#define dept_ecxt_enter(m, e_f, ip, c_fn, e_fn, ne)	do { (void)(c_fn); (void)(e_fn); } while (0)
+#define dept_ask_event(m)				do { } while (0)
+#define dept_event(m, e_f, ip, e_fn)			do { (void)(e_fn); } while (0)
+#define dept_ecxt_exit(m, e_f, ip)			do { } while (0)
+#define dept_split_map_each_init(me)			do { } while (0)
+#define dept_split_map_common_init(mc, k, n)		do { (void)(n); (void)(k); } while (0)
+#define dept_wait_split_map(me, mc, ip, w_fn, ne)	do { } while (0)
+#define dept_event_split_map(me, mc, ip, e_fn)		do { } while (0)
+#define dept_ask_event_split_map(me, mc)		do { } while (0)
+#define dept_ecxt_enter_nokeep(m)			do { } while (0)
+#define dept_key_init(k)				do { (void)(k); } while (0)
+#define dept_key_destroy(k)				do { (void)(k); } while (0)
 
 #define dept_softirq_enter()				do { } while (0)
 #define dept_hardirq_enter()				do { } while (0)
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 4670eec..a0413f1 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -2427,6 +2427,152 @@ void dept_ecxt_exit(struct dept_map *m, unsigned long e_f,
 }
 EXPORT_SYMBOL_GPL(dept_ecxt_exit);
 
+void dept_split_map_each_init(struct dept_map_each *me)
+{
+	unsigned long flags;
+
+	if (unlikely(READ_ONCE(dept_stop) || in_nmi()))
+		return;
+
+	/*
+	 * Allow recursive entrance.
+	 */
+	flags = dept_enter_recursive();
+
+	me->wgen = 0U;
+
+	dept_exit_recursive(flags);
+}
+EXPORT_SYMBOL_GPL(dept_split_map_each_init);
+
+void dept_split_map_common_init(struct dept_map_common *mc,
+				struct dept_key *k, const char *n)
+{
+	unsigned long flags;
+
+	if (unlikely(READ_ONCE(dept_stop) || in_nmi()))
+		return;
+
+	/*
+	 * Allow recursive entrance.
+	 */
+	flags = dept_enter_recursive();
+
+	clean_classes_cache(&mc->keys_local);
+
+	/*
+	 * sub_usr is not used with split map.
+	 */
+	mc->sub_usr = 0;
+	mc->keys = k;
+	mc->name = n;
+	mc->nocheck = false;
+
+	dept_exit_recursive(flags);
+}
+EXPORT_SYMBOL_GPL(dept_split_map_common_init);
+
+void dept_wait_split_map(struct dept_map_each *me,
+			 struct dept_map_common *mc,
+			 unsigned long ip, const char *w_fn, int ne)
+{
+	struct dept_task *dt = dept_task();
+	struct dept_class *c;
+	struct dept_key *k;
+	unsigned long flags;
+
+	if (unlikely(READ_ONCE(dept_stop) || in_nmi()))
+		return;
+
+	if (dt->recursive)
+		return;
+
+	if (mc->nocheck)
+		return;
+
+	flags = dept_enter();
+
+	k = mc->keys ?: &mc->keys_local;
+	c = check_new_class(&mc->keys_local, k, 0, mc->name);
+	if (c)
+		add_wait(c, ip, w_fn, ne);
+
+	dept_exit(flags);
+}
+EXPORT_SYMBOL_GPL(dept_wait_split_map);
+
+void dept_ask_event_split_map(struct dept_map_each *me,
+			      struct dept_map_common *mc)
+{
+	unsigned int wg;
+	unsigned long flags;
+
+	if (unlikely(READ_ONCE(dept_stop) || in_nmi()))
+		return;
+
+	if (mc->nocheck)
+		return;
+
+	/*
+	 * Allow recursive entrance.
+	 */
+	flags = dept_enter_recursive();
+
+	/*
+	 * Avoid zero wgen.
+	 */
+	wg = atomic_inc_return(&wgen) ?: atomic_inc_return(&wgen);
+	WRITE_ONCE(me->wgen, wg);
+
+	dept_exit_recursive(flags);
+}
+EXPORT_SYMBOL_GPL(dept_ask_event_split_map);
+
+void dept_event_split_map(struct dept_map_each *me,
+			  struct dept_map_common *mc,
+			  unsigned long ip, const char *e_fn)
+{
+	struct dept_task *dt = dept_task();
+	struct dept_class *c;
+	struct dept_key *k;
+	unsigned long flags;
+
+	if (unlikely(READ_ONCE(dept_stop) || in_nmi()))
+		return;
+
+	if (dt->recursive) {
+		/*
+		 * Dept won't work with this map even though anyway an
+		 * event has been just triggered. Don't make it confused
+		 * at that time handling the next event. Disable it
+		 * until the next real case.
+		 */
+		WRITE_ONCE(me->wgen, 0U);
+		return;
+	}
+
+	if (mc->nocheck)
+		return;
+
+	flags = dept_enter();
+
+	k = mc->keys ?: &mc->keys_local;
+	c = check_new_class(&mc->keys_local, k, 0, mc->name);
+
+	if (c && add_ecxt((void *)me, c, 0UL, NULL, e_fn, 0)) {
+		do_event((void *)me, c, READ_ONCE(me->wgen), ip);
+		pop_ecxt((void *)me, c);
+	}
+
+	/*
+	 * Keep the map diabled until the next sleep.
+	 */
+	WRITE_ONCE(me->wgen, 0U);
+
+	dept_exit(flags);
+}
+EXPORT_SYMBOL_GPL(dept_event_split_map);
+
 void dept_task_exit(struct task_struct *t)
 {
 	struct dept_task *dt = &t->dept_task;
-- 
1.9.1

