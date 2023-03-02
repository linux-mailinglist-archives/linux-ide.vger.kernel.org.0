Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 882FF6A79DA
	for <lists+linux-ide@lfdr.de>; Thu,  2 Mar 2023 04:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjCBDRS (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 1 Mar 2023 22:17:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjCBDRR (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 1 Mar 2023 22:17:17 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD334FA9D
        for <linux-ide@vger.kernel.org>; Wed,  1 Mar 2023 19:17:15 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id y2so15474151pjg.3
        for <linux-ide@vger.kernel.org>; Wed, 01 Mar 2023 19:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2UuwNiIULVdlTjH/QXIKxAjBwjiTn6gs7reREGjC+uY=;
        b=gYWIOdvWKDLkaxODmaIE7dIr1QixXJmeMC7rNoGekgeKf9iS4u1Q7Xx4YfhGTrkbZw
         NOVMfgd1VA0FAaH2xEZDAZVJpZJVlYu2KRh7wSP0KUSQJnnznFPdFFMHdMBl2ulskuuh
         02+csEGd5VyrKuqSvMKsEHdM08xNw74SOYGclj2edU/lyumUyrPCImen7zuK9phRU/aL
         sMObElyT6YQRgQGCLQcQ9jyCiQBwxlp4yX2GTsGamaCUjHFEzDuk4FPMEZuUBsa8ORKQ
         Xl1Czo++gA1lrGq8td2Xgu0tfNs9IsKQI09xGNL1qiKeGID0pnSCZvvpXnkWccCxY2Nj
         8b3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2UuwNiIULVdlTjH/QXIKxAjBwjiTn6gs7reREGjC+uY=;
        b=yFyVJCij8E2xcSE+XNdDG8i0U0IJ4E8aUlU2jCJB1AW4XtQ8ouHDSHm6Tm2+Z2l9Gu
         8OuLeaaKoUuC5HdWTX37fqrw2Jk5XCVZl6ncGvZsn8sOstC882kIcLagW6B5efMijHPW
         1LFZ9AH/COHYFsEW5PpMC4pBY0rW1TdLQPuJpY4cPSiCybzIsjOkWLM/mhDiznNjETKd
         QA0f3j+GeVh8GGfwnQhTJakMpkhl+ofE4J/CFRcoGGTRTngO9n81NCbE1euoH8CZP/Ma
         E0ScqyP+5R4qbzgG7iCkrLU/S1oqtYsoSHd3gce1ZLnhUiKYTh3hjNJhYqrH6fCJqxN9
         iGhg==
X-Gm-Message-State: AO0yUKUxkt/Swsxh+I3wEcPhBYjHHd3A14Reu5HUOFWndrwm2s6vb5T8
        ta9GbuK8yFSn9VLyEIxhn+3p94z1F0pc6dAKPKI=
X-Google-Smtp-Source: AK7set9D7ipY/0SmxAsTtsROL+QxBusuFZ0I9xJ1TBi2lMvOgTicOaOQ94eDPBK/WLMENx8ZozpeGg==
X-Received: by 2002:a17:903:42c6:b0:19a:6cd2:a658 with SMTP id jy6-20020a17090342c600b0019a6cd2a658mr16658plb.7.1677727034772;
        Wed, 01 Mar 2023 19:17:14 -0800 (PST)
Received: from [2620:15c:29:203:5530:853:8d92:ba58] ([2620:15c:29:203:5530:853:8d92:ba58])
        by smtp.gmail.com with ESMTPSA id v10-20020a62ac0a000000b005810a54fdefsm8584795pfe.114.2023.03.01.19.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 19:17:13 -0800 (PST)
Date:   Wed, 1 Mar 2023 19:17:13 -0800 (PST)
From:   David Rientjes <rientjes@google.com>
To:     Matthew Wilcox <willy@infradead.org>,
        Pasha Tatashin <tatashin@google.com>
cc:     Gao Xiang <hsiangkao@linux.alibaba.com>,
        lsf-pc@lists.linux-foundation.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-block@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-nvme@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [LSF/MM/BPF TOPIC] State Of The Page
In-Reply-To: <Y/UiY/08MuA/tBku@casper.infradead.org>
Message-ID: <a94384e5-cad2-fbdb-9187-7b626557e93a@google.com>
References: <Y9KtCc+4n5uANB2f@casper.infradead.org> <8448beac-a119-330d-a2af-fc3531bdb930@linux.alibaba.com> <Y/UiY/08MuA/tBku@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Tue, 21 Feb 2023, Matthew Wilcox wrote:

> On Wed, Feb 22, 2023 at 02:08:28AM +0800, Gao Xiang wrote:
> > On 2023/1/27 00:40, Matthew Wilcox wrote:
> > > I'd like to do another session on how the struct page dismemberment
> > > is going and what remains to be done.  Given how widely struct page is
> > > used, I think there will be interest from more than just MM, so I'd
> > > suggest a plenary session.
> > 
> > I'm interested in this topic too, also I'd like to get some idea of the
> > future of the page dismemberment timeline so that I can have time to keep
> > the pace with it since some embedded use cases like Android are
> > memory-sensitive all the time.
> 
> As you all know, I'm absolutely amazing at project management & planning
> and can tell you to the day when a feature will be ready ;-)
> 
> My goal for 2023 is to get to a point where we (a) have struct page
> reduced to:
> 
> struct page {
> 	unsigned long flags;
> 	struct list_head lru;
> 	struct address_space *mapping;
> 	pgoff_t index;
> 	unsigned long private;
> 	atomic_t _mapcount;
> 	atomic_t _refcount;
> 	unsigned long memcg_data;
> #ifdef LAST_CPUPID_NOT_IN_PAGE_FLAGS
> 	int _last_cpupid;
> #endif
> };
> 
> and (b) can build an allnoconfig kernel with:
> 
> struct page {
> 	unsigned long flags;
> 	unsigned long padding[5];
> 	atomic_t _mapcount;
> 	atomic_t _refcount;
> 	unsigned long padding2;
> #ifdef LAST_CPUPID_NOT_IN_PAGE_FLAGS
> 	int _last_cpupid;
> #endif
> };
> 

This is exciting to see and I'd definitely like to participate in the 
discussion.  Reducing struct page overhead is an important investment area 
for large hyperscalers from an efficiency standpoint, we strand a massive 
amount of memory due to struct page today.  I'd be particularly interested 
in a division-of-work discussion so that we can help to bridge any gaps 
that exist in realizing Matthew's vision, both short term and long term.
