Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB57C4E676B
	for <lists+linux-ide@lfdr.de>; Thu, 24 Mar 2022 18:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351779AbiCXRDN (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 24 Mar 2022 13:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350114AbiCXRDM (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 24 Mar 2022 13:03:12 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C0F4B0D12
        for <linux-ide@vger.kernel.org>; Thu, 24 Mar 2022 10:01:40 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id r190-20020a1c2bc7000000b0038a1013241dso2954221wmr.1
        for <linux-ide@vger.kernel.org>; Thu, 24 Mar 2022 10:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=sfxo1dqqTrr7e28OuTBjrwUEPnrevaNVUdgTMF56Ktk=;
        b=HjfDyDjzdYpTKtf+K9duj9ovks/0MilQjmeu4sc0gcd1+fAucxIbN2khy84T+Clb1B
         MLGu7meOsdwLIkFkpFJ33qeZzJZ1Z62/HPBm7/Y32XfjdeCMVikI2lYf0SjUV98u6xkY
         YUEViqk5M/wxF9dhj+YCdBdtUfT0n9kEq7LEcRr6PWQy8B/zxfxNiH45n39aphyhE+Gr
         TgNHzcTVNlAoyazp+nj9ENUwSh1Tm3QeQym4wVQOCx+BQZ1NkiDTES1DZCxkQkazhd67
         0naRC16bhAcNwNiAXPxfcVQTzYPdEHfsKeXqRE+2MzN6aAa4wgM1QhXvXGyqm2Yv7Iej
         Ku+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=sfxo1dqqTrr7e28OuTBjrwUEPnrevaNVUdgTMF56Ktk=;
        b=B7mwNP3dMbvMluoiUsr+XP1Ichu+fShh3tMs/wUmankthY5G8Ba3ITktjUItfFCMDZ
         911D5LfIgbhcVUriG53jyuYcU3VNX/PeBH2MY4VhOReNOaIvNxkHwiNYIL7DgclVUn1U
         s8+191ZVXdqth8XsR5cSZuTjEAyQNg8i9fKM0l+HrP3UGwVcSsc7AlZW7rU2iVbgC+l8
         tUhEV8abZJP51mahHYkeM3Kf+E60Q+Rz37Enxjlig4wyj5M5+u5wvIrjfKZpTLxzoq5G
         bjuK9C8Mtpu9GT1BWgLizYjp6ayLiQs43NHHqoQbSDWWas9twbD9OJzyYqsXlMXsTl2Z
         5nHA==
X-Gm-Message-State: AOAM533MGvpj9g/WDY+TWz2so9hknaQ354xlX2XsbMnyClPoMVVTbO5Y
        55F2/2PH/RIrSkYtSoWArz4=
X-Google-Smtp-Source: ABdhPJwMya3Nj0brtG1kbnLNmV6W42Lr6I1hWboGFAJYhK8i5I6vNN3t10SdAYXwVgykWUJEuoO5OQ==
X-Received: by 2002:a05:600c:3546:b0:38c:a8ff:843b with SMTP id i6-20020a05600c354600b0038ca8ff843bmr5795300wmq.24.1648141299009;
        Thu, 24 Mar 2022 10:01:39 -0700 (PDT)
Received: from [192.168.0.102] ([105.112.209.229])
        by smtp.gmail.com with ESMTPSA id m3-20020a5d64a3000000b00203ed35b0aesm5127018wrp.108.2022.03.24.10.01.30
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Mar 2022 10:01:38 -0700 (PDT)
Message-ID: <623ca3f2.1c69fb81.c0910.4e49@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: meine Spende
To:     wathanafaabbas@gmail.com
From:   wathanafaabbas@gmail.com
Date:   Thu, 24 Mar 2022 10:01:13 -0700
Reply-To: mariaelisabethschaeffler70@gmail.com
X-Spam-Status: No, score=1.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

 Hallo,

 =


Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Gesch=E4ftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen, den Rest von 25% in diesem J=
ahr 2021 an Einzelpersonen zu verschenken. Ich habe beschlossen, Ihnen 1.50=
0.000,00 Euro zu spenden. Wenn Sie an meiner Spende interessiert sind, kont=
aktieren Sie mich f=FCr weitere Informationen.


Sie k=F6nnen auch mehr =FCber mich =FCber den unten stehenden Link lesen

https://en.wikipedia.org/wiki/Maria-Elisabeth_Schaeffler

Sch=F6ne Gr=FC=DFe

Gesch=E4ftsf=FChrer Wipro Limited

Maria Elisabeth Schaeffler

E-Mail: mariaelisabethschaeffler70@gmail.com
