Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46F6D62B32
	for <lists+linux-ide@lfdr.de>; Mon,  8 Jul 2019 23:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732473AbfGHVqn (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 8 Jul 2019 17:46:43 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:33112 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730589AbfGHVqn (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 8 Jul 2019 17:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=0vwb6NsTT/42xOMsofXKD+jwaS4l8bfpqevV/Xr0/ME=; b=pBnT4H9ziLLotanB0wRDQzP1M
        aUviTtvFKHEToRkmLgsZbNC5NsbBRXI9hMmh0CmL6hjpFxk0ngjf6aHBviSbTzKLp5BBUNxLMzZVf
        PxVvGKSqZWk1MPuyv8Ki+O7h/sxVjjjpqp6MYeMP2cfZD4jVorQ03bX5zWiHzkQrCfQFehi8mvyWS
        8btgPKBa9E6+SMZjvYtH1Ich/gQ6aJLGHO7qNNHB8fUR9P68tyt/H3cmOOZQspMtc6qEltXApmx+5
        OYhDX058VY3TRa0bZmzJ0wvNfp3Pq3bG6PbX+tLYJp0Rgc7AcqPWGIR1dPTrSxXrp5qOa6RXbbuMF
        EcAf0CsPw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hkbT8-0004S9-Cz; Mon, 08 Jul 2019 21:46:42 +0000
Date:   Mon, 8 Jul 2019 14:46:42 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Max Staudt <max-linux@enpas.org>
Cc:     linux-ide@vger.kernel.org
Subject: Re: Legacy IDE driver for Buddha IDE is still in use
Message-ID: <20190708214642.GA12227@infradead.org>
References: <6c74d6b1-1dad-e76e-6499-b677991c40c4@enpas.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c74d6b1-1dad-e76e-6499-b677991c40c4@enpas.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi Max,

Linux 5.1 and newer have a libata driver for the Buddha controller
(drivers/ata/pata_buddha.c, CONFIG_PATA_BUDDHA).  Please check if
that works for you and if not report back to the list.
