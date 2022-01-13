Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5EC48CFB7
	for <lists+linux-ide@lfdr.de>; Thu, 13 Jan 2022 01:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbiAMAao (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 12 Jan 2022 19:30:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbiAMAak (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 12 Jan 2022 19:30:40 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60AD8C06173F
        for <linux-ide@vger.kernel.org>; Wed, 12 Jan 2022 16:30:40 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id m13so8260784pji.3
        for <linux-ide@vger.kernel.org>; Wed, 12 Jan 2022 16:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZSaFrgrwIATQYIozH/8jrsLh+BM+tmBvsEQ1Gf5XbN8=;
        b=G9nHpWZV97LsAWdEsizujA4MkfM+DKir4utrezAyCrltnhNLl3gWhHcy0R5LuFeC/D
         oELT+eiRiYwRGLw6Jg0b5jyjWaEu0We6pqg9pncHKfyUcgGJYij/UEm1xAz89pFTst8U
         kUAH6+34jB6xWHzLIuS2mq2yGObQyV1LAYHuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZSaFrgrwIATQYIozH/8jrsLh+BM+tmBvsEQ1Gf5XbN8=;
        b=kP93vBwnAfX7QEaW/uO2Ebe4xO4llw8S5RNWnNWuoCO27oiQa0wI4CBZgWj5rpuFXC
         kYd7BgK9NDAlWRm8tM6Fy0/MWSraZ3WU9XdbUaiZK6MVvNABvVAse0Ez+HmgFMq43RPx
         nnudvPay1DikQ/tAE4B+uyHlRmRWUFiEyldYtRQqwa7Wr0IsAO+htC9wXVTD2snh9hsP
         BAm7HwuVT9PVimEOCr5SPpyfigOgz3NNFM7Wu04066q2n3pIDXBbDAZqkU1hHq/iKP37
         lWMI8XNXVTIx5dZqaXC2txYFPmJQWP4/JQKiYrv9Cc5h4mAuh/0nzSeIBjBP2oPhPYgC
         Inuw==
X-Gm-Message-State: AOAM532xPE8EPhEvMU3PjjERz/Y6i8u5N/wSGqmi6bQNfvwlzpY8cIbO
        hoRswnwYkFQW8cItAx5CJgYVDA==
X-Google-Smtp-Source: ABdhPJx/7aH38O2jNqfYsT/Rrxz7XlVII24YkXEup7AfWmDn27AxUe/4NWkd1NLBdfre/WQvNmDT3Q==
X-Received: by 2002:a63:4a5f:: with SMTP id j31mr1863127pgl.222.1642033839935;
        Wed, 12 Jan 2022 16:30:39 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q18sm738935pfn.50.2022.01.12.16.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 16:30:39 -0800 (PST)
Date:   Wed, 12 Jan 2022 16:30:39 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc:     Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][RESEND] sata_fsl: Use struct_group() for memcpy() region
Message-ID: <202201121628.A8B11A1@keescook>
References: <20220112220652.3952944-1-keescook@chromium.org>
 <df3eefdc-d8d1-48fa-f5f7-9c2f2382842b@kernel.dk>
 <202201121515.8679164D6@keescook>
 <ec4d9eb0-3999-db52-1eec-bc6351dd4f07@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec4d9eb0-3999-db52-1eec-bc6351dd4f07@opensource.wdc.com>
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Thu, Jan 13, 2022 at 08:47:37AM +0900, Damien Le Moal wrote:
> On 1/13/22 08:15, Kees Cook wrote:
> > On Wed, Jan 12, 2022 at 03:23:40PM -0700, Jens Axboe wrote:
> >> On 1/12/22 3:06 PM, Kees Cook wrote:
> >>> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> >>> field bounds checking for memcpy(), memmove(), and memset(), avoid
> >>> intentionally writing across neighboring fields.
> >>>
> >>> Use struct_group() in struct command_desc around members acmd and fill,
> >>> so they can be referenced together. This will allow memset(), memcpy(),
> >>> and sizeof() to more easily reason about sizes, improve readability,
> >>> and avoid future warnings about writing beyond the end of acmd:
> >>>
> >>> In function 'fortify_memset_chk',
> >>>     inlined from 'sata_fsl_qc_prep' at drivers/ata/sata_fsl.c:534:3:
> >>> ./include/linux/fortify-string.h:199:4: warning: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
> >>>   199 |    __write_overflow_field();
> >>>       |    ^~~~~~~~~~~~~~~~~~~~~~~~
> >>>
> >>> Cc: Jens Axboe <axboe@kernel.dk>
> >>> Cc: linux-ide@vger.kernel.org
> >>> Signed-off-by: Kees Cook <keescook@chromium.org>
> >>> ---
> >>> Jens, can you take (or Ack) this? It's a dependency for the FORTIFY_SOURCE
> >>> improvements that are close to being finished. :)
> >>
> >> I don't maintain libata anymore, so Damien is the guy to nudge ;-)
> > 
> > Ah-ha, okay, thanks.
> > 
> > /me waves "hi" to Damien. :)
> 
> Hi Kees,
> 
> This is already queued up in libata tree for-5.17 branch. I have not
> sent my PR to Linus yet as I am letting things soack a little longer in
> for-next (for the various arch compile tests).

Oh thank you! Sorry I missed the pull. I didn't see it in -next yet, so
I assumed it hadn't been pulled anywhere.

> Please check that branch to see if all is OK !

Found it:
https://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata.git/log/?h=for-next

Yup, looks good:
https://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata.git/commit/?h=for-next&id=23c72ffedeed6d513144fa09834b1eb0cb2b7373

Thanks!

-- 
Kees Cook
