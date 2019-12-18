Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC3C123CF7
	for <lists+linux-ide@lfdr.de>; Wed, 18 Dec 2019 03:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfLRCNx (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 17 Dec 2019 21:13:53 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33647 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfLRCNx (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 17 Dec 2019 21:13:53 -0500
Received: by mail-oi1-f196.google.com with SMTP id v140so324363oie.0;
        Tue, 17 Dec 2019 18:13:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LPBOmy7W/ZFe0ELwwz580Y4hQoxgj9ncwGmvv/HKHek=;
        b=aWFrXKPdaxfhI9dHxPMhFdWuz0aZtr1BqnnSEd1JSoPuWzXbAkInYff9kCoW9zJzi+
         VLD7Jbgif23w+++KfBgv49SEwZGzQbW88M/bjqd1KuMrDrOodYJZ5bWQFNmZ3w71r3dP
         qbWHJrHI7LMlWJRaHqwX+GLoKf+M6zWA0ysq7GF220seEZtmI5sxmhghOc/aX1mGy3Im
         evKdy+HWvB+YXGIDjP4nTGheEJuSJMicjsZHlrMue3HAv3XVcwym7NwjLYsnQi6OMPJ7
         nqwDS38VXCjwHCbJY4aBTbg8Jkj30JE35eHdX0gmg1HhfJbJY4mpcTojoHK/B6z72gUw
         HrLw==
X-Gm-Message-State: APjAAAVwafc2h16d09coT82xruvKamSHC/EdTkK2xIMNu6NblOYn26Lb
        rsrquqtyfHK0ztt3aU43xg==
X-Google-Smtp-Source: APXvYqz7hA2CoDvvetbOQ4+F/q4I9CRdUWC0eiBMNhIaRXad6ue52NPnIHqnVn/hvXCON7ayOwtNyQ==
X-Received: by 2002:aca:61c4:: with SMTP id v187mr157794oib.8.1576635232618;
        Tue, 17 Dec 2019 18:13:52 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x16sm252374oto.41.2019.12.17.18.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 18:13:52 -0800 (PST)
Date:   Tue, 17 Dec 2019 20:13:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, axboe@kernel.dk,
        linux-ide@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] dt-bindings: ata: Convert Allwinner AHCI controller to a
 schema
Message-ID: <20191218021351.GA27803@bogus>
References: <20191213074938.27285-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191213074938.27285-1-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Fri, 13 Dec 2019 08:49:38 +0100, Maxime Ripard wrote:
> The Allwinner SoCs have a AHCI controllers that is supported in Linux, with
> a matching Device Tree binding.
> 
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../devicetree/bindings/ata/ahci-platform.txt | 12 ----
>  .../ata/allwinner,sun4i-a10-ahci.yaml         | 47 +++++++++++++
>  .../ata/allwinner,sun8i-r40-ahci.yaml         | 67 +++++++++++++++++++
>  3 files changed, 114 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ata/allwinner,sun4i-a10-ahci.yaml
>  create mode 100644 Documentation/devicetree/bindings/ata/allwinner,sun8i-r40-ahci.yaml
> 

Applied, thanks.

Rob
