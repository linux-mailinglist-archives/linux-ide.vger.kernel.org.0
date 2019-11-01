Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5CAEC50E
	for <lists+linux-ide@lfdr.de>; Fri,  1 Nov 2019 15:51:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727483AbfKAOvb (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 1 Nov 2019 10:51:31 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:35498 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727326AbfKAOvb (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 1 Nov 2019 10:51:31 -0400
Received: by mail-io1-f66.google.com with SMTP id h9so11213123ioh.2
        for <linux-ide@vger.kernel.org>; Fri, 01 Nov 2019 07:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YoC4inVicscoZ9/JjyDbV0BdRtw0qEy4/WkPCgA3aYQ=;
        b=V5pb6Vo4FuDYZcp5h04IOOyI+arougnhmiP9otzeMaGyTEkxXi/30nYxxHnMq8DsNM
         NxtpUCmtUwbvbGNarNyJTGb5JuRiO2y2Vu/czsnylakAs9+I0A27IKm50oHpHbEU52L7
         VSEjceZ0GmabBu2n7m1WH0fHLoEWCuejc5njp5/GMLuWw0igWnYDBonf8oWjqTiH+UQI
         JKm0cyAEaMvCfNNtECkyR1o5v+DSnu9ZrMYw0A6IU1sP8k+HG5j0NJ2b9OsfsBoCKumw
         GcEjt+TW5JGvm3tQyuW4zqYkp5387ECSekwY8cLThqf479ZXpnvQrfjRldtet6BtD1qN
         Eqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YoC4inVicscoZ9/JjyDbV0BdRtw0qEy4/WkPCgA3aYQ=;
        b=sAatgwoxcqdptAQ4LHxyF6txpcxShoOefsHnwxICFh+gYwnRaRnwe8POyPR5ruaWIx
         2PuF+60e7PTm443Q0z3PtysFo/g5QRkelnjA8kqi+MFPlFPB2mOZnVosO0C5+HGHkNDP
         2hgkXASG9HOLxDPI1NH+fFE9WzRmTnDVB4jGkQW+5mvdSKS6d/vELFeFKnE1hsXWmnph
         ek9W5NDTaRxqvTFjxMyztmW5IEMCot/+H0G2pOLF6OD0PGhsjQvtQRNiCtdRplUXNTlv
         TT+BjUIUzZ6fM7tRGDanWtoKknQ32B1afeYvaVqvgbiOtY42P2uBQCHM6C4eZJN3JUax
         3z/g==
X-Gm-Message-State: APjAAAXRFyfHILAm9TnKC1Qu1thvYIg3+Iri9VuFdKfZumWH1lsL2Mpu
        YGbknIbD4MrA3zq5YE95ZdRl3ihICA+Fwg==
X-Google-Smtp-Source: APXvYqwMJzmozzaTEaAeXq8YBSMZEaHQQWlUxa/Cm7BOa+9bXqGtCkl+3Z2ci+WjCIKj9BkWHp7koA==
X-Received: by 2002:a5d:8f9a:: with SMTP id l26mr10794049iol.196.1572619889703;
        Fri, 01 Nov 2019 07:51:29 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id d27sm1026777ill.64.2019.11.01.07.51.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Nov 2019 07:51:28 -0700 (PDT)
Subject: Re: [PATCH v2 -resend 1/4] ata: Documentation, fix function names
To:     Jiri Slaby <jslaby@suse.cz>
Cc:     linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org
References: <20191031095946.7070-1-jslaby@suse.cz>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <53384e14-c294-3036-9549-2c08ac502e47@kernel.dk>
Date:   Fri, 1 Nov 2019 08:51:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191031095946.7070-1-jslaby@suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 10/31/19 3:59 AM, Jiri Slaby wrote:
> ata_qc_prep no longer exists, there are ata_bmdma_qc_prep and
> ata_bmdma_dumb_qc_prep instead. And most drivers do not use them, so
> reword the paragraph.
> 
> ata_qc_issue_prot was renamed to ata_sff_qc_issue. ->tf_load is now
> ->sff_tf_load. Fix them.

Applied 1-4 for 5.4 (please use a cover letter for more than one patch
series...).

-- 
Jens Axboe

