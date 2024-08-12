Return-Path: <linux-ide+bounces-2075-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F0294F6E5
	for <lists+linux-ide@lfdr.de>; Mon, 12 Aug 2024 20:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1009128328E
	for <lists+linux-ide@lfdr.de>; Mon, 12 Aug 2024 18:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626CE18C330;
	Mon, 12 Aug 2024 18:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rUpQJOwR"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2FF18953F;
	Mon, 12 Aug 2024 18:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723488392; cv=none; b=t8ce/q51SyP1kfv65kq4hmQGNsroviru++I/khdQYFwcHxxLwdE6X+bCGBVltWU+mPUzt740t63ROWwc/ApOAXyE6yGEFge8djOfVPgF+TVjbPU5+k/BXcmjUzOaWhtCp/X+Wz/tfTpdCv+8tzNyj5/XTu9b03LSQUnArRhRjKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723488392; c=relaxed/simple;
	bh=MAaBxjXBYblJNMGE5R3ewlQIuRpbS3rakxRtkueomPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jafX4z+ZMuCcSxj98P5dzC0GvoJKofH/ImDJuWTgAyePUSCXooy+ce0qMQse7eGlF0zRl8zWwZvRHri8/0gBitU6B0hoN/UTs0qyZafncJQuOxccs9oOmahXDA5kT1vd2YhbrhpE6yixNBH228+Moa30yl+W75M79vfXeSjKu3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rUpQJOwR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31B6C32782;
	Mon, 12 Aug 2024 18:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723488391;
	bh=MAaBxjXBYblJNMGE5R3ewlQIuRpbS3rakxRtkueomPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rUpQJOwR7bTT1lBQRAe4sH6bSYJyQXj8MdtATkq01/QCwwq4lXzBsQF3jDjplUdcK
	 Q0AxrLiazbFu3T1v3rwOExN45VYUfEyEHkHTQA3vFQ9HLAT1tzWXnkgmKLfjTB/Jbx
	 HKWJ7qepCDCrP68imsZzTux5d5+X0RnqppANQwI38S6pBxCdoKJ+B32pyziN9p9OWS
	 O3jeq8dHaoGclOLRvZ87Wtkbu97ae3oR1ZHcTEVXRiV7z9KdxitV5zASAYpas0llmG
	 ng8hvV/flXBeuj7JDij3kuiHwGKbtSuT5bRt6Ff80IXAMluoBvNmFzJNYkMTjcoHZ5
	 XgdBqHzwyZG3A==
Date: Mon, 12 Aug 2024 20:46:26 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
	Igor Pylypiv <ipylypiv@google.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
	stable@vger.kernel.org, Stephan Eisvogel <eisvogel@seitics.de>,
	Christian Heusel <christian@heusel.eu>, linux-ide@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] ata: libata-core: Return sense data in descriptor format
 by default
Message-ID: <ZrpYgus_-bL5K3aY@ryzen.lan>
References: <20240812151517.1162241-2-cassel@kernel.org>
 <ZrpXu_vfI-wpCFVc@ryzen.lan>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrpXu_vfI-wpCFVc@ryzen.lan>

On Mon, Aug 12, 2024 at 08:43:07PM +0200, Niklas Cassel wrote:
> 
> Thus, perhaps it is safest to just drop this patch, and let users of
> passthrough commands (SG_IO) simply learn how to parse sense data properly,
> since there will/can always be someone complaining. My personal feeling is
> that passthrough commands should simply follow the storage standard exactly,
> and if a user space application does adhere to the standard, tough luck,

s/does adhere/does not adhere/

