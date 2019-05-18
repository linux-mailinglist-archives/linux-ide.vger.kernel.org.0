Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34B8F224A6
	for <lists+linux-ide@lfdr.de>; Sat, 18 May 2019 21:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbfERTVQ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 18 May 2019 15:21:16 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34771 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727380AbfERTVQ (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 18 May 2019 15:21:16 -0400
Received: by mail-lj1-f194.google.com with SMTP id j24so9114761ljg.1
        for <linux-ide@vger.kernel.org>; Sat, 18 May 2019 12:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:cc:reply-to:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fJ+bTlmbOLcEEckMTVkdO6f7R/Xk9Z+Q4WKXAZCV+lk=;
        b=ED1ndCP8CLMTnUfXtRW94dbo7NITdw+CE3+Rdw9ZXw9qZM/4NEyvxLtZ1xkOUMe+Xn
         lykPQH/Zbw9BAEcHwp3sObgSdkI3DFnKoCYUCGdTa85ZqXrtIy30d+jGHyS4t0YpnvsS
         oclLBKmfUfZhguCo265Ttw+EDHcWq6uvsssGE/EdaIj5CjZ8LYRzEGi0/FIEsDjilwPR
         K+zNDmYXEKIyvZY0bp4gZnpT2Bea7280RHe05D1hAlEi61HCz03pqzi3G1Dbw1K685Mw
         ZVpRTXEAlKUacN+IGI39NZ+HOP1WoTToXv96q7DYCGOC5qPfez6prVqT5P6wGk42gyCC
         F5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:cc:reply-to
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fJ+bTlmbOLcEEckMTVkdO6f7R/Xk9Z+Q4WKXAZCV+lk=;
        b=DjVcR/b9yMaQ1hTFIqUxUBTzk/TUEAcKbUtams3+dLU5ogBYGNlHLkT+eIZuPZqO3h
         xcWJEuR9E20GAM0whCfT9golqvDQOfIr+Y9Pnf1AJwPdqJXF/vaxZsmN7qLXut8fB3YN
         vlbyfvv2SvLMW+Eua/UFCk0AZB5n+Ype05yNjkM5ER++9XEMdZrPUpt7M0ZUtlBGejBN
         1xfoA4FS9Rdf1Bl5cHPPqKZtGqtyCZkFj1yu/8qHZWN8ZZiKB+tek5z3qwzc2YzrWt0n
         4dgQj5OB0H/Wwf+l2jwt5bkkAlVMQYAp2dMf3T/a2UlcyvbTbxiXXXT4s7Fw8jXIcPiJ
         50OA==
X-Gm-Message-State: APjAAAXi9wVHkp5orDTUkA1K8VW0jTAdGWFk/qqZpUm3y5RXDeN0rHwb
        SdsM0qtzvh15PeqEDV4cr1qlV2SQ2Vo=
X-Google-Smtp-Source: APXvYqyZ1yXKq8hrAw1TtlHVc3GXoELyRjdXsaLWaiYSBDMwYAkpBthwW5vjbfEej9LI9nESsECsqg==
X-Received: by 2002:a2e:9c0a:: with SMTP id s10mr4419078lji.162.1558207274202;
        Sat, 18 May 2019 12:21:14 -0700 (PDT)
Received: from [192.168.0.94] (31-178-116-31.dynamic.chello.pl. [31.178.116.31])
        by smtp.googlemail.com with ESMTPSA id w26sm3041822lfl.0.2019.05.18.12.21.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 May 2019 12:21:13 -0700 (PDT)
Subject: Re: Linux 4.15 and onwards fails to initialize some hard drives
To:     linux-ide@vger.kernel.org
References: <S1727300AbfEQXhy/20190517233755Z+6@vger.kernel.org>
 <5abd2a85-7cd9-f408-374f-55d9cd72f2f6@gmail.com>
From:   =?UTF-8?Q?Micha=c5=82_Wadowski?= <wadosm@gmail.com>
Cc:     =?UTF-8?Q?Micha=c5=82_Wadowski?= <wadosm@gmail.com>
Reply-To: S1727300AbfEQXhy/20190517233755Z+6@vger.kernel.org
Message-ID: <fb9fc28f-550b-60dc-a7a9-5e9c1e1a4aa6@gmail.com>
Date:   Sat, 18 May 2019 21:21:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5abd2a85-7cd9-f408-374f-55d9cd72f2f6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Sorry, but I made some mistake with handle current SPD.
There is fixed patch:

---
 drivers/ata/libata-core.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index adf28788cab5..a37249c4ebeb 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -3061,6 +3061,7 @@ int sata_down_spd_limit(struct ata_link *link, u32 spd_limit)
 
 	/* If SCR can be read, use it to determine the current SPD.
 	 * If not, use cached value in link->sata_spd.
+	 * Value of link->sata_spd may be 0.
 	 */
 	rc = sata_scr_read(link, SCR_STATUS, &sstatus);
 	if (rc == 0 && ata_sstatus_online(sstatus))
@@ -3072,23 +3073,23 @@ int sata_down_spd_limit(struct ata_link *link, u32 spd_limit)
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
+	 * we should ignore this. If spd is 1, then we can't speed down
+	 * any more.
 	 */
 	if (spd > 1)
 		mask &= (1 << (spd - 1)) - 1;
-	else
-		return -EINVAL;
 
 	/* were we already at the bottom? */
 	if (!mask)
@@ -4116,7 +4117,10 @@ int sata_link_hardreset(struct ata_link *link, const unsigned long *timing,
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

