Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A118F4E60C5
	for <lists+linux-ide@lfdr.de>; Thu, 24 Mar 2022 09:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242544AbiCXJA6 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 24 Mar 2022 05:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237104AbiCXJA4 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 24 Mar 2022 05:00:56 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26AC4972E1
        for <linux-ide@vger.kernel.org>; Thu, 24 Mar 2022 01:59:24 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id m84so2198043vke.1
        for <linux-ide@vger.kernel.org>; Thu, 24 Mar 2022 01:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=13+rXwGRPr4a9k2vxA2bU+fJEZZ58Un4R7s1pCG1lS8=;
        b=nHrP/fS6I088f7oesNyk1sFd+eaRJHGZAgv8PQSu59YuaPQqCilWUHfZgMjJ7q1Wkw
         Pq+oFlQvzu4rutQOOBQ++FrtBNJVEPxe+PzS2BE2vq8t3NvXQ7qJiyKOoKEETeKWabHJ
         cpk0/NBgw5V8xxr6watrkq8a/cgZqKTov9Wn/0SEjqWD7+uJJjVdrFlYreqRji+zM6+i
         C9ux4eu6sLAxIvN6W0XmV8y6jo6GCc1scNkBvZJqWV4MSDvLS4tmrgUtURdVQlF+vf1o
         DbHzahftTNscSeC2h5y4ZLAsz02AASxQQgpo2IgvnmzrHJFIjjWm45KDpOn3dv56/9ff
         UTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=13+rXwGRPr4a9k2vxA2bU+fJEZZ58Un4R7s1pCG1lS8=;
        b=DOXAJR8IaVLu/MBdOKioYHjefjpPewpvlzUyjfRQVKiTgoP/lCSQszVzdYFNGo5Hui
         x/Sn0VmHk36KcrNsr0iIPj0vmp47nmaz5UGod2M69t9wW/z63I3juajJkQeyKgFo0fxf
         O1VefE29w+4OqiGVNsVQozO1caqLSZ+XTdZbv8bVIyR87JHVEQFqgoiPEbFZqq3fOteO
         VMXuC17azPBLB6UCqarxbCYMk+KX1KvkNxjjc1Y2yjZIul3JskM8KnfrhZXtCibPYYCa
         Hl80dQNrNIYkgZeYOClaFRtDIAHs1iX3USPvSr/v+fVmPCx/C7hD1xAsNud6oaT7Rwgs
         Qhhg==
X-Gm-Message-State: AOAM532DMo8ZYfkpKhZlqc72NYnNHFy6FuUBs2wS6NWU80lZkExeALr+
        DwoFoyE2cxlVkFnQtdJeMF/CqZ9V5s8ewihw86M=
X-Google-Smtp-Source: ABdhPJzFd9+dym7zQGLz448YKA2IBQfqFe5zGv3Uj8UJ1Z1ftVQbUdOmLF3o2sr/iyq9DOqwn9GVyNFabpbw0LxfqtI=
X-Received: by 2002:a1f:da47:0:b0:33f:1398:210e with SMTP id
 r68-20020a1fda47000000b0033f1398210emr2145025vkg.12.1648112363125; Thu, 24
 Mar 2022 01:59:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:c6ad:0:b0:29e:8e5a:2597 with HTTP; Thu, 24 Mar 2022
 01:59:22 -0700 (PDT)
Reply-To: ozkansahin.gbbva@gmail.com
From:   OZKAN SAHIN <jacobbarney6@gmail.com>
Date:   Thu, 24 Mar 2022 11:59:22 +0300
Message-ID: <CAOPi97ZGfVi_1Rbm1a3s4W9MzGzqeObYcz5v+PN2AhW0sCD2PQ@mail.gmail.com>
Subject: Hello Friend
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:a2e listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4970]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [jacobbarney6[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [jacobbarney6[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Greetings,
I'm  Ozkan Sahin, and I work as a Financial Management Consultant. I'm
thrilled to approach you and present you with a lucrative offer I've
prepared. If you're interested in learning more, Please reply as soon
as possible.

Please contact me at (ozkansahin.gbbva@gmail.com).
Respectfully,
Ozkan Sahin
Financial Management Consultant
