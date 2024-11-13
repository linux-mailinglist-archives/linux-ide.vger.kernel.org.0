Return-Path: <linux-ide+bounces-2734-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A3F9C6752
	for <lists+linux-ide@lfdr.de>; Wed, 13 Nov 2024 03:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27DBBB27A2F
	for <lists+linux-ide@lfdr.de>; Wed, 13 Nov 2024 02:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF3A13C80C;
	Wed, 13 Nov 2024 02:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feOhwpX2"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4E7138490;
	Wed, 13 Nov 2024 02:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731465021; cv=none; b=HHmpLhvn+thFV5fCEV6ecRSB1u8ejohyvX2h5gaDsrFS6zKR/JCFMqPyOYdYUqSH7ebEEWnf9WoZUKMb7H8QHGW2FMWF3YJjXnX9dxeWRAMBU9q+5STMWfXPoPIuDwn0kcX0mZ2wiXRj350qfIxuXIZs3u+if0FcSTfFYw+dc6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731465021; c=relaxed/simple;
	bh=v6OQIy9Hl1pwKmQg3qf6IxbnJp06j/iW9BVgDYe9rrU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hLot9v9P7DARGLY1wylY6PGjfYjVy0qsYChmGfAocwoFPzzZJt+5kYjCVC/P4/S8RTT+2W2JAyyMu1IA/1gnEk15LD30OIZz/hSdzoOZbBlE/V7bJ4Hy69eufGgTkGdre5lW456d3latcxJPSkM4AvPReUYSsQs9Mx3N2Hk+2WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feOhwpX2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75435C4CED4;
	Wed, 13 Nov 2024 02:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731465021;
	bh=v6OQIy9Hl1pwKmQg3qf6IxbnJp06j/iW9BVgDYe9rrU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=feOhwpX290G5stkY6INCBhbBjRetwysewjLmlZvWyfXIJyudi8Mc8GRhbLqHhiTxo
	 UzHVtQdZ/jXB4yNpyZ3zF8EXrmGfA7kuVcCeLtZSyMKuJK8XjZiAsyF+GWDfbMwXmU
	 eC09Klvq9Sq53XneR2Y8JYasFMwd2P+bJN0DM+m12cN+FuhZlGDpGN0ZZV9rCPS8LL
	 JG2C5jXsj6Ep+jMLxFopx1zFXcDjPHEVrEloXPxvjOqEZGh3c4pYwiIETmz4MZDfe0
	 PoR8vLMk/r/FcrLUNVeK+iaQkFV08o3QrpETCrPDH+YUfd0StRQmCWHYueevr5JFut
	 0DMpKIQI+t/eQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB8193809A80;
	Wed, 13 Nov 2024 02:30:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] MAINTAINERS: Re-add cancelled Renesas driver sections
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173146503153.759199.11051453348644644535.git-patchwork-notify@kernel.org>
Date: Wed, 13 Nov 2024 02:30:31 +0000
References: <4b2105332edca277f07ffa195796975e9ddce994.1731319098.git.geert+renesas@glider.be>
In-Reply-To: <4b2105332edca277f07ffa195796975e9ddce994.1731319098.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: gregkh@linuxfoundation.org, paul.barker.ct@bp.renesas.com,
 niklas.soderlund@ragnatech.se, claudiu.beznea.uj@bp.renesas.com,
 yoshihiro.shimoda.uh@renesas.com, James.Bottomley@hansenpartnership.com,
 arnd@arndb.de, sergei.shtylyov@gmail.com, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, horms@kernel.org, cassel@kernel.org,
 niklas.soderlund+renesas@ragnatech.se

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 11 Nov 2024 11:03:21 +0100 you wrote:
> Removing full driver sections also removed mailing list entries, causing
> submitters of future patches to forget CCing these mailing lists.
> 
> Hence re-add the sections for the Renesas Ethernet AVB, R-Car SATA, and
> SuperH Ethernet drivers.  Add people who volunteered to maintain these
> drivers (thanks a lot!), and mark all of them as supported.
> 
> [...]

Here is the summary with links:
  - [v3] MAINTAINERS: Re-add cancelled Renesas driver sections
    https://git.kernel.org/netdev/net/c/2b99b2532593

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



