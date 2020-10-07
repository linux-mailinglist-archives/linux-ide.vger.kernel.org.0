Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E9F2862F5
	for <lists+linux-ide@lfdr.de>; Wed,  7 Oct 2020 18:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbgJGQBS (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 7 Oct 2020 12:01:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:45390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728289AbgJGQBS (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Wed, 7 Oct 2020 12:01:18 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DA7F220789;
        Wed,  7 Oct 2020 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602086478;
        bh=8Yut3CM+2WDhsArYRhs4YTEewatkA+I8CO98vKmE7B8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=yNkix8yv+nfXiOvqr5Sh1xGCzqD+U3gsvvWV/Jabdyn0JUaiO6+EbAQoPhrbcMxVN
         jazH1anzQ2uAnGyDlUOdDUvZhJC9FqgCnWTpV7YAdPoGnINInlWNkdooG8QOJTA8nX
         8u6o3mv2ZFOTHyU+w+KTi/etlaBxdWoGWpvz1jzA=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kQBsR-000Phe-R6; Wed, 07 Oct 2020 17:01:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 07 Oct 2020 17:01:15 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     sven.auhagen@voleatech.de
Cc:     axboe@kernel.dk, hdegoede@redhat.com, robh+dt@kernel.org,
        tglx@linutronix.de, gregory.clement@bootlin.com,
        linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, jason@lakedaemon.net, andrew@lunn.ch,
        rjw@rjwysocki.net, viresh.kumar@linaro.org,
        antoine.tenart@bootlin.com, maxime.chevallier@bootlin.com,
        thomas.petazzoni@bootlin.com, miquel.raynal@bootlin.com
Subject: Re: [PATCH 1/7] ata: ahci: mvebu: Rename a platform data flag
In-Reply-To: <20201007154554.66650-2-sven.auhagen@voleatech.de>
References: <20201007154554.66650-1-sven.auhagen@voleatech.de>
 <20201007154554.66650-2-sven.auhagen@voleatech.de>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <5f24cd5774b5e68681fc9c460cc44bec@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: sven.auhagen@voleatech.de, axboe@kernel.dk, hdegoede@redhat.com, robh+dt@kernel.org, tglx@linutronix.de, gregory.clement@bootlin.com, linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, jason@lakedaemon.net, andrew@lunn.ch, rjw@rjwysocki.net, viresh.kumar@linaro.org, antoine.tenart@bootlin.com, maxime.chevallier@bootlin.com, thomas.petazzoni@bootlin.com, miquel.raynal@bootlin.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 2020-10-07 16:45, sven.auhagen@voleatech.de wrote:
> From: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> Before adding more entries in the platform data structure, rename the
> flags entry to be more precise and name it host_flags.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

You are missing your own sign-off, as you are posting someone
else's patch.

         M.
-- 
Jazz is not dead. It just smells funny...
