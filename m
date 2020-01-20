Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFF7C142C52
	for <lists+linux-ide@lfdr.de>; Mon, 20 Jan 2020 14:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgATNkq (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 20 Jan 2020 08:40:46 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:56852 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgATNkq (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 20 Jan 2020 08:40:46 -0500
Received: from localhost (82-95-191-104.ip.xs4all.nl [82.95.191.104])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 84A0B14EAD059;
        Mon, 20 Jan 2020 05:40:43 -0800 (PST)
Date:   Mon, 20 Jan 2020 14:40:42 +0100 (CET)
Message-Id: <20200120.144042.1810086369376110530.davem@davemloft.net>
To:     dan.carpenter@oracle.com
Cc:     linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] cmd64x: potential buffer overflow in
 cmd64x_program_timings()
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200107130441.y3owvcnxdljailt5@kili.mountain>
References: <20200107130441.y3owvcnxdljailt5@kili.mountain>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 20 Jan 2020 05:40:44 -0800 (PST)
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 7 Jan 2020 16:04:41 +0300

> The "drive->dn" value is a u8 and it is controlled by root only, but
> it could be out of bounds here so let's check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
