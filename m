Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C61296105B5
	for <lists+linux-ide@lfdr.de>; Fri, 28 Oct 2022 00:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235433AbiJ0WY1 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 27 Oct 2022 18:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235498AbiJ0WYY (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 27 Oct 2022 18:24:24 -0400
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18925B276B
        for <linux-ide@vger.kernel.org>; Thu, 27 Oct 2022 15:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1666909460; x=1698445460;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ghho3uT1wVcKZxAY1waa0VNzE/2MhAyS4Otpt4rMWvA=;
  b=CsErEsT0WHeQcaDsZn33J6vI3bE5ygF6cGAU+KWK82DH8+u57YGPxewm
   +B3Qy2xHTvZ8m8ex29wx5PSWYiDf7MI1VQjTwDA/cUrcr3HSf9xajJw2t
   mYaDum6Fa9jY3U63oRimxo0oFC8eYU2OJ4A8dMvXr7yoRUbWNdFgLpUNl
   O9iUVUVEPEX65PMJQzNJzTEDw1IIgx7SC0MT9WR/d1jXYAFWXHHr7yMEt
   3Wt/Xsrqky+f6bpTmGz9sgGykDc02RBFCrsJObRpU5KFIpBWDW3z38ym+
   kg8JIhMOoEhlJZnwX7CtqFI3guc5MtlAfe5zEl96ciRMF6K5U1A7atZzT
   g==;
X-IronPort-AV: E=Sophos;i="5.95,219,1661788800"; 
   d="scan'208";a="327021780"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2022 06:24:17 +0800
IronPort-SDR: bKuOpyh1atFIqpTVmRqeygB4630tMksmI+jz66lE+6EHVmJ0M/IZ60zOXir53qnUO2ERk80UlW
 S18G91jB1klY09spxC+9g6FzkUsqYt7fSknj5pylFsoqn5q2a5qbqd5XR/FOcTbXjt0pcYqQVB
 PCMtATlVAsyqQcic90ZubY5T0WY3YvXWUYU/3Q8gM1fd18uN7Epu41lljFdl/CsDxCzNgY0CMP
 RJy/fWptfY+bRE1ZAq5Sr15Ufv/znlxyBNSHHUbuBuyXL64WsxYEml/Diab5SUPMTa8gpnSg+q
 ql9Efoc354xIVbDtR14guDlQ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Oct 2022 14:37:55 -0700
IronPort-SDR: MP2F6u52I0/oAYoc9FV3rOXO7hyCqsSRkbuuTO6tTb980qvrU/lBVUoDXpGusuEtna8IldFEv7
 Cv25DOYThEx9d4NzkpnH+TOj6oCwFAIHMtx4y+1YYrSRaeEv8DQ4faAKl4YZgdDc0JA5jw3GfX
 JrwLGYZqWs0WGlytGGELoYtaOPuXfJCfslZeUF1bukzozF6BjbZYQpslSSu/aW4Ms5NHbrwD0Y
 2WUV0A1/v/8U64ofe5rN7Se07XvnyZ+s7jxFtha/n0eg1Iia1G7PjYW8kRr4PRQnhdnhvcadar
 uic=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Oct 2022 15:24:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mz0b51Gl1z1RWy0
        for <linux-ide@vger.kernel.org>; Thu, 27 Oct 2022 15:24:17 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1666909454; x=1669501455; bh=Ghho3uT1wVcKZxAY1waa0VNzE/2MhAyS4Ot
        pt4rMWvA=; b=bGvznl2W4bjII9grpzpVQEqZ24xT5TxtfYtdzHd4mKZtKBkUZQW
        oaijnNjOnvZ3HDRZWs3P6aC/7vJLMuLfoJICJMJ/FjI8zcWaClxMFbrb2MAd7+aX
        MJnbn3hTHMimXiI9yaLCMDr95t0HQW7+EgcdE04wwMyvdc6NrvdevBYM9NBpCE9o
        GdNkDk0Zv4zmpYwaOOoMGP2IGRTmjvb9FCx/HtU6iY+ymusWJIyM3r/8I+pYPkY0
        om0A4Z+Cu4YMCR1uNSvIxptmoivuYtY2qiVHGrD2qQeefVx4iDfu74zgpopVIJNz
        m4xgt67GrTs4XyoULqLb5WHW1gyNKuySKOg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id JWY_99xMe1fN for <linux-ide@vger.kernel.org>;
        Thu, 27 Oct 2022 15:24:14 -0700 (PDT)
Received: from [10.225.163.15] (unknown [10.225.163.15])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mz0b03ZHwz1RvLy;
        Thu, 27 Oct 2022 15:24:12 -0700 (PDT)
Message-ID: <199fa346-5a53-b66d-3964-99dabb858765@opensource.wdc.com>
Date:   Fri, 28 Oct 2022 07:24:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH RFC v3 1/7] ata: libata-scsi: Add
 ata_scsi_queue_internal()
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>, jejb@linux.ibm.com,
        martin.petersen@oracle.com, hare@suse.de, bvanassche@acm.org,
        hch@lst.de, ming.lei@redhat.com, niklas.cassel@wdc.com
Cc:     axboe@kernel.dk, jinpu.wang@cloud.ionos.com,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
        linuxarm@huawei.com
References: <1666693976-181094-1-git-send-email-john.garry@huawei.com>
 <1666693976-181094-2-git-send-email-john.garry@huawei.com>
 <8ed42281-4400-a0ed-92f1-c57b9de726a4@opensource.wdc.com>
 <8280ec1c-c274-ba8d-b533-3316865fe5c1@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <8280ec1c-c274-ba8d-b533-3316865fe5c1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 10/27/22 19:45, John Garry wrote:
> On 27/10/2022 02:42, Damien Le Moal wrote:
>> On 10/25/22 19:32, John Garry wrote:
>>> Add a function to handle queued ATA internal SCSI cmnds - does much the
>>> same as ata_exec_internal_sg() does (which will be fixed up later to
>>> actually queue internal cmnds through this function).
>>>
>>> Signed-off-by: John Garry <john.garry@huawei.com>
>>> ---
>>>   drivers/ata/libata-sata.c |  3 +++
>>>   drivers/ata/libata-scsi.c | 43 +++++++++++++++++++++++++++++++++++++++
>>>   drivers/ata/libata.h      |  3 ++-
>>>   include/linux/libata.h    |  6 ++++++
>>>   4 files changed, 54 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/ata/libata-sata.c b/drivers/ata/libata-sata.c
>>> index b6806d41a8c5..e8b828c56542 100644
>>> --- a/drivers/ata/libata-sata.c
>>> +++ b/drivers/ata/libata-sata.c
>>> @@ -1258,6 +1258,9 @@ int ata_sas_queuecmd(struct scsi_cmnd *cmd, struct ata_port *ap)
>>>   {
>>>   	int rc = 0;
>>>   
>>> +	if (blk_mq_is_reserved_rq(scsi_cmd_to_rq(cmd)))
>>> +		return ata_scsi_queue_internal(cmd, ap->link.device);
>>> +
>>>   	if (likely(ata_dev_enabled(ap->link.device)))
>>>   		rc = __ata_scsi_queuecmd(cmd, ap->link.device);
>>>   	else {
>>> diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
>>> index 476e0ef4bd29..30d7c90b0c35 100644
>>> --- a/drivers/ata/libata-scsi.c
>>> +++ b/drivers/ata/libata-scsi.c
>>> @@ -3965,6 +3965,49 @@ static inline ata_xlat_func_t ata_get_xlat_func(struct ata_device *dev, u8 cmd)
>>>   	return NULL;
>>>   }
>>>   
>>> +unsigned int ata_scsi_queue_internal(struct scsi_cmnd *scmd,
>>> +				     struct ata_device *dev)
>>> +{
>>> +	struct ata_link *link = dev->link;
>>> +	struct ata_port *ap = link->ap;
>>> +	struct ata_queued_cmd *qc;
>>> +
>>> +	/* no internal command while frozen */
>>> +	if (ap->pflags & ATA_PFLAG_FROZEN)
>>> +		goto did_err;
>>> +
>>> +	/* initialize internal qc */
>>> +	qc = __ata_qc_from_tag(ap, ATA_TAG_INTERNAL);
>>> +	link->preempted_tag = link->active_tag;
>>> +	link->preempted_sactive = link->sactive;
>>> +	ap->preempted_qc_active = ap->qc_active;
>>> +	ap->preempted_nr_active_links = ap->nr_active_links;
>>> +	link->active_tag = ATA_TAG_POISON;
>>> +	link->sactive = 0;
>>> +	ap->qc_active = 0;
>>> +	ap->nr_active_links = 0;
>>> +
>>> +	if (qc->dma_dir != DMA_NONE) {
>>> +		int n_elem;
>>> +
>>> +		n_elem = 1;
>>> +		qc->n_elem = n_elem;
>>> +		qc->sg = scsi_sglist(scmd);
>>> +		qc->nbytes = qc->sg->length;
>>> +		ata_sg_init(qc, qc->sg, n_elem);
>>> +	}
>>> +
>>> +	scmd->submitter = SUBMITTED_BY_BLOCK_LAYER;
>>> +
>>> +	ata_qc_issue(qc);
>>
>> Arg, no ! This potentially mixes NCQ and non-NCQ commands, which is
>> forbidden by ATA spec. You need to use something like:
>>
>> 	if (ap->ops->qc_defer) {
>> 		if ((rc = ap->ops->qc_defer(qc)))
>> 			goto defer;
>> 	}
>>
>> 	ata_qc_issue(qc);
>>
>> which is done in __ata_scsi_queuecmd() -> ata_scsi_translate()
>>
>> Unless you guarantee that ata_scsi_queue_internal() is always called
>> from libata EH context ?
> 
> This will be called synchronously called from ata_exec_internal_sg(), so 
> the same rules on NCQ vs non-NCQ would apply here. As I see, 
> ata_exec_internal_sg() assumes non-NCQ mode and is not multi-thread safe.

Yep. No thread safety needed as we are always guaranteed to be in EH with
the queue quiesced when this is executed. No other commands can come in at
the same time.

> 
> Thanks,
> John
> 
>>
>>> +
>>> +	return 0;
>>> +did_err:
>>> +	scmd->result = (DID_ERROR << 16);
>>> +	scsi_done(scmd);
>>> +	return 0;
>>> +}
>>> +
>>>   int __ata_scsi_queuecmd(struct scsi_cmnd *scmd, struct ata_device *dev)
>>>   {
>>>   	u8 scsi_op = scmd->cmnd[0];
>>> diff --git a/drivers/ata/libata.h b/drivers/ata/libata.h
>>> index 0c2df1e60768..15cd1cd618b8 100644
>>> --- a/drivers/ata/libata.h
>>> +++ b/drivers/ata/libata.h
>>> @@ -82,7 +82,6 @@ extern int ata_port_probe(struct ata_port *ap);
>>>   extern void __ata_port_probe(struct ata_port *ap);
>>>   extern unsigned int ata_read_log_page(struct ata_device *dev, u8 log,
>>>   				      u8 page, void *buf, unsigned int sectors);
>>> -
>>>   #define to_ata_port(d) container_of(d, struct ata_port, tdev)
>>>   
>>>   /* libata-acpi.c */
>>> @@ -130,6 +129,8 @@ extern int ata_scsi_user_scan(struct Scsi_Host *shost, unsigned int channel,
>>>   void ata_scsi_sdev_config(struct scsi_device *sdev);
>>>   int ata_scsi_dev_config(struct scsi_device *sdev, struct ata_device *dev);
>>>   int __ata_scsi_queuecmd(struct scsi_cmnd *scmd, struct ata_device *dev);
>>> +unsigned int ata_scsi_queue_internal(struct scsi_cmnd *scmd,
>>> +				     struct ata_device *dev);
>>>   
>>>   /* libata-eh.c */
>>>   extern unsigned int ata_internal_cmd_timeout(struct ata_device *dev, u8 cmd);
>>> diff --git a/include/linux/libata.h b/include/linux/libata.h
>>> index 827d5838cd23..8938b584520f 100644
>>> --- a/include/linux/libata.h
>>> +++ b/include/linux/libata.h
>>> @@ -764,7 +764,9 @@ struct ata_link {
>>>   
>>>   	struct device		tdev;
>>>   	unsigned int		active_tag;	/* active tag on this link */
>>> +	unsigned int		preempted_tag;
>>>   	u32			sactive;	/* active NCQ commands */
>>> +	u32			preempted_sactive;
>>>   
>>>   	unsigned int		flags;		/* ATA_LFLAG_xxx */
>>>   
>>> @@ -857,6 +859,10 @@ struct ata_port {
>>>   #ifdef CONFIG_ATA_ACPI
>>>   	struct ata_acpi_gtm	__acpi_init_gtm; /* use ata_acpi_init_gtm() */
>>>   #endif
>>> +
>>> +	u64 preempted_qc_active;
>>> +	int preempted_nr_active_links;
>>> +
>>>   	/* owned by EH */
>>>   	u8			sector_buf[ATA_SECT_SIZE] ____cacheline_aligned;
>>>   };
>>
> 

-- 
Damien Le Moal
Western Digital Research

