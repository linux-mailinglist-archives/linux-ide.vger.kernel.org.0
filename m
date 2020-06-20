Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA18B2020CA
	for <lists+linux-ide@lfdr.de>; Sat, 20 Jun 2020 05:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387606AbgFTDcu (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 19 Jun 2020 23:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732903AbgFTDax (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 19 Jun 2020 23:30:53 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02CDDC0619DD
        for <linux-ide@vger.kernel.org>; Fri, 19 Jun 2020 20:30:24 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x11so4808037plo.7
        for <linux-ide@vger.kernel.org>; Fri, 19 Jun 2020 20:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LXS1lS0MPNgS4WVNAlrLifcWTqk+ZnaP0JF9yck56S4=;
        b=KNzYUO4ep4rSo36cd4JIipsr8ASXyCCE8oRhdqmyCQcuRLJ54mD8w7eqAHCckRiIrw
         zeaxkRx9uGiqPdDalv+zlc8I0e8YcRGOpFBzI5ChxOgtMC4BYU3IZf3IjdWLPyBA6Rj4
         DV1OCfy3eEHniZxll4RRMXN1skYl+SLO+aH1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LXS1lS0MPNgS4WVNAlrLifcWTqk+ZnaP0JF9yck56S4=;
        b=GHQIyfkvfkM3rTbTCqsD36W305OSxtVDowEaTSy9axq+qGk94Gd24nelvLUwK2Cdor
         nP3lnYsSbm9y77Ua+V8wrz9ojCy+e0YRbsdmkHtOrnC9sXEJ4o4tZUWBbKWl6QYiCTkG
         8W79OZFFJVUKecRFRp5vlmnHoJ+dLkzqu75muH7qFEejdG1KsvykA5I3XCTXbrjtp0J8
         Nr+/+5UCQ2aIv/NkjHrcnhYre+ToxVLou9azDgysFqaNMEkOPXE6ynedRDF8Y5RlAZB/
         mYDnC+cSt1n2e0h2QYI8icV2uiXGLYidf6SgXK2DfGptqfaeNX1nNK5DiYuxi2oWxHjR
         jXWw==
X-Gm-Message-State: AOAM533ubZJaLfX4x45UZncZYO6tJGzYldw59WfEIYk3qOBaKnm8KdLU
        hnDmP+f9Yzq6vBSbZdZtAuV85A==
X-Google-Smtp-Source: ABdhPJx80kRDNx563OHfs0qDYxTj+Nz7KdjHEYiCrGu68V9ia3oYlRYDFTGjYW28UCia8fkYF0XLCw==
X-Received: by 2002:a17:90b:50d:: with SMTP id r13mr6472339pjz.94.1592623823547;
        Fri, 19 Jun 2020 20:30:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h8sm7134891pfo.67.2020.06.19.20.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 20:30:20 -0700 (PDT)
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
Subject: [PATCH v2 09/16] clk: spear: Remove uninitialized_var() usage
Date:   Fri, 19 Jun 2020 20:30:00 -0700
Message-Id: <20200620033007.1444705-10-keescook@chromium.org>
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
to removing[2] this[3] macro[4], initialize "i" to zero. The compiler
warning was not a false positive, since clk_pll_set_rate()'s call to
clk_pll_round_rate_index() will always fail (since "prate" is NULL), so
"i" was never being initialized.

[1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
[2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
[3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
[4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/

Fixes: 7d4998f71b29 ("clk: SPEAr: Vco-pll: Fix compilation warning")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/clk/spear/clk-vco-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spear/clk-vco-pll.c b/drivers/clk/spear/clk-vco-pll.c
index c08dec30bfa6..fed194169666 100644
--- a/drivers/clk/spear/clk-vco-pll.c
+++ b/drivers/clk/spear/clk-vco-pll.c
@@ -147,7 +147,7 @@ static int clk_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 	struct clk_pll *pll = to_clk_pll(hw);
 	struct pll_rate_tbl *rtbl = pll->vco->rtbl;
 	unsigned long flags = 0, val;
-	int uninitialized_var(i);
+	int i = 0;
 
 	clk_pll_round_rate_index(hw, drate, NULL, &i);
 
-- 
2.25.1

