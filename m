Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5264367E049
	for <lists+linux-ide@lfdr.de>; Fri, 27 Jan 2023 10:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233136AbjA0Jcy (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 27 Jan 2023 04:32:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233086AbjA0Jcj (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 27 Jan 2023 04:32:39 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E6E2E832
        for <linux-ide@vger.kernel.org>; Fri, 27 Jan 2023 01:32:29 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so3001948wmq.0
        for <linux-ide@vger.kernel.org>; Fri, 27 Jan 2023 01:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYlyM6cSaKQ/uUkz/YEasKsMqzXxdWTQoyVNRCFZpLU=;
        b=HPbrPcaeE6aOk8pV/mFPNOoURR1ALIlUrtscI7xLlC7PsHF78Ze3s5Lf/T69U7XYfZ
         zPt7E1oCtuEFplHecvHSRt9kaWf13/d4VwAgpLn3w+DwevDheuR0eTeJ2lzhrwSeuTU2
         RgGKqLlEljMqYv+lsdcdnMPRVHzGFZwGNM1RnlVaaCQw9txB0Sajk628xpKABUsdRwep
         8myyh94Jo9wXSuAUhKeNth7mcgszq7zvnidxnAdQnHpnNtTpFL1yTcva/82FCGblWx7m
         vTeUlF7WRaTzcepsjZfhydotPDegyzeQjRAGek9hzDgkvtxhbEkYwam9TbGqnQBKoJPK
         Ivkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYlyM6cSaKQ/uUkz/YEasKsMqzXxdWTQoyVNRCFZpLU=;
        b=jzDBVrmPvBtS4Qd6pfJr8IipVFKqKzTVd+nZnzuSI6P+ITo6UIePkRvf3x7UXeDtMr
         CD8Fawp0Vr6kgDvprEvbhmTb7LJZhjwnhpXY4mTCQF3JFALJn3S7DxgOpXdxVf08QWU1
         7qA4CBjg8sQf9sbidcD8mZ2hM/APcBnTToVWIB8n9KCKsqKJR1kM/ORmuS3RPls1czCe
         0xAwkcAODHMeyqLI50ykHR3ZOBy+xn6tJZpUUVGMcZjNXbXXESrZ9pnwrlx8Nvk3Lpac
         +IRsS1katicaI/xv6dFDx9ephVRkVCdvAtK7qX7WGcw60+mvEhDVSKgkQSs0oWKjhjAj
         48Ng==
X-Gm-Message-State: AFqh2krL1JBYzC8rhlz8KSWDW+laBWaJ1Yc3ffBmbJo/J5GDm8erY5o+
        E6oSzI6L6eXRW5vJa7Q+yj96Iw==
X-Google-Smtp-Source: AMrXdXvU40EM79mlhyImuiNfOn7AB+1l3xFZ9Wdd8ja5wU7h9w454kh126G7hONXVwS785GL9ObqzA==
X-Received: by 2002:a05:600c:3b07:b0:3d1:cdf7:debf with SMTP id m7-20020a05600c3b0700b003d1cdf7debfmr37448422wms.26.1674811948019;
        Fri, 27 Jan 2023 01:32:28 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c439300b003cfd4e6400csm3795265wmn.19.2023.01.27.01.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 01:32:27 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linusw@kernel.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Marek Vasut <marex@denx.de>, Lubomir Rintel <lkundrak@v3.sk>,
        - <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] dt-bindings: reference MC peripheral properties in relevant devices
Date:   Fri, 27 Jan 2023 10:32:16 +0100
Message-Id: <20230127093217.60818-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Several devices can be attached to memory controllers (or memory-mapped
buses), thus they can come with additional controller-specific
properties, e.g. devices wired under Intel IXP4XX bus: cfi-flash,
intel,ixp4xx-compact-flash, NS8250 serial and MAX6369 watchdog.

Referencing Memory Controller or IXP4XX bus peripheral properties fixes
few dtbs_check warnings like:

  intel-ixp42x-gateworks-gw2348.dtb: ide@1,0: Unevaluated properties are not allowed
    ('intel,ixp4xx-eb-ahb-split-transfers', 'intel,ixp4xx-eb-byte-access', ... ' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/ata/intel,ixp4xx-compact-flash.yaml      | 1 +
 Documentation/devicetree/bindings/mtd/mtd-physmap.yaml           | 1 +
 Documentation/devicetree/bindings/serial/8250.yaml               | 1 +
 Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml    | 1 +
 4 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/ata/intel,ixp4xx-compact-flash.yaml b/Documentation/devicetree/bindings/ata/intel,ixp4xx-compact-flash.yaml
index 52e18600ecff..378692010c56 100644
--- a/Documentation/devicetree/bindings/ata/intel,ixp4xx-compact-flash.yaml
+++ b/Documentation/devicetree/bindings/ata/intel,ixp4xx-compact-flash.yaml
@@ -35,6 +35,7 @@ required:
 
 allOf:
   - $ref: pata-common.yaml#
+  - $ref: /schemas/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml#
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
index 5df94953c34e..44cd4476d1d3 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
@@ -15,6 +15,7 @@ description: |
 
 allOf:
   - $ref: "mtd.yaml#"
+  - $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 2d0cac642427..4aeecd0abb68 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: serial.yaml#
+  - $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
   - if:
       anyOf:
         - required:
diff --git a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
index ab9641e845db..38079e1b6a44 100644
--- a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
+++ b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
@@ -8,6 +8,7 @@ title: Maxim 63xx Watchdog Timers
 
 allOf:
   - $ref: "watchdog.yaml#"
+  - $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
 
 maintainers:
   - Marc Zyngier <maz@kernel.org>
-- 
2.34.1

