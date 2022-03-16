Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE5D14DA83E
	for <lists+linux-ide@lfdr.de>; Wed, 16 Mar 2022 03:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353312AbiCPCa1 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 15 Mar 2022 22:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353306AbiCPC3q (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 15 Mar 2022 22:29:46 -0400
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A0DA45E761
        for <linux-ide@vger.kernel.org>; Tue, 15 Mar 2022 19:27:17 -0700 (PDT)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
        by 156.147.23.52 with ESMTP; 16 Mar 2022 11:27:10 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
        by 156.147.1.151 with ESMTP; 16 Mar 2022 11:27:10 +0900
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
Subject: [PATCH RFC v5 06/21] dept: Apply Dept to rwlock
Date:   Wed, 16 Mar 2022 11:26:18 +0900
Message-Id: <1647397593-16747-7-git-send-email-byungchul.park@lge.com>
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

Makes Dept able to track dependencies by rwlock.

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 include/linux/lockdep.h        | 25 ++++++++++++++++-----
 include/linux/rwlock.h         | 50 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/rwlock_api_smp.h |  8 +++----
 include/linux/rwlock_types.h   |  7 ++++++
 4 files changed, 81 insertions(+), 9 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 42237fc..91f8783 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -599,16 +599,31 @@ static inline void print_irqtrace_events(struct task_struct *curr)
 	dept_spin_unlock(&(l)->dmap, i);				\
 } while (0)
 
-#define rwlock_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
+#define rwlock_acquire(l, s, t, i)					\
+do {									\
+	lock_acquire_exclusive(l, s, t, NULL, i);			\
+	dept_rwlock_wlock(&(l)->dmap, s, t, NULL, "write_unlock", i);	\
+} while (0)
 #define rwlock_acquire_read(l, s, t, i)					\
 do {									\
-	if (read_lock_is_recursive())					\
+	if (read_lock_is_recursive()) {				\
 		lock_acquire_shared_recursive(l, s, t, NULL, i);	\
-	else								\
+		dept_rwlock_rlock(&(l)->dmap, s, t, NULL, "read_unlock", i, 0);\
+	} else {							\
 		lock_acquire_shared(l, s, t, NULL, i);			\
+		dept_rwlock_rlock(&(l)->dmap, s, t, NULL, "read_unlock", i, 1);\
+	}								\
+} while (0)
+#define rwlock_release(l, i)						\
+do {									\
+	lock_release(l, i);						\
+	dept_rwlock_wunlock(&(l)->dmap, i);				\
+} while (0)
+#define rwlock_release_read(l, i)					\
+do {									\
+	lock_release(l, i);						\
+	dept_rwlock_runlock(&(l)->dmap, i);				\
 } while (0)
-
-#define rwlock_release(l, i)			lock_release(l, i)
 
 #define seqcount_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
 #define seqcount_acquire_read(l, s, t, i)	lock_acquire_shared_recursive(l, s, t, NULL, i)
diff --git a/include/linux/rwlock.h b/include/linux/rwlock.h
index 8f416c5..cd4c6b0 100644
--- a/include/linux/rwlock.h
+++ b/include/linux/rwlock.h
@@ -28,6 +28,56 @@
 	do { *(lock) = __RW_LOCK_UNLOCKED(lock); } while (0)
 #endif
 
+#ifdef CONFIG_DEPT
+#define DEPT_EVT_RWLOCK_R		1UL
+#define DEPT_EVT_RWLOCK_W		(1UL << 1)
+#define DEPT_EVT_RWLOCK_RW		(DEPT_EVT_RWLOCK_R | DEPT_EVT_RWLOCK_W)
+
+#define dept_rwlock_wlock(m, ne, t, n, e_fn, ip)			\
+do {									\
+	if (t) {							\
+		dept_ecxt_enter(m, DEPT_EVT_RWLOCK_W, ip, __func__, e_fn, ne);\
+		dept_ask_event(m);					\
+	} else if (n) {							\
+		dept_ecxt_enter_nokeep(m);				\
+		dept_ask_event(m);					\
+	} else {							\
+		dept_wait(m, DEPT_EVT_RWLOCK_RW, ip, __func__, ne);	\
+		dept_ecxt_enter(m, DEPT_EVT_RWLOCK_W, ip, __func__, e_fn, ne);\
+		dept_ask_event(m);					\
+	}								\
+} while (0)
+#define dept_rwlock_rlock(m, ne, t, n, e_fn, ip, q)			\
+do {									\
+	if (t) {							\
+		dept_ecxt_enter(m, DEPT_EVT_RWLOCK_R, ip, __func__, e_fn, ne);\
+		dept_ask_event(m);					\
+	} else if (n) {							\
+		dept_ecxt_enter_nokeep(m);				\
+		dept_ask_event(m);					\
+	} else {							\
+		dept_wait(m, (q) ? DEPT_EVT_RWLOCK_RW : DEPT_EVT_RWLOCK_W, ip, __func__, ne);\
+		dept_ecxt_enter(m, DEPT_EVT_RWLOCK_R, ip, __func__, e_fn, ne);\
+		dept_ask_event(m);					\
+	}								\
+} while (0)
+#define dept_rwlock_wunlock(m, ip)					\
+do {									\
+	dept_event(m, DEPT_EVT_RWLOCK_W, ip, __func__);			\
+	dept_ecxt_exit(m, DEPT_EVT_RWLOCK_W, ip);			\
+} while (0)
+#define dept_rwlock_runlock(m, ip)					\
+do {									\
+	dept_event(m, DEPT_EVT_RWLOCK_R, ip, __func__);			\
+	dept_ecxt_exit(m, DEPT_EVT_RWLOCK_R, ip);			\
+} while (0)
+#else
+#define dept_rwlock_wlock(m, ne, t, n, e_fn, ip)	do { } while (0)
+#define dept_rwlock_rlock(m, ne, t, n, e_fn, ip, q)	do { } while (0)
+#define dept_rwlock_wunlock(m, ip)			do { } while (0)
+#define dept_rwlock_runlock(m, ip)			do { } while (0)
+#endif
+
 #ifdef CONFIG_DEBUG_SPINLOCK
  extern void do_raw_read_lock(rwlock_t *lock) __acquires(lock);
  extern int do_raw_read_trylock(rwlock_t *lock);
diff --git a/include/linux/rwlock_api_smp.h b/include/linux/rwlock_api_smp.h
index dceb0a5..a222cf1 100644
--- a/include/linux/rwlock_api_smp.h
+++ b/include/linux/rwlock_api_smp.h
@@ -228,7 +228,7 @@ static inline void __raw_write_unlock(rwlock_t *lock)
 
 static inline void __raw_read_unlock(rwlock_t *lock)
 {
-	rwlock_release(&lock->dep_map, _RET_IP_);
+	rwlock_release_read(&lock->dep_map, _RET_IP_);
 	do_raw_read_unlock(lock);
 	preempt_enable();
 }
@@ -236,7 +236,7 @@ static inline void __raw_read_unlock(rwlock_t *lock)
 static inline void
 __raw_read_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
 {
-	rwlock_release(&lock->dep_map, _RET_IP_);
+	rwlock_release_read(&lock->dep_map, _RET_IP_);
 	do_raw_read_unlock(lock);
 	local_irq_restore(flags);
 	preempt_enable();
@@ -244,7 +244,7 @@ static inline void __raw_read_unlock(rwlock_t *lock)
 
 static inline void __raw_read_unlock_irq(rwlock_t *lock)
 {
-	rwlock_release(&lock->dep_map, _RET_IP_);
+	rwlock_release_read(&lock->dep_map, _RET_IP_);
 	do_raw_read_unlock(lock);
 	local_irq_enable();
 	preempt_enable();
@@ -252,7 +252,7 @@ static inline void __raw_read_unlock_irq(rwlock_t *lock)
 
 static inline void __raw_read_unlock_bh(rwlock_t *lock)
 {
-	rwlock_release(&lock->dep_map, _RET_IP_);
+	rwlock_release_read(&lock->dep_map, _RET_IP_);
 	do_raw_read_unlock(lock);
 	__local_bh_enable_ip(_RET_IP_, SOFTIRQ_LOCK_OFFSET);
 }
diff --git a/include/linux/rwlock_types.h b/include/linux/rwlock_types.h
index 1948442..6dddc5b 100644
--- a/include/linux/rwlock_types.h
+++ b/include/linux/rwlock_types.h
@@ -5,11 +5,18 @@
 # error "Do not include directly, include spinlock_types.h"
 #endif
 
+#ifdef CONFIG_DEPT
+# define RW_DMAP_INIT(lockname) .dmap = { .name = #lockname },
+#else
+# define RW_DMAP_INIT(lockname)
+#endif
+
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 # define RW_DEP_MAP_INIT(lockname)					\
 	.dep_map = {							\
 		.name = #lockname,					\
 		.wait_type_inner = LD_WAIT_CONFIG,			\
+		RW_DMAP_INIT(lockname)					\
 	}
 #else
 # define RW_DEP_MAP_INIT(lockname)
-- 
1.9.1

