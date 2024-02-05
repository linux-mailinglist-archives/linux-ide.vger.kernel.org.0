Return-Path: <linux-ide+bounces-470-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9837C84A54E
	for <lists+linux-ide@lfdr.de>; Mon,  5 Feb 2024 21:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 548EB28656A
	for <lists+linux-ide@lfdr.de>; Mon,  5 Feb 2024 20:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9721776D8;
	Mon,  5 Feb 2024 19:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O6kXftEm"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683501776B5;
	Mon,  5 Feb 2024 19:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707159852; cv=none; b=ES5bbzOT7hmbE496tYqS3j2x6rDtxL39gIpnXT1ttiXuAk6C7Jr5jfxnZMSDqwdAO29mnxFRbvivX7mbNj7UNmcupBkxEs3x0QKkSzTYYSS3J4t7x2fiHpo3LcIPB3OAwpDYo/Y5yNDXRvdfXpHFdVomZCXoZagTaAYXCa+EudM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707159852; c=relaxed/simple;
	bh=2X0beJ3dmfA+cwC1iXbunu8iUPuukUKOrL3cq5ZA8ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKhTphoDpQhJGDYKUmJJXEjudGmTwQxJT/drI2+ynBEHVCKlDcrx7fE4Oxs9d/aalVBN3IytnaJ/imBJ2ZH3JOX9XHONgXe1NUJR67hHSChVvli4/ihH1qcTQ8saZQnrjdPOSOuA5mBj/cL026gpY6oat1RreOX2XOYq6TMnLKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=fail (0-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O6kXftEm reason="key not found in DNS"; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86EDC43390;
	Mon,  5 Feb 2024 19:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707159852;
	bh=2X0beJ3dmfA+cwC1iXbunu8iUPuukUKOrL3cq5ZA8ZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6kXftEmZt88bUw7oY5hwJO7FkNgG4CMBIovD9bFMkEdvyreCT5wOXXY6p+g7JCcj
	 cRFiP1u1RfnxRnpptOV2tuwbdamFRyS7gjilqdG294w/iijjfSkYhdgIhWMeX1eSNy
	 hFQ/x2ANYijUICx9HH2FRZ7bnSA6GuJKL00he7AY=
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

