Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2915FC13B
	for <lists+linux-ide@lfdr.de>; Wed, 12 Oct 2022 09:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiJLHYq (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 12 Oct 2022 03:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbiJLHYp (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 12 Oct 2022 03:24:45 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85CFF2DFB
        for <linux-ide@vger.kernel.org>; Wed, 12 Oct 2022 00:24:42 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id a67so13907443edf.12
        for <linux-ide@vger.kernel.org>; Wed, 12 Oct 2022 00:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QqX7TWBfdPQVg4fEx1BQ7sbR3W9tFyeiZ5DR5tT6eT8=;
        b=fNjmT+XNAgLdf8CgJrhqLKcmsC2myZL4hIlsXKn83gc8c2MSQpsAI+YIZNIX86lnw+
         BwupRVcHubAN1um2uZSrdXcY3TsGjO11UJVnNK026tzGz2zUrQpXbbNJCRtoILNp5+U2
         ZjaHwprE9dz47eb1x04Drkq7eXbGOYvPj7WEHI45cJtoekQxNveglYomUNqXgM2jDMQB
         AAbKlP8UVozYNQN7fcb4VAmGVPH5vk6Xo0c2vlX02p92k2Fd88O4SIClJm2ntRaMy0Sf
         zD9MVreqhOWGby+BHocppu4YXnCKPQ9G7KbguQ5JLkaLqtb2RTAQ0IHvuDhxsEjsYDE7
         mfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QqX7TWBfdPQVg4fEx1BQ7sbR3W9tFyeiZ5DR5tT6eT8=;
        b=yJakZKrL0bRyzgMOsPb/4KrPObVsePMXdz2VOhRUlKMh+iUOV0NVYBPozE6Gw9zvfU
         Cx7KqLhi8FvU26t6/E3BWPOO6IZ8tqp8iwg4wNR6E/xDCpmZHgiEvnMLqn4DoUdBtj2A
         2ZHKxsp2ETVGYDLcnyZtK5gdN8Uxau+1JPt75Pxc2iRqupfpEVzTQlgESxj6N9NkjOZV
         Oo+jPiWovOmm7yBNyQ4y+XsRGnL7zij9xoJtc2B7eu8C06bkjdd6JPM/NtrX8vZzkA9R
         5GuNggdKjEaYExUYXNqCksYViB0MNp1yfTwLORrzizlKY4FKMTaUwb4j3adg51nFLsKR
         eD3g==
X-Gm-Message-State: ACrzQf0LqsaVjnedb6EOSeJsTz+M6sowphCRmud5yynnmm3+E0jfxSK3
        J79bsDvZqnKAuill/ALJOP0hESt+MCfvlH+V8sjJ6SLwkT6eww==
X-Google-Smtp-Source: AMsMyM4r5g5tiPQtlMYhEp8r2PlEJr8nKPirdj+Q0JtCL1W4mt3CoToyJxY2WG98D9uXUExqxQEWbNq6YFsC4RzH+zE=
X-Received: by 2002:aa7:cb87:0:b0:43b:e650:6036 with SMTP id
 r7-20020aa7cb87000000b0043be6506036mr26286805edt.350.1665559480967; Wed, 12
 Oct 2022 00:24:40 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 12 Oct 2022 12:54:29 +0530
Message-ID: <CA+G9fYvRXkjeO+yDEQxwJ8+GjSmwhZ7XHHAaVWAsxAaSngj5gg@mail.gmail.com>
Subject: TI: X15 the connected SSD is not detected on Linux next 20221006 tag
To:     open list <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-block <linux-block@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, regressions@lists.linux.dev,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>, lkft-triage@lists.linaro.org
Cc:     Niklas Cassel <niklas.cassel@wdc.com>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On TI beagle board x15 the connected SSD is not detected on linux next
20221006 tag.

+ export STORAGE_DEV=/dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190702A00D84
+ STORAGE_DEV=/dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190702A00D84
+ test -n /dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190702A00D84
+ echo y
+ mkfs.ext4 /dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190702A00D84
mke2fs 1.46.5 (30-Dec-2021)
The file /dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190702A00D84 does
not exist and no size was specified.
+ lava-test-raise 'mkfs.ext4
/dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190702A00D84 failed; job
exit'

Test log:
 - https://lkft.validation.linaro.org/scheduler/job/5634743#L2580

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 7da9fed0474b4cd46055dd92d55c42faf32c19ac
  git_describe: next-20221006
  kernel_version: 6.0.0
  kernel-config: https://builds.tuxbuild.com/2FkkkZ51ZYhBL1G8D69YX8Pkt5F/config
  build-url: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/pipelines/659754170
  artifact-location: https://builds.tuxbuild.com/2FkkkZ51ZYhBL1G8D69YX8Pkt5F
  toolchain: gcc-10

--
Linaro LKFT
https://lkft.linaro.org
