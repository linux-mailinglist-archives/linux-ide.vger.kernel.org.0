Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDD0319CE0F
	for <lists+linux-ide@lfdr.de>; Fri,  3 Apr 2020 03:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389857AbgDCBHK (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 2 Apr 2020 21:07:10 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:53816 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731783AbgDCBHK (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 2 Apr 2020 21:07:10 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id BC7F512758C66;
        Thu,  2 Apr 2020 18:07:09 -0700 (PDT)
Date:   Thu, 02 Apr 2020 18:07:08 -0700 (PDT)
Message-Id: <20200402.180708.1473370061621820603.davem@davemloft.net>
To:     qiwuchen55@gmail.com
Cc:     linux-ide@vger.kernel.org, chenqiwu@xiaomi.com
Subject: Re: [PATCH] drivers/ide: convert to list_for_each_entry_safe()
From:   David Miller <davem@davemloft.net>
In-Reply-To: <1581671785-25125-1-git-send-email-qiwuchen55@gmail.com>
References: <1581671785-25125-1-git-send-email-qiwuchen55@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 02 Apr 2020 18:07:09 -0700 (PDT)
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: qiwuchen55@gmail.com
Date: Fri, 14 Feb 2020 17:16:25 +0800

> From: chenqiwu <chenqiwu@xiaomi.com>
> 
> Use list_for_each_entry_safe() instead of list_for_each_safe()
> to simplify the code.
> 
> Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>

Applied, thank you.
