Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA5CF6A9360
	for <lists+linux-ide@lfdr.de>; Fri,  3 Mar 2023 10:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjCCJIi (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 3 Mar 2023 04:08:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjCCJIh (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 3 Mar 2023 04:08:37 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E7E16333
        for <linux-ide@vger.kernel.org>; Fri,  3 Mar 2023 01:08:36 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id a25so7820615edb.0
        for <linux-ide@vger.kernel.org>; Fri, 03 Mar 2023 01:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677834514;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e/r0L/PAnS5fOVQg6qj0+2DIJq2t1BxWauF5ORbF6tY=;
        b=IIGdUDOt+9jVyOAGfgaPz/zfap9vZAF+4MpEOWrveatoXUuZaZakl6Uz5Y7T7HdASy
         jZq2e3k3kGuJn2zcbrVrDmK/7XR5qxx1ibr8ZuIOs1eqBd94oTZHxA4Q7SpYHFBqhoa7
         HegHPLoNkO+Ktc/ofiZLrUZN6V2UqdP6HPI+ZT5qHv1EEalVsjYPb4g6ybzG2AOQwcOh
         WTclMbY5kL5jQzff+kZrL1eWgNZc4ydfLvImKR5ENajJtnZqKncmsYnZrVf6HFauQtOY
         8akqEP+iGNDhlz6Sqbovo+ZuqgAfRvrbryZUZAxjIti5KcntZXXokMogHmJYM61yxCA+
         8+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677834514;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/r0L/PAnS5fOVQg6qj0+2DIJq2t1BxWauF5ORbF6tY=;
        b=sCsHZUIjpdzcpFrHOBTiqQyXdbOiTtvykN//cFimr4icWAoDehH17t6PtLRnBCwXVa
         NibQJv3Bacmx7BiYWNdBlZkMaiRKiAxsSM8k/zFKIeM7zpoqyPTLZs3w/uiuSwO9/E+n
         wdi9xUlSSNaBdPUaBdgDNcZzMzrcUMhWIdEdXIo/WJ1N6ne8Lfp7st0aQWdSzL/rbKKd
         7fcif0ce2L3PnNBDy5BoCYyKmy3BfC5880GW5qKNrPe3Np2gQsYznDYsx/yP5beG337w
         DCRYurNGoy5c9O2eGcNbDd9JXxLM16C5qgy05yXHbIl6P+oEbxl28gcffthHG2D+GkrJ
         ldWQ==
X-Gm-Message-State: AO0yUKWa89cIY7x5Ueh6XSEVKx/xr91aJ50TDwz/fMQxXy5rJL6cLTjY
        sKTRKa4kzfr/ehprncbgmNyViK5cROacujNWcmg=
X-Google-Smtp-Source: AK7set/QSuserJuiuXQyXFC7ZKe7mjc6bbbYS3rcauJDpd1z3OwvsL8QnlSd/m7ySHgdpOneXCNTW/NElvP3MHhnf/A=
X-Received: by 2002:a50:d581:0:b0:4bc:136a:e25 with SMTP id
 v1-20020a50d581000000b004bc136a0e25mr665807edi.3.1677834514577; Fri, 03 Mar
 2023 01:08:34 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7208:b046:b0:64:a705:a23b with HTTP; Fri, 3 Mar 2023
 01:08:34 -0800 (PST)
Reply-To: georgebrown0004@gmail.com
From:   george brown <eddywilliam0002@gmail.com>
Date:   Fri, 3 Mar 2023 10:08:34 +0100
Message-ID: <CAP8JzxJcS3SG4XSpPnoBeWxNeSLEoVCP2td67znObO+6MmYwRQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
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

Ahoj

Jmenuji se George Brown, povol=C3=A1n=C3=ADm jsem pr=C3=A1vn=C3=ADk. Chci v=
=C3=A1m nab=C3=ADdnout
nejbli=C5=BE=C5=A1=C3=AD p=C5=99=C3=ADbuzn=C3=BD m=C3=A9ho klienta. Zd=C4=
=9Bd=C3=ADte =C4=8D=C3=A1stku (8,5 milionu $)
dolar=C5=AF, kter=C3=A9 m=C5=AFj klient nechal v bance p=C5=99ed svou smrt=
=C3=AD.

M=C5=AFj klient je ob=C4=8Dan va=C5=A1=C3=AD zem=C4=9B, kter=C3=BD zem=C5=
=99el p=C5=99i autonehod=C4=9B se svou =C5=BEenou
a jedin=C3=BD syn. Budu m=C3=ADt n=C3=A1rok na 50 % z celkov=C3=A9ho fondu,=
 zat=C3=ADmco 50 % ano
b=C3=BDt pro tebe.
Pro v=C3=ADce informac=C3=AD pros=C3=ADm kontaktujte m=C5=AFj soukrom=C3=BD=
 e-mail zde:
georgebrown0004@gmail.com

P=C5=99edem d=C4=9Bkuji,
Pane George Browne,
