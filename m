Return-Path: <linux-ide+bounces-4090-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 429CFB303F2
	for <lists+linux-ide@lfdr.de>; Thu, 21 Aug 2025 22:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7506D5E6DCF
	for <lists+linux-ide@lfdr.de>; Thu, 21 Aug 2025 20:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A9A2E92B6;
	Thu, 21 Aug 2025 20:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fe9vujWw"
X-Original-To: linux-ide@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E0C35A29D
	for <linux-ide@vger.kernel.org>; Thu, 21 Aug 2025 20:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755806845; cv=none; b=dCiNhq1DK82IEI0elxH3aPnMdiwUu6A5wmOzx5HDP0xuJWex9Yxw5jdUUW3eDhvrnLuLRfYttD/k3/zWtUDsFoDsUrWos1uXhAYGTolOcctGLqGK6Z2YcyTiB0oWG46Wb4v3OCEGBMJZVO08CD70zJotbGFLVAwI3lA+rWpKsc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755806845; c=relaxed/simple;
	bh=Cw7Tggvlta2Xmlg9ZVygUv1C92bk8NKTD0n9SH6aeIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+P5m5vG3OBYEH5m/nwD7dK6vGty2UOEq1EVH1Vy32CYFLfaZCa9fqjU/qYhZqCftZ6IKNFvdmq08E4vXtlGxnleHXuky9i+EJKFhREsuyIg6ipxIR8jJYCS+jrVQWwPZRAa0Rxz/NamReHZmROZT0tzfIVHXcjRR2gSgUEWcEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fe9vujWw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iU84NUWejaBSUFBs/T0/O04YrYLlq1RcxZMywEFGjU0=;
	b=Fe9vujWwy2AfvbJRTsgeNRVuYMvEISkETVC6cviDoOEq7YPG7dE3dYnJEP3EiZOcgMEae9
	JHsmvrMbC7WuM3A7uabd2gOCugG0lPCM8nXLDq8AWeb5Cg6lwZLZk1Wc/80Dk6udFc8+Jh
	eJupA8hXx1ZKwcrq4MvllfBvbiyW8ms=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-U2FVffkTMkGoy-s314LLsQ-1; Thu, 21 Aug 2025 16:07:20 -0400
X-MC-Unique: U2FVffkTMkGoy-s314LLsQ-1
X-Mimecast-MFC-AGG-ID: U2FVffkTMkGoy-s314LLsQ_1755806839
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45a1b0cb0aaso10734195e9.3
        for <linux-ide@vger.kernel.org>; Thu, 21 Aug 2025 13:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806839; x=1756411639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iU84NUWejaBSUFBs/T0/O04YrYLlq1RcxZMywEFGjU0=;
        b=cUm5FXHrKAiYyKVdTwMB1mxqlwonHe58XYBK1PEAxazEHvc1g+dIiLinObGQGtiBGz
         wXyA3ynBYU+qspOowS5XorjN65G/GaxSgftHQZ3wrDaJwaikwKb5iH3RoVb/VXPnVTEu
         FnQtq3FRSb5ba6dffbWoWHz5EYYSvszLfDNGxCwOaigZ3v+ttRyaqtNpwLcUnyPs+iSf
         DTcDRYimwY7BW/isFjSW2/5HdELkhMGmknYUv8QUUf7frJz5JIdyJ04PWOsvj1ToNtsp
         A0qp79OPfHCvty40tGgiOJdaeIAa2CwYjRD7+4z+853Augc1AuxnB9xl365tvpxxW/58
         33yA==
X-Forwarded-Encrypted: i=1; AJvYcCUzxKNdCef9CRW6xtRgNOPnPX+Osp/1bDL3TcjakCTxdsILs/GVEzSHC9w1PH55+Xf0Q8lycxGWb8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXwqM3m+GYbfZ8k5U9OA16iDp+0V8EAvdVpfduNHIEbm1yOGMB
	Rg5BLO+FiIdBkxRb//4/Z1wjdob8eTAUdu3bySQlhXb33nylLZI6GVnmrhRt9KCLrjyowcQ5I+P
	IET7aW6BAbinMWCgNA+Jugxbq+KHE+n1NWOIp8AlHovzvbaGa9bRQtdLiSU9P3A==
X-Gm-Gg: ASbGnctrBGI/O3hwY0fh6CHQV1huGgsTGX6zjU+Op8WATOBDBrNzaE6lpVvGwC0kFmA
	bciopr48eXGbAgYAjCZyH8ZPJrQRmTu8GSgkVfWexz4/z/9F0s/1pmiOj0lyVNyx96g5qyV8R2C
	GsNPo7CwFYW/9LDC901R9SWyJSj6m3wdvqVOyXNHFu/ac9Hkpckj6K+A2d6Hhi2KzLykcEx4fle
	72W6AI+I7jneggt3RaEDfpGHDMYvN5JHMouBDsUKBPfvyFrCOEqoyKD9PA/tGfxJXusUzdNAZUp
	KWpffZWc+fYMccxdq7UJ+S3PH+zDspT5WNE7G7R8J5jWGUsPBQHCnLAHn2SaJItgilIOzWK6XVS
	m+kaWJ8lksC/Ko9Z7nuHtOw==
X-Received: by 2002:a05:600c:1f95:b0:459:db80:c2ce with SMTP id 5b1f17b1804b1-45b51799428mr2845475e9.7.1755806838956;
        Thu, 21 Aug 2025 13:07:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMhnqxttMNkrL8PAxIX9Mfq64uKkvY2MjzJ39LtAH2Yg7PxwVl8kOZ6CXLaaMF5rYTxrWwyA==
X-Received: by 2002:a05:600c:1f95:b0:459:db80:c2ce with SMTP id 5b1f17b1804b1-45b51799428mr2845125e9.7.1755806838506;
        Thu, 21 Aug 2025 13:07:18 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50dea2b9sm8988005e9.15.2025.08.21.13.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:18 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
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
Subject: [PATCH RFC 04/35] x86/Kconfig: drop superfluous "select SPARSEMEM_VMEMMAP"
Date: Thu, 21 Aug 2025 22:06:30 +0200
Message-ID: <20250821200701.1329277-5-david@redhat.com>
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

Now handled by the core automatically once SPARSEMEM_VMEMMAP_ENABLE
is selected.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 58d890fe2100e..e431d1c06fecd 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1552,7 +1552,6 @@ config ARCH_SPARSEMEM_ENABLE
 	def_bool y
 	select SPARSEMEM_STATIC if X86_32
 	select SPARSEMEM_VMEMMAP_ENABLE if X86_64
-	select SPARSEMEM_VMEMMAP if X86_64
 
 config ARCH_SPARSEMEM_DEFAULT
 	def_bool X86_64 || (NUMA && X86_32)
-- 
2.50.1


