Return-Path: <linux-ide+bounces-316-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E87D383A3A9
	for <lists+linux-ide@lfdr.de>; Wed, 24 Jan 2024 09:01:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A176C293C53
	for <lists+linux-ide@lfdr.de>; Wed, 24 Jan 2024 08:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3EB171B8;
	Wed, 24 Jan 2024 08:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OShcSokr"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851DA171AA;
	Wed, 24 Jan 2024 08:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706083305; cv=none; b=Cbt7TyzTchEREYS49aEby4+wBwwPyWjIhtECvG7tvjgPKj6jRxAyQpSK1B5gG/U0bA/pvQA7fqbl/s/lTe2xtZJ6fqxOkNLX+bvIepTdSiQuu6iGzfj51tQRYMOyH0D6anWy5Zpprd2S4G0Y++HoPMzZO+E33T8CpQ4O4838zCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706083305; c=relaxed/simple;
	bh=SUZ9Qd+Fkx0RnIhKJ2sG4i2sQF6fqBSEix6TvqfFoVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrDInyI0Pv/h8/aP1hv2bh0XsxihhXXxjGypdSFH0iVc7WmLJPW/sDfvZgEIfujbNU5fCD1ZTFw8sDImUBpyYCU+J5XtwaG1uVuYid2HiGGtQ5sHNjvpGoRkNJyxBxIEJGk57ARp+FapeVW6z6jK5cJlFLaNZc81JT5WHdlZjAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OShcSokr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E21C433F1;
	Wed, 24 Jan 2024 08:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706083305;
	bh=SUZ9Qd+Fkx0RnIhKJ2sG4i2sQF6fqBSEix6TvqfFoVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OShcSokrmB8f6G+ACujuztrNKnp3zhf6lXeaOKG+aR9gdUWW4HmnW6EG+SZYEwhbb
	 I8QdqFRvDY/2A88Xc5AW+8kSfUlLF5ZEsrLVTnSS1szrdk2rvBOTaZ13+Vuxxlnqaj
	 zZtvZceSmJrQLJ3goN16CDudpULCWA9BocEqR4XMd8BQYQHzb7i8qZ6XbkVt2kX/NP
	 ofTxLUcPjkog8SVEKb+MdvdeAQALtp0OX4dSRx5aZRS4M8/ZfEdG8Rqz1EkCSiYQHM
	 1R8C3s1glppe8cQDYVTZIQXBLfD/OIs0e+VV7mwef7cLPCV3OswdWDxY3n62kVbMXi
	 ZWnr7C2l9RWlQ==
Date: Wed, 24 Jan 2024 09:01:38 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Conrad Kostecki <conikost@gentoo.org>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	dlemoal@kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH] ahci: asm1166: correct count of reported ports
Message-ID: <ZbDD4nBeCHAK3Wqp@x1-carbon>
References: <20240123183002.15499-1-conikost@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123183002.15499-1-conikost@gentoo.org>

On Tue, Jan 23, 2024 at 07:30:02PM +0100, Conrad Kostecki wrote:
> The ASM1166 SATA host controller always reports wrongly,
> that it has 32 ports. But in reality, it only has six ports.
> 
> This seems to be a hardware issue, as all tested ASM1166
> SATA host controllers reports such high count of ports.
> 
> Example output: ahci 0000:09:00.0: AHCI 0001.0301
> 32 slots 32 ports 6 Gbps 0xffffff3f impl SATA mode.
> 
> By adjusting the port_map, the count is limited to six ports.
> 
> New output: ahci 0000:09:00.0: AHCI 0001.0301
> 32 slots 32 ports 6 Gbps 0x3f impl SATA mode.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=211873
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218346
> Signed-off-by: Conrad Kostecki <conikost@gentoo.org>
> ---

Applied:
https://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git/log/?h=for-6.8-fixes

