Return-Path: <linux-ide+bounces-456-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B6D84A538
	for <lists+linux-ide@lfdr.de>; Mon,  5 Feb 2024 21:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C420289CDC
	for <lists+linux-ide@lfdr.de>; Mon,  5 Feb 2024 20:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FACE175672;
	Mon,  5 Feb 2024 19:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KKiJoKcN"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCC4174EAE;
	Mon,  5 Feb 2024 19:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707159850; cv=none; b=FPwJg9F2CTJwECFY/fW/zANm6Wib3mhYAzUGbTdKrlkxRbseY9+krnykfvNnSvH3jUU1TMgdIIugyvCguIt+ACrCg+Ulm656ohXTmgucbecM85hu30v04pSZU5V5NYvj01DZX24gatRRvWq7gq4YSJPCmZhFGnBy0Bbop5ou2Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707159850; c=relaxed/simple;
	bh=2X0beJ3dmfA+cwC1iXbunu8iUPuukUKOrL3cq5ZA8ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmZJVbu2MCL0+qbIFsWlAPnL+5ovmKKBKUMcBBVMN2mA69hJ3rt8ZGSZ70syH22cJ8AIYEEDW7TgYQu9X0PZP3KJBxkrEegvt2RCbmNeJo2iJ/+EVvQGc6MKZPBzUsaP0Zkw9VBAJOfccpJtCG0Z2vLSYfnqNewoMn1Dk6SlXAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=fail (0-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KKiJoKcN reason="key not found in DNS"; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7DCCC3278E;
	Mon,  5 Feb 2024 19:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707159850;
	bh=2X0beJ3dmfA+cwC1iXbunu8iUPuukUKOrL3cq5ZA8ZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKiJoKcNSZNzeFU8frS2NzdZ6dX9p2Jr1fVNFKDL0ClEXMa2Da3IMQgGFdChq8Dcq
	 rvvufbbCNYDt+EMGO3X6QHqXsL1eXQ2dAcNiB46GSqXrCEw1aLoRlgcXYupPVgSATl
	 o9DN1RUgsP5fFhaqOo/Gbx5S5oQ7Fos+tZO5O2YE=
Date: Mon, 5 Feb 2024 04:51:19 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ata: pata_parport: make pata_parport_bus_type const
Message-ID: <2024020516-decipher-unvaried-202a@gregkh>
References: <20240204-bus_cleanup-ata-v1-1-2bdc1fadf356@marliere.net>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240204-bus_cleanup-ata-v1-1-2bdc1fadf356@marliere.net>

On Sun, Feb 04, 2024 at 12:23:29PM -0300, Ricardo B. Marliere wrote:
> Now that the driver core can properly handle constant struct bus_type,
> move the pata_parport_bus_type variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

