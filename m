Return-Path: <linux-ide+bounces-3196-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B34AA456A9
	for <lists+linux-ide@lfdr.de>; Wed, 26 Feb 2025 08:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93B41188EFE6
	for <lists+linux-ide@lfdr.de>; Wed, 26 Feb 2025 07:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA0E26BDAF;
	Wed, 26 Feb 2025 07:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DPnzDNfL"
X-Original-To: linux-ide@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B0826B08C
	for <linux-ide@vger.kernel.org>; Wed, 26 Feb 2025 07:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740554943; cv=none; b=jVqw0+jcdC1DE11TReTfb+qZQ47QHDQUIYv9fK5ZllzqIImF7F7zig/KPe0OTJp2762gVkaQdPWj1/wWICgy3Q+KQYsYQY3yHWsmwiWzw+g+8THAYcpYqIke4yZpbVckRXY3GnOi4Q5DGrFDpCywiortLXSNaz62gc0J9N2Kimc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740554943; c=relaxed/simple;
	bh=6zbN5jOaaksOEj+lbfcyYF58FVbBR2uEiZ1U9Xm0Q7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKtw7E30jVvebcV3AEZTQS9lWypdu075VOwLJLeMjV+8LCnebNupyuaGEegmr6xBE1po0MkQB8BAcsOUgvSOqdEPRvuIpjnH+dHqf6jfFO8cJE2ZScq6L3cf9y8rkroxBoHb1ZROyfw/sGKvZLKc8ldgy/FVnOY+Q+CNtAUpSPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DPnzDNfL; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abb86beea8cso1159409066b.1
        for <linux-ide@vger.kernel.org>; Tue, 25 Feb 2025 23:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740554939; x=1741159739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jy5UzyKzocsSx5cSXomfjfFL//CTemBkcuebkephmC0=;
        b=DPnzDNfLR7XZTTtbDw+DuW1lx1StRSsipS09fizN5cRrJGW7tcTHqO5NSG7xYdoHX2
         o6tzx9bfAow0wJAO8wvFqoZHbs4mPyUkYNJ6p4x4X2XVpneFKc09+/l/Yb7I0rXWNvZf
         59PADbwRVs1Z2Ld7EANg+3GvujiSVL9sTJFNAfRUgh+fg6qGE9wORi/b9D6BsDA1wVBw
         nERAEUIHLAgGAaFUFnLURjg/tr13IDXYc82dy/A6pzvk+xS3FFlJBWRs/jLhn1DVfYvd
         oBGL2zkNNM7XMhVb58ZA7Zr8kDt7ripM7lDqQoP5adxc4THLPzMH4Ps/LDy2jBnSEDqQ
         ZvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740554939; x=1741159739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jy5UzyKzocsSx5cSXomfjfFL//CTemBkcuebkephmC0=;
        b=fVo1a9XJKYlD5Zs6a7D+kGGQ28nepfSCweaNxGCCRxyrIBKkJTrunmE5aojA+W3IKW
         xSr72Y05u3+A8Msr23HUPhe39OHqpNSPR2IRsAlVohgeaXx2Z0TUPYGp4kEi3w/1aWKs
         cQkb1BhWlQVFsyDD9rYs1g1t6Kf5amF7vLfHsLf9W1l/pYavipCREfNpIVzvRvgutVLF
         tZIiE/OpikND6lHn6T0FsmHyYhgvUKRDZbWNcAkviJhl4Y9SHgZVDt/3S39QtDp4im1p
         y+OTUfWPDLttvfzhFJkVyvZMFzxlO01gTr3NOWLT331esBp5K6nJhFb3Y+7uqU9qAN8Q
         i/9A==
X-Forwarded-Encrypted: i=1; AJvYcCWPD1Atd6i5PNrOqxDYcGG6VjLsqCerrH7T3GO7q2vNqIBlygbMz9rj7Z/cyiIzu5VFt1E4g6XsL2o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx64DVnhxHfP81N9rK0ieoB8BIuUJ/HGjPa+qGecV95dZAslUsN
	fpmM3NVe4e/BD1kmO59wiLI7EYUT/RFsb26ts5Og09wnYg6YkrilCC+pfPWkDowpHbGuzyUhr8D
	Jpgi4Ok0IolcBUTR6anzXi18pUMOToQ/gvk9Fgw==
X-Gm-Gg: ASbGncurX5RqVdoCC2ndlaKxX+vL27Pwqq+SWX5yTi3+fw1iTR97t+PV891mVZgA5Gc
	eaOR4g3tJrjZ2TwCQHvZ+KkC7iCFlvYkE4yAs1uzvNmQK5uvQVu0xxaVWc93kfgecXqdmDmJjiA
	ehGzHitA==
X-Google-Smtp-Source: AGHT+IFYP8Tba+z3P6zhrfLVohTtXs/BwRHQBKKRVXu59ZSzqEPbWtjoPmnK2n59Ee5Tugvqu0RIdPnu12lt6iEjWaU=
X-Received: by 2002:a17:906:18b1:b0:ab6:ed8a:601f with SMTP id
 a640c23a62f3a-abeeed1123amr202024966b.12.1740554939189; Tue, 25 Feb 2025
 23:28:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-converge-secs-to-jiffies-part-two-v3-0-a43967e36c88@linux.microsoft.com>
 <20250225-converge-secs-to-jiffies-part-two-v3-6-a43967e36c88@linux.microsoft.com>
 <e53d7586-b278-4338-95a2-fa768d5d8b5e@wanadoo.fr>
In-Reply-To: <e53d7586-b278-4338-95a2-fa768d5d8b5e@wanadoo.fr>
From: Daniel Vacek <neelx@suse.com>
Date: Wed, 26 Feb 2025 08:28:48 +0100
X-Gm-Features: AQ5f1JpekOKemtGu2BHsnbGs6fr563e7jHjxxRB5HZ2bESNce9YNZRbPCIKk9Cc
Message-ID: <CAPjX3Fcr+BoMRgZGbqqgpF+w-sHU+SqGT8QJ3QCp8uvJbnaFsQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/16] rbd: convert timeouts to secs_to_jiffies()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>, Frank.Li@nxp.com, 
	James.Bottomley@hansenpartnership.com, Julia.Lawall@inria.fr, 
	Shyam-sundar.S-k@amd.com, akpm@linux-foundation.org, axboe@kernel.dk, 
	broonie@kernel.org, cassel@kernel.org, cem@kernel.org, 
	ceph-devel@vger.kernel.org, clm@fb.com, cocci@inria.fr, 
	dick.kennedy@broadcom.com, djwong@kernel.org, dlemoal@kernel.org, 
	dongsheng.yang@easystack.cn, dri-devel@lists.freedesktop.org, 
	dsterba@suse.com, festevam@gmail.com, hch@lst.de, hdegoede@redhat.com, 
	hmh@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net, idryomov@gmail.com, 
	ilpo.jarvinen@linux.intel.com, imx@lists.linux.dev, james.smart@broadcom.com, 
	jgg@ziepe.ca, josef@toxicpanda.com, kalesh-anakkur.purayil@broadcom.com, 
	kbusch@kernel.org, kernel@pengutronix.de, leon@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-xfs@vger.kernel.org, 
	martin.petersen@oracle.com, nicolas.palix@imag.fr, ogabbay@kernel.org, 
	perex@perex.cz, platform-driver-x86@vger.kernel.org, s.hauer@pengutronix.de, 
	sagi@grimberg.me, selvin.xavier@broadcom.com, shawnguo@kernel.org, 
	sre@kernel.org, tiwai@suse.com, xiubli@redhat.com, yaron.avizrat@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Feb 2025 at 22:10, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 25/02/2025 =C3=A0 21:17, Easwar Hariharan a =C3=A9crit :
> > Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
> > secs_to_jiffies().  As the value here is a multiple of 1000, use
> > secs_to_jiffies() instead of msecs_to_jiffies() to avoid the multiplica=
tion
> >
> > This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci w=
ith
> > the following Coccinelle rules:
> >
> > @depends on patch@ expression E; @@
> >
> > -msecs_to_jiffies(E * 1000)
> > +secs_to_jiffies(E)
> >
> > @depends on patch@ expression E; @@
> >
> > -msecs_to_jiffies(E * MSEC_PER_SEC)
> > +secs_to_jiffies(E)
> >
> > While here, remove the no-longer necessary check for range since there'=
s
> > no multiplication involved.
>
> I'm not sure this is correct.
> Now you multiply by HZ and things can still overflow.

This does not deal with any additional multiplications. If there is an
overflow, it was already there before to begin with, IMO.

> Hoping I got casting right:

Maybe not exactly? See below...

> #define MSEC_PER_SEC    1000L
> #define HZ 100
>
>
> #define secs_to_jiffies(_secs) (unsigned long)((_secs) * HZ)
>
> static inline unsigned long _msecs_to_jiffies(const unsigned int m)
> {
>         return (m + (MSEC_PER_SEC / HZ) - 1) / (MSEC_PER_SEC / HZ);
> }
>
> int main() {
>
>         int n =3D INT_MAX - 5;
>
>         printf("res  =3D %ld\n", secs_to_jiffies(n));
>         printf("res  =3D %ld\n", _msecs_to_jiffies(1000 * n));

I think the format should actually be %lu giving the below results:

res  =3D 18446744073709551016
res  =3D 429496130

Which is still wrong nonetheless. But here, *both* results are wrong
as the expected output should be 214748364200 which you'll get with
the correct helper/macro.

But note another thing, the 1000 * (INT_MAX - 5) already overflows
even before calling _msecs_to_jiffies(). See?

Now, you'll get that mentioned correct result with:

#define secs_to_jiffies(_secs) ((unsigned long)(_secs) * HZ)

Still, why unsigned? What if you wanted to convert -5 seconds to jiffies?

>         return 0;
> }
>
>
> gives :
>
> res  =3D -600
> res  =3D 429496130
>
> with msec, the previous code would catch the overflow, now it overflows
> silently.

What compiler options are you using? I'm not getting any warnings.

> untested, but maybe:
>         if (result.uint_32 > INT_MAX / HZ)
>                 goto out_of_range;
>
> ?
>
> CJ
>
>
> >
> > Acked-by: Ilya Dryomov <idryomov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.or=
g>
> > Signed-off-by: Easwar Hariharan <eahariha-1pm0nblsJy7Jp67UH1NAhkEOCMrvL=
tNR@public.gmane.org>
> > ---
> >   drivers/block/rbd.c | 8 +++-----
> >   1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> > index faafd7ff43d6ef53110ab3663cc7ac322214cc8c..41207133e21e9203192adf3=
b92390818e8fa5a58 100644
> > --- a/drivers/block/rbd.c
> > +++ b/drivers/block/rbd.c
> > @@ -108,7 +108,7 @@ static int atomic_dec_return_safe(atomic_t *v)
> >   #define RBD_OBJ_PREFIX_LEN_MAX      64
> >
> >   #define RBD_NOTIFY_TIMEOUT  5       /* seconds */
> > -#define RBD_RETRY_DELAY              msecs_to_jiffies(1000)
> > +#define RBD_RETRY_DELAY              secs_to_jiffies(1)
> >
> >   /* Feature bits */
> >
> > @@ -4162,7 +4162,7 @@ static void rbd_acquire_lock(struct work_struct *=
work)
> >               dout("%s rbd_dev %p requeuing lock_dwork\n", __func__,
> >                    rbd_dev);
> >               mod_delayed_work(rbd_dev->task_wq, &rbd_dev->lock_dwork,
> > -                 msecs_to_jiffies(2 * RBD_NOTIFY_TIMEOUT * MSEC_PER_SE=
C));
> > +                 secs_to_jiffies(2 * RBD_NOTIFY_TIMEOUT));
> >       }
> >   }
> >
> > @@ -6283,9 +6283,7 @@ static int rbd_parse_param(struct fs_parameter *p=
aram,
> >               break;
> >       case Opt_lock_timeout:
> >               /* 0 is "wait forever" (i.e. infinite timeout) */
> > -             if (result.uint_32 > INT_MAX / 1000)
> > -                     goto out_of_range;
> > -             opt->lock_timeout =3D msecs_to_jiffies(result.uint_32 * 1=
000);
> > +             opt->lock_timeout =3D secs_to_jiffies(result.uint_32);
> >               break;
> >       case Opt_pool_ns:
> >               kfree(pctx->spec->pool_ns);
> >
>
>

