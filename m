Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F44961EAB6
	for <lists+linux-ide@lfdr.de>; Mon,  7 Nov 2022 06:50:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbiKGFuE (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 7 Nov 2022 00:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbiKGFuD (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 7 Nov 2022 00:50:03 -0500
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B9CB7D4;
        Sun,  6 Nov 2022 21:50:02 -0800 (PST)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 5A92C68BFE; Mon,  7 Nov 2022 06:50:00 +0100 (CET)
Date:   Mon, 7 Nov 2022 06:50:00 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc:     linux-ide@vger.kernel.org, linux-block@vger.kernel.org,
        Jens Axboe <axboe@kernel.dk>,
        "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v5 5/7] ata: libata: Fix FUA handling in
 ata_build_rw_tf()
Message-ID: <20221107055000.GD28873@lst.de>
References: <20221107005021.1327692-1-damien.lemoal@opensource.wdc.com> <20221107005021.1327692-6-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107005021.1327692-6-damien.lemoal@opensource.wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Mon, Nov 07, 2022 at 09:50:19AM +0900, Damien Le Moal wrote:
> Finally, since the block layer should never issue a FUA read
> request, warn in ata_build_rw_tf() if we see such request.

Couldn't this be triggered using SG_IO passthrough with a SCSI 
WRITE* command that has the FUA bit set?
