Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B18D71A80B
	for <lists+linux-ide@lfdr.de>; Sat, 11 May 2019 16:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbfEKOAE (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 11 May 2019 10:00:04 -0400
Received: from [195.159.176.226] ([195.159.176.226]:52330 "EHLO
        blaine.gmane.org" rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbfEKOAE (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 11 May 2019 10:00:04 -0400
Received: from list by blaine.gmane.org with local (Exim 4.89)
        (envelope-from <lnx-linux-ide@m.gmane.org>)
        id 1hPSXi-000o1h-D2
        for linux-ide@vger.kernel.org; Sat, 11 May 2019 16:00:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To:     linux-ide@vger.kernel.org
From:   Stefan Monnier <monnier@iro.umontreal.ca>
Subject: Re: [RFC PATCH] drivers: ata: ahci_sunxi: Increased SATA/AHCI DMA TX/RX FIFOs
Followup-To: gmane.comp.hardware.netbook.arm.sunxi
Date:   Sat, 11 May 2019 09:37:57 -0400
Message-ID: <jwvk1ex6rvb.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi@gnu.org>
References: <20190510192550.17458-1-um@mutluit.com>
Mime-Version: 1.0
Content-Type: text/plain
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.50 (gnu/linux)
Cancel-Lock: sha1:TqFZDTfUSsj+377WoJNdJw76Z48=
Cc:     linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, u-boot@lists.denx.de
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

> Increasing the SATA/AHCI DMA TX/RX FIFOs (P0DMACR.TXTS and .RXTS) from
> default 0x0 each to 0x3 each gives a write performance boost of 120MB/s
> from lame 36MB/s to 45MB/s previously. Read performance is about 200MB/s
> [tested on SSD using dd bs=4K count=512K].

Such a simple patch to fix such a long-standing performance problem that
everyone [ well, apparently not quite everyone ] assumed was a hardware
limitation...

And yet, April 1st is long gone.

Is it really for real?


        Stefan

