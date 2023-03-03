Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 902E36A9ED7
	for <lists+linux-ide@lfdr.de>; Fri,  3 Mar 2023 19:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbjCCScQ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 3 Mar 2023 13:32:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbjCCScP (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 3 Mar 2023 13:32:15 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C82E5FE8F
        for <linux-ide@vger.kernel.org>; Fri,  3 Mar 2023 10:32:14 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id x3so13828717edb.10
        for <linux-ide@vger.kernel.org>; Fri, 03 Mar 2023 10:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677868333;
        h=content-transfer-encoding:to:subject:content-language:reply-to
         :user-agent:mime-version:date:message-id:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LaOTBtKMwRZiDcFQS8k/nw3O839PhUwgA/MLGTdCM4Q=;
        b=Y3T3gC+oRlIo6n+CX0G6267+XqD8whn7SJBAdZhSTjg1nkB3UNwnPLd7yZ+lF7Cwkw
         WkgzS6LpuKKayV1yg0LsWUKSZc4LpvfB27Is8pvaIBeiwPFQgNzz3pTPIDxuJy3kKaG9
         FkyQ7qRsxA0POfmDSWa3FDRaT7YS77nAOWAL6EOobCwM36jYoxK7RhyBGA2C2pW4HJ5k
         TOfRGfGD3stxy6rQP656+WBKg9wZLY3eyKnOgV7e4VcBxPDZxVKJsdD6dJNyv156yeEJ
         wxUBbnaI/dJGYAUVTm4aPkCNye4SxuUNoW+tixSBO0W47m11xzASfsgd1lM2il+sBS3m
         LAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677868333;
        h=content-transfer-encoding:to:subject:content-language:reply-to
         :user-agent:mime-version:date:message-id:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LaOTBtKMwRZiDcFQS8k/nw3O839PhUwgA/MLGTdCM4Q=;
        b=ZtSuKHLgIYsLXo5ZY3uA1tCnuCotKvzLLlpWhgHs1SjBrUz7AzbCLhUxoRkEVQ9ROL
         v/EwmYibKZ2VM/EOcOU62Xd//nK4RMlPziKdyDdXrNSGyCR8oWPeuqpboPw7ILt1U52b
         tkUC5J1uExVQdnpngpkrHXyPwUmLhhTKCF6LB0b4g2QLEon2sZH09kZhB8vEFlOQ9yqd
         O1UU7kCz/1zIWre6Mv0pJG7/qSQIuiQfq2fURrNYTdlMXfV/1On0G5yPm1w8PxAX45R8
         0UIPKUJryoYryPxoIUVKFPFIy1u4xOEnvNob833zohMRJqaShTZBdYoxjC6VGhwUq1cW
         GkDw==
X-Gm-Message-State: AO0yUKVGakBnOkKXxbZ/nlhCve8FjnarLbR8JNxWFkSVhxwoD4eL3G84
        gAzhVlyg2wDl/NlcfFRuKw==
X-Google-Smtp-Source: AK7set+1+PT5MkGaEYbMyqWwZRpIQfSCAeLPRSBSUVcyxhhcLfg1dVQ9YHaEuHgZACzHVINdOP5QYw==
X-Received: by 2002:a05:6402:14ce:b0:4ac:b528:5727 with SMTP id f14-20020a05640214ce00b004acb5285727mr2849613edx.1.1677868332838;
        Fri, 03 Mar 2023 10:32:12 -0800 (PST)
Received: from [14.2.2.97] ([196.171.80.178])
        by smtp.gmail.com with ESMTPSA id n24-20020a509358000000b004af5001c7ecsm1459811eda.12.2023.03.03.10.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 10:32:12 -0800 (PST)
From:   Agbobada Beauga <adv.carlos.jude069@gmail.com>
X-Google-Original-From: Agbobada Beauga <adv.carlosjude069@googlemail.com>
Message-ID: <51a032f0-a529-7acf-6334-862f4774051f@googlemail.com>
Date:   Fri, 3 Mar 2023 18:31:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: emailoffice151@gmail.com
Content-Language: en-US
Subject: Re:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: Yes, score=7.7 required=5.0 tests=BAYES_50,DEAR_FRIEND,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:535 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4742]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [emailoffice151[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [adv.carlos.jude069[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [adv.carlos.jude069[at]gmail.com]
        *  2.6 DEAR_FRIEND BODY: Dear Friend? That's not very dear!
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Dear Friend,

With due humility; I sent you an email and there was no response, please
confirm to me that you did get this mail for more clarification.

Kind regards,
Yours in service.

