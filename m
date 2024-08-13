Return-Path: <linux-ide+bounces-2082-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACCC9504BD
	for <lists+linux-ide@lfdr.de>; Tue, 13 Aug 2024 14:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DF1E1C22103
	for <lists+linux-ide@lfdr.de>; Tue, 13 Aug 2024 12:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9881991BF;
	Tue, 13 Aug 2024 12:15:55 +0000 (UTC)
X-Original-To: linux-ide@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52DC1991C2;
	Tue, 13 Aug 2024 12:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723551355; cv=none; b=UWeFKwiceG4dsP/PRrPh2CJmWweZKp4ppOiGFBr5wJsdZyRrYop/NFwtmMtzSTWo1EzDdBDSjJhcvDRgh0Q0rImDKGNQuaOiffbI7C/bKwV/+n53xMb8b4vIe6TFLyMpueN0B1hgLGjyLhlXvUJbJ5L+k4ulZtad2GbKBNwJBCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723551355; c=relaxed/simple;
	bh=wns1s25YuH5WzQooGp/ZYkEe0h4ZGBi5Ab73N8l3vm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wv+24U8v+f8UmWevT7qpdXY1O4tZO4V87ci8MM4aecaMiy4z3ZpzqJMvLFrXxb/SRSnRQVkhCZUiY2+plakDmJ66p2a3jo4tXS79M9myYlD8qUk+duJrTRHNENJWe0lU2u2ndIFWGzreKhsGM13yFOUyNSSI77PnEIjszS2Aaq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 96B1B227A87; Tue, 13 Aug 2024 14:15:49 +0200 (CEST)
Date: Tue, 13 Aug 2024 14:15:49 +0200
From: Christoph Hellwig <hch@lst.de>
To: Niklas Cassel <cassel@kernel.org>
Cc: Hannes Reinecke <hare@suse.de>, Damien Le Moal <dlemoal@kernel.org>,
	Igor Pylypiv <ipylypiv@google.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	stable@vger.kernel.org, Stephan Eisvogel <eisvogel@seitics.de>,
	Christian Heusel <christian@heusel.eu>, linux-ide@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] ata: libata-core: Return sense data in descriptor
 format by default
Message-ID: <20240813121549.GB4559@lst.de>
References: <20240812151517.1162241-2-cassel@kernel.org> <ZrpXu_vfI-wpCFVc@ryzen.lan> <3d3beb8d-4c93-4eef-b3ee-c92eb9df9009@suse.de> <ZrsqSA7P30vss6b9@x1-carbon.wireless.wdc>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrsqSA7P30vss6b9@x1-carbon.wireless.wdc>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Aug 13, 2024 at 11:41:28AM +0200, Niklas Cassel wrote:
> Perhaps we could re-visit this code to be spec compliant again in the
> future (after the bad programs have been fixed).

I doubt it.  They are part of the core low-level userspace suite and
even when they are fixed the old version will be around roughly forever.
So I think we are (unfortunately) stuck here.


