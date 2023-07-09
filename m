Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8006674C13D
	for <lists+linux-ide@lfdr.de>; Sun,  9 Jul 2023 08:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233206AbjGIGQp (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 9 Jul 2023 02:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233195AbjGIGQp (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 9 Jul 2023 02:16:45 -0400
Received: from mail-yw1-x1143.google.com (mail-yw1-x1143.google.com [IPv6:2607:f8b0:4864:20::1143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4D6E50
        for <linux-ide@vger.kernel.org>; Sat,  8 Jul 2023 23:16:43 -0700 (PDT)
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-5701e8f2b79so42754227b3.0
        for <linux-ide@vger.kernel.org>; Sat, 08 Jul 2023 23:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688883402; x=1691475402;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmlwvXEoimVTfsyyyYai0GQlqo3zzXGhdH5Gfvmx5TY=;
        b=Bp5MLvKPSk5zMbAC/lttAdgyhC6wqBrx20Zr6vebn+/0U+fjSDRgD/l9Z5tUmJ67TZ
         vtzfcWzCq9eFkMP1wm+iNthhOOTdTMAUfemY994pc1Vcsk4/nHlq8vIM1LCGXMdPOrUB
         U21MpugVWLPMpmOSYigcx5pHCVVItOA+ZqUaxPGgfysELso1+wGqj5Wnp62wcEm71XOm
         jOBl38WhtzxvBwD6cak1rDdOdkhOBhT4JC7yK2jyZ/IDmbDwPOivr0BGiSqOgEtQettM
         pmH+KLXC9g90nw9aDDvE8KlonfY/glvE4j5x+XvvndwhZJNCtombGtVRls7GTt5eWP3J
         39bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688883402; x=1691475402;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmlwvXEoimVTfsyyyYai0GQlqo3zzXGhdH5Gfvmx5TY=;
        b=Qz9XBXxDnLOewTzDeJgHRHPBf7JTnT+TSOsyuZSHMU1OMIAzO02IiCaYJxsd/wS152
         HIFhdJIB1HNyWcbcH8K1PZsUglEzs/P4sg/+1QcqhtDkj1HMBFDASgUFN+uZ9XNHtm8+
         K4sgeKQvL+QsUulDWYBqoPROwlj0L4zvHZ74nqvCMcOem1KHvkdiajbkM4aoWXq8LAbz
         WhDkyj9ME39p29W9bsKv2s/bBaWm2FbjCUtHeh246SwAIcph6knBsp+KgYXJlgG321fx
         tOxEYwU4UyRiboUvmKCrwWCvDmM6N7R/ZWEeYbymh4/QTA1h0uBZBUpdgtObDNW6SPd4
         xF7w==
X-Gm-Message-State: ABy/qLYiNt/rKIRGE8Fe2gbiSSxPELovM6ev/teg1dYStR3GZF+lmEfI
        gDQ3Ff7KMw+WVMM26ymtYJ9S05CqTY7GA2M1/UY=
X-Google-Smtp-Source: APBJJlHDyeGMLRJh1TqEFXuQL5gNHvL979NAqymoRu2852sJo5Wc5PVm71x+nJyUxH/c+0ShKcWO/9pWFC+1aec0z8Q=
X-Received: by 2002:a81:5f83:0:b0:576:b52d:4946 with SMTP id
 t125-20020a815f83000000b00576b52d4946mr9750194ywb.30.1688883402409; Sat, 08
 Jul 2023 23:16:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:6211:b0:35e:b32a:1b89 with HTTP; Sat, 8 Jul 2023
 23:16:40 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <coulibalynina15@gmail.com>
Date:   Sun, 9 Jul 2023 06:16:40 +0000
Message-ID: <CA+8Vp3Va6YuVNky0j3E1UYrYwr56aeg2aKtMxvgOUsLM-3zVTw@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Dear,

Please grant me the permission to share important discussion with you.
I am looking forward to hearing from you at your earliest convenience.

Best Regards.

Mrs. Nina Coulibaly
