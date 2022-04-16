Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 171AC5035B6
	for <lists+linux-ide@lfdr.de>; Sat, 16 Apr 2022 11:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbiDPJeE (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 16 Apr 2022 05:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiDPJeC (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 16 Apr 2022 05:34:02 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6673119014
        for <linux-ide@vger.kernel.org>; Sat, 16 Apr 2022 02:31:31 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id s18so19134077ejr.0
        for <linux-ide@vger.kernel.org>; Sat, 16 Apr 2022 02:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ePin5iSXTXY4o8oAFLcs5qh+FaW6/LMmaWmFq1AiOeM=;
        b=INuh4T915RuV0t+HzWH+2Fde6nGaegyOm0N1Yyp8gv+9xsyHsB/Ep2Vr/5cMiKtC5Z
         I5UnaXLvZmBITE0V1POTMYCKrSzma8m6zxqRo2ttje0PUXief85vuInA95O/yhY1oI8T
         tNY0DWCwJe+4xD7wxjMjxmI7Wp08lv2dfpYF5uaOR40dm2cGJkD36gykf56Ca8k7bX+E
         xliQwM5126PMjB/m1CkZCfamnyG3UYrZsQCALs2OVhNEKBPJTU+g3iAZCCmpEjkfU+Qq
         23+s08zUU55c8bq4AvPGFRNgtDC89OLU2xJZfB+RA+87Q8ifBQtWxPUplzvQKNzxXdb/
         ZQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=ePin5iSXTXY4o8oAFLcs5qh+FaW6/LMmaWmFq1AiOeM=;
        b=X/+B/7duf59F+R27TipKJSk5FEaTk5mvx9j1+Udn/zFsBGOrZSMaK4IvZVUuaFT25t
         K2shL/hSUkAcvRsbcnhMnWiEFgtBKXWJr6feuT4BmFpJrciUxgxx9dIcpsfJ7DopnTgy
         Ah6xsMM9AjNPIFV5FBj5i65RbDNXhfKPOHHCQF9d66PNK+O1ZyjdYcnCluJypCmtcQ2U
         iIJw9wGOhma72ubkK7K7m/pd9xIij4JMItuZavYo4930JXv9ZXEF47pbcgaHeNEFPg6n
         plPW6Fm+RGu58zrKVRmH+bChg7wDX/JOQDGA0Atzc4rNaaL1vCrF+/NSlHXcn6Hqz16f
         +new==
X-Gm-Message-State: AOAM531uhkbv4PB55SaH3i/9ngayc8+oBm1YKRS4U0DOvp6dqDonzc5m
        8HaWiZpu6i4eAkC37spIRNIHn0JZO7diZkDH50k=
X-Google-Smtp-Source: ABdhPJz5j52uo+z8On5/TpJ2VG4a1o0sGwkOUEkKDPOfAfu0emLMpcdUWeOXSkGEbz6YmSN6LKv8uDPFd0s426BK2xg=
X-Received: by 2002:a17:907:96a8:b0:6ef:6a93:2e55 with SMTP id
 hd40-20020a17090796a800b006ef6a932e55mr2141882ejc.603.1650101489969; Sat, 16
 Apr 2022 02:31:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6f02:a04e:b0:19:64f0:b989 with HTTP; Sat, 16 Apr 2022
 02:31:29 -0700 (PDT)
Reply-To: peacemaurice750@gmail.com
From:   Peace Maurice <sgtkaylam@gmail.com>
Date:   Sat, 16 Apr 2022 09:31:29 +0000
Message-ID: <CA+ngFMG=KT4JBnc1A2XwQkruDwShs1bGwPk47y4p25jurZoLLw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
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

2 napja =C3=ADrtam neked egy el=C5=91z=C5=91 =C3=BCzenetben, de nem v=C3=A1=
laszolt=C3=A1l, mi=C3=A9rt?
