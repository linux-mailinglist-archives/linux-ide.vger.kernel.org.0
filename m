Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB036A3605
	for <lists+linux-ide@lfdr.de>; Mon, 27 Feb 2023 01:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjB0Ax0 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 26 Feb 2023 19:53:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjB0AxZ (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 26 Feb 2023 19:53:25 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A25E3CDEB
        for <linux-ide@vger.kernel.org>; Sun, 26 Feb 2023 16:53:23 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id kb15so4449617pjb.1
        for <linux-ide@vger.kernel.org>; Sun, 26 Feb 2023 16:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x4N+ipv4Z0ueanE2uVRFnU+7mwUn4iLsJ/UJ4pQlXTs=;
        b=LHNnmMqlRinVsovMLI72m5nB4i2EbbrCzpm4MHmXUJGJjkeAKj14q1b8bnuWCtdD0E
         60sA0wzJ2D3UqUMbkJP7NFHqhq8aDBk621t57MLM4q/DKKm9JwSy/6LzoLi+hySEdcmp
         O7nifztTNR0+DaJBFhSdMPYxXRv1xOpbrvApCrMo6ul1N652UyegmTm1pTWZ9p7AQqL9
         Lb1sir05IwZxsDFczC7ojNZeeJe4cHePnUbYkFz7DzyJ/fNvB6Og8v+K9HAg5T9UpgFt
         Mi+jG9LaqYUSEANt5WwCBGl4eiH4PiOqhldW9MlQgMkAYCQDT4VPf5UuCO3TK7nmSDNg
         ikOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x4N+ipv4Z0ueanE2uVRFnU+7mwUn4iLsJ/UJ4pQlXTs=;
        b=Kl1TKw+of1PZcTPNnqlloO5REUgA4RSP4S6ducxE9xEZeoyHuGzd9uMki56fSlRObI
         LqXfOppAcdUnb2MGtysdntYfIq2HiVMmKJO078eYTs6m6nvd5Fx2MP62xGdA3WDRcp3A
         UJqO177WdTCtJ4M1W0wHbcwg2UqI0j3EczggwTfbJMX9ZpTFMMZVdMhcaSWww+PyRx1U
         nom7t6ok/ndTigY+nWeYET/q1aXOndbzeebbazf8oVSUnkbnNr5L0lwUcaYch0maMcPl
         Kc7aF0Z4wuz7KQe9JDYAu41j/S/tjSMae2PTKAc71WJhin7hQ/ZPPwtAW6k7lLZymvJ7
         wOlg==
X-Gm-Message-State: AO0yUKWbHgt/MduKR37w0PP9pyqkJJvjTx6SYLqiS9nvjd5AiVkrZ5nu
        8PtwglGKtr85/qr/GWHvRhy7GjbrHkb4otmV+Fs=
X-Google-Smtp-Source: AK7set9irzg4WNS2cWlOmsifL8YEo4dCv6Fu9WFvMm6wly0CMiOl0m9HTsehWK+iXT/dlzpRejbi26zRq3v8nIebt24=
X-Received: by 2002:a17:902:f7c7:b0:196:1cc3:74d0 with SMTP id
 h7-20020a170902f7c700b001961cc374d0mr5347734plw.5.1677459202928; Sun, 26 Feb
 2023 16:53:22 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:3255:b0:41f:988f:1328 with HTTP; Sun, 26 Feb 2023
 16:53:22 -0800 (PST)
From:   Elisabeth Johanna <elisajoh4992@gmail.com>
Date:   Sun, 26 Feb 2023 16:53:22 -0800
Message-ID: <CALjaFXLcPvLATmP_+m_gTA9ZjWQQDzcQXyCJi5AxVrY7Tv-5_g@mail.gmail.com>
Subject: We finance viable projects only
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Attention: Sir

Our Company is willing, ready to help you grow your network and offer
you Loan funds to complete and fund your existing Projects. We can
send you our Company Terms and Condition after review of your project
plan and executive summary of your project, if you are serious and
Interested contact us for further Information:

Email: elisajoh4992@gmail.com


Best regards,

Elisabeth Johanna
