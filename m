Return-Path: <linux-ide+bounces-4093-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEDCB30420
	for <lists+linux-ide@lfdr.de>; Thu, 21 Aug 2025 22:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6ED6AC2C1D
	for <lists+linux-ide@lfdr.de>; Thu, 21 Aug 2025 20:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1CC2F363E;
	Thu, 21 Aug 2025 20:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jSsGRqUw"
X-Original-To: linux-ide@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74B92D7DF2
	for <linux-ide@vger.kernel.org>; Thu, 21 Aug 2025 20:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755806853; cv=none; b=dS9VBoaA4OuGPRzd8mNPBsSKMTEMIA8m37XosxSyz8uelmHiYd/gbIuTWgM4wVfvS5AcZ6lhieDYjaubMYOfudAtlWdN5sMjt4h9i9YNuy4TIV4l0TaAHs2O8QpPT5mnVKTZmVdUnukQtn0DKDN85BP2uIObfS9gw+muyegp1mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755806853; c=relaxed/simple;
	bh=s79Oeg502W4xdw3NRVnr9AKhHVyvkgzn8FY1ksnzdKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hs4fZWay2EhPbDGP8RV47UrMA9Ukwj1O73mZdZwLeGta8WAAUFTlVaJtlX5l1uY1vpr2XuFz/nG15fUjaeD/+1aJckD67/xiV9qoliq01L9h1iXzO3hnFtptGI7d+zdjHj+G8fVpqlikyIte1hbWL0ZnxoCqJEnEPmj8qtHRmmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jSsGRqUw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A9Znt0atqEjtEUkbTSfKRsvBJ9rEcbnqI7Kn1XkJSrA=;
	b=jSsGRqUw79W7bpmZwB47eydkIHMJKZ+rKdt+XZha96SplDiDAaYrxwbZOXato5gieOI/KE
	3In/plysguHc10KPt2VUYFWKScDQ41ty5hiRqi4Dqu180eyY/LlJFRwHRLNq2TR2kbFwHt
	3TfdkpBygJs5WrS8m6E2dGORxeFMIlA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-VTa8keOuNeCaMdCfVw9pmw-1; Thu, 21 Aug 2025 16:07:28 -0400
X-MC-Unique: VTa8keOuNeCaMdCfVw9pmw-1
X-Mimecast-MFC-AGG-ID: VTa8keOuNeCaMdCfVw9pmw_1755806847
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45b4d6f3ab0so8376835e9.0
        for <linux-ide@vger.kernel.org>; Thu, 21 Aug 2025 13:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806847; x=1756411647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9Znt0atqEjtEUkbTSfKRsvBJ9rEcbnqI7Kn1XkJSrA=;
        b=oKG2pu0D4b5jYunJ8wGnQfMdt06JrcvNGYMLKD6jIc+75hKN4QefTZN0DXaZXQVmef
         F1rPtw8Ps0qsfQnqOTiIdV5MmQmXzxQGh7aHy0qB74JOcy/aky10DEOnWrm+M80Z/Cgc
         zCWqasidmExJ/+H0rvSIX2zRM8Pulro3bIoJ3BYLoMiB4rEAjlM271AQk6Tmxh+j5rSd
         LA84Hc34wkWJjIfYkwxHcujLzyLb0aCo6Z59gBOyIdXXQUe5e2+EH1JZQK1ZUupdk2+l
         IliMQqNWkoi0wWVNo2RRFz5AceAMKZ/i9MTNGb0uXkJp5nc4i0AT2Rwmc+SJPjVOlenb
         mdKA==
X-Forwarded-Encrypted: i=1; AJvYcCUOATd5XXiSxh/nmOu3xuUwJToNYMfBrp9yHwBGRAwE4OqQXYD0wps3/yYMN0cMqEFGeO3AkG3yQrs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm0sQczWuoUhryCIa+JAp4L8ZvrWADOdIvo1xJUx4V1WhUfgEw
	ppHmEa6CkFPXIIHFaydcfZAEbeSi7y3pTkWGFIfIzet5FSEpGBbNpeKXbrAzpPPr1y+zRqdjOJ+
	Nn1jueQoLcu1ybxYXiGSupdQOhi0mxYDrKmFQQNDBkKEA1jpH6jcHdVQ5QLjISg==
X-Gm-Gg: ASbGnctdUNkGB546iiISWQAOOU70pG2KQF8urQ+Puk0C4b07JUwELtUBUT7u5KH35nJ
	yXv4qTCFgKQEUB8damWHA1d+skRlQXiycKA7J6Q7Gse5pbw1dqkWYaE6/w+qsX7tzzQDU/t4zoT
	vJ1Ghbllo1llCwo1RJkNtMHhPF646lvse9eH2jx82dr0VGwrdE44Sbmufuovten2e9mLAGBoiFO
	IDAhdf7Jg/S6iySNbv5lNB3i4+zueWPjV7GFFCOjPXASuOIlV1s6iU8/tZ1wR/PqlCNAcM6Uiaa
	EC1z172fVodeF/J9yQ4Jn72uRoSzY0TDORiNrJZA82q76SC3Iwvf8XY+YPbALyPcbu2ZJayBhog
	G+shZuNPUv0oMUrHQ8yo5xQ==
X-Received: by 2002:a05:600c:3552:b0:459:dde3:1a33 with SMTP id 5b1f17b1804b1-45b517d26d4mr2922265e9.26.1755806847225;
        Thu, 21 Aug 2025 13:07:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUeapMM5JkcwJNJXC+LM6ICHu4lGUEF2ir46AAuHXhYXAFzTcPIdec/q/lplZD/isU7mGEgg==
X-Received: by 2002:a05:600c:3552:b0:459:dde3:1a33 with SMTP id 5b1f17b1804b1-45b517d26d4mr2921795e9.26.1755806846742;
        Thu, 21 Aug 2025 13:07:26 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50d62991sm9535385e9.0.2025.08.21.13.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:26 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>,
	Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	iommu@lists.linux.dev,
	io-uring@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>,
	kasan-dev@googlegroups.com,
	kvm@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com,
	x86@kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 07/35] mm/memremap: reject unreasonable folio/compound page sizes in memremap_pages()
Date: Thu, 21 Aug 2025 22:06:33 +0200
Message-ID: <20250821200701.1329277-8-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's reject unreasonable folio sizes early, where we can still fail.
We'll add sanity checks to prepare_compound_head/prepare_compound_page
next.

Is there a way to configure a system such that unreasonable folio sizes
would be possible? It would already be rather questionable.

If so, we'd probably want to bail out earlier, where we can avoid a
WARN and just report a proper error message that indicates where
something went wrong such that we messed up.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memremap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/memremap.c b/mm/memremap.c
index b0ce0d8254bd8..a2d4bb88f64b6 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -275,6 +275,9 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 
 	if (WARN_ONCE(!nr_range, "nr_range must be specified\n"))
 		return ERR_PTR(-EINVAL);
+	if (WARN_ONCE(pgmap->vmemmap_shift > MAX_FOLIO_ORDER,
+		      "requested folio size unsupported\n"))
+		return ERR_PTR(-EINVAL);
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
-- 
2.50.1


