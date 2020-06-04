Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0FDB1EEB4B
	for <lists+linux-ide@lfdr.de>; Thu,  4 Jun 2020 21:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729212AbgFDTkX (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 4 Jun 2020 15:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728951AbgFDTkW (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 4 Jun 2020 15:40:22 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E4FC08C5C3
        for <linux-ide@vger.kernel.org>; Thu,  4 Jun 2020 12:40:22 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id a127so3725254pfa.12
        for <linux-ide@vger.kernel.org>; Thu, 04 Jun 2020 12:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kJllNW+A+qSZYDyNUy0KaOA5QFyWsX/L5wjqGF/eTNE=;
        b=khjHaUxxHWq27mRVrCP90N/AIWBHw0Raqt4MSawehwogpV8OkvENICvoOfJVZkx0HE
         hNogTV16/NwZXxCOSGv2dPerVjZRRpPeRIGxaNDeieFVvkNGOsQPbUA4jVsw+RGMJM/1
         DZ4Ka7WSW9usbnCAubZ33uZYz1CuVXU1e5wwsVkAh0ownQvTfrX26uwpcMSg4c4FVlB9
         J0MlT9xW0GEK1fvgfb3wjQTvPWdI4UdS6GZdlbET89acNH1Dsv7O3JvR2loOOenQdzRS
         7VBqB+LvcFYGppvlPdjlWc/cGF5adEw1HB5y4y0ezzkfiCva7K4+HnNEtlnj/NWpd7fY
         2hVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kJllNW+A+qSZYDyNUy0KaOA5QFyWsX/L5wjqGF/eTNE=;
        b=p7Rr6uE6ZO18Kvv4wxBeIdk879qUMSRpdd7QDtu48MllDDCgctkeYteedVPtH6fyTg
         Y6FzkhblKyCN5TLBf8qNLnj3c83KgnjEQr2tPJd9OcqaL/GQhbpYqfwAXgRtrN3rA4IH
         GycZ8ZfS8I4eQzkiyJ0s/SOrHvtDj0zyls9//qRwrBTsNoxktUZ3uEjsQ7XZnP6I5WpS
         jcC2YZVp2EcLTjJzNRL7oy7NP3UDfvGfOlYO7xFHPzmftPEem7VEJLZEv/d2AStynwZZ
         QoCT2b8EXNhh3u4c6ju6WnUJZ9YhfN2k4SNUbDCADfKVTtpOabDjbRnoxoNvTN2Lary4
         TcZQ==
X-Gm-Message-State: AOAM533ytT7gho3tS3w8tfQmIv6bHuU9Y1swbMXIdldn0orItvrzPTjI
        hNQ2xl1Ty/+IsovARsXfiFuSyqh90TzAgWQxjMseZw==
X-Google-Smtp-Source: ABdhPJyYElZ0dKBuAEJ4uM9aYg7zNwG3YltGgh77s2eCEowEEsdqVj0Qq+w+v4Ujopd3NJrASj7ulK+YFsUqdUSAiYg=
X-Received: by 2002:a63:5644:: with SMTP id g4mr5715275pgm.381.1591299621501;
 Thu, 04 Jun 2020 12:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200603233203.1695403-1-keescook@chromium.org> <20200603233203.1695403-8-keescook@chromium.org>
In-Reply-To: <20200603233203.1695403-8-keescook@chromium.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 4 Jun 2020 12:40:09 -0700
Message-ID: <CAKwvOdnQCCV7SHq+nbRd0O0A+P035kU4t5vPDs8T=BhNQ2cbdA@mail.gmail.com>
Subject: Re: [PATCH 07/10] spi: davinci: Remove uninitialized_var() usage
To:     Kees Cook <keescook@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        drbd-dev@lists.linbit.com, linux-block@vger.kernel.org,
        b43-dev@lists.infradead.org,
        Network Development <netdev@vger.kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        mporter@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Wed, Jun 3, 2020 at 4:32 PM Kees Cook <keescook@chromium.org> wrote:
>
> Using uninitialized_var() is dangerous as it papers over real bugs[1]
> (or can in the future), and suppresses unrelated compiler warnings (e.g.
> "unused variable"). If the compiler thinks it is uninitialized, either
> simply initialize the variable or make compiler changes. As a precursor
> to removing[2] this[3] macro[4], just remove this variable since it was
> actually unused:
>
> drivers/spi/spi-davinci.c: In function =E2=80=98davinci_spi_bufs=E2=80=99=
:
> drivers/spi/spi-davinci.c:579:11: warning: unused variable =E2=80=98rx_bu=
f_count=E2=80=99 [-Wunused-variable]
>   579 |  unsigned rx_buf_count;
>       |           ^~~~~~~~~~~~
>
> [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.co=
m/
> [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=3D1TGqCR5vQkCzWJ0QxK6Cern=
OU6eedsudAixw@mail.gmail.com/
> [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz=
9knmPuXhOeg@mail.gmail.com/
> [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=3DyVJu65TpLg=
N_ybYNv0VEOKA@mail.gmail.com/
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Fixes 048177ce3b39 ("spi: spi-davinci: convert to DMA engine API")

> ---
>  drivers/spi/spi-davinci.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/spi/spi-davinci.c b/drivers/spi/spi-davinci.c
> index f71c497393a6..f50c0c79cbdf 100644
> --- a/drivers/spi/spi-davinci.c
> +++ b/drivers/spi/spi-davinci.c
> @@ -576,7 +576,6 @@ static int davinci_spi_bufs(struct spi_device *spi, s=
truct spi_transfer *t)
>         u32 errors =3D 0;
>         struct davinci_spi_config *spicfg;
>         struct davinci_spi_platform_data *pdata;
> -       unsigned uninitialized_var(rx_buf_count);
>
>         dspi =3D spi_master_get_devdata(spi->master);
>         pdata =3D &dspi->pdata;
> --
> 2.25.1
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/20200603233203.1695403-8-keescook%40chromium.org.



--=20
Thanks,
~Nick Desaulniers
