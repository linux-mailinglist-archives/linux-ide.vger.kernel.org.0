Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2F843C00E
	for <lists+linux-ide@lfdr.de>; Wed, 27 Oct 2021 04:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238078AbhJ0Cjl (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 26 Oct 2021 22:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236182AbhJ0Cjk (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 26 Oct 2021 22:39:40 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD8CC061745
        for <linux-ide@vger.kernel.org>; Tue, 26 Oct 2021 19:37:16 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id w15so1388822ilv.5
        for <linux-ide@vger.kernel.org>; Tue, 26 Oct 2021 19:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:in-reply-to:references:subject:message-id:date:mime-version
         :content-transfer-encoding;
        bh=6o4Jj7d3h3HnMmJFr4RezFW9sdNBU0zeofjveXMsVGU=;
        b=qPLNsPnFXjo1YyOEOkhFWKP3fmJ7VQmjWutKOpHyo66Pbt4vxaSgGFFaa0CYfbMXne
         2eAZri8Eaf8vVwVSAFkYUIIA6tNSi84A+G5ucQSlsIRrBKjgGQzr06++f5Ih7mNE7Xfr
         /FRaAJjhvAVVG3Ap//WX/S++QfKxaXRUC3GUHfhuS/ycsZdMnx2A8Pm2CBmjZH1qeztd
         7Frgk19scfz87xBHggAxWEXDxpEnCL+7/xVllrpXydxi5WoAXPUbZAKsyW8GXFBuO9bQ
         cLsLHgUIE/6tKtMdY7OFL4Ee/AbBcVjjwB4Vm1SJ1hO1kMdzkDu30EMYds/Qc4xaSSXo
         u4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=6o4Jj7d3h3HnMmJFr4RezFW9sdNBU0zeofjveXMsVGU=;
        b=ZY784Wgmi6hbW6Wh++X4YVdIxjIhdZrkq2gW8R6XvzMp5NP/htaLmR3AASpEh2O7p6
         kHccnMSPzOEewWdQScDgDYaoQstQYAIoMMUXmGrbHl8PeiTxCsNPKN0ZlgRhsnw0C88q
         90fxcPE+U+BuKDSFIZCPGzXJ8fJv3ZS4d00OFtTbXk07QcDZozC8YIPC5uVKDaJlmq3V
         +XfNcf1T8is2gNtSiLYSw/FnMQ7Q4Ah0Et2egh9ntdD3H5JCQ6i9cgrFOk1wulezQgVp
         at7tVEnIogYa5MhjOBXdg95ONNjCjX/j9n0IzFt+ayNH2SBcSqhCn1exTp6Vba586zJL
         QkEg==
X-Gm-Message-State: AOAM533RJ3hQypFXSyNAkMcEzIekWVdJnnMbfG2eH74zhOSIzl9pM4DZ
        rZkno/UCR4B6LRJUOCeBYbWe8w==
X-Google-Smtp-Source: ABdhPJywDcUyyeuzFIbTn9qWO1uXrG8erMYGoMp0sn6FkMQj+soeLGrFE9hY7PwGiZWeesPL/7X9eA==
X-Received: by 2002:a05:6e02:16c9:: with SMTP id 9mr511999ilx.166.1635302235543;
        Tue, 26 Oct 2021 19:37:15 -0700 (PDT)
Received: from [127.0.1.1] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id h14sm317124ils.75.2021.10.26.19.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 19:37:15 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     linux-scsi@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
        linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20211027022223.183838-1-damien.lemoal@wdc.com>
References: <20211027022223.183838-1-damien.lemoal@wdc.com>
Subject: Re: (subset) [PATCH v9 0/5] Initial support for multi-actuator HDDs
Message-Id: <163530223418.276156.7177973323512699858.b4-ty@kernel.dk>
Date:   Tue, 26 Oct 2021 20:37:14 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Wed, 27 Oct 2021 11:22:18 +0900, Damien Le Moal wrote:
> From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> 
> Single LUN multi-actuator hard-disks are cappable to seek and execute
> multiple commands in parallel. This capability is exposed to the host
> using the Concurrent Positioning Ranges VPD page (SCSI) and Log (ATA).
> Each positioning range describes the contiguous set of LBAs that an
> actuator serves.
> 
> [...]

Applied, thanks!

[1/5] block: Add independent access ranges support
      commit: a2247f19ee1c5ad75ef095cdfb909a3244b88aa8

Best regards,
-- 
Jens Axboe


