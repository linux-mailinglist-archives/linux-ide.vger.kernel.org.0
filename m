Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7A7B681F93
	for <lists+linux-ide@lfdr.de>; Tue, 31 Jan 2023 00:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjA3XY3 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 30 Jan 2023 18:24:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbjA3XY1 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 30 Jan 2023 18:24:27 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744F512F38
        for <linux-ide@vger.kernel.org>; Mon, 30 Jan 2023 15:24:26 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id 88so12572844pjo.3
        for <linux-ide@vger.kernel.org>; Mon, 30 Jan 2023 15:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dwROn1mPsy/kk9N99ydvqBeMM2O2HAtXlONjIBsBtw8=;
        b=xxGxFvWVTHchteWkrGLVN87rZtWQkFiCxzY68BpeJVBgX7tReOeydvbM95V0Aq4CCl
         vHzAuADH9mpHuHkcDV4y077Mku51ieEhX4uv3tNKLg/fV9wlVnghUZC+Qqcj6qtUIjsd
         52uIMtucOiDZGo2ciwqYGgRNZXxUwDdB/GH/0GwMSwijRy26JsMBQP74zJnIayIyl9lJ
         Te26KbAIxlqkbU86bhr3lqJrGiC7szZ64p9T2BTXJwRMqMhg0+VkpYfJn1Lt/CgaeQ0f
         dya2uNnHiWPBP3Qvak5U7gKtqN7IrqRBasItA/nM7ffaS1txsYKSc+xc8lG1z++B6XOF
         WSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dwROn1mPsy/kk9N99ydvqBeMM2O2HAtXlONjIBsBtw8=;
        b=EoNNPp9oaENjqyArVI8KMdOY75cs31fXWP/Ybx29kQcS27UOK6DLfal8MfPJwCLJWA
         3VKpcrbCQByauIez+rJaPlKIdEI7f9HD1r5eaFBZnK0+NAzEab4nlwTXdobmzfYswYUl
         h5qOwypXLr6JXvFPVP5SmZEHKtjrKhmaIgty2ilRc3dV03uOim5cqRYWwNHqi1Jglxy/
         5o5gjXJX2TlcD6YlrVkIigEw1g22Mdc152v17BOhQkQy5qL5PV5XBbLC5fqr39gOVj1Y
         +SC8+4rKsU2rC0aVXd4GHXiREX9ydVJ2PubYWmamZuiFF6SX+85lZxgbo6cIrLf+YzF2
         PjgQ==
X-Gm-Message-State: AFqh2kp/RTUCmBmptnRvZizW7ssZsiFZjK4yj6JD0ZnLlbiC/HD6HgQo
        jd3HONtm7TCvEwzMo6ARdatJ8Q==
X-Google-Smtp-Source: AMrXdXtwvzAVUVQcTEDmRvSkP9UYKDjI1dCGwoHCj3Jhl1jNF1LvHS4uV9XDtAqnjyagFkGrzW5Hqg==
X-Received: by 2002:a17:902:ab16:b0:195:ea0e:3221 with SMTP id ik22-20020a170902ab1600b00195ea0e3221mr9818704plb.3.1675121065913;
        Mon, 30 Jan 2023 15:24:25 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id g12-20020a63374c000000b00476d1385265sm7190333pgn.25.2023.01.30.15.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 15:24:25 -0800 (PST)
Message-ID: <f3a157d7-839f-ffa9-f2a0-d50ad8d45792@kernel.dk>
Date:   Mon, 30 Jan 2023 16:24:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] drivers/block: Remove PARIDE core and high-level
 protocols
To:     Ondrej Zary <linux@zary.sk>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Tim Waugh <tim@cyberelk.net>, linux-block@vger.kernel.org,
        linux-parport@lists.infradead.org, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <d4f7ebd5-d90d-fb96-0fad-bd129ac162dc@opensource.wdc.com>
 <20230130211050.16753-1-linux@zary.sk>
Content-Language: en-US
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230130211050.16753-1-linux@zary.sk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 1/30/23 2:10 PM, Ondrej Zary wrote:
> Remove PARIDE core and high level protocols, taking care not to break
> low-level drivers (used by pata_parport). Also update documentation.
> 
> Signed-off-by: Ondrej Zary <linux@zary.sk>

Acked-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe


