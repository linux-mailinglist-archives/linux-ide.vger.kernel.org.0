Return-Path: <linux-ide+bounces-2390-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97863997FFC
	for <lists+linux-ide@lfdr.de>; Thu, 10 Oct 2024 10:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1766A1F256FE
	for <lists+linux-ide@lfdr.de>; Thu, 10 Oct 2024 08:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3373204F71;
	Thu, 10 Oct 2024 08:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dUYy4tf3"
X-Original-To: linux-ide@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAC1205E18
	for <linux-ide@vger.kernel.org>; Thu, 10 Oct 2024 08:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728547421; cv=none; b=Vh/S5JTmy2IiUUVpkE2ZGKQI/dJHFASmFJ94B1RLb6bJOkXj4pyxEIL31U86wg6tABvNUlQ/iV2O1o2KbDphzDjufp8BXlQshGl/QtpTVnJeDjwdXPDq+3RARF3wHQcQ1dsE+QYCrpWGo8AXlBTzprcVWX+UY8NK7STFM4xo6xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728547421; c=relaxed/simple;
	bh=o6Yj13wTDdGSHGjmO/sKiO7EHFlnxmZYRbSplb6dOKU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iubMRhT7aujjqdy8XmfnRAcbIlxfIDbxWB4AcPY240guLl0qD8hnQj18Lmb3tXZdUWBx62MsGLqLSm+HMunae5QEfemRk7or0TGP0N0j1RH1XE9bQt3n3EWViN4nBCm6UjHVpwo1Ef5x7fcRzGwcrF48TtOmyYnYbbDdI4Koxt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dUYy4tf3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728547419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o6Yj13wTDdGSHGjmO/sKiO7EHFlnxmZYRbSplb6dOKU=;
	b=dUYy4tf3P0ixVYQ8AoCUl5RSJ3cpQvX8J4czk0QK1gQ6gwXtcJZ8D79mDJwJ0bRfMSCusD
	gPd5T7Y8bdnZ2Ma8WvnQRQE+xrBrLzQH5r1ewBBRC2VYX0drKcP/IuCgUQJMCXd9wf2JC+
	NrYQr1Jbmyas4pyXihT4Ujz3jLVNvLY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-Xe_KlJ8ZMbWKvcFW-yOzqg-1; Thu, 10 Oct 2024 04:03:37 -0400
X-MC-Unique: Xe_KlJ8ZMbWKvcFW-yOzqg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37d4922d8c7so182314f8f.1
        for <linux-ide@vger.kernel.org>; Thu, 10 Oct 2024 01:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728547415; x=1729152215;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6Yj13wTDdGSHGjmO/sKiO7EHFlnxmZYRbSplb6dOKU=;
        b=tVSyU98EvlN3o1M2CLrnwWeXcp2BTJLSvK+9W5xBPZY+Bg/X/J2fpQiKkojLTfogqY
         5qifPdd4EpllWOALaybEkMLA7IxvJHDyXZSMEliG5BOblKHOslYiSLinqiZq7VyAQvJU
         zW5V4uj+5JW8ChMicogUKi5A9wK8eYgXRZqVgvAZ60vecICXlT3f5NSVCsTUPhlYavQZ
         63y3swiMSYtg04vdorIfCBxNRz0GMh1HYMhBawpY+GsBqVLA1mnSH+QezThUhCsKrknN
         s4CJ5TuUyEvnWjP+CI/QVBBn1PCTlg3QAOApUXPWvhjfqULLrV7wi0bVnJZP8pjTuq+p
         xO+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7opxBvpDLbp86oBlyF4pnW/XhrFW49d0k35Mm4xLpnDlCIGiryk/jrTglpNE+g+ge8PJJdgctEFs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3qIB0Rory05cORBZ5GXf/szekFHrLALP9t2bE1AO+79weNh0k
	1XIqJr0kzoeqQZ4jjxIYchX9HcyE8wsMkH8MzbK3hkcz9Z7ioJnGhfOQiQYgKi5Xea6O7M6d+0Y
	0jUEoMfp4trXSJavhVXr67JwXwLZrvhLvxyk0lYKF72448ZWxX1xKqg8ZqA==
X-Received: by 2002:adf:f3c7:0:b0:37c:d299:b5f0 with SMTP id ffacd0b85a97d-37d3ab44f04mr2752583f8f.59.1728547414838;
        Thu, 10 Oct 2024 01:03:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCPZ/N+8I6yvkHpm2WH4x1aWbcKYPe3oMumoEtWLk5b9nz8TmEseUc5OhVu0HO7+xCgvRnQw==
X-Received: by 2002:adf:f3c7:0:b0:37c:d299:b5f0 with SMTP id ffacd0b85a97d-37d3ab44f04mr2752523f8f.59.1728547414296;
        Thu, 10 Oct 2024 01:03:34 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b7edecasm776544f8f.97.2024.10.10.01.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:03:33 -0700 (PDT)
Message-ID: <b57dbf0c83125d58e4e2b488b5b5f71410fd8d6a.camel@redhat.com>
Subject: Re: [RFC PATCH 10/13] staging: rts5280: Use always-managed version
 of pci_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Sergey Shtylyov <s.shtylyov@omp.ru>, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>,  Benjamin
 Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Alex Dubov
 <oakad@yahoo.com>,  Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>,  Rasesh Mody <rmody@marvell.com>,
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
 <smostafa@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hannes Reinecke <hare@suse.de>, John Garry <john.g.garry@oracle.com>,
 Soumya Negi <soumya.negi97@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yi
 Liu <yi.l.liu@intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
 Christian Brauner <brauner@kernel.org>, Ankit Agrawal <ankita@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Eric Auger
 <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>, Marek
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
Date: Thu, 10 Oct 2024 10:03:30 +0200
In-Reply-To: <411f3c94-58b5-471e-bc58-e23d89d2078f@gmail.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
	 <20241009083519.10088-11-pstanner@redhat.com>
	 <2024100936-brunette-flannels-0d82@gregkh>
	 <411f3c94-58b5-471e-bc58-e23d89d2078f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-10-09 at 21:41 +0200, Philipp Hortmann wrote:
> On 10/9/24 11:38, Greg Kroah-Hartman wrote:
> > On Wed, Oct 09, 2024 at 10:35:16AM +0200, Philipp Stanner wrote:
> > > pci_intx() is a hybrid function which can sometimes be managed
> > > through
> > > devres. To remove this hybrid nature from pci_intx(), it is
> > > necessary to
> > > port users to either an always-managed or a never-managed
> > > version.
> > >=20
> > > rts5208 enables its PCI-Device with pcim_enable_device(). Thus,
> > > it needs the
> > > always-managed version.
> > >=20
> > > Replace pci_intx() with pcim_intx().
> > >=20
> > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > > ---
> > > =C2=A0 drivers/staging/rts5208/rtsx.c | 2 +-
> > > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >=20
>=20
> Hi Philipp,
>=20
> this driver (rts5208) will be removed soon - patch is send in.
>=20
> Discussion about removal:
> https://lore.kernel.org/linux-staging/2024100943-shank-washed-a765@gregkh=
/T/#t


Alright, thx for the heads up.

I'm not entirely how best to deal with that, though. I could drop this
patch, but then the driver would end up with an unmanaged pci_intx().

Might this be a problem for users if my series lands sooner than the
removal, say in v6.13 and your removal in v6.14?

P.

>=20
> Thanks for your support.
>=20
> Bye Philipp
>=20


