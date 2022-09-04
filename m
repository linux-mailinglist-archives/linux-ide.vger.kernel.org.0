Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0814A5AC490
	for <lists+linux-ide@lfdr.de>; Sun,  4 Sep 2022 15:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233206AbiIDNuc (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 4 Sep 2022 09:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234044AbiIDNua (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 4 Sep 2022 09:50:30 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8108B2654B
        for <linux-ide@vger.kernel.org>; Sun,  4 Sep 2022 06:50:11 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-3450a7358baso23393577b3.13
        for <linux-ide@vger.kernel.org>; Sun, 04 Sep 2022 06:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc:subject:date;
        bh=8JC6EsSfafXmIapFg+dMsRIDXE8++LB1Nr2fu20u/vM=;
        b=duhFjZDteDpu7z3VF1i5MCwnIverAbFhBHyPGZQGAveFaeP+8rcuETFwoF1BfUzpZW
         dIpDgaoAQYOs+9YTuKOTAXM8WKBkwnDXub9e29JfXe3CHdjuj8+EnbdWa7ChKfVH/XJJ
         59uNZoSxBokjpFlXHEPaBT4ATN8OQXFXTqZu0F7IpEmBXplGDni3KiMlN1yLCZ4oMzyb
         J73U1gL8OA+Z4SlBZg8kP9nD9XyI4Xv+nXJJVELTdKQ7PlDwtNR2eteThdBCVP00eY7Y
         UBcqXzvh75F0xDlKwMeddKYfKc0VzSA58E7NfJwwYN3SxuwHIk7Auo3k532XD+thhjow
         9+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8JC6EsSfafXmIapFg+dMsRIDXE8++LB1Nr2fu20u/vM=;
        b=RGEGDHXp1n82C3C+MFan/3GDFDaEdJGjqeD23V9rF9AA/6L1F0vTi3kPinCWIH9ITg
         lcB8/7nUi4iRJvdE/Yzw3oc4eYwJB4dQCXZd7deJXkImo8F/TsammMP/hYx6hJgjgtKF
         SaFoVXrsXCUf04AJtgaReb+TTJuYgGAO4tOcv+fAudgAGbhRgMCG9X3t9J5VY2pYaWLn
         GnY15N4Z55YWEAYiaZKn9Doj26nqs9ZLV57u8hcrOxjR75nRqnog6IwJ4B6aQcUZSzOR
         anDC6rqcbsEpaGFVNZFd7eBr7pY3Ue/igcN/rn91UzpzDil58fYmc099qo9xJnGYBbcd
         qnGw==
X-Gm-Message-State: ACgBeo2bUyvw7I+m2E7lfivpLbE6Hh8Aky7Kupxqg0chpB0X4OucE9o9
        rEsOK+UACx8lDiAWtbjv15cFh1Tnay6+Suj2hjs=
X-Google-Smtp-Source: AA6agR65SsFfKYctriGVjs1lUk0TPQVTZ9F7E+llK1oHr/i8Cm6+sEdj/YlWG6uV+TTT+WxVqdEUDDjXhQlXILei2gM=
X-Received: by 2002:a81:ad59:0:b0:340:b000:368d with SMTP id
 l25-20020a81ad59000000b00340b000368dmr34373948ywk.397.1662299410698; Sun, 04
 Sep 2022 06:50:10 -0700 (PDT)
MIME-Version: 1.0
Reply-To: paulassidubroker612@gmail.com
Sender: sambieningbabe@gmail.com
Received: by 2002:a05:7010:26a3:b0:2ef:f144:c87c with HTTP; Sun, 4 Sep 2022
 06:50:09 -0700 (PDT)
From:   Paul Assidu <paulassidubroker612@gmail.com>
Date:   Sun, 4 Sep 2022 13:50:09 +0000
X-Google-Sender-Auth: wRbsIi6_qlrKebq-AJQvWkP04jY
Message-ID: <CAKz7bGYzKPcEAFxcOFCZO9Uaa8UnN-=u9f-0V2Bs4VseG5h7WA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Greetings, trust you're good. please check and reply my previous emails to you.
