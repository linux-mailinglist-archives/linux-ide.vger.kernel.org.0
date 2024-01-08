Return-Path: <linux-ide+bounces-179-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3DC827003
	for <lists+linux-ide@lfdr.de>; Mon,  8 Jan 2024 14:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BA6E283E8A
	for <lists+linux-ide@lfdr.de>; Mon,  8 Jan 2024 13:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63E144C80;
	Mon,  8 Jan 2024 13:39:06 +0000 (UTC)
X-Original-To: linux-ide@vger.kernel.org
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C4D45941
	for <linux-ide@vger.kernel.org>; Mon,  8 Jan 2024 13:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thesusis.net
Received: by vps.thesusis.net (Postfix, from userid 1000)
	id AECDA1524F8; Mon,  8 Jan 2024 08:39:04 -0500 (EST)
From: Phillip Susi <phill@thesusis.net>
To: Damien Le Moal <dlemoal@kernel.org>, linux-ide@vger.kernel.org
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH 3/3] libata: don't start PuiS disks on resume
In-Reply-To: <e6f6aebf-0566-4113-8304-bccd88926f20@kernel.org>
References: <87msthdo11.fsf@vps.thesusis.net>
 <20240107180258.360886-1-phill@thesusis.net>
 <20240107180258.360886-4-phill@thesusis.net>
 <e6f6aebf-0566-4113-8304-bccd88926f20@kernel.org>
Date: Mon, 08 Jan 2024 08:39:04 -0500
Message-ID: <871qasuepz.fsf@vps.thesusis.net>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Damien Le Moal <dlemoal@kernel.org> writes:

> Please use full 72-char lines for commit messages. The commit message also does
> not clearly describe what the patch does (completely silent on forcing the drive
> to sleep).

It currently doesn't put it to sleep.

>> +#if 0
>> +		ata_tf_init(dev, &tf);
>> +		tf.flags |= ATA_TFLAG_DEVICE | ATA_TFLAG_ISADDR;
>> +		tf.protocol = ATA_PROT_NODATA;
>> +		tf.command = ATA_CMD_SLEEP;
>> +		err_mask = ata_exec_internal(dev, &tf, NULL, DMA_NONE, NULL, 0, 0);
>> +		ata_dev_info(dev, "PuiS detected, putting drive to sleep");
>
> I already commented that this is not following the ACS specifications and thus
> should not be done. So again, nack.

It is #if 0'd out.  I also addressed this in the cover letter.  Sure,
this shouldn't be done by default, but I don't see a problem with
leaving it as an option that can be activated by those whose drives
don't have a problem with this.

