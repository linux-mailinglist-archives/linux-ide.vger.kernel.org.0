Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74E4B221AB
	for <lists+linux-ide@lfdr.de>; Sat, 18 May 2019 07:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbfERFLP (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 18 May 2019 01:11:15 -0400
Received: from mail-lj1-f173.google.com ([209.85.208.173]:42026 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfERFLP (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 18 May 2019 01:11:15 -0400
Received: by mail-lj1-f173.google.com with SMTP id 188so7987226ljf.9
        for <linux-ide@vger.kernel.org>; Fri, 17 May 2019 22:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=N4x0KlBCOPphZofINc2cd2bDNqZj8Wp5OhDsnQXLXoo=;
        b=H1KzDFlXAIzEYo3Yxsm9hLVT3Og3Yk3ZBuvVigb6tfCXQYmvds3xpQcZ6q252wNN2Y
         0F/O2SViJw3otHtIuIWt6Rhvv9ApiEHauMndZRWAMxl1Igk2gL+Q3qGqolfe4YhtxLqi
         oifEJDmrbT12DeUe+SOwwKSn8Gttla6rIyl/GW4pS1+744fl38pNw+KfCZK+HSP3cnQW
         SPSQ6sPThgy/XUca6ftm1+kWA5b8D6oQOl4fzhjAD/7MS0h74Wpuwj7Zg9Ujx4YpdN0Z
         lHyqn957bZVfjMY0Dlt8zmiYHR8HgE4ym/3c2WxVUeMAAA46SfraB8VPXiysDXbxmqBd
         6qmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=N4x0KlBCOPphZofINc2cd2bDNqZj8Wp5OhDsnQXLXoo=;
        b=NE7mgaTKO3tgut/4DrK3JuhYz9w8uc6yc1lxVfdpzpoMM7UYLD/yNQsZO7Sed6sbRo
         OIyMh5tMLaBEEYgDD2f9UWC1lrpTMbw9WBRQGJ2v08Zj1AAkCNNGledTSlnouYdKHAzG
         W+azO2FYZtOjZbm2cfdHTgId1d8tp9be1vPWpXBTUXcWFc2/C7jWwZ2MUM/hmXTZGKp5
         mUM5Fm6kp8jfxwAG9g84Sdc3nWcmWgNFDO4laxxWV8NTw/XZ5MuPPpj2JF3JrXQp9sMs
         hKIXcxsRuOIlejt+VUdGPNJbl8LU7VSwS2nWJy3CTBQ0rlWlqjMiJBs4a4mbklBLRiON
         pLAg==
X-Gm-Message-State: APjAAAUrSu4AlzTeR716N3xMqI+Qcz3v6n/vtrIR0YVzcpvl5rNLR3W3
        FDL9H/EbFbsxXHcLsBZxzz9VzuIt
X-Google-Smtp-Source: APXvYqzJFLpRcQYvkrJWYIPGJ6VeG8VS222Mgv00eL5z2uCBl1qBbEjGhq7spYB/SsLiHzy/dsCCYg==
X-Received: by 2002:a2e:9692:: with SMTP id q18mr29050677lji.89.1558156273252;
        Fri, 17 May 2019 22:11:13 -0700 (PDT)
Received: from [192.168.0.94] (31-178-116-31.dynamic.chello.pl. [31.178.116.31])
        by smtp.googlemail.com with ESMTPSA id d2sm974187ljc.84.2019.05.17.22.11.12
        for <linux-ide@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 22:11:12 -0700 (PDT)
To:     linux-ide@vger.kernel.org
From:   =?UTF-8?Q?Micha=c5=82_Wadowski?= <wadosm@gmail.com>
Subject: Linux 4.15 and onwards fails to initialize some hard drives
Message-ID: <235abe94-2c9a-7fd8-0a3e-b813bed50a9f@gmail.com>
Date:   Sat, 18 May 2019 07:11:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: pl-PL
Content-Transfer-Encoding: 8bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi there,

I created patch to fix the regression, that Linux 4.15-rc4 (commit
a83cb7e6ada140f8b932c223511f1063c4150870) was break my drive working.

I have two sata drives, one SSD and second HDD. Until Linux 4.15-rc4 my
second HDD was working fine, but I had to manually reset drive (in
booting scripts) several times to establish connection. I thought it was
a hardware problem, but it was just working.

Since Linux 4.15-rc4, my second HDD doesn't working any more. I was
investigate this issue and find out what was happend. I created patch
to solve the regression. By the way, I fixed a weird behavior, the need
to restart drive to establish connection.

Before this patch, HDD drive was always working with 1.5Gbps. After
this, HDD is connected with 3Gbps and no manually restart is needed.

Best regards,

Michał Wadowski
