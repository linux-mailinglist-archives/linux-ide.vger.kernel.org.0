Return-Path: <linux-ide+bounces-1058-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E937895BC2
	for <lists+linux-ide@lfdr.de>; Tue,  2 Apr 2024 20:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BB9EB2171F
	for <lists+linux-ide@lfdr.de>; Tue,  2 Apr 2024 18:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA5060264;
	Tue,  2 Apr 2024 18:31:13 +0000 (UTC)
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DCC2E62E
	for <linux-ide@vger.kernel.org>; Tue,  2 Apr 2024 18:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712082673; cv=none; b=mesrNh2xaP7ViKu3LF8quOrPq+qrBwByiYUG00KBwM7VzI3MuOb3ZgrK2TzvQ8C1DABB9+iDcCQw2Urp4q9eXn3lKORB73DoKFAFejqpHGLkQDvNrhOqaoqQUsQ62Dqc290jNe37xfsOZyisYIS68Bt17xDIzFbbWq5OSLDKYfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712082673; c=relaxed/simple;
	bh=n3KHMC3Dx/hO01fdYfhyEH0qETUSZ2XQDlG2GH3eWg0=;
	h=From:To:Subject:Cc:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b8EpuP1Ft4BqBqnmj1zGjHs13BkSVX+SsmKoYNsa+Pq8Y1Sgihg+tF+1gmUf2ialfEBwzXKKpljXcrW13I7nLYWfbsHcpPjXhR4sfngt5P2oF7V07KH+erkJhYsPtMQT9A7xKDADf1Mkq+pZESUNIwx3F1AvxfasQiZ7/PqtiBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: "Conrad Kostecki" <conikost@gentoo.org>
To: "Damien Le Moal" <dlemoal@kernel.org>, "Niklas Cassel" <cassel@kernel.org>,
 "Szuying Chen" <chensiying21@gmail.com>
Subject: Re[2]: ASMedia PMP inquiry
Cc: linux-ide@vger.kernel.org, Jesse1_Chang@asmedia.com.tw,
 Richard_Hsu@asmedia.com.tw, Chloe_Chen@asmedia.com.tw,
 cryptearth@googlemail.com, temnota.am@gmail.com, hdegoede@redhat.com,
 jnyb.de@gmail.com
Date: Tue, 02 Apr 2024 18:31:05 +0000
Message-Id: <em1188b33c-20bf-4a1b-87a4-626abdf11c3d@acf693bc.com>
In-Reply-To: <07b6a6d4-a9b1-468f-916f-1d4e6b1f92e5@kernel.org>
References: <20240319091322.10909-1-Chloe_Chen@asmedia.com.tw> <ZflnYu5W5WnnzDio@ryzen>
 <emd6ef2021-5996-41a5-97d9-9864d65bb534@e6a850b0.com>
 <07b6a6d4-a9b1-468f-916f-1d4e6b1f92e5@kernel.org>
Reply-To: "Conrad Kostecki" <conikost@gentoo.org>
User-Agent: eM_Client/9.2.2230.0
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello Damien,

Am 22.03.2024 01:00:02, "Damien Le Moal" <dlemoal@kernel.org> schrieb:

>Yes. I will add a libata.force parameter to do that so that setups that do =
not
>use PMPs can avoid long boot times due to probing the broken "virtual port=
s".
>Will post a patch next week for that.
any news for the patch?

Cheers
Conrad

