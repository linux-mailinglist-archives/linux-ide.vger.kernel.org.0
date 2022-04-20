Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE3B0508377
	for <lists+linux-ide@lfdr.de>; Wed, 20 Apr 2022 10:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358550AbiDTIfb (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 20 Apr 2022 04:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234390AbiDTIfa (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 20 Apr 2022 04:35:30 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61BD112608;
        Wed, 20 Apr 2022 01:32:44 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0C778536;
        Wed, 20 Apr 2022 08:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0C778536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1650443564; bh=EeEpIfdigfffg8NaEbRzW8uYlyB3A0q+DgF2ulwWiUo=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=LAdYtryJ4UJZWBLSyRVsevByEqqkkmGoaT9+bXQBI1eIKjNW9uFGKs1CAdF20NOfP
         Jf9Nc5prp9OQ2bSfaAVxXcXUYNEzO1KqaCswMj4z7A7ygnbISENf36Zehr1RZTJ5rK
         B/7eUV5V60IvYqU6sEng67XPNfd5jQSaaJc7liHOynFtPYpBcbnqeQt7GIBpUXpDM7
         xq2MtFdNkCauI4/akd5SfsysjdjqcrnmbKXikN4ozg6dNS49AZ8kZv14pmbO2YJ8JJ
         4GlxBLj7wmmfaybwyjqfH71+gyDpRx4534/e7FvrWk6g0bnBtEYOc2E3b78UGqyNZp
         b+JgeK8sDi1mQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc:     patches@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
        Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org,
        linux-block@vger.kernel.org
Subject: Re: [PATCH] Drop Documentation/ide/
In-Reply-To: <851c5e50-920e-579a-717d-10284abd4d0a@opensource.wdc.com>
References: <20220419011021.15527-1-rdunlap@infradead.org>
 <7991758d-16b4-c9c4-0425-c2ec41943db8@opensource.wdc.com>
 <87ilr5zgj2.fsf@meer.lwn.net>
 <851c5e50-920e-579a-717d-10284abd4d0a@opensource.wdc.com>
Date:   Wed, 20 Apr 2022 02:32:39 -0600
Message-ID: <87k0bk40k8.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Damien Le Moal <damien.lemoal@opensource.wdc.com> writes:

>>> Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
>>>
>>> Jonathan,
>>>
>>> Are you going to take this patch or do you want me to queue it through the
>>> libata tree ?
>> 
>> I'll take it, unless you want to carry it for some reason - just let me
>> know.
>
> No particular reason for me to take it. Just checking :)
> Please take it.

Done.

Thanks,

jon
