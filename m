Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8676642DAE
	for <lists+linux-ide@lfdr.de>; Mon,  5 Dec 2022 17:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232848AbiLEQu1 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 5 Dec 2022 11:50:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232140AbiLEQtt (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 5 Dec 2022 11:49:49 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C797A2180A
        for <linux-ide@vger.kernel.org>; Mon,  5 Dec 2022 08:49:04 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id f13-20020a1cc90d000000b003d08c4cf679so6693261wmb.5
        for <linux-ide@vger.kernel.org>; Mon, 05 Dec 2022 08:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O4WPtqOs6pYDke8VCfpzwsIX+8zN33o8tLS2XMy/lFU=;
        b=Z2wBWagY9UnEZ+M5YPDdGkg6nVUsQfYS1BhjpcwGEao2GhG01+Mm/qvV+1fKOq1lbu
         EFS78qR+UGfEwXQVt6IRXk6jTGT8mo+KAwwjj0fZxBmjE1jztugOoJP4/rka0x6XFhxu
         W6iUCvsIDO6eHcdCHFvdIDlIVpJCsES5SD3xSnapoHClZmLcHlXbjXoeix+TX99ab7ry
         BqOOHDFzUlmJeyU3OvUitATOsPkFA0DOczbi/Afsjm9NHI/YtApk72ny0qjFhFTXO+XP
         yKXAtBeMHMlIwSKvmuRpEfOfWiK9b959mo8P7Fx64Ot+uHxQXUUrd10S+RG2s/yWLOX2
         BSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4WPtqOs6pYDke8VCfpzwsIX+8zN33o8tLS2XMy/lFU=;
        b=MpgqzS2StE6eXZUedBkFO3kx0/YXReDYdvFRTRvsRrp0Z+sceFXdLS4Cr3jRm2jsYI
         VvinNdVw6X2pupxl652tn4WUdpoyDyxesvl+aRYyLbFAw8PA3pfLr9Ev2/6y+0jhj3uF
         6ZkM28buq9d6eYu+V7iE+FBCFPl9yN4b1gVQ/rxNYeA8XVgaFHgmmK0kejdyH+Yi5ltM
         RC3llsskwCt3NcyWTb7qkssxBEwi4/Bcfo9oH6jSOY1OhETaLppZAFzGUqj//dGNlFf8
         TrgmNtNcemu6HWDZGJjqnCs8/iBLrozGEfJBsO05zL5DaE+Zoh8IiQbxXVqtBmCiD4Li
         Fs9Q==
X-Gm-Message-State: ANoB5pnZensmJsweAiY6m+ASNE+n5YBxnDmUXRwWoRA3oJA2uX02PUbo
        IqBxOCv6M6UHI5snl7DQ/SMnnDu3/lhZx/Cq+2U=
X-Google-Smtp-Source: AA0mqf6LlThRqxALxahU+d5CDCL5XgA0Iri4oQFEx6hETTBFBZxUw9iI5CXyM5b3WvWotoaM22oBvK+CwFtVO/zgxX4=
X-Received: by 2002:a7b:c8d0:0:b0:3cf:ca91:7094 with SMTP id
 f16-20020a7bc8d0000000b003cfca917094mr60628535wml.24.1670258943314; Mon, 05
 Dec 2022 08:49:03 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6000:5c1:0:0:0:0 with HTTP; Mon, 5 Dec 2022 08:49:02
 -0800 (PST)
Reply-To: phmanu14@hotmail.com
From:   Philip Manul <zagbamdjala@gmail.com>
Date:   Mon, 5 Dec 2022 08:49:02 -0800
Message-ID: <CAPCnorG0wZz4L65xmUUzHEvxvuhrsq0nQnSPJqno3Ah89AhSwA@mail.gmail.com>
Subject: REP:
To:     in <in@proposal.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

--=20
Guten tag,
Mein Name ist Philip Manul. Ich bin von Beruf Rechtsanwalt. Ich habe
einen verstorbenen Kunden, der zuf=C3=A4llig denselben Namen mit Ihnen
teilt. Ich habe alle Papierdokumente in meinem Besitz. Ihr Verwandter,
mein verstorbener Kunde, hat hier in meinem Land einen nicht
beanspruchten Fonds zur=C3=BCckgelassen. Ich warte auf Ihre Antwort zum
Verfahren.
Philip Manul.
