Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB85D5B8F4A
	for <lists+linux-ide@lfdr.de>; Wed, 14 Sep 2022 21:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbiINThd (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 14 Sep 2022 15:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiINThc (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 14 Sep 2022 15:37:32 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0712873316
        for <linux-ide@vger.kernel.org>; Wed, 14 Sep 2022 12:37:31 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id s6so15611981lfo.7
        for <linux-ide@vger.kernel.org>; Wed, 14 Sep 2022 12:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=2vJHlqQj2D5js5r0I2Y1BVF4byvG2P2spYzFG+ucJkc=;
        b=E3/8Bjjvq8/FO5vxh7xOxsWFdBwzKK5NuarGYqYiiSeYwc82/p6sCGRAed937uHvqg
         EnCRPIvPReDViEpiyc2syhvCx4AK2T/IIoHLXGqWj2GXFPsjx+c2KlRcoFDIBvMNIHaJ
         SJ18RRa1vzFaZBrzuZFj9RILI5yDhP08LHqF1xj/siOoC2yoy/P5RoKBNCV9lwLUDlVW
         MRat76Hgeubeq4yJ6oF4FKM/T6+vcqebz/rNyjbDW3O65wTQSqxbThUUVIWzW8lKg6jF
         5hXuHdf12bbwbo9oEbUYsA9ONrxaCXcVKcrHXFupqCmwPLHRwWP84otEImzaQuLrNL2F
         0SSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2vJHlqQj2D5js5r0I2Y1BVF4byvG2P2spYzFG+ucJkc=;
        b=8EnxT/fdMyyVeWq2gLXFMDK1mEk+O5M3xGKwiLFc0N1J5E3LFQPHzdjnDCQfiWEFaX
         cw8BMJu15GTYZ7xqw8EwAXPtna8pGSsY2ioq4p8RDaztAVeyU5zhFum0mGyAI23zrmHr
         oiKouv8cb2Ve3scQRQifSJ6CmcIZKLxXgTl7AML+kgcojL4Wvcqmmikrd4VKXJO4x+fq
         WzApKV6qZODAAq9eV1p3jc0CDlFcoWcNbjaqbu8rm88Gz8Hx6FwrYVWloGA6P1uty3pa
         MfYQyAvIc/tpkXvRmw252QTLUCA0Xw+1zA3NTIvO9v82rHmbM8IaQyfu1yNqLU01zYRy
         NUBg==
X-Gm-Message-State: ACgBeo2b1iGcW3xZujeWupjfmjTPJDOPSmCKrw2BnfwCEwjfl2Cjw8df
        ScfMB/j2N6v30NjpZqvYvtXytTYgcykuuW0qZLk=
X-Google-Smtp-Source: AA6agR4BCfhqQgm8gAXtILuWNnoK7wzM6DfKnkLicWr9KIBiHeePFsgzwIyBQ0bOM9HKvlwwSy3S/jCgIT29hzAH728=
X-Received: by 2002:a05:6512:3f4:b0:497:a33e:365e with SMTP id
 n20-20020a05651203f400b00497a33e365emr13416444lfq.638.1663184249862; Wed, 14
 Sep 2022 12:37:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:a583:0:0:0:0:0 with HTTP; Wed, 14 Sep 2022 12:37:29
 -0700 (PDT)
Reply-To: bodeg41@gmail.com
From:   Bode George <fbiinvestigationf1@gmail.com>
Date:   Wed, 14 Sep 2022 20:37:29 +0100
Message-ID: <CAB01aPoUFFcrjCwB9m15YAtevU_cmE5iVhjBU8FtGeHXP=gWJA@mail.gmail.com>
Subject: For Your Attention:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:141 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5065]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [fbiinvestigationf1[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [fbiinvestigationf1[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [bodeg41[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

-- 
Dear Friend

I need a Reliable, Honest and trust worthy person like you to receive
my fund for our benefit or investing it into any lucrative investment
opportunity in your country

or around the globe as you may deem it fit. I have investment interest
in your country with this fund but if investment is not in your own
interest, whether investment

or not investment, this fund as you receive it will be of immense
benefit to both of us. Therefore, please contact me immediately for
more details and requirements.

Best Regards,
Bode George
