Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B02F33E2A75
	for <lists+linux-ide@lfdr.de>; Fri,  6 Aug 2021 14:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243064AbhHFMSL (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 6 Aug 2021 08:18:11 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:20459 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243158AbhHFMSL (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 6 Aug 2021 08:18:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1628252275; x=1659788275;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=SJfdML0BSAQ0tVRPaucFqAXczI6I+ZlB7NK8GnOvlig=;
  b=WL9U4uxc34rk4SI3foD3MBwFPzjurNTHtZn3/3ykBcbzlkDarWwwk5xA
   87dLsh52cOLq276FOXww4LxlJFxvGNO/iK29xuk3uXA2+WsqQcd3bvwrl
   VGhSp0eJP7Ig8ORMZiTTpwYnPeVuYKJqRjCsMgEvRvbtbdHrtZdAvZrYv
   3oFYcHcz54cnjS6nFDUONOA85D2FXJ4+yZXkP7iHFBxF3yAoVfHI/l3u2
   KupePOEKNag3x1ZLSjmLsHdeJU7Dsj+9XFY6turvvo72aQ7Cg29QaKdxV
   TFQHd52KY9q0uqAIF3zUoKPa1Qpl8izWWH5TFCw6YOOGmJG9gWWJ6OnsJ
   g==;
X-IronPort-AV: E=Sophos;i="5.84,300,1620662400"; 
   d="scan'208";a="288062038"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 06 Aug 2021 20:17:55 +0800
IronPort-SDR: c7uRn9gXisiJHFjiyViZrm8J+RQtf7IKhxmXEZ9u0AgV5V1zWU9XdvAMGEUp7adnsK+9wC/tcS
 gORdIXq7eki2L/EOVvvPW/PGrG6ZCNOwep7OJZLKFiPEy0NSsC5VNmrs32Xy8t4Ye4WrJ7lk1F
 yg1sy8Bqqsj7tgzVIYTfTaod5YBmflGFjH/OyyLgwLAboD3ppUHuV4M0hv6jv+ja482pNX3QLa
 bHjcgi8Z4wMt18weusb10RZRhChTDaTiEfrsrzVaINAQLnsaME/K0qb6fWvFu50QtWwmYE6I7s
 q0qW28rhXhyDhjz6A65a2vxn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2021 04:53:31 -0700
IronPort-SDR: 57YeR9sLt3VCbgP5aPM1om6zqic8kiaN/3g0hSakQClYKnqmCYKnS5L8LDFf0A768QeM6sP1o8
 5OCR4EG3U0gdPbBPvr5GeDG9Y8yZUl7+/rEqDO94A3+z0sGHdMUJvpMQmMObm0ju6GlB2gl2rl
 I48x9X6AaR9kSInSVP7caa4v3+tEarOXuCDbGaDpIpOqO+ue1xh3T7ngWlMaLke7N7ehK0akpm
 8l5uwtPd4XeAFtujt9X/5TO2k991ukpTeS14AcXluCYJMIiY6vn7SjpEAUc7hl72s8sEZtduw1
 4vw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2021 05:17:56 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gh4Hl0ShMz1RvlR
        for <linux-ide@vger.kernel.org>; Fri,  6 Aug 2021 05:17:55 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-language
        :content-type:in-reply-to:mime-version:user-agent:date
        :message-id:organization:from:references:to:subject; s=dkim; t=
        1628252274; x=1630844275; bh=SJfdML0BSAQ0tVRPaucFqAXczI6I+ZlB7NK
        8GnOvlig=; b=jlPhfYWBudjLi6/l7MPWFTMsZvqJ8IbMfrpzuUgW9QyzB+50nGK
        8s/RxCZ6jJyd23W+QsM4CDHUxCtytNM88S9KHfiFEO7clrHV4xt5rV3iSH5QIonE
        hQntIUzeUoKgGZU4ELpBa4YrDMT+pP7124m6Md4IMeauH1h8Up7g7UFZfe5fv5kB
        Zudouhw0f4Cbr5Z/jdgmsfXkmqZ3mG0by5Q5G44+h38b82kFWJTKXNxxJdcCAXrq
        hKrT6vbqw1OdxboH+r+8kvklyhli3QLNgMrja02nHSmJ0vIkxjyr0kkeH+qNkWN/
        1k5x8bvnunMXA51KCsbXM72Rd+nFYhtTJ+g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id xz6yfD-LCksB for <linux-ide@vger.kernel.org>;
        Fri,  6 Aug 2021 05:17:54 -0700 (PDT)
Received: from [10.225.48.54] (unknown [10.225.48.54])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gh4Hh4l9Yz1RvlC;
        Fri,  6 Aug 2021 05:17:52 -0700 (PDT)
Subject: Re: [PATCH v3 8/9] libahci: Introduce ncq_prio_supported sysfs
 sttribute
To:     Hannes Reinecke <hare@suse.de>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
        linux-ide@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org
Cc:     Sathya Prakash <sathya.prakash@broadcom.com>,
        Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
        Suganath Prabu Subramani 
        <suganath-prabu.subramani@broadcom.com>
References: <20210806111145.445697-1-damien.lemoal@wdc.com>
 <20210806111145.445697-9-damien.lemoal@wdc.com>
 <9ba3574f-3b46-d80e-1ff9-29a7af27cc22@suse.de>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital
Message-ID: <d25a6af0-abfd-afc3-7ae6-63349b964656@opensource.wdc.com>
Date:   Fri, 6 Aug 2021 21:17:50 +0900
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <9ba3574f-3b46-d80e-1ff9-29a7af27cc22@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 2021/08/06 20:37, Hannes Reinecke wrote:
> On 8/6/21 1:11 PM, Damien Le Moal wrote:
>> Currently, the only way a user can determine if a SATA device supports
>> NCQ priority is to try to enable the use of this feature using the
>> ncq_prio_enable sysfs device attribute. If enabling the feature fails,
>> it is because the device does not support NCQ priority. Otherwise, the
>> feature is enabled and indicates that the device supports NCQ priority.
>>
>> Improve this odd interface by introducing the read-only
>> ncq_prio_supported sysfs device attribute to indicate if a SATA device
>> supports NCQ priority. The value of this attribute reflects if the
>> device flag ATA_DFLAG_NCQ_PRIO is set or cleared.
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>  drivers/ata/libahci.c     |  1 +
>>  drivers/ata/libata-sata.c | 24 ++++++++++++++++++++++++
>>  include/linux/libata.h    |  1 +
>>  3 files changed, 26 insertions(+)
>>
>> diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
>> index fec2e9754aed..5b3fa2cbe722 100644
>> --- a/drivers/ata/libahci.c
>> +++ b/drivers/ata/libahci.c
>> @@ -125,6 +125,7 @@ EXPORT_SYMBOL_GPL(ahci_shost_attrs);
>>  struct device_attribute *ahci_sdev_attrs[] = {
>>  	&dev_attr_sw_activity,
>>  	&dev_attr_unload_heads,
>> +	&dev_attr_ncq_prio_supported,
>>  	&dev_attr_ncq_prio_enable,
>>  	NULL
>>  };
>> diff --git a/drivers/ata/libata-sata.c b/drivers/ata/libata-sata.c
>> index dc397ebda089..5566fd4bb38f 100644
>> --- a/drivers/ata/libata-sata.c
>> +++ b/drivers/ata/libata-sata.c
>> @@ -834,6 +834,30 @@ DEVICE_ATTR(link_power_management_policy, S_IRUGO | S_IWUSR,
>>  	    ata_scsi_lpm_show, ata_scsi_lpm_store);
>>  EXPORT_SYMBOL_GPL(dev_attr_link_power_management_policy);
>>  
>> +static ssize_t ata_ncq_prio_supported_show(struct device *device,
>> +					   struct device_attribute *attr,
>> +					   char *buf)
>> +{
>> +	struct scsi_device *sdev = to_scsi_device(device);
>> +	struct ata_port *ap = ata_shost_to_port(sdev->host);
>> +	struct ata_device *dev;
>> +	bool ncq_prio_supported;
>> +	int rc = 0;
>> +
>> +	spin_lock_irq(ap->lock);
>> +	dev = ata_scsi_find_dev(ap, sdev);
>> +	if (!dev)
>> +		rc = -ENODEV;
>> +	else
>> +		ncq_prio_supported = dev->flags & ATA_DFLAG_NCQ_PRIO;
>> +	spin_unlock_irq(ap->lock);
>> +
>> +	return rc ? rc : sysfs_emit(buf, "%u\n", ncq_prio_supported);
>> +}
>> +
>> +DEVICE_ATTR(ncq_prio_supported, S_IRUGO, ata_ncq_prio_supported_show, NULL);
>> +EXPORT_SYMBOL_GPL(dev_attr_ncq_prio_supported);
>> +
>>  static ssize_t ata_ncq_prio_enable_show(struct device *device,
>>  					struct device_attribute *attr,
>>  					char *buf)
>> diff --git a/include/linux/libata.h b/include/linux/libata.h
>> index b23f28cfc8e0..a2d1bae7900b 100644
>> --- a/include/linux/libata.h
>> +++ b/include/linux/libata.h
>> @@ -539,6 +539,7 @@ typedef void (*ata_postreset_fn_t)(struct ata_link *link, unsigned int *classes)
>>  extern struct device_attribute dev_attr_unload_heads;
>>  #ifdef CONFIG_SATA_HOST
>>  extern struct device_attribute dev_attr_link_power_management_policy;
>> +extern struct device_attribute dev_attr_ncq_prio_supported;
>>  extern struct device_attribute dev_attr_ncq_prio_enable;
>>  extern struct device_attribute dev_attr_em_message_type;
>>  extern struct device_attribute dev_attr_em_message;
>>
> Alternative would have been to make the 'ncq_prio_enable' attribute
> visible only when NCQ prio is supported, but not sure if that works out.

Indeed. But from the start (4.10) ncq_prio_enable is always shown, even for
devices that do not support NCQ prio. I am not sure if changing that is
acceptable as this is a user IF.

> 
> So:
> 
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> 
> Cheers,
> 
> Hannes
> 


-- 
Damien Le Moal
Western Digital Research
