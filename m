Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2548360390A
	for <lists+linux-ide@lfdr.de>; Wed, 19 Oct 2022 07:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiJSFEF (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 19 Oct 2022 01:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiJSFED (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 19 Oct 2022 01:04:03 -0400
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA0EC5E328
        for <linux-ide@vger.kernel.org>; Tue, 18 Oct 2022 22:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1666155842; x=1697691842;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IXFGa6cKv7zc3KOCLo6p+PYc9vtKbDc98W1hcgLuLj8=;
  b=ieeDOK2lvdlLP9JbnBPbxR6NS7CVDcHShQ9iAdoayGD9rq5dUHi274l2
   2YnfE39OkYcn+Z+i6naRY4XT6z9M2C8YvU+X9IuQG3TuO6pFXnCC0HaZG
   1SyIiyS0d8nrEVVoyGO7MWFOEYPBOcXxGj6WfK3FKe9JAZU1BYQziG1GC
   /3SXEsiRQ3iUwE9kYhC90nhcB1F4xI0coABdBxjutvrbfIqkuPKPchN6B
   ROoiB0wRJ3oiVsOwzjjvCxOpC9QxOhAYwT/FU1DH7FUVQy5QpC7VgaJzn
   bRubZaJO9xA0UGU6UZIzVqwbokKUYzo13aAT3q1R7PiF3/+w790ic90vF
   w==;
X-IronPort-AV: E=Sophos;i="5.95,195,1661788800"; 
   d="scan'208";a="212511971"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 19 Oct 2022 13:04:00 +0800
IronPort-SDR: jSsL+MhN080coJ77857AJsWnxckOPJcFpiMUWMTDnojSrfo1FlrLhVWj+KmMMsRpOy2NZ4kwMb
 X+RX2PLXANmOiPVvGAKJ7zz23Q9pS0FJ3rVGXPx4i1tgf2fzuJ76djWCY2wPWGZQK2tCuoW/nt
 tx9sNRUjrxfUTqvXiU8D+4aphOHK2hexxEKbdDcegb6Gt+o209oD8PWYXmOAz/uicocsv83gFr
 5fv3au2mp5aXkhTfsxOsEubuRNI0EFV7eVy9qYoy68EV7koQQ/cf+M/Z+wSHZNcVgBgSrHHZAG
 HgbaxhhMgzJpCKiGch2l6KZ3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Oct 2022 21:17:51 -0700
IronPort-SDR: s9264pydjqTaXb0ucfWHrYP0Q9roxhJ4AZq1GtCp5a3VN+Ac0qdbFJ3tglRYPWxHM7NAfy0NxI
 6nwdS3jxnGBgZNH2XgOe6Fw3FmkK+kbVibSCE+9ZElA8GX8+G5rLCzU+/rSLfqnaCnHGzbL2bk
 MV/eqGxSw8yMu4fPBBjZyEreErSivOqqo17kaTqsY0bR1/JjjHvuX5ckegwy7fG4+yeGCpAIrB
 X2H0xWyl14vcWz+sgs0m1buIroMz2xOPJtrrB0xobN0SfEKRUitvlNMmBZgbFNOBNPesBIzVJ5
 ai4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Oct 2022 22:04:01 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MsdtS1JCtz1RwtC
        for <linux-ide@vger.kernel.org>; Tue, 18 Oct 2022 22:04:00 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1666155839; x=1668747840; bh=IXFGa6cKv7zc3KOCLo6p+PYc9vtKbDc98W1
        hcgLuLj8=; b=GhlzFq0DzAEq5npbsmPo5adTGs+8ETlLNTu39hKeX0tlpMLBDUT
        vILgqS82CQWnxIQIZz2vWmCrUy+De2PUiz2mYsB5cLIOBYWOkgRbfAK+xgKcDTJD
        +eDjO1dUkG279i75g7ymLSQukcYZmVwAxdt51gFcoMAS4m93I/vDpYql+QcJjA8I
        UKbVrwYYRXmA/227ECTyI9+qWPXtgtZV+0K2RKUNQ55y9KtHBLPZcvSpRl8jniSH
        881Xgw9ILYhgmHZwrq9aAbz+xiDIvurE9PEXsaNNt1eeSv9yWzB8bEoGG97HFdmd
        AV0XGTm4hUitFBuw05qYRB2PPPUSCMcdJOQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id HFReit_ozbP3 for <linux-ide@vger.kernel.org>;
        Tue, 18 Oct 2022 22:03:59 -0700 (PDT)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MsdtQ3dS9z1RvLy;
        Tue, 18 Oct 2022 22:03:58 -0700 (PDT)
Message-ID: <7e8ef4b4-928f-895f-05ef-df111a052e8e@opensource.wdc.com>
Date:   Wed, 19 Oct 2022 14:03:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: libata and software reset
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>,
        Niklas Cassel <Niklas.Cassel@wdc.com>,
        Hannes Reinecke <hare@suse.de>
Cc:     "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        Xiang Chen <chenxiang66@hisilicon.com>
References: <046e86d2-17e1-e85d-08a1-744ef975171c@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <046e86d2-17e1-e85d-08a1-744ef975171c@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 10/18/22 22:24, John Garry wrote:
> Hi guys,
> 
> In the hisi_sas driver there are times in which we need to issue an ATA
> software reset. For this we use hisi_sas_softreset_ata_disk() ->
> sas_execute_ata_cmd() -> sas_execute_tmf(), which uses libsas "slow
> task" mechanism to issue the command.

Something is wrong here... The reset command sent by that function is
for ATAPI (DEVICE RESET command). There is no device reset command for
SATA disks following the ACS standard.

So hisi_sas_softreset_ata_disk() seems totally bogus to me, unless you
have a CD/DVD drive connected to the HBA :)

This is why the softreset function is a port operation defined by LLDs.
How you reset the device depends on the adapter. E.g., for AHCI, you
need to send a host2device FIS with the software reset bit set.

> 
> I would like if libata provided such a function to issue a software
> reset, such that we can send the command as an ATA queued command.
> 
> The problem is that often when we would want to issue this software
> reset the associated ata port is frozen, like in ATA EH, and so we
> cannot issue ATA queued commands - internal or normal - at that time.
> 
> Is there any way to solve this? Or I am just misunderstanding how and
> when ATA queued commands can and should be used?
> 
> I assume that ata_port_operations.softreset callback requires a method
> to be able to issue the softreset directly from the driver, like
> ahci_softreset() -> ahci_do_softreset() -> ahci_exec_polled_cmd().
> 
> Thanks,
> John

-- 
Damien Le Moal
Western Digital Research

