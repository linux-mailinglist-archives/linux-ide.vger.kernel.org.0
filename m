Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83B754F1423
	for <lists+linux-ide@lfdr.de>; Mon,  4 Apr 2022 13:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiDDL4r (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 4 Apr 2022 07:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbiDDL4q (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 4 Apr 2022 07:56:46 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2491A255A6
        for <linux-ide@vger.kernel.org>; Mon,  4 Apr 2022 04:54:51 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id ot30so9433019ejb.12
        for <linux-ide@vger.kernel.org>; Mon, 04 Apr 2022 04:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=7xs1Q8qlIPRjoqt2EPejT10ykTPGTWoej6GDOdjftEY=;
        b=Y1HtW4cQnQly2NsQcrFoWrVOS5oKJW+82pXsOrzpOCZdYjknS77KRNikxAxAvYjZRM
         WwcEjUmwd2z1tyW+zJEDHkNLzgcLDK36CPUWoW5iSFS/0M7T/DpBJshPAGlfyyw5qRZ8
         BhWpr0O5nwPEuZSwYV1OcgXC9cuFKJc9tReJ+LZ5Cdl9tUF327Fq08sg2SL+hg1WF02j
         JXUcHVy/DEamp1x2L3VpB/DZZsGOL/Or/riOk946n3C8N7CK0yIJvXsFqQTEpG3iEyUh
         JY/0vsRKGX/tdH7t0UvjHzxWK0M0+7A2nZsKVMYxWeCZptT7EE6s/lCsIX6W60EQdjds
         Xlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=7xs1Q8qlIPRjoqt2EPejT10ykTPGTWoej6GDOdjftEY=;
        b=ehd8aEtKcwXijJ4aAyjFEUT80RDrguakDH7OgNw+92zs7y+ZiWr3E5a3WsReiMarEs
         qhC7cAf0QfX9bwMbwNhyT0Z0Ls83KdaDtpLdMc7oiNf6kMnJyBQJgDaNTKxO8ExvSMp2
         vWRoy3IjkG2rS5qWPLDG0kXZ01mR7HtXPYJDSPKFnFub7M3Ek8l7c+aXd/1J7immJmZy
         hKwKTDH4sU5CJ4JC8F01GmrdtUKIgsBDK8vBfTWo6XImZkwXf/28smPMlFg1/FtfKKDT
         1X6cXyCq1I0bT9HQRTraLL3L2ViZV/gBzM0dyPPl8ZCP2sdpMqfR1WsuQKk4HBhT88qW
         tOoA==
X-Gm-Message-State: AOAM533EjlDtoX+QWUsv4dh/pkN0rIKKjaDaQeIQ3FMbgoMWJPdHISlA
        4MSUkV8lrjDchdFImT+KjzXMOL8NYXu7eN35eXs=
X-Google-Smtp-Source: ABdhPJwIK52/Ys7FbdV+JQmb0ZUHVt/gm+Q+rFNFfZmZFtJ0uqFMxwb8kQk+tuNAkiYtNNOyXC/4qLHtqF6CxaNGJa0=
X-Received: by 2002:a17:907:96a6:b0:6e3:9c1b:f403 with SMTP id
 hd38-20020a17090796a600b006e39c1bf403mr10310733ejc.524.1649073289643; Mon, 04
 Apr 2022 04:54:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:7e99:0:0:0:0 with HTTP; Mon, 4 Apr 2022 04:54:49
 -0700 (PDT)
Reply-To: belindasteenkamp14@gmail.com
From:   BELINDA STEENKAMP <tiffanysmithforreal17@gmail.com>
Date:   Mon, 4 Apr 2022 13:54:49 +0200
Message-ID: <CAJSMfVaPOX280A8DN4j5FY+tiOd_we9Wk0mXYZov61GATNqfNA@mail.gmail.com>
Subject: Easter Promotion!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:62d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5009]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [belindasteenkamp14[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tiffanysmithforreal17[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [tiffanysmithforreal17[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

--=20
PROMOTION WITH 2% INTEREST RATE

  We offer Loans ranging from (R10,000.00 =E2=80=93 R5,000,000.00). Loan
duration is from 1 to 20 years (Maximum) No collateral, No ITC CHECK
and Blacklisted, Under debt review, No pay slip, Low credit, Self
employed and Business owners are welcome.

CONTACT:
Belinda Steenkamp (Mrs)
Senior Loan Consultant,
Call only ... { +27671850879 }
Whatsapp only... ( +27677352072
Email: { belindasteenkamp14@gmail.com }
