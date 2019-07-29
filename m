Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 599AC78E14
	for <lists+linux-ide@lfdr.de>; Mon, 29 Jul 2019 16:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727165AbfG2Oet (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 29 Jul 2019 10:34:49 -0400
Received: from enpas.org ([46.38.239.100]:37674 "EHLO mail.enpas.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727318AbfG2Oet (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Mon, 29 Jul 2019 10:34:49 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by mail.enpas.org (Postfix) with ESMTPSA id 89033100077;
        Mon, 29 Jul 2019 14:34:45 +0000 (UTC)
Subject: Re: [PATCH v3] ata/pata_buddha: Probe via modalias instead of
 initcall
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jens Axboe <axboe@kernel.dk>,
        Michael Schmitz <schmitzmic@gmail.com>,
        linux-ide@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190725180825.31508-1-max@enpas.org>
 <CAMuHMdURm-9nazOBTL8uRH8WMt7gi=QUYy0qr9kaxzczCr+ujg@mail.gmail.com>
 <9cde6e79-52da-e0c0-f452-6afc2e5fa5ee@enpas.org>
 <2fd27e50-8462-45e0-f158-72425ff648ac@physik.fu-berlin.de>
From:   Max <max@enpas.org>
Openpgp: preference=signencrypt
Autocrypt: addr=max@enpas.org; prefer-encrypt=mutual; keydata=
 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
 urZIw0nz8zec+73Bv/qF4GHHftLYfA==
Message-ID: <002b78cb-22d8-f2a5-765b-9718318b2c32@enpas.org>
Date:   Mon, 29 Jul 2019 16:34:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <2fd27e50-8462-45e0-f158-72425ff648ac@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 07/29/2019 02:20 PM, John Paul Adrian Glaubitz wrote:
> I have both an X-Surf100 and a Buddha and would be happy to provide an
> account on the Amiga with that hardware for you. You can run any
> tests you like and install any kernel you want.
> 
> If you need an older X-Surf version, you could always ask the guys on
> the a1k.org forum. They are usually very kind to loan hardware for these
> purposes.


Thanks for the generous offer!

Unfortunately, we are really talking about the original (non-100) X-Surf here, as only that one has the stripped down Buddha style IDE ports:

  http://wiki.icomp.de/wiki/X-Surf


Max
