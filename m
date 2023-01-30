Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB78680581
	for <lists+linux-ide@lfdr.de>; Mon, 30 Jan 2023 06:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjA3FR0 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 30 Jan 2023 00:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjA3FRZ (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 30 Jan 2023 00:17:25 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47EF423C67
        for <linux-ide@vger.kernel.org>; Sun, 29 Jan 2023 21:17:23 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-506609635cbso145484487b3.4
        for <linux-ide@vger.kernel.org>; Sun, 29 Jan 2023 21:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCJsXsDD/iNK9yC84Ot8gXJYydwvdgJYruOO+RMKvrI=;
        b=fcXs+ZF/YxY2PGVn0hmRerRhmO7VhL1C9QrP4ZAvWti6NM+24wx00SZ9BS9euUmmO9
         mUH8P5n8TM9Esx5HkkRpnGyEPQaPmQ70hHafn9aI9kM13kD/QqZjXsCniUcwLJztyZka
         OzXpeSmrgpj/3yIDXUNRArgbP1OAeSTA23XFwVBce9wQVMF2IbdFJYoF+h8SSwqi07O/
         7WvFsmzEYtUqhjZUHhK3t+BgYk55fGpAqUkQDb1M9QxglyqbG6/WAj28zPAfGZQnDDFe
         rzO2kXPxO0kCIqSNIpiyyOoXDzSDnFL2jDu7Ne8EwdTe+KjkLqHgZ98nVJOFavT+rvUw
         +q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jCJsXsDD/iNK9yC84Ot8gXJYydwvdgJYruOO+RMKvrI=;
        b=47MaWsy31bbbfaOpkjhYMymfXpN86CSKHyCoSorCQ10mFahlgGB2bBSUibkpn6IA5l
         eGyqC8B4UVdAFb1YgkGvKz/7ITrB44MTXHvSkZbrpbHlbSyeOo9zIftOoUlIy6w0FAOH
         dz9VoAWlQvQ+iMgjWqaZJGPY7sofupk53/JtEaaCrlEUsLjiuJMY51mf5q8am8TxAhR5
         W6Hzdpp8y0cxD0aJDlFgW3CgzxepYUyeElj6NkCLp+c814Rmzv7IAZQx8wQnoBxab5b/
         6Namuz8/RY3754kUvX0Xam3qXkX11ZRbMxrMbiyEZYlSuM6KCpmixvsbfZRZ5UNh6aqe
         10pQ==
X-Gm-Message-State: AO0yUKVCKRESMvrTjuQkUnZcPT9bTek1zjGRTzpCgzdB3FgdR3TAQAnH
        g1WOe3PDkRmOS1JKp/3Nk9tBxcpc4j3BLPVyhCvNHV92ObMbjUgXoII=
X-Google-Smtp-Source: AMrXdXvymjiZm295hviSDoAL++VGtM3AdouMO6PglcE/J7BFMhh7oAGWYhfAa/YzdOYag4afZ1xe2dEByJYljqTrApY=
X-Received: by 2002:ab0:1512:0:b0:5fc:a2ef:4b70 with SMTP id
 o18-20020ab01512000000b005fca2ef4b70mr5545670uae.36.1675055527303; Sun, 29
 Jan 2023 21:12:07 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab0:2b0c:0:0:0:0:0 with HTTP; Sun, 29 Jan 2023 21:12:06
 -0800 (PST)
Reply-To: maddahhussain10@yahoo.com
From:   Maddah Hussain <dklimowicz44@gmail.com>
Date:   Mon, 30 Jan 2023 05:12:06 +0000
Message-ID: <CA+QboxUTA2J89+Q8ZubBTJfruK7F1X=V=2YtMmTOwJC8yOVQVw@mail.gmail.com>
Subject: Why No Response Yet?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

-- 
Dear,
I had sent you a mail but i don't think you received it that's why am
writing you again.It is important you get back to me as soon as you
can.

Maddah Hussain
