Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 522E43BE83B
	for <lists+linux-ide@lfdr.de>; Wed,  7 Jul 2021 14:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbhGGMul (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 7 Jul 2021 08:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbhGGMuk (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 7 Jul 2021 08:50:40 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAAACC061574
        for <linux-ide@vger.kernel.org>; Wed,  7 Jul 2021 05:48:00 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id i125so1734477qke.12
        for <linux-ide@vger.kernel.org>; Wed, 07 Jul 2021 05:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Yt62TszKcb4A7QGJ+yn+kt/XDSMoUeLI/qXsSaEOtik=;
        b=XZolzyyq//1uOourzaBLcB+vgYZi2EadS0u/ztteHnXccYO5uYR0kJKkJoUOPEDnTf
         ayjn9WRnpGGaG/f2F2K2ds+7+ssvN0/ey26c323YSuAe23IGQFadUe2CJjpLEZ1HMZiL
         LTpBgjVlypLNQ4RSAUKHjLFLeAoki8p7ZzlCSXRiC+UiCQ5abW4nyXYRxuky1HMGzDD4
         f95cKpPbOvjq772wuJg42iv7ag7238HNNnarCLj1Vh9eQVnEmxMDI301uqm1uQOrD7QF
         P/eHeWRUlV0pZwXJ8Z8Qp6hKniGlIlO9TINiNfm/F6GI4W1ogqTq1B+7JBjydMU1h8tJ
         SWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=Yt62TszKcb4A7QGJ+yn+kt/XDSMoUeLI/qXsSaEOtik=;
        b=fig+u0fH8zV4Zvu+0uPJ/CDdA33hD0O0iTsor0L9quRGvZ13Um31DSTBmtYtOapEVA
         xYlKnVlu1jZdT9u5v4W6adJHX4x0dwac0t5+WU57wfddc5tyadnVr6GhMhEM2wkpgJGX
         hUYHhTpzYlp2eiM41NwSA3uEYTKdZSke0qSVAHqirhADHylXRbGqHFt5fv+9gBFG4pM6
         68eD56AAMAB2AYyTw8ocBHtd00GbKuTAgRUU8uAhAxMoRaaX/aqEa592uVG+jk6tVYg2
         WY8jdLMt0xIr1WQLdpcRYPk9d0YC/dUhLRUtp2oXgmI7rK0UcHcoE16AOEEfHKjvnyRK
         OyKA==
X-Gm-Message-State: AOAM531zETryKcGjYvPIy9UEJ6ww7neIMn3Jk1Fxmxzsk4wyM7PCQpI2
        +ji//BmDbP1ZRqo69gJ22z4iY8D9wr6WerDVZ/U=
X-Google-Smtp-Source: ABdhPJzwsZz1VUUFwV6xluIPLXopgC38iOtJMFH38U/ciJR2N+lMeodhLrkLxGyFIoLeIGJ2Xtq67/vGE+Y2uz5bpZQ=
X-Received: by 2002:a37:71c1:: with SMTP id m184mr25971597qkc.367.1625662079887;
 Wed, 07 Jul 2021 05:47:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:622a:1746:0:0:0:0 with HTTP; Wed, 7 Jul 2021 05:47:59
 -0700 (PDT)
Reply-To: 123456officialnicole@gmail.com
From:   Official Miss <nicolemilitary5@gmail.com>
Date:   Wed, 7 Jul 2021 12:47:59 +0000
Message-ID: <CAL849O=U2RNWj6--kD67mqSvChMApEbCZvAYGB90+hCZPGw_dw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

SXTigJlzIG15IHBsZWFzdXJlIHRvIG1lZXQgeW91DQpJIGhhdmUgc2VudCB5b3UgYW4gZW1haWws
IGRpZCB5b3UgcmVjZWl2ZSBpdD8gSSBoYXZlIHN1cnZpdmVkIHR3byBib21iDQphdHRhY2tzIHdo
aWNoIHByb21wdGVkIG1lIHRvIHNlYXJjaCBvdXQgZm9yIGEgcmVsaWFibGUgYW5kIHRydXN0DQp3
b3J0aHkgcGVyc29uIHRvIGhlbHAgbWUgSSB3b3VsZCBsaWtlIHRvIHZpc2l0IHlvdXIgaG9tZSBj
b3VudHJ5DQpSZWdhcmRzDQpNaXNzIE5pY29sZQ0K44GC44Gq44Gf44Gv44GC44Gq44Gf44Gu6KiA
6Kqe44Gn5pu444GP44GT44Go44GM44Gn44GN44G+44GZDQo=
