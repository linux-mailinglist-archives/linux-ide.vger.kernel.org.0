Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7C943C07C
	for <lists+linux-ide@lfdr.de>; Wed, 27 Oct 2021 05:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238875AbhJ0DFi (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 26 Oct 2021 23:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238870AbhJ0DFh (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 26 Oct 2021 23:05:37 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE33DC061767
        for <linux-ide@vger.kernel.org>; Tue, 26 Oct 2021 20:03:12 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id i14so1829607ioa.13
        for <linux-ide@vger.kernel.org>; Tue, 26 Oct 2021 20:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:in-reply-to:references:subject:message-id:date:mime-version
         :content-transfer-encoding;
        bh=WhVgBZyjjwEGZQNqjeVnETidtow6NissgMrtRsadT/M=;
        b=Pc9FzVUD0IPAc1WZuP3RDDR1PZaoPfTjncDC6+wxvuIXB+plZrQjJe5vSwPLx8tROe
         0wwwI7yH/I+T5jk8Ts+oMSO3k/EtbwGnKjY+m85NwgASYgFef3uN9oWh4VnbHjgnlGe2
         HyZfaRmOXFzvultD1hN2atbw/PF1ksvuOS2S47/gS4NUDXCFg9gDQtPHYGiVC2FpW2g1
         VHhzdr00Sg15aRDs3ppstxLFDa19j7zBALg3MjeDQHc5svq6f3cEFRXK6appMOAdrG/E
         WePTr4iD61hDjaex43mt1InqNpOvXmVhvvatG2k47dK+PLEPIDcCcmcJpgBnbzWJX8RL
         f1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=WhVgBZyjjwEGZQNqjeVnETidtow6NissgMrtRsadT/M=;
        b=XinjCW7NSxTz88C6C+d2bBL8uW/GbwEB3GBVvybBSLA8BAzcIhyh2ATiTKOb/OiD0n
         eic6igg5JyRid35SSmJ2kBLG6esCLWsjtN30Gs9TOL9WVYGyXF0TC32DZC5FGzqTEXLq
         Q86+Ch21B6USGclppKaED8LqVbDmdblPKrhYsmcDn4vVtQZiNLJDOR6n0GSiG64gacqa
         /Y+JmxIRGtEeRKhn1rOb4xPxer1So41KbpBqxYuTXASUF9jB8hthuDhzxTS6UySkdpWY
         1bdFPiHxfBVkMZXT7pX/79qchagxRVFKXjaRe2+jdOuFNJKlpgFsbWzWSzGrinh8UIHO
         o8dw==
X-Gm-Message-State: AOAM532Gw/6y+UIMVwCuTpkJ67tDBkCIXSnrvpnITa6EVM0bNAzURFXN
        cxZpCNbZNVRUe653mWsQtwVOoQ==
X-Google-Smtp-Source: ABdhPJwqWZjkIw6dd543NjQC+ljg6ltyhOguijCggJPKhg2KhLIjA99sI8hvZNPiDCwmPt8R5ezruA==
X-Received: by 2002:a05:6602:15c7:: with SMTP id f7mr17278062iow.116.1635303791723;
        Tue, 26 Oct 2021 20:03:11 -0700 (PDT)
Received: from [127.0.1.1] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id l14sm18686iow.27.2021.10.26.20.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 20:03:11 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     Damien Le Moal <damien.lemoal@wdc.com>, linux-scsi@vger.kernel.org,
        linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20211027022223.183838-1-damien.lemoal@wdc.com>
References: <20211027022223.183838-1-damien.lemoal@wdc.com>
Subject: Re: (subset) [PATCH v9 0/5] Initial support for multi-actuator HDDs
Message-Id: <163530378980.280708.1930100562722723564.b4-ty@kernel.dk>
Date:   Tue, 26 Oct 2021 21:03:09 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Wed, 27 Oct 2021 11:22:18 +0900, Damien Le Moal wrote:
> From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> 
> Single LUN multi-actuator hard-disks are cappable to seek and execute
> multiple commands in parallel. This capability is exposed to the host
> using the Concurrent Positioning Ranges VPD page (SCSI) and Log (ATA).
> Each positioning range describes the contiguous set of LBAs that an
> actuator serves.
> 
> [...]

Applied, thanks!

[2/5] scsi: sd: add concurrent positioning ranges support
      commit: e815d36548f01797ce381be8f0b74f4ba9befd15
[3/5] libata: support concurrent positioning ranges log
      commit: fe22e1c2f705676a705d821301fc52eecc2fe055
[4/5] doc: document sysfs queue/independent_access_ranges attributes
      commit: 6b3bae2324d2ecaa404ceab869018011b7ef6a90
[5/5] doc: Fix typo in request queue sysfs documentation
      commit: 9d824642889823c464847342d6ff530b9eee3241

Best regards,
-- 
Jens Axboe


