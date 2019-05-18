Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D58EE221BC
	for <lists+linux-ide@lfdr.de>; Sat, 18 May 2019 07:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbfERFpz (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 18 May 2019 01:45:55 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42783 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbfERFpy (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 18 May 2019 01:45:54 -0400
Received: by mail-lj1-f194.google.com with SMTP id 188so8022275ljf.9
        for <linux-ide@vger.kernel.org>; Fri, 17 May 2019 22:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J9r5a9oeFzDjxeIO91Hm1nVvX/skKoAWJVlxqU4Sf7k=;
        b=ia8K85SOx+JythZAchUNSC7Zkcwi46z+UXxWOgDhfbZ0tyXDgmbCS2fE+rE54M9kgR
         XzEOw1M4p+2NA/67TMQi9/D5xWeGfEbytbyXfyHHmrzBSRqt7ZBQTzTPA66uZy+cDOpw
         GwlN8u3v8hT+35SF6+5gXZqpJGoJbYUWxEKgIu183N26CZiWB/MebauhmjZOLyu7XWE5
         gt3IXZ5zp/AXklYdvyCsEf5pAY7N+fW7hRS4VjmuDYa/zSsMCw0wDRyfvZXF4IZF5lot
         p7gXHlAOiAcm3x40/0RRhGHz2XiJjF4pkXVtQiuWUoTvaV4tmzpZclLjMfrXxN22iULX
         U8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J9r5a9oeFzDjxeIO91Hm1nVvX/skKoAWJVlxqU4Sf7k=;
        b=E88dnbZdsjhcA4MrZvMOG3ENs+wU5wQvsII1gJwHCsSkmsdSlvoxOfPydJOn6Ql+aF
         ScWPWyHT4J3BbcNLkOLEXyRr8f4FQYgowHTnA5Ac8WdTe7Ad1+O/cGwRUW5GBSWi/V0P
         SEv3kFYplOf6THexCXvRyqOz29jjHvE/V8jXISeqRD3zSY1Vdgw+CrB7BUVhdvHB1dy6
         jLIktPjLOX9Hlyjt5enmpQowRc6vNVziL9caX58PqeIG2/ZWD/63BH+dk6r84uwgaWPm
         BUHe91+NPzc1CRTiTQbe/ncZOLNE6ukfRsuJhcOiNz6C5TgTSr0G+A+0FaGbP4FUJFLc
         OH/Q==
X-Gm-Message-State: APjAAAXpLWM1r26ENsE0XoCx7UeYIrVuiwo+QcCj0x9YYI8mjanXP3nz
        Di6ZcAfGUj2deve6vxKBaOynHOxtUrA=
X-Google-Smtp-Source: APXvYqyJiYeuqNELy/zPRHzrYQaveHoijJMfCtun6zxiGLg176nXVGZlsFZ5iRGCesDTBsPCxNsO2Q==
X-Received: by 2002:a2e:9d85:: with SMTP id c5mr25378596ljj.183.1558158352853;
        Fri, 17 May 2019 22:45:52 -0700 (PDT)
Received: from [192.168.0.94] (31-178-116-31.dynamic.chello.pl. [31.178.116.31])
        by smtp.googlemail.com with ESMTPSA id m18sm2257478lfj.91.2019.05.17.22.45.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 22:45:51 -0700 (PDT)
Subject: Re: Linux 4.15 and onwards fails to initialize some hard drives
To:     linux-ide@vger.kernel.org
References: <S1727300AbfEQXhy/20190517233755Z+6@vger.kernel.org>
Cc:     wadosm@gmail.com
From:   =?UTF-8?Q?Micha=c5=82_Wadowski?= <wadosm@gmail.com>
Message-ID: <5abd2a85-7cd9-f408-374f-55d9cd72f2f6@gmail.com>
Date:   Sat, 18 May 2019 07:45:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <S1727300AbfEQXhy/20190517233755Z+6@vger.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: pl-PL
Content-Transfer-Encoding: 8bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

In some cases if sata drive can't work with default controller
bandwidth, driver fails to initialize the device.

libata-core: sata_link_hardreset - if after reset the device is
offline, then driver should try again, with lower SPD.

sata_down_spd_limit - function should handle corner case values,
if device is not initialized yet.

Bugzilla: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1783906

Signed-off-by: Michał Wadowski <wadosm@gmail.com>
---
 drivers/ata/libata-core.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index adf28788cab5..c0b4c378ae14 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -3061,6 +3061,7 @@ int sata_down_spd_limit(struct ata_link *link, u32 spd_limit)
 
 	/* If SCR can be read, use it to determine the current SPD.
 	 * If not, use cached value in link->sata_spd.
+	 * Value of link->sata_spd may be 0.
 	 */
 	rc = sata_scr_read(link, SCR_STATUS, &sstatus);
 	if (rc == 0 && ata_sstatus_online(sstatus))
@@ -3072,23 +3073,22 @@ int sata_down_spd_limit(struct ata_link *link, u32 spd_limit)
 	if (mask <= 1)
 		return -EINVAL;
 
+	/* sata_spd_limit may by initially INT_MAX, that is not correct
+	 * value to working with. Cut down mask to highest correct value.
+	 */
+	mask &= 0x7;
+
 	/* unconditionally mask off the highest bit */
 	bit = fls(mask) - 1;
 	mask &= ~(1 << bit);
 
 	/*
-	 * Mask off all speeds higher than or equal to the current one.  At
-	 * this point, if current SPD is not available and we previously
-	 * recorded the link speed from SStatus, the driver has already
-	 * masked off the highest bit so mask should already be 1 or 0.
-	 * Otherwise, we should not force 1.5Gbps on a link where we have
-	 * not previously recorded speed from SStatus.  Just return in this
-	 * case.
+	 * Mask off all speeds higher than or equal to the current one.
+	 * If device is not initialized yet, value of SPD is 0, so
+	 * we should ignore this.
 	 */
-	if (spd > 1)
+	if (spd > 0)
 		mask &= (1 << (spd - 1)) - 1;
-	else
-		return -EINVAL;
 
 	/* were we already at the bottom? */
 	if (!mask)
@@ -4116,7 +4116,10 @@ int sata_link_hardreset(struct ata_link *link, const unsigned long *timing,
 		goto out;
 	/* if link is offline nothing more to do */
 	if (ata_phys_link_offline(link))
+	{
+		rc = -EPIPE;
 		goto out;
+	}
 
 	/* Link is online.  From this point, -ENODEV too is an error. */
 	if (online)
-- 
2.7.4
