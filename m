Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C4B4207E8
	for <lists+linux-ide@lfdr.de>; Mon,  4 Oct 2021 11:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbhJDJMt (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 4 Oct 2021 05:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbhJDJMt (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 4 Oct 2021 05:12:49 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62703C061746
        for <linux-ide@vger.kernel.org>; Mon,  4 Oct 2021 02:11:00 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id 188so18759463vsv.0
        for <linux-ide@vger.kernel.org>; Mon, 04 Oct 2021 02:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=0V4/zeUtWkSBY1eWxCXz0C3Ar1BemsumwGWTm+vRZAU=;
        b=nGbDw0jsZlCW9TxO7nUG7gaZDhy9d3X0hKAqQ8g/86ArgftxCZ5waDYIs78l9YToiX
         KPpNctTnYbS2L8ORyK/SVioDKZk+tiC9u7N6TYpgN4GAyy7h7qWR+sz527vyPZ9B6fL5
         9vuFZyZ7t/jHfoRGEDc7xgdS5pI9yxgcy86GtgN61SSp8ZhYsq/3ZpRDfkw5XMBa+e8m
         31ieoljJiEdYUDFRtv8XOuqRLdJuvMniM2i1hnD1LE65FDC3Ikxjv8huk6iN6lrIBNwq
         iK1vttyjdyBOCwfkzl48VnPMQn9RITFLfMK0WPkRsTND4tzE9Zycd055PYxUSczrVHYC
         w9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=0V4/zeUtWkSBY1eWxCXz0C3Ar1BemsumwGWTm+vRZAU=;
        b=hqUHV1rRqiEaVI47jfT/IdNVCcaAI0a14Ji7FScG9tllPtFZ/5kHXT93grLawKqLSV
         P0aeJYgvcDoRJJI/sGVVkt5apiJ9hbpE3y4C+q1T86fRR+IQt/VYtYu1nT3fdqJYHyaO
         x3owDtfciauq5EfdcOrh7L9vPJ5h40NZ0vfmrNkK5DPVF52gxKmcfaeB+uYsMV6EIU5r
         7u70H+YXSN4sqBOGBhoBJz9CWpVImkAvagGQ0NKcMeTbFUkIytpicuhCaY/6hI0fqpSv
         PAHmYAc4o1kjT1Ug9ypHc2nJwA1GygQdKhFuVI1J7bCfVKGKWurlniU8TafLznYE4I44
         kzpg==
X-Gm-Message-State: AOAM530HAPgKcwZDdMwMplgF2NhSTCBV1j4dDcOk+rBtmlu3Vqh0aMJ3
        XcOiGDdOLCEwa0WM4qjczEGnR/I+brM+bl2Zduw=
X-Google-Smtp-Source: ABdhPJxV1ynqKmLcUeeNetQsmvurrmplUNj649ZxaoZRVUPNhczQDU9wR7LKX8zYvJsxXAOugAv2PBqoUJ/wQZ0k2Rk=
X-Received: by 2002:a05:6102:3c3:: with SMTP id n3mr11623521vsq.19.1633338659543;
 Mon, 04 Oct 2021 02:10:59 -0700 (PDT)
MIME-Version: 1.0
Reply-To: richardmendyy@gmail.com
Sender: matdzong@gmail.com
Received: by 2002:a59:da91:0:b0:235:ea44:ee18 with HTTP; Mon, 4 Oct 2021
 02:10:59 -0700 (PDT)
From:   Richard Mendy <richardmendyy@gmail.com>
Date:   Mon, 4 Oct 2021 09:10:59 +0000
X-Google-Sender-Auth: Iae_oDl8p2YPAkoCrMmSuNn1kbo
Message-ID: <CANLx4tXp0L7zdzwfArRZ-MH_z6M7vGSntWG0dBpccF1Pn16J5A@mail.gmail.com>
Subject: I Need Your Urgent Help
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

I am Mr.Richard, i work as an accountant in a bank. I am contacting
you independently of my investigation in my bank, i discovered an
abandoned sum of $11.6million dollars, the money belongs to one of our
foreign customer who died along with his supposed next of kin since
July 22, 2003. The money has been here in our Bank lying dormant for
19years now without anybody coming for the claim of it. I need your
urgent assistance in transferring the fund into your private bank
account.

I want the bank to release the money to you as the nearest relative
and next of kin to our deceased customer. The banking laws here does
not allow such money to stay more than 21years because the money will
be recalled to the bank treasury account as unclaimed fund. That is
why contacted you for a business deal where this money can be shared
between us in the ratio of 40% for you and 60% for me by indicating
your interest i will send you the full details on how the business
will be executed.
