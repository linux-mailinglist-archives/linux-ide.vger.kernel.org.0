Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8513C69649E
	for <lists+linux-ide@lfdr.de>; Tue, 14 Feb 2023 14:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232651AbjBNNX7 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 14 Feb 2023 08:23:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232698AbjBNNX6 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 14 Feb 2023 08:23:58 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D1C10E3
        for <linux-ide@vger.kernel.org>; Tue, 14 Feb 2023 05:23:53 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bp15so23382309lfb.13
        for <linux-ide@vger.kernel.org>; Tue, 14 Feb 2023 05:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=UnQt5ER+kDscL6d+bt2JVRgL+YyT++jWDfRzAvEkWP/qEJDmHicImE/zAwcbi7JdMG
         T/6dJ/WmI/fpvcJQAQV9S6BsJJyi3QE/XpTRjDQbzzSfDjBMrXLi49UVqohqUUgksyj+
         Wo1jG+ZBWrxpCVVBmif4m6cM1V7ylboRkKz6I8sDts5QN5rfsGHxAs8mimA8+EA3CM+N
         TA1ERy+cV+7NSfKD5lYPpLlI01vLmD0RCWPivvPhG6NQ6UYTeTjNToL9IWdFm6AUt5/x
         DADaDxuGi9UctKWEYFCjVVywnI/3dQ+Y3YKiVOZvmnGjCTqlIQLNXUo0tuVSKvcUFmO+
         CNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=hrDLwmAVZZrZgqzZ3nu0nuJuQYIH/vbvAK/Tq+nRdoA1cBQO9z8cM0L9vRqIEoWweI
         g24T7+hKyNXdSmUq8k8vd0IWTzSNg+ZIdWNV8wmyttRJ9MF8IuSK2SqBtwm1AQjWoRMc
         LN8LPRCVoiuJOGL+p4dBZDJUCwyxAN02HMbrM/tIdpaIk9CXeW4XO8TJnn8xrcwAPSrE
         RRODc1yuThj5cxMiyBEJe9NU6eMsc7Ciz8Rnd9aVErclzBCr+iowPpLD7TscsDkYubap
         s9PzARJlBcqsMvymY7VwzBUJViOo17ko7Lkw2ulTLEtHDFdqcurGJ3H6VPAYHVeAxqc6
         3YMw==
X-Gm-Message-State: AO0yUKXyTbZguiTlum2RKgNf3GV4VVsixcVLJLa2jf5dwX8Ml9ucJhCn
        aBwe1LzFKPhl4ma8H/ouMOMEYpr09U3CAyU/GuA=
X-Google-Smtp-Source: AK7set+FpzWaNyJEw/JG1h5aK6q1z2NlzFLQfj+g42fi7xJxajkONb3l4EcQXHEpDmRA7RbP4cKyi9GofOnCqK3yaKw=
X-Received: by 2002:a19:5e54:0:b0:4d5:ca43:7045 with SMTP id
 z20-20020a195e54000000b004d5ca437045mr285793lfi.8.1676381031857; Tue, 14 Feb
 2023 05:23:51 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:aa6:da55:0:b0:24c:773e:bb45 with HTTP; Tue, 14 Feb 2023
 05:23:51 -0800 (PST)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <drtracy490@gmail.com>
Date:   Tue, 14 Feb 2023 05:23:51 -0800
Message-ID: <CAP=2o6G_bvCRRaViRM1rD-gsThK=3vKxYWGeOgJwMd1NZMTuZg@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:12a listed in]
        [list.dnswl.org]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [drtracy490[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [drtracy490[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

-- 
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava
