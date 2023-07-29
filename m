Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12A34767C34
	for <lists+linux-ide@lfdr.de>; Sat, 29 Jul 2023 06:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbjG2Ezg (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 29 Jul 2023 00:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbjG2Ezf (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 29 Jul 2023 00:55:35 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C08449E0
        for <linux-ide@vger.kernel.org>; Fri, 28 Jul 2023 21:55:34 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99bcd6c0282so385802466b.1
        for <linux-ide@vger.kernel.org>; Fri, 28 Jul 2023 21:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690606533; x=1691211333;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RE5l1VpxCufAhFhvUtJmOdSBkyXi7tvoVHorDEIVEKk=;
        b=nxd6zkfhRa77k/sVEhnV9dll8oNuxMxY0QjqxWyiNvbQhxby7vUsDAAGI9GZuaXRQX
         /XxSTurUjetIvhkboz3T/QhdQzMnWHwQK3d+ZPXkI3CmGkAhNcZh6eg/9aEK7/oixX8u
         Zmv98XBTxAwMaoxsW7LsdvAQU+uBg2eJK45woj8WewwW24ocJeeLTovYEcZSiaas39NO
         Ph6RSszsjSVpyC3drSnjf4MYL9FzPlKNIed+vNcELJdU/4g6eOAPdMA9Ym5xwh1Y7kPS
         3DDAvJJ3GowOh7CE7pfIp6h7/azpsDwmxWgFzihEPDaAwFeYOJy/L38sWIFJddRzIJob
         Rlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690606533; x=1691211333;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RE5l1VpxCufAhFhvUtJmOdSBkyXi7tvoVHorDEIVEKk=;
        b=iXw/23YiAjrLq4k0wk/uZe/UaVEgL+V6yv2SWoD7pP8fq8FdWB4kvn4eJyrAmisaM8
         NI1h+Tg28BKCbRXO0H2QFwBtwkZul4Kd/Qdk4MSxd97+BiZJhXB6z61WXm59h86ho+E4
         9o5tlmYRlkhUzvDUO00EOQzYS5wOyQTdjd8TOrS+RVPXdJhgtllSaToOhhJ6ceM8LOrS
         C8v0LPdy/ymWai5Ipig+5vwNyFsxA1IofdUa9P2m3/RKXbafkRM1XaMkXWbnmlu0CRyB
         o8UZs2llqLZMjnajpf29Je+jJ9LTNqEXnexFhbBsq+joym0/V9mIxMY2kE08oylXc15g
         UvVg==
X-Gm-Message-State: ABy/qLbDLzqddBhQ6NMQTW/b8q2d5MTCexrNUcheAuh0nxnhmEBiLnbQ
        w51FhyP5M4nr06d6Q0S+3KKpWcEx9uRQVZLLAHc=
X-Google-Smtp-Source: APBJJlHUUa4spVV0ZJyciOkfr4OHYfgfO/iKkzi1vIWABHPQ1E2QNw8x6qCNgIqNPx2M8FQZqqOqo9SiUSw5JHWd8wE=
X-Received: by 2002:a17:907:7854:b0:957:2e48:5657 with SMTP id
 lb20-20020a170907785400b009572e485657mr1180515ejc.68.1690606532423; Fri, 28
 Jul 2023 21:55:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6f02:431a:b0:54:11f1:1129 with HTTP; Fri, 28 Jul 2023
 21:55:31 -0700 (PDT)
Reply-To: bintu37999@gmail.com
From:   BINTU FELICIA <bintu561@gmail.com>
Date:   Sat, 29 Jul 2023 05:55:31 +0100
Message-ID: <CA+j4OhMtq3Dnmgv8yhPOHNX_OxGMYShx34ia0Fh8Tx8vbaKXpQ@mail.gmail.com>
Subject: HELLO,.....
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

How are you today? I hope you are fine. My name is Miss
Bintu Felicia . l am single looking for honest and nice
person whom i can partner with . I don't care about
your color, ethnicity, Status or Sex. Upon your reply to
this mail I will tell you more about myself and send you
more of my picture .I am sending you this beautiful mail,
with a wish for much happiness.

Warm regards,

Felicia Bintu
