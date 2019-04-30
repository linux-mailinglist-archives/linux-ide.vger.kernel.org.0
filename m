Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7038F1B4
	for <lists+linux-ide@lfdr.de>; Tue, 30 Apr 2019 09:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbfD3H7c (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 30 Apr 2019 03:59:32 -0400
Received: from mail-lj1-f175.google.com ([209.85.208.175]:46359 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfD3H7b (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 30 Apr 2019 03:59:31 -0400
Received: by mail-lj1-f175.google.com with SMTP id h21so11822893ljk.13
        for <linux-ide@vger.kernel.org>; Tue, 30 Apr 2019 00:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NZOnwOT/39smZacukzn9yIAubnR297VqK+nhpay9xGw=;
        b=1rGNjz8L2yl0LMHFIe48X3IySkQ1+9hlbMjrtyosURxzEsPHqNG3B4ojshAunfVH6y
         B+GC2Cvept7QMcQsO5IPwbvlc++TYtvhvdIJxqeORjfQYRKGSyDeyJlymurGKSV1PysQ
         i7/TlOGObuHE0rQNoSZAlnfCYw4dMR/BxC0cg1nQ4VuDNNY/5WRFFe1eoMkeXYZuHzOV
         X/hFBId7g86bgv7VsuQam0omJcIJrtTyK2cFtDMUrcBn8zko3wi9dlxsfLErgvFTGkSI
         IVe5alUSwBcE3JK6dqiPy3ZXYH5ZAzrgsoYn2bHAGjFRaLGD8HP6biD+luPd/uYdehS2
         38cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NZOnwOT/39smZacukzn9yIAubnR297VqK+nhpay9xGw=;
        b=q8qDb/Tl8Jtozz8fYokyJfMMUtHH84YEhhU+BXcba6FXYAzfWmBz0/lA5s0yjwMGxh
         DyxrjHOufRNpKh4aCQ4vfdK0BOvdbaT+0EmPMThxPwjXlN824bGN/2OMIGjDxuMmZcX9
         tjiOV3hxcKwi4Yb4w/PT2KWHTYRk7LgLZSdv2N7bAl2TeXAkKUv+HHFP2Rym83yFLtEa
         kfeFfr50kHvOjthNY4hoQgKxLfR0saz7OhpkIONp1a10lzcHn8Hq89cem5Qbn0QELU6n
         deH3omsGaoENc4Mv+8r2HsO6CI9BXY+TBqvQ7qVdE6PbB63TqubYcxcL0BND6vODqDcP
         UEMQ==
X-Gm-Message-State: APjAAAXbBquQWevMLbME6LzKltZPJQWrjil/7BtEj7xEDuPiKWkVLXi7
        FpEV9HmA0eEEOypKXRi5ejCE8DosVk8=
X-Google-Smtp-Source: APXvYqw79T5UGz2uMyZ5u74553TfGqbH+KTyqYp7xfZZon6zMIfnoZN4cAwSH07kRU9KrhzPRlVBoA==
X-Received: by 2002:a2e:90cc:: with SMTP id o12mr10755377ljg.133.1556611169529;
        Tue, 30 Apr 2019 00:59:29 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.80.195])
        by smtp.gmail.com with ESMTPSA id v23sm2411234ljk.14.2019.04.30.00.59.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 00:59:28 -0700 (PDT)
Subject: Re: [PATCH] sata_rcar: Remove ata_host_alloc() error printing
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jens Axboe <axboe@kernel.dk>
Cc:     linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20190429152209.22851-1-geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <453d8c34-a3d5-3347-888a-ce608292b75d@cogentembedded.com>
Date:   Tue, 30 Apr 2019 10:59:23 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429152209.22851-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 29.04.2019 18:22, Geert Uytterhoeven wrote:

> ata_host_alloc() can only fail due to memory allocation failures.
> Hence there is no need to print a message, as the memory allocation core
> code already takes care of that.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
