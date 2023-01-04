Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A84EF65E0B2
	for <lists+linux-ide@lfdr.de>; Thu,  5 Jan 2023 00:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbjADW7Q (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 4 Jan 2023 17:59:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbjADW67 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 4 Jan 2023 17:58:59 -0500
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6873D485A2
        for <linux-ide@vger.kernel.org>; Wed,  4 Jan 2023 14:58:26 -0800 (PST)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-1441d7d40c6so41453083fac.8
        for <linux-ide@vger.kernel.org>; Wed, 04 Jan 2023 14:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:references:in-reply-to:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XppnWxwUDd4VKlDQMnttNa0YhBi85GdHW05upV3mZfc=;
        b=ZesENJgWrr72LfVc3bHH/7aiHM5S489CM/H7+bUD8zUJo+4mHUaQ0dBVdvSdd1NbbI
         NTuMalKJpffQyEbz04wQWbf7t/vDMyJGF1b+OLSm/M0zwpnsTpyqmCRTrxtXxYiOtRPj
         pmJNL6lMETJv6cZ1dzPdnc5161ES4TAYgj7a4sLgELmO1aoGxClS2ZsK4QI4ozUwIPtz
         ukqyspW9pJII9O8jq6WrneggguPYZivmOArvwFc9psuz6KaRZc/rED5h/FXRvOCe3zvE
         FAkAsv7dM4GwevXDd05BLo+ZKijwPlgu+oPYjnn63c/C1gdLf1fAvp4e82wiiw2vsxoF
         kH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:references:in-reply-to:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XppnWxwUDd4VKlDQMnttNa0YhBi85GdHW05upV3mZfc=;
        b=6WiM0wr7Nab7VXuD0K3ezeL8lRgHDSliscGkl6FNsc/dxrEK9MbxDunsAVRHl9vl3d
         QgjDq24XI8tUJh4fzKTdfWx1c1wYoFz1gwsZpYlm4p3fTd4GXlFk6qWkg778nEDHeWf4
         uMJPbOx2UObanFOfEer9GYy4px6DGZNeV9nPitzr+2/QMC2F+GkDBOlMbJ43aMPN/1M8
         eLkf2Ew23S8ABc+UXJzLQ9f75cdMmnHecyArIds3bGQi5K1GdDg6t74kiUeVeegHNj7w
         u+F3HCewBjVk0WLmanZu33k9goN2jvd/EUkxBP6mHUu1yyRqb9/56O7j5kUTq5Dr7owU
         Wjow==
X-Gm-Message-State: AFqh2koyOxZLWpgqEr3U1j1v0X5mdW1lKDqc/qt9BfJwPHO9YL1ZbDcN
        rW/2nJGIfcBn+DRnIrHkABzXkJ4DxsYxqAX8CgQ=
X-Google-Smtp-Source: AMrXdXuAtTZdbgWqZ4LscsRNiMGrJlMOtRiRodG2JJHbXL/H3Mklt8gr848xW79aG3s27numVOaaNJy7Tz97RiF2BdY=
X-Received: by 2002:a05:6871:823:b0:143:8f03:f4a1 with SMTP id
 q35-20020a056871082300b001438f03f4a1mr2766543oap.66.1672873101320; Wed, 04
 Jan 2023 14:58:21 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6358:3395:b0:dd:2e0e:b3cb with HTTP; Wed, 4 Jan 2023
 14:58:20 -0800 (PST)
Reply-To: lisaarobet@gmail.com
In-Reply-To: <63b56dba.170a0220.91656.9e62.GMR@mx.google.com>
References: <CAEnhApG+e+8r3OZH6AEdrLw4eZU5eh=v7=5g+1hJnAhBGgb5LQ@mail.gmail.com>
 <63b0d1a2.9d0a0220.6acd1.a273.GMR@mx.google.com> <CAEnhApFEx1Mp0bjsef1BBV8BtPNDo9d7jFp7TLHyAqnRB-kVXA@mail.gmail.com>
 <63b0d485.050a0220.af864.79c0.GMR@mx.google.com> <CAEnhApHdTsMzk7NbjR3tOZ5EvhR+WONNENQAve4AaeVDUMUrSA@mail.gmail.com>
 <63b0d4ed.050a0220.12815.b8bc.GMR@mx.google.com> <CAEnhApFc=knqabn3upQJ4ggPCjfUOA_dJqJZ6ibSXUt0N7BA+g@mail.gmail.com>
 <63b1d9c6.050a0220.f63cd.9c2e.GMR@mx.google.com> <CAEnhApG8ns1naGeGLykvoNW5WFhw0Ui+bTbrEvYVdf6kmunEnA@mail.gmail.com>
 <63b1de11.4a0a0220.5f4f7.44d6.GMR@mx.google.com> <CAEnhApGCngK8GgqKPLO8vtUaqpQGESGyDRq6iP0sg0F+03FYuQ@mail.gmail.com>
 <63b2032a.050a0220.af864.bc29.GMR@mx.google.com> <CAEnhApHS9e1bdLkiWKKG9Xvf4eH8jXpNXjGPemTWqEn4_oaWbg@mail.gmail.com>
 <63b26c69.250a0220.c057f.7287.GMR@mx.google.com> <CAEnhApFH7TBrSFJe0A83qFchZQyBpta9sfjS_8wSVixSk+Oj2A@mail.gmail.com>
 <63b27572.050a0220.af864.d257.GMR@mx.google.com> <CAEnhApH9oxpCQ4ADY8tZQGkYU3sdUxm4YhmKwKddwCNW=f9_Gw@mail.gmail.com>
 <63b276eb.050a0220.a187b.7c0b.GMR@mx.google.com> <CAEnhApHd=992A2jcOVqsms=dFWPWPntFQns_OqDG9dXpe3vD7g@mail.gmail.com>
 <CAEnhApHd=992A2jcOVqsms=dFWPWPntFQns_OqDG9dXpe3vD7g@mail.gmail.com> <63b56dba.170a0220.91656.9e62.GMR@mx.google.com>
From:   Lisa <fullerpeter01@gmail.com>
Date:   Wed, 4 Jan 2023 22:58:20 +0000
Message-ID: <CAEnhApHnYXB7MidNNb_W88vxy3HqCczJsBvcO99NmEhSySH_MA@mail.gmail.com>
Subject: Re: Delivery Status Notification (Delay)
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [2001:4860:4864:20:0:0:0:2a listed in]
        [zen.spamhaus.org]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:2a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4857]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [fullerpeter01[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [fullerpeter01[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi,

Just wanted to check in and see if you receive my request?

Thanks
