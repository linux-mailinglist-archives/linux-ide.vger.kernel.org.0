Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7D1616CEA
	for <lists+linux-ide@lfdr.de>; Tue,  7 May 2019 23:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbfEGVOL (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 7 May 2019 17:14:11 -0400
Received: from mail-pl1-f176.google.com ([209.85.214.176]:43512 "EHLO
        mail-pl1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbfEGVOL (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 7 May 2019 17:14:11 -0400
Received: by mail-pl1-f176.google.com with SMTP id n8so8784944plp.10
        for <linux-ide@vger.kernel.org>; Tue, 07 May 2019 14:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=yikYcsbjv3+1vnWpxa5x65vj0Xb8LvkojUCmJN41kek=;
        b=i9dzkV6ITgncLvea/GfKoySToOnfh0EmZqk6sk9hEwnnyg5AjrH+d0O1CfjblMHYF9
         GB4bkvKBEPfx97Hb9OA1WQjAnQphQEuVBiAaZHkD0K6ffKuno9Y0WvRu7HLSqVDUhOyn
         5fvK+gLbaBYWJnSTa8/hRzE6L/yBmfpPURFinTy9d2qRBM1j5H75TJ3P9YbRT/EEFxY+
         sA5sT9lNFEZtvz5L7MdLrjVMFOR6dVV2Fu9sAWVqZK51707QBjRakDquAxUU1Wog4qBm
         uLUlPyaGhe6Mp7LpvT84i3lnKqiSNMzJnMD+ozmIcNsHTqkiqCHz81zj24eqc6xUDtgk
         DCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=yikYcsbjv3+1vnWpxa5x65vj0Xb8LvkojUCmJN41kek=;
        b=mw/02T9TAwSkiJqpAyekAysT75211vvgQyYJDyWm12Rf5gfd/Kuiv1Ula2hzAVU4v5
         cwcZGyCIcSRAudLh5CS4ZK3uma8JHaCNT/shF7vNPZl60+WrLoSe+ve9Zr4oOgBxUKR9
         EkKCuBc1Wvb36BEZgQ1gm89/pcwxyjPZmowwHTKBWQJd6UKPQ9DniK+3IvYhHJIOfiUk
         t6uNxvEsZ5hMSCc+qeqt4WrXWsJTC86I+Qo6M/Ks9I7ceKwe6WOmLuyiiTvuF1TkFCMy
         /s9nONftXZzwQCR3ea8XO+XzWzPyV6CZrQaIMRrRjzrz6/AOy3qreU+nA9JsUSodnnrm
         AapA==
X-Gm-Message-State: APjAAAX/6yaDXqi1JEwHU/uwbguGTCfYeC6/4jhSld4BINUJSKZJruKH
        TLFXbRVNj0p21O52tcSXWI8mJCYnvs1UEw==
X-Google-Smtp-Source: APXvYqyKa3OGJm0mt4FJiRfUIDtXgB6xkFB4w4gdfariy4WWccg+r+Usu0hEkwbmHme7HtthCcKNKA==
X-Received: by 2002:a17:902:ea:: with SMTP id a97mr36062333pla.158.1557263650572;
        Tue, 07 May 2019 14:14:10 -0700 (PDT)
Received: from [192.168.1.121] (66.29.164.166.static.utbb.net. [66.29.164.166])
        by smtp.gmail.com with ESMTPSA id q14sm6814758pgg.10.2019.05.07.14.14.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 14:14:09 -0700 (PDT)
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     IDE/ATA development list <linux-ide@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
From:   Jens Axboe <axboe@kernel.dk>
Subject: [GIT PULL] libata changes for 5.2-rc
Message-ID: <4d9198b4-5b07-d63f-67f5-e34666b3b73a@kernel.dk>
Date:   Tue, 7 May 2019 15:14:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi Linus,

Just two minor fixes queued up for 5.2, adding support for two different
platforms to ahci.

Please pull!


  git://git.kernel.dk/linux-block.git tags/for-5.2/libata-20190507


----------------------------------------------------------------
Peng Ma (2):
      ahci: qoriq: add lx2160 platforms support
      ahci: qoriq: add ls1028a platforms support

 drivers/ata/ahci_qoriq.c | 55 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 17 deletions(-)

-- 
Jens Axboe

