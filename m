Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C12E5281F3
	for <lists+linux-ide@lfdr.de>; Mon, 16 May 2022 12:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235599AbiEPKZN (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 16 May 2022 06:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242797AbiEPKZE (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 16 May 2022 06:25:04 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B125911168
        for <linux-ide@vger.kernel.org>; Mon, 16 May 2022 03:24:52 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id l16so18039565oil.6
        for <linux-ide@vger.kernel.org>; Mon, 16 May 2022 03:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=a2tnZgq+EVjyw+rOdY1r6GsOsQaQP/Lxu/X2gn6ZDPs=;
        b=cb0gdPs0Aln8Y3T1wNUilKJE4d8bKpIRY+e2YmwlWPaWzOF+lZrl4YSCAngrloEohB
         pPyfuu0FWZvggtdgFPCRTCrcvLxZ9er2dEXOl/hNdXAqOItq/U3lXg/lBB8E3/mMrqLx
         7rYbW6fK+b8ttBWreFJWZQ5URFegtjexPT+ulYE0dBleLw6ERHb4BpEAdyFqI98+SNzu
         pIwrgYU3iY5bkgeDdQ9dQNpkXR9MFf8SFaZtEQm4DeUSb81+vY517I9L2Psgeva/FMRj
         XXvZj29DPjVhcdQr2JfrrpzpGgtj5e3hDLkHweo7YzNbRFehSj4z8wFktPgpKbyrCado
         /gng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=a2tnZgq+EVjyw+rOdY1r6GsOsQaQP/Lxu/X2gn6ZDPs=;
        b=6ecW1Nx5AqNuarDm5uBJS6RRyI4f/eGcRoO0RD/DZLmajcJeeuVjwbZXzezGpXkplW
         SHa2xnqFSBh5OzZ25ah9awslXhCplXVLaRILeYlcxUVIzx7HIMz0xpw8NlTAbgw8vXRK
         y1A2l3J+Aw1fAogiECfWPHrTpGi9KyH9s/5Ip8xpkzR9Zmp8rpxzSWCWIZmDSNTGPa45
         V9ucT03KpK9P352qgU3ZtfzV0JA09OpFa2GKm+9zkjcvX/Ac2lxR+Qvx2HdbCbVT8n7m
         ccSYD1VgO3dZdyQiJD/sHllg/tdIMfn2ZbW/HB16hLUKJvuWo11E8Ri0VBH4rtV8iZFw
         IOAw==
X-Gm-Message-State: AOAM532bBHqlTaZycryJDm5qoLIeo0wyDovP++TDnXBOr9KoFnXXyUTv
        V0X9RbBAH+7ZxYmPB1/tJbmlXof94Sd0KnbCNXU=
X-Google-Smtp-Source: ABdhPJxmBab7o3mU2rke48DYUCmw2MVRmUqNU5TkARViAjsx8KcXz006ZigHYLtEFHuBy0mbo1q6XlbnLOgKcXzbtgg=
X-Received: by 2002:a05:6808:3091:b0:326:cd17:fed4 with SMTP id
 bl17-20020a056808309100b00326cd17fed4mr13282306oib.51.1652696692027; Mon, 16
 May 2022 03:24:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6838:6c25:0:0:0:0 with HTTP; Mon, 16 May 2022 03:24:51
 -0700 (PDT)
Reply-To: fundsrecoverycommittee@aol.com
From:   Geoffrey Bristol - FUNDS RECOVERY COMMITTEE <bfranck976@gmail.com>
Date:   Mon, 16 May 2022 03:24:51 -0700
Message-ID: <CAOXQwByTKsqFujp8F+GmEpen2=Vk617XfGBJ6OSgn05c-i2=0Q@mail.gmail.com>
Subject: COMPENSATION PROGRAM
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:22a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [bfranck976[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [bfranck976[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Dear victim,
										
The United Nations in conjunction with the European
Union,International Monetary Fund and World Bank is offering
compensation to internet fraud/scam victims globally.
If you are interested kindly indicate with your response.

Geoffrey Bristol(Chairman)
FUNDS RECOVERY COMMITTEE.
