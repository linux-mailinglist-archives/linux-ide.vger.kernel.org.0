Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC02AE94F
	for <lists+linux-ide@lfdr.de>; Tue, 10 Sep 2019 13:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730866AbfIJLkn (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 10 Sep 2019 07:40:43 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41040 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728639AbfIJLkn (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 10 Sep 2019 07:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=yXVy9dCi226M4vyhx2/txlbO49z4M8e8HH4lwLWPQUw=; b=W258womIDohQSez70d/3XwH7H
        3wJbnTE9gSOlOhf1dwfxX4ulkfR96Pfj53zHy5JULFi/xpcRkFH8K2u6eedNnxvEMlR/zFJIT+tZa
        xb07jo9jcKVUTbk7GpDlJiZcdZ58IZrLB+Iz/iVO9QFfQuY5t9Cpe44YjQq37lQe5nz/uhZT65pMD
        gFRdX23dxiNZMKk/H/+jtahFSMPyCjH6kefxvRAoHtJwvdAolJKNWOh39ouUYiZ+1rBDF6JVtUPzw
        Q6NR51mTI1jgBqu3Z7DGI+LUsChxyX6VR/LPdpkeTOjdMqNjI0Kml6ejyjbvKIUl+yHbts4PU4HEK
        Sbm38pYgg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1i7eVm-00032k-0k; Tue, 10 Sep 2019 11:40:42 +0000
Date:   Tue, 10 Sep 2019 04:40:41 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Jorge Fernandez Monteagudo <jorgefm@cirsa.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        "tj@kernel.org" <tj@kernel.org>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>
Subject: Re: SATA errors accessing hidden partitions
Message-ID: <20190910114041.GA7030@infradead.org>
References: <AM6PR10MB33991CE19828429C676C0296A1C40@AM6PR10MB3399.EURPRD10.PROD.OUTLOOK.COM>
 <AM6PR10MB339928C6DF7AF88789F904EFA1B70@AM6PR10MB3399.EURPRD10.PROD.OUTLOOK.COM>
 <20190910055333.GA32641@infradead.org>
 <AM6PR10MB339977CEF9AB4C3726AF3124A1B60@AM6PR10MB3399.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR10MB339977CEF9AB4C3726AF3124A1B60@AM6PR10MB3399.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

udev through libblkid usually tries to find the file system uuid/label
for each partition, so that is my guess.
