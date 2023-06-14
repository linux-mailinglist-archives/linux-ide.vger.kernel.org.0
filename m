Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0CBE71F835
	for <lists+linux-ide@lfdr.de>; Fri,  2 Jun 2023 03:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbjFBBxx (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 1 Jun 2023 21:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjFBBxw (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 1 Jun 2023 21:53:52 -0400
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 01 Jun 2023 18:53:51 PDT
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FE75C0
        for <linux-ide@vger.kernel.org>; Thu,  1 Jun 2023 18:53:51 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id 2c58c2fe-00e8-11ee-b972-005056bdfda7;
        Fri, 02 Jun 2023 04:52:47 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Fri, 2 Jun 2023 04:52:47 +0300
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Damien Le Moal <dlemoal@kernel.org>,
        Michael Peters <mpeters@embeddedts.com>,
        Kris Bahnsen <kris@embeddedts.com>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 38/43] pata: cirrus: drop legacy pinctrl
Message-ID: <ZHlLbzK5exaVzaPj@surfacebook>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
 <20230601054549.10843-20-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601054549.10843-20-nikita.shubin@maquefel.me>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Thu, Jun 01, 2023 at 08:45:43AM +0300, Nikita Shubin kirjoitti:
> Drop legacy acquire/release since we are using
> pinctrl for this now.

...

>  	drv_data = devm_kzalloc(&pdev->dev, sizeof(*drv_data), GFP_KERNEL);
> -	if (!drv_data) {
> -		err = -ENXIO;

Wondering why it's not ENOMEM even in the original code?

> -		goto err_rel_gpio;
> -	}
> +	if (!drv_data)
> +		return -ENXIO;

-- 
With Best Regards,
Andy Shevchenko


