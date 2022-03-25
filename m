Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF61F4E78D2
	for <lists+linux-ide@lfdr.de>; Fri, 25 Mar 2022 17:22:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245440AbiCYQXu (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 25 Mar 2022 12:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359871AbiCYQXt (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 25 Mar 2022 12:23:49 -0400
Received: from mxout03.lancloud.ru (mxout03.lancloud.ru [45.84.86.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E60D76E9
        for <linux-ide@vger.kernel.org>; Fri, 25 Mar 2022 09:22:10 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru A25F920EF2B3
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 2/2] libata: CONFIG_ATA_SYSFS_COMPAT
To:     Hannes Reinecke <hare@suse.de>,
        Damien LeMoal <damien.lemoal@wdc.com>
CC:     <linux-ide@vger.kernel.org>
References: <20220325125624.99929-1-hare@suse.de>
 <20220325125624.99929-3-hare@suse.de>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <f6a971de-d049-9e42-93e8-8253c66e4c8b@omp.ru>
Date:   Fri, 25 Mar 2022 19:22:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220325125624.99929-3-hare@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hello!

On 3/25/22 3:56 PM, Hannes Reinecke wrote:

> Add a config option 'ATA_SYSFS_COMPAT' to create a compatibility
> 'ata' symlink in the PCI device sysfs directory.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
[...]
> diff --git a/drivers/ata/libata-transport.c b/drivers/ata/libata-transport.c
> index e5ed5046b299..29dec89ccc2d 100644
> --- a/drivers/ata/libata-transport.c
> +++ b/drivers/ata/libata-transport.c
> @@ -251,6 +251,39 @@ static int ata_tport_match(struct attribute_container *cont,
>  	return &ata_scsi_transport_template->host_attrs.ac == cont;
>  }
>  
> +#ifdef CONFIG_ATA_SYSFS_COMPAT
> +static int ata_tport_compat_link_add(struct ata_port *ap)
> +{
> +        struct device *dev = &ap->tdev;

   Indent with a tab, please.

> +	struct device *parent = dev->parent;
> +        char compat_name[64];

   Same here. The buffer seems oversized too...

> +
> +	sprintf(compat_name, "ata%d", ap->print_id);

   snprintf(), perhaps?

> +
> +	return sysfs_create_link(&parent->kobj, &dev->kobj, compat_name);
> +}
> +
> +static void ata_tport_compat_link_delete(struct ata_port *ap)
> +{
> +	struct device *dev = &ap->tdev;
> +	struct device *parent = dev->parent;
> +	char compat_name[64];
> +
> +	sprintf(compat_name, "ata%d", ap->print_id);

   snprintf()?

[...]

MBR, Sergey
