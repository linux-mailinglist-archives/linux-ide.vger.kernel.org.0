Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D08F2E550E
	for <lists+linux-ide@lfdr.de>; Fri, 25 Oct 2019 22:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbfJYUWg (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 25 Oct 2019 16:22:36 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:36287 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728221AbfJYUWg (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 25 Oct 2019 16:22:36 -0400
Received: by mail-io1-f66.google.com with SMTP id c16so3856469ioc.3
        for <linux-ide@vger.kernel.org>; Fri, 25 Oct 2019 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DD9iZcXIdQeq2sScgQqVG9X81Lh6TGyqMWMmF5Iky/w=;
        b=kiIJvcdgNGVJCiLnba8XQDJu9rLpbiUQM5Si9L49snaRUKDWNBUHrh6hAqSDTGA0fC
         wO/B2qVwzfDFrLhQQ6t7sYsFaf5HpukUqmtaFwwnwHYts1E83W/DsjVqMxNsRsfeD1m4
         yyMfEjnS5cM4g78AYLqPQba4ZpFuzJmZMArW5kk5kJiIfVm4voLR4D0ltTIAEhoZ+3Hh
         ozJ80QZY8Tea+12VfWtgeB1ld0NLutO/OtKaLKAwXuklXDX9xKn91SykKTLrRdbZqojd
         WRL03LrwQB0rduD6jUXW7lp5VOREiI6r+3Udq3eXffaXN2xJ5S9Tr8DK3ciNJoN+sMJG
         sxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DD9iZcXIdQeq2sScgQqVG9X81Lh6TGyqMWMmF5Iky/w=;
        b=UVG8F7vSesul4fqTFxMKrjbMmM37UiZyiR7RpzHcTWXCkW9/lHWsTH1ENliGF+2v2X
         YxNsQZrd/Ad2YX7KOVR1vmeX7fuHg4upI1BFqzqXMZ+xu7ECfHxB6haW2NuV8cQ5lK37
         WYZKcJEz8gvmi8xt/UvMqyawz3trVkR4+8GublSkFJuwglkTK/IE+qeHl6gT2Nw2KE4I
         /0cVvf69b50E/Y20Ja/tgb2EFxwJS6WbZFgPBqgQYY0SOYx/THOU3+ieVEwlLmchIkKZ
         cw+CIPUKa4fbWRjTLVzmrK8fRzIKm5Qxiqdik/2MTXxLUu+m7BuuhBXZNp9WFfsT07hT
         +AqQ==
X-Gm-Message-State: APjAAAXazXDU6CP8DSZO9El4aqZZYCC7rzKmp08hEzkIAignyRjl3KqJ
        KS7UTVQCQGj3YXQgZIitw2Faku8XPtX7Cw==
X-Google-Smtp-Source: APXvYqwITerZflrwJUlXuX/3LHv/PUFN+quAXvBaedq/tB2dwcgNyxQe5DgEy/pnyCrtHk7pantwmg==
X-Received: by 2002:a02:a887:: with SMTP id l7mr5888931jam.23.1572034955249;
        Fri, 25 Oct 2019 13:22:35 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id z11sm343219ioh.37.2019.10.25.13.22.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 13:22:34 -0700 (PDT)
Subject: Re: [PATCH] ata: libahci_platform: Fix regulator_get_optional()
 misuse
To:     Mark Brown <broonie@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-ide@vger.kernel.org
References: <20191016105105.7791-1-broonie@kernel.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <4534ef28-5192-cce3-62d8-db387eb87abc@kernel.dk>
Date:   Fri, 25 Oct 2019 14:22:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016105105.7791-1-broonie@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 10/16/19 4:51 AM, Mark Brown wrote:
> This driver is using regulator_get_optional() to handle all the supplies
> that it handles, and only ever enables and disables all supplies en masse
> without ever doing any other configuration of the device to handle missing
> power. These are clear signs that the API is being misused - it should only
> be used for supplies that may be physically absent from the system and in
> these cases the hardware usually needs different configuration if the
> supply is missing. Instead use normal regualtor_get(), if the supply is
> not described in DT then the framework will substitute a dummy regulator in
> so no special handling is needed by the consumer driver.
> 
> In the case of the PHY regulator the handling in the driver is a hack to
> deal with integrated PHYs; the supplies are only optional in the sense
> that that there's some confusion in the code about where they're bound to.
>  From a code point of view they function exactly as normal supplies so can
> be treated as such. It'd probably be better to model this by instantiating
> a PHY object for integrated PHYs.

Applied, thanks.

-- 
Jens Axboe

