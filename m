Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4E7D2020B5
	for <lists+linux-ide@lfdr.de>; Sat, 20 Jun 2020 05:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387514AbgFTDc2 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 19 Jun 2020 23:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733114AbgFTDbH (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 19 Jun 2020 23:31:07 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A849C061799
        for <linux-ide@vger.kernel.org>; Fri, 19 Jun 2020 20:30:26 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id d6so5285859pjs.3
        for <linux-ide@vger.kernel.org>; Fri, 19 Jun 2020 20:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I53/n5ydJ9yzbnxtmoDriMZB814XLzfic4sznaesD40=;
        b=Rutn4YPkcmqXLdEaPjRwH0N9ohbI/CzpH9cf5y9vG4nYpAw1nQr5aBkVvJ5iC9ui6q
         cLu5pHW/44+v6JlX39sxqMfNukxEy6S08EOmpnYgt90MBK4lvmz1Qm66oVfcHJZShxiQ
         h7SFiaUV2yA5KII9Om+c9u+JdAg6xNa2K9JLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I53/n5ydJ9yzbnxtmoDriMZB814XLzfic4sznaesD40=;
        b=krbvYVVq2EVNIC4Gj+imn5pQ2xsnz/ltBFloYP9X+JpH+EQg4XNhB9pkisOdqMreRs
         ntUGgCWhww9VBNnkwN1U8fJy1DdX9HwtDoJt7vmOuJ6i+KnMbpXpg0XHzQrtiAdhq3fL
         T6F5lrNSVzUUu+BJo42yMsxEDVxrzZHWk4ShWRY1gl64+cc3f3C5yDrIsv1rpUfbfDE/
         umdSvT7Xj4GaS1ODF8/o7K4+VtC//dvb6jApeRLkg11+F3DeLksv3pB6dgX9Rs+qi95x
         fJpP9KO7IUt7E14VZjpVSG7GfSNPscE5cZJFGMQZLw8lj40nAieZtY9MFQ7t0taVdDP2
         3LEA==
X-Gm-Message-State: AOAM5319tP9htjTfy3Xn8d6Tryzu7HCGG0lL8qvOG1iK0S0+IUlbL9hI
        Vx4JauhZH0cgCOs5N99iojd+gg==
X-Google-Smtp-Source: ABdhPJzDpg8kRLeVgrehMBlr+1UwoiUH6XXfWvLx404+vNnybEp9T2mmhskRjq6n4U4EQRsEK9B3AQ==
X-Received: by 2002:a17:902:ff06:: with SMTP id f6mr10351618plj.22.1592623826055;
        Fri, 19 Jun 2020 20:30:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 17sm7373750pfn.19.2020.06.19.20.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 20:30:20 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>, Jason Yan <yanaijie@huawei.com>,
        Chao Yu <yuchao0@huawei.com>,
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
Subject: [PATCH v2 12/16] f2fs: Eliminate usage of uninitialized_var() macro
Date:   Fri, 19 Jun 2020 20:30:03 -0700
Message-Id: <20200620033007.1444705-13-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200620033007.1444705-1-keescook@chromium.org>
References: <20200620033007.1444705-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Jason Yan <yanaijie@huawei.com>

This is an effort to eliminate the uninitialized_var() macro[1].

The use of this macro is the wrong solution because it forces off ANY
analysis by the compiler for a given variable. It even masks "unused
variable" warnings.

Quoted from Linus[2]:

"It's a horrible thing to use, in that it adds extra cruft to the
source code, and then shuts up a compiler warning (even the _reliable_
warnings from gcc)."

Fix it by remove this variable since it is not needed at all.

[1] https://github.com/KSPP/linux/issues/81
[2] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/

Suggested-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Link: https://lore.kernel.org/r/20200615085132.166470-1-yanaijie@huawei.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/f2fs/data.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 326c63879ddc..3753ba06531b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2856,7 +2856,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	};
 #endif
 	int nr_pages;
-	pgoff_t uninitialized_var(writeback_index);
 	pgoff_t index;
 	pgoff_t end;		/* Inclusive */
 	pgoff_t done_index;
@@ -2875,8 +2874,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 		clear_inode_flag(mapping->host, FI_HOT_DATA);
 
 	if (wbc->range_cyclic) {
-		writeback_index = mapping->writeback_index; /* prev offset */
-		index = writeback_index;
+		index = mapping->writeback_index; /* prev offset */
 		end = -1;
 	} else {
 		index = wbc->range_start >> PAGE_SHIFT;
-- 
2.25.1

