Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A87E4224C0
	for <lists+linux-ide@lfdr.de>; Sat, 18 May 2019 22:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728395AbfERUGO (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 18 May 2019 16:06:14 -0400
Received: from mail-yw1-f49.google.com ([209.85.161.49]:43704 "EHLO
        mail-yw1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727926AbfERUGO (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 18 May 2019 16:06:14 -0400
Received: by mail-yw1-f49.google.com with SMTP id t5so4147989ywf.10
        for <linux-ide@vger.kernel.org>; Sat, 18 May 2019 13:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=pu9bNkQhXd7WpgNn+fLXKeWnYuth+jE0tz+jPh5+8AI=;
        b=ryBoCG3j1GlueASgPpN4AMHoEP+dEcBMm/CkNDIDLqISo7nBLzfTxZ1uNRnzS+jZDN
         CkRp00JRVJzvW9wbCAGOvoLNOLvjZo2td9lHONxJG0+95Wkrl5xpr/jt9xWyxG2HEl07
         l2jBDkCB2BdYDN94Qqu4NqcNyUyytHVfoWnfUqVsC/7YmWfSgnYAHwHjX3EuUnQL+k5V
         5glr27FWTsXYfxGXxoVnHjNTcxmRDJSykKlHzQLXrpy1cT3W5ogB6JCg7uHdAF2m+R2S
         7JGgzKk/phLXbhexXIHKIJktqM6NgY8DbtvA2rkU1HPIZvWT7JhuTVtdgsbgnLfMQ68K
         O4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=pu9bNkQhXd7WpgNn+fLXKeWnYuth+jE0tz+jPh5+8AI=;
        b=mI1T+5rg8zo8Ey6s5VhUAxFk/hwaQ/psMCI7kk1DBqS8qz89xO/3BEfZY7knuhcIF3
         Z8sIiNaSZdt/goSPwPBrwdq7oGAKJQAhPyjg4FniMR3dnFQTBQw/+f2eeIDpSh7fqymD
         NjBedA1uT0Qrd98P3MsGFat+4Q7jtbzIYr24UcWJnHOcaYgjZoHzDtpI8y7DVQZ80ZkY
         oJ7p9zhX8TY4nT+DYZBY5bAo7pwr06XQmYeIotP7Rle46BJCsE5JjmZRGKcCc6JD+b3j
         CCC/2DGxjCobJPg725mw9hR0340njFTRQu4LW3TWDDq4IOwWzL+W0XVo1446LTttlRR7
         +b9w==
X-Gm-Message-State: APjAAAXVhvqG8Dg48aCwe5zj8Qck6GIE54rghqcSkyq3oLwp/6jS3oOw
        rqoIcA+mu6Vv8NlEyUEIJLpKEYjh1EHnQEuN4eKRFWvs
X-Google-Smtp-Source: APXvYqx3Cak4eLbMOHjHv44B9OjaksD+bZpxUz7dLvuO1/GSRMzoquAndWhu3hYUrAtma39F5gB5Qiz+rAFk3jQRJ5k=
X-Received: by 2002:a0d:d711:: with SMTP id z17mr19577888ywd.128.1558209973097;
 Sat, 18 May 2019 13:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <S1727300AbfEQXhy/20190517233755Z+6@vger.kernel.org>
 <5abd2a85-7cd9-f408-374f-55d9cd72f2f6@gmail.com> <fb9fc28f-550b-60dc-a7a9-5e9c1e1a4aa6@gmail.com>
In-Reply-To: <fb9fc28f-550b-60dc-a7a9-5e9c1e1a4aa6@gmail.com>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Sat, 18 May 2019 22:06:06 +0200
Message-ID: <CA+QBN9C=y30y9ZzWtn_9ptMrn=PwtrUf6c+BRUh2HYae2Uvbdg@mail.gmail.com>
Subject: problem with SIL24 and sata_mv on PCI64
Cc:     linux-ide@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

hi guys
I am testing a few boards on a PowerMacG4 MDD and on a PA-RISC C3600
machine and I am obtaining different results concerning the stability
of drivers

see here, logs, scripts, and results
http://www.downthebunker.com/reloaded/space/viewtopic.php?f=50&t=337

both the PowerMacG4 and the PA-RISC C3600 have PCI64 buses, not PCI-X,
while e.g. the SIL24 chips are designed to be PCI-X

anyway, on PA-RISC it seems there is a problem with the drivers
concerning the DMA.

Guys, I don't know how to investigate, so help is welcome.
thanks
