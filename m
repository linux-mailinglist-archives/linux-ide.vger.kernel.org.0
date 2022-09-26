Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B64505EA734
	for <lists+linux-ide@lfdr.de>; Mon, 26 Sep 2022 15:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234104AbiIZN3B (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 26 Sep 2022 09:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234857AbiIZN2d (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 26 Sep 2022 09:28:33 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562151DB551;
        Mon, 26 Sep 2022 04:53:04 -0700 (PDT)
Received: from fraeml715-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MbgWk6NTHz684m2;
        Mon, 26 Sep 2022 19:29:22 +0800 (CST)
Received: from lhrpeml500003.china.huawei.com (7.191.162.67) by
 fraeml715-chm.china.huawei.com (10.206.15.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 13:31:22 +0200
Received: from [10.48.156.245] (10.48.156.245) by
 lhrpeml500003.china.huawei.com (7.191.162.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 12:31:21 +0100
Message-ID: <5bab7eb9-7b91-8c06-e8c3-f2076bac78dc@huawei.com>
Date:   Mon, 26 Sep 2022 12:31:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 2/2] ata: libata-sata: Fix device queue depth control
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        <linux-ide@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        "Martin K . Petersen" <martin.petersen@oracle.com>
References: <20220925230817.91542-1-damien.lemoal@opensource.wdc.com>
 <20220925230817.91542-3-damien.lemoal@opensource.wdc.com>
From:   John Garry <john.garry@huawei.com>
In-Reply-To: <20220925230817.91542-3-damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.156.245]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500003.china.huawei.com (7.191.162.67)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 26/09/2022 00:08, Damien Le Moal wrote:
> The function __ata_change_queue_depth() uses the helper
> ata_scsi_find_dev() to get the ata_device structure of a scsi device and
> set that device maximum queue depth. However, when the ata device is
> managed by libsas,

Yeah, this current code is utterly broken. Just a nit is that it would 
be good to mention that the sdev id is assigned by scsi_transport_sas 
(and not libata) for when using libsas.

In my series "Allocate SCSI device earlier for ata port probe" I 
mentioned this problem of different id assignment scheme. It would be 
nice to try to commonize this.

> ata_scsi_find_dev() returns NULL, turning
> __ata_change_queue_depth() into a nop, which prevents the user from
> setting the maximum queue depth of ATA devices used with libsas based
> HBAs.
> 
> Fix this by renaming __ata_change_queue_depth() to
> ata_change_queue_depth() and adding a pointer to the ata_device
> structure of the target device as argument. This pointer is provided by
> ata_scsi_change_queue_depth() using ata_scsi_find_dev() in the case of
> a libata managed device and by sas_change_queue_depth() using
> sas_to_ata_dev() in the case of a libsas managed ata device.

This seems ok. But could you alternatively use ata_for_each_dev() and 
match by ata_device.sdev pointer? That pointer is set quite late in the 
probe, though, so maybe it would not work.

As an aside, one other thing I noticed is that ata_device.private_data 
is unused. Maybe we should delete it - apparently it was added just for 
symmetry of libata structures.

Thanks,
John

> 
> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> ---
>   drivers/ata/libata-sata.c           | 24 ++++++++++++------------
>   drivers/scsi/libsas/sas_scsi_host.c |  3 ++-
>   include/linux/libata.h              |  4 ++--
>   3 files changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/ata/libata-sata.c b/drivers/ata/libata-sata.c
> index 7a5fe41aa5ae..13b9d0fdd42c 100644
> --- a/drivers/ata/libata-sata.c
> +++ b/drivers/ata/libata-sata.c
> @@ -1018,26 +1018,25 @@ DEVICE_ATTR(sw_activity, S_IWUSR | S_IRUGO, ata_scsi_activity_show,
>   EXPORT_SYMBOL_GPL(dev_attr_sw_activity);
>   
>   /**
> - *	__ata_change_queue_depth - helper for ata_scsi_change_queue_depth
> - *	@ap: ATA port to which the device change the queue depth
> + *	ata_change_queue_depth - Set a device maximum queue depth
> + *	@ap: ATA port of the target device
> + *	@dev: target ATA device
>    *	@sdev: SCSI device to configure queue depth for
>    *	@queue_depth: new queue depth
>    *
> - *	libsas and libata have different approaches for associating a sdev to
> - *	its ata_port.
> + *	Helper to set a device maximum queue depth, usable with both libsas
> + *	and libata.
>    *
>    */
> -int __ata_change_queue_depth(struct ata_port *ap, struct scsi_device *sdev,
> -			     int queue_depth)
> +int ata_change_queue_depth(struct ata_port *ap, struct ata_device *dev,
> +			   struct scsi_device *sdev, int queue_depth)
>   {
> -	struct ata_device *dev;
>   	unsigned long flags;
>   
> -	if (queue_depth < 1 || queue_depth == sdev->queue_depth)
> +	if (!dev || !ata_dev_enabled(dev))
>   		return sdev->queue_depth;
>   
> -	dev = ata_scsi_find_dev(ap, sdev);
> -	if (!dev || !ata_dev_enabled(dev))
> +	if (queue_depth < 1 || queue_depth == sdev->queue_depth)
>   		return sdev->queue_depth;
>   
>   	/* NCQ enabled? */
> @@ -1059,7 +1058,7 @@ int __ata_change_queue_depth(struct ata_port *ap, struct scsi_device *sdev,
>   
>   	return scsi_change_queue_depth(sdev, queue_depth);
>   }
> -EXPORT_SYMBOL_GPL(__ata_change_queue_depth);
> +EXPORT_SYMBOL_GPL(ata_change_queue_depth);
>   
>   /**
>    *	ata_scsi_change_queue_depth - SCSI callback for queue depth config
> @@ -1080,7 +1079,8 @@ int ata_scsi_change_queue_depth(struct scsi_device *sdev, int queue_depth)
>   {
>   	struct ata_port *ap = ata_shost_to_port(sdev->host);
>   
> -	return __ata_change_queue_depth(ap, sdev, queue_depth);
> +	return ata_change_queue_depth(ap, ata_scsi_find_dev(ap, sdev),
> +				      sdev, queue_depth);
>   }
>   EXPORT_SYMBOL_GPL(ata_scsi_change_queue_depth);
>   
> diff --git a/drivers/scsi/libsas/sas_scsi_host.c b/drivers/scsi/libsas/sas_scsi_host.c
> index 9c82e5dc4fcc..a36fa1c128a8 100644
> --- a/drivers/scsi/libsas/sas_scsi_host.c
> +++ b/drivers/scsi/libsas/sas_scsi_host.c
> @@ -872,7 +872,8 @@ int sas_change_queue_depth(struct scsi_device *sdev, int depth)
>   	struct domain_device *dev = sdev_to_domain_dev(sdev);
>   
>   	if (dev_is_sata(dev))
> -		return __ata_change_queue_depth(dev->sata_dev.ap, sdev, depth);
> +		return ata_change_queue_depth(dev->sata_dev.ap,
> +					      sas_to_ata_dev(dev), sdev, depth);
>   
>   	if (!sdev->tagged_supported)
>   		depth = 1;
> diff --git a/include/linux/libata.h b/include/linux/libata.h
> index 698032e5ef2d..20765d1c5f80 100644
> --- a/include/linux/libata.h
> +++ b/include/linux/libata.h
> @@ -1136,8 +1136,8 @@ extern int ata_scsi_slave_config(struct scsi_device *sdev);
>   extern void ata_scsi_slave_destroy(struct scsi_device *sdev);
>   extern int ata_scsi_change_queue_depth(struct scsi_device *sdev,
>   				       int queue_depth);
> -extern int __ata_change_queue_depth(struct ata_port *ap, struct scsi_device *sdev,
> -				    int queue_depth);
> +extern int ata_change_queue_depth(struct ata_port *ap, struct ata_device *dev,
> +				  struct scsi_device *sdev, int queue_depth);
>   extern struct ata_device *ata_dev_pair(struct ata_device *adev);
>   extern int ata_do_set_mode(struct ata_link *link, struct ata_device **r_failed_dev);
>   extern void ata_scsi_port_error_handler(struct Scsi_Host *host, struct ata_port *ap);

