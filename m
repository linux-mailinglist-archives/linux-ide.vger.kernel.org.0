Return-Path: <linux-ide+bounces-237-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E13C82900B
	for <lists+linux-ide@lfdr.de>; Tue,  9 Jan 2024 23:44:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D52B2874D9
	for <lists+linux-ide@lfdr.de>; Tue,  9 Jan 2024 22:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232063DB9F;
	Tue,  9 Jan 2024 22:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="NuvkG/vS"
X-Original-To: linux-ide@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0643C48F
	for <linux-ide@vger.kernel.org>; Tue,  9 Jan 2024 22:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-36082f3cb05so13310265ab.0
        for <linux-ide@vger.kernel.org>; Tue, 09 Jan 2024 14:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1704840263; x=1705445063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L9xTLocbxJtZ/EsVzz8IzAHiTCzUNRLczzpqZlO0pg4=;
        b=NuvkG/vSLcINgXnC03k23QL0l9G3KqxZ/jrQxVTTiEBbPXQ1xJYEq51nshbMeSaVBs
         FduTo7bxzBnBArU4Q5YfBLCe8Aogk1SD3vXrMMsyg73NmbXjUkG/iOPwhu4gTGDgUyYu
         wqidBfoBjQhgZrXecI9nDlgC1m935d1Qpo2hr4hgzNJOU7QkwS0CMwZV1Kc8Cyqrh2KF
         Y9e2bJZqoFQ1p4zIPWLHEJW+Rj6C/Jf7Yy0FsDXcTc3XUdb8qZzbpEUs/6PJuAtF7YVY
         Wz2QfD9o1jvgTV0+iPlpX+7VdFyq2izIzbvfLA0aFyhJ+IXTQA0utor42UsDtO5je72N
         DFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704840263; x=1705445063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9xTLocbxJtZ/EsVzz8IzAHiTCzUNRLczzpqZlO0pg4=;
        b=i9K/I6OUJEQXgtfhICBNnChtz2UP803EsoLf0cXP1bUyMl6o1sENNBJcdCxU/HrnAU
         j1WEoBfQyOyoif5aesj82EyeMtACbw+ZP9m5MCJIhheLP+qm2Vk1uu8/UOg6+E0RE6SM
         wCBqpw3tysn/rh45PqmCghum9gr9CFIjy7ITTAVPhBjNNmtiNRnriLNaZL49zu5X5Z6i
         fVqk/fiGHmAD2j5L8Zin2h0lYA2GL9T7v7VW5vVsXolyDMrPBcUXbiRra74p5o9DAxSP
         lTttCIVmqHZ9PALJ/8qCOaRXr+ylRtTrz7bdmyvVdAGtgm0KgkEiEOPMVtOV13MYQreV
         ibZQ==
X-Gm-Message-State: AOJu0YxKqy01uFOKMl6LyU4jlo8XEz/8W/05PK6odZ2gz24AoWCmUpNt
	bxbQaARxlo96/FXXSmTSQnkgtNkBcutyuBZOxctagHl+ib0=
X-Google-Smtp-Source: AGHT+IHSKNtjcO8bUbdBcwmcDlNZLFhTfOw5pswdA67ew28nBq3+gGgOSAobh3nBsnKFOjOmUdXBuw==
X-Received: by 2002:a05:6e02:1845:b0:35f:bd12:5488 with SMTP id b5-20020a056e02184500b0035fbd125488mr183647ilv.30.1704840262829;
        Tue, 09 Jan 2024 14:44:22 -0800 (PST)
Received: from dread.disaster.area (pa49-180-249-6.pa.nsw.optusnet.com.au. [49.180.249.6])
        by smtp.gmail.com with ESMTPSA id o5-20020a634e45000000b0050f85ef50d1sm2059281pgl.26.2024.01.09.14.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 14:44:22 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1rNKpX-008G6o-07;
	Wed, 10 Jan 2024 09:44:19 +1100
Date: Wed, 10 Jan 2024 09:44:19 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: lsf-pc@lists.linux-foundation.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-block@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-nvme@lists.infradead.org
Subject: Re: [LSF/MM/BPF TOPIC] Removing GFP_NOFS
Message-ID: <ZZ3MQ1nFcyaMVuCv@dread.disaster.area>
References: <ZZcgXI46AinlcBDP@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZZcgXI46AinlcBDP@casper.infradead.org>

On Thu, Jan 04, 2024 at 09:17:16PM +0000, Matthew Wilcox wrote:
> This is primarily a _FILESYSTEM_ track topic.  All the work has already
> been done on the MM side; the FS people need to do their part.  It could
> be a joint session, but I'm not sure there's much for the MM people
> to say.
> 
> There are situations where we need to allocate memory, but cannot call
> into the filesystem to free memory.  Generally this is because we're
> holding a lock or we've started a transaction, and attempting to write
> out dirty folios to reclaim memory would result in a deadlock.
> 
> The old way to solve this problem is to specify GFP_NOFS when allocating
> memory.  This conveys little information about what is being protected
> against, and so it is hard to know when it might be safe to remove.
> It's also a reflex -- many filesystem authors use GFP_NOFS by default
> even when they could use GFP_KERNEL because there's no risk of deadlock.

Another thing that needs to be considered: GFP_NOFS has been used to
avoid lockdep false positives due to GFP_KERNEL allocations also
being used as scoped GFP_NOFS allocations via different call
chains.

That is, if a code path does a GFP_KERNEL allocation by default,
lockdep will track this as a "reclaim allowed" allocation context.
If that same code is then executed from a scoped NOFS context
(e.g. inside a transaction context), then lockdep will see it as
a "no reclaim allowed" allocation context.

The problem then arises when the next GFP_KERNEL allocation occurs,
the code enters direct reclaim, grabs a filesystem lock and lockdep
then throws out a warning that filesystem locks are being taken
in an allocation context that doesn't allow reclaim to take
filesystem locks.

These are typically false positives.

Prior to __GFP_NOLOCKDEP existing, we used GFP_NOFS unconditionally
in these shared context paths to avoid lockdep from seeing a
GFP_KERNEL allocation context from this allocation path. Now that we
are getting rid of GFP_NOFS and replacing these instances with
GFP_KERNEL and scoped constraints, we're removing the anti-lockdep
false positive mechanism.

IOWs, we have to replace GFP_NOFS with GFP_KERNEL | __GFP_NOLOCKDEP
in these cases to prevent false positive reclaim vs lock inversion
detections. There's at least a dozen of these cases in XFS and we
generally know where they are, but this will likely be an ongoing
issue for filesystems as we switch over to using scoped memory
allocation contexts.

I'm not sure there's a good solution to this. However, we need to
make sure people are aware that GFP_NOFS will need to be converted
to GFP_KERNEL | __GFP_NOLOCKDEP for allocations that can occur in
mixed contexts.

-Dave.
-- 
Dave Chinner
david@fromorbit.com

