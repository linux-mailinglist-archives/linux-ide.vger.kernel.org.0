Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3F168D52F
	for <lists+linux-ide@lfdr.de>; Tue,  7 Feb 2023 12:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbjBGLJl (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 7 Feb 2023 06:09:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231627AbjBGLJf (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 7 Feb 2023 06:09:35 -0500
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3915F39BB6
        for <linux-ide@vger.kernel.org>; Tue,  7 Feb 2023 03:09:13 -0800 (PST)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-15fe106c7c7so18548925fac.8
        for <linux-ide@vger.kernel.org>; Tue, 07 Feb 2023 03:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=52pQ4ry0LUmXlUqqJU+hhNA5UvWOgSZ0ZDQ1upN22Fs=;
        b=Sj8erkbN3JVHM/4YGlV61/2OhMJ5Exm5qsAdYKkigcVghj+Ven+Zd7Altg0+ttRRMR
         cdD7BPVhwWPzKdRpNnxJ/Alp84HDmDXOhuiVgqyaqA+8AFrAoG93Lr17GDTqd18y1a0b
         k4x3dK7X4V5vC5SJ8elkW4v0ZzJPW5qTHl+BIckzxk6BjcR4gZuAjYI7KCUtQjBhYrGN
         aZdqj+H8k92267qikQbf2gBanQbcK6Fw+WI9pLeDcVvYHFC5LqrHDkc48WtzCmkajvAy
         jn/2AP4pmcyFdU0DVLXCcLN8EW7aV2bVX2j3D15zByPFknO5sxfIIpIlNmvmCVJEdti9
         89ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=52pQ4ry0LUmXlUqqJU+hhNA5UvWOgSZ0ZDQ1upN22Fs=;
        b=Y49YTyz8cjGELoVYm4Z2bhzQva7WVUUyIJMH2KIdMv/UAsm2tyGVVkVQ2tw33U219E
         jlXTFw5BlIt4h+q62gJv1iH9KEC+n3HiyRz8Vl0tabsopTAJZrl4TJp1C7fkvlrTIcL4
         GO4+op8gsM4i8K9mHh7zyiir2Rp8HeZJAofjRJPtC7qj6w/3faHPHRclVnZm/259QbZ5
         k6iNqWoRAL4g3JfhAu7rNzU9BkjU55ENdsOlR79CZz6ESDLAV0UO3HHP3CNE4w5Re1nK
         BsLFc0x0saXHE2CCQQXLu2NAOF29qbgY9HE9L8sv3WJxsjTbKaHQG/trz5bkiW1IJiem
         WH7w==
X-Gm-Message-State: AO0yUKVC+PQgWaXe95tNruoUtLuTBDn+RJuf/IaIMCGKmsySGVyaJy+T
        A3yKprdlLbOiixuSnxxlTlnpWpEfNpEOb0SUqn8=
X-Google-Smtp-Source: AK7set+qxQhzKrq3r+R/NAPKhkUUEPdvp/ht9LnVh8DupJgoRS+yzWrghGB50VndQ44FyVrDUpg6nSNV7w70k+bpYXY=
X-Received: by 2002:a05:6871:72c:b0:16a:24a7:28ab with SMTP id
 f44-20020a056871072c00b0016a24a728abmr498329oap.125.1675768147439; Tue, 07
 Feb 2023 03:09:07 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6358:50c7:b0:ea:cdc1:9aff with HTTP; Tue, 7 Feb 2023
 03:09:06 -0800 (PST)
From:   DAVID KARL <info.davidkarl1959@gmail.com>
Date:   Tue, 7 Feb 2023 12:09:06 +0100
Message-ID: <CAH7gjpwSh-6vRRU6TYo6QFVG-K7eSk0AAT0EbnqsE1JJD3tsKw@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Dear
Good morning, Did you receive my message my message i sent to you
yesterday, It is very urgent you reverse back as soon as possible.
Karl
