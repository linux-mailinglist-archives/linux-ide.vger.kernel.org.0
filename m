Return-Path: <linux-ide+bounces-37-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBD97F4667
	for <lists+linux-ide@lfdr.de>; Wed, 22 Nov 2023 13:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 961811C20363
	for <lists+linux-ide@lfdr.de>; Wed, 22 Nov 2023 12:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A703D973
	for <lists+linux-ide@lfdr.de>; Wed, 22 Nov 2023 12:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-ide@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 197701BC;
	Wed, 22 Nov 2023 03:02:42 -0800 (PST)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-35af64a180eso12470775ab.1;
        Wed, 22 Nov 2023 03:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700650961; x=1701255761;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=37b50Ev+C321yHURRCxSYatL1XpG82qMnHWxKFeqz/s=;
        b=V9gg+DWH+UALwDhLexAIu2u3laaZFByY91pxPH2DESRn+hRrvEq9xvaFx2a8+SxsSm
         qiUEjOlp5BiDJj3L31b9YrSYmuhW05Z21uE98a+CGgMwrzvqm37Y9k/05iTaUDmmKimC
         K2dbrGFhdDOald90xhvWBfm1+KAmj4OOd0fmI4wu+1mWAHIVQM1FYoJyw08tqPYhRnc2
         Q9bYsMqjbOD0geWkRhKipqWnkrR6wQRlWHZ02zw0xVysM5pqv1URooNalH3X9WKF/ZG5
         0WQAXRFTfhfqq9X9a8Cm8FqiBLxfM/nBGZGKwkykHK5d2A8NGA8L9BUogxPKBMrfhbug
         gPpw==
X-Gm-Message-State: AOJu0Yz6OQ9RNHz8JWCiQtCKtcMH69wrlaKSk9bmhNSn3sjP25mf89X9
	1HnKnFVEszxDX+LuBo+J+Q==
X-Google-Smtp-Source: AGHT+IH6ogt517iqYk9AZoAU+//31SbIw+1vYBRUiEwIBYneASGtzIQRQL3D6XoUTRBzx+i5pSFJbQ==
X-Received: by 2002:a92:d48f:0:b0:35b:ac:51d3 with SMTP id p15-20020a92d48f000000b0035b00ac51d3mr1730631ilg.0.1700650961322;
        Wed, 22 Nov 2023 03:02:41 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id s16-20020a02cf30000000b0046676167055sm636827jar.129.2023.11.22.03.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 03:02:40 -0800 (PST)
Received: (nullmailer pid 116322 invoked by uid 1000);
	Wed, 22 Nov 2023 11:02:29 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-ide@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20231122-ep93xx-v5-20-d59a76d5df29@maquefel.me>
References: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
 <20231122-ep93xx-v5-20-d59a76d5df29@maquefel.me>
Message-Id: <170065094061.116059.15829335537567838120.robh@kernel.org>
Subject: Re: [PATCH v5 20/39] dt-bindings: ata: Add Cirrus EP93xx
Date: Wed, 22 Nov 2023 04:02:29 -0700


On Wed, 22 Nov 2023 11:59:58 +0300, Nikita Shubin wrote:
> Add YAML bindings for ep93xx SoC PATA.
> 
> Acked-by: Damien Le Moal <dlemoal@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  .../bindings/ata/cirrus,ep9312-pata.yaml           | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231122-ep93xx-v5-20-d59a76d5df29@maquefel.me

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


