Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA1B39C3EA
	for <lists+linux-ide@lfdr.de>; Sat,  5 Jun 2021 01:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbhFDXdZ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 4 Jun 2021 19:33:25 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:47454 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbhFDXdZ (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 4 Jun 2021 19:33:25 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id E34E727447;
        Fri,  4 Jun 2021 19:31:36 -0400 (EDT)
Date:   Sat, 5 Jun 2021 09:31:49 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
cc:     Linux/m68k <linux-m68k@vger.kernel.org>, linux-ide@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] m68k: io_mm.h: conditionalize ISA address
 translation on Atari
In-Reply-To: <28042fd1-4a54-af21-347f-165b8e4e63b4@gmail.com>
Message-ID: <3ee560b9-2f87-5cf8-cc6-e1c34eea7cef@linux-m68k.org>
References: <CAMuHMdUskb3oicq8Kbf6MY_4mn4-Y1pJ-om4fny7k48gndscgg@mail.gmail.com> <1622611267-15825-1-git-send-email-schmitzmic@gmail.com> <1622611267-15825-2-git-send-email-schmitzmic@gmail.com> <25ab336d-e0e0-41a8-d468-ecbf8d83d2b@linux-m68k.org>
 <143313da-d294-f89b-d285-235230514c5a@gmail.com> <CAMuHMdU5ebmsErLdy6EykCHNULsBVFCpVsz0H3gpTLUmH1tt7g@mail.gmail.com> <28042fd1-4a54-af21-347f-165b8e4e63b4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Sat, 5 Jun 2021, Michael Schmitz wrote:

> Am 04.06.2021 um 19:54 schrieb Geert Uytterhoeven:
> > > > I have to wonder whether there is a nice simple definition for 
> > > > MULTI_ISA.
> > > 
> > > As I understand it, MULTI_ISA means that different byte orders 
> > > and/or different address translations need to be used in the same 
> > > kernel, so all that cannot be decided at build time.
> > > 
> > > As long as there is only a single platform that will use this code 
> > > (ISA only used on a single platform, and neither Atari IDE nor 
> > > EtherNEC used), MULTI_ISA is not needed.
> > > 
> > > If we have Kconfig symbols for 'single platform only', and 
> > > 'multi-platform ISA use', that might be shorter to write and easier 
> > > to understand. Geert?
> > 
> > It would be nice to have that automatically, like with the current 
> > MULTI_ISA define (and all the MACH_* in 
> > arch/m68k/include/asm/setup.h). Perhaps we should extend kconfig 
> > syntax to define a group of related symbols, and to automatically 
> > generate CONFIG_FOO_MULTI or CONFIG_FOO_SINGLE (and even 
> > CONFIG_BAR_ONLY?) symbols?
> 
> I take it this is not supported by our current Kconfig syntax?
> 

That may be because CPP hacking is seen as a competitive sport in some 
circles.

> > group ISA
> >      item ATARI_ROM_ISA
> >      item AMIGA_PCMCIA
> >      item Q40
> > 
> > => CONFIG_ISA_MULTI or CONFIG_ISA_SINGLE (+ e.g. ATARI_ROM_ISA_ONLY
> >    if appropriate).
> > 

Since the items may be bools or tristates, it not clear what type the 
group has.

Anyway, I see that we can already write this:

#define IS_MULTI(a,b) __or(IS_ENABLED(a), IS_ENABLED(b))

So maybe we just need an exclusive-OR macro to go with the other operators 
defined in include/linux/kconfig.h? Then we could write this:

#define IS_SINGLE(a,b) __xor(IS_ENABLED(a), IS_ENABLED(b))

But these only work for a 2-way group. Extending them to N-way groups is 
beyond my CPP abilities. It probably requires N-way __or() and __xor()...
