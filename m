Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 002EF23B27A
	for <lists+linux-ide@lfdr.de>; Tue,  4 Aug 2020 03:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729206AbgHDBtQ (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 3 Aug 2020 21:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726823AbgHDBtP (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 3 Aug 2020 21:49:15 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D80E5C06174A
        for <linux-ide@vger.kernel.org>; Mon,  3 Aug 2020 18:49:15 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 423A5127928DE;
        Mon,  3 Aug 2020 18:32:30 -0700 (PDT)
Date:   Mon, 03 Aug 2020 18:49:15 -0700 (PDT)
Message-Id: <20200803.184915.1850382418234050518.davem@davemloft.net>
To:     andriy.shevchenko@linux.intel.com
Cc:     linux-ide@vger.kernel.org
Subject: Re: [PATCH v1] ide-acpi: use %*ph to print small buffer
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200730161042.41392-1-andriy.shevchenko@linux.intel.com>
References: <20200730161042.41392-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 03 Aug 2020 18:32:30 -0700 (PDT)
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 30 Jul 2020 19:10:42 +0300

> Use %*ph format to print small buffer as hex string.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied.
