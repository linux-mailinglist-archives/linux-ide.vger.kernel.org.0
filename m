Return-Path: <linux-ide+bounces-2407-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C29299A3D9
	for <lists+linux-ide@lfdr.de>; Fri, 11 Oct 2024 14:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 177C6283D54
	for <lists+linux-ide@lfdr.de>; Fri, 11 Oct 2024 12:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFA9217902;
	Fri, 11 Oct 2024 12:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fp6KMWPa"
X-Original-To: linux-ide@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737402178E5
	for <linux-ide@vger.kernel.org>; Fri, 11 Oct 2024 12:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728649677; cv=none; b=RU8FR9ETZVx1Tdj7g/zI5SNp5gn4O5Zqot+72ixcg8LB+R6OOxvL+EdREh4IVKDijn0WlNXTrXB4cBoXj7t8LHnyfilv5+1RoCk9BYym+WtZ+ukx9xrUdU87qlbkVcXNbTcCimxYUO3in2yU3umsv3T2PDFTjJ/gN5YLv7uC7QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728649677; c=relaxed/simple;
	bh=ULnSG4geb8Txl5Cj3WsAJjHU3fohxOMG1UD3Gjc1u5Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fM0LkuhYRNBO/RZAQggbKHk7WZMXVBd/y49QxETsbHlJgGXkgvhvZ9RqbpLlNsPOz6q0mFSeIwAQOAo3iyt8gTh+rB9/0yybmbmyhz9K36OF76speTaMF6sHKa+RE6+NADTsrfLTyJ/HYM7NN2GQ2rCbLAWftVUI7vNJG663gmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fp6KMWPa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728649674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OvgPP8URR3aRLLAeRhIGd9GfEadFvbPu0wTLuyU+TtY=;
	b=fp6KMWPanTJLYlJUNx65p4DGmVtecsomSgEDF+ivbF5NeUvydKp19dLwtIwo5u/Nm3zxwa
	dMp9UrbMIwsOSTdEmDlpuTZGYmSYW1USKh7euU4hgrSbbtYFodJ/uINX8yvZAvbJM+jmPY
	qHkBYqHfCs0YDCWQbLODd5x4w5aam/0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70--1DjZ6I_O8ypaKIwUEHfnQ-1; Fri, 11 Oct 2024 08:27:53 -0400
X-MC-Unique: -1DjZ6I_O8ypaKIwUEHfnQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42cc4345561so9822615e9.1
        for <linux-ide@vger.kernel.org>; Fri, 11 Oct 2024 05:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728649672; x=1729254472;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OvgPP8URR3aRLLAeRhIGd9GfEadFvbPu0wTLuyU+TtY=;
        b=qyppXNp/Thi2sQ43Dy0HjYuJT5dC51C0SbIAeHeuhapMfc4Jt9s6CgACq2xT52mpOb
         T/N5XNOBRBKIAsXsDbnTz9K3NT0rRdw/K/RkbCRaD8e0u0FdmID4DbZhr8B+c/9926ez
         AmX+QfSlP5WK1eab5svH/Q4tiN5Qxn+X+oycAp7bzXQOS8Pdb+kna/I4vEKMjnivyX//
         vWb1cZX7idor5P3sWuh5XDf2Pb7OforqyYECrJGyHR71V9eL4h+blFdjDgBcTkmzpD8g
         jE/9WAM8SJ/NMYAqL9MfvSgcISbs3uvn5b/zUcUWV5ozExlanJ4eK96bgs2jDQYKtdY4
         61rw==
X-Forwarded-Encrypted: i=1; AJvYcCUAmyaZzf97yvYFkSP2tsuqffpLPY+6DN3PkAkPeKifeukBTBX49Tw1KK8TnQgPvz765sE1KdrUTT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm3FqiNNmiSXSmNVRTfqlWkl32LG53ph83EWsQNPDKGcGRocn0
	YgCLzKj3lJ7MzQg+2gesED2+TFBiA/LX6XL0+yzuuHuXuestyEhZZQaHg5+FbBQGE3TNBaFYFkF
	7Ej2XoATKJDTEXtQBR+M8liXSyX2Aw/Q8g3Tlesd5YI7EMCwuCjboNSKYvQ==
X-Received: by 2002:a05:600c:1f8c:b0:430:c3a5:652a with SMTP id 5b1f17b1804b1-4311ded53cbmr16267755e9.12.1728649672166;
        Fri, 11 Oct 2024 05:27:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgVv3RNAOR2FC6mKD8YlkQf/6eOtik4XN5FWpHDbbO6uoNEPOtTgURod1/yDncIWXirvGTnQ==
X-Received: by 2002:a05:600c:1f8c:b0:430:c3a5:652a with SMTP id 5b1f17b1804b1-4311ded53cbmr16267425e9.12.1728649671758;
        Fri, 11 Oct 2024 05:27:51 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d05:4700:3e59:7d70:cabd:144b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4311835d95bsm40843965e9.47.2024.10.11.05.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:27:51 -0700 (PDT)
Message-ID: <b13b75ae16b5238ab8b6e6d6e7a0797ed8415e80.camel@redhat.com>
Subject: Re: [RFC PATCH 02/13] ALSA: hda: hda_intel: Use always-managed
 version of pcim_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
 Iwai <tiwai@suse.com>, Mario Limonciello <mario.limonciello@amd.com>, Chen
 Ni <nichen@iscas.ac.cn>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Mostafa Saleh
 <smostafa@google.com>, Hannes Reinecke <hare@suse.de>, John Garry
 <john.g.garry@oracle.com>, Soumya Negi <soumya.negi97@gmail.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>, "Dr. David Alan
 Gilbert" <linux@treblig.org>, Christian Brauner <brauner@kernel.org>, Ankit
 Agrawal <ankita@nvidia.com>, Reinette Chatre <reinette.chatre@intel.com>,
 Eric Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>, Marek
 =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Rui Salvaterra <rsalvaterra@gmail.com>,
 Marc Zyngier <maz@kernel.org>, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-input@vger.kernel.org,
 netdev@vger.kernel.org,  linux-wireless@vger.kernel.org,
 ntb@lists.linux.dev, linux-pci@vger.kernel.org, 
 linux-staging@lists.linux.dev, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Date: Fri, 11 Oct 2024 14:27:48 +0200
In-Reply-To: <Zwfo4dr4bfqQGGyl@smile.fi.intel.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
	 <20241009083519.10088-3-pstanner@redhat.com>
	 <Zwfo4dr4bfqQGGyl@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-10-10 at 17:46 +0300, Andy Shevchenko wrote:
> On Wed, Oct 09, 2024 at 10:35:08AM +0200, Philipp Stanner wrote:
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
>=20
> ...
>=20
> > =C2=A0	bus->irq =3D chip->pci->irq;
> > =C2=A0	chip->card->sync_irq =3D bus->irq;
> > -	pci_intx(chip->pci, !chip->msi);
> > +	pcim_intx(chip->pci, !chip->msi);
> > =C2=A0	return 0;
>=20
> I believe each driver needs an individual approach. Looking at the
> above
> I would first to understand why this one is being used and why we
> can't
> switch to pci{m}_alloc_irq_vectors(). (Yeah, managed
> pci_alloc_irq_vectors()
> is probably still missing, I don't remember if you introduced it or
> not.
>=20

Alright alright =E2=80=93 we touched it in the other mail briefly, but let =
me
point out another specific problem:

pci_alloc_irq_vectors() *uses* pci_intx(). And pci_intx() can be
managed sometimes.

See the problem? :(

So it's not just that I couldn't port the driver Alex is concerned
about, it's also that MSI itself is a user of pci_intx().

So a pcim_alloc_irq_vectors() might end up doing double-devres or God
knows what else. Only once pci_intx() is clean one can start thinking
about the code in pci/msi/

It's the biggest reason why I want to clean it up as suggested here,
and also why the only patch I'm really nervous about is number 8.


P.


