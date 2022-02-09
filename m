Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6F6A4AFBE7
	for <lists+linux-ide@lfdr.de>; Wed,  9 Feb 2022 19:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240849AbiBISvz (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 9 Feb 2022 13:51:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241163AbiBISuw (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 9 Feb 2022 13:50:52 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227A7C004582
        for <linux-ide@vger.kernel.org>; Wed,  9 Feb 2022 10:45:59 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id h6so5607365wrb.9
        for <linux-ide@vger.kernel.org>; Wed, 09 Feb 2022 10:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=WwV9i83hTOoSW63e4AGIE+PjEYBZlZU9PGy3pEkJj6E=;
        b=h/sqRXzUjHRFiPNUxyXipxyx+EXjEjP1yPgy7t5klh7dWzcG2IOP06zCO5ez9kFRPm
         gYGofCmJT86ljA759dPnSV2dOUKgl6+ZXmrGuVMpM+9lvHtvZakOCFM9Oen/DWxJimZQ
         YfduCbRHd69Nu1GmFcrX8JP7Kb4HiVUywCwSkgdy5TM4g3HgKi+O3ynlIAMxWa/ok8Ue
         VytzlZOdtBe88Zlo9hd8qILbDsU5BWAYefP+lfFxg6QJbemj0Da2NKNIgdz7Kni9k5qo
         nRE6cmQXciPJzOxD4kSpFhYe4uclRE6bgcsQaRQ0iZb+deYn6uCIwAb4bRpZknHyzRWY
         tnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=WwV9i83hTOoSW63e4AGIE+PjEYBZlZU9PGy3pEkJj6E=;
        b=ZqBh+v0Fcm0UXuJ2hy0lu/i0ZvKT9IbuXE7ANR9O2GfG8KX5j9Yam0NKOORYAZONqK
         b3ZoZqNIHyPwtbVAOLxSwGNx8rIb4mspEJ/naP9X6u8y8IJ9baKIEBXpCde7HcnMaUu5
         ir196XHD/Iu7GrRSYWY52g/3dnamRZ/0fRFaawqgVUc1xK+2anCwQtBTmmSqrcL2TpCQ
         8OUV0lyYMX+6y1oJjmOD4bWZa9I+o96yPqHFQRLQwmEOl2+xYye230xFMjYfvX1rAsQk
         qPD+vLK0mBoGS+/QV9Q9r0zFxqwcWVgGvwugIPXsys5tWItckoyZGkxAFGPhbKsV7swu
         f/mw==
X-Gm-Message-State: AOAM531zSSOzLRRWAa4jAUb99aEqh+wDc/mKYfDU/FfIIWpEcjacSKEW
        ACwacn6ARumsbtk/bL0B5bOZx4eOL3rknRCQTWk=
X-Google-Smtp-Source: ABdhPJzWhKYXv2MlK/AwEeNw19aHBLyyyxgoUoMFFZkSLa4sCdZ5T9b0m9GdTYIs9pF3tHTI2aUad+QzTXcO27yYWmQ=
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr3241245wrd.487.1644432357673;
 Wed, 09 Feb 2022 10:45:57 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a5d:59ae:0:0:0:0:0 with HTTP; Wed, 9 Feb 2022 10:45:57 -0800 (PST)
Reply-To: borowskishirley@gmail.com
From:   Borowski Shirley <ibitoyebami@gmail.com>
Date:   Wed, 9 Feb 2022 19:45:57 +0100
Message-ID: <CAOk47ijUts_JnDUsZ-6u_fOu2+TJNzCCNDz5eYCa8cFWSiBcFg@mail.gmail.com>
Subject: reply
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi,
Please get back to me urgently ,

Mr.Borowski Shirley.
borowskishirley@gmail.com
