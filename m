Return-Path: <linux-ide+bounces-630-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29616860AE6
	for <lists+linux-ide@lfdr.de>; Fri, 23 Feb 2024 07:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D341B1F2196B
	for <lists+linux-ide@lfdr.de>; Fri, 23 Feb 2024 06:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E5F4414;
	Fri, 23 Feb 2024 06:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P84pCgAK"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D7512B6A
	for <linux-ide@vger.kernel.org>; Fri, 23 Feb 2024 06:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708670431; cv=none; b=AbV38KbvcXG3cLqqe5q+WEI4HyCSwTa3ZbVjz7ksXDnQjEmAWgGsqATreWer3kN+Nd+PfU9pEWE7pLdCX3ARxsDPvkM/+vW7FjitQOETj2HCn22qyjYH4CIB0qgMLzdWA1Qq+uoaw7LDVwqpk2h2I1OKG1FbRhuYOG2/6cf8PaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708670431; c=relaxed/simple;
	bh=ql4o9KxyWAWPrpwzbv+TwDequkParPqXWzRixX6voFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOhTW/LYIrID5g6YqxafIc0brPZWOaigK23ghhIeytCrHUAsS6EeGPqxbcz6QeSvmkTdp8nAD7v+aYgjmGgHV2EbJtNrreoiuQ/VQ0VyZiRnCgxRw3wVBDriYLHjrm6AA2o6t3S9q5Wr9yUhlMPpTcWSi3o/UFkLZfvQdPwS3yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P84pCgAK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3254C433C7;
	Fri, 23 Feb 2024 06:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708670430;
	bh=ql4o9KxyWAWPrpwzbv+TwDequkParPqXWzRixX6voFk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P84pCgAKgu4ymPKX2KPcy7hZd2eQ3Zu3DGTjE1AMN97oPIQBNrhsVtEss9CpJB2Bf
	 JKpu9+32Kp8xmDSMRxXSCDkAmyk5Xa/DYSA7ol2EK+UzdyjBaPJdVTAwxwYlU32QVO
	 UjK4ToVKRcb/7W51liBIKlYn8rZUAv2F8L6ztmqfdmEUm6cL1wl95MO2hty/BOXEMf
	 WKhcUmBh9lLKjfa+5kxQCHAKROqWltUVcNKu66+GrCLpKvxowd3pcYYqbyV0DU4ees
	 ee+++n+5kL8UHpCkTkSvxOpOoVBEwNEez9zQnWJZLtngyaMLhq+fre/fkmCJBxhEb6
	 hJ4Whjcukx15A==
Message-ID: <c1b5f55c-7baf-41fc-b0be-05585321ed0d@kernel.org>
Date: Fri, 23 Feb 2024 15:40:29 +0900
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libata-sata: Check SDB_FIS for completion of DMA transfer
 before completing the commands.
Content-Language: en-US
To: Saurav Kashyap <skashyap@marvell.com>, linux-ide@vger.kernel.org
Cc: soochon@google.com, Manoj Phadtare <mphadtare@marvell.com>
References: <20240223060752.4926-1-skashyap@marvell.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240223060752.4926-1-skashyap@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/23/24 15:07, Saurav Kashyap wrote:
> Sequence leading to an issue as per PCIe trace
> - PxSact is read with slots 7 and 24 being cleared.
> - Host starts processing these commands while data is not in system
>   memory yet.
> - Last pkt of 512B was sent to host.
> - SDB.FIS is copied, telling host command slot 24 is done.

And send patches to the maintainers as well as to the list.

scripts/get_maintainer.pl drivers/ata/

-- 
Damien Le Moal
Western Digital Research


