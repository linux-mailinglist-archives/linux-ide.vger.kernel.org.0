Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7473E015D
	for <lists+linux-ide@lfdr.de>; Wed,  4 Aug 2021 14:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238173AbhHDMop (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 4 Aug 2021 08:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236990AbhHDMoo (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 4 Aug 2021 08:44:44 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DA5C061798
        for <linux-ide@vger.kernel.org>; Wed,  4 Aug 2021 05:44:31 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id c24so894434lfi.11
        for <linux-ide@vger.kernel.org>; Wed, 04 Aug 2021 05:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=KThPZotl2MnbNHnYwN0Cur48hqa8t2fsEOoHY+/KM0c=;
        b=Gocdf1yXuPX8xeoaYI9oLI1JhocaQp6ZZyVcTlOJdDZI2/0vnch4E5lQGPm3MxwdUM
         giqLR8+3StPTSF4eaI9QxPRAYgsQPOy3Sgy1vk6QHMGur8WgKk9JiwpBE7Q7NqhIFwt9
         YVZHv5lFDRw148Wb0r8UWWKNpLe8xrYAqQDWLQuAbt5MPsHwKIZ92D+P+/WX5P4zRRJR
         snno7CnnmIaYZRGMeNve6R+RMLZT4vIseAntmNcFNMogNI0duS3C7Rhms//adcYhnZ1B
         JgYUmWHHnqKvaZCBz8Vai7whhh0nzb9P1JFctB31mbxCa5/w7d9XJZYYIGYyiaufHl03
         +5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=KThPZotl2MnbNHnYwN0Cur48hqa8t2fsEOoHY+/KM0c=;
        b=RoZCT5O+NWFJ8bAsjAyFSpWY8XiHmbeDqW6cyg0jkcnfmRDj6GDO1IJOUV6hObmeSd
         aNUDIWIKtqXRZAkM1AOPdfjJSDRyN0FGS6x2APmV8EAlXGZzdoqAvP6/oi10q+qN/W6F
         eGTIylZbXEY/qhtrXJNiy2937Ah51NAGl3RAMV7zqKbea2ccjNgz/MMCJpOvj852a4RA
         xj/vr4DDYZ1mNUB+RHQHSGEnO0SVOfDd0Yt3+BSQXP28ZatZX0wDBRA3rVtkeaMfDIBd
         6QUuyXP7F/t0c1Ux3cNOpLFpuPJ1HbGVRj/rN3ojq6zJfk603FjDcMbJti459EQUuNgI
         wUIg==
X-Gm-Message-State: AOAM531XJOG+Ky39xnm4tF69g9PuZNZHPmZgV31zXdOPAJTdQGRDmzHf
        0d5bklJ+foy0HafnFu9cyr0W5xx/CmdD1kik9ghY9A==
X-Google-Smtp-Source: ABdhPJyDDyEf+9rLZyk+tYny9g+7KdGyN7lm64G/9thaqibRNfBCYr9r5bZvfT70hWlzM4bj90OnDOt9H++74lx9/Q4=
X-Received: by 2002:ac2:4d0f:: with SMTP id r15mr12222472lfi.649.1628081069590;
 Wed, 04 Aug 2021 05:44:29 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 Aug 2021 14:44:18 +0200
Message-ID: <CACRpkdZaCosXsgp02nuUbd_nEvdxm5-z0+d0oSA97UTWQ0RQQg@mail.gmail.com>
Subject: [GIT PULL] IXP4xx driver updates for v5.15
To:     SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Jens Axboe <axboe@kernel.dk>,
        Guenter Roeck <linux@roeck-us.net>,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi SoC maintainers,

this is a set of combined driver updates for IXP4xx targeted for the
v5.15 merge window.

I am sending it to the SoC tree because of the cross-subsystem
dependencies and since the corresponding DTS changes goes
into SoC. These will be sent separately.

Note the following:

All new DT bindings in this patch set are ACKed by bindings
maintainer Rob Herring.

The new expansion bus driver goes in through the SoC tree as is
custom for bus drivers.

The watchdog maintainer has ACKed the watchdog patch, which
also briefly affects the timer driver.

The PATA changes also have some mach dependencies.
I have informed the libata maintainer that I intend to take these
through ARM SoC.
https://lore.kernel.org/linux-ide/CACRpkdbf9TfFyObuqCzOEe_QrS=Gru8i6x-1P7v_N-a11g_iiA@mail.gmail.com/

Please pull it in!

Yours,
Linus Walleij

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ixp4xx-drivers-arm-soc-v5.15-1

for you to fetch changes up to 47adef20e67d657696c953f4b8023017c6005c1b:

  pata: ixp4xx: Rewrite to use device tree (2021-08-04 12:20:44 +0200)

----------------------------------------------------------------
IXP4xx driver updates for modernizing the IXP4xx platforms,
taregeted for v5.15:

- Add DT bindings to the expansion bus and PATA libata driver.

- Add a new expansion bus driver.

- Rewrite the watchdog driver to use the watchdog core and
  spawn from the timer (clocksource) driver.

- Refactor the PATA/libata driver to probe from the device
  tree and use the expansion bus driver to manipulate chip
  select timings directly.

----------------------------------------------------------------
Linus Walleij (8):
      bus: ixp4xx: Add DT bindings for the IXP4xx expansion bus
      bus: ixp4xx: Add a driver for IXP4xx expansion bus
      watchdog: ixp4xx: Rewrite driver to use core
      pata: ixp4xx: Use local dev variable
      pata: ixp4xx: Use IS_ENABLED() to determine endianness
      pata: ixp4xx: Refer to cmd and ctl rather than csN
      pata: ixp4xx: Add DT bindings
      pata: ixp4xx: Rewrite to use device tree

 .../bindings/ata/intel,ixp4xx-compact-flash.yaml   |  61 +++
 .../bus/intel,ixp4xx-expansion-bus-controller.yaml | 168 ++++++++
 MAINTAINERS                                        |   2 +
 drivers/ata/pata_ixp4xx_cf.c                       | 264 +++++++++----
 drivers/bus/Kconfig                                |  11 +
 drivers/bus/Makefile                               |   1 +
 drivers/bus/intel-ixp4xx-eb.c                      | 429 +++++++++++++++++++++
 drivers/clocksource/timer-ixp4xx.c                 |  48 ++-
 drivers/watchdog/Kconfig                           |   1 +
 drivers/watchdog/ixp4xx_wdt.c                      | 283 ++++++--------
 include/linux/platform_data/pata_ixp4xx_cf.h       |   4 +-
 11 files changed, 1014 insertions(+), 258 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/ata/intel,ixp4xx-compact-flash.yaml
 create mode 100644
Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml
 create mode 100644 drivers/bus/intel-ixp4xx-eb.c
