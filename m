Return-Path: <linux-ide+bounces-2508-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CDA9ACBA1
	for <lists+linux-ide@lfdr.de>; Wed, 23 Oct 2024 15:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7341C2855F1
	for <lists+linux-ide@lfdr.de>; Wed, 23 Oct 2024 13:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2AD1BE86E;
	Wed, 23 Oct 2024 13:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d95We1WZ"
X-Original-To: linux-ide@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD321BDAAB
	for <linux-ide@vger.kernel.org>; Wed, 23 Oct 2024 13:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729691418; cv=none; b=rDys/gC0FFQ5AzX0L068lQr/uxQ/P00fTghhhGlWR2Z4KpOA38zD3AnS1png7UO6doEMBSPVDJJ6eUko+VlzOjttrYE/BWYZZZZEINMIQl+5G1lGalxfqTf2sEwoyU7vKiXlfiwc79oYFZmctOat+qvvONapEeHiuO6k/Gu0Y8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729691418; c=relaxed/simple;
	bh=1CTS0Ugnf9jJBC1ruM/WIiADBY5GmrMIo6GSJ3E70PI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E9FQN0pdyd6D3/DFFkqfeeDryNdAlIqaDWhZs7kOfyoWwLQNMff5onl1ckh3Nrr4mxmVrF2+yE6gV84TNtZC3/PEFpI3Az3B6V7Wnn1T2cBihrFmMPUNWYMloXhgIxlWRKIbgfXwdXXnUIDY79/C0PxZk2SOEKQLGCRj10w+vIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d95We1WZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729691414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oO7/c3KxFQ4pCLrpHRIQyFFVX9SeNU/L27HBNV7OVps=;
	b=d95We1WZBbUdVyDSFgIvU8zgDceWjJa5cmeHp624v+Z/g5Sry4W1+LvpqC2UquTYy5le6z
	mdUq1Pb78mNpYhkiILLaP+xU0ZrMPnMfdNJYt1NIS+rJJggkOUWu7ePkh25BDCEA92vkLI
	LWEOXfgFl9WSkjphcdhRbUxfXpf3ORg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-2ccglBD0Nmu93vwvFSPCzA-1; Wed, 23 Oct 2024 09:50:13 -0400
X-MC-Unique: 2ccglBD0Nmu93vwvFSPCzA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4315e8e9b1cso5513225e9.1
        for <linux-ide@vger.kernel.org>; Wed, 23 Oct 2024 06:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729691412; x=1730296212;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oO7/c3KxFQ4pCLrpHRIQyFFVX9SeNU/L27HBNV7OVps=;
        b=Nt/rB9QWnrtCyTIu0V/kqaI4tY/ULfPoiBsJqNlh7bb48p2rROsoi8CRtkcWmEY7lp
         2Hed1ggd+D8dgaA/1gZn8YVebq75a75KDDCk1XmtOheibjJ/uvViUDC+n8AjrYP43sXL
         /a4g1RoNCwTaUIhFduTBkv2XWUcVCi52wnYRMjtC+SyEiPdcmQ8bABM583C+whDCU00n
         UBlx8AFocJsTjkQHjunFd7Hsi1m9TPza/fLIgFBQCV+XPfg/rJYhIv4v/nOC8bI3Z/UF
         ullnLmyBwzA59NYd2getE6TMD1tJEkQJ9Px/HOUZLQcun80dlQDGUEx4SOyPEYbS13zY
         0wwA==
X-Forwarded-Encrypted: i=1; AJvYcCV9Pv42PXA1G8SE3bvVKM2Sv8zEPN8seUB60QdGZejzakgj1Sksr+7re6ltZV4XZhjziKZAL3hq9LI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDJqu3m++SHqDL7TbUwK3VtdVq8yF6MYjfnjZzLJYzuHdZGDoU
	0cFZx9xfGc33EbY9lhWa6orYf2ZW7632z5L0zBvRfNR4hXHxBLhAvkF3AEuTSFeOhQwdaS3HtkT
	4hIJl+9zvKxOpAzlpnB4nfzNrwWLfeWe+y94gOpQ67AsIKmwF7xCgu3Bhkg==
X-Received: by 2002:a05:600c:4f43:b0:42f:84ec:3e0 with SMTP id 5b1f17b1804b1-4317bd88469mr48316885e9.9.1729691412251;
        Wed, 23 Oct 2024 06:50:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVbS2v+nb51IE57ofZXQEpzrUukFuey0NWkF8DOXs6/K2mGsAvF2UpvyCTTgP3Onw94z3R5g==
X-Received: by 2002:a05:600c:4f43:b0:42f:84ec:3e0 with SMTP id 5b1f17b1804b1-4317bd88469mr48316115e9.9.1729691411741;
        Wed, 23 Oct 2024 06:50:11 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dac:2f00:8834:dd3a:39b8:e43b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186be7605sm16955265e9.19.2024.10.23.06.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 06:50:11 -0700 (PDT)
Message-ID: <6f3db65fe9a5dcd1a7a8d9bd5352ecb248ef57b1.camel@redhat.com>
Subject: Re: [PATCH 02/13] ALSA: hda_intel: Use always-managed version of
 pcim_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Sergey Shtylyov <s.shtylyov@omp.ru>, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>,  Benjamin
 Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov <oakad@yahoo.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rasesh Mody <rmody@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko <imitsyanko@quantenna.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar S K
 <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Alex Williamson <alex.williamson@redhat.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Chen Ni <nichen@iscas.ac.cn>, Mario Limonciello
 <mario.limonciello@amd.com>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Mostafa Saleh
 <smostafa@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu
 <yi.l.liu@intel.com>,  Christian Brauner <brauner@kernel.org>, Ankit
 Agrawal <ankita@nvidia.com>, Eric Auger <eric.auger@redhat.com>, Reinette
 Chatre <reinette.chatre@intel.com>, Ye Bin <yebin10@huawei.com>, Marek
 =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Rui Salvaterra <rsalvaterra@gmail.com>,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org,  kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Date: Wed, 23 Oct 2024 15:50:09 +0200
In-Reply-To: <87v7xk2ps5.wl-tiwai@suse.de>
References: <20241015185124.64726-1-pstanner@redhat.com>
	 <20241015185124.64726-3-pstanner@redhat.com> <87v7xk2ps5.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-10-22 at 16:08 +0200, Takashi Iwai wrote:
> On Tue, 15 Oct 2024 20:51:12 +0200,
> Philipp Stanner wrote:
> >=20
> > pci_intx() is a hybrid function which can sometimes be managed
> > through
> > devres. To remove this hybrid nature from pci_intx(), it is
> > necessary to
> > port users to either an always-managed or a never-managed version.
> >=20
> > hda_intel enables its PCI-Device with pcim_enable_device(). Thus,
> > it needs
> > the always-managed version.
> >=20
> > Replace pci_intx() with pcim_intx().
> >=20
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > =C2=A0sound/pci/hda/hda_intel.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> > index b4540c5cd2a6..b44ca7b6e54f 100644
> > --- a/sound/pci/hda/hda_intel.c
> > +++ b/sound/pci/hda/hda_intel.c
> > @@ -786,7 +786,7 @@ static int azx_acquire_irq(struct azx *chip,
> > int do_disconnect)
> > =C2=A0	}
> > =C2=A0	bus->irq =3D chip->pci->irq;
> > =C2=A0	chip->card->sync_irq =3D bus->irq;
> > -	pci_intx(chip->pci, !chip->msi);
> > +	pcim_intx(chip->pci, !chip->msi);
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
>=20
> Hm, it's OK-ish to do this as it's practically same as what
> pci_intx()
> currently does.=C2=A0 But, the current code can be a bit inconsistent
> about
> the original intx value.=C2=A0 pcim_intx() always stores !enable to
> res->orig_intx unconditionally, and it means that the orig_intx value
> gets overridden at each time pcim_intx() gets called.

Yes.

>=20
> Meanwhile, HD-audio driver does release and re-acquire the interrupt
> after disabling MSI when something goes wrong, and pci_intx() call
> above is a part of that procedure.=C2=A0 So, it can rewrite the
> res->orig_intx to another value by retry without MSI.=C2=A0 And after the
> driver removal, it'll lead to another state.

I'm not sure that I understand this paragraph completely. Still, could
a solution for the driver on the long-term just be to use pci_intx()?

>=20
> In anyway, as it doesn't change the current behavior, feel free to
> take my ack for now:
>=20
> Acked-by: Takashi Iwai <tiwai@suse.de>

Thank you,
P.

>=20
>=20
> thanks,
>=20
> Takashi
>=20


