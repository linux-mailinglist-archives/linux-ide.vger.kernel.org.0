Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24B325177F3
	for <lists+linux-ide@lfdr.de>; Mon,  2 May 2022 22:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbiEBUYq (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 2 May 2022 16:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387419AbiEBUXq (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 2 May 2022 16:23:46 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E58DFDA
        for <linux-ide@vger.kernel.org>; Mon,  2 May 2022 13:19:59 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id q14so19721520ljc.12
        for <linux-ide@vger.kernel.org>; Mon, 02 May 2022 13:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Gk4nfCem3ECRa7Gml0J0mN/3RZoOAdfGaQAqyHPKtiI=;
        b=CpiFkNNGjU7OHy/ifoGkGuCO3G9X+MOxaUJKdi/miAwz4vzVSGAlvAnMB5TePuXDvG
         Xlchf7N+K9EDclwzULC7vQoc6lmlI2RXE0IXsO6C7/kT8017916hS479HKHuC/uDbttW
         hv4DHK1NYd0CW2ksiASQowRvud36GS26LJJmBiyDcCVcIbAxDHE3nKxGkRLxt45Pe/Mw
         7QrqoJbzKYZlyTCXXaOMuvJjx+NXOXncD02C+Vq+4+wgJexbGJwOekmD5/fQnWRuJ7Iu
         6joi1KtMxaPYKqJiL6tqa+knXU4efmIayNcgZMC2cQNMwDa4JGphX1siuImAAI5aS7zA
         1pbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Gk4nfCem3ECRa7Gml0J0mN/3RZoOAdfGaQAqyHPKtiI=;
        b=kJjQqZh2UwqzJEMprkbLMCM8etcArsj2FEdYx8kNhHcK4WWHBnBthmN+v6kwGJ37LN
         ooXqitlKo/LLU2DBXX5muqHSkLvY9N5cITOU2+mW7EePS7sIBBh31GtPe8X3ybaLnqis
         Y0ErFwdMZUitmxw3diRtJaIVwYs/arzMRzswRV0nukyo9+kt1ITjbgQjeAkZ9Mv3I5gN
         atmSjIhdCy1YOsfhGGHSHDezFawhc6IQCpuicQOpDn3XZ08s57a5OVYGCkmOBbXUjcJS
         q68E4+LVQTQpq1O1D0Lq4mMFALozEDv0AcQTHO7HUpm7ab0vrWolnF6oXpdWxQurYcaI
         Zy7Q==
X-Gm-Message-State: AOAM533d2SQKsP9TNLkXGKhPdeNnopgOaSSeCnvQkDqgBblI3XY83ZN7
        yFH/iW3vxNd9yn8tByyXYZ+19RpWUwulIw7pJFg=
X-Google-Smtp-Source: ABdhPJyamALciiEA0BuiLrCFcSm92vAapcznxTSRZOCxQUyS2dI70rz5ezrLWWGXFWMO7oCzWTD/tnIxNZiTlzn8l9Q=
X-Received: by 2002:a2e:a445:0:b0:24a:c1ba:b62f with SMTP id
 v5-20020a2ea445000000b0024ac1bab62fmr8599363ljn.81.1651522797683; Mon, 02 May
 2022 13:19:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6520:468e:b0:1be:8ebf:80af with HTTP; Mon, 2 May 2022
 13:19:55 -0700 (PDT)
Reply-To: johnwinery@online.ee
From:   johnwinery <alicejohnson8974@gmail.com>
Date:   Mon, 2 May 2022 13:19:55 -0700
Message-ID: <CAFqHCSQpCoY__Vdoc42-EdmuHW7LLJKuq=MYF1Zo0Sa6q2QZ4A@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Greeting ,I had written an earlier mail to you but without response
