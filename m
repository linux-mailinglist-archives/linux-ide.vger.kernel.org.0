Return-Path: <linux-ide+bounces-2755-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCD39CDA82
	for <lists+linux-ide@lfdr.de>; Fri, 15 Nov 2024 09:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C0D72829F1
	for <lists+linux-ide@lfdr.de>; Fri, 15 Nov 2024 08:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AEA18B494;
	Fri, 15 Nov 2024 08:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f8N1XZMx"
X-Original-To: linux-ide@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30AD1714B3
	for <linux-ide@vger.kernel.org>; Fri, 15 Nov 2024 08:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731659546; cv=none; b=Efb3Z8qxLWSa6G8rMaHCmUtzh6mjrhRn780L5bKwWNyBbxaAQGfdw2lwtbVnnyDVD3NSAhmQR6Pm+h5T1CVLYZw6FDcRZEFLsJScqm5eewB7iGxyHBgpyeWjm1OQUzZhrSF8dB35H3Q83jNpR0iX1dAkk3me8rrWZuI80y6+fn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731659546; c=relaxed/simple;
	bh=KwwtRZveGMe16US76kOe+Iauo+yTFHTCMml6hFlPRTY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rjYIEpAaU0qWrh3IkZfj5HyshF/X1mvCYZKFxhZy01vA2SpTsvNhVwqJj8PdgG0KHuwtygB03yGZsGFeJmnG/bLHunVvy5/cDYIe8HhNLv8DuBfIM8b5aek2Iwe7ZqARyTgTYueL/YI1mtxgRwFbKG+ew8J4HqqLCTu+mxKBPB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f8N1XZMx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731659544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KwwtRZveGMe16US76kOe+Iauo+yTFHTCMml6hFlPRTY=;
	b=f8N1XZMxBN9C3i3Z2uPoHDfCCYGDGhzCAwc8eWU9L3bEJYRP8K47Fj5TIp7Hb8FT3efy30
	jPW+tsZVyrCLQy7CjsxUgmhSW+R16/IozujoP39igvyH0jDWjGtdhSrz1o8s2KiEMCu6A6
	hkr63THX/zhIFF9/5ZbE3oPlqWCwAr4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-nkOF37TWPB-0dMYv_xflkQ-1; Fri, 15 Nov 2024 03:32:22 -0500
X-MC-Unique: nkOF37TWPB-0dMYv_xflkQ-1
X-Mimecast-MFC-AGG-ID: nkOF37TWPB-0dMYv_xflkQ
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d3e8dccc9so260542f8f.1
        for <linux-ide@vger.kernel.org>; Fri, 15 Nov 2024 00:32:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731659540; x=1732264340;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KwwtRZveGMe16US76kOe+Iauo+yTFHTCMml6hFlPRTY=;
        b=eC7uge/b3qWwVvxvU2GTEuf1TdpqMNhUvuzspzw4EyTc5hnoyt207L4ZywylEv3tAo
         /owFO5eW0stIFidceDOARHOTW8mjKSd9Ha7XwQsXugVPm2BiNMrdCqWXwYVYRICLADIa
         kj97w3Uz6O6n3UqCicHNo+NGnB9AaB4axsJUYui1nlEVSuT3cTYki23EcUfcJN6j1jiL
         /jKN7YPjWyfslqs5y8hNzqUYP3dhKI+QbAItdUuF9YUr1Zpi3qZVpu78Zui/nArCV87q
         6YPqDA6zifMdB9RutoXpK7/5Wieyb1OwJ1fZAq8qsowNRaP3fsryoMzSwK51b9qATTO2
         zMdg==
X-Gm-Message-State: AOJu0Yze+JsngxNRunk6Q2R4pQOBXmkJHcy9UjvIBBvygmThoJkm+xzy
	q/C90sqzZSKP8FOnkgYK9gL+MIih8NXaQSRB+WsnaD6tUgC4KO5YbZ5kxF9NVoe7XhHIyfAQb6Q
	odZg9VGEs/Qn7E+gD9I4t4tkVOhWKLGqsl4Alxj4LPenRtmnLU6Ui9vZ+gg==
X-Received: by 2002:a5d:64c9:0:b0:37d:5173:7a54 with SMTP id ffacd0b85a97d-38225aafc0bmr1382392f8f.52.1731659540194;
        Fri, 15 Nov 2024 00:32:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdh/kmNlYkC/WQKFf2J1h1Btsr4ZUjp0WRHuv0DJX0wKMjNySBXwoM4GCHyqPFiIGeYI7IOw==
X-Received: by 2002:a5d:64c9:0:b0:37d:5173:7a54 with SMTP id ffacd0b85a97d-38225aafc0bmr1382314f8f.52.1731659539626;
        Fri, 15 Nov 2024 00:32:19 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada2da2sm3716393f8f.15.2024.11.15.00.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 00:32:19 -0800 (PST)
Message-ID: <ff7f7358cec4bb03423879a2e4efd16d0a3e8ed7.camel@redhat.com>
Subject: Re: [PATCH v2 11/11] Remove devres from pci_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, Damien Le Moal
 <dlemoal@kernel.org>,  Niklas Cassel <cassel@kernel.org>, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>,  Benjamin
 Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov <oakad@yahoo.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rasesh Mody
 <rmody@marvell.com>,  GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko
 <imitsyanko@quantenna.com>,  Sergey Matyukevich <geomatsi@gmail.com>, Kalle
 Valo <kvalo@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar
 S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Alex Williamson <alex.williamson@redhat.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Chen Ni <nichen@iscas.ac.cn>, Ricky Wu
 <ricky_wu@realtek.com>,  Al Viro <viro@zeniv.linux.org.uk>, Breno Leitao
 <leitao@debian.org>, Kevin Tian <kevin.tian@intel.com>, Mostafa Saleh
 <smostafa@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>, Kunwu Chan
 <chentao@kylinos.cn>, Ankit Agrawal <ankita@nvidia.com>, Christian Brauner
 <brauner@kernel.org>, Reinette Chatre <reinette.chatre@intel.com>, Eric
 Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org,  kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Fri, 15 Nov 2024 09:32:16 +0100
In-Reply-To: <8734jtl3xm.ffs@tglx>
References: <20241113124158.22863-2-pstanner@redhat.com>
	 <20241113124158.22863-13-pstanner@redhat.com> <87msi3ksru.ffs@tglx>
	 <49bb6fc9ebff3cae844da0465ceadeef8d3217c7.camel@redhat.com>
	 <8734jtl3xm.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-11-15 at 01:46 +0100, Thomas Gleixner wrote:
> On Thu, Nov 14 2024 at 10:05, Philipp Stanner wrote:
> > On Wed, 2024-11-13 at 17:22 +0100, Thomas Gleixner wrote:
> > > On Wed, Nov 13 2024 at 13:41, Philipp Stanner wrote:
> > > > pci_intx() is a hybrid function which can sometimes be managed
> > > > through
> > > > devres. This hybrid nature is undesirable.
> > > >=20
> > > > Since all users of pci_intx() have by now been ported either to
> > > > always-managed pcim_intx() or never-managed
> > > > pci_intx_unmanaged(),
> > > > the
> > > > devres functionality can be removed from pci_intx().
> > > >=20
> > > > Consequently, pci_intx_unmanaged() is now redundant, because
> > > > pci_intx()
> > > > itself is now unmanaged.
> > > >=20
> > > > Remove the devres functionality from pci_intx(). Have all users
> > > > of
> > > > pci_intx_unmanaged() call pci_intx(). Remove
> > > > pci_intx_unmanaged().
> > > >=20
> > > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > > > ---
> > > > =C2=A0drivers/misc/cardreader/rtsx_pcr.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/misc/tifm_7xx1.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 6 +--
> > > > =C2=A0.../net/ethernet/broadcom/bnx2x/bnx2x_main.c=C2=A0 |=C2=A0 2 =
+-
> > > > =C2=A0drivers/net/ethernet/brocade/bna/bnad.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/ntb/hw/amd/ntb_hw_amd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> > > > =C2=A0drivers/ntb/hw/intel/ntb_hw_gen1.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/pci/devres.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> > > > =C2=A0drivers/pci/msi/api.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/pci/msi/msi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/pci/pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 43 +----------
> > > > ----
> > > > ----
> > > > =C2=A0drivers/vfio/pci/vfio_pci_core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0drivers/vfio/pci/vfio_pci_intrs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++---
> > > > =C2=A0drivers/xen/xen-pciback/conf_space_header.c=C2=A0=C2=A0 |=C2=
=A0 2 +-
> > > > =C2=A0include/linux/pci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> > > > =C2=A014 files changed, 22 insertions(+), 62 deletions(-)
> > >=20
> > > Now I'm utterly confused. This undoes the pci_intx_unmanaged()
> > > churn
> > > which you carefully split into several patches first.
> >=20
> > Have you read the email I have linked?
> >=20
> > There is also the cover-letter (does anyone in the community ever
> > read
> > those?) which explicitly states:
> >=20
> > "Patch "Remove devres from pci_intx()" obviously reverts the
> > previous
> > patches that made drivers use pci_intx_unmanaged(). But this way
> > it's
> > easier to review and approve. It also makes sure that each checked
> > out
> > commit should provide correct behavior, not just the entire series
> > as a
> > whole."
>=20
> I read it and I assume your intention was to force an eye on every
> use
> case of pci_intx() and not just on those which need to be converted
> to
> pcim_intx().
>=20
> I'm not convinced that this is needed, but fair enough.

Whether pcim_enable_device() is really not used could have been
overlooked, or the driver could move to "managed mode" in parallel for
v6.13 for example. Then a bug would be silently introduced into those
drivers.

Besides, me touching pci_intx() unfortunately caused a few explosions
in the past already, in

fc8c818e756991f5f50b8dfab07f970a18da2556 and
00f89ae4e759a7eef07e4188e1534af7dd2c7e9c

So this time I prefer to be rather safe than sorry.


BTW, if you can review the MSI patch and check whether removing devres
from there really is fine, that would be helpful.


Regards,
P.


