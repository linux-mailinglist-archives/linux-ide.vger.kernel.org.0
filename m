Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 442016211A9
	for <lists+linux-ide@lfdr.de>; Tue,  8 Nov 2022 13:59:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234270AbiKHM7x (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 8 Nov 2022 07:59:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234301AbiKHM7w (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 8 Nov 2022 07:59:52 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16EF013F85
        for <linux-ide@vger.kernel.org>; Tue,  8 Nov 2022 04:59:52 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id s196so13337130pgs.3
        for <linux-ide@vger.kernel.org>; Tue, 08 Nov 2022 04:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=PuL4id0Ee4nntW0vbS0H4AjKBeiCYYr+cMaKKZzabnxBL62FPJ4oVFnkJkGNUWM66+
         qqccxkzBzxApVkwUN6YdGOrBDMdVTLDCvdvjr61CogbFmRmJW4Pnrq2s3neYM6JmLdTA
         3GHceneNlV0XvsEPNHt1z2bJx8zWcVWbo12t8o/tv0XUbdZMsJ6fNACIf+4P+RlU2STc
         hCxS4XR9HziqH1Kl/7qw0OGdh9fBJgVOh/fuH6f6Wb16BOPpYRbFzU1l4+ier0g1/XLf
         wH8EQmbOQriCZQyEvCKniKx6mv1aQcNk3Z7N1XU0HvEXrjvGK9VSrY5F0jSNpn9WYe0Y
         8UJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=nhGvHRjHTPUKUr8YbwXWxqetcJ1+zn+5nSdT2Mlq694cgu2wqyU57xUM/XJO+nCLAt
         Bqi61q3TaISLYxsxJUFfoTeEx5iyaPSqUdmqGyNkdjDx8bpyQRc4T4wdn/MP0UIK6Zkp
         Zx893O8BGXCQxOIAxUOcWd2EK25tsSVOlv1idIznH0+bXc82s66gSWIkigAvbZtfQ0QB
         izYDBemDL+plxILMwj+p4xoomNYW8gNweHhmJVHPLLLyOTyUi1hscbL+bzBoGMiA2vb7
         //Hf8J+RTShegoPwBND8mbwCQdcaOLkBft1FxkAmwoNm0ZVQMXkHGhrdT5FMBeacvk3F
         Z0rw==
X-Gm-Message-State: ACrzQf2cbb+lDAha7Ynl5EP6VlCljXgp5xReGImz3hGAqAaqKZpdAM+K
        yNafvvvfZB6izda7m08IlRuMzxh15V+Ga/Un9k8=
X-Google-Smtp-Source: AMsMyM7xneEAjUFNzfV+lfP5wspYRPaOr7yn2n8afaO0b/Z9p5lpX9POHnPw1h0o0NCEMA+f/geMtfIGuqZIcVKMdZU=
X-Received: by 2002:a63:1849:0:b0:43c:8346:57f7 with SMTP id
 9-20020a631849000000b0043c834657f7mr46994932pgy.222.1667912391409; Tue, 08
 Nov 2022 04:59:51 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7022:6296:b0:46:e088:36ba with HTTP; Tue, 8 Nov 2022
 04:59:50 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham " <kojofofone@gmail.com>
Date:   Tue, 8 Nov 2022 12:59:50 +0000
Message-ID: <CAPFeOzoEm+R0NR0Opj9nsyTYNSFvmMRadG0BLrA9CxVPoTf0qQ@mail.gmail.com>
Subject: Greeting
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
