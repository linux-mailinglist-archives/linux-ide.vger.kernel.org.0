Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 019CC4E6474
	for <lists+linux-ide@lfdr.de>; Thu, 24 Mar 2022 14:53:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348487AbiCXNyl (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 24 Mar 2022 09:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350663AbiCXNyk (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 24 Mar 2022 09:54:40 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF9738BD
        for <linux-ide@vger.kernel.org>; Thu, 24 Mar 2022 06:53:07 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id qx21so9257471ejb.13
        for <linux-ide@vger.kernel.org>; Thu, 24 Mar 2022 06:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=EnSVDUYpootVmvlEv/j8IqlXisX/SLOnK63+EyOQLj0=;
        b=kcYkosed4N6ESqP9Vvl6t0+AoBMu3jX8QADTqH82LIkSLocvmGz/dTaocWTgEKMKag
         Xl9UaW25n/sjeisosNxVZHSFT/qTGOOMdSHi7WTQDv6ZGRTU7OxNWe6twjC18CMwMu32
         CSGsDstke8uOUC5+bs/6o8o9qmwJsaRrzQsHIuAgooKIytUaQVz7J0FmxBZJK+oMYPY3
         qQrD56hRbUm4ZHKkikKVKyPAdKvImydAzD1P9Nq9hzi4JBn2GdC/7baMIhrCrSHzGrlB
         mjcXyseQ3cpULtLiTjm8YPb9wtqkxIAJXxCOuFyJqZ3JbY2Pt4a17MzrC/N0Y+Z7K2JD
         3xeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=EnSVDUYpootVmvlEv/j8IqlXisX/SLOnK63+EyOQLj0=;
        b=3TVhTYLwhI3s9kI3Rn76kPRuEGoxrTdaVo83Bo4S3ftBFPj3ZoAMDrak5KIm8GAEiK
         oJoVGtJIxIfamCEojpn45gRnV2RaUwbOlqvRvLVbZsNjeZZ/Wc7POBr3AapqHvQMnRCw
         2+Aeh6ytflSuLxCcEQSZy0YAJnkI6WdtK89s4p3wdUx8I5mN0kNiyF5c577tLMGScBwl
         lGcxCm5wFWygueYnlFyv9mhT7yMHTec3aRs4gCJXi/o3yzCrVWrob/p7H5D7Jc1T/KqB
         Fc3EuaFoQj3zSC2ZVlxZg5XSievXS3Xj4Xmr2kegaUWKlQeXJ66JIolMtir7cyeSMro9
         atnA==
X-Gm-Message-State: AOAM532EGuxIngGE83Bhv6ZgvfkjMR5aXyJSkmYnlioq3xih9NkbWj56
        FaWluN4kzfThr2omxilvOh/xqegGTWigqv99GEY=
X-Google-Smtp-Source: ABdhPJw+PzWD9KuAbBHbfBsSu2AiT27qW0G6eTQzh/8gRmTc5fzb4mJTnnjnkz6yJL0T4OpopOLmbWxIGf48UrLC3eU=
X-Received: by 2002:a17:906:2646:b0:6d5:d889:c92b with SMTP id
 i6-20020a170906264600b006d5d889c92bmr6061871ejc.696.1648129985846; Thu, 24
 Mar 2022 06:53:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:70d0:0:0:0:0 with HTTP; Thu, 24 Mar 2022 06:53:05
 -0700 (PDT)
Reply-To: jessicaum734@gmail.com
From:   Jessica U Meir <robertsonkodjo@gmail.com>
Date:   Thu, 24 Mar 2022 13:53:05 +0000
Message-ID: <CANrRSesKjPsCqPQ_JTvKsyRePCqwwfoG9CVdJRR5MefTj=_0zg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

w4luIGlzIMOtcnRhbSBuZWtlZCBlZ3kgZWzFkXrFkSDDvHplbmV0ZXQgMiBuYXBqYSwgZGUgbmVt
IHbDoWxhc3pvbHTDoWwsIG1pw6lydD8NCg==
