Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0714B2CC615
	for <lists+linux-ide@lfdr.de>; Wed,  2 Dec 2020 20:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387805AbgLBS7V (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 2 Dec 2020 13:59:21 -0500
Received: from bedivere.hansenpartnership.com ([96.44.175.130]:51356 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726104AbgLBS7V (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 2 Dec 2020 13:59:21 -0500
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 1346D1280953;
        Wed,  2 Dec 2020 10:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1606935521;
        bh=+v7ziyHZ2mHvnsQ8vpFfQDHBJJb35PBL7WMC6T1lrWg=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=MgoimLflKbYJC+ZUKSxOqD5bRKR3xb/h2dliM3eJLAUbvDKGt3LraKVGDKMDDvzYc
         EZojm7/anVXUEtHGlN0YXHuebcq9nrzHAWLAr33vf2TzJgM5u2EAFZZI7Y/kTblx85
         /0ch2A0pPHpFPR7atBva+1bNVL4+571t0bzpifDY=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4fzyhjJZWr-5; Wed,  2 Dec 2020 10:58:41 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id B9AF51280948;
        Wed,  2 Dec 2020 10:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1606935520;
        bh=+v7ziyHZ2mHvnsQ8vpFfQDHBJJb35PBL7WMC6T1lrWg=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=xGjIdwcGECTGIGfrS8hKkVmUf9sjcs49eZxjb31iK7bAyWrHxrHYNv8U03mXGtaMi
         kxv/bFPBJKAJY8bBodYBIJnmtV+oMIe52SM8UZkPRCR2Sbij/rJ7cpBj0E9UCbrEKe
         so6sHNXaM/fLzHe+6fbDcC7EQpcpUpnAC0E7GEs8=
Message-ID: <9a72bd02bd9230cc2258065faf01eb846530fd7d.camel@HansenPartnership.com>
Subject: Re: Drive reset as an EH strategy when write cache is enabled
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Phillip Susi <phill@thesusis.net>,
        Christoph Hellwig <hch@infradead.org>
Cc:     linux-ide@vger.kernel.org
Date:   Wed, 02 Dec 2020 10:58:39 -0800
In-Reply-To: <87blfc19u5.fsf@vps.thesusis.net>
References: <87r1o9phgd.fsf@vps.thesusis.net>
         <20201202150330.GA25031@infradead.org> <87blfc19u5.fsf@vps.thesusis.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Wed, 2020-12-02 at 10:55 -0500, Phillip Susi wrote:
> Christoph Hellwig writes:
> 
> > If the device drops the content of the volatile write on a reset
> > we'll have much problems than that..
> 
> How could it not?  The write cache is empty after a power on reset
> and certainly a "hard" reset should be the same as a power on reset.

As Christoph said it would be stupid behaviour to invalidate the cache
after a hard reset because it would cause all deferred writes to fail. 
The SCSI standards committee did initially assume manufacturers knew
this, but it was codified in SBC-4 and beyond with an explicit list of
conditions under which the write back cache could be lost, which
doesn't include hard reset.

James


