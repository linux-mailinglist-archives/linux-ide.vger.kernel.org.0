Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74CDF3EC820
	for <lists+linux-ide@lfdr.de>; Sun, 15 Aug 2021 10:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236800AbhHOITa (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 15 Aug 2021 04:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236733AbhHOITa (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 15 Aug 2021 04:19:30 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B8AC061764
        for <linux-ide@vger.kernel.org>; Sun, 15 Aug 2021 01:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=EiqLLdtsGW1aEMjhSLHdXtuYmLXmAWT8eWpNdYDyOv0=; b=bFgwqfUL+NSjtVNt+14QbLuBdu
        yhEjdAB1n0qx8m73YlWQ8oysJkrgVEHWwjftkouL7/LlNVhtBpBCH4dl4mJDvNTg4fm5p0xDr3FmZ
        Zmo/uWEMyilfmE7nvuvzAf3abXecOMOtqD9S9IRXAIx91iiYl/ijtPKQmxXyRXb+x1z8Rlpf6/FHv
        0h6eC8T0bjqzwaUdRWQEfRVNwpwC0u5lNWoPiifkhFf+cVAK3ZHHTT2aJ26aDGPFaw08YLWJqxWhU
        YbL+T7jU3LdllvqTqHVug5UxmYzNc3AnR4+scANb9J3+wOMzovGheH2ITC4APT/TTTVvSXBi8/80u
        TFY5HX5Q==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mFBLu-00HXm9-HP; Sun, 15 Aug 2021 08:18:47 +0000
Date:   Sun, 15 Aug 2021 09:18:42 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Reimar D??ffinger <Reimar.Doeffinger@gmx.de>
Cc:     linux-ide@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] libata: add kernel parameter to force
 ATA_HORKAGE_NO_DMA_LOG
Message-ID: <YRjN4oULwmNKI/yi@infradead.org>
References: <20210814134709.16085-1-Reimar.Doeffinger@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210814134709.16085-1-Reimar.Doeffinger@gmx.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Please just add quirks for the affected setups instead of requiring
the user to pass an obscure parameter.

