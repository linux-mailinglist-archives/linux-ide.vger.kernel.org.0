Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48BE954A07C
	for <lists+linux-ide@lfdr.de>; Mon, 13 Jun 2022 22:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351143AbiFMU4X (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 13 Jun 2022 16:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351359AbiFMUzO (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 13 Jun 2022 16:55:14 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA21A475
        for <linux-ide@vger.kernel.org>; Mon, 13 Jun 2022 13:27:29 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id h21so1232849uaw.7
        for <linux-ide@vger.kernel.org>; Mon, 13 Jun 2022 13:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=f/v1gZW2d1xf+y6gXLTGdOPEOS7UDztcZyURQzQMDp0=;
        b=OdrDmXqTVaEbKcbTjD93surbgAVobFR9a3I9MeN4fRc5obpOYLA/G7GfEB5WFowb8h
         XdRsLcqW7XIqfCH+isAmT75z5hl/HZxm1St9/GA9XMrLtzLbb8jGzb8DWdAstivj5YtO
         v00D+S/b9wk68DZLb6hJErkewgMZGK17nK/lMoDllJr2v11w50S7JTmtJEeLSnJOEka6
         OECmoc2TH/Sd8h9FNyTKTWCAI7gpMwcT/8XQfDOECJaeHw50dOAl5k9XJEjJrzl/1LtK
         UdU4n5L/u4kNC0tGXPIkgPO/R9cAbS5Dp4aLhYu2iTjcF/JrrIPiwXPxJe3+RU+id1IJ
         GSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=f/v1gZW2d1xf+y6gXLTGdOPEOS7UDztcZyURQzQMDp0=;
        b=rendacbuH9297o4WqsS/u8RsI/zwK0BwZAMaUjvcTXWpTT5ZYvbTZAOlFPJLSk6hXw
         4V1jmgBBmNVjNzKEE6wj8Psxf6Xr4CziLLuOu5nYUZ9wm0T1DYbJ0EwRI+Xn97L9/AnS
         4esJ+EOICbzbEWZRvclZAJordjGyRLdSkiMVuOXYiLWXSW/xgcj6vqQeX5TDG2VESsIA
         6ChwTlTqAhNKITS1hIeo9EcZgab1IP+MaTxv7EI8k261gK1cizYX6tjvTQV7+yQOtzaJ
         vdeCZgjH8PC0xfn8OgZuZTX3w2AabWlVS2YrMADGS+F/IDDQ5nRevnhUadh19NzEjK1q
         E2zg==
X-Gm-Message-State: AJIora+uVrJv5epsS2xZZeAat0Xba3qtkpIVJ0HqEH7SRgHojkaVTlkn
        EYX8HOiu8C8xUjZ4K7zDZR16qujHZsftbBV937U=
X-Google-Smtp-Source: AGRyM1vlUx8WCvfTFwc0l2UwNQoC52Qay1JID43h6Lwj7EfAxiXQd6uzVfIzERlunthWMzzAAT3c9eTduXZ3DW4jxm0=
X-Received: by 2002:ab0:5a85:0:b0:35d:20c3:5463 with SMTP id
 w5-20020ab05a85000000b0035d20c35463mr719740uae.103.1655152048706; Mon, 13 Jun
 2022 13:27:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:bf8a:0:b0:2ca:3b5c:ca48 with HTTP; Mon, 13 Jun 2022
 13:27:28 -0700 (PDT)
Reply-To: nikkifenton79@gmail.com
From:   Nikki Fenton <gustaviagrowe629@gmail.com>
Date:   Mon, 13 Jun 2022 22:27:28 +0200
Message-ID: <CAEmpkiAvAF6YR3E1DnukQzAj+5ibPOvEG4TM+XcbhkRyf1Ve9A@mail.gmail.com>
Subject: Please Read
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
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

Good Day,
I viewed your profile on Linkedin regarding a proposal that has
something in common with you, reply for more details on my private
email:nikkifenton79@gmail.com

Nikki Fenton,
nikkifenton79@gmail.com
