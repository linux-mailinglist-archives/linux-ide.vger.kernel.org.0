Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 187C9E7A24
	for <lists+linux-ide@lfdr.de>; Mon, 28 Oct 2019 21:34:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730529AbfJ1Ued (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 28 Oct 2019 16:34:33 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:44027 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728452AbfJ1Ued (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 28 Oct 2019 16:34:33 -0400
Received: from belgarion ([90.55.204.252])
        by mwinf5d17 with ME
        id K8aV210025TFNlm038aVxK; Mon, 28 Oct 2019 21:34:31 +0100
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Mon, 28 Oct 2019 21:34:31 +0100
X-ME-IP: 90.55.204.252
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org
Subject: Re: [PATCH 14/46] ARM: pxa: use pdev resource for palmld mmio
References: <20191018154052.1276506-1-arnd@arndb.de>
        <20191018154201.1276638-14-arnd@arndb.de>
X-URL:  http://belgarath.falguerolles.org/
Date:   Mon, 28 Oct 2019 21:34:28 +0100
In-Reply-To: <20191018154201.1276638-14-arnd@arndb.de> (Arnd Bergmann's
        message of "Fri, 18 Oct 2019 17:41:29 +0200")
Message-ID: <87imo8mwx7.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> writes:

> The palmld header is almost unused in drivers, the only
> remaining thing now is the PATA device address, which should
> really be passed as a resource.
>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: linux-ide@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
