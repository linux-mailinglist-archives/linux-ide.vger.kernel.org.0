Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0D864C0B4F
	for <lists+linux-ide@lfdr.de>; Wed, 23 Feb 2022 05:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbiBWFAY (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 23 Feb 2022 00:00:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiBWFAY (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 23 Feb 2022 00:00:24 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEE160CC3
        for <linux-ide@vger.kernel.org>; Tue, 22 Feb 2022 20:59:57 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id s1so11119483wrg.10
        for <linux-ide@vger.kernel.org>; Tue, 22 Feb 2022 20:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=eaaB5Fi4OIw8X99OdVt3/5VwsoSH3pqqZ03p7mumtcE=;
        b=ecwA7WbVoCwu9F02tV1zoF1IrE/f0lrjIcIsxpwRFv7R0Akunbh2em37bUDYmAK0tf
         Z0TgeoRc/VnimIjlsMWX56yolnMipmSM9H3+mUbgmkL6phQA+v8SVS1mbPeThGw3IOrw
         ClDcnQesThq426rC2hJuyeAyNnS+AX8SgZked14iAReGk2N7Qt7YC6INQkK/zYAjXMhS
         VDBjU2/X7oik6/Xw8ftwTr69jGr1ZjFA0kN2cj933xwIdLnyPcMUzeB164wV8ELeyk8M
         j4w9PyvJL92gH3ub4qqfCFDQGj+50LXH5hbQ8MduZ2RPKyBRPZWqtX2zldPp/0E4k2tS
         ifVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=eaaB5Fi4OIw8X99OdVt3/5VwsoSH3pqqZ03p7mumtcE=;
        b=H7QeV2N85+nJ/Ick1H5nPFVW1eqzV+1juF6AIjrtwEmDicChaPAx4oxgdZrz2Cs3tT
         1diCiAoUfB+z8vxBL46chJho5mIj9sV2Fs+ekWw0aVmH8qTmhQ/y3HUz/CDy5lgvvTaC
         /fiY6zBqCqpBr84kYucOM7szbLpdhXW84IhOw8d+FdUbX4EXPWs8EK0fjlCr7yOmmn0Q
         nppdWMIsXkxNlEh/B13VWRi+W1Qnq/3q7kX149NSzQK1HTM7d/+dZFhmcgXZ65zdNbjo
         qcZtQfAWQPt0pLaPo2ATsvH2raEf77KUoij96scbvlXZqNsStJp2zBTOcA0GgwdVCgN0
         KaFQ==
X-Gm-Message-State: AOAM533zgbvKR7mHieVGK3/dHIDfkP6JdlHOCr54MHps7BpVqlbsq3WU
        UHGYUeAqRlf61D2zIeHcaCw=
X-Google-Smtp-Source: ABdhPJwDJK5nj7mSivwZ4Z+ywhNq8Ep2Kd7cROd/EtQaMXeveHOs2TFIVAcPSePy/0gGNLPhztRA9g==
X-Received: by 2002:adf:e344:0:b0:1ed:9ce7:2d33 with SMTP id n4-20020adfe344000000b001ed9ce72d33mr2791864wrj.289.1645592395782;
        Tue, 22 Feb 2022 20:59:55 -0800 (PST)
Received: from [192.168.0.133] ([5.193.8.34])
        by smtp.gmail.com with ESMTPSA id ay12sm38679119wrb.73.2022.02.22.20.59.52
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Feb 2022 20:59:55 -0800 (PST)
Message-ID: <6215bf4b.1c69fb81.55125.8e78@mx.google.com>
From:   Mrs Maria Elisabeth Schaeffler <margaretdonation@gmail.com>
X-Google-Original-From: Mrs Maria Elisabeth Schaeffler
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Spende
To:     Recipients <Mrs@vger.kernel.org>
Date:   Wed, 23 Feb 2022 08:59:48 +0400
Reply-To: elisabethschaeffler01@gmail.com
X-Spam-Status: No, score=2.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,TO_MALFORMED,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hallo,

Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Wirtschaftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen zu geben
der Rest von 25% geht dieses Jahr 2021 an Einzelpersonen. Ich habe mich ent=
schlossen, Ihnen 1.500.000,00 Euro zu spenden. Wenn Sie an meiner Spende in=
teressiert sind, kontaktieren Sie mich f=FCr weitere Informationen.

Sie k=F6nnen auch =FCber den untenstehenden Link mehr =FCber mich lesen


https://en.wikipedia.org/wiki/Maria-Elisabeth_Schaeffler

Sch=F6ne Gr=FC=DFe
Gesch=E4ftsf=FChrer Wipro Limited
Maria-Elisabeth_Schaeffler
Email: elisabethschaeffler01@gmail.com
