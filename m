Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A00567E04E
	for <lists+linux-ide@lfdr.de>; Fri, 27 Jan 2023 10:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233185AbjA0Jc4 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 27 Jan 2023 04:32:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233105AbjA0Jcj (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 27 Jan 2023 04:32:39 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FDFF3525B
        for <linux-ide@vger.kernel.org>; Fri, 27 Jan 2023 01:32:30 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id k16so3001541wms.2
        for <linux-ide@vger.kernel.org>; Fri, 27 Jan 2023 01:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bk9rrRbVlBSUREXw1iLQlsEZh4LHFBUluT2+RY/DXog=;
        b=T4ho7Z56EkelNKuLOIS7cADyCVSEQ8LKxCT/HEcCYIM9LjiuPwF5dDpt/48Ki3aOYF
         /X1dONb0m0tFA8HRxbGg/ELLlsV82x274Dsht5yhsCoc0Z1z+XageqYoXhIjIg9dOyZ2
         wmCG2WmL1hQ3eaP7KZima2CGPK1YWOI9aOYcnlqhRaWqcmxI/+BQu4FzDLISdHXsfkkt
         OXuuDN+AK9ozvh9AerLh0LNm14jNUVLcxGDpUiCq+QzWmirbFguu/Fql/MOaCopNqCVk
         Lw1ey9dHYDYMiYGsF7Q2qJlMsrMYV3G23lmLT98Jpf2H+SRM7mYpr1WNPIIiaHar9QuI
         XIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bk9rrRbVlBSUREXw1iLQlsEZh4LHFBUluT2+RY/DXog=;
        b=AL4Nu0PczKQuHOdqIiRX9n3zkRAWr/aoWfmPYFu/oEJq/E0btaXLOcPNTjSVwJ8Cb1
         Cj+Gg7gTLzIYcLALda1A5kbruCm/nn9/cvGWZuu5WB53CksHuteglmAw9XtQAlPLF1sT
         zGpCchdKRsznMbUaQBTBUVtyh7XXDHvmo6Ap+JklLbTGCe2Z4V+LL08koIJbUg8DGdHz
         PDvdyJ9n/AlZQyTM4auHgG4yujyyYFqRkiySxrxAWypL45d1pTX7ULBTgc7aa5gqfnKC
         Zsfju51GrBG89PSn7rZCuO+9xTUsIMpRaI2Rbsvhs1JjxJH8zm5sIgbsqu20zy4Nsr6D
         2dCA==
X-Gm-Message-State: AFqh2krtz60DuirpztB/cnij5kPjrUkqUvb+OJ5xEcJ5YxthSmZfcyZK
        xBGKyGbpLADrFL7MFj1H9gcTrQ==
X-Google-Smtp-Source: AMrXdXuAo2Nkeby8FQaCuLvu5bATGCZjCqz2ulVwr97qbd2CrEuId5snzSLLdj6GWfPdbIO6KKjm1A==
X-Received: by 2002:a05:600c:54d0:b0:3d9:7847:96e2 with SMTP id iw16-20020a05600c54d000b003d9784796e2mr38265609wmb.2.1674811949873;
        Fri, 27 Jan 2023 01:32:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c439300b003cfd4e6400csm3795265wmn.19.2023.01.27.01.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 01:32:29 -0800 (PST)
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
Subject: [PATCH v2 3/3] dt-bindings: serial: restrict possible child node names
Date:   Fri, 27 Jan 2023 10:32:17 +0100
Message-Id: <20230127093217.60818-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

The re-usable serial.yaml schema matches every property with ".*"
pattern, thus any other schema referencing it will not report unknown
(unevaluated) properties.  This hides several wrong properties.  It is
a limitation of dtschema, thus provide a simple workaround: expect
children to be only of few names matching upstream usage (Bluetooth,
GNSS, GPS and MCU).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/serial.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
index e05ad3ac2abc..c9231e501f1f 100644
--- a/Documentation/devicetree/bindings/serial/serial.yaml
+++ b/Documentation/devicetree/bindings/serial/serial.yaml
@@ -96,7 +96,7 @@ then:
     rts-gpios: false
 
 patternProperties:
-  ".*":
+  "^bluetooth|gnss|gps|mcu$":
     if:
       type: object
     then:
-- 
2.34.1

