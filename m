Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6C35EBE90
	for <lists+linux-ide@lfdr.de>; Tue, 27 Sep 2022 11:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbiI0J2a (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 27 Sep 2022 05:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiI0J23 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 27 Sep 2022 05:28:29 -0400
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 906E113CFA
        for <linux-ide@vger.kernel.org>; Tue, 27 Sep 2022 02:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1664270908; x=1695806908;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=FJfRhQ/qYpbI+dUU91SXe/FSHU5KaDon0o0huRIUO7U=;
  b=nzRIg+xd0edxiziWHxgmB2T0GZ9DW3h92nxCWYRuKwfCD6MON4PdSS9Y
   +4HxMS/a8QK5FCf+64P4w3dqTJSKNOE8DVxHuVmPnkAo8ynbMTmB3sAL0
   iYuaekbBuTepSK+ydPGmvYUZjx5t3Bc6bCs6nAxB/roGQz1MptONqQ1RY
   MODPwhjX+q7eyAbiPtdQ6dc13xNDx7NQqp3AnBuSv91+dejDB31wGaRKX
   DIDp/zGmp592TUyYfv2eS9vbv3Rkkv4REO125vYTdZ7bpJ0BG2As0lDDX
   QMbFYTzALX22Pcpp/XI3ndapq0U4fwXiLOxI7aubjI+oUlNS/AqIEgwK+
   w==;
X-IronPort-AV: E=Sophos;i="5.93,349,1654531200"; 
   d="scan'208";a="212786234"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 17:28:27 +0800
IronPort-SDR: w0RUiCAZBi07h0/FNDJhdF4lsjMnJKRLJitstU2SnCPqnv712e0BmR1AQtiTZPB6R3EWy1MHlI
 oZwlxEuNr3Mx8DfhYXxi/yFvGZQ3w7kM/390zDuulrxAxhlgUyRz4HS8A7ylarRSomlVzAXKLG
 11ZiDAqK6RHoWSI2DgdC5ZBMK+bq4K42cm5M+o5sHYH5ffFLc7Ih1RGDPr+Ln+8jS9PAtWvZF/
 kXk2dAdAgc63v+irO+X59gley9HhbZDIYHtaXzGaj1vKfjD/sSU4bUfPEvUDcb86HuX2SZEjWX
 uhGJYB7++xn74hibEdHLslRo
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Sep 2022 01:42:52 -0700
IronPort-SDR: MzmKb0mlxkOlPvnHc8ZbYQ3EZIbnAANwH7ofY1Qy9EHllwbWD3IRtMl0rVy0npQQR2r/O5s3mK
 7LJOd5ZLEbZ4QHy6P/UN9wtJp6XAKuAFlro2WT1pHgz8bYfrFWpJ9d/t1WpNct0H/fRK+vtNPx
 MFLIOnf3aA4mzImz/i8SmezbXnZOKFpkzPhG8ITrl5Mv6Nj0VXM3BKtLYpSDQstUT2mAjdvKGN
 nZGBvOfSclikKTcsk4sHWieHonfZEDGtY5D4EBqv4tKlnErHOnB6YN5p7gyulmYtznY7T+dAmL
 cd0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Sep 2022 02:28:27 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4McDnl1BfXz1RvTp
        for <linux-ide@vger.kernel.org>; Tue, 27 Sep 2022 02:28:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1664270906; x=1666862907; bh=FJfRhQ/qYpbI+dUU91SXe/FSHU5KaDon0o0
        huRIUO7U=; b=AqT1mPC/UO+IzwPT3ZSpgSYWMawBTRNH5hmObg+dzGnjcwTUBg8
        jku8yzITIOMMM/ScsV9I9EKwm/4s8oVqPRsjrqNoxPJ02xl14xMz7lhuOkdv3LBL
        JSB9YbKdXKs9Y3Bp0or3gHTnv/FXqJiXBTHUQDMQM+KyW8PI82FoUoP+f0EkI5Gp
        uxV1QsBvPPngp1yk8x9uLeU+opFefpKS7BrgEyyRKevNp9aqn3oitDV9EqLhcyOE
        OvydV2hw0CvV9NPigPmP0u8bFg/0wvkBX31nkU9JYPPShOj6ptliY4n1MHvThVvc
        aoLXlFHJhAwLY1VgF9XcZCtz3/3oYomIPew==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id lmNu9vVqRq_B for <linux-ide@vger.kernel.org>;
        Tue, 27 Sep 2022 02:28:26 -0700 (PDT)
Received: from [10.225.163.91] (unknown [10.225.163.91])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4McDnk1GRhz1RvLy;
        Tue, 27 Sep 2022 02:28:25 -0700 (PDT)
Message-ID: <60721293-14e2-98be-37af-ce7c1b227f44@opensource.wdc.com>
Date:   Tue, 27 Sep 2022 18:28:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 2/2] ata: libata-sata: Fix device queue depth control
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>, linux-ide@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>
References: <20220925230817.91542-1-damien.lemoal@opensource.wdc.com>
 <20220925230817.91542-3-damien.lemoal@opensource.wdc.com>
 <5bab7eb9-7b91-8c06-e8c3-f2076bac78dc@huawei.com>
 <92d87d6c-9bd0-0cf9-1ced-bac104ea2d66@opensource.wdc.com>
 <f3e90970-5153-f6bc-5be8-c2c379be0d7f@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <f3e90970-5153-f6bc-5be8-c2c379be0d7f@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 9/27/22 16:05, John Garry wrote:
> On 27/09/2022 00:05, Damien Le Moal wrote:
>>>> ata_scsi_find_dev() returns NULL, turning
>>>> __ata_change_queue_depth() into a nop, which prevents the user from
>>>> setting the maximum queue depth of ATA devices used with libsas based
>>>> HBAs.
>>>>
>>>> Fix this by renaming __ata_change_queue_depth() to
>>>> ata_change_queue_depth() and adding a pointer to the ata_device
>>>> structure of the target device as argument. This pointer is provided by
>>>> ata_scsi_change_queue_depth() using ata_scsi_find_dev() in the case of
>>>> a libata managed device and by sas_change_queue_depth() using
>>>> sas_to_ata_dev() in the case of a libsas managed ata device.
>>> This seems ok. But could you alternatively use ata_for_each_dev() and
>>> match by ata_device.sdev pointer? That pointer is set quite late in the
>>> probe, though, so maybe it would not work.
>> Not sure I understand why we should search for the ata device again using
>> ata_for_each_dev() when sas_to_ata_dev() gives us directly what we need
>> for the libsas controlled device... Can you clarify ?
>>
> 
> Sure, we can use sas_to_ata_dev() to get the ata_device.
> 
> I am just suggesting my way such that we can have a consistent method to 
> get the ata_device between all libata users and we don't need to change 
> the ata_change_queue_depth() interface. It would be something like:
> 
> struct ata_device *ata_scsi_find_dev(struct ata_port *ap, const struct 
> scsi_device *scsidev)
> {
> 	struct ata_link *link;
> 	struct ata_device *dev;
> 
> 	ata_for_each_link(link, ap, EDGE) {
> 		ata_for_each_dev(dev, link, ENABLED) {
> 			if (scsidev == dev->sdev)
> 				return dev;
> 		}
> 	}
> 	// todo: check pmp
> 	return NULL;
> }

I see. Need to think about this one... This may also unify the pmp case.
Are you OK with the patch as is though ? We can improve with something
like the above on top later. Really need to fix that qd setting as it is
causing problems for testing devices with/without ncq commands.

> 
> Thanks,
> John

-- 
Damien Le Moal
Western Digital Research

