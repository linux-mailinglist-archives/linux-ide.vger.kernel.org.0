Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D319A6EFBD7
	for <lists+linux-ide@lfdr.de>; Wed, 26 Apr 2023 22:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234609AbjDZUsa (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 26 Apr 2023 16:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbjDZUs3 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 26 Apr 2023 16:48:29 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07DE114
        for <linux-ide@vger.kernel.org>; Wed, 26 Apr 2023 13:48:27 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-3ef302a642eso37229531cf.1
        for <linux-ide@vger.kernel.org>; Wed, 26 Apr 2023 13:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682542107; x=1685134107;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JL3yT3Q33W5/BCQtgOVvz2cK4S2v0dqNTi6RS5aes9g=;
        b=jmyQ8oiwVLbRJnZSo+x1cDr0coVtWaDiYP+3X3xPymDpEeOKcoWwQMs9HDdAlmwc+4
         ZJB3ppZgVFyKg6RaVgGEBBvMuy6+llkH2zwPaaA2pgTglzbH4fM8+naFiZyevBj5nSXb
         1exaIFYkRPoUrSyF4KDnehDts/Y6reST15PJVpD+bh+Do+pzGglSc8KCgd90ZDY06r/d
         y+ipc71M0PodCcvnJ627i6AawnQfSEcFtBG3KGML2lseXiC/D2Crb6aLQkAamA/A2byW
         x94HymCt7+wR16bPLAZ1UsaO9B84+XLl/0c3vORIifh+daf4WEGeZ6tdZI03AN0PeksB
         v7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682542107; x=1685134107;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JL3yT3Q33W5/BCQtgOVvz2cK4S2v0dqNTi6RS5aes9g=;
        b=Fvi2k4qg7soF4h8c9/OG2N3PeHOS6as7Oc9pSuhm9N9vFb3zxUDfIM6in/yOlNf/3s
         bhFHbYZLfr4nhwSbUqLZE0Jo5NW7hOYV3dlrXLnCt0LVxasQbf/xHE7o8UKpMYBVax/b
         ONZcN+I2fKjALHrJuOy1dSFkF0yiEtZJ5wgjAWHtsokkUgMjTnTf+eRbMSykDjXw/iHR
         NAwviP8V2QT7KAi2AqLDE+kgVvq69JAMMRYdODavCiSnIXN4mdPEEsU9Tg1bmYssGToJ
         UEJRMcnYCXVIfn6yOtizTqnjCNMqiCJLibXzys1zQc3HtVPxRCJCrphkJyBOA6iv6YCB
         4wqQ==
X-Gm-Message-State: AAQBX9eOcE5kKipFVrihQmbcLh4P4zacL2jWb0Tk2JLNb4wyL9G8j09w
        265H6o5KBlV0FV9+NEw+5rKyPxrzQHxan7jvuw==
X-Google-Smtp-Source: AKy350aekgc0UxvOYmM/T2pvntDGRe6KzuO8bAIxq0mkMGtsyePhGn+mHJJ9XfecAZK2KJL4xdSoC/j1gPwI55/1eIM=
X-Received: by 2002:a05:622a:610:b0:3ef:5bbe:28ee with SMTP id
 z16-20020a05622a061000b003ef5bbe28eemr33278909qta.52.1682542106813; Wed, 26
 Apr 2023 13:48:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:622a:134b:b0:3ef:cc78:1761 with HTTP; Wed, 26 Apr 2023
 13:48:26 -0700 (PDT)
Reply-To: klassoumark@gmail.com
From:   Mark Klassou <chardonlucas12@gmail.com>
Date:   Wed, 26 Apr 2023 20:48:26 +0000
Message-ID: <CAAWCeYcZ2O2WQwZ-6XdK7O58QzcdYFf=FYaLHonkkUM9rwiBDg@mail.gmail.com>
Subject: Re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Good Morning,

I was only wondering if you got my previous email? I have been trying
to reach you by email. Kindly get back to me swiftly, it is very
important.

Yours faithfully
Mark Klassou.
