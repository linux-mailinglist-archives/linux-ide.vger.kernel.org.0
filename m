Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30851566F78
	for <lists+linux-ide@lfdr.de>; Tue,  5 Jul 2022 15:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiGENk6 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 5 Jul 2022 09:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232860AbiGENkl (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 5 Jul 2022 09:40:41 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74ED3A23AC
        for <linux-ide@vger.kernel.org>; Tue,  5 Jul 2022 06:01:50 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id e12so20415513lfr.6
        for <linux-ide@vger.kernel.org>; Tue, 05 Jul 2022 06:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Z4iSxnTq0Lx/bwbqoXAyNmer4bl96DtB3Zb1VFh8QGs=;
        b=lIoO/Q1zsRJMQw+49guyuEHG0aeP+WYtKv3tq+YNGH4ORsHKWEdhZsAviWQJ3/Sxjk
         ckZlj63HBbSYDTcFFpVivE3UWpB3WiNBnnv7BZw9GOWFtss0eoR9/qvOqJZ9korndGQ7
         QpoPeLr4zGvbXumX4us4nP4cHxg9sISMiFMBDEItvcbelSpJIHFm38Evt49W7tgC9hcq
         ec3tVmPOXuUxd1Xfs02+bl7gl/Ytnv2w5w4TDkL7+y+K8kyHwzU2v8On9hwisewQrFLH
         Ix3u3fTM4dHs6ek3+TNmCG31zTey/uujkvE7y38kVaG/rYLH7xDoD2stZA7N4vx+D/79
         m2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=Z4iSxnTq0Lx/bwbqoXAyNmer4bl96DtB3Zb1VFh8QGs=;
        b=uKhvttiWsDiYcWSpt3RciZ1nNXJdUDSKoVDaj/4iNmhmKjDt/S7hZRoMI4jOJlzYYd
         /36pVFshcN/8gpfOXahraqw77OJi7VKWzb6O5qgZ4TRUnqHoWJtBP8Orq2S3FMCrcbMd
         45XcYzio0dzNIUpJ8jUvTUbZkGY8X6KA7LRJOua1FtdqHSbIgpY998IbMzZJvK6BmoXo
         alrsoH9n4YAgU1cGPL7FdtwtleTzpCPErOYdtWyLCrbxpm/q5U3Uh36ndFOU0k2kcl0Q
         PYIfN3PUiJ1u1lGCsIZuBBnwU5kdfhsvbFoZoU/g0ycVqqVaK+vZ3N8X1suEN9e0avXr
         d3BA==
X-Gm-Message-State: AJIora8Hv6iNNy3hUVBzvsCkgsdceCT+QQYEMS7oDT3g8jIW3bpBtozi
        iNngG1eR1EpS/uYfp8E3xzNxqKkyBgEcKcqmInI=
X-Google-Smtp-Source: AGRyM1ulnmfEI/NZdh+WUruPhna3AxAzNobxtbnKsVPfd34IpZpYCDlngimNYuZWKpM3d05c1V3GYGGqh9UB1WX+QAc=
X-Received: by 2002:a05:6512:1104:b0:482:e25b:9e75 with SMTP id
 l4-20020a056512110400b00482e25b9e75mr4087124lfg.298.1657026108440; Tue, 05
 Jul 2022 06:01:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6504:2051:b0:1cf:b3c7:83d5 with HTTP; Tue, 5 Jul 2022
 06:01:47 -0700 (PDT)
Reply-To: azimpemji251@gmail.com
From:   Azim Pemji <simoniyeh5@gmail.com>
Date:   Tue, 5 Jul 2022 14:01:47 +0100
Message-ID: <CADBBFbG_2nqSam1TQPSzoVVYZg8APuZ6N_iADxgXzHUwd9=FEQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

--=20
Die Summe von 450.000 =E2=82=AC wurde Ihnen von Herrn Azim gespendet. Bitte
kontaktieren Sie uns f=C3=BCr weitere Informationen unter
azimpemji251@gmail.com
