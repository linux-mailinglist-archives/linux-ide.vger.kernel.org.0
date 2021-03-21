Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572EE343449
	for <lists+linux-ide@lfdr.de>; Sun, 21 Mar 2021 20:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhCUTHA (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 21 Mar 2021 15:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbhCUTGi (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 21 Mar 2021 15:06:38 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBBE4C061574
        for <linux-ide@vger.kernel.org>; Sun, 21 Mar 2021 12:06:37 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id o10so17901561lfb.9
        for <linux-ide@vger.kernel.org>; Sun, 21 Mar 2021 12:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XnGCJN74ODgPcebw1KK2VajqNNiVgQntWUbh05j1Gs4=;
        b=ConM0sdsCGRKS9xdbAVm/HVQQKn6HtsIYNcEnt8nCXXNqDzrkHgy7WQ7COMd4h9Kms
         ggCTmZtQwhOLG33qbRYsW+07dmEdtodoGO5Jb44jrTGsIw/koaVJfUH6AKFMMjOMdNfM
         LmFqhbjrYxmCETdlJpMJusQaGg+75gDUZYKUffxHAS54lqKzHa3LQhbA4/jBAuClWVGJ
         El05tnJbencJawsXRbHC45uLhlUMtKUL79v2sYPDyNGot26/uBcz31j1j/7c1m+H6mQ4
         vRLuSACeg+kV6KXnf0FPPECcMThm0HOSy9Z7oaIZCWJWopJjqlPQB0Po3hS+vTkwuAkS
         Xt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XnGCJN74ODgPcebw1KK2VajqNNiVgQntWUbh05j1Gs4=;
        b=kFU2xGPMLKHuwfiR/MewUlElIez9cTP9gGArOavdeQyXq4Rdg4sZ7lMhXZwwy7AILD
         oYYmWs5AfcMRvjER0hnBoJlNJ4qOKxzTnDzPLfGODuRSocnL9TZcuOw5KDVxDEGzlzZr
         PvIZR02+/bBVhCP8JslzLoR9PaBqygTRTFSoi+zUQBJ64G3a1TZ7g46v4uvlw5ViZghI
         hJpiGqqOxt0Tfm+/GEM68tYlDtJSh+s7R6QtKptiVSd8hgyKYlBJ+MG0JlFEQt3Bm9Ka
         EDJIpml6SJEJ/ktsQ81V6PJqCzJduPqkfE3NdAg32WkypBBVVxVfSKFbGpiNRgOrBMnB
         +4hw==
X-Gm-Message-State: AOAM531vUj2xbAWoqUxkdtNHkKZnMwTyrdql/PTK9mjoqHHofA8xkscF
        8XNXsWwhDJU4Qf5FAJ58VJlHNYBW03HbUt4KFfs=
X-Google-Smtp-Source: ABdhPJwkT2kzFj4bjY/jKrHaHA7YG+VjSUyX6bdLhkFg6pnrUKLw8ukDG3eiH6FlPOOBMDDHUI24sSO33zaNAwJYFrc=
X-Received: by 2002:a05:6512:3996:: with SMTP id j22mr4563670lfu.443.1616353596107;
 Sun, 21 Mar 2021 12:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <2e552c36-84a5-a642-a8f0-1395f77a1a6a@omprussia.ru> <d9aa4052-f3d1-6595-65d5-0b0bfc489047@omprussia.ru>
In-Reply-To: <d9aa4052-f3d1-6595-65d5-0b0bfc489047@omprussia.ru>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sun, 21 Mar 2021 16:06:24 -0300
Message-ID: <CAOMZO5DM5dpqtO2_kg+n0xi2eBoURH+OSDdUfHwocE_jKpw47w@mail.gmail.com>
Subject: Re: [PATCH 4/4] pata_imx: deny IRQ0
To:     Sergey Shtylyov <s.shtylyov@omprussia.ru>
Cc:     Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi Sergey,

On Sun, Mar 21, 2021 at 3:59 PM Sergey Shtylyov <s.shtylyov@omprussia.ru> wrote:
>
> If platform_get_irq() returns IRQ0 (considered invalid according to Linus)

How can platform_get_irq() return 0 on i.MX?

This driver only runs on imx31 and imx51 and in both platforms the
PATA IRQ is non-zero.

IMHO the current code is correct as-is.
