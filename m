Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 015FC65EF33
	for <lists+linux-ide@lfdr.de>; Thu,  5 Jan 2023 15:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233726AbjAEOsn (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 5 Jan 2023 09:48:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234312AbjAEOsa (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 5 Jan 2023 09:48:30 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80F45933C
        for <linux-ide@vger.kernel.org>; Thu,  5 Jan 2023 06:48:28 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id p188so4914648yba.5
        for <linux-ide@vger.kernel.org>; Thu, 05 Jan 2023 06:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JT2Gt7y/M3YLHVCyMzZwNsFe1p6EOvnpVpu2gl496w=;
        b=TxpC5CzW5NZ3iMneMosTeHrFxDGwEn13V77giIA0vr/IXBqDZ1zhAx831NdFpe8r9y
         HO/8gzV7ql5CSrlo6fWOq/eCbSo5aVOAuEPl4tNS9RZGnAUjhNugTvUdOAqVQ4Rl9G5z
         m/Fbs7+viOjU/UX6y897C9batzXCOB9Y2y8Yosv5KKNRIU3ZGVUg6BSOSgiyHI5htsuG
         m264DpWBmeVachwHAPH5WjqTpDGLrzIY97Vq7g42S1xO10iSaU4kQLvn+zS955hVbCA1
         r9BiN6KTYAGumKiuO4RpJSIKltFwrTb3zsg7uqTUeQxMZnMM1bzjXACraQHj8XBxgjKL
         mgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7JT2Gt7y/M3YLHVCyMzZwNsFe1p6EOvnpVpu2gl496w=;
        b=OBJa9PkBDVxvosYWk3epfu0tFBsurJ/gn3UP8ze5mqcmIaxrAZgpyXOr7rdJTZK2V4
         vLD1OZTXOMziEE1WuWcQTfJJCp0FFEcmNmVXXXxYhWsFOfnz6cFIiv+K9RXBC6xGHOk/
         MOIArCcXdQnNgRFPmYn/3BvReG3Y0uQW59WcVna3LB1tWAijJ9sXrTIBjzvCQO1xM3Yi
         8iK6ohBzP7bzknbUL3yjCLukSEia8iCt0hwAGaLeI2F8lLD4bjmBk3JJY66aV4PRVOjs
         jvEnnntq2XYQun5bbnSzsEOmgVZLNRDyLf5ucULWSQHuHA+uN6KsjMNt64fDTeE3f4bm
         QfgQ==
X-Gm-Message-State: AFqh2koz8AsXmZVBXeotchWBka9TbTjsN8moLI8WK6MBCmd6RETAzATm
        NJ0oXbYtrMsuFlxLiUggxpdBqaT4711fFYNEf3Y=
X-Google-Smtp-Source: AMrXdXs3IWRoQIh5lex0sKvd/mrVQqcym6C07SQwKJT4h7KBDIShWmQdJ5l45384ZPQwQK2tOUEl7ybfLW8zTi2gBaE=
X-Received: by 2002:a25:4f83:0:b0:7b3:fa44:5e69 with SMTP id
 d125-20020a254f83000000b007b3fa445e69mr385937ybb.333.1672930108068; Thu, 05
 Jan 2023 06:48:28 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7000:9842:b0:3de:3508:45c3 with HTTP; Thu, 5 Jan 2023
 06:48:27 -0800 (PST)
Reply-To: westernuniontransfer277@gmail.com
From:   Western Union Agent <kokoe92944706@gmail.com>
Date:   Thu, 5 Jan 2023 06:48:27 -0800
Message-ID: <CAH3TjNME4h6NrWE6gm5Yv3ZsyjCAhKzV_F9mmF51goJ6qC7-yA@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b2b listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.6256]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [kokoe92944706[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [westernuniontransfer277[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [kokoe92944706[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Good day dear,

This is to let you know that your payment is ready now, but we need
your details now so we can complete your transfer today without
no error, so please try to send us your information now
so we can continue.

We hope to confirm your information now.

Cheers,
Western Union Agent.
