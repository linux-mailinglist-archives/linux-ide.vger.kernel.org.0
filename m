Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02D2F67F29C
	for <lists+linux-ide@lfdr.de>; Sat, 28 Jan 2023 01:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbjA1AGT (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 27 Jan 2023 19:06:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231354AbjA1AGS (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 27 Jan 2023 19:06:18 -0500
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724618663E
        for <linux-ide@vger.kernel.org>; Fri, 27 Jan 2023 16:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1674864377; x=1706400377;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qpsLZl3XfB7ISoBS1D9tniK7neGzYnXTla4dex4pM7Q=;
  b=RThrc4MQKI5AoK7n7Sggw8+uv/5K3yzxqOMD8T/COjjMz/I6LEdYml2F
   0PC9JO8MG/4F0sot9LvODBhCMJ0AsHX8rX27Zb8z0nUHwhMTu+HrQMy9X
   QDNayx+ZEIKLdADSBiVFuBFIRXPAS0NwydR9S+hIwkkbrUK+sG3mbf/Ue
   b2DHpOT/BLYGVLO2Nxlo1NQZ6d3q/HKi4xDipf+vgRzqgDt0I9loDmI/B
   53mGvMyGT1EeRkT8q18+UerKSEEqXHqdUmWAi6HJF1QwWCCcqNpm805jI
   VZUru2ms761wp83TbeuPpdwqZbrFwcmJbgqiLHuIPGZ3T7bBXenQy55X3
   A==;
X-IronPort-AV: E=Sophos;i="5.97,252,1669046400"; 
   d="scan'208";a="326235299"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2023 08:06:16 +0800
IronPort-SDR: YbrM7ZlXVG3vrPYgybDwaOH38IUSMA+RS5IvDq05M8TK4qvRB74nfjNtac5jgRfzOHBnoop5L6
 Y1NC0f5wRxxXrFOJcQ5Us4YCjCg8sgbFlqin0TKE/tFtIeYXWvsS1Gc9++PeEvakqYpOoIe+Di
 Tlt5tFhSEPvDZtevGIbuFroythkcyfBnqsbjfRvjzAWcvtU5um4ZOAgh4In15ytxELt8/AulPC
 m7hoN+vrseCzMQS3G/Vwk4Utvp9PPcyZ6ZU9Cc6cbdiofqNztXJslu7tzMnZYGVxJ1bMpbd1IR
 xSE=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jan 2023 15:18:01 -0800
IronPort-SDR: pm2GUXX+zJmrpaNpu2QkcFWWj5UK5HKd1+bX+4BK6QqmPAYGWMIfmDSr3BLs1qhAih0Vzrnep1
 iPx08UtQaLdywlZvaaLZgJVW1ETVQWWKJt2osb8KhFDr4fBNCA0qqZL2cfIFdlcxyfkbgih/89
 WiwGe/30RTGdhSmfYSzixvN4LBXI3SRhSVL9/ubvfKkJJoPjr1v4p64qo3ZoNG6a0NNfn37hQl
 os0+WYe4GM1AU1ARKRotyr9Cw1NRAu8H1EDECkNqbPlX+XgkikEF5PVGs5VHwkc83DVGncUKf+
 v+A=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jan 2023 16:06:17 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P3ZVJ1g8Nz1RvTr
        for <linux-ide@vger.kernel.org>; Fri, 27 Jan 2023 16:06:16 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1674864375; x=1677456376; bh=qpsLZl3XfB7ISoBS1D9tniK7neGzYnXTla4
        dex4pM7Q=; b=ZMcnU0EhVtQuRB+oBWXGRcST04KcSqV95UojdMdzNCMOtSNLele
        QSUDnJVJuEKoq/yXEFKCDQW5mf4fKeMq8eidYgTlMMQbt2z812xAA6P941u+NuJA
        /AWATt4ZAZd3JQENfxfOkMB3V7rjSarjSk0Q0+nzHdkuKw31vjSsUX11qh7Ut0ub
        OitOvdlIGrwMeoQpX0nlpqBmi1BoXS3TsX6uEyY++yzU+M/4ntxlvEDfgCHNEAWB
        lKbsB40J+zkgjWhRcWO5SdR/NRgDra+95EZuA/cOZrh4oAXVz0mwGLKB24P+DPVF
        xKq8TdbDpOOf3rjDT05sYSrjLl0vNgV5DRw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Ns7m5GIdF9S3 for <linux-ide@vger.kernel.org>;
        Fri, 27 Jan 2023 16:06:15 -0800 (PST)
Received: from [10.225.163.66] (unknown [10.225.163.66])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P3ZVG0bkYz1RvLy;
        Fri, 27 Jan 2023 16:06:13 -0800 (PST)
Message-ID: <235b901f-4468-0e6b-4a7e-e285d4d31ba9@opensource.wdc.com>
Date:   Sat, 28 Jan 2023 09:06:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 09/18] scsi: sd: handle read/write CDL timeout failures
Content-Language: en-US
To:     Hannes Reinecke <hare@suse.de>,
        Niklas Cassel <niklas.cassel@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Christoph Hellwig <hch@lst.de>, linux-scsi@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-block@vger.kernel.org
References: <20230124190308.127318-1-niklas.cassel@wdc.com>
 <20230124190308.127318-10-niklas.cassel@wdc.com>
 <f4cca0e6-9c3b-5f0a-c125-fb3960d35e5e@suse.de>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <f4cca0e6-9c3b-5f0a-c125-fb3960d35e5e@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 1/28/23 00:34, Hannes Reinecke wrote:
> On 1/24/23 20:02, Niklas Cassel wrote:
>> Commands using a duration limit descriptor that has limit policies set
>> to a value other than 0x0 may be failed by the device if one of the
>> limits are exceeded. For such commands, since the failure is the result
>> of the user duration limit configuration and workload, the commands
>> should not be retried and terminated immediately. Furthermore, to allow
>> the user to differentiate these "soft" failures from hard errors due to
>> hardware problem, a different error code than EIO should be returned.
>>
>> There are 2 cases to consider:
>> (1) The failure is due to a limit policy failing the command with a
>> check condition sense key, that is, any limit policy other than 0xD.
>> For this case, scsi_check_sense() is modified to detect failures with
>> the ABORTED COMMAND sense key and the COMMAND TIMEOUT BEFORE PROCESSING
>> or COMMAND TIMEOUT DURING PROCESSING or COMMAND TIMEOUT DURING
>> PROCESSING DUE TO ERROR RECOVERY additional sense code. For these
>> failures, a SUCCESS disposition is returned so that
>> scsi_finish_command() is called to terminate the command.
>>
>> (2) The failure is due to a limit policy set to 0xD, which result in the
>> command being terminated with a GOOD status, COMPLETED sense key, and
>> DATA CURRENTLY UNAVAILABLE additional sense code. To handle this case,
>> the scsi_check_sense() is modified to return a SUCCESS disposition so
>> that scsi_finish_command() is called to terminate the command.
>> In addition, scsi_decide_disposition() has to be modified to see if a
>> command being terminated with GOOD status has sense data.
>> This is as defined in SCSI Primary Commands - 6 (SPC-6), so all
>> according to spec, even if GOOD status commands were not checked before.
>>
>> If scsi_check_sense() detects sense data representing a duration limit,
>> scsi_check_sense() will set the newly introduced SCSI ML byte
>> SCSIML_STAT_DL_TIMEOUT. This SCSI ML byte is checked in
>> scsi_noretry_cmd(), so that a command that failed because of a CDL
>> timeout cannot be retried. The SCSI ML byte is also checked in
>> scsi_result_to_blk_status() to complete the command request with the
>> BLK_STS_DURATION_LIMIT status, which result in the user seeing ETIME
>> errors for the failed commands.
>>
>> Co-developed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
>> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
>> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
>> ---
>>   drivers/scsi/scsi_error.c | 46 +++++++++++++++++++++++++++++++++++++++
>>   drivers/scsi/scsi_lib.c   |  4 ++++
>>   drivers/scsi/scsi_priv.h  |  1 +
>>   3 files changed, 51 insertions(+)
>>
>> diff --git a/drivers/scsi/scsi_error.c b/drivers/scsi/scsi_error.c
>> index cf5ec5f5f4f6..9988539bc348 100644
>> --- a/drivers/scsi/scsi_error.c
>> +++ b/drivers/scsi/scsi_error.c
>> @@ -536,6 +536,7 @@ static inline void set_scsi_ml_byte(struct scsi_cmnd *cmd, u8 status)
>>    */
>>   enum scsi_disposition scsi_check_sense(struct scsi_cmnd *scmd)
>>   {
>> +	struct request *req = scsi_cmd_to_rq(scmd);
>>   	struct scsi_device *sdev = scmd->device;
>>   	struct scsi_sense_hdr sshdr;
>>   
>> @@ -595,6 +596,22 @@ enum scsi_disposition scsi_check_sense(struct scsi_cmnd *scmd)
>>   		if (sshdr.asc == 0x10) /* DIF */
>>   			return SUCCESS;
>>   
>> +		/*
>> +		 * Check aborts due to command duration limit policy:
>> +		 * ABORTED COMMAND additional sense code with the
>> +		 * COMMAND TIMEOUT BEFORE PROCESSING or
>> +		 * COMMAND TIMEOUT DURING PROCESSING or
>> +		 * COMMAND TIMEOUT DURING PROCESSING DUE TO ERROR RECOVERY
>> +		 * additional sense code qualifiers.
>> +		 */
>> +		if (sshdr.asc == 0x2e &&
>> +		    sshdr.ascq >= 0x01 && sshdr.ascq <= 0x03) {
>> +			set_scsi_ml_byte(scmd, SCSIML_STAT_DL_TIMEOUT);
>> +			req->cmd_flags |= REQ_FAILFAST_DEV;
>> +			req->rq_flags |= RQF_QUIET;
>> +			return SUCCESS;
>> +		}
>> +
>>   		if (sshdr.asc == 0x44 && sdev->sdev_bflags & BLIST_RETRY_ITF)
>>   			return ADD_TO_MLQUEUE;
>>   		if (sshdr.asc == 0xc1 && sshdr.ascq == 0x01 &&
>> @@ -691,6 +708,15 @@ enum scsi_disposition scsi_check_sense(struct scsi_cmnd *scmd)
>>   		}
>>   		return SUCCESS;
>>   
>> +	case COMPLETED:
>> +		if (sshdr.asc == 0x55 && sshdr.ascq == 0x0a) {
>> +			set_scsi_ml_byte(scmd, SCSIML_STAT_DL_TIMEOUT);
>> +			req->cmd_flags |= REQ_FAILFAST_DEV;
>> +			req->rq_flags |= RQF_QUIET;
>> +			return SUCCESS;
> 
> You can kill this line, will be done anyway.
> 
>> +		}
>> +		return SUCCESS;
>> +
>>   	default:
>>   		return SUCCESS;
>>   	}
>> @@ -785,6 +811,14 @@ static enum scsi_disposition scsi_eh_completed_normally(struct scsi_cmnd *scmd)
>>   	switch (get_status_byte(scmd)) {
>>   	case SAM_STAT_GOOD:
>>   		scsi_handle_queue_ramp_up(scmd->device);
>> +		if (scmd->sense_buffer && SCSI_SENSE_VALID(scmd))
>> +			/*
>> +			 * If we have sense data, call scsi_check_sense() in
>> +			 * order to set the correct SCSI ML byte (if any).
>> +			 * No point in checking the return value, since the
>> +			 * command has already completed successfully.
>> +			 */
>> +			scsi_check_sense(scmd);
> 
> I am every so slightly nervous here.
> We never checked the sense code for GOOD status, so heaven knows if 
> there are devices out there which return something here.
> And you have checked that we've cleared the sense code before submitting 
> (or retrying, even), right?

We'll double check that.


-- 
Damien Le Moal
Western Digital Research

