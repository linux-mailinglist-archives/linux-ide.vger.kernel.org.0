Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB9F12B9FAC
	for <lists+linux-ide@lfdr.de>; Fri, 20 Nov 2020 02:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgKTB0i (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 19 Nov 2020 20:26:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:35582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726295AbgKTB0i (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Thu, 19 Nov 2020 20:26:38 -0500
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C3D8222259;
        Fri, 20 Nov 2020 01:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1605835598;
        bh=mn1FbsjHnA13XZYiCSQwPlA488OOiEN3dfzdemkpFEw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=L+6VzVpJq7hG7W9YyWL/jEBnXcgl6FDWkfXTcCrqG7kzMsOo7/z7c5GQw8OW8Reju
         gP+O5gz/qJXTIAwm7eBdPVH6Ht0X+Q6dpBnZk8n0EYETKNpBv1/tmkO5mtAqxkaTlX
         cNqE1+TG3vF2bAErH+EbOeQI7NctErqzEXh0DfUg=
Date:   Thu, 19 Nov 2020 17:26:37 -0800
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 0/2] ide: Remove in_interrupt()
Message-Id: <20201119172637.7e7fc6679dd5766526de27b9@linux-foundation.org>
In-Reply-To: <20201119165133.oqjnlxvcry64jjsv@linutronix.de>
References: <20201113161021.2217361-1-bigeasy@linutronix.de>
        <81acdb73-be79-98ae-f736-ae70f14f02f7@kernel.dk>
        <20201119165133.oqjnlxvcry64jjsv@linutronix.de>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Thu, 19 Nov 2020 17:51:33 +0100 Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> On 2020-11-13 09:25:08 [-0700], Jens Axboe wrote:
> > On 11/13/20 9:10 AM, Sebastian Andrzej Siewior wrote:
> > > In the discussion about preempt count consistency across kernel
> > > configurations:
> > > 
> > >  https://lore.kernel.org/r/20200914204209.256266093@linutronix.de/
> > > 
> > > it was concluded that the usage of in_interrupt() and related context
> > > checks should be removed from non-core code.
> > > 
> > > This ide subsystem has two in_interrupts() checks before mutex/wait-event
> > > invocations.
> > 
> > Acked-by: Jens Axboe <axboe@kernel.dk>
> 
> Andrew, are you okay with routing these two patches via your tree?

Sure, but I'm not subscribed to linux-ide.  Please resend, cc myself
and linux-kernel?
