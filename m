Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0594C25D637
	for <lists+linux-ide@lfdr.de>; Fri,  4 Sep 2020 12:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730111AbgIDK3M (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 4 Sep 2020 06:29:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:47196 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730114AbgIDK3H (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Fri, 4 Sep 2020 06:29:07 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 16A6DB7FC;
        Fri,  4 Sep 2020 10:29:07 +0000 (UTC)
Subject: Re: [PATCH 16/19] ataflop: use a separate gendisk for each media
 format
To:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Denis Efremov <efremov@linux.com>,
        "David S. Miller" <davem@davemloft.net>,
        Song Liu <song@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
        Finn Thain <fthain@telegraphics.com.au>,
        Michael Schmitz <schmitzmic@gmail.com>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-m68k@lists.linux-m68k.org
References: <20200903080119.441674-1-hch@lst.de>
 <20200903080119.441674-17-hch@lst.de>
From:   Hannes Reinecke <hare@suse.de>
Message-ID: <d0bb8f40-3d6b-9011-d266-6a2c35efbd46@suse.de>
Date:   Fri, 4 Sep 2020 12:29:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200903080119.441674-17-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 9/3/20 10:01 AM, Christoph Hellwig wrote:
> The Atari floppy driver usually autodetects the media when used with the
> ormal /dev/fd? devices, which also are the only nodes created by udev.
> But it also supports various aliases that force a given media format.
> That is currently supported using the blk_register_region framework
> which finds the floppy gendisk even for a 'mismatched' dev_t.  The
> problem with this (besides the code complexity) is that it creates
> multiple struct block_device instances for the whole device of a
> single gendisk, which can lead to interesting issues in code not
> aware of that fact.
> 
> To fix this just create a separate gendisk for each of the aliases
> if they are accessed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/block/ataflop.c | 135 +++++++++++++++++++++++++---------------
>   1 file changed, 86 insertions(+), 49 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer
