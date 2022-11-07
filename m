Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9438161EEB0
	for <lists+linux-ide@lfdr.de>; Mon,  7 Nov 2022 10:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbiKGJWA (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 7 Nov 2022 04:22:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231735AbiKGJVz (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 7 Nov 2022 04:21:55 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC736477
        for <linux-ide@vger.kernel.org>; Mon,  7 Nov 2022 01:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=vyvvEx8Jx8otptBJMkFxh9hcfJ
        FuEJDe82u6iT3V9M64k+xWnw+Wi2JnpcL53g5yAvT+vUXq4kJ4lh21pF1VBTgJ1PMaFQt1Zcs7j1a
        xYYCxhEkpn4d+3YaRkAFRBnMbTcDiHej9VehHFP0MbxXKsgYQrgCvYoVxblzOqFHrKEffNp3IG2Jr
        4oRTpth+lroH5iPb2z7MODc2KheodxgFMFAco04AsWHcrr6OnQTXf8EdsGfwYPPrDQzM55LgXw9SM
        OWv2oLE11GeglOvMPHTtpBo5ULTxD3RDBGYCSEUffiL8T7QyB8n9V+ik6Vcoaf/3CHqbSokk2UQQz
        iDluY/bQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oryKH-00DDwI-1A; Mon, 07 Nov 2022 09:21:53 +0000
Date:   Mon, 7 Nov 2022 01:21:52 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc:     linux-ide@vger.kernel.org,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Subject: Re: [PATCH v2] ata: libata-scsi: fix SYNCHRONIZE CACHE (16) command
 failure
Message-ID: <Y2jOMOnl2/gpetWh@infradead.org>
References: <20221107040229.1548793-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107040229.1548793-1-shinichiro.kawasaki@wdc.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
