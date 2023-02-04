Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9EE368A9F8
	for <lists+linux-ide@lfdr.de>; Sat,  4 Feb 2023 14:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbjBDNUo (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 4 Feb 2023 08:20:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233034AbjBDNUn (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 4 Feb 2023 08:20:43 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3CDB2E808
        for <linux-ide@vger.kernel.org>; Sat,  4 Feb 2023 05:20:38 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bi36so11561773lfb.8
        for <linux-ide@vger.kernel.org>; Sat, 04 Feb 2023 05:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1yRipnQwdG9ZVcAtJhlrN7pDVZmxkTajuArBHYu8ek0=;
        b=FysU3rVTiHpQzR64sNOSTvw4dUhJsCv9Jky/1HiT54l7++gVfNPpsgyEaVBnZl8LUo
         dl6tD+v/aZPxOhOO9Yuu9VIF4WxqFbt6WOUBJDTDYN8gqBVe5850DMSogc44GhHs3QVK
         kE5lNd+GaujiXEdzbnKdxxLuzimuQZ5xolD3pbabSQayHYSnxMryIblewMc1F9yAWdwr
         8JQ6J80ZG3+bATobLyjqUtYFZgK5QH6tRx3EGwkcSVA02MhRzcfoybixcW0owcGLkE3G
         BqccHwb/yGd5s761fN0JNSLdpVUsUInyasVZtYAyuOjq7OlYTxN7O7/GgwcTJfIajlPc
         0KCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yRipnQwdG9ZVcAtJhlrN7pDVZmxkTajuArBHYu8ek0=;
        b=5r9kqIAT54zTFXfkowNxUyfU3Se34J4xFWyBR5bgLiQ6Ae5pfwlmUwSweyvRbh8YvB
         SYGB4KiibsU4Dd9hm4uGNMqM85RrLF5Ymt3y6awiuct+/9a9qI45geD057e7PZCrKfJC
         tTL/3VCFM29q0rmi6X9DMeIkVenz1RNOph1nxFX4iYpJ/+LVOkeqE3mMXbntHTG+HZdh
         UQANx6T7nPFx4E2Xt0CBLczTfPYJ21GmhGFuvsA++4qw9JgqPhH0rB554yec6lei+0L8
         li4rA7FHqERN+wzg0i/J8QdWgm8Ga/JuLU2ciBj8nHRv8UdQNtRCJ5KkgHDwrgcoQTNv
         KcQA==
X-Gm-Message-State: AO0yUKXWHrEXnEmO1k1rIpBaanwFtSglbdunqExa9/3B040LbqKo/AFo
        8Y205XP3JQziWq4VGWcx3GbUKj+PaVdQ/ZUF7rs=
X-Google-Smtp-Source: AK7set8FYQA1eff5uFQlHWQyqbqcplLOC8rPP8xpAQee0x8CIIwDvCGPIhK+niUmr/JiSlC9WCKFe2BvxDzNIwFpi/4=
X-Received: by 2002:a05:6512:14f:b0:4b5:8298:5861 with SMTP id
 m15-20020a056512014f00b004b582985861mr2396944lfo.252.1675516837038; Sat, 04
 Feb 2023 05:20:37 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:a98a:0:0:0:0:0 with HTTP; Sat, 4 Feb 2023 05:20:36 -0800 (PST)
Reply-To: georgebrown0004@gmail.com
From:   george brown <gh727532@gmail.com>
Date:   Sat, 4 Feb 2023 14:20:36 +0100
Message-ID: <CAGrgnCyeE-nwx88uLCpuV0Pp5OyH_xKo_Z0ttkchJLGxZPjAHA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:130 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [georgebrown0004[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [gh727532[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [gh727532[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hallo

Mijn naam is George Brown. Ik ben advocaat van beroep. Ik wil je aanbieden
de nabestaanden van mijn cli=C3=ABnt. U erft de som van ($ 8,5 miljoen)
dollars die mijn cli=C3=ABnt voor zijn dood op de bank heeft achtergelaten.

Mijn cli=C3=ABnt is een burger van uw land die samen met zijn vrouw omkwam
bij een auto-ongeluk
en enige zoon. Ik heb recht op 50% van het totale fonds en 50%
wees voor jou.
Neem hier contact op met mijn priv=C3=A9-e-mail voor meer informatie:
georgebrown0004@gmail.com

Bij voorbaat hartelijk dank,
Meneer George Brown,
