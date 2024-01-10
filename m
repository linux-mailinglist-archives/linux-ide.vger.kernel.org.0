Return-Path: <linux-ide+bounces-178-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B70F826FDE
	for <lists+linux-ide@lfdr.de>; Mon,  8 Jan 2024 14:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF4781F22586
	for <lists+linux-ide@lfdr.de>; Mon,  8 Jan 2024 13:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF18544C86;
	Mon,  8 Jan 2024 13:30:22 +0000 (UTC)
X-Original-To: linux-ide@vger.kernel.org
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEB544C9D
	for <linux-ide@vger.kernel.org>; Mon,  8 Jan 2024 13:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thesusis.net
Received: by vps.thesusis.net (Postfix, from userid 1000)
	id 49C441524E0; Mon,  8 Jan 2024 08:30:20 -0500 (EST)
From: Phillip Susi <phill@thesusis.net>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH 1/3] libata: avoid waking disk for several commands
In-Reply-To: <14fbc9fa-0876-23c7-b4d3-46a431c2de40@omp.ru>
References: <87msthdo11.fsf@vps.thesusis.net>
 <20240107180258.360886-1-phill@thesusis.net>
 <20240107180258.360886-2-phill@thesusis.net>
 <14fbc9fa-0876-23c7-b4d3-46a431c2de40@omp.ru>
Date: Mon, 08 Jan 2024 08:30:20 -0500
Message-ID: <875y04uf4j.fsf@vps.thesusis.net>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sergey Shtylyov <s.shtylyov@omp.ru> writes:

>    Did you run your patches thru scripts/checkpatch.pl? Looking
> at this patch, I think you didn't... :-)

Will do.

>    This can't happen, you forgot:
>
> 		case ATA_CMD_ID_ATA:

Woops.. that must have gotten lost somehow when I was cutting and
pasting to avoid the fallthrough.

