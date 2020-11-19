Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242A52B98A1
	for <lists+linux-ide@lfdr.de>; Thu, 19 Nov 2020 17:55:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729229AbgKSQvh (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 19 Nov 2020 11:51:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729220AbgKSQvh (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 19 Nov 2020 11:51:37 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D16C0613CF
        for <linux-ide@vger.kernel.org>; Thu, 19 Nov 2020 08:51:36 -0800 (PST)
Date:   Thu, 19 Nov 2020 17:51:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1605804694;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kZe0V7+ipmMsx89OTU00V1hyLshp8XyYL/h/9rYIESg=;
        b=PAId70pbh4TwsepUOmJszWVtu+qKYLDZkEWEAIYRl4cgZ4Y9WbvnHd47auMSKNYDgBY2gi
        AQR1r3JcPaCZLFiorhA9tabLKHcFuKGZvORAduEyQS5TgkDPUpVZVPAVpQR9bl7tbUcUvo
        BEtiQ60fQ0PyyxYCVfPCPAOhBP11MXvr1SgjLiB7S4/ZTihLssvxy22vGzQ18gM5e9OOCk
        7IvoyLXaIQsgJrouzBhSwvYVrnpoHOyNKEpxvv2XkaQeu4Gv4f6ZlQWEjwy9ZBiib/DIiL
        2oXZXLfPLKQ2u46XD8+WkYH5+MqH0MIXiJbA2FfmZcjXt3hAhRKmVw3KOOXMWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1605804694;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kZe0V7+ipmMsx89OTU00V1hyLshp8XyYL/h/9rYIESg=;
        b=sUdNqDBRsvBh2q8nPQOaboy+wOXEU6TxqWaYUzA/2yU12ufDSl3CHl28oIlt8ZjWLGAgac
        eLLTR6fKk9lSBzBw==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-ide@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 0/2] ide: Remove in_interrupt()
Message-ID: <20201119165133.oqjnlxvcry64jjsv@linutronix.de>
References: <20201113161021.2217361-1-bigeasy@linutronix.de>
 <81acdb73-be79-98ae-f736-ae70f14f02f7@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <81acdb73-be79-98ae-f736-ae70f14f02f7@kernel.dk>
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 2020-11-13 09:25:08 [-0700], Jens Axboe wrote:
> On 11/13/20 9:10 AM, Sebastian Andrzej Siewior wrote:
> > In the discussion about preempt count consistency across kernel
> > configurations:
> > 
> >  https://lore.kernel.org/r/20200914204209.256266093@linutronix.de/
> > 
> > it was concluded that the usage of in_interrupt() and related context
> > checks should be removed from non-core code.
> > 
> > This ide subsystem has two in_interrupts() checks before mutex/wait-event
> > invocations.
> 
> Acked-by: Jens Axboe <axboe@kernel.dk>

Andrew, are you okay with routing these two patches via your tree?

Sebastian
