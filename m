Return-Path: <linux-ide+bounces-4130-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18569B3078F
	for <lists+linux-ide@lfdr.de>; Thu, 21 Aug 2025 23:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCE67625C8E
	for <lists+linux-ide@lfdr.de>; Thu, 21 Aug 2025 20:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDC135CEC2;
	Thu, 21 Aug 2025 20:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Xj3eWnKy"
X-Original-To: linux-ide@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C4535CEA1
	for <linux-ide@vger.kernel.org>; Thu, 21 Aug 2025 20:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755808831; cv=none; b=HMATbiWUYlmC1KRmcsKGWTYN92SfvXCaRENj8yN7usKBjKw+fj2Sn1JdUYjQnevYlcjWqsKAWPv8yjXIREKL1ITkTveERlrVUXOp2+9N87UPKV35M3I1dN6lZksLC7RRFgJN+54vZ7fkO9VpbaIse27RBdYd9AYoRgZVdQgIDWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755808831; c=relaxed/simple;
	bh=1qrCIxXCctxTGv3WrCi51BAahcEwkBdshUsK554eypo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ll+Mn3H/GUbb1T4/bk3v29Req8JB+kVLi0j+wCnipoHaNYt6Vz7kak9DZA7ma6kWUWDy2R6jg6qtLcaetTWsRKbIgSusx8ny5rlrvbacuaKZ/IrZWSskOxLCiaog3zhuNZkm6T2lzu+VKD/NO32JGN9ZK7bjaILo2wTGCNJGHTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Xj3eWnKy; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e932ded97easo1395869276.1
        for <linux-ide@vger.kernel.org>; Thu, 21 Aug 2025 13:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1755808826; x=1756413626; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHa4LrampbSXQx1Wyi9Bh9OjrywcR0PvG9lus2xsnNw=;
        b=Xj3eWnKyDim2sWrPyXl0eiBk1OWSgs1ksQYyz2QefBrBdLLLXnht5zVD4ZioqosLXN
         Dz19HC+4B2jldL4kkms2feJWTaQaDtE19/QczTKaZSvVvxdjVQfHCUywxEH8NFqilrQd
         0w4Bkj7aKkm66WdkH1tFOjeZ3wgq4J/tQimS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755808826; x=1756413626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHa4LrampbSXQx1Wyi9Bh9OjrywcR0PvG9lus2xsnNw=;
        b=GKxft7d95MDLbr41Bv9taLE0qU5x0eaShcOfwzvU0zYrKSfg1wXCSYy0+fmDgJFsu3
         4MwG1/Km637L0wzCvPIjO8laFm5N0ngDCu9yK7RNEsC+5B4I/UKSxh3S+IWA15cGcYN5
         Ay7s9BKuJvwe+pDtZ2MiyZryCMUQYyGnc9/trfFcU1gtR0JN6covIw7vLWBJyIOd4mrQ
         jGMbN4kPEf2R9i+K8OhxRTBMVoL2RqOuujSqeKQPV3EzQOYNKZh+Q5GWbFeuxvqIEFXo
         lTklwmgxHiAkfBhfvXZ+vbbVDT50RnkM2kXqiSr2iTTQJh6rat0ioEnzibjZjfW8GPgo
         tHhA==
X-Forwarded-Encrypted: i=1; AJvYcCWdbLzI81IRjuCVgQmFovQa+P3QAYt8uBBFyXk5zuEp5zQHUD6S39N+VOZ2v652ciPclpolbmvYQu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuhRt4v9n0JdrvCvcb50xlXYEBcYCqJPszoaOyfMxoIfeZU00C
	3tXtXmIFUd1LTk20DNuc0zSnlScwxEroG/gcNnYx4ulbX5tqevXj5LrFR+GOJKQA4Fk3lf8h8nX
	kR8pX93O6xfZZkf0YyEa/83j4FvRrN/dFpmL2R0NHcw==
X-Gm-Gg: ASbGncvIYwyrR1iCum3xLqv60Z8NniHSQ5IRGMhEG6cZrwmACqkXr6JR2PK/xL6brb2
	ZZv951ErXLiv2aW9/u86uWBPkGbD/8rYklUY1ujk+9ev9lWiVZNQc96vkd0FjBkKPaaapUlyyRU
	hTlATjd2vzTjAzG1WQF0V52je9v8gmVVw9Lv6LJ0q6Z0wP7NtB9uFRDx6TzHg8xHxyPVmTJoU1D
	W4mlqSKp6+0wQd6
X-Google-Smtp-Source: AGHT+IEDbX/Imr3oMuC/SvPpVgA4gK54+Q+BCEwHjysz7tgNECdpdXbU462KLrYXAP4tYmTYkQFLOtkp14xdKE7/w+U=
X-Received: by 2002:a05:6902:c12:b0:e93:457a:37b0 with SMTP id
 3f1490d57ef6-e951c33ee1bmr998901276.20.1755808826442; Thu, 21 Aug 2025
 13:40:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821200701.1329277-1-david@redhat.com> <20250821200701.1329277-32-david@redhat.com>
 <CAHk-=wjGzyGPgqKDNXM6_2Puf7OJ+DQAXMg5NgtSASN8De1roQ@mail.gmail.com> <2926d7d9-b44e-40c0-b05d-8c42e99c511d@redhat.com>
In-Reply-To: <2926d7d9-b44e-40c0-b05d-8c42e99c511d@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Aug 2025 16:40:13 -0400
X-Gm-Features: Ac12FXw_AatpwCNNPCEiMwiwdQxQbayKDzVf5K7yc3iQ5tLY7APrv3zl2U8Z_SA
Message-ID: <CAADWXX_5AJxTsk5m_RvP58d=quRMqT4-XbnQQx=obBTKjHr1Og@mail.gmail.com>
Subject: Re: [PATCH RFC 31/35] crypto: remove nth_page() usage within SG entry
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Alexander Potapenko <glider@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Brendan Jackman <jackmanb@google.com>, 
	Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	iommu@lists.linux.dev, io-uring@vger.kernel.org, 
	Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>, 
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com, kvm@vger.kernel.org, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-arm-kernel@axis.com, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>, 
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, 
	x86@kernel.org, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 4:29=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
> > Because doing a 64-bit shift on x86-32 is like three cycles. Doing a
> > 64-bit signed division by a simple constant is something like ten
> > strange instructions even if the end result is only 32-bit.
>
> I would have thought that the compiler is smart enough to optimize that?
> PAGE_SIZE is a constant.

Oh, the compiler optimizes things. But dividing a 64-bit signed value
with a constant is still quite complicated.

It doesn't generate a 'div' instruction, but it generates something like th=
is:

    movl %ebx, %edx
    sarl $31, %edx
    movl %edx, %eax
    xorl %edx, %edx
    andl $4095, %eax
    addl %ecx, %eax
    adcl %ebx, %edx

and that's certainly a lot faster than an actual 64-bit divide would be.

An unsigned divide - or a shift - results in just

    shrdl $12, %ecx, %eax

which is still not the fastest instruction (I think shrld gets split
into two uops), but it's certainly simpler and easier to read.

           Linus

