Return-Path: <linux-ide+bounces-1354-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B39A58BFA5F
	for <lists+linux-ide@lfdr.de>; Wed,  8 May 2024 12:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BBD8281457
	for <lists+linux-ide@lfdr.de>; Wed,  8 May 2024 10:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696318563D;
	Wed,  8 May 2024 10:03:08 +0000 (UTC)
X-Original-To: linux-ide@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697457E774;
	Wed,  8 May 2024 10:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715162587; cv=none; b=Zg8bd1BLHsvsnF9z27TRTZqWd08YXKvKfC1//6eYpSlEJzwN5CiCxyfAyz99f+qM7U3rI0XOIRfykktVQNVHdtEkPYsHkQHCqkC/kY6MfGJflyRpVSmkC5dA+y1jheD6O7zHdqIjiNSo9kfUfP3Cv9yQrWsydH4lABJJJvKBXEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715162587; c=relaxed/simple;
	bh=ul/wiSzDZit7bOUs1eKkFyN45Ghg8m4Ni94/4VNQ6UQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=J8TSC71o/c8cd4zaPQQHvTyXJbjYrg5GzIUTFgV2P7UsOMZk3j9hrvSxNLYA3bq/rspbHsYqvr/r5gT2Q7J1XI9qN2BXQgaGhBs8wyR1sZD+GOY3XKbBD6ORBNa6eTMRE3Y9gijoXhdxcrifpeGLWnyscho7+nw7V1anLB2ElIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-d85ff70000001748-99-663b4a3bcedb
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Cc: kernel_team@skhynix.com,
	torvalds@linux-foundation.org,
	damien.lemoal@opensource.wdc.com,
	linux-ide@vger.kernel.org,
	adilger.kernel@dilger.ca,
	linux-ext4@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	will@kernel.org,
	tglx@linutronix.de,
	rostedt@goodmis.org,
	joel@joelfernandes.org,
	sashal@kernel.org,
	daniel.vetter@ffwll.ch,
	duyuyang@gmail.com,
	johannes.berg@intel.com,
	tj@kernel.org,
	tytso@mit.edu,
	willy@infradead.org,
	david@fromorbit.com,
	amir73il@gmail.com,
	gregkh@linuxfoundation.org,
	kernel-team@lge.com,
	linux-mm@kvack.org,
	akpm@linux-foundation.org,
	mhocko@kernel.org,
	minchan@kernel.org,
	hannes@cmpxchg.org,
	vdavydov.dev@gmail.com,
	sj@kernel.org,
	jglisse@redhat.com,
	dennis@kernel.org,
	cl@linux.com,
	penberg@kernel.org,
	rientjes@google.com,
	vbabka@suse.cz,
	ngupta@vflare.org,
	linux-block@vger.kernel.org,
	josef@toxicpanda.com,
	linux-fsdevel@vger.kernel.org,
	jack@suse.cz,
	jlayton@kernel.org,
	dan.j.williams@intel.com,
	hch@infradead.org,
	djwong@kernel.org,
	dri-devel@lists.freedesktop.org,
	rodrigosiqueiramelo@gmail.com,
	melissa.srw@gmail.com,
	hamohammed.sa@gmail.com,
	42.hyeyoo@gmail.com,
	chris.p.wilson@intel.com,
	gwan-gyeong.mun@intel.com,
	max.byungchul.park@gmail.com,
	boqun.feng@gmail.com,
	longman@redhat.com,
	hdanton@sina.com,
	her0gyugyu@gmail.com
Subject: [PATCH v14 24/28] dept: Print event context requestor's stacktrace on report
Date: Wed,  8 May 2024 18:47:21 +0900
Message-Id: <20240508094726.35754-25-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240508094726.35754-1-byungchul@sk.com>
References: <20240508094726.35754-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSfUzMcRwHcN/v77Hj+O0wP8XizGwMeag+JPOHh+8sw8ws/uCm3+noLruS
	srX1cCp6GLUeVOwqTrsirjYPFSeKq0nSKBJapLqrFZdSpKv557PX3p/P3n99eEpRwbjzGl24
	pNepQpSsjJY5ZhWs9tvtp/ZKSfaGyyle4PyZREN+WSkLTbdLEJRWxGLoqd0F74btCMZevqIg
	O7MJQcGXjxRU1HUgqC6OY+FN12xocQ6wYMtMZiG+qIyF133jGNqz0jGUWPZAw6VCDNbRbhqy
	e1jIy47Hk+M7hlGTmQNTzHLoLM7lYPzLOrB1vGWg+v0quHKtnYWqahsNdfc7Mbx5mM9CR+kE
	Aw11L2houpzKwK3+Qhb6hk0UmJwDHDRbjRjuGCaLEn78ZeB5qhVDwvW7GFraKhE8SvqMwVL6
	loWnTjuGcksmBb9v1iLoTHNwcD5llIO82DQEyeezaDC0e8PYSD67bRN5ah+giKH8LKkeNtKk
	vlAkD3I/csTw6D1HjJYzpLx4JSmq6sGkYMjJEIv5AkssQ+kcuehowaS/sZEjL3LGaNLVko33
	uR+WbQmSQjQRkn7t1mOyYNtVB3X6wo7Irz1VdAzK8b2I3HhR2Ciamj9R//2hfgC5zAorxNbW
	0al8nrBELE/9xrhMCXaZeL1xp8tzhYPijbgO2mVaWC4WPOjGLssFH7H+cx+e7vQUS+5Yp3rc
	JvO27v6pfoXgLVbG53LTNxO8OGYm014oPilupS8huRHNMCOFRhehVWlCNq4JjtJpItccD9Va
	0OQvmaLHj9xHQ00HapDAI+UsuXXBZrWCUUWERWlrkMhTynny2kRftUIepIo6J+lDj+rPhEhh
	NciDp5UL5OuHzwYphBOqcOmUJJ2W9P+3mHdzj0F5AQJzEnv2egQeIjv8062n4nY/n+nza7Fw
	lV9RcWjR76DGhsG9umZNoqTe75sxGD2iSLJkhBqsRTb/kg32oeD85GW9Ktw2R5tQGfg48AnX
	u7T16GPH3Ej14u05xwKy/vob7p3b5pkRy4UatVfMXn8eBqSF+xysfLYsb35v2W3bHyUdFqxa
	t5LSh6n+AWH2omZHAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSeUiTcRjA8X6/95qj2esyejGiGEhg92E9teiAypfsIiihe+VrrnTWVqbR
	oW5maYoWc6VWnkvUrmllpbYUrSnZTEkrM7XDhsc6nLUUzRX98/DheeD71yMipAbKS6RUHRHU
	KkWIjBaT4g1y7Uz5WnnQHHvdZEg5Pwcc/WdJyLhVRIP1ZiGCopJoDLZqP2ge6EEw+PwFAQa9
	FUFWxzsCSmraEJTnx9DQ+NEdmhx2Giz6BBq0ObdoaOgewtCaegFDoWk91CVnYzA7u0gw2GhI
	N2jx6PiCwWksYMAY5Q2d+WkMDHXMBUvbKwqqrlgoKH8zHS5fbaWhrNxCQk1pJ4bGhxk0tBWN
	UFBX84wEa0oiBTf6smnoHjASYHTYGXhpzsRwWzdaO/NjmIKniWYMZ3LvYGh6/QhBxdl2DKai
	VzRUOXowFJv0BPy+Xo2gM6mXgdjzTgbSo5MQJMSmkqBr9YXBXxn0iiV8VY+d4HXFx/jygUyS
	r83m+Adp7xheV/GG4TNNR/nifB8+p8yG+azvDoo3FZyjedP3Cwwf39uE+b76eoZ/dmmQ5D82
	GfCmSdvESwOFEGW4oJ69bI842HKllzh0bnXEJ1sZGYUuLYpHbiKOXcC9rbUjl2l2GtfS4iRc
	9mSncsWJnymXCbZHzOXWr3F5PLuFy4tpI10mWW8u60EXdlnCLuRq27vxv+YUrvC2+W/HbXT/
	uqvvb1/K+nKPtGlMMhJnojEFyFOpCg9VKEN8Z2kOBkeqlBGz9oWFmtDouxhPDqWUov5Gv0rE
	ipBsrMRKy4OklCJcExlaiTgRIfOUVMctCpJKAhWRxwV12G710RBBU4kmiUjZRMnaAGGPlN2v
	OCIcFIRDgvr/FYvcvKJQanKkh9/pGytjWLviVHtiXMq4dEnpcrW+15brLz/BWfrSCl5otjqf
	z/CYUNqsauhoGAoLWPxB4ti6KvDajjz/kth74bq9EfF3R7RrWuq3w8XruRWcj9c894Zv6x4n
	HTaN2exhHn7/ZF9OnPXmAePL5o26mLf6b1minJ9f78+fvmvnVxmpCVbM9SHUGsUf8asK1SoD
	AAA=
X-CFilter-Loop: Reflected
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>

Currently, print nothing in place of [S] in report, which means
stacktrace of event context's start if the event is not an unlock thing
by typical lock but general event because it's not easy to specify the
point in a general way, where the event context has started from.

However, unfortunately it makes hard to interpret dept's report in that
case. So made it print the event requestor's stacktrace instead of the
event context's start, in place of [S] in report.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept.h     | 13 +++++++
 kernel/dependency/dept.c | 83 ++++++++++++++++++++++++++++++++--------
 2 files changed, 80 insertions(+), 16 deletions(-)

diff --git a/include/linux/dept.h b/include/linux/dept.h
index dea53ad5b356..6db23d77905e 100644
--- a/include/linux/dept.h
+++ b/include/linux/dept.h
@@ -145,6 +145,11 @@ struct dept_map {
 	 */
 	unsigned int			wgen;
 
+	/*
+	 * requestor for the event context to run
+	 */
+	struct dept_stack		*req_stack;
+
 	/*
 	 * whether this map should be going to be checked or not
 	 */
@@ -486,7 +491,15 @@ struct dept_task {
  * for subsystems that requires compact use of memory e.g. struct page
  */
 struct dept_ext_wgen{
+	/*
+	 * wait timestamp associated to this map
+	 */
 	unsigned int wgen;
+
+	/*
+	 * requestor for the event context to run
+	 */
+	struct dept_stack		*req_stack;
 };
 
 #define DEPT_TASK_INITIALIZER(t)				\
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index fb33c3758c25..abf1cdab0615 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -129,6 +129,7 @@ static int dept_per_cpu_ready;
 #define DEPT_INFO(s...)		pr_warn("DEPT_INFO: " s)
 
 static arch_spinlock_t dept_spin = (arch_spinlock_t)__ARCH_SPIN_LOCK_UNLOCKED;
+static arch_spinlock_t dept_req_spin = (arch_spinlock_t)__ARCH_SPIN_LOCK_UNLOCKED;
 static arch_spinlock_t dept_pool_spin = (arch_spinlock_t)__ARCH_SPIN_LOCK_UNLOCKED;
 
 /*
@@ -1669,7 +1670,8 @@ static void add_wait(struct dept_class *c, unsigned long ip,
 
 static bool add_ecxt(struct dept_map *m, struct dept_class *c,
 		     unsigned long ip, const char *c_fn,
-		     const char *e_fn, int sub_l)
+		     const char *e_fn, int sub_l,
+		     struct dept_stack *req_stack)
 {
 	struct dept_task *dt = dept_task();
 	struct dept_ecxt_held *eh;
@@ -1700,10 +1702,16 @@ static bool add_ecxt(struct dept_map *m, struct dept_class *c,
 
 	e->class = get_class(c);
 	e->ecxt_ip = ip;
-	e->ecxt_stack = ip && rich_stack ? get_current_stack() : NULL;
 	e->event_fn = e_fn;
 	e->ecxt_fn = c_fn;
 
+	if (req_stack)
+		e->ecxt_stack = get_stack(req_stack);
+	else if (ip && rich_stack)
+		e->ecxt_stack = get_current_stack();
+	else
+		e->ecxt_stack = NULL;
+
 	eh = dt->ecxt_held + (dt->ecxt_held_pos++);
 	eh->ecxt = get_ecxt(e);
 	eh->map = m;
@@ -2147,6 +2155,7 @@ void dept_map_init(struct dept_map *m, struct dept_key *k, int sub_u,
 	m->sub_u = sub_u;
 	m->name = n;
 	m->wgen = 0U;
+	m->req_stack = NULL;
 	m->nocheck = !valid_key(k);
 
 	dept_exit_recursive(flags);
@@ -2181,6 +2190,7 @@ void dept_map_reinit(struct dept_map *m, struct dept_key *k, int sub_u,
 		m->name = n;
 
 	m->wgen = 0U;
+	m->req_stack = NULL;
 
 	dept_exit_recursive(flags);
 }
@@ -2189,6 +2199,7 @@ EXPORT_SYMBOL_GPL(dept_map_reinit);
 void dept_ext_wgen_init(struct dept_ext_wgen *ewg)
 {
 	ewg->wgen = 0U;
+	ewg->req_stack = NULL;
 }
 
 void dept_map_copy(struct dept_map *to, struct dept_map *from)
@@ -2376,7 +2387,8 @@ static void __dept_wait(struct dept_map *m, unsigned long w_f,
  */
 static void __dept_event(struct dept_map *m, unsigned long e_f,
 			 unsigned long ip, const char *e_fn,
-			 bool sched_map, unsigned int wg)
+			 bool sched_map, unsigned int wg,
+			 struct dept_stack *req_stack)
 {
 	struct dept_class *c;
 	struct dept_key *k;
@@ -2397,7 +2409,7 @@ static void __dept_event(struct dept_map *m, unsigned long e_f,
 	k = m->keys ?: &m->map_key;
 	c = check_new_class(&m->map_key, k, sub_id(m, e), m->name, sched_map);
 
-	if (c && add_ecxt(m, c, 0UL, NULL, e_fn, 0)) {
+	if (c && add_ecxt(m, c, 0UL, "(event requestor)", e_fn, 0, req_stack)) {
 		do_event(m, c, wg, ip);
 		pop_ecxt(m, c);
 	}
@@ -2506,6 +2518,8 @@ EXPORT_SYMBOL_GPL(dept_stage_wait);
 
 static void __dept_clean_stage(struct dept_task *dt)
 {
+	if (dt->stage_m.req_stack)
+		put_stack(dt->stage_m.req_stack);
 	memset(&dt->stage_m, 0x0, sizeof(struct dept_map));
 	dt->stage_sched_map = false;
 	dt->stage_w_fn = NULL;
@@ -2571,6 +2585,7 @@ void dept_request_event_wait_commit(void)
 	 */
 	wg = atomic_inc_return(&wgen) ?: atomic_inc_return(&wgen);
 	WRITE_ONCE(dt->stage_m.wgen, wg);
+	dt->stage_m.req_stack = get_current_stack();
 
 	__dept_wait(&dt->stage_m, 1UL, ip, w_fn, 0, true, sched_map, timeout);
 exit:
@@ -2602,6 +2617,8 @@ void dept_stage_event(struct task_struct *requestor, unsigned long ip)
 	 */
 	m = dt_req->stage_m;
 	sched_map = dt_req->stage_sched_map;
+	if (m.req_stack)
+		get_stack(m.req_stack);
 	__dept_clean_stage(dt_req);
 
 	/*
@@ -2611,8 +2628,12 @@ void dept_stage_event(struct task_struct *requestor, unsigned long ip)
 	if (!m.keys)
 		goto exit;
 
-	__dept_event(&m, 1UL, ip, "try_to_wake_up", sched_map, m.wgen);
+	__dept_event(&m, 1UL, ip, "try_to_wake_up", sched_map, m.wgen,
+		     m.req_stack);
 exit:
+	if (m.req_stack)
+		put_stack(m.req_stack);
+
 	dept_exit(flags);
 }
 
@@ -2692,7 +2713,7 @@ void dept_map_ecxt_modify(struct dept_map *m, unsigned long e_f,
 	k = m->keys ?: &m->map_key;
 	c = check_new_class(&m->map_key, k, sub_id(m, new_e), m->name, false);
 
-	if (c && add_ecxt(m, c, new_ip, new_c_fn, new_e_fn, new_sub_l))
+	if (c && add_ecxt(m, c, new_ip, new_c_fn, new_e_fn, new_sub_l, NULL))
 		goto exit;
 
 	/*
@@ -2744,7 +2765,7 @@ void dept_ecxt_enter(struct dept_map *m, unsigned long e_f, unsigned long ip,
 	k = m->keys ?: &m->map_key;
 	c = check_new_class(&m->map_key, k, sub_id(m, e), m->name, false);
 
-	if (c && add_ecxt(m, c, ip, c_fn, e_fn, sub_l))
+	if (c && add_ecxt(m, c, ip, c_fn, e_fn, sub_l, NULL))
 		goto exit;
 missing_ecxt:
 	dt->missing_ecxt++;
@@ -2792,9 +2813,11 @@ EXPORT_SYMBOL_GPL(dept_ecxt_holding);
 
 void dept_request_event(struct dept_map *m, struct dept_ext_wgen *ewg)
 {
+	struct dept_task *dt = dept_task();
 	unsigned long flags;
 	unsigned int wg;
 	unsigned int *wg_p;
+	struct dept_stack **req_stack_p;
 
 	if (unlikely(!dept_working()))
 		return;
@@ -2802,12 +2825,18 @@ void dept_request_event(struct dept_map *m, struct dept_ext_wgen *ewg)
 	if (m->nocheck)
 		return;
 
-	/*
-	 * Allow recursive entrance.
-	 */
-	flags = dept_enter_recursive();
+	if (dt->recursive)
+		return;
 
-	wg_p = ewg ? &ewg->wgen : &m->wgen;
+	flags = dept_enter();
+
+	if (ewg) {
+		wg_p = &ewg->wgen;
+		req_stack_p = &ewg->req_stack;
+	} else {
+		wg_p = &m->wgen;
+		req_stack_p = &m->req_stack;
+	}
 
 	/*
 	 * Avoid zero wgen.
@@ -2815,7 +2844,13 @@ void dept_request_event(struct dept_map *m, struct dept_ext_wgen *ewg)
 	wg = atomic_inc_return(&wgen) ?: atomic_inc_return(&wgen);
 	WRITE_ONCE(*wg_p, wg);
 
-	dept_exit_recursive(flags);
+	arch_spin_lock(&dept_req_spin);
+	if (*req_stack_p)
+		put_stack(*req_stack_p);
+	*req_stack_p = get_current_stack();
+	arch_spin_unlock(&dept_req_spin);
+
+	dept_exit(flags);
 }
 EXPORT_SYMBOL_GPL(dept_request_event);
 
@@ -2826,6 +2861,8 @@ void dept_event(struct dept_map *m, unsigned long e_f,
 	struct dept_task *dt = dept_task();
 	unsigned long flags;
 	unsigned int *wg_p;
+	struct dept_stack **req_stack_p;
+	struct dept_stack *req_stack;
 
 	if (unlikely(!dept_working()))
 		return;
@@ -2833,7 +2870,18 @@ void dept_event(struct dept_map *m, unsigned long e_f,
 	if (m->nocheck)
 		return;
 
-	wg_p = ewg ? &ewg->wgen : &m->wgen;
+	if (ewg) {
+		wg_p = &ewg->wgen;
+		req_stack_p = &ewg->req_stack;
+	} else {
+		wg_p = &m->wgen;
+		req_stack_p = &m->req_stack;
+	}
+
+	arch_spin_lock(&dept_req_spin);
+	req_stack = *req_stack_p;
+	*req_stack_p = NULL;
+	arch_spin_unlock(&dept_req_spin);
 
 	if (dt->recursive) {
 		/*
@@ -2842,17 +2890,20 @@ void dept_event(struct dept_map *m, unsigned long e_f,
 		 * handling the event. Disable it until the next.
 		 */
 		WRITE_ONCE(*wg_p, 0U);
+		if (req_stack)
+			put_stack(req_stack);
 		return;
 	}
 
 	flags = dept_enter();
-
-	__dept_event(m, e_f, ip, e_fn, false, READ_ONCE(*wg_p));
+	__dept_event(m, e_f, ip, e_fn, false, READ_ONCE(*wg_p), req_stack);
 
 	/*
 	 * Keep the map diabled until the next sleep.
 	 */
 	WRITE_ONCE(*wg_p, 0U);
+	if (req_stack)
+		put_stack(req_stack);
 
 	dept_exit(flags);
 }
-- 
2.17.1


