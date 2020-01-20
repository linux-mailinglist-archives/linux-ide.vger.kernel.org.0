Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 422C7142C45
	for <lists+linux-ide@lfdr.de>; Mon, 20 Jan 2020 14:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727692AbgATNje (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 20 Jan 2020 08:39:34 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:56794 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgATNje (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 20 Jan 2020 08:39:34 -0500
Received: from localhost (82-95-191-104.ip.xs4all.nl [82.95.191.104])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 76D6914EAD04E;
        Mon, 20 Jan 2020 05:39:33 -0800 (PST)
Date:   Mon, 20 Jan 2020 14:39:32 +0100 (CET)
Message-Id: <20200120.143932.1411870038067863233.davem@davemloft.net>
To:     jgq516@gmail.com
Cc:     linux-ide@vger.kernel.org, guoqing.jiang@cloud.ionos.com
Subject: Re: [PATCH] ide: remove unnecessary touch_softlockup_watchdog
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190926131344.12709-1-guoqing.jiang@cloud.ionos.com>
References: <20190926131344.12709-1-guoqing.jiang@cloud.ionos.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 20 Jan 2020 05:39:34 -0800 (PST)
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: jgq516@gmail.com
Date: Thu, 26 Sep 2019 15:13:44 +0200

> From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
> 
> Call touch_softlockup_watchdog before touch_nmi_watchdog is not needed,
> since touch_softlockup_watchdog is called inside touch_nmi_watchdog.
> 
> Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>

Applied.
