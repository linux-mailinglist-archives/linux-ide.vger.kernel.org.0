Return-Path: <linux-ide+bounces-2090-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE5E951ABA
	for <lists+linux-ide@lfdr.de>; Wed, 14 Aug 2024 14:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E68E41C2133A
	for <lists+linux-ide@lfdr.de>; Wed, 14 Aug 2024 12:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04101B0107;
	Wed, 14 Aug 2024 12:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="XXdkkJCP"
X-Original-To: linux-ide@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C784B1AED58;
	Wed, 14 Aug 2024 12:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723638066; cv=none; b=tIi/Blh8leHToqrSaZgl3+HIW5HSZ0p+CaCPdWjjIdzVzowQ52hFRpRyM3jens+mhHJAkpV6fJPDH4tUQHiEvzIuVJxrWZFiYuGabvEbDDV09HDSlwzwaMOPMvxKuBWmcMHid6od4+77NFYm5/Ua8sqCga8kSf+nXFWznzYqZnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723638066; c=relaxed/simple;
	bh=FOYiYgwgLe8u1/scC2yAr2l6dIH1fLXzPRVWEcl63Pk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ryFef5ByoVh0m8bUGgQ0gsgEsUFdxFx91icJ/Qst6ZZhltloniEY8rUmcvZOjdUbaTX/c71nNsmHJILMLABPWbLqxy6XxJXYdsLlvLSzShfmBVyXiScxMj1EqZevLYiOidki4rSr59U3MCAlNkSrWsVlfPzSmC7ZVmA2JpQTngM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=XXdkkJCP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723638060;
	bh=fgOthRZ2ayNuF/r5WTO+8XOA5hDEqUuFX5e2Mv7rhns=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XXdkkJCPrfQySwAt6IcRZyZNn0zm601vzMnopXepexwOJSI6Qj3WNb8zqlaeyNPkc
	 1SMBxJFkYwgsCUkauoiz3l4sYH8+QT/pdrK8JWHMNFKV0EWh5WWHa24edTF2AOPn87
	 cZULR9uXIGYk7dRVIZ9Gv4c75n+QbeBI0sNTCA3cMaV7spsSUBBaz+kY54bPTCVDq7
	 6nKWXjOZCQ1oyv1iU/wxxY71X13WldwHWCxUm1Ld8ibMt795hhCGcCTzdjjAdSAQqO
	 Bg5nBoVB3hEXO95hHTzRidVo32TOIwCcU7ee0nm5JO05ye3jrWZhYZz/1GbaqS05K3
	 IbxdM5XCB8u7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WkS5j4V1yz4x1V;
	Wed, 14 Aug 2024 22:20:57 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Niklas Cassel <cassel@kernel.org>
Cc: =?utf-8?Q?Kolbj=C3=B8rn?= Barmen <linux-ppc@kolla.no>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, =?utf-8?B?Sm9u?=
 =?utf-8?B?w6HFoQ==?= Vidra
 <vidra@ufal.mff.cuni.cz>, Christoph Hellwig <hch@lst.de>,
 linux@roeck-us.net
Subject: Re: Since 6.10 - kernel oops/panics on G4 macmini due to change in
 drivers/ata/pata_macio.c
In-Reply-To: <Zrt028rSVT5hVPbU@ryzen.lan>
References: <62d248bb-e97a-25d2-bcf2-9160c518cae5@kolla.no>
 <3b6441b8-06e6-45da-9e55-f92f2c86933e@ufal.mff.cuni.cz>
 <Zrstcei9WN9sRfdX@x1-carbon.wireless.wdc> <87sev81u3f.fsf@mail.lhotse>
 <Zrt028rSVT5hVPbU@ryzen.lan>
Date: Wed, 14 Aug 2024 22:20:55 +1000
Message-ID: <87jzgj1ejc.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Niklas Cassel <cassel@kernel.org> writes:
> On Tue, Aug 13, 2024 at 10:32:36PM +1000, Michael Ellerman wrote:
>> Niklas Cassel <cassel@kernel.org> writes:
>> > On Tue, Aug 13, 2024 at 07:49:34AM +0200, Jon=C3=A1=C5=A1 Vidra wrote:
...
>> >> ------------[ cut here ]------------
>> >> kernel BUG at drivers/ata/pata_macio.c:544!
>> >
>> > https://github.com/torvalds/linux/blob/v6.11-rc3/drivers/ata/pata_maci=
o.c#L544
>> >
>> > It seems that the
>> > while (sg_len) loop does not play nice with the new .max_segment_size.
>>=20
>> Right, but only for 4KB kernels for some reason. Is there some limit
>> elsewhere that prevents the bug tripping on 64KB kernels, or is it just
>> luck that no one has hit it?
>
> Have your tried running fio (flexible I/O tester), with reads with a very
> large block sizes?
>
> I would be surprised if it isn't possible to trigger the same bug with
> 64K page size.
>
> max segment size =3D 64K
> MAX_DCMDS =3D 256
> 256 * 64K =3D 16 MiB
> What happens if you run fio with a 16 MiB blocksize?
>
> Something like:
> $ sudo fio --name=3Dtest --filename=3D/dev/sdX --direct=3D1 --runtime=3D6=
0 --ioengine=3Dio_uring --rw=3Dread --iodepth=3D4 --bs=3D16M

Nothing interesting happens, fio succeeds.

The largest request that comes into pata_macio_qc_prep() is 1280KB,
which results in 40 DMA list entries.

I tried with a larger block size but it doesn't change anything. I guess
there's some limit somewhere else in the stack?

That was testing on qemu, but I don't think it should matter?

I guess there's no way to run the fio test against a file, ie. without a
raw partition? My real G5 doesn't have any spare disks/partitions in it.

cheers


fio-3.37
Starting 1 process

test: (groupid=3D0, jobs=3D1): err=3D 0: pid=3D257: Wed Aug 14 22:18:59 2024
  read: IOPS=3D6, BW=3D195MiB/s (204MB/s)(96.0MiB/493msec)
    slat (usec): min=3D32973, max=3D35222, avg=3D33836.35, stdev=3D1212.51
    clat (msec): min=3D378, max=3D448, avg=3D413.35, stdev=3D34.99
     lat (msec): min=3D413, max=3D481, avg=3D447.19, stdev=3D33.87
    clat percentiles (msec):
     |  1.00th=3D[  380],  5.00th=3D[  380], 10.00th=3D[  380], 20.00th=3D[=
  380],
     | 30.00th=3D[  380], 40.00th=3D[  414], 50.00th=3D[  414], 60.00th=3D[=
  414],
     | 70.00th=3D[  447], 80.00th=3D[  447], 90.00th=3D[  447], 95.00th=3D[=
  447],
     | 99.00th=3D[  447], 99.50th=3D[  447], 99.90th=3D[  447], 99.95th=3D[=
  447],
     | 99.99th=3D[  447]
   bw (  KiB/s): min=3D195047, max=3D195047, per=3D97.82%, avg=3D195047.00,=
 stdev=3D 0.00, samples=3D1
   iops        : min=3D    5, max=3D    5, avg=3D 5.00, stdev=3D 0.00, samp=
les=3D1
  lat (msec)   : 500=3D100.00%
  cpu          : usr=3D1.62%, sys=3D11.97%, ctx=3D22, majf=3D0, minf=3D1540
  IO depths    : 1=3D33.3%, 2=3D66.7%, 4=3D0.0%, 8=3D0.0%, 16=3D0.0%, 32=3D=
0.0%, >=3D64=3D0.0%
     submit    : 0=3D0.0%, 4=3D100.0%, 8=3D0.0%, 16=3D0.0%, 32=3D0.0%, 64=
=3D0.0%, >=3D64=3D0.0%
     complete  : 0=3D0.0%, 4=3D100.0%, 8=3D0.0%, 16=3D0.0%, 32=3D0.0%, 64=
=3D0.0%, >=3D64=3D0.0%
     issued rwts: total=3D3,0,0,0 short=3D0,0,0,0 dropped=3D0,0,0,0
     latency   : target=3D0, window=3D0, percentile=3D100.00%, depth=3D4

Run status group 0 (all jobs):
   READ: bw=3D195MiB/s (204MB/s), 195MiB/s-195MiB/s (204MB/s-204MB/s), io=
=3D96.0MiB (101MB), run=3D493-493msec

Disk stats (read/write):
  sda: ios=3D78/0, sectors=3D196608/0, merge=3D0/0, ticks=3D745/0, in_queue=
=3D745, util=3D66.89%

