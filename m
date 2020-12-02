Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C66B72CC96E
	for <lists+linux-ide@lfdr.de>; Wed,  2 Dec 2020 23:17:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgLBWRK (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 2 Dec 2020 17:17:10 -0500
Received: from vps.thesusis.net ([34.202.238.73]:44110 "EHLO vps.thesusis.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbgLBWRK (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Wed, 2 Dec 2020 17:17:10 -0500
Received: from localhost (localhost [127.0.0.1])
        by vps.thesusis.net (Postfix) with ESMTP id 94F5B201BC;
        Wed,  2 Dec 2020 17:16:29 -0500 (EST)
Received: from vps.thesusis.net ([IPv6:::1])
        by localhost (vps.thesusis.net [IPv6:::1]) (amavisd-new, port 10024)
        with ESMTP id uD_V5g_ThAlC; Wed,  2 Dec 2020 17:16:29 -0500 (EST)
Received: by vps.thesusis.net (Postfix, from userid 1000)
        id 64434201BE; Wed,  2 Dec 2020 17:16:29 -0500 (EST)
References: <87r1o9phgd.fsf@vps.thesusis.net> <20201202150330.GA25031@infradead.org> <87blfc19u5.fsf@vps.thesusis.net> <9a72bd02bd9230cc2258065faf01eb846530fd7d.camel@HansenPartnership.com>
User-agent: mu4e 1.5.7; emacs 26.3
From:   Phillip Susi <phill@thesusis.net>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Christoph Hellwig <hch@infradead.org>, linux-ide@vger.kernel.org
Subject: Re: Drive reset as an EH strategy when write cache is enabled
Date:   Wed, 02 Dec 2020 17:11:33 -0500
In-reply-to: <9a72bd02bd9230cc2258065faf01eb846530fd7d.camel@HansenPartnership.com>
Message-ID: <87k0tzzwea.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org


James Bottomley writes:

> As Christoph said it would be stupid behaviour to invalidate the cache
> after a hard reset because it would cause all deferred writes to fail. 
> The SCSI standards committee did initially assume manufacturers knew
> this, but it was codified in SBC-4 and beyond with an explicit list of
> conditions under which the write back cache could be lost, which
> doesn't include hard reset.

Wow... so a hard reset is in fact, not really a hard reset?  I can see a
soft reset maybe preserving the cache but I would expect a hard reset to
be equal to pulsing the ^RST line.  In fact, my understanding from
reading the SATA spec was that the hard reset bus condition was intended
to be detected by the PHY layer and pulse the ^RST signal to the higher
level logic.  Wait... SBC-4 applies to ATA disks too?

