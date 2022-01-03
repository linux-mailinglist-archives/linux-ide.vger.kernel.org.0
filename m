Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 730D94837DF
	for <lists+linux-ide@lfdr.de>; Mon,  3 Jan 2022 21:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbiACUDi (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 3 Jan 2022 15:03:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiACUDi (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 3 Jan 2022 15:03:38 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD613C061761
        for <linux-ide@vger.kernel.org>; Mon,  3 Jan 2022 12:03:37 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id b186-20020a1c1bc3000000b00345734afe78so410239wmb.0
        for <linux-ide@vger.kernel.org>; Mon, 03 Jan 2022 12:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=g8Z10qgIS0EarfPNyU/0T6kl3UEk/EndXdl7judHSI4=;
        b=VFndRKZs7xkNC4nfOi8W3BMKMVmbZ7b3zehI9mqyQDsN3inH8OAdRGz5Ri/j6PT6pU
         syr984tKEMxRR3zzhCoYs2pbulWkwsPmOeE4xwcG2KG+bJjxRBiPJ8il+uKYe6pvBPYj
         qLCqfL8r+V5hDMjYa9mfgCKa3uM3KDqxQHtLVdnAT0mwGGII4bTxXBCOwwSfNkpliB22
         bwX5TzKpwJZwyMkbMf+qWe/Na5IX5TQDM68WXNKzP4eKM1UkeTYNlOtChxYQ+yTYr3Ub
         BdW4AM8wKvvRNqh5QMvufMMWJcgLYr1jshXYXLnDB1yHvhjNLKNOlaGmhXoWLKzco2Bs
         8fbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=g8Z10qgIS0EarfPNyU/0T6kl3UEk/EndXdl7judHSI4=;
        b=nFRZsEoBKhTArsvYJds+KSs7ie+xcA80aErXspWRn3v4+ax+BIF94hW1kXLa+lgzlK
         8BxWfJgvt/Ael+XlzSh4djaN1W60NEjpa0HZdxC+HUiFWGPgJTb5f6lcMlvM8UDclT1w
         0MauiTYyny/4eLQGpGB2fR2znchfKxEdmf2N7s+K4zbTVxgN9Xe+iGtSZpUgaphq5yyc
         mDJcLKFk2s3rrTGVoTkti/b2w6qOjbbuSz3BHetQS/KIpKXhIZgMNoWnkX3Qfmfd8MBT
         Tt/j1wgL6NWwCM6NNc/LWwU6TI/hW3E2fr7PMrXXUcyAcUgxMMPriLKJyqbw+wzcg9zz
         IUFg==
X-Gm-Message-State: AOAM530MBqkPZTI6XATXc1URyNZlXk8/YOuOlOhtfKmuPGrqGA6lh/AQ
        9kROs9UApvFPJn/YOr8JI7c=
X-Google-Smtp-Source: ABdhPJy4hCL6uXoG58KYzvzAYSBfrWDLT+75/eGlzZenVgdAOEu3rN0k0DbqdXX7Liy3xNN5bOp1Uw==
X-Received: by 2002:a1c:1d17:: with SMTP id d23mr40284634wmd.105.1641240216404;
        Mon, 03 Jan 2022 12:03:36 -0800 (PST)
Received: from [192.168.9.102] ([197.211.59.105])
        by smtp.gmail.com with ESMTPSA id n12sm28557707wmq.30.2022.01.03.12.03.29
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Jan 2022 12:03:36 -0800 (PST)
Message-ID: <61d35698.1c69fb81.c49b5.3682@mx.google.com>
From:   Margaret Leung KO May-yee <muhammadmaryam4256@gmail.com>
X-Google-Original-From: Margaret Leung KO May-yee
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?q?Gesch=C3=A4ftsvorschlag?=
To:     Recipients <Margaret@vger.kernel.org>
Date:   Mon, 03 Jan 2022 21:03:25 +0100
Reply-To: la67737777@gmail.com
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Am Mrs. Margaret Leung I have a business proposal for you reach at: la67737=
777@gmail.com

Margaret Leung
Managing Director of Chong Hing Bank
