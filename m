Return-Path: <linux-ide+bounces-2881-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F512A05C1D
	for <lists+linux-ide@lfdr.de>; Wed,  8 Jan 2025 13:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23121165D35
	for <lists+linux-ide@lfdr.de>; Wed,  8 Jan 2025 12:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825D51946C7;
	Wed,  8 Jan 2025 12:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=philpem.me.uk header.i=@philpem.me.uk header.b="aHb99+zu"
X-Original-To: linux-ide@vger.kernel.org
Received: from nick.sneptech.io (nick.sneptech.io [178.62.38.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043B01FBC81
	for <linux-ide@vger.kernel.org>; Wed,  8 Jan 2025 12:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.38.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736340776; cv=none; b=Cor5EilxD/w9B3kZp+5UHQMX47TzDgVWfVO30yxHxGhXQ8uDVkt4vF3C50XXWNyidU9qxK4a7qL/5amJfH+oKNk+ynBZcq1/p/GBj+vAQOvWbrGmc3VLL10zyg9EwlSjYewOdmC/FZpDJWofeGiyShKnWZV72FKKTFmKqnTgMRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736340776; c=relaxed/simple;
	bh=+qDmGrCP0guOQm5f3v+LlO0Vdvin4MOyvobnIwwSeiE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=Iu3xM0VRfm0q6XYz+wTO8WBeEvjfBhVwXeDYbqN6RoEnGk+ye4svX+Jv66EqTY7Vdp7eD6PGgMJgHU23tvOyI4dIE6mLLW4W6WBRSwofo2bQidigJNpPVsX8vWBQgAfJYiR2Wivr1UlZisuYEULQgPOlS6Bdq93LINR7iSbXFuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=philpem.me.uk; spf=pass smtp.mailfrom=philpem.me.uk; dkim=pass (1024-bit key) header.d=philpem.me.uk header.i=@philpem.me.uk header.b=aHb99+zu; arc=none smtp.client-ip=178.62.38.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=philpem.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=philpem.me.uk
Received: from wolf.philpem.me.uk (148.163.187.81.in-addr.arpa [81.187.163.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mailrelay_wolf@philpem.me.uk)
	by nick.sneptech.io (Postfix) with ESMTPSA id 55DCFBD152
	for <linux-ide@vger.kernel.org>; Wed,  8 Jan 2025 12:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=philpem.me.uk;
	s=mail; t=1736340771;
	bh=+qDmGrCP0guOQm5f3v+LlO0Vdvin4MOyvobnIwwSeiE=;
	h=Date:From:Subject:To:From;
	b=aHb99+zu2dhuV3DupGYPuhEuYZqCw2YmzHXIL0NHkCBbHPMfU2FECPJN+5SmK8vS4
	 YaOoKHuleJxonTHtouidhb39RjeNvUKettu15OuCqm9GvyvIkdCXCPgZTJucDBbp8p
	 WMorzlTWsKp0wmmkWwB1U7SBBfT73lY2yJnHk9Bc=
Received: from [10.0.0.32] (cheetah.homenet.philpem.me.uk [10.0.0.32])
	by wolf.philpem.me.uk (Postfix) with ESMTPSA id 9BE1C2C006C
	for <linux-ide@vger.kernel.org>; Wed,  8 Jan 2025 12:52:50 +0000 (GMT)
Message-ID: <c6722ee8-5e21-4169-af59-cbbae9edc02f@philpem.me.uk>
Date: Wed, 8 Jan 2025 12:52:50 +0000
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Philip Pemberton <lists@philpem.me.uk>
Subject: Zip 100 ATAPI not working, "qc timeout" and "failed to clear UNIT
 ATTENTION"
To: linux-ide@vger.kernel.org
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm trying to connect an old Iomega Zip 100 ATAPI to a B550-chipset 
Ryzen system, to exchange files with an even older system. The Gigabyte 
B550 AORUS ELITE AX V2 rev1.3 motherboard doesn't have any PATA ports, 
so I'm using a SATA to PATA adapter.

Sadly it will not work in the B550 system (Kernel 6.8.0-51-generic 
x86_64, Linux Mint 21.3 based on Ubuntu 22.04). When I have the Zip 
drive connected, I get the following in dmesg and the sd device never 
appears:

ata3: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
ata3.00: ATAPI: IOMEGA  ZIP 100       ATAPI, 12.A, max PIO3, CDB intr, 
DMADIR
ata3.00: applying bridge limits
ata3.00: configured for PIO0
ata3.00: qc timeout after 5000 msecs (cmd 0xa0)
ata3.00: failed to clear UNIT ATTENTION (err_mask=0x5)

I've included a more complete dmesg at the bottom of this message.

I currently have the following in the kernel command line:
   libata.atapi_dmadir=1 
libata.force=3.00:atapi_dmadir,dump_id,nodmalog,noncq,pio0

I started with only having the DMADIR option as suggested in this old 
patch from LKML:
   https://lkml.org/lkml/2013/6/18/933

With "atapi_dmadir=1" and DMADIR forced, I have the same messages in the 
kernel log - except obviously none of the other "horkage" messages or 
the ATA IDENTIFY dump, and I think the "xfer mask" starts at a higher speed.


The BIOS can see and access the Zip drive fine, as can Windows.

I've also tried the same setup (SATA bridge) in a Pentium 4 PCI+AGP 
machine I had sitting around. Admittedly this isn't much of a test as it 
was running a much older and 32bit OS (Knoppix 7.2, kernel 3.9.6) but 
the sd device appeared and the drive could be accessed fine.

Is there anything else I can try to get the drive working?

If you're curious, my use case is, predictably enough, copying data 
to/from old systems which don't have USB. (a mix of Acorn ARM systems 
running RISC OS and PCs with parallel port Zip drives)

Thanks,
Phil.


Full dmesg:

[ 4465.211914] ata3: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[ 4465.218528] ata3.00: FORCE: horkage modified (atapi_dmadir)
[ 4465.218531] ata3.00: FORCE: horkage modified (dump_id)
[ 4465.218532] ata3.00: FORCE: horkage modified (nodmalog)
[ 4465.218533] ata3.00: FORCE: horkage modified (noncq)
[ 4465.218535] ata3.00: ATAPI: IOMEGA  ZIP 100       ATAPI, 12.A, max 
PIO3, CDB intr, DMADIR
[ 4465.218538] ata3.00: applying bridge limits
[ 4465.218540] ata3.00: FORCE: xfer_mask set to pio0
[ 4465.225708] ata3.00: dumping IDENTIFY data, class=3 may_fallback=1 
tried_spinup=0
[ 4465.225713] 00000000: 80a0 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225716] 00000010: 0000 0000 2020 2020 2020 2020 2020 2020  .... 

[ 4465.225718] 00000020: 2020 2020 2020 2020 0000 0000 0000 3132 
  ......21
[ 4465.225720] 00000030: 2e41 2020 2020 494f 4d45 4741 2020 5a49  A. 
OIEMAG  IZ
[ 4465.225723] 00000040: 5020 3130 3020 2020 2020 2020 4154 4150   P01 0 
      TAPA
[ 4465.225725] 00000050: 4920 2020 2020 2020 2020 2020 2020 0000   I 
        ..
[ 4465.225727] 00000060: 0000 0e00 4002 0200 0000 0002 0000 0000 
.....@..........
[ 4465.225729] 00000070: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225731] 00000080: 0001 0000 0000 01f4 00b4 0000 0000 0000 
................
[ 4465.225733] 00000090: 0000 0006 0009 0000 0202 0000 0000 0000 
................
[ 4465.225735] 000000a0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225738] 000000b0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225740] 000000c0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225742] 000000d0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225744] 000000e0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225746] 000000f0: 0000 0000 0000 0000 0000 0000 0000 0101 
................
[ 4465.225748] 00000100: 2863 2920 436f 7079 7269 6768 7420 494f  c( 
)oCypirhg tOI
[ 4465.225750] 00000110: 4d45 4741 2031 3939 3720 0000 0000 0000  EMAG1 
99 7......
[ 4465.225753] 00000120: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225755] 00000130: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225757] 00000140: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225759] 00000150: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225761] 00000160: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225763] 00000170: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225767] 00000180: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225769] 00000190: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225772] 000001a0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225774] 000001b0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225776] 000001c0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225778] 000001d0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225780] 000001e0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4465.225782] 000001f0: 0000 0000 0000 0000 0000 0000 0116 1900 
................
[ 4465.225787] ata3.00: configured for PIO0
[ 4470.419775] ata3.00: qc timeout after 5000 msecs (cmd 0xa0)
[ 4470.419794] ata3.00: failed to clear UNIT ATTENTION (err_mask=0x5)
[ 4470.883747] ata3: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[ 4470.890363] ata3.00: dumping IDENTIFY data, class=3 may_fallback=1 
tried_spinup=0
[ 4470.890371] 00000000: 80a0 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890376] 00000010: 0000 0000 2020 2020 2020 2020 2020 2020  .... 

[ 4470.890380] 00000020: 2020 2020 2020 2020 0000 0000 0000 3132 
  ......21
[ 4470.890384] 00000030: 2e41 2020 2020 494f 4d45 4741 2020 5a49  A. 
OIEMAG  IZ
[ 4470.890387] 00000040: 5020 3130 3020 2020 2020 2020 4154 4150   P01 0 
      TAPA
[ 4470.890391] 00000050: 4920 2020 2020 2020 2020 2020 2020 0000   I 
        ..
[ 4470.890395] 00000060: 0000 0e00 4002 0200 0000 0002 0000 0000 
.....@..........
[ 4470.890398] 00000070: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890402] 00000080: 0001 0000 0000 01f4 00b4 0000 0000 0000 
................
[ 4470.890406] 00000090: 0000 0006 0009 0000 0202 0000 0000 0000 
................
[ 4470.890409] 000000a0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890413] 000000b0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890416] 000000c0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890420] 000000d0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890424] 000000e0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890427] 000000f0: 0000 0000 0000 0000 0000 0000 0000 0101 
................
[ 4470.890431] 00000100: 2863 2920 436f 7079 7269 6768 7420 494f  c( 
)oCypirhg tOI
[ 4470.890435] 00000110: 4d45 4741 2031 3939 3720 0000 0000 0000  EMAG1 
99 7......
[ 4470.890438] 00000120: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890442] 00000130: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890445] 00000140: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890449] 00000150: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890453] 00000160: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890456] 00000170: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890460] 00000180: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890463] 00000190: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890467] 000001a0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890471] 000001b0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890474] 000001c0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890478] 000001d0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890481] 000001e0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.890485] 000001f0: 0000 0000 0000 0000 0000 0000 0116 1900 
................
[ 4470.890500] ata3.00: FORCE: xfer_mask set to pio0
[ 4470.897720] ata3.00: dumping IDENTIFY data, class=3 may_fallback=1 
tried_spinup=0
[ 4470.897735] 00000000: 80a0 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897740] 00000010: 0000 0000 2020 2020 2020 2020 2020 2020  .... 

[ 4470.897744] 00000020: 2020 2020 2020 2020 0000 0000 0000 3132 
  ......21
[ 4470.897748] 00000030: 2e41 2020 2020 494f 4d45 4741 2020 5a49  A. 
OIEMAG  IZ
[ 4470.897752] 00000040: 5020 3130 3020 2020 2020 2020 4154 4150   P01 0 
      TAPA
[ 4470.897755] 00000050: 4920 2020 2020 2020 2020 2020 2020 0000   I 
        ..
[ 4470.897759] 00000060: 0000 0e00 4002 0200 0000 0002 0000 0000 
.....@..........
[ 4470.897763] 00000070: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897766] 00000080: 0001 0000 0000 01f4 00b4 0000 0000 0000 
................
[ 4470.897770] 00000090: 0000 0006 0009 0000 0202 0000 0000 0000 
................
[ 4470.897774] 000000a0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897777] 000000b0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897781] 000000c0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897785] 000000d0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897788] 000000e0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897792] 000000f0: 0000 0000 0000 0000 0000 0000 0000 0101 
................
[ 4470.897796] 00000100: 2863 2920 436f 7079 7269 6768 7420 494f  c( 
)oCypirhg tOI
[ 4470.897799] 00000110: 4d45 4741 2031 3939 3720 0000 0000 0000  EMAG1 
99 7......
[ 4470.897803] 00000120: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897807] 00000130: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897810] 00000140: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897814] 00000150: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897818] 00000160: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897821] 00000170: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897825] 00000180: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897828] 00000190: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897832] 000001a0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897836] 000001b0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897839] 000001c0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897843] 000001d0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897847] 000001e0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4470.897850] 000001f0: 0000 0000 0000 0000 0000 0000 0116 1900 
................
[ 4470.897858] ata3.00: configured for PIO0
[ 4476.051591] ata3.00: qc timeout after 5000 msecs (cmd 0xa0)
[ 4476.051607] ata3.00: failed to clear UNIT ATTENTION (err_mask=0x5)
[ 4476.515583] ata3: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[ 4476.522296] ata3.00: dumping IDENTIFY data, class=3 may_fallback=1 
tried_spinup=0
[ 4476.522310] 00000000: 80a0 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522314] 00000010: 0000 0000 2020 2020 2020 2020 2020 2020  .... 

[ 4476.522317] 00000020: 2020 2020 2020 2020 0000 0000 0000 3132 
  ......21
[ 4476.522320] 00000030: 2e41 2020 2020 494f 4d45 4741 2020 5a49  A. 
OIEMAG  IZ
[ 4476.522323] 00000040: 5020 3130 3020 2020 2020 2020 4154 4150   P01 0 
      TAPA
[ 4476.522326] 00000050: 4920 2020 2020 2020 2020 2020 2020 0000   I 
        ..
[ 4476.522328] 00000060: 0000 0e00 4002 0200 0000 0002 0000 0000 
.....@..........
[ 4476.522331] 00000070: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522334] 00000080: 0001 0000 0000 01f4 00b4 0000 0000 0000 
................
[ 4476.522337] 00000090: 0000 0006 0009 0000 0202 0000 0000 0000 
................
[ 4476.522339] 000000a0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522342] 000000b0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522345] 000000c0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522348] 000000d0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522350] 000000e0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522353] 000000f0: 0000 0000 0000 0000 0000 0000 0000 0101 
................
[ 4476.522356] 00000100: 2863 2920 436f 7079 7269 6768 7420 494f  c( 
)oCypirhg tOI
[ 4476.522359] 00000110: 4d45 4741 2031 3939 3720 0000 0000 0000  EMAG1 
99 7......
[ 4476.522362] 00000120: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522364] 00000130: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522367] 00000140: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522370] 00000150: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522372] 00000160: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522375] 00000170: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522378] 00000180: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522381] 00000190: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522383] 000001a0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522386] 000001b0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522389] 000001c0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522392] 000001d0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522394] 000001e0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.522397] 000001f0: 0000 0000 0000 0000 0000 0000 0116 1900 
................
[ 4476.522409] ata3.00: FORCE: xfer_mask set to pio0
[ 4476.529541] ata3.00: dumping IDENTIFY data, class=3 may_fallback=1 
tried_spinup=0
[ 4476.529549] 00000000: 80a0 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529553] 00000010: 0000 0000 2020 2020 2020 2020 2020 2020  .... 

[ 4476.529571] 00000020: 2020 2020 2020 2020 0000 0000 0000 3132 
  ......21
[ 4476.529577] 00000030: 2e41 2020 2020 494f 4d45 4741 2020 5a49  A. 
OIEMAG  IZ
[ 4476.529583] 00000040: 5020 3130 3020 2020 2020 2020 4154 4150   P01 0 
      TAPA
[ 4476.529589] 00000050: 4920 2020 2020 2020 2020 2020 2020 0000   I 
        ..
[ 4476.529594] 00000060: 0000 0e00 4002 0200 0000 0002 0000 0000 
.....@..........
[ 4476.529600] 00000070: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529606] 00000080: 0001 0000 0000 01f4 00b4 0000 0000 0000 
................
[ 4476.529612] 00000090: 0000 0006 0009 0000 0202 0000 0000 0000 
................
[ 4476.529617] 000000a0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529623] 000000b0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529628] 000000c0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529633] 000000d0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529639] 000000e0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529644] 000000f0: 0000 0000 0000 0000 0000 0000 0000 0101 
................
[ 4476.529649] 00000100: 2863 2920 436f 7079 7269 6768 7420 494f  c( 
)oCypirhg tOI
[ 4476.529655] 00000110: 4d45 4741 2031 3939 3720 0000 0000 0000  EMAG1 
99 7......
[ 4476.529661] 00000120: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529666] 00000130: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529672] 00000140: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529677] 00000150: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529682] 00000160: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529687] 00000170: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529693] 00000180: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529698] 00000190: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529704] 000001a0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529709] 000001b0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529714] 000001c0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529720] 000001d0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529725] 000001e0: 0000 0000 0000 0000 0000 0000 0000 0000 
................
[ 4476.529731] 000001f0: 0000 0000 0000 0000 0000 0000 0116 1900 
................
[ 4476.529743] ata3.00: configured for PIO0
[ 4481.683441] ata3.00: qc timeout after 5000 msecs (cmd 0xa0)
[ 4481.683457] ata3.00: failed to clear UNIT ATTENTION (err_mask=0x5)
[ 4481.683461] ata3.00: disable device
[ 4482.147601] ata3: SATA link up 1.5 Gbps (SStatus 113 SControl 300)

-- 
Phil.
philpem@philpem.me.uk
https://www.philpem.me.uk/

