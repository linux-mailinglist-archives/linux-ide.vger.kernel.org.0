Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 053A52020AD
	for <lists+linux-ide@lfdr.de>; Sat, 20 Jun 2020 05:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733236AbgFTDcJ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 19 Jun 2020 23:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733063AbgFTDbN (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 19 Jun 2020 23:31:13 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F9CC061D73
        for <linux-ide@vger.kernel.org>; Fri, 19 Jun 2020 20:30:28 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k1so4814695pls.2
        for <linux-ide@vger.kernel.org>; Fri, 19 Jun 2020 20:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QVK7j0hx8FBwbrQRQLiAwPLU1M0hFNtAd7ZF9cg10jo=;
        b=TZW89t7zN77H873mcFo8WLKtwyPOC4zRyfDeh6db7mO8VCfzF/bLHMfK7vcAzedFuv
         1RpGH6tOBLqduS8I/DdeF83mRRrdAlWtjSzOSaXCEmWDNlYtfmcl5HjH5pc0lKbkP/sk
         L+yXY5n0mIFfGtE2LVxuNzfT527bZqkW9h24Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QVK7j0hx8FBwbrQRQLiAwPLU1M0hFNtAd7ZF9cg10jo=;
        b=uQOk6bfctETxfygGK7E7UCKyrQfQDBSkPutSMmPY8iHBJV1ZAlJntouHH20N0JcGs1
         35vtvqwOpQAdjRrsrfOxkhG4ikH7yOoBVcfauBMErcgnvRFzupRagrKqAad/yl1T7n8u
         QbjHA5jzMXUADtxKYAgNdDqw8tynsN/vzpKNxUEl2lI68a3sJQR8ZT0EOa+kfw2EBvFM
         EKbDCpi+4RpO9wjv9vGRELuuc8KabTtqfDs1MWojQR5FYzCXbdInWwkKfJeRbS4cSCFH
         SY3TgdKJZuU7j+HatPSSn0BaeefieLx8oX5sBObQgR9sjv6Y5ZI960HkomAXeQewWc6/
         cTHQ==
X-Gm-Message-State: AOAM532K4coRJ80hYC28erYBhJfOHwbHbCAcaj2O6+LOiNSOyn+HLGXl
        8nqr20TBLXk9mf8OczSxT02nzg==
X-Google-Smtp-Source: ABdhPJz8KX7mQAqh+M5lriaij/q9w5lLW8mo5TU5HFqGc/qxPYSRCJFCyD55HX6pgmlCF9isgzBqNQ==
X-Received: by 2002:a17:90a:778c:: with SMTP id v12mr6634388pjk.34.1592623828165;
        Fri, 19 Jun 2020 20:30:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r1sm824770pjd.47.2020.06.19.20.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 20:30:26 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>, x86@kernel.org,
        drbd-dev@lists.linbit.com, linux-block@vger.kernel.org,
        b43-dev@lists.infradead.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mm@kvack.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH v2 13/16] mm/debug_vm_pgtable: Remove uninitialized_var() usage
Date:   Fri, 19 Jun 2020 20:30:07 -0700
Message-Id: <20200620033007.1444705-17-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200620033007.1444705-1-keescook@chromium.org>
References: <20200620033007.1444705-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Using uninitialized_var() is dangerous as it papers over real bugs[1]
(or can in the future), and suppresses unrelated compiler warnings (e.g.
"unused variable"). If the compiler thinks it is uninitialized, either
simply initialize the variable or make compiler changes. As a precursor
to removing[2] this[3] macro[4], just initialize this variable to NULL.

[1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
[2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
[3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
[4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/

Fixes: 399145f9eb6c ("mm/debug: add tests validating architecture page table helpers")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 mm/debug_vm_pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index e45623016aea..83c9e88a052a 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -307,7 +307,7 @@ static int __init debug_vm_pgtable(void)
 	phys_addr_t paddr;
 	unsigned long vaddr, pte_aligned, pmd_aligned;
 	unsigned long pud_aligned, p4d_aligned, pgd_aligned;
-	spinlock_t *uninitialized_var(ptl);
+	spinlock_t *ptl = NULL;
 
 	pr_info("Validating architecture page table helpers\n");
 	prot = vm_get_page_prot(VMFLAGS);
-- 
2.25.1

