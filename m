Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41F8F69775C
	for <lists+linux-ide@lfdr.de>; Wed, 15 Feb 2023 08:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233036AbjBOH2G (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 15 Feb 2023 02:28:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbjBOH2F (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 15 Feb 2023 02:28:05 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 354F115CAF
        for <linux-ide@vger.kernel.org>; Tue, 14 Feb 2023 23:28:05 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id bd35so6996931pfb.6
        for <linux-ide@vger.kernel.org>; Tue, 14 Feb 2023 23:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s+m+ieimh0cjH8hCifDZdO55IxH2JEdT2Rnf6OI7dlg=;
        b=kBfjMuQWTPn/unwjogdeXwGadTHmStsJiX766lJA/mcMgdRrm3j44CozB3k4KDwgPo
         P3+2lQZWqKSW0BBU94gibg0CU0vaYLdtOOVlg5B+TMd30W//bJSNnJP/Tj/K98zWSCSb
         zca7qvBg0FFWAp65nYq3azFJBdc7Q0/lRXj/XIXIPMdBA3x7Pu9Q7vRrjMgPWuUzl9YU
         Uu3XEZ6IWzQTEmRF65PpLTNm7oE2ccqlmY6n9zAnOgXYocMnJ8cs5dznn3b229pih2sH
         DEj5x+/WAm7BYlEl/4NR80vnisWVJgAF69Ea8YFF1H0TSU3Xk9IClW4Gf8n3jNEBE/5H
         swbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s+m+ieimh0cjH8hCifDZdO55IxH2JEdT2Rnf6OI7dlg=;
        b=eFZbMPWtiFmSDj9buvxa9WVwcWILmTgcd2gXhLDLcDY1teW1Gaa6PgG04f81E2mw95
         uJf+l7j0CQ6ydg0OzeoPmVnfxXE/EYTDjeMl/nFoRN9/kYkHmHiIiZcoXm1QomnN6jXZ
         bNQ2FNOkQZpWDWZE7EmXloqkpRmQ62IrpK7/vIP+XLcvRqmhbE3mFeSLFBZvO1bMCG0V
         41cQLEbfTtkH2rFQftuoc29/r5rzku1Z4UMFDFVVhlGwYfURLpRySdGk9ongF7AZAhv9
         fcI45g4FunCqPf9TPlL1+1IXmVAEdvvxQ9Ktvz4gd8YBCsaPzOuCJiYUTMvhO1Bd9smZ
         7YDQ==
X-Gm-Message-State: AO0yUKWVVFYE2KYxPAl5tsuehB/MfrFDni1QfAsUARpJbsmrp17DTbfD
        Hu7LLHzsT3JYsokwpMzUC4WJ3mlkCBvXzqexrxk=
X-Google-Smtp-Source: AK7set/YxxOs2rIhmcGlIPv6Au+f0MBja0FKHU51x/Js2oKbZmkuS+BxzDReVoGpOTTQ8NlqOIcI5xiNSEnNqKRjprE=
X-Received: by 2002:aa7:9ec4:0:b0:592:5ee5:8826 with SMTP id
 r4-20020aa79ec4000000b005925ee58826mr179800pfq.20.1676446084690; Tue, 14 Feb
 2023 23:28:04 -0800 (PST)
MIME-Version: 1.0
Reply-To: mjosde4@gmail.com
Sender: edwardramos051@gmail.com
Received: by 2002:a05:7022:6624:b0:5e:7f8:b96a with HTTP; Tue, 14 Feb 2023
 23:28:04 -0800 (PST)
From:   Galina Lagutina <edwardramos1900@gmail.com>
Date:   Wed, 15 Feb 2023 07:28:04 +0000
X-Google-Sender-Auth: AyR44RgpSkJSI4CAk2cSX6ezWJo
Message-ID: <CACvhiJwm4uD_g2jgp9-ERA0cqA0zCZBkVQytLJLszrbqXE_rmQ@mail.gmail.com>
Subject: Hello again,,,
To:     edwardramos051 <edwardramos051@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.4 required=5.0 tests=BAYES_99,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MILLION_USD,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:432 listed in]
        [list.dnswl.org]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 0.9988]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mjosde4[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [edwardramos1900[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [edwardramos051[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  1.6 MILLION_USD BODY: Talks about millions of dollars
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Good day, I am Galina Lagutina, an Investor and Deputy Chairman-Mgmt
Board of Gazprom Pao, Russian Federation. In view of the very severe
effects of current economic sanctions imposed on Russia by a number of
countries led by the United States and some European Union Member
States, I ask for your consent to help receive and invest a total of
Twenty Million United State Dollars held with a financial institution
in Canada to avoid a possible confiscation by the US Government.
Contact me directly at (mjosde4@gmail.com) for more details. Kind
Regards, Galina Lagutina.
