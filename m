Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB7486B5AA
	for <lists+linux-ide@lfdr.de>; Wed, 17 Jul 2019 06:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbfGQEz7 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 17 Jul 2019 00:55:59 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50342 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfGQEz7 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 17 Jul 2019 00:55:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=MAfQ16ItayZEkXP0ZfuwmksYBU6cM+hrVNIGtEnzPNM=; b=sri8nXorz94Fq1VCS7x/shc4V
        NJCByH5rxVgLZ1W99agN2rDhaPY6gyr+X3+Y4owdX0A1uJ8K5a3HnwbMH19+qmIye/+iulaRlmCVy
        ngnza8O9lmZQEkfbHQXj74tQxbfsliHj7U+qlO95gd72J4yb33H3eH6GeqPzuDBtBlywhwFCClzhn
        jTFyUnnxZo7mro0UZZ9p3d3nBjJgHcJscEvYusIBpfnOu0Sbt9MoDofHRgYZEx5g8uKwrNoqhiRTK
        YVHolvArgjLPI9PKgClUlL10dBVmWD+PvvZu1up9401HhkggADRxYUEPNsDetWsEMRBKxHDXVUxon
        SOCKzkc8Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hnbyw-0001kk-R0; Wed, 17 Jul 2019 04:55:58 +0000
Date:   Tue, 16 Jul 2019 21:55:58 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Max Staudt <max-linux@enpas.org>
Cc:     linux-ide@vger.kernel.org
Subject: Re: [PATCH] ata/pata_buddha: Probe via modalias instead of initcall
Message-ID: <20190717045558.GA6616@infradead.org>
References: <20190713140241.27076-1-max-linux@enpas.org>
 <179c6a72-dca4-5ca1-5c23-0b54b76fb010@enpas.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179c6a72-dca4-5ca1-5c23-0b54b76fb010@enpas.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Tue, Jul 16, 2019 at 07:18:39PM +0200, Max Staudt wrote:
> I just realised that I didn't CC lkml - shall I resend the patch?

lkml isn't all that important. The linux-m68k list might be more useful
to catch interested parties, though.
