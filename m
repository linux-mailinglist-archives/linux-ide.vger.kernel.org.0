Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB303142C54
	for <lists+linux-ide@lfdr.de>; Mon, 20 Jan 2020 14:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgATNku (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 20 Jan 2020 08:40:50 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:56856 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgATNku (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 20 Jan 2020 08:40:50 -0500
Received: from localhost (82-95-191-104.ip.xs4all.nl [82.95.191.104])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 4575B14EAD444;
        Mon, 20 Jan 2020 05:40:49 -0800 (PST)
Date:   Mon, 20 Jan 2020 14:40:47 +0100 (CET)
Message-Id: <20200120.144047.202754056310659523.davem@davemloft.net>
To:     dan.carpenter@oracle.com
Cc:     linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] ide: serverworks: potential overflow in
 svwks_set_pio_mode()
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200107130607.tv3uosduwkw3yka6@kili.mountain>
References: <20200107130441.y3owvcnxdljailt5@kili.mountain>
        <20200107130607.tv3uosduwkw3yka6@kili.mountain>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 20 Jan 2020 05:40:49 -0800 (PST)
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 7 Jan 2020 16:06:07 +0300

> The "drive->dn" variable is a u8 controlled by root.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
