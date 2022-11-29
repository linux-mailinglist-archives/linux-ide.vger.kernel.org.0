Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE4F63C910
	for <lists+linux-ide@lfdr.de>; Tue, 29 Nov 2022 21:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237252AbiK2UPY (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 29 Nov 2022 15:15:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237264AbiK2UPV (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 29 Nov 2022 15:15:21 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A2F6391C2
        for <linux-ide@vger.kernel.org>; Tue, 29 Nov 2022 12:15:20 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id bs21so23898631wrb.4
        for <linux-ide@vger.kernel.org>; Tue, 29 Nov 2022 12:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=Mv/p8rw2Q1Z+Jdq0ND8FcYLH8tS4X8od+TZBFitD1gFoQiA/7EFu7SUMh0jl9TshD0
         QOwnMWBD2QwRXIBWVfbMfb9+V0z2hdpw8od63aUhgJ+mw889x4wVvH1162w/+Ze+vPXy
         bVKsXEanE+oEBQa9kHjIPUPIvvhd3eNcPBZw15CppYGQJIWOgGBrz27lbZ1hu8vWDZlR
         1adoI13pdCv1VJVqmD8z3CSkNhjWOyIre0UrgfTHpH8/ma+BZHB6nJZ+bxM9MUh58FXM
         5+ht6b0a3lx9+x9NnWbYMtTKM0dDDzWrzNhOgm17XMRDeXt8tMlOXEYpmXF0mS/VFotn
         P5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=qntAxtEFZAYbo1giS/s+AMK36v2w73hdeIOQUeAQgIYs5gVxcWFuj7cJrZeP+EcEu+
         hbKLckg1AHCUO2rwIetkd4SxICtcOpJkZ2u6g5DlPvHB8tDn9qYEhfcj7/LqjCJEkEfY
         JW+UtAArANAyeiBXF7FRYZ0TkoKkVDgiCHndW+37a9wgIzqdTF24AYkXz1OubRFN3Jps
         x+ca9PoMAKeWWdKtffm4BTw1mLYr+7S6IctI+kxNUPsC3IJCCNkS4QDZkyQUyNewRN1d
         VUv4E+rMJuHmz/+2dByGiWW0e/E7UV18y1MGHNKKzkLnrI/33vlsHVzR3Ips1wiTrfRy
         o8Nw==
X-Gm-Message-State: ANoB5plwTNwDpSCHSQa+OHbOgiVxhzeSHzPZKQHaUcrR8OpuytXx9str
        VxAYdusFLFgI+1JaH74ooFCtTQGSIkoA77kraLg=
X-Google-Smtp-Source: AA0mqf5m47462ODfeOB/yRc2zm1KXrPpa30PF8kK6zOhRBlCI6nWwQZcE9ap3x73uKTTb6yzldlOEQ07CO9QGkma+wM=
X-Received: by 2002:a5d:6646:0:b0:242:164b:c58a with SMTP id
 f6-20020a5d6646000000b00242164bc58amr7956498wrw.45.1669752918952; Tue, 29 Nov
 2022 12:15:18 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6021:b4c:b0:230:28ea:467 with HTTP; Tue, 29 Nov 2022
 12:15:18 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <joykekeli4@gmail.com>
Date:   Tue, 29 Nov 2022 20:15:18 +0000
Message-ID: <CAO4V9UGOL1cS7us_J3iSoPtyNBJJRxB=JToydQoFME+iUf5eiA@mail.gmail.com>
Subject: hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
