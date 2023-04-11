Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 106646DD28A
	for <lists+linux-ide@lfdr.de>; Tue, 11 Apr 2023 08:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbjDKGQ6 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 11 Apr 2023 02:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbjDKGQ4 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 11 Apr 2023 02:16:56 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630E9199D;
        Mon, 10 Apr 2023 23:16:52 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id AA54B68BFE; Tue, 11 Apr 2023 08:16:48 +0200 (CEST)
Date:   Tue, 11 Apr 2023 08:16:48 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Niklas Cassel <nks@flawful.org>
Cc:     Jens Axboe <axboe@kernel.dk>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Damien Le Moal <dlemoal@fastmail.com>,
        linux-scsi@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-block@vger.kernel.org, Niklas Cassel <niklas.cassel@wdc.com>
Subject: Re: [PATCH v6 09/19] scsi: allow enabling and disabling command
 duration limits
Message-ID: <20230411061648.GD18719@lst.de>
References: <20230406113252.41211-1-nks@flawful.org> <20230406113252.41211-10-nks@flawful.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406113252.41211-10-nks@flawful.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Thu, Apr 06, 2023 at 01:32:38PM +0200, Niklas Cassel wrote:
> +	/*
> +	 * For ATA devices, CDL needs to be enabled with a SET FEATURES command.
> +	 */
> +	if (is_ata) {

I don't think these hacks have any business in the SCSI layer.  We should
probbaly just do this unconditionally for CDL enabled ATA devices at
probe time.
