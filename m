Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D18D253848C
	for <lists+linux-ide@lfdr.de>; Mon, 30 May 2022 17:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236023AbiE3PQt (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 30 May 2022 11:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234795AbiE3PQ0 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 30 May 2022 11:16:26 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B021BE650
        for <linux-ide@vger.kernel.org>; Mon, 30 May 2022 07:15:49 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id p74so11428731iod.8
        for <linux-ide@vger.kernel.org>; Mon, 30 May 2022 07:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Zr7FJr/ROqrH3KPFcIbpCq/ZL9h+i4UX28KOdEhJPUU=;
        b=YfQ8QJXQt2N3rIK1nvyk22fW7NLMuAenCZKLL8VfDEUGYmRuQfrykf4qgFksIJ3Wem
         xIZL6HeqBbW5H9hS4gx91txoeHRObKBazXYtrZ3XGYFOLXqhsShaA/Vzw5mcosUmDxOE
         fQ1Xy9+nDPgDHQA3pBrmjrVfLkHpGdxo1+cSJ6zdG5zP2bnt4iSOi2DU29xESPPuYocW
         cLXL7g0dU8qZR0MpC4EYiL3v4AtXqOfeSDsojEozYabxagkBhgimesBw6Kca0MVbz8B3
         gd+TtBIcs+9+cQMvftuBE+i0jHg/QlbROee+Bc//vRI0xfgid/0/v6fwB3pfByjWO1UU
         cyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Zr7FJr/ROqrH3KPFcIbpCq/ZL9h+i4UX28KOdEhJPUU=;
        b=PeuNuwvDrwhNtrJY/WJHmb7bQ+8NZM668mjkcw/27xstWVdXD7qXzyin9vwLibdVUg
         lL3uPpqWJauluxF4PAPutV8/5vxoVjxemEB3LUG2LrcXPzUfM1M1N5coJODGXPt52gKj
         KsuHsFxDXEH8ZNl0SaTcH0KI/EHoQQlIc6ZwhghnWExbV4sNk1ufV0wTGwllnlNeDLGC
         McKZIsD1DbIrt2bESWC7h+mv/OKWUFSXb3vJ9dnEyJWbL5kVfpTfpf2GRRhy/taJt34B
         qyrXbbv49bB91lS40cHvij4r8BNSQO55L4hnDE6MAuFG0ajSOweEmzYM/DVai4cT8Oop
         41eA==
X-Gm-Message-State: AOAM532UF0YW6DAsOCGPGMTp6+rRGjLubWI/6SmCnLrGYZoHKlzfXPjR
        xVCdQl+0KlLZZ5VTg6jCvTZql1+yneA/pQjCgTs=
X-Google-Smtp-Source: ABdhPJwLmjce1k+3NBlLfpoV4RhjCKxkRAdtsMT2SVRaQAzo6C1eOis4BM70rpzpM6JGVm/WicrsraBR7r94w9WhBGE=
X-Received: by 2002:a05:6638:4120:b0:330:ab90:faa7 with SMTP id
 ay32-20020a056638412000b00330ab90faa7mr13632902jab.264.1653920148899; Mon, 30
 May 2022 07:15:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:9746:0:0:0:0:0 with HTTP; Mon, 30 May 2022 07:15:48
 -0700 (PDT)
Reply-To: mariam002musa@gmail.com
From:   "Miss. Mariam Musa" <akpeprosper1234@gmail.com>
Date:   Mon, 30 May 2022 07:15:48 -0700
Message-ID: <CAAgHAvth6gB+HWgqBMz0AahqF93qrTPfqkhf6973VW6QBLbzzA@mail.gmail.com>
Subject: Please I need your help my name is Mariam.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Good day,

Can I write you here? I have urgent information for you here, With
utmost good faith?, as you know that my country have been in deep
crisis due to the war,

Miss. Mariam Musa.
