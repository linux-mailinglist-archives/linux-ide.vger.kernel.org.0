Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C71A0547466
	for <lists+linux-ide@lfdr.de>; Sat, 11 Jun 2022 13:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiFKLsg (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 11 Jun 2022 07:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbiFKLsT (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 11 Jun 2022 07:48:19 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5354056FAC
        for <linux-ide@vger.kernel.org>; Sat, 11 Jun 2022 04:48:17 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id f65so1479733pgc.7
        for <linux-ide@vger.kernel.org>; Sat, 11 Jun 2022 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=XbdOdn7uobFHsuN9XLMlNq65m3JV0c6v1jahkCkk1ss=;
        b=UvaIwvyQ4ZdHoblTiuRRXOZnkO1bZC9zJWB6UtSzqJKaJUUrdZUkLrSfRrFxMpFS1K
         SbeM1YHoA7BXA/6eQikO2Cved34bdIAPT3r6JwNuVzMcMbEpsasGWm0e3iYr+8NsoT6y
         /Ed8Ap/DVydu/UVK+ZBDWdoaepoh/43SlPtzz2HSC1sKPVrSE4g4V0OG8KgxtH5u+lxS
         hcrKr9LnSTVk+lOZywT89+HSo5WDSCHiGBSEt0cfdjZouvbGXQEqM+u+B/wVPCkcvtTL
         7FVorIWy9bthXyaFMo2WluTQlVJn+pRgNzGlO/uCOv0acP1/TuYumz5crxVKTQyW7P0Q
         OAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=XbdOdn7uobFHsuN9XLMlNq65m3JV0c6v1jahkCkk1ss=;
        b=4freFFcTToM7lZd5cv0WTT3saqZMVe9TuRIWGiGbUqbXQROqvcN888tTJgtrDz4fOp
         +vIuL67llZfEnnNRc6uy/290ih/mzqgVQ1VK3IR6YypL6troxHAb+0zcK91SCMQZy8Kl
         rgiUTnK0jNwgYs04p+2ai/hqsQsdI8N0QUggUso1f0KXCbsSOAsUQQzaSlhVC20XxcBn
         mz1MKgytGjpjbWWBhnUjziLfBsW2v2ifglyR/+wWjWal++Ngxf1Y88ciU97/9OWBr0B4
         vfnKqdBCQw8klaEm3wCLtiHYfTbcxPDCt/T9SgUcdfcHTOzAr2G8OmAV6RGKYnegwm7Q
         +I7A==
X-Gm-Message-State: AOAM531avDNEVQxXCnMrsISPx61sGOtVd/IY4I6s9k7g1DIAbWPECkN6
        OpOwNmlNhtF07Z80KmN3R2E2sVhBxUV22IYKiis=
X-Google-Smtp-Source: ABdhPJzwRSmASWNb8Ugyf209EbrC1T+AbN+iRHPmzefuwRpSgCkBgYrhE4Pn5d8Mc3q5Owd/YSvmTs5WZmmWL04Df9c=
X-Received: by 2002:a05:6a00:2390:b0:51c:21e1:782 with SMTP id
 f16-20020a056a00239000b0051c21e10782mr30137029pfc.21.1654948096245; Sat, 11
 Jun 2022 04:48:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a20:d043:b0:84:2d19:269e with HTTP; Sat, 11 Jun 2022
 04:48:15 -0700 (PDT)
Reply-To: stefanopessina92@gmail.com
From:   stefano pessina <nicholasmbivii506@gmail.com>
Date:   Sat, 11 Jun 2022 04:48:15 -0700
Message-ID: <CAAVPN7h-rsBffsuFve4baEjOht30Hz-W5YOZVcBuSbEaFoxq0w@mail.gmail.com>
Subject: =?UTF-8?B?R2zDvGNrd3Vuc2No?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
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

--=20
Die Summe von 1.500.000,00 =E2=82=AC wurde Ihnen von STEFANO PESSINA
gespendet. Bitte kontaktieren Sie uns f=C3=BCr weitere Informationen per
stefanopessina92@gmail.com
