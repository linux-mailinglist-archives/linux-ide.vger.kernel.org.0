Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80EB3282639
	for <lists+linux-ide@lfdr.de>; Sat,  3 Oct 2020 21:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgJCTbo (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 3 Oct 2020 15:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgJCTbn (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 3 Oct 2020 15:31:43 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746A2C0613A7
        for <linux-ide@vger.kernel.org>; Sat,  3 Oct 2020 12:31:43 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id 10so5824555qtx.12
        for <linux-ide@vger.kernel.org>; Sat, 03 Oct 2020 12:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=CWQLnefJnV9lai9ha07+j4R+wHuwUmFBxVnJsYEYjsI=;
        b=TRIuiKupRuCU5VUlLtlKbsBlNQbnfv9jVMRmvy5WrUMTyv5g7SdRa3REDAkElPyBzv
         WSOws0iapEwPs/zPE6it9FcrVqCtAnsz/UakcRiEJxUOMFcBe7pAZ20U41kh3yUYUB6u
         lAK2edDDWs/OyXo320TXSOEjMz+2dy680rqXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=CWQLnefJnV9lai9ha07+j4R+wHuwUmFBxVnJsYEYjsI=;
        b=D/TGv9+rjU5XOQbeXtxKUVQcF932k2MSwOFj2lckK7YsNvsr/qLuv2BtxxiEHn6h5x
         BkJCiPja2lmaqZjc3+6VWHesa2IDWmQlaCogZL3arHLUkpe+mH3zlPF/XSAPvE5MVBuT
         G9iOYtD0jiSsYH2Rdmqd4xT/mvbCHz5gmQs2pyT7w+oWBbZK2V4Aq7gRaiJf7Fw2PnCr
         CWDWK4YrQtsE69u5wPzST2ZBN82DC0TqGEi6d4FaMih8d4eomVep0uVO6g8bWKBJBqz3
         jepzY2+KRJO3Fh1aoVyC3jaynwnkwETYNnoleJRs1m8iX+U6W71r6JBj33Jnfind8zeG
         hgmg==
X-Gm-Message-State: AOAM530CQzdJ9D5V5jckLoAI6Vl1fL9n4iedEdlnTwA/+y1hZWSbb6X1
        EvRZhdQxQ49+RG1AS0RH83Wfpg==
X-Google-Smtp-Source: ABdhPJyXj0to29E/962sKEc6U/odEp+QvXfYgP1BYnP1Sa/tA6o1DsKTTnJkOmEDBav7C7kIlGgFyQ==
X-Received: by 2002:ac8:4548:: with SMTP id z8mr7894174qtn.291.1601753502454;
        Sat, 03 Oct 2020 12:31:42 -0700 (PDT)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id a66sm3745298qkc.52.2020.10.03.12.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 12:31:41 -0700 (PDT)
Date:   Sat, 3 Oct 2020 15:31:37 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Joe Perches <joe@perches.com>, Mark Brown <broonie@kernel.org>,
        tools@linux.kernel.org, linux-iio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-crypto@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-acpi@vger.kernel.org, David Lechner <david@lechnology.com>,
        Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        kernel-janitors@vger.kernel.org, drbd-dev@lists.linbit.com,
        openipmi-developer@lists.sourceforge.net,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-ide@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-wireless@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate
 statements
Message-ID: <20201003193137.z2bpwzlz5a66kkex@chatter.i7.local>
Mail-Followup-To: Julia Lawall <julia.lawall@inria.fr>,
        Joe Perches <joe@perches.com>, Mark Brown <broonie@kernel.org>,
        tools@linux.kernel.org, linux-iio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-crypto@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jerome Brunet <jbrunet@baylibre.com>, linux-acpi@vger.kernel.org,
        David Lechner <david@lechnology.com>,
        Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        kernel-janitors@vger.kernel.org, drbd-dev@lists.linbit.com,
        openipmi-developer@lists.sourceforge.net,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-ide@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-wireless@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
 <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
 <20200929113745.GB4799@sirena.org.uk>
 <db26d49401dc0bd6b9013a603a155f9827f404a4.camel@perches.com>
 <20201001110150.GA6715@sirena.org.uk>
 <f44d19ad596f261c0287c9ab18c45161003efb43.camel@perches.com>
 <20201003191501.o56tqq63d2buq5ox@chatter.i7.local>
 <alpine.DEB.2.22.394.2010032118420.2741@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2010032118420.2741@hadrien>
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Sat, Oct 03, 2020 at 09:18:51PM +0200, Julia Lawall wrote:
> > > There seems to be some mismatch between b4's use of the
> > > cover letter to a patch series and what maintainers that
> > > apply a subset of the patches in the patch series.
> > >
> > > The merge description shows the entire patch series as
> > > applied, but the actual merge is only a subset of the
> > > series.
> > >
> > > Can this be improved in b4?
> >
> > So, the following logic should be applied:
> >
> > - if the entire series was applied, reply to 0/n
> > - if a subset only is applied, reply to each n/n of the patch that was
> >   cherry-picked out of the series
> >
> > Is that an accurate summary?
> 
> That sounds good.

I'm worried that this can get unwieldy for series of 50 patches where 49 
got applied. Would the following be better:

-----
From: ...
To: ...
Subject: Re: [PATCH 00/18] use semicolons...

On Sun...
> These patches...
>
> [...]

A subset of these patches was applied to

  https://...

Thanks!

[5/18] regmap: debugfs:
       commit:

(etc)
-----

In other words, we:

- specifically say that it's a subset
- instead of just enumerating the number of patches that were applied, 
  as is currently the case ([1/1]) we list the exact numbers out of the 
  posted series (e.g. [5/18])

I think this is a better solution than potentially flooding everyone 
with 49 emails.

-K
