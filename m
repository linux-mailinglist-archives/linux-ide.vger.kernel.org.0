Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 013C8640705
	for <lists+linux-ide@lfdr.de>; Fri,  2 Dec 2022 13:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233519AbiLBMnL (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 2 Dec 2022 07:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233520AbiLBMnK (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 2 Dec 2022 07:43:10 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBDECC9369
        for <linux-ide@vger.kernel.org>; Fri,  2 Dec 2022 04:43:09 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id d3so5293091ljl.1
        for <linux-ide@vger.kernel.org>; Fri, 02 Dec 2022 04:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmMhzLW1Ky3aYrauJIOEu3sGYQQwtA8U3ujVQrJjKtQ=;
        b=fwvEyYeshCQcMkJ0cX773Y5H3LdJDxjyQFJeCVUHP3y03ujyNlqu/mue51YskX1flM
         5Dh+1xV908DBHKOt+jbnC0fjhT4cOKCQ8BZmI6lI6yM5VE5Q8ObUXs9a5PHYoIxlnoUf
         EXVS+ZnqZ6uZ1/VT5Nw/okG1Ni1Ed8GYe4nIpdte/toCW1K95V7xNAWddU2aLASstHuX
         o/ozEfJVpSlQvxHf0uDUCaTIG/oHmYWT2A9edp3HnnZ5Rj4PJuvkv1ijac0Y6yNKJXRG
         D9oBINslVdSrSYUZABzkbFOw0G8I2soII3FFede6Xh9vqjTn92pqmyLhZjnkF1qJe8sw
         L2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gmMhzLW1Ky3aYrauJIOEu3sGYQQwtA8U3ujVQrJjKtQ=;
        b=wPhJnYb/PRsidccT4SGsj9mrkp9lCwjWTkPq3EL+euMQ04GwtK0Zw+Egx5QespSI5R
         rzEWel8I2Y1KeuO2dChDAhF8O+5+H4yS3HD8wBeavv2dAPgkMHh3cUqgLVVTmjEul5Ra
         jGzFH785xU9dDfNp96d2CM8pdl/Xp/3rwmxsxI8Ndgh3RUwB6PULBcMcXO27JxjbeNhY
         3OzjlLgvZ40a4eOfODzSq19Mhmk5Ozo0B/ydgC7AsLov4c3Hx3PgbZc8kUVRMj+mzxZV
         fMw27TNkpik1EMHOigWygGJ05W7a4IvfWluWjpTajW8GXXu9+R3P2812N4s3WtqJr8pQ
         W9cw==
X-Gm-Message-State: ANoB5pn7yVkFlf+jhcvfHztfcyMG7VOibUqJtMxlumwX1z1wbGwXbxc5
        B4TvZSV9DKDd6JXfNW6v6o2ebmqpsM1jW2T5Oqk=
X-Google-Smtp-Source: AA0mqf5YP+14C0dcemoG8pui/qN4OR62VZUGH1e+tEF399RtSc9GLoZziWdxkiupF5L7OUOybim+a1kpncRLS0b610Q=
X-Received: by 2002:a2e:2c01:0:b0:279:926e:c9b9 with SMTP id
 s1-20020a2e2c01000000b00279926ec9b9mr10910327ljs.170.1669984988227; Fri, 02
 Dec 2022 04:43:08 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:a547:0:0:0:0:0 with HTTP; Fri, 2 Dec 2022 04:43:07 -0800 (PST)
Reply-To: chuinh021@gmail.com
From:   chuinh <flexmr271@gmail.com>
Date:   Fri, 2 Dec 2022 13:43:07 +0100
Message-ID: <CAAWWbs+-h=YdeT+1Cfu8nd6Vw2W+yUkQKs+pC0CK4EV91gaEqw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.5 required=5.0 tests=BAYES_50,DEAR_FRIEND,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:231 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [chuinh021[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [flexmr271[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [flexmr271[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  2.6 DEAR_FRIEND BODY: Dear Friend? That's not very dear!
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  2.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

-- 

Dear Friend,

I have an important message which i want to discuss with you.

Sincerely,

Mrs Chu Inh
