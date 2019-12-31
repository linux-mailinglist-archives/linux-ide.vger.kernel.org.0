Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E931B12DB1F
	for <lists+linux-ide@lfdr.de>; Tue, 31 Dec 2019 20:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbfLaTPC (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 31 Dec 2019 14:15:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:43142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727071AbfLaTPC (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 31 Dec 2019 14:15:02 -0500
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2AF4A206DA;
        Tue, 31 Dec 2019 19:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577819701;
        bh=UWto3XP+ZHcVrrBu2TteLJLRk/PVGGUsPg6wRnGsP+c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pAq7Rgix32WHI6LNSqKDVVDCW3njo46IzFAiEVoINxwiSCxTtBLBCNSWDmIMFo3Z9
         pX+3FoZ3MZ4AcQuXprYeiS6vV26H4JR6erkzrS/66Kh00GR+L0HopVtt+F6rPkMUzT
         VaVjacJ+dKDlq/l4XSadBsZOZf8kkpsMWsKcBALM=
Received: by mail-qt1-f169.google.com with SMTP id k40so32087395qtk.8;
        Tue, 31 Dec 2019 11:15:01 -0800 (PST)
X-Gm-Message-State: APjAAAUhdfeGJP0BpTJH6RZoA9NHzOPnOYjDCbvC2uP5QrenrzRcNlFt
        vp/4Z2BTyQAhiVxYXbZgSqyRn/v2g4XdWYr5vw==
X-Google-Smtp-Source: APXvYqxc0cAnoLAtxMDKYY5xyGwDWOT1jbUfpXfE/kyndHP4PA+CDISAdBOM06xN+iB1TJYfS67KpcYKxPmY+HL8Sn4=
X-Received: by 2002:ac8:59:: with SMTP id i25mr54208175qtg.110.1577819700388;
 Tue, 31 Dec 2019 11:15:00 -0800 (PST)
MIME-Version: 1.0
References: <20191231172458.25984-1-linus.walleij@linaro.org> <20191231172458.25984-2-linus.walleij@linaro.org>
In-Reply-To: <20191231172458.25984-2-linus.walleij@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 31 Dec 2019 12:14:44 -0700
X-Gmail-Original-Message-ID: <CAL_JsqKm=7Gx7g=uKFtFprPMRSxS24vAq9J85YYB+9sNjJVQWg@mail.gmail.com>
Message-ID: <CAL_JsqKm=7Gx7g=uKFtFprPMRSxS24vAq9J85YYB+9sNjJVQWg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: Convert Faraday FTIDE010 to DT schema
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>, device@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Tue, Dec 31, 2019 at 10:25 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This uses the new pata-sata-controller.yaml schema to
> convert the Faraday FTIDE010 to DT schema.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: device@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/ata/faraday,ftide010.txt         | 38 --------
>  .../bindings/ata/faraday,ftide010.yaml        | 89 +++++++++++++++++++
>  2 files changed, 89 insertions(+), 38 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/ata/faraday,ftide010.txt
>  create mode 100644 Documentation/devicetree/bindings/ata/faraday,ftide010.yaml

LGTM. Will wait for new version of patch 1.

Rob
