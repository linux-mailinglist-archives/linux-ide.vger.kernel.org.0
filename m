Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04D855EB150
	for <lists+linux-ide@lfdr.de>; Mon, 26 Sep 2022 21:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiIZTaZ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 26 Sep 2022 15:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiIZTaY (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 26 Sep 2022 15:30:24 -0400
Received: from mail-oa1-x42.google.com (mail-oa1-x42.google.com [IPv6:2001:4860:4864:20::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3E23868F
        for <linux-ide@vger.kernel.org>; Mon, 26 Sep 2022 12:30:22 -0700 (PDT)
Received: by mail-oa1-x42.google.com with SMTP id 586e51a60fabf-1278a61bd57so10574815fac.7
        for <linux-ide@vger.kernel.org>; Mon, 26 Sep 2022 12:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=rA5xeXD0TyjUhjvsrx6ejmOzOVqFLC9Uf1Of+5mK/os=;
        b=gphcxxEMn90zrJiwxd+Tzx4hPLJ6ARFvHuMWuASeYcvRsTXBWJF9nLniPC9na4y2z1
         9a3iRwQvIgnvaoaeTozFR4byJaOT+pVlJ7o2hQLCqRV2Lsmhx8leX+8RyLg1kYM2oxLR
         cVVgzwsOJvXG4zHEOeEOwL7vwIfcKnTc7WeZsuI6Ftw0I3pjgCqdhIk1GFsCXHowNwUo
         +7PTL96GM14NoE9snttptEHJ/Wdgx9Hp+pv2FWsmfv7tbYs2DsNPUwIwXDBY0Wo1RCR3
         L5TrVdDBagqgP0tmy2lhoshBIW8oM/SHYNY3y3xju5u0fNCMRT6D/IJ0nj/gLcNqCXGY
         WOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=rA5xeXD0TyjUhjvsrx6ejmOzOVqFLC9Uf1Of+5mK/os=;
        b=a0XfLb7yED8tOCdEGTHnFkMthdMCUa2OcOuVErZiw9fQzhr/oVm5e7GNQhWvHMynqf
         v+mGAhdiR3AK4vANOa9R+h7DADLVXPIdGZrU0ZY+SOq1m4vre2KKT7B40QVQ6o6DdoPN
         iMlN/WM7+ztuBizK8yZqPeU0eSjknFkQoQ8BxZsjWiNGLk3M0E5PeXKwDWvZLTVZGMWE
         ivlWoxUVClcJxA2Je4+v66v77Q1U9bsw63vYdDQtnhMT/FqCxtsgkE0l4FEdpsqZAtEG
         7lFx8wKXyFd/N6ix4cJXJwvKY+/jd7wwQyqoEm8tg2hPdraH0Ahl+5SNgHKKkNLqdvtp
         cE2g==
X-Gm-Message-State: ACrzQf3JmNpk34HiZP8T5MmonGCAbkuQTa998o5ZXd3sZ5kEHfmBplqp
        Af1nYrMNx1i1Jr+gxW2m3sQaVmioUG4aaFPgr44=
X-Google-Smtp-Source: AMsMyM6W6PAcWorxaMwG5LQ/ZIUWafx7mO8th7lDN18N4aqQA4KxbYHhmKGLYYDuTS+TYZyDcZ6UU64ckTJ4ghF2CPA=
X-Received: by 2002:a05:6870:783:b0:11c:7d1c:6ede with SMTP id
 en3-20020a056870078300b0011c7d1c6edemr151616oab.239.1664220622029; Mon, 26
 Sep 2022 12:30:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:7253:b0:c7:f373:780 with HTTP; Mon, 26 Sep 2022
 12:30:21 -0700 (PDT)
Reply-To: pointerscott009@gmail.com
From:   Aminuind Aabawa <aminuindabawa00@gmail.com>
Date:   Mon, 26 Sep 2022 20:30:21 +0100
Message-ID: <CAP_Jfyq5V1pweG2VSZ=xQe4B=TsvP6Qu5GuwXwCg28oLvXNrOw@mail.gmail.com>
Subject: =?UTF-8?Q?Bussines_offer_Gesch=C3=A4ftsangebot=2E?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:42 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [pointerscott009[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [aminuindabawa00[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [aminuindabawa00[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

--=20
Hello, Do you have a projects that need urgent loan??
Granting out loans today in 10,000 / 500 Million to Interested
Investors, Companies & Private Individuals.
Revert back if you interested.


Hallo, haben Sie Projekte, die dringend einen Kredit ben=C3=B6tigen?
Vergeben Sie heute Kredite in H=C3=B6he von 10.000 / 500 Millionen an
interessierte Investoren, Unternehmen und Privatpersonen. Kommen Sie
zur=C3=BCck, wenn Sie interessiert sind.
