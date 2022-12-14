Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B964864C2E0
	for <lists+linux-ide@lfdr.de>; Wed, 14 Dec 2022 04:46:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiLNDqh (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 13 Dec 2022 22:46:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236598AbiLNDqg (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 13 Dec 2022 22:46:36 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A245D26AAA
        for <linux-ide@vger.kernel.org>; Tue, 13 Dec 2022 19:46:34 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id h10so11775558qvq.7
        for <linux-ide@vger.kernel.org>; Tue, 13 Dec 2022 19:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTJqkUg9tlm7AjuIGKJEdFJCYFhutqhsxr7B4Xa06U4=;
        b=Gv23pO7x1byx5kI3g45Um+yJGpeGyt40dxMVe1J2TwMP4cjEjB14F9vGW29+42jMJ3
         xDliSedesxPoZIw8oAPYe95R4DByLnmFmyB/bJRXoaLeosnYANjllyOkqjPXS1CU/WyT
         u8OTmqT9me5ZjJF24B9/wQAn+nG9KqPzQ68mpI/o/bSksI350ktfdd2YVoAvy1ra/pad
         qXtcgt+E/eQVAo/kY6GhOOUMpoFJsj/A5dt1iHil76B0r6pHueNC69mgr15AANizk0Ri
         L5tZwuPkcZIB6q2A9Vz3gtp8PVY/lj96S5zdVVHS7jM8+68Pk7d6nOgReMzCx8JkRY8p
         t94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yTJqkUg9tlm7AjuIGKJEdFJCYFhutqhsxr7B4Xa06U4=;
        b=vvhJNQXnyXc/PZFfJxqMjTRe5H2AMKqrwvefqguM4JHAk0Rq8sr+VCUgMS73if+v1f
         w1yU7GFCSUlxp06DYuX6YVV3ibyAICbly29K46gzh/FkJOJ8U7+J6vwDGLVJgb7zBK0y
         ezH3ZjvyhQkqHdRwFOgz0TMNBTpjiyHmsL7d5eoL/YbdSGw/5149KKZ0Ie7qtySrrvIr
         Its870K3xy/Sra6KjqG4IbO2Zg12OYnkQLZA1vkM7TBTSBBMXaU2t+z8LzOCum0oNhs5
         1S16MtDj/6nbn+N0SMPehXP2nbJOmgtLTP1uEMsBxuOxHTAjiuYMB1Qh7e1NafUXAjI6
         gUSg==
X-Gm-Message-State: ANoB5plt1zIokJD29I/Vpvm0+UhBWQJbCX/x+I/cQOPTwGRBP4wp2a0y
        nbE3EVBX9qMf8odmYHXosPmkoX27VcVg7Au+rDk=
X-Google-Smtp-Source: AA0mqf7uOx/fhryUNdQsbOhbwYuwgirdvLuFs8TrRFVXXd/4LbeMbIZw7W0wfGUFrLm5oLRm2KLZvsanpub4OOScRIU=
X-Received: by 2002:a0c:80e6:0:b0:4c7:1ae2:2787 with SMTP id
 93-20020a0c80e6000000b004c71ae22787mr35205864qvb.89.1670989593429; Tue, 13
 Dec 2022 19:46:33 -0800 (PST)
MIME-Version: 1.0
Sender: mrsabibatuhafiza@gmail.com
Received: by 2002:a0c:ed4f:0:b0:4ed:a42:457c with HTTP; Tue, 13 Dec 2022
 19:46:32 -0800 (PST)
From:   H mimi m <mimih6474@gmail.com>
Date:   Wed, 14 Dec 2022 03:46:32 +0000
X-Google-Sender-Auth: l3YGiTEafCfbdxbi-1lfbMTPacc
Message-ID: <CAAg_E+uvM_Pn00U6iKkNE6cpyVtGZo7Kd6Hzjk3E8YHd00UyKg@mail.gmail.com>
Subject: HELLO
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LOTS_OF_MONEY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

If you are interested to use the sum US$13.500,000.00 to help the
orphans around the world and invest it in your country, kindly get
back to me for more information On how you can contact the company and
tell them to deliver the consignment box to your care on behalf of me,
Warm
Regards,
Mrs Mimi Hassan Abdul Mohammad
