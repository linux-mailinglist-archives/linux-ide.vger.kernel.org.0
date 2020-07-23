Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF3722AD98
	for <lists+linux-ide@lfdr.de>; Thu, 23 Jul 2020 13:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728664AbgGWLVX (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 23 Jul 2020 07:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728506AbgGWLVD (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 23 Jul 2020 07:21:03 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F54C0619DC
        for <linux-ide@vger.kernel.org>; Thu, 23 Jul 2020 04:20:59 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id y24so657231wma.1
        for <linux-ide@vger.kernel.org>; Thu, 23 Jul 2020 04:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=cq5UFsGM4PwbW1qFMIEr855aXB0O6MiL01vlSKcAzk8=;
        b=KytZh9UnUDim2wAZoUN7fbP/fKy8ZwVeBJ7TWqNhWdU6W6uh7i+FtCKzmWvfvZv6hf
         ycZ+iBjEZXKTRlh7TBoQtDkDqBtdxwgQkYvwqMg/7Z5GbsNzD5ESatBd9U7qnNyvCHxZ
         Z6IGH15rdF5RQT7Le8IUI6uApoe0buZI5rZpvTKt86NHhVjGCbugtJKDGiuQcNyjI9ul
         hN+5sM564AX70iXZPGKeGTI+qS67b99sBbwG8TImeet8ePGbwWYbTxnVuPRe7Ei9v2aW
         58c/EXaheUL8ELQ/gx7wKA2xieBSgKIvWNF9PfnWbnj81e7K+K1v7yjo55WJ9TI+9Eg9
         ZoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=cq5UFsGM4PwbW1qFMIEr855aXB0O6MiL01vlSKcAzk8=;
        b=sSV/dNrJoF+mjOK+auDBmX6ZEohGLOiIOWjx2nOUBnakXwBZ/itSbFiuwygUtB5RZM
         ptDNHt9vzkOM8Px319npvH10c6OKp2AzrpdCLzry2GpdhkAIg5TFjnfrcMaucamNBtoy
         yobNz3C3nizhGk56uGXaWd73j/PdzMg2mfl1M/HCH2nRwsD/j1pcjvg0NHe66hkY9pqR
         FewwAoqKk6qBC6R3WTpToQR1Vflx+rguOdb5RB9yBbWIrbm5w0hUwOgi7k7MWjaVeJma
         KbshjUox6iclbBNGxP/pydAfmLbZ3OgH+0BPZ48MeNqpTYRSujPOMq5GZGkm6dm5OCXS
         lyOA==
X-Gm-Message-State: AOAM530jn9py0Zir8/LPsZbcx6J1e8XaKCeDVs2TAQM+gYB2BCGThYZy
        QvyfUu0l1gDeR2f2Q4p1s4g+75JyE5tEO6oUJSM=
X-Google-Smtp-Source: ABdhPJz59Y2v9g6RHFo0PIRwkSA3oiyMAeWQq5emT1enaUFqyrWZxeL/bP//act1bDBq3dUS0lrIsk/EqNGX1Svd8zQ=
X-Received: by 2002:a7b:c952:: with SMTP id i18mr4000116wml.65.1595503257912;
 Thu, 23 Jul 2020 04:20:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:9267:0:0:0:0:0 with HTTP; Thu, 23 Jul 2020 04:20:57
 -0700 (PDT)
Reply-To: godardchambers@yandex.com
From:   Luis Fernandez Godard <doran11karn@gmail.com>
Date:   Thu, 23 Jul 2020 13:20:57 +0200
Message-ID: <CAFyBfXJFn9QL6ukyOJ1e=6PKqG1SkMxYOcn_ubYmJSvFmRHNGA@mail.gmail.com>
Subject: =?UTF-8?B?TmFsw6loYXbDoSB6cHLDoXZhLA==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

TmFsw6loYXbDoSB6cHLDoXZhLA0KDQpKYWsgb2JlY27Emz8gRG91ZsOhbSwgxb5lIHNlIHRhdG8g
enByw6F2YSBzIHbDoW1pIGRvYsWZZSBzZXRrw6F2w6EuDQpOZXphcG9tZcWIdGUgcHJvc8OtbSB0
dXRvIHpwcsOhdnUgbmEgcm96ZMOtbCBvZCBkxZnDrXbEm2rFocOtY2gsIHByb3Rvxb5lIHbDocWh
DQpkxJtkaWNrw70gZm9uZCB2ZSB2w73FoWkgOSwyIG1pbGlvbnUgVVNEIG55bsOtIG9kaGFsdWpl
IHZhxaFpIG9rYW3Fvml0b3UNCnBveml0aXZuw60gb2Rwb3bEm8SPLiBWeXrDvXbDoW0gdsOhcyB2
xaFhaywgYWJ5c3RlIGxhc2thdsSbIHDFmWVkYWxpIHN2w6kgY2Vsw6kNCmptw6lubzogWmVtxJs6
IEFkcmVzYTogUG92b2zDoW7DrTogUm9kaW5uw70gc3RhdjogUG9obGF2w606IFbEm2s6IFNvdWty
b23DqQ0KxI3DrXNsbzoga29uZcSNbsSbLCBQbGF0bsOhIGtvcGllIGlkZW50aXR5Og0KDQpTIMO6
Y3RvdSBWw6HFoS4NCkJhcnJpc3RlciBMdWlzIEZlcm5hbmRleiBHb2RhcmQgKEVzcSkuDQo=
