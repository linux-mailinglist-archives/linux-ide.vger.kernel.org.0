Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24208535E55
	for <lists+linux-ide@lfdr.de>; Fri, 27 May 2022 12:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349416AbiE0KcX (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 27 May 2022 06:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237635AbiE0KcW (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 27 May 2022 06:32:22 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05061053F1
        for <linux-ide@vger.kernel.org>; Fri, 27 May 2022 03:32:21 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id h75so1204900ybg.4
        for <linux-ide@vger.kernel.org>; Fri, 27 May 2022 03:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=gMRL2ChFV1c1fJH6+lzMvi+AnpLvf8Jv1voAqTadcaU=;
        b=HCBTEMsB47s25vRhGTGCwdBYlzlH7poF8SpUHY7eL2f8EUxhufzvn5Z7C80h/gulXZ
         0hnGmm7dg/oYEwGItvBxYeqUt9RmnEp+r2Hq/Vn/+klI+S5MbfpdDZpNuTq1cDq3oMc+
         5oaYbEGmGvsMGSCK5rOHK9ukoLvE45xxQfk8WSlexlF0LrGxKeZqHCcEu+qPnku+xz/7
         i0PL2ZhP7wGm0e2Q7PaD/I6fLaYog1n2wgb5Cb6c7x+Gmxbs7hgYJ7NBPVLpmtFykLA8
         qLxvKdn9i6XVpNgAm7Aa4/i7KBfc0/cao23m4nQ+gva7q8mOF/bT2l+SCYznelEKXHL6
         b4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=gMRL2ChFV1c1fJH6+lzMvi+AnpLvf8Jv1voAqTadcaU=;
        b=ynGEpUlXtLouSu2IJfGPirtawQgPT5B8k2rNjHT2Si1n7vbhsQmsZIRvApNT5aBrMm
         hDRCBZVNWyf7x2P83XDwqcuoDrY8w/NP13jxrn+8cbhsVRoXD7jWdgNzFNNBwWXDMr5d
         fXdfjF/So/7g2KeSEE2fWK1Shtq/SVrHrv5rQWOn17A0VK3ryxoK2Xq/TwVQ5b865JOR
         6gJasi7sR3E7IXUPX0sH7xgJ6nE+d4zpWSCrZt7jZFbAjUWWcCuYeyd9rR6LI4vmamZD
         211bezuQeLOd4JlwuXCEsIYkHHlOqb7bfy2QBIzKWfnQ3BCxmwRHNTdv80HOxUZjUjHr
         HUKQ==
X-Gm-Message-State: AOAM532YkgCdXqGxS5bHbZ60K3MQaiv28rloUrpi+LrOgpugwaq4cryf
        A/fsawJxg6LjWYWsd1VCT2qMB2dj7/xc/x5wIQo=
X-Google-Smtp-Source: ABdhPJzAnbI1qOnSk0otK/jHfjRV38/X2vG9Eadji2mUEuurzdv/92ZxxaSSFreupSJR0sd+v4sAcUcEI9sMViDGiJo=
X-Received: by 2002:a25:e7d0:0:b0:655:22c0:ea08 with SMTP id
 e199-20020a25e7d0000000b0065522c0ea08mr14311281ybh.374.1653647540697; Fri, 27
 May 2022 03:32:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6902:114d:0:0:0:0 with HTTP; Fri, 27 May 2022 03:32:20
 -0700 (PDT)
Reply-To: donaldcurtis3000@gmail.com
From:   Donald Curtis <91474711amele@gmail.com>
Date:   Fri, 27 May 2022 11:32:20 +0100
Message-ID: <CAC=gNW1kALOxoCMdGSFSPm-RHhHN4277TRbKjYuspzE+yt=Rhw@mail.gmail.com>
Subject: Donald
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,FROM_STARTS_WITH_NUMS,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5009]
        *  0.7 FROM_STARTS_WITH_NUMS From: starts with several numbers
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b31 listed in]
        [list.dnswl.org]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [91474711amele[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [donaldcurtis3000[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hello,
I called to know if you received my previous email, reply to me asap.
Donald

Hallo,
Ich habe angerufen, um zu wissen, ob Sie meine vorherige E-Mail
erhalten haben. Antworten Sie mir so schnell wie m=C3=B6glich.
Donald
