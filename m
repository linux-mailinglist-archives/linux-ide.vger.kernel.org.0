Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB894C56B9
	for <lists+linux-ide@lfdr.de>; Sat, 26 Feb 2022 16:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbiBZQAQ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 26 Feb 2022 11:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232265AbiBZQAP (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 26 Feb 2022 11:00:15 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC2C179260
        for <linux-ide@vger.kernel.org>; Sat, 26 Feb 2022 07:59:41 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-2d07ae0b1c4so64324567b3.11
        for <linux-ide@vger.kernel.org>; Sat, 26 Feb 2022 07:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=l2OpVPLDEftIK8Jk3Df6zj/LbbKQ/cX2jfsjP5X/kLc7+3V75JnEWN49Ul3yus2k0/
         KGew9GhNHySRFKfIaaM142iXSMdcfM8OW570svrvXLWiEkFsnA5G9BSluMpCVvehvkxY
         1smDoab9t4r7XqRLRkWq8XL0DHDuSi4mXjcCwwZGsGHWKn5wfwY7wvgGZ6LvFEypFsD9
         vYOJ7xL8QymjEnRBwinTLPOisWmS7l/kzDntJPtctQ13ih53vcZXG99LrelDJEw3//Zj
         QbKuNMmoLeEU73EW8NXrMIXhRqRbxwFUwTkMMNCccLJlYHgFePB/YPzESkjyMd6h2Otb
         n+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=c3RqascQL6pJJzExZwHCGvTZASAE01hWNLU/NRhNy3+3QYIMua7uBalq6vi6m4Okku
         Pboc3SVYyqsVjwgfXu4AwHY6sRtHezIjPwVI6JwEhjDsn+86qHi5oEsFqQ4+2Kap2hWy
         iGWTl2V4I/lJO9rWkowKZrPHpD7jX6kcXqUeVgYFYMxNNZu36Jcm8ffnoCiWbhmiAYAo
         HjxF2vpmKwitQeHpj+WdaijBfpjla8aWSJhVAjlBmkSEt3QnK+l4hU0066UjM+t9LW5y
         AzUzSXx7xZfqbvBG6TYPyDWIRjXWPg5+7D10uAUButAW3TDwLeDCHB8OSwXgyctv3vO0
         3k4g==
X-Gm-Message-State: AOAM531t78Nj/PObcyclWFOKgtXRGSXZUhFLVlQMlpvYMMatkp8R7tS/
        kiop65y1lhEcTTn5Fnz6NfrTPCgMrLo/1e8EmbY=
X-Google-Smtp-Source: ABdhPJwU0lozHDqCbN0HRgGvs2GnxteAhajXan9KOqmnKL0N6JWuMR3SDbZ8GsXlLu2XeXfCVC6CPNRjUXFEusKheuI=
X-Received: by 2002:a81:d85:0:b0:2d1:1b8d:f236 with SMTP id
 127-20020a810d85000000b002d11b8df236mr12727237ywn.212.1645891180463; Sat, 26
 Feb 2022 07:59:40 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7000:9d05:0:0:0:0 with HTTP; Sat, 26 Feb 2022 07:59:40
 -0800 (PST)
Reply-To: jessicaum734@gmail.com
From:   Jessica U Meir <davidson4tg2015@gmail.com>
Date:   Sat, 26 Feb 2022 15:59:40 +0000
Message-ID: <CAD4G8nKxHnWh8oqLPcLmHthnMdjELDxR827E=5wL82Nexv5-aQ@mail.gmail.com>
Subject: =?UTF-8?B?w4luIGlzIMOtcnRhbSBuZWtlZCBlZ3kgZWzFkXrFkSDDvHplbmV0ZXQgMiBuYXBqYSwgZA==?=
        =?UTF-8?B?ZSBuZW0gdsOhbGFzem9sdMOhbCwgbWnDqXJ0Pw==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org


