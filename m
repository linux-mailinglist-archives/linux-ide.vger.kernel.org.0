Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28B9F1385F8
	for <lists+linux-ide@lfdr.de>; Sun, 12 Jan 2020 12:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732677AbgALLWC (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 12 Jan 2020 06:22:02 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34492 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732672AbgALLWC (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 12 Jan 2020 06:22:02 -0500
Received: by mail-lf1-f67.google.com with SMTP id l18so4812442lfc.1
        for <linux-ide@vger.kernel.org>; Sun, 12 Jan 2020 03:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=J/hGPBV9O8y1r4I/kNVXxaBjxv5wLfCvrzJ+lyF5gU8=;
        b=YXbrrp5jiT1psd89mFxIh1l3s2A3XepycVbFh/kPLR8Guiy005rNYBb/ebqinuQSjm
         7vJMXLmcuhp1PojpdzEqkKtVe2H8dm7gQKHsUr/E0yDIt1uy2vHRuHCy+mU4mtVLu3/+
         plwmBnqKWERkiXStEkIWVNHyNkGMRGh7hmZh0ABbwsM5T/N9ZtdeDMLne27uzfuRgXKA
         kX8XsC//O5/ujKQLtJMWIJMlAwmyfTYdE4skK3NtnC8tCsCqkeV1d1sRvTen9UuuP5lj
         o8p/9hK7TNgU8Pv1RydZqaJ1vPa1U0hXXH9LrKri8RGKpskOijePWM74RG1uPYCrCjXV
         ayBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J/hGPBV9O8y1r4I/kNVXxaBjxv5wLfCvrzJ+lyF5gU8=;
        b=OJwkyY7erVMSTfyNCY1BzSsl7z52wAUtOuP+JHMF775tpYFCn+4MGYWC62DJ+p4Ivl
         PLV4yjlgYh5tI62Erht4ONKiNDYUPmvCO1k4jOrFIWEkTGbG7TKQDZFR29dtg2xQ1lgO
         3k61KDJiBn3BWiRiZGHs1BSzSJLHkRUKcl1kJ0Df1Dn3RGrbIMuKCAD3Zx2x46KmJx9J
         m0YVlV9z+yCcZuoV9OIrY353UcjMdL+CJZLDRB6KGie0WH3G8n1H4GRtEIVoHc0qUwIY
         5iQH3HzC6fL7E8yxrUR9uafxdh0hnup38gipDG3XyxZW+aK/vVU055CKVgOF0F0uFR2Z
         Osmw==
X-Gm-Message-State: APjAAAXlShYHzHcswmCitumji1qFErPzxYU9ZINlefaQiHEZL1OsJF3O
        eittmRtT8jt+3e8FWLMAmbzcvzZHb+FTxzCC4IuNFg==
X-Google-Smtp-Source: APXvYqxIl+s85PduWiqfAEx7nOiaIevZBLUsVcio0qfitsaWujhuW7W5l0Ud7kTZiN0gAlnZOeOTZrvUgoy15qbK+Hw=
X-Received: by 2002:a19:5513:: with SMTP id n19mr4806877lfe.205.1578828120912;
 Sun, 12 Jan 2020 03:22:00 -0800 (PST)
MIME-Version: 1.0
References: <20191215174509.1847-1-linux@roeck-us.net> <20191215174509.1847-2-linux@roeck-us.net>
 <yq1r211dvck.fsf@oracle.com> <b22a519c-8f26-e731-345f-9deca1b2150e@roeck-us.net>
 <yq1sgkq21ll.fsf@oracle.com> <20200108153341.GB28530@roeck-us.net>
 <38af9fda-9edf-1b54-bd8d-92f712ae4cda@roeck-us.net> <CAEJqkgg_piiAWy4r3VD=KyQ7pi69bZNym2Ws=Tr8SY5wf+Sprg@mail.gmail.com>
In-Reply-To: <CAEJqkgg_piiAWy4r3VD=KyQ7pi69bZNym2Ws=Tr8SY5wf+Sprg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 12 Jan 2020 12:21:49 +0100
Message-ID: <CACRpkdYU7ZDcKp+BbXRCnEFDw1xwDkU_vXsfo-AZNUWGEVknXQ@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: Driver for temperature sensors on SATA drives
To:     Gabriel C <nix.or.die@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Sun, Jan 12, 2020 at 12:18 PM Gabriel C <nix.or.die@gmail.com> wrote:

> What I've noticed however is the nvme temperature low/high values on
> the Sensors X are strange here.
(...)
> Sensor 1:     +27.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)
> Sensor 2:     +29.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)
(...)
> Sensor 1:     +23.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)
> Sensor 2:     +25.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)

That doesn't look strange to me. It seems like reasonable defaults
from the firmware if either it doesn't really log the min/max temperatures
or hasn't been through a cycle of updating these yet. Just set both
to absolute min/max temperatures possible.

Yours,
Linus Walleij
