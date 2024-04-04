Return-Path: <linux-ide+bounces-1170-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6185A898268
	for <lists+linux-ide@lfdr.de>; Thu,  4 Apr 2024 09:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2009B26A9A
	for <lists+linux-ide@lfdr.de>; Thu,  4 Apr 2024 07:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F775C61D;
	Thu,  4 Apr 2024 07:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahmcg0O/"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B935B1F6;
	Thu,  4 Apr 2024 07:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712216753; cv=none; b=ouZu7hph2kN0yLB9wOU1LNCqG8inih8id23lXkx2L1NQkxhRp0ZpQVY+WVZo5cdiR83FOYn8kOv6OsybtlcSdgnIDx4D8f8rRGIzACmN1SXlXTgNegKMHK/l+vZpwEqG+zuNtvGnJFRiUnHuGXSx8QyzZzk3ZdU+nG6tJMo9czA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712216753; c=relaxed/simple;
	bh=vcETtOrVy9bTRvDJ6u7ogSjCKNt7NXEhds5NARQGbPY=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=cAZ4eJJecI/TZQEysaTarMoXp+vAzdB+usGAnFAGiSCfHpORW84txP0OZH4IK/38mhR41MtKD7vI0thnZApjXoY1E/53vjB6blU1TtplkKStEQm5mmO+PWaQi/SfKijUt3aVnGMV1DfUcUxqcpPM1WvHWpxFvfHWP3W3hmUmY5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahmcg0O/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5535EC433F1;
	Thu,  4 Apr 2024 07:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712216752;
	bh=vcETtOrVy9bTRvDJ6u7ogSjCKNt7NXEhds5NARQGbPY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ahmcg0O/wVgUSHDmaLqFtCVQppeFQLHTQcwLUR3ZoemzEiydJLq5n65V+ZZF4U3Z/
	 iZTZ2dGWs5n/xGsr2C9Ro8bxdpCo0mryC+/NJ293dDVVrTasGOJjky78rF1l0Vh5Cj
	 ewN+vdhM+Vk7MvaEXrP9a5f9hvvIhXjlvvkp5fjW6hQf8tlH5S2zNXD299vhN6PNvh
	 Y5zEUTiauyseC4AumRqKYaxCMkjyr8HU9RPqz7Q7M32OkZevScqGC8ldR1pXRVNnPN
	 lCtMqbIda7OLCc5vYYCtjdUg0R4nqeFderQtkQlFlCIFJl63TPR9JxYni0ko+ATY12
	 3JVV8cyIjyi9Q==
Date: Thu, 04 Apr 2024 02:45:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-ide@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
 Sam Ravnborg <sam@ravnborg.org>, Stephen Boyd <sboyd@kernel.org>, 
 linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Thomas Gleixner <tglx@linutronix.de>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 devicetree@vger.kernel.org, Helge Deller <deller@gmx.de>, 
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
 Anup Patel <apatel@ventanamicro.com>, Maxime Ripard <mripard@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>, Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 David Rientjes <rientjes@google.com>, 
 Azeem Shaikh <azeemshaikh38@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Rich Felker <dalias@libc.org>, 
 linux-fbdev@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-serial@vger.kernel.org, 
 linux-pci@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>, 
 Guo Ren <guoren@kernel.org>, Jacky Huang <ychuang3@nuvoton.com>, 
 linux-clk@vger.kernel.org, David Airlie <airlied@gmail.com>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Herve Codina <herve.codina@bootlin.com>, Vlastimil Babka <vbabka@suse.cz>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Heiko Stuebner <heiko.stuebner@cherry.de>, 
 Baoquan He <bhe@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
In-Reply-To: <8d8dec2d75890f3a14632c9606c332fb11d89a95.1712207606.git.ysato@users.sourceforge.jp>
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <8d8dec2d75890f3a14632c9606c332fb11d89a95.1712207606.git.ysato@users.sourceforge.jp>
Message-Id: <171221675032.1570606.17195739558800384053.robh@kernel.org>
Subject: Re: [RESEND v7 19/37] dt-bindings: interrupt-controller:
 renesas,sh7751-irl-ext: Add json-schema


On Thu, 04 Apr 2024 14:14:30 +0900, Yoshinori Sato wrote:
> Renesas SH7751 external interrupt encoder json-schema.
> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  .../renesas,sh7751-irl-ext.yaml               | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-irl-ext.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-irl-ext.example.dtb: interrupt-controller@a4000000: #interrupt-cells:0:0: 2 was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,sh7751-irl-ext.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/8d8dec2d75890f3a14632c9606c332fb11d89a95.1712207606.git.ysato@users.sourceforge.jp

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


