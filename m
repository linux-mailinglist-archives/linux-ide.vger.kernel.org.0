Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE5EF1EEBA9
	for <lists+linux-ide@lfdr.de>; Thu,  4 Jun 2020 22:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729560AbgFDUQW (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 4 Jun 2020 16:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729073AbgFDUQV (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 4 Jun 2020 16:16:21 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E6CC08C5C2
        for <linux-ide@vger.kernel.org>; Thu,  4 Jun 2020 13:16:20 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id e9so3995324pgo.9
        for <linux-ide@vger.kernel.org>; Thu, 04 Jun 2020 13:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pCXmYsl76J0CAlxoPdk8mPZO/WOJwZ5J1IK/xTYSvtY=;
        b=Ul9IqQ41ZiXh1TA37NXxQoP1MYWZkk1ImeHfZoGz6a6IPTQKCTgkI4vMbYvxIt8wpE
         ElHA9RWwTvFCaySEtclTRP/dyePJtOWdEk29ahiOH2gLk0aIx7jxMqS8sHpI0dAD9/eD
         v2pQeh6hmu6BRKkCyhh5mYDGk/czBtEllytZVgQeNFhavoEfrbFwLLVfzZ/2XW9eqAuC
         T6PPxSNZdkIUyyCpj3L+bHh3A58HE+YTCCyomOaAjuPFYAu7WNLA0VPJGgc8Oy3KvimW
         enSRBgfNysV+6XPIzSx1E3hPpfiQZPkCEErtaeB8Ewgc+PLJOHksAeBzo6J1PIYEAlTL
         B91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pCXmYsl76J0CAlxoPdk8mPZO/WOJwZ5J1IK/xTYSvtY=;
        b=KI4QHT7Sa6rBJLIUvkyGtpqK1Q96YEh6gHP8BBxgBsaxNJZE4MDR048bIHlUdyKQAT
         dR19tviCJhQO+uXKpztOLoExPEuXcIWu1TPj3OwUvfROKR5Ow1sWhKIlcmXqkA2MTTF5
         U7k6XhVV9glrSv3beWJO8rLEUeXcqdk5QZ2LDi+dEigmSQyoq0CGMXxSn2ZoeF3fu06a
         yd66Qmhyzfs6Z1/gkIDlYo2xlCmgapG/B0ZcQgvQXdkdpcxP6wKRkPu8EW9/Tt++YbSg
         rOSJsSGDI/ji09DW2HwgJgAN6GqTRUk5B2JKCxT1uPPcH5/es8QxjrG3Vgq6mhHeHN63
         sLuQ==
X-Gm-Message-State: AOAM533Z59lQN6+3SLg8bRXDKmVmDBqGPr3u6agLOZ3iYCZCO98oXUXj
        e0VEt/3E76iUXZI1q5dov08wlYgcdx0HmI4SXUzNMg==
X-Google-Smtp-Source: ABdhPJye6FZH70P5vXHcitY46EI4rxFnZqJif4KZJI8zWDppq3cq3MmDJfiH17IwjHHvUarffuS8hk7FOMV62ymzGuM=
X-Received: by 2002:a63:4f09:: with SMTP id d9mr5970154pgb.10.1591301780211;
 Thu, 04 Jun 2020 13:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200603233203.1695403-1-keescook@chromium.org> <20200603233203.1695403-5-keescook@chromium.org>
In-Reply-To: <20200603233203.1695403-5-keescook@chromium.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 4 Jun 2020 13:16:08 -0700
Message-ID: <CAKwvOdnd30bcqoNXF1ugadU=KbW3aXu07+T-891amO2_b7kQdg@mail.gmail.com>
Subject: Re: [PATCH 04/10] rtlwifi: rtl8192cu: Remove uninitialized_var() usage
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
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
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
> to removing[2] this[3] macro[4], just initialize this variable to NULL,
> and avoid sending garbage by returning.
>
> [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Fixes: dc0313f46664 ("rtlwifi: rtl8192cu: Add routine hw")

> ---
>  drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c
> index f070f25bb735..5b071b70bc08 100644
> --- a/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c
> +++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c
> @@ -592,7 +592,7 @@ static void _rtl92cu_init_chipn_one_out_ep_priority(struct ieee80211_hw *hw,
>                                                     bool wmm_enable,
>                                                     u8 queue_sel)
>  {
> -       u16 uninitialized_var(value);
> +       u16 value;
>
>         switch (queue_sel) {
>         case TX_SELE_HQ:
> @@ -606,7 +606,7 @@ static void _rtl92cu_init_chipn_one_out_ep_priority(struct ieee80211_hw *hw,
>                 break;
>         default:
>                 WARN_ON(1); /* Shall not reach here! */
> -               break;
> +               return;
>         }
>         _rtl92c_init_chipn_reg_priority(hw, value, value, value, value,
>                                         value, value);

Whew! Nothing like passing the same value 6 times! (Other callers do
use distinct values though, just curious seeing this instance.)

-- 
Thanks,
~Nick Desaulniers
