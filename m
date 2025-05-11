Return-Path: <linux-ide+bounces-3543-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 890E9AB2B04
	for <lists+linux-ide@lfdr.de>; Sun, 11 May 2025 22:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 038B2172663
	for <lists+linux-ide@lfdr.de>; Sun, 11 May 2025 20:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C0C19CD1B;
	Sun, 11 May 2025 20:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSaZzPjI"
X-Original-To: linux-ide@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529F11714AC
	for <linux-ide@vger.kernel.org>; Sun, 11 May 2025 20:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746996050; cv=none; b=N3BF38oThixdyqyoZcDkyt+YWj/As7dXcCUH+muBYnzj0alh0DQMTgVwnyjINyloTe3lBdCD87s0sdPr3lFx+6ivHLfBdWFoT/HORjAJhuf8rjWvdez47MHuTv0PaICOQdDvZV/xNNWnfuCoKPaV7YZX+WBcfiSeMYx3Z+p3QxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746996050; c=relaxed/simple;
	bh=pOCqWYOn5Pi2B/3u4BKRwuu5bM1RI/t2RbOSyaymhBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mo5nIjDm82ttRXexJ97FyR6Kx5h/TlQKF22IK79nE6C8MdP5uYVrYGCgNNdXjnOlLL0SFtVWrKF5Q/CxMAmgYVBd/l+wEtGmy72CqgQzqqR7ZN4LvHXb+cGHDIt34wHPRjbfEdLdgr3w0xAbLovSsqPV4rmkLDT2JB9YsXENDW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSaZzPjI; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e7297c3ce7aso2979593276.0
        for <linux-ide@vger.kernel.org>; Sun, 11 May 2025 13:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746996048; x=1747600848; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pOCqWYOn5Pi2B/3u4BKRwuu5bM1RI/t2RbOSyaymhBA=;
        b=VSaZzPjIQ+vUhg+l7o26c1uPo6iZGGFv2oeTcYnkp7BvEtTufG/96k/j2F99NsW0ID
         xT0G9bhC2agp4cUUrETf7/wt9SNBL+HXiyNqLYU+5TSdXh8e4MWl4cm/KxqJ30D8ATDk
         oKG+8TIv5jjnSLQvie0q1bXNkEngWbv/9Fav/ys9JJTYvuA0qCUfNQQS58pivmCBmDTK
         zMrf6teREKxVvDhzNzEXdLVOhfG5UgtTQl2lYE+HrP5WRgz7/xq6wMQxFSDPh+01MHfj
         duJNhlivJrYozzoKLuSQDGb0NgqeVyceqz9SOuDdbAP+w8+a4QXcLf02RNi0Hne8f0VW
         RLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746996048; x=1747600848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOCqWYOn5Pi2B/3u4BKRwuu5bM1RI/t2RbOSyaymhBA=;
        b=kKbkxzBD71bnRKCoZP65J4ZJV2kIRJ8v5GjubMBgWiMy4N/k3KeSdAp2EhUBUdOqIK
         FJp9c36MN+uQ97S+Lu9t8FVxVZzQqxpvWbKrShKmYIgvbsYKKwYM2vzYEfh6cY3VO1dK
         lP38D9D/iXmHNO3tzFfeCjmE4WfVXy37dZ3dkW6ntmFykhgZVmVj5f6l+irIbXvYDwRx
         pr5dM9kAXmMmjBjkiTPl/97RuBJm2VaKqGtIUGnVibWzoyM6S7K809qvBvE3+011BHZY
         zuwTbng1sz92RLPY8YgRUOu2fKj5ysh1JMPr130BNpTcxZiH1QZOSMFbL/3pIXu3SOgL
         kELA==
X-Forwarded-Encrypted: i=1; AJvYcCVHirAQR2I3CswzLcgMYUfQN21+5JgDnjlszJyLR+RHaLPjffrmJm8T9HtyVy51+XA2tw1/u2rj1J0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIJ/vHXc70mffIuCX2HwXbFjojgdu2Y5rTTmGxYNdydZ+ko80J
	kUxBWmTn3RCHBVl3bLZsfpNEXifk/TGzFwfFzA/5HW4fTpROh5WocLWhyGKS61xo1nQDuRPMR4O
	HI1pD26Jp8/KlXVrzuZ1ZGMsMjls=
X-Gm-Gg: ASbGnctzouncvnOE4ya/QfBBpOrugh8uYAixZJBxY/f/dsilWJwwGpnrpyYrXd8E2a2
	moXpgYMmSBVU9Eeh8Y5iBkVI3K32OKV+9MdRZyNCn8ClHS10z/krACX9iR2gqKxWkpJCuVEFfuh
	n71oaB0MvTrl5pcmOTQpGdAyqW7lH1mHDuPQ==
X-Google-Smtp-Source: AGHT+IEaevjrtylZY3ZrcE8gFZEqjpqIWWzZ3sWvUNbbWsFjkvnJinT8QDR5qL5Js/LG/EWQykivD8mIa8KrVdljG4o=
X-Received: by 2002:a05:6902:1693:b0:e73:1ff1:ca28 with SMTP id
 3f1490d57ef6-e78fdcc6843mr13961133276.19.1746996048107; Sun, 11 May 2025
 13:40:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADUzMVbneDW06V4vd8si8k=NN_6df3JeejaF3fVk2U=LVC1UHA@mail.gmail.com>
 <fe406980-f230-4060-9b1a-16295b6cfa48@kernel.org> <88a6fb5f-dc85-41e0-a65d-92704b4c8499@kernel.org>
 <CAAZ0mTeepp7G9CtLFq+U_n0h2+SF8V8j2K=0hkNAp0Fzdc7TAQ@mail.gmail.com>
 <aBjbSt5hTaUP_JhG@ryzen> <CAAZ0mTctoC5UCsDVH56x5OS_500URheBU66USNuq+rwktLrEiw@mail.gmail.com>
 <f572f7d2-7b14-476e-aab2-bf674811dee5@kernel.org> <CAAZ0mTf3T5RTDKtd148GyGOiVz98isFFbMDXfku8yAk9FfLVeQ@mail.gmail.com>
 <aB8_rITWsMzkTiyE@ryzen> <CAAZ0mTe7Tpf2F1cKbmr==43pXDUxcPP4Q2AydpyDFJUrFHzNHQ@mail.gmail.com>
 <98E34F63-CCAE-48C4-9584-9053C3D1A7FD@kernel.org> <CAAZ0mTdcAazi=133Dz0+OgSGOERe7WmCTr27ePudEVhkJj6VbA@mail.gmail.com>
 <48F49924-F5FE-4A91-8323-E2C789D1BEFB@kernel.org>
In-Reply-To: <48F49924-F5FE-4A91-8323-E2C789D1BEFB@kernel.org>
From: Mikko Juhani Korhonen <mjkorhon@gmail.com>
Date: Sun, 11 May 2025 23:40:12 +0300
X-Gm-Features: AX0GCFv8vTqDFUpk-OOBO69moM_GIQzQg9eZPy68GwTbhe85r1L2egiMeOQYFp0
Message-ID: <CAAZ0mTdA2NZE12iZmckVOY9T92M0LSoJGX=8tFYEXeLGJAbjPg@mail.gmail.com>
Subject: Re: [PATCH v4] ata: libata: disable LPM for WDC WD20EFAX-68FB5N0 hard drives
To: Niklas Cassel <cassel@kernel.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, Ioannis Barkas <jnyb.de@gmail.com>, linux-ide@vger.kernel.org, 
	Niklas Cassel <Niklas.Cassel@wdc.com>
Content-Type: text/plain; charset="UTF-8"

su 11.5.2025 klo 22.18 Niklas Cassel (cassel@kernel.org) kirjoitti:

> Ok, I see were things went wrong now.
> Damien asked for the good output for 6.8,
> rather than the good output for 6.14.5, when you plugged the drive in to a port that was working.
> Basically, we wanted to compare the good 6.14.5 output with the bad 6.14.5 output, especially the lpm-pol output.

Okay now I get what you were saying and it makes sense!

> Tomorrow, I will send a patch that will print, per port, if BIOS has marked the port as external/ hotplug capable or not. (Because right now, when we see lpm-pol 0, we don't know if it is because of BIOS settings or Kconfigs).

I don't think it helps as with vanilla 6.14.5 and my good SATA I seem
to remember lpm-pol is 3 but I will check.

Best regards,
Mikko

