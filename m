Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5201C6A680D
	for <lists+linux-ide@lfdr.de>; Wed,  1 Mar 2023 08:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjCAHVR (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 1 Mar 2023 02:21:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbjCAHVR (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 1 Mar 2023 02:21:17 -0500
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F3A366A0
        for <linux-ide@vger.kernel.org>; Tue, 28 Feb 2023 23:21:16 -0800 (PST)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-1722c48a773so13547911fac.2
        for <linux-ide@vger.kernel.org>; Tue, 28 Feb 2023 23:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677655275;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=huVRBaBa1UsBmB4k/zxht1N9AGT1Vl1CB7EEZBcTDjM=;
        b=J9ORiupCBW2uZtllW5+ajSCTaABYzce6FxhwJmvQaTWzqu/9fJUqXtL4Cph0Xd+NW0
         CKcmBF1lI2h+tJsLUobyAW1IG6FUgUOCbE7Iw7Q8ERh3DON3HbYgRbeya98+5dofBli4
         S9cDSEBOVGu/Q4Ww1ND6cYgFg/9ZFUx8bDshfOx1oAQOxaKZ/nlCqu4KIToTyr6B/Fz3
         FmLFtHOm9aXtqB7FWrx46VEPSGkzqYPpcMn7I5tLlPzLw+1Td0VIepbxnJhhZN4M2xo/
         EGKvQODUpN4MW8+9I/xzNgGSj8plrC6zI6EyfJ7b2w8Fkisl39urfE20hwXe8RfwusR+
         wQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677655275;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=huVRBaBa1UsBmB4k/zxht1N9AGT1Vl1CB7EEZBcTDjM=;
        b=vqqGebF7VkCLhtYcJRNd8YmtPifmP8441RRSDiKNBloAHv3mJ2hGvSsVpmqgYNyA5U
         /PeJkckMOa/BdjWP90b9uAx3s25Pe9pmOr5YlyYkPwYA2r95f/CJN+dUTYm7H118Tbta
         T5/X44EvDB0NHEd7UBKE9VefCg+W4MYPWvqpzE2JkiQuQN5S3D+2dpuYaMoRFfhiSShy
         MBrzbvyn5GQa82mTrWpJX853K6G95ymso0GFEXJxwREGAONgcpA9GyEOsJeYjzTXq7bc
         1iSEx3PxoFE42grRmNRnisxAK01b+Mdrk2WxGF9OCHNkV7BkNPL26psckoOkGqmH0LMN
         sATA==
X-Gm-Message-State: AO0yUKXc6rITQxVPe3BMIJ3vBm3GeqimkWBvZAm/RT8a+1AfF+vcVeX4
        tPZL4Q5YxvnJvgbxSseUe7+LyZPqEx+QhQ7C8Bk=
X-Google-Smtp-Source: AK7set+w9RGOC35AqEyYgyTAYEJVj0Ay8IFOj33z91STq0mryPNDul5nXk1zwIwSWf9vohv4GpSV7Yt0md0wsrxxFQQ=
X-Received: by 2002:a05:6871:6b9a:b0:171:8fdf:13fd with SMTP id
 zh26-20020a0568716b9a00b001718fdf13fdmr1598753oab.1.1677655275525; Tue, 28
 Feb 2023 23:21:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6850:e005:b0:45a:934f:e5ba with HTTP; Tue, 28 Feb 2023
 23:21:15 -0800 (PST)
Reply-To: georgebrown0004@gmail.com
From:   george brown <gh239444@gmail.com>
Date:   Wed, 1 Mar 2023 08:21:15 +0100
Message-ID: <CANTrA0ttKHWU9FS=w7KE+BTc4w=WaHZRY-s4yExQtUed4dsY3A@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

16nXnNeV150NCg0K16nXnteZINeSJ9eV16jXkicg15HXqNeQ15XXnyDXkNeg15kg16LXldeo15og
15PXmdefINeR157Xp9em15XXoteZLiDXkNeg15kg16jXldem15Qg15zXlNem15nXoiDXnNeaDQrX
lNen16jXldeRINec15zXp9eV15cg16nXnNeZLiDXkNeq15Qg16rXmdeo16kg15DXqiDXlNeh15vX
ldedINep15wgKDguNSDXnteZ15zXmdeV158g15PXldec16gpDQrXk9eV15zXqNeZ150g16nXlNec
16fXldeXINep15zXmSDXlNep15DXmdeoINeR15HXoNenINec16TXoNeZINee15XXqteVLg0KDQrX
lNec16fXldeXINep15zXmSDXlNeV15Ag15DXlteo15cg15HXnteT15nXoNeq15og16nXnteqINeR
16rXkNeV16DXqiDXk9eo15vXmdedINei150g15DXqdeq15UNCteV15HXnyDXmdeX15nXky4g15DX
oNeZINeQ15TXmdeUINeW15vXkNeZINei150gNTAlINee16HXmiDXlNen16jXnyDXldeQ15nXnNeV
IDUwJSDXmdeU15nXlQ0K15zXlNeZ15XXqiDXkdep15HXmdec15ouDQrXkNeg15Ag16bXldeoINen
16nXqCDXotedINeU15PXldeQItecINeU16TXqNeY15kg16nXnNeZINeb15DXnyDXnNek16jXmNeZ
150g16DXldeh16TXmdedOiBnZW9yZ2Vicm93bjAwMDRAZ21haWwuY29tDQoNCteo15Eg16rXldeT
15XXqiDXnteo15DXqSwNCtee16gg15In15XXqNeSJyDXkdeo15DXldefLA0K
