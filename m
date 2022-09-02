Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 916225AB318
	for <lists+linux-ide@lfdr.de>; Fri,  2 Sep 2022 16:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235709AbiIBOLe (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 2 Sep 2022 10:11:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238815AbiIBOLO (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 2 Sep 2022 10:11:14 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ADB3155A6C
        for <linux-ide@vger.kernel.org>; Fri,  2 Sep 2022 06:39:16 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id nc14so3959887ejc.4
        for <linux-ide@vger.kernel.org>; Fri, 02 Sep 2022 06:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date;
        bh=aBPI1+a4cEo+fhvLifYLzu5tKP+HxME3xQ4DTDvs7I4=;
        b=i/Qs9nS2wQPbNJe5QIlOiK4PLeHYpWtL+J4BoHTqPlduUTE1TXkUk2BNDW48olHuku
         AHuxVyLQVWYcacjdxbZlsQvqvCp/PMCdjW+RVdj4aQ8QSOzd4k+dQAw6pq1CF9ks+1MV
         n2XRKZzFwZX7tXLmKL0/lMJHbwm1+udwEiLv1uK2S5HecSIq6N6y2lmqHXGlKZYVE+xY
         MB7v4MUQufC3/2PusM0ptj1PVtwII5ln8ccrrrm7i9nTKvD30HOFYjsq6YrMgZydm53s
         jb1mNweDjCldsimYf+1t+Kt4Z39cZRFSgF4hlEOCNCUcn7frLBcE1MDoEfGY5/0KDrdJ
         PdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=aBPI1+a4cEo+fhvLifYLzu5tKP+HxME3xQ4DTDvs7I4=;
        b=QqNTdVU37C0rz/zGOhjbyiBKffcoqDDLG5pqddJWvlpwhjOVrAufHYnBYDOOjZxTKH
         jAP1jSIoSmMqYmaTxZgE3S5syGcyzOGM0dGHUgWGrwdalD52nXn+ibvk+yHlhThSxPIW
         /kPEBho4AtSWj4g28eG1ZAucO1eBDb95tb9MMMdpKomXWkveBqQrUUTAQeU5nRi0zXyO
         pLDXQC/fIj4D/cHGCckYkZIPSVdaxAoGryEIpLL1GPFX2D4XCuIw/D7icllZBBRR+ZIy
         S3a0wQrDRmH/JNIhCwlab7BjOcrJ2CL+95tXK5T+kLyZWZ0hAgFcz3HuNyr0oznyCGiZ
         Zk/w==
X-Gm-Message-State: ACgBeo1dp4qH0yXAToGRcFo5bnZ47jL1b6q60oXtQQ2b7JI1n2Lk7ReT
        yCeYHEoJeJ6bewNhdjGxOfgmWKHf5qD4I15bxvo=
X-Google-Smtp-Source: AA6agR6gsKWgk3ctrKlaqyPGmQ0Ul9XZta0WMGiEqsDmGKy87qHo2rP6RKzBkJpCbksJA/NI8DeahTk/ILBNEifDrh8=
X-Received: by 2002:a17:906:c10:b0:6f4:6c70:b00f with SMTP id
 s16-20020a1709060c1000b006f46c70b00fmr28086616ejf.660.1662125893057; Fri, 02
 Sep 2022 06:38:13 -0700 (PDT)
MIME-Version: 1.0
Sender: omangpatrick6@gmail.com
Received: by 2002:a17:906:2849:b0:741:3d6f:99a0 with HTTP; Fri, 2 Sep 2022
 06:38:12 -0700 (PDT)
From:   Patrick Omang <lisarobertson249@gmail.com>
Date:   Fri, 2 Sep 2022 06:38:12 -0700
X-Google-Sender-Auth: Vf2AoLK1ARqNYDvabfj4UjL5ojk
Message-ID: <CACEAJy6X4D4t7Z1a1Repfs-UOb5k8BsCtDXVf-LUJT7w+z31yA@mail.gmail.com>
Subject: =?UTF-8?Q?Guten_Tag=2C_Sie_haben_eine_Spende_in_H=C3=B6he_von_4=2E800=2E?=
        =?UTF-8?Q?000=2C00_EURO?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=3.2 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

--=20
Guten Tag, ich bin Frau Lisa Robertson, Sie haben eine Spende in H=C3=B6he
von 4.800.000,00 Euro. Ich habe ein Verm=C3=B6gen in der
Power-Ball-Lotterie gewonnen und spende einen Teil davon an zehn
gl=C3=BCckliche Menschen und die Organisation Ten Charity. Ihre E-Mail war
erfolgreich, also kontaktieren Sie mich dringend f=C3=BCr Reklamationen:
lisarobertson249@gmail.com Weitere Informationen senden Sie mir per
E-Mail an: ( lisarobertson249@gmail.com ) f=C3=BCr Anspr=C3=BCche. Gl=C3=BC=
ckwunsch.
Antwort auf Anspr=C3=BCche < lisarobertson249@gmail.com

Hello, I am Mrs. Lisa Robertson, you have a donation
from 4,800,000.00 euros. I have a fortune in the
Won the Power Ball lottery and donate a portion of it to ten
happy people and the organization Ten Charity. your email was
successful, so urgently contact me for complaints:
lisarobertson249@gmail.com For more information email me
Email to: ( lisarobertson249@gmail.com ) for claims. Congratulation.
Response to claims < lisarobertson249@gmail.com
