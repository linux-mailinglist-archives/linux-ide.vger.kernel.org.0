Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0AD12DAEA
	for <lists+linux-ide@lfdr.de>; Tue, 31 Dec 2019 19:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbfLaSaS (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 31 Dec 2019 13:30:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:36300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726658AbfLaSaS (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 31 Dec 2019 13:30:18 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E111206E4;
        Tue, 31 Dec 2019 18:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577817017;
        bh=LSaQHVFJd5JY9LmBvMywkPv6G/fsXtgDU/dIgzpIayk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DWil62AsnC8i2xuyfwRF6OBRj4OW8ChA0n0LQc5Jp6aiMNfXvfSF8CxfhmhlXWHxM
         dnNy9fiOVe7Yah8ysz8DeemqlNTRJbnXVOuudZOcpi4BR/FbrEAm2SyRChLQQHqqbb
         5FPM2alRM8PufGypa9qX09TEfOBs4gmiDPcIbVNQ=
Received: by mail-qt1-f177.google.com with SMTP id l12so32014512qtq.12;
        Tue, 31 Dec 2019 10:30:17 -0800 (PST)
X-Gm-Message-State: APjAAAVT4kmgQPAmtVvMD4fMWm9nXoIqutNsO2XXMqAZI8YIWHHFj/+k
        4Q7zBMxyzBiMtMgZQLcj94N1sNy3VgLpsUAXKw==
X-Google-Smtp-Source: APXvYqx6kNz0dqWwE7vGq2vamseNVekgF/VaPchp6bR3/XpUKfiLAHLmbSie1LW5HIle8nimS1g6ypl6ThvDehqIGs8=
X-Received: by 2002:ac8:59:: with SMTP id i25mr54067921qtg.110.1577817016713;
 Tue, 31 Dec 2019 10:30:16 -0800 (PST)
MIME-Version: 1.0
References: <20191231172458.25984-1-linus.walleij@linaro.org>
 <41b527ba-003d-425b-5e59-43cdd8c778e2@cogentembedded.com> <CACRpkdbR3TTiNqU8g54M4N4=N8yiV2UreFKoV0LffYUxZEChJw@mail.gmail.com>
In-Reply-To: <CACRpkdbR3TTiNqU8g54M4N4=N8yiV2UreFKoV0LffYUxZEChJw@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 31 Dec 2019 11:30:05 -0700
X-Gmail-Original-Message-ID: <CAL_Jsq+3wg8_hHY2zY3PGfNHWRkGVNGXPo_O-TqMZ8SQ6N_O2Q@mail.gmail.com>
Message-ID: <CAL_Jsq+3wg8_hHY2zY3PGfNHWRkGVNGXPo_O-TqMZ8SQ6N_O2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Create DT bindings for [PS]ATA controllers
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Tue, Dec 31, 2019 at 10:56 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Dec 31, 2019 at 6:46 PM Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > On 12/31/2019 08:24 PM, Linus Walleij wrote:
>
> > > +properties:
> > > +  $nodename:
> > > +    pattern: "^[ps]ata-controller(@.*)?$"
> >
> >    I thought the DT spec has long ago standardized the node name as "ide" and "sata"?

Correct.

> I'm not 100% sure (Rob can answer) but I have *half-guessed* that the process
> so far has been that when we define a schema for some generic node name
> we also invent some new generic node name like this, or else all the old DTS
> files people have will generate (lots of) errors.

The list of generic node names is a lot longer than what we have
schema for currently.

> The DTS files can then opt in to the schema by simply renaming its nodes
> in accordance: "ide" -> "pata-controller", "sata" -> "sata-controller"
> (I have such a patch for the Gemini that I made this for.)
>
> If I'm wrong I'll switch to to ide@ and sata@.
>
> Rob?
>
> Yours,
> Linus Walleij
