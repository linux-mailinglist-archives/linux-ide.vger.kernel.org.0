Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C46287CEE
	for <lists+linux-ide@lfdr.de>; Thu,  8 Oct 2020 22:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730130AbgJHURs (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 8 Oct 2020 16:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730123AbgJHURr (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 8 Oct 2020 16:17:47 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496CAC0613D5
        for <linux-ide@vger.kernel.org>; Thu,  8 Oct 2020 13:17:46 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 34so5249102pgo.13
        for <linux-ide@vger.kernel.org>; Thu, 08 Oct 2020 13:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mRwM0Y2OSmF79xkRQZ5J4gQg+TTvbMu62ytl+MfGImc=;
        b=QOy5ZK8e3qud9rKw05d4GoufSl8XLBo3nVC/mO3hDSOsxpbOKgSxHun1Ex6wZi3uKc
         /vdhBp2L4h6sOGB5a7WsUl21i14MPN9zTH37awglL3Ll+pPKW975GYVVhDabcfvUxKnv
         m2u/PIyaXtflkjUyfmoSnlvFoHABpdlBkWdyUyjkBu3nYi0YpfSZVYwi5KHmr3Y3by4W
         nFThAW4i8SgcSXARV4ohcmjigGlziujSSLN7IupPU5os7/hTT9CjUpGAutEmWeByU9+4
         bH0kGa0vloSwz0rVB+cX9q5het88DHcIvy8UNghSim/JmJnfeRzhfdlfxFQSGXa0NyFg
         mi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mRwM0Y2OSmF79xkRQZ5J4gQg+TTvbMu62ytl+MfGImc=;
        b=rtkCJ9mv+WC+LJi8hGp9fo8ibXaJ7cxsTr8ddwlktsZqc7XNU+JXlgVrtWLthRfUnn
         Gh6Te1nb5BrxN0QoOpaLoq9vHg79mCi5i4Y4fPW5gy2Z/keBfAVm1aOq+eqG4F7iTX1f
         xPWAr1xG+YFerxjKajlbbHB7haSODRldjdGWA/Eg/4ktTWzGFHkEWCfgQJUbisNRAKJU
         Hw0hFMr5iVslrSp/49EK2nlIjlcmyvgmCURViaWf5Pmtq06oCpzvylt5FTnd6DZZiqyV
         t6knQx/cF2WaWBJjde+H3ZK+HaNeaEq1otHlWjkIeIUAnr9h42DL4baX13+9xB97lLEr
         IV8Q==
X-Gm-Message-State: AOAM531+EI5c31JIDGbjKKuV2iDwY2rc6xg0bkX8WHSWt19NgVBhUUYb
        5GlpSEpsnlQ74pPQzCmUNh0djQ==
X-Google-Smtp-Source: ABdhPJyrEiJ103CqNMkdVeceuGn0jLX1sSjQCz00oPZplp/Qz9p0AFVypMlc6kEdUNyQiGypFdHH3Q==
X-Received: by 2002:a65:67d4:: with SMTP id b20mr493567pgs.245.1602188265462;
        Thu, 08 Oct 2020 13:17:45 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id y4sm8963325pjc.53.2020.10.08.13.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2020 13:17:44 -0700 (PDT)
Subject: Re: [ Regressions ] linux next 20201008: blk_update_request: I/O
 error, dev sda, sector 0 op 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Christoph Hellwig <hch@lst.de>, dm-devel@redhat.com,
        open list <linux-kernel@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        drbd-dev@lists.linbit.com,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>, linux-raid@vger.kernel.org,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Song Liu <song@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        martin.petersen@oracle.com, Hannes Reinecke <hare@suse.de>
References: <CA+G9fYtwisRJtN4ht=ApeWc1jWssDok-7y2wee6Z0kzMP-atKg@mail.gmail.com>
 <CA+G9fYseTYRWoHUNZ=j4mjFs9dDJ-KOD8hDy+RnyDPx75HcVWw@mail.gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <24c8ee4d-d5f7-e49f-cd0c-7cf50a5fd885@kernel.dk>
Date:   Thu, 8 Oct 2020 14:17:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYseTYRWoHUNZ=j4mjFs9dDJ-KOD8hDy+RnyDPx75HcVWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 10/8/20 2:05 PM, Naresh Kamboju wrote:
> On Thu, 8 Oct 2020 at 23:41, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>
>> There are two major regressions noticed on linux next tag 20201008.
>> I will bisect this problem and get back to you.
> 
> Reverting scsi: patch set on  linux next tag 20201008 fixed reported problems.
> git revert --no-edit 653eb7c99d84..ed7fb2d018fd

Just for everyones edification, that would be these 9 patches from the
SCSI tree:

Christoph Hellwig (9):
      scsi: core: Don't export scsi_device_from_queue()
      scsi: core: Remove scsi_init_cmd_errh
      scsi: core: Move command size detection out of the fast path
      scsi: core: Use rq_dma_dir in scsi_setup_cmnd()
      scsi: core: Rename scsi_prep_state_check() to scsi_device_state_check()
      scsi: core: Rename scsi_mq_prep_fn() to scsi_prepare_cmd()
      scsi: core: Clean up allocation and freeing of sgtables
      scsi: core: Remove scsi_setup_cmnd() and scsi_setup_fs_cmnd()
      scsi: core: Only start the request just before dispatching

-- 
Jens Axboe

