Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D00969CDA4
	for <lists+linux-ide@lfdr.de>; Mon, 26 Aug 2019 12:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730241AbfHZK5d (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 26 Aug 2019 06:57:33 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45502 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730199AbfHZK5c (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 26 Aug 2019 06:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Ypx8RhXpItwz9jQAB8bwDgkDsO6VkjqQjWyI/TIh84Q=; b=Lt/SZfshwh5FH0ekbYd6pwz6L
        L4Y8LV8IMdmA+jPI70Gq5n0HcQF9TC4NRdg0mmSTDr1hB2ZnAyM92KyKyZqL/z7nw7cLYS/M8IZsN
        oUfF41iy/PHnPd2LZ7IRfCzGdfUZMkvevHDQjTsCW/4C1Fng1QfJplwWShZx5RbbdqWF4q6Jum6Z3
        xqTnP98Wdp4wvui+kQb7+fpsb5vPyVd6+Pg9zuNMtH+BRZDS0QAeZMUr1M1onF4HNpXE9O7kFeFMq
        EK5XaYQpORprgvducYXK8qvSoG3kEMXS1QoEsp1O+duj3YeFuukZYoFS0XHKX8JHouMlNVGY0yP5g
        Ycub7Q+Cg==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i2Cgi-0007fB-KW; Mon, 26 Aug 2019 10:57:29 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mikael Pettersson <mikpelinux@gmail.com>
Cc:     linux-ide@vger.kernel.org
Subject: libata dma_set_mask cleanups (resend)
Date:   Mon, 26 Aug 2019 12:57:17 +0200
Message-Id: <20190826105725.19405-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi all,

this series makes use of the fact that dma_set_mask now never fails
for a larger than necessary DMA mask, and cleans up various other bits
around dma mask setting.
