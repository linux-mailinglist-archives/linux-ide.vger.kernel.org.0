Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8A8B660B35
	for <lists+linux-ide@lfdr.de>; Sat,  7 Jan 2023 02:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236635AbjAGBEQ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 6 Jan 2023 20:04:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234934AbjAGBEP (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 6 Jan 2023 20:04:15 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1017FEF1
        for <linux-ide@vger.kernel.org>; Fri,  6 Jan 2023 17:04:14 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id d127so2456953oif.12
        for <linux-ide@vger.kernel.org>; Fri, 06 Jan 2023 17:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C56Q+YV0i1VwzqpPgsaApjf/2tDIDNvnJyLhwVpmM08=;
        b=OiXpkKnc/0jo9wqIi9+tabEGgtpXkeHgd3n0ZLirLN6lgXkkvGNu+vSmojvpCSS2El
         2mDWztPonjSpcCFB30WVgLNyW/ppuJjJZJFyyrcXSl2mAo8qHtDCVCicfqx9yABfRjT2
         3F9FyaIX2ofvKEFdglxC9MSKkczk1Wx/O4iHlMNFXuI2iEwBEJkLP8u3L0sXqJWGU4kt
         EBwGUOTnIgWLyaz4/UMtO6MZyZ1EVFtQrIGOQQHx6h/w8lV/HGumk+LqbEAL0pErNTfO
         t5nzXmpdHy+5eDt1Wa0V9n/Xb73JOzJrscX022c4gGW7IUAGjkkPdOK9Ytqk98aaYcKc
         n+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C56Q+YV0i1VwzqpPgsaApjf/2tDIDNvnJyLhwVpmM08=;
        b=EvyiC9tlrYJHwypUMpN6ygaFflb/r67czXFEftTE6RaF+noFJTciRXHpaa6iqI9vW2
         qimO6EqpBNKk+Eye6A2dXOHvItOprAl4sCPOabAUw/4y40hVCQYAhWOlEXSN3QoOA6Wj
         AfoF4BJk364ZFl2wAqhmnN4CVuoFMpwq5FMdVI75qtOcQFv/3o1S1JAyrdbsY6xuVlxq
         C699+tBrYdoXgFYA1S2an0leI7nxAlhPvhE5VmZHfIv6rEL73DBxxDVNDn0sVTOFyzoQ
         dnbyNl79S1UtOmgCjHKao9d10faELYHwR0aVLvdSPhG+uXcA40s2C8hPnsePt+Nm6ryv
         k78Q==
X-Gm-Message-State: AFqh2kpODpmAJouB9JPy3YIJV5k3l5mSg2fJPfywonGZBQ19bAWDfKFW
        XXUwnb+wLR5DHl1jYC3pewNYrtaY3Z0ZLHP/gl8=
X-Google-Smtp-Source: AMrXdXtX77UE9BDQKd780+chy4lCFNbChI/pyCyWLwtJl7pAKIZ+B3mXEdcySksw9hd1YcsSttgDIXkwu4TLUMB6mjg=
X-Received: by 2002:aca:110e:0:b0:363:a643:4244 with SMTP id
 14-20020aca110e000000b00363a6434244mr1780218oir.222.1673053454004; Fri, 06
 Jan 2023 17:04:14 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6808:2387:0:0:0:0 with HTTP; Fri, 6 Jan 2023 17:04:13
 -0800 (PST)
Reply-To: jamesaissy13@gmail.com
From:   James AISSY <samueltia200@gmail.com>
Date:   Fri, 6 Jan 2023 17:04:13 -0800
Message-ID: <CAOD2y7=AOvOc3MaCr8WjsJhkNLpwwX6V91+wn7yg-0dYPiegMg@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hello My Dear,

I hope this message finds you in good Health.

My name is Mr. James AISSY. I am looking for a partner who is willing to
team up with me for potential investment opportunities. I shall provide the
FUND for the investment, and upon your acknowledgment of receiving this
Message I will therefore enlighten you with the Full Details of my
investment proposal.

I'm awaiting your Response.

My regards,
Mr. James AISSY.
