Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3DD520207B
	for <lists+linux-ide@lfdr.de>; Sat, 20 Jun 2020 05:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733071AbgFTDbM (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 19 Jun 2020 23:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733063AbgFTDbB (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 19 Jun 2020 23:31:01 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 393F1C0619F0
        for <linux-ide@vger.kernel.org>; Fri, 19 Jun 2020 20:30:25 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id n2so4793314pld.13
        for <linux-ide@vger.kernel.org>; Fri, 19 Jun 2020 20:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TsJU39le/9mzUUvkg/vEQ1ejtljvEC7MElEcoRxU/hs=;
        b=nLZb9q5MNXSO30mRLC8p+Z6tp7SeKI4c8mbyilFhnvlC39t+V3j0iQJ4vfU5EbJ/Ge
         yJs0yUXWykR2+lKlShzU2CG/atXeM++8u60h/nbziIo1McpvPT8URV5HcgXBrobq0ydJ
         LtCik9CXYKbYzZN1wG1+1XbNp5/sueNlWfLSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TsJU39le/9mzUUvkg/vEQ1ejtljvEC7MElEcoRxU/hs=;
        b=QbpMiW8cAa5I2FQ7HNGki3YPiglryeubi7ePfZJaIs/mxMjbqK2aPkgeIMusuOH/p/
         gGa2jPLwqUvJPg2yXSFj/52PEwwM5YFhl3A6xzaCVEZ2h5AdImrRTKf7OKT7utR+2dLd
         Mm+9CU14sZ00mX9y9uD3d5dNMEKKd46NZCCQzTFOA+gDTS06x51fKpk694Fh/qtyXHov
         WBoyAuSp8ONIHSaIpXHyj833WBb6hRraRMxOuHr+bY15ecQHUOWbIOvDWvTFy2Ao5fUx
         XhAKLHt4eIE0c945NW4xAU2bP46UzkOe1VIPhxx7/TLvapdFD5LCBhA9ivEG2dyo/kUl
         ZjIA==
X-Gm-Message-State: AOAM530tsbW/+naZ6FyCiP04qz7Q99CxTPkbqv5uKLN/UsM2XmlM5j/4
        R3HYuzJkpGCFno83HJYDgWoRIw==
X-Google-Smtp-Source: ABdhPJx/5DcfB27JAL/c3SFwGw95qhIKfr9dnkeTlJXy/0XzMHLMuVPklbRvet5f9iLDNbeJ3PiIXQ==
X-Received: by 2002:a17:902:8f83:: with SMTP id z3mr10333002plo.203.1592623824777;
        Fri, 19 Jun 2020 20:30:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id ev20sm6238855pjb.8.2020.06.19.20.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 20:30:20 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
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
Subject: [PATCH v2 10/16] KVM: PPC: Book3S PR: Remove uninitialized_var() usage
Date:   Fri, 19 Jun 2020 20:30:01 -0700
Message-Id: <20200620033007.1444705-11-keescook@chromium.org>
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
to removing[2] this[3] macro[4], just remove this variable since it was
actually unused:

arch/powerpc/kvm/book3s_pr.c:1832:16: warning: unused variable 'vrsave' [-Wunused-variable]
        unsigned long vrsave;
                      ^

[1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
[2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
[3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
[4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/

Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Fixes: f05ed4d56e9c ("KVM: PPC: Split out code from book3s.c into book3s_pr.c")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/kvm/book3s_pr.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index ef54f917bdaf..ed12dfbf9bb5 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -1828,9 +1828,6 @@ static int kvmppc_vcpu_run_pr(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
 	int ret;
-#ifdef CONFIG_ALTIVEC
-	unsigned long uninitialized_var(vrsave);
-#endif
 
 	/* Check if we can run the vcpu at all */
 	if (!vcpu->arch.sane) {
-- 
2.25.1

