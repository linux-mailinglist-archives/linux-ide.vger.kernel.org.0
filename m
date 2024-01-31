Return-Path: <linux-ide+bounces-387-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E9F843803
	for <lists+linux-ide@lfdr.de>; Wed, 31 Jan 2024 08:38:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 174511C257A9
	for <lists+linux-ide@lfdr.de>; Wed, 31 Jan 2024 07:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3AA52F6F;
	Wed, 31 Jan 2024 07:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org header.b="IP32mZMZ"
X-Original-To: linux-ide@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4570255772
	for <linux-ide@vger.kernel.org>; Wed, 31 Jan 2024 07:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706686712; cv=none; b=AUMZGottea7ZV7BjkVnF+3ePK+Rog4gQjmVW4hu5Dv8Ayr8KL2+SyJQy7kAz1j+oKmIcUDV5KF9NO07lXU3JFUDaUIkfHetkBlKzdiykk1ZHFBEPZxlm6qdVxVGSkWXmRjuc0XK318swNZgXp3yo74pRkyi9uKKEuEYU8IVjgi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706686712; c=relaxed/simple;
	bh=0VkofOVuv+VGb0SiWtlMfvFRHiagXQVv83ecDww4ty4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jt0yg0DXFxwZ1xOwnXyh3G0+CNoYj5QVaJBBy0Glj/RejBw5uObXd7TOOjks+AMlsU9i7wqoaEB8bWA53bWTXz4VRCEIB1hkTZ+t5srvjahihOfAwwoC9ojHPsR6dzYUmvPF7l+yik305d4vFJxJJlS3EBQ7itQYBE4iaZRtX1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endlessos.org; spf=pass smtp.mailfrom=endlessos.org; dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org header.b=IP32mZMZ; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endlessos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endlessos.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60410da20a2so857547b3.1
        for <linux-ide@vger.kernel.org>; Tue, 30 Jan 2024 23:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessos.org; s=google; t=1706686709; x=1707291509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1vG6DEvYTBMzwx6KyWyWg1VwbWa1uPpliPdi/uJnH8=;
        b=IP32mZMZV5/sRHJYGqF2rBJ/v0JZqNIQW5K1Wp6O0i7tpQmg+ktIvcyBMvQdFU/yTj
         sbaLhfaHFH6fi/42yBSGbTblYTJKezGHHTiq66oKJejZfB/PGo9kXm7l+vDbgBgjr4TZ
         RXFsKhrHikW93sl6E8buSATA1+FQBgoc/90bfTmO9t9W9jG7a/HAd34tRrxLJbybzcrR
         zWvEO/zTlcmLapDYYdzertlYwtbosQP2Y4cjS9hoxCykXPrXViDMOGQ8Z2faKz57eIUt
         kef/UomymtVquD+N+fcqx/uZmuL5Kn9GRwaHezLyeAtekQ5HCqv3uR6bPuh8tgXRqwUz
         HZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706686709; x=1707291509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1vG6DEvYTBMzwx6KyWyWg1VwbWa1uPpliPdi/uJnH8=;
        b=eW0wAx1tWDHlhXGffjkehEhC9nsmz4zBNkcZ0HGAwNGfLiMLO7K809ojUBZ8Cd/JDk
         z5cjq3LSbuFvFIGunHjJVbf/UYl7R6XNdDQBn5LITmhdDHUcasHq+CwilQ/Top6s7Vep
         0ZxEIEJQNbq1AFDI8j4WtjVYB7hn2EHEqJ10UTn8/o2fPBgk4LQfe1staRHys9g66arQ
         EA/B+vCPjaN9ciQ6sRq7QSV43QIlFh/7RmDp51ebcf1V0w1Ahrwpc+Hs4k8Aap+0Ckku
         +Sj/jP4PnUr7hDAZ9Jrtfn5t6GmVojSE3aY0L6LjGxfnUfX7nia6+uLsFn3Np6PX4ufe
         l0Sg==
X-Gm-Message-State: AOJu0YyyqJCPcXenBceYkFnj86IOsebBckjy9wz8/GcB7+wHICKhXvC4
	AAoRJmMuk1JGK7k8WNZ5qJSMcoaplABWyNMXKiuFmJYQwtIyq2NVSg86uPtEBbAjTYksX5/z/4L
	cc2K9LcdiYn4KJgvIVub1Qzz4HBdGXhXw3UkHKA==
X-Google-Smtp-Source: AGHT+IEmxGcqyYm+HhbqHdbpDr8Ze2LhOYmFejzXnbP2kr/z5C3WhX++vCKtlvFWjwfSDjOxUYFegq5PzkCkJ/E45Oc=
X-Received: by 2002:a81:a20f:0:b0:604:25d:a9f6 with SMTP id
 w15-20020a81a20f000000b00604025da9f6mr750236ywg.44.1706686709149; Tue, 30 Jan
 2024 23:38:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130163519.GA521777@bhelgaas> <20240130172801.GA525128@bhelgaas>
In-Reply-To: <20240130172801.GA525128@bhelgaas>
From: Jian-Hong Pan <jhp@endlessos.org>
Date: Wed, 31 Jan 2024 15:37:53 +0800
Message-ID: <CAPpJ_edNHfK-LAiFPxXsuxeH93W=a=G+5FMYnE3VKWfF=6jmrg@mail.gmail.com>
Subject: Re: [PATCH 2/2] PCI: vmd: enable PCI PM's L1 substates of remapped
 PCIe port and NVMe
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	David Box <david.e.box@linux.intel.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Jonathan Derrick <jonathan.derrick@linux.dev>, linux-ide@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessos.org, 
	Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bjorn Helgaas <helgaas@kernel.org> =E6=96=BC 2024=E5=B9=B41=E6=9C=8831=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=881:28=E5=AF=AB=E9=81=93=EF=BC=9A
>
> [+cc Johan since qcom has similar code]
>
> On Tue, Jan 30, 2024 at 10:35:19AM -0600, Bjorn Helgaas wrote:
> > On Tue, Jan 30, 2024 at 06:00:51PM +0800, Jian-Hong Pan wrote:
> > > The remmapped PCIe port and NVMe have PCI PM L1 substates capability =
on
> > > ASUS B1400CEAE, but they are disabled originally:
> > >
> > > Capabilities: [900 v1] L1 PM Substates
> > >         L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1- ASPM_L1.2+ ASPM_L1.1- L1_=
PM_Substates+
> > >                   PortCommonModeRestoreTime=3D32us PortTPowerOnTime=
=3D10us
> > >         L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2+ ASPM_L1.1-
> > >                    T_CommonMode=3D0us LTR1.2_Threshold=3D0ns
> > >         L1SubCtl2: T_PwrOn=3D10us
> > >
> > > Power on all of the VMD remapped PCI devices before enable PCI-PM L1 =
PM
> > > Substates by following "Section 5.5.4 of PCIe Base Spec Revision 5.0
> > > Version 0.1". Then, PCI PM's L1 substates control are enabled
> > > accordingly.
> > >
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218394
> > > Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
> > > ---
> > >  drivers/pci/controller/vmd.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vm=
d.c
> > > index 87b7856f375a..b1bbe8e6075a 100644
> > > --- a/drivers/pci/controller/vmd.c
> > > +++ b/drivers/pci/controller/vmd.c
> > > @@ -738,6 +738,12 @@ static void vmd_copy_host_bridge_flags(struct pc=
i_host_bridge *root_bridge,
> > >     vmd_bridge->native_dpc =3D root_bridge->native_dpc;
> > >  }
> > >
> > > +static int vmd_power_on_pci_device(struct pci_dev *pdev, void *userd=
ata)
> > > +{
> > > +   pci_set_power_state(pdev, PCI_D0);
> > > +   return 0;
> > > +}
> > > +
> > >  /*
> > >   * Enable ASPM and LTR settings on devices that aren't configured by=
 BIOS.
> > >   */
> > > @@ -928,6 +934,13 @@ static int vmd_enable_domain(struct vmd_dev *vmd=
, unsigned long features)
> > >     vmd_acpi_begin();
> > >
> > >     pci_scan_child_bus(vmd->bus);
> > > +
> > > +   /*
> > > +    * Make PCI devices at D0 when enable PCI-PM L1 PM Substates from
> > > +    * Section 5.5.4 of PCIe Base Spec Revision 5.0 Version 0.1
> > > +    */
> > > +   pci_walk_bus(vmd->bus, vmd_power_on_pci_device, NULL);
> >
> > Sec 5.5.4 indeed says "If setting either or both of the enable bits
> > for PCI-PM L1 PM Substates, both ports must be configured ... while in
> > D0."
> >
> > This applies to *all* PCIe devices, not just those below a VMD bridge,
> > so I'm not sure this is the right place to do this.  Is there anything
> > that prevents a similar issue for non-VMD hierarchies?
> >
> > I guess the bridges (Root Ports and Switch Ports) must already be in
> > D0, or we wouldn't be able to enumerate anything below them, right?
> >
> > It would be nice to connect this more closely with the L1 PM Substates
> > configuration.  I don't quite see the connection here.  The only path
> > I see for L1SS configuration is this:
> >
> >   pci_scan_slot
> >     pcie_aspm_init_link_state
> >       pcie_aspm_cap_init
> >       aspm_l1ss_init
> >
> > which of course is inside pci_scan_child_bus(), which happens *before*
> > this patch puts the devices in D0.  Where does the L1SS configuration
> > happen after this vmd_power_on_pci_device()?
>
> I think I found it; a more complete call tree is like this, where the
> L1SS configuration is inside the pci_enable_link_state_locked() done
> by the vmd_pm_enable_quirk() bus walk:
>
>   vmd_enable_domain
>     pci_scan_child_bus
>       ...
>         pci_scan_slot
>           pcie_aspm_init_link_state
>             pcie_aspm_cap_init
>               aspm_l1ss_init
> +   pci_walk_bus(vmd->bus, vmd_power_on_pci_device, NULL)
>     ...
>     pci_walk_bus(vmd->bus, vmd_pm_enable_quirk, &features)
>       vmd_pm_enable_quirk
>         pci_enable_link_state_locked(PCIE_LINK_STATE_ALL)
>           __pci_enable_link_state
>             link->aspm_default |=3D ...
>             pcie_config_aspm_link
>               pcie_config_aspm_l1ss
>                 pci_clear_and_set_config_dword(PCI_L1SS_CTL1)  # <--
>               pcie_config_aspm_dev
>                 pcie_capability_clear_and_set_word(PCI_EXP_LNKCTL)
>
> qcom_pcie_enable_aspm() does a similar pci_set_power_state(PCI_D0)
> before calling pci_enable_link_state_locked().  I would prefer to
> avoid the D0 precondition, but at the very least, I think we should
> add a note to the pci_enable_link_state_locked() kernel-doc saying the
> caller must ensure the device is in D0.
>
> I think vmd_pm_enable_quirk() is also problematic because it
> configures the LTR Capability *after* calling
> pci_enable_link_state_locked(PCIE_LINK_STATE_ALL).
>
> The pci_enable_link_state_locked() will enable ASPM L1.2, but sec
> 5.5.4 says LTR_L1.2_THRESHOLD must be programmed *before* ASPM L1.2
> Enable is set.

Thanks!  This inspires me why LTR1.2_Threshold is 0ns here.

Jian-Hong Pan

