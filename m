Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12C61EE6BA
	for <lists+linux-ide@lfdr.de>; Thu,  4 Jun 2020 16:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729059AbgFDOe7 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 4 Jun 2020 10:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729037AbgFDOe7 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 4 Jun 2020 10:34:59 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A177C08C5C4
        for <linux-ide@vger.kernel.org>; Thu,  4 Jun 2020 07:34:57 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y18so2254587plr.4
        for <linux-ide@vger.kernel.org>; Thu, 04 Jun 2020 07:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ove4i1/jldMZ8oj/uY7NqV8r09suzUfhCHwuSYH9N6k=;
        b=TjCwc4Glzpv6zTuI4ORcCO3GKt0+Ccro7aRK1+e6UcK9/8RNeB8TRca2cDcrCZcFnw
         dOZz9z/5MHyMXIaUdvhXgJxFJWPi992hZGVtspEgPL5VJyozAoxBel+yRY8wrOsFSawW
         q/r0W2zg8NzemNia+bwbRZAfOWsgUJYKa74vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ove4i1/jldMZ8oj/uY7NqV8r09suzUfhCHwuSYH9N6k=;
        b=LBhBgW7cSW7MZJXsl9B804EE7T9hrPmq/cp6m9BLLOiHHT+1jwvZLfpNWXVV4KEZML
         Svr5jeOLYoUfvcCjYm4fRjsip1RgrAJcg3ooYG7V1N1vnvA/lWuJrlXXsu8HjaOaqVYu
         j8Dh2m2gjKtmO0rFGTUPGdIcI4kMf85G3+njkCJLQA/7b/MorTdIdUGLYZCE0WwHatYU
         4QlWcSb7gtvSZLs3XRd4UF7DtUaYQzNyrtYNXE43UwmJzgldCSzKPxuHzUMF9GrhCdbV
         uR3sfk11Cf7PKNUIfoPMFH0WNp9sK4KHaTGS/5ZJkYZyZ8W+MWswOw/8sYPgrkBzTyDb
         MwDA==
X-Gm-Message-State: AOAM530Q+LkoXUFPQMWVQaW2VKVijJabDVpkDOEYaMFrrRZ0ZD+6QNEk
        lYhWBlCE65qoKQwp9ET6MmY6XA==
X-Google-Smtp-Source: ABdhPJwYFZeK5TkHVANf3TB7Mzvs6z8AC7rMNyAbLjxTjQqaX9yKSG5fQNVZZytsALVosdoYYC3FFg==
X-Received: by 2002:a17:90a:950e:: with SMTP id t14mr5847304pjo.99.1591281296926;
        Thu, 04 Jun 2020 07:34:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q8sm6069346pjj.51.2020.06.04.07.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 07:34:55 -0700 (PDT)
Date:   Thu, 4 Jun 2020 07:34:54 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>, x86@kernel.org,
        drbd-dev@lists.linbit.com, linux-block@vger.kernel.org,
        b43-dev@lists.infradead.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-mm@kvack.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 01/10] x86/mm/numa: Remove uninitialized_var() usage
Message-ID: <202006040728.8797FAA4@keescook>
References: <20200603233203.1695403-2-keescook@chromium.org>
 <874krr8dps.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874krr8dps.fsf@nanos.tec.linutronix.de>
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Thu, Jun 04, 2020 at 09:58:07AM +0200, Thomas Gleixner wrote:
> Kees Cook <keescook@chromium.org> writes:
> > -#ifdef NODE_NOT_IN_PAGE_FLAGS
> > -	pfn_align = node_map_pfn_alignment();
> > -	if (pfn_align && pfn_align < PAGES_PER_SECTION) {
> > -		printk(KERN_WARNING "Node alignment %LuMB < min %LuMB, rejecting NUMA config\n",
> > -		       PFN_PHYS(pfn_align) >> 20,
> > -		       PFN_PHYS(PAGES_PER_SECTION) >> 20);
> > -		return -EINVAL;
> > +	if (IS_ENABLED(NODE_NOT_IN_PAGE_FLAGS)) {
> 
> Hrm, clever ...
> 
> > +		unsigned long pfn_align = node_map_pfn_alignment();
> > +
> > +		if (pfn_align && pfn_align < PAGES_PER_SECTION) {
> > +			pr_warn("Node alignment %LuMB < min %LuMB, rejecting NUMA config\n",
> > +				PFN_PHYS(pfn_align) >> 20,
> > +				PFN_PHYS(PAGES_PER_SECTION) >> 20);
> > +			return -EINVAL;
> > +		}
> >  	}
> > -#endif
> >  	if (!numa_meminfo_cover_memory(mi))
> >  		return -EINVAL;
> >  
> > diff --git a/include/linux/page-flags-layout.h b/include/linux/page-flags-layout.h
> > index 71283739ffd2..1a4cdec2bd29 100644
> > --- a/include/linux/page-flags-layout.h
> > +++ b/include/linux/page-flags-layout.h
> > @@ -100,7 +100,7 @@
> >   * there.  This includes the case where there is no node, so it is implicit.
> >   */
> >  #if !(NODES_WIDTH > 0 || NODES_SHIFT == 0)
> > -#define NODE_NOT_IN_PAGE_FLAGS
> > +#define NODE_NOT_IN_PAGE_FLAGS 1
> 
> but if we ever lose the 1 then the above will silently compile the code
> within the IS_ENABLED() section out.

That's true, yes. I considered two other ways to do this:

1) smallest patch, but more #ifdef:

diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 59ba008504dc..fbf5231a3d35 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -541,7 +541,9 @@ static void __init numa_clear_kernel_node_hotplug(void)
 
 static int __init numa_register_memblks(struct numa_meminfo *mi)
 {
-	unsigned long uninitialized_var(pfn_align);
+#ifdef NODE_NOT_IN_PAGE_FLAGS
+	unsigned long pfn_align;
+#endif
 	int i, nid;
 
 	/* Account for nodes with cpus and no memory */

2) medium size, weird style:

diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 59ba008504dc..0df7ba9b21b2 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -541,7 +541,6 @@ static void __init numa_clear_kernel_node_hotplug(void)
 
 static int __init numa_register_memblks(struct numa_meminfo *mi)
 {
-	unsigned long uninitialized_var(pfn_align);
 	int i, nid;
 
 	/* Account for nodes with cpus and no memory */
@@ -570,12 +569,15 @@ static int __init numa_register_memblks(struct numa_meminfo *mi)
 	 * whether its granularity is fine enough.
 	 */
 #ifdef NODE_NOT_IN_PAGE_FLAGS
-	pfn_align = node_map_pfn_alignment();
-	if (pfn_align && pfn_align < PAGES_PER_SECTION) {
-		printk(KERN_WARNING "Node alignment %LuMB < min %LuMB, rejecting NUMA config\n",
-		       PFN_PHYS(pfn_align) >> 20,
-		       PFN_PHYS(PAGES_PER_SECTION) >> 20);
-		return -EINVAL;
+	{
+		unsigned long pfn_align = node_map_pfn_alignment();
+
+		if (pfn_align && pfn_align < PAGES_PER_SECTION) {
+			pr_warn("Node alignment %LuMB < min %LuMB, rejecting NUMA config\n",
+			       PFN_PHYS(pfn_align) >> 20,
+			       PFN_PHYS(PAGES_PER_SECTION) >> 20);
+			return -EINVAL;
+		}
 	}
 #endif
 	if (!numa_meminfo_cover_memory(mi))

and 3 is what I sent: biggest, but removes #ifdef

Any preference?

Thanks!

-- 
Kees Cook
