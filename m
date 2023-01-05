Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3F365E3AC
	for <lists+linux-ide@lfdr.de>; Thu,  5 Jan 2023 04:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbjAEDn2 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 4 Jan 2023 22:43:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjAEDnM (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 4 Jan 2023 22:43:12 -0500
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764E348818
        for <linux-ide@vger.kernel.org>; Wed,  4 Jan 2023 19:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1672890191; x=1704426191;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bweDNHxqzUHjW35G6+M/n7cY0pgRMbvktsjtN47lBE0=;
  b=Iqg8U6S4mI8X8Q49CUiD1ye2TSMeYqvneZRks8tKKufa9JcLwmVZ8R3B
   COPW2A/Uyl8jVI7SxITrXfVa60v/zwGyQQxeiTpBcGbBswpom730hmo6h
   +osCIHkeC697bmkIVF/1aKh2rLkmY+9lccX5sWvgiD5cnpU+2kMZqiZik
   QhPmZ+OrhUMTUpXV+YVioWaRcr1C27BBWh50C/aMteqO39zuPhLk7Maje
   nT1P7aa3U1+JT9pdl+rghmivcdzX6irgy1AVThgQerAbdDz/d0+3CLPOs
   OT8MyK5rZoSBdpegQz2Y32iNqye64tRcXWA0Rh2Vxo48PsW4+Li87V2QU
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,301,1665417600"; 
   d="scan'208";a="332065805"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 05 Jan 2023 11:43:10 +0800
IronPort-SDR: ILvQuwzPJrfcH33gTo4ab64SnJD2JQcvo+6wfxV780ll3geJDe+MH8lbsfn5k07GzBTuEMWPh+
 PtD3YA4CcIz5ZzpwJ+oNW9Hvx5lEXD0y9v0XRtfAcy7SZXuS+mI45j7lmJYUhISNGecLBSTPd9
 UvwEN6PRVv3JUeQ53QM7GX1oxoUHySDGFEueQQ3Rr1nM7fSYYLepupJ597Cj5Iw2LcHjmQ3ueo
 +4X2B4SAAmlkkTiW68kYyeSwvZQZ8vN6gaFtRia/7iCPr+bEUgfHXZfkC4gUElbbdVS+DjRlRZ
 CZc=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Jan 2023 19:01:07 -0800
IronPort-SDR: t8i+V/6cVdG2kidM9vnrLSULy/69SVsstcxUr/2vg7N/feEgiiQrzVvmn4tUAcdxnWoPcpNTql
 fSBcXjahih/p7H1DWJWog6Ezk9ZxlYVfQZOTcmSWT/hEvyAEHS7466DiQ437D+EItPXSlxdOV5
 itNoV5JSsyOgrQNt3sGAJgaUZDTxmfa1QNK/KsQ7quEx7yCBCdaWzxSxV/sAAgn1G2RpI2IbcM
 EtP7Q4hiYAcvQ8RxNN6GnuMMduGPlB1z0obRVKfKptQxgHwGkic8n73CL+Te9BSiay5ncpDfs9
 Y0A=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Jan 2023 19:43:11 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NnXPB3vcgz1RvTp
        for <linux-ide@vger.kernel.org>; Wed,  4 Jan 2023 19:43:10 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:content-language:references:to
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1672890189; x=1675482190; bh=bweDNHxqzUHjW35G6+M/n7cY0pgRMbvktsj
        tN47lBE0=; b=ZGa+sGEvzLgnGQrVmk3+wtgmjPhqATqMYO6IuoDR6wh83r7uOYD
        KuRRnG3oQfUjFH5XIP6Cod0LdV7gdz4NfMdliPnPnZKLZ2vJeqF1ArbQgt97ucU1
        VESsbCJkUdWQt9mYaJZWF8rah0F3PM1T3OLRhNphk8OiHCvJ8Egf5gNBX5Es3MGP
        BCIFCNjwjTqb6WbeaNh7YdQzc3SSbl7YFk3OJNeHNrgp4/+uUk3dhfzEq43FNUl9
        6T5lwdXaD3KXlybM8A3q5C5FKNNjYd1lPQpZ6yWRAAkIhMMTxmOzggui+ds5Nxqp
        cViCdnncWTnsu+200E9H4qALFzk0OcEhA/Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id zIbLc9lEgfui for <linux-ide@vger.kernel.org>;
        Wed,  4 Jan 2023 19:43:09 -0800 (PST)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NnXP80W48z1RvLy;
        Wed,  4 Jan 2023 19:43:07 -0800 (PST)
Message-ID: <79260c74-92dd-2cdf-ad71-e70d9fa0f8a9@opensource.wdc.com>
Date:   Thu, 5 Jan 2023 12:43:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v7 0/7] Improve libata support for FUA
To:     Tejun Heo <tj@kernel.org>
Cc:     linux-ide@vger.kernel.org, linux-block@vger.kernel.org,
        Jens Axboe <axboe@kernel.dk>,
        "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>,
        Niklas Cassel <niklas.cassel@wdc.com>
References: <20230103051924.233796-1-damien.lemoal@opensource.wdc.com>
 <Y7WuEqMgySOCCTqy@slm.duckdns.org>
Content-Language: en-US
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <Y7WuEqMgySOCCTqy@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 1/5/23 01:49, Tejun Heo wrote:
> Hello,
> 
> On Tue, Jan 03, 2023 at 02:19:17PM +0900, Damien Le Moal wrote:
>> Finally, patch 7 enables FUA support by default in libata for devices
>> supporting this features.
> 
> These optional features tend to be broken in various and subtle ways,

FUA is not optional for any drive that supports NCQ. The FUA bit is a
mandatory part of the FPDMA READ/WRITE commands. The optional part is
support for the non-ncq WRITE FUA EXT command.

> especially the ones which don't show clear and notable advantages and thus
> don't get used by everybody. I'm not necessarily against enabling it by
> default but we should have better justifications as we might unnecessarily
> cause a bunch of painful and subtle failures which can take a while to sort
> out.

Avoiding regressions is always my highest priority. I know that there
are a lot of cheap ATA devices out there that have questionable ACS spec
compliance.

> * Can the advantages of using FUA be demonstrated in a realistic way? IOW,
>   are there workloads which clearly benefit from FUA? My memory is hazy but
>   we only really use FUA from flush sequence to turn flush, write, flush
>   sequence into flush, FUA-write. As all the heavy lifting is done in the
>   first flush anyway, I couldn't find a case where that optimization made a
>   meaningful difference but I didn't look very hard.

The main users in kernel are file systems, when committing
transactions/metadata journaling. Given that this is generally not
generating a lot of traffic, I do not think we can measure any
difference for HDDs. The devices are too slow to start with, so saving
one command will not matter much, unless the application is fsync()
crazy (and even then, not sure we'll see any difference). Even for SATA
SSDs it likely will be hard to see a difference I think.

Then we have applications using the drive block device file directly.
For these, it is hard to tell how much it matters. Enabling it by
default with a drive correctly supporting it will very much likely not
hurt though.

Maciej,

May be you did some experiments before asking for enabling FUA by
default ? Any interesting performance data you can share ?

> * Do we know how widely FUA is used now? IOW, is windows using FUA by
>   default now? If so, do we know whether they have a blocklist?

You mean "blacklist" ? I do not have any information about Windows, but
I can try to find out, at least for my employer's devices. But that will
not be very useful as I know these drives behave correctly.

More than Windows or the kernel, I think that looking at SAS HBAs is
more important here. SATA HDDs are the most widely used type of devices
with these, by far. These may have a SAT translating FUA scsi writes to
FUA NCQ FPDMA writes, resulting in FUA being extensively used. Modulo a
blacklist that results in the same as the kernel with a
flush/write/flush sequence. Hard to know as HBA's FW are not open. A bus
analyzer could tell us that though, but again I can look at that only
with the drives I have, which I know are working well with FUA.

I am OK with attempting enabling FUA by default for the following reasons:
1) The vast majority of drives in libata blacklist (all features) are
old models that are not sold anymore.
2) We are restricting FUA support to drives that also support NCQ, that
is, modern-ish ones that are supposed to process the FUA NCQ read/write
commands correctly, per specs.
3) For HDDs, which is the vast majority of ATA devices out there these
days, all recent drives I have tested are OK. Even older ones with NCQ
support that I have access to are fine.
4) We are at rc2, which gives us time to revert patch 7 if we see too
many bug reports.

One thing we could add to the patch series is an additional restriction
to enabling FUA by default to drives that support a recent standard. Say
ACS-4 and above. That will restrict this to recent devices, thus
reducing the risk of hitting bad apples. Thoughts ?

-- 
Damien Le Moal
Western Digital Research

