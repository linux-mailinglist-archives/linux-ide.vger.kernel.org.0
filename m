Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 780D64C52EF
	for <lists+linux-ide@lfdr.de>; Sat, 26 Feb 2022 02:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241175AbiBZBIB (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 25 Feb 2022 20:08:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241365AbiBZBIA (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 25 Feb 2022 20:08:00 -0500
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9187F3EB91
        for <linux-ide@vger.kernel.org>; Fri, 25 Feb 2022 17:07:26 -0800 (PST)
Received: by mail-qt1-x843.google.com with SMTP id bt3so4077091qtb.0
        for <linux-ide@vger.kernel.org>; Fri, 25 Feb 2022 17:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=xLb3TQx9KxuMxtf3xcCBiCwA8sPGsTzld99AYCOXRKI=;
        b=EHV7bmFzUqMpKFa6q+Q18BSQin49PMkoePLVjxDi9W9DX5yGUNzgta2YxXgHFdQzwd
         V0c3yvtGp4RbdrbpUQ92F6+9vEEi0pXS3U7uPdmWp9cf6Lf1sAHgwwwszRlpIF839w8g
         TRx4AQ3YpwQ3IElNNqN0MVuQ1Rvb6ziE/nr2mDp2HRwsze2TMdZuphu77DhmhFQxKVvK
         hHwQYuPRQVqRBxcW6He5Mu5Gti223PWXbzdykWs5Zk0zM8orjJBBGZMacuLh/ggMNc10
         on1TjrfZGkP23dJV2lK/nPz8Jt7xvAj/BL85vkOPfBRk0H1M9XPFyeKMyL9j95GhfJin
         rtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=xLb3TQx9KxuMxtf3xcCBiCwA8sPGsTzld99AYCOXRKI=;
        b=6F/fM0HuUUsLzGaLT95TfWIl7pmODuEX4m0hzEGsQPn4CjbsIKjEvioQCp4uBS0xex
         bOIIgpa3PuUS2v8z/a1OpwRU7oXnGnUl9wSidomq70k0lFIBSPJUYoL2br1dUgkzGi/U
         nPwTXtuIJBbD+wdt1J28UMXktcfNQ2zU9w56m3iPH7CWXfzXS6IMepJuQz8ZNsrPm108
         Lil8GI9by89WbDqDBGtPWXd+mTfPyQa8bXlJmP65UITyTrxB3BM8muSoHlawuuiA9BJd
         WPj6UO6SPbT0RqsGiajxR01nuDviVqnXVcZPTMwPU2x6xcAo2qvdjW/W46Z1t/HNSQP/
         r66A==
X-Gm-Message-State: AOAM531xZqn99U29mIwG3K5s9hptsHUJJO0/1ndfLqMPW91wIds+gwNC
        +t1xUuAlR5cA41GJ9hE+ADIBNk5e3Crp4SR6DDc=
X-Google-Smtp-Source: ABdhPJyJo7e5FQ/jpY4wz1L4vGDctrmcIS+QTf1cMudzSKCZsIecvSid7407FLq/5W/JON2kEQETirvbUjsZi5MOLT8=
X-Received: by 2002:ac8:4d92:0:b0:2d7:fd80:8903 with SMTP id
 a18-20020ac84d92000000b002d7fd808903mr9211435qtw.294.1645837645814; Fri, 25
 Feb 2022 17:07:25 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6214:d62:0:0:0:0 with HTTP; Fri, 25 Feb 2022 17:07:25
 -0800 (PST)
From:   Miss Reacheal <zemegnisse@gmail.com>
Date:   Sat, 26 Feb 2022 01:07:25 +0000
Message-ID: <CANkd_0z-CfjBSdj5C_DB37hwW8wo0b3mzL7azohkz1fJhcTX0w@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hallo,

Sie haben meine vorherige Nachricht erhalten? Ich habe Sie schon
einmal kontaktiert, aber die Nachricht ist fehlgeschlagen, also habe
ich beschlossen, noch einmal zu schreiben. Bitte best=C3=A4tigen Sie, ob
Sie dies erhalten, damit ich fortfahren kann.

warte auf deine Antwort.

Gr=C3=BC=C3=9Fe,
Fr=C3=A4ulein Reachal
