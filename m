Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13013600544
	for <lists+linux-ide@lfdr.de>; Mon, 17 Oct 2022 04:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbiJQCjP (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 16 Oct 2022 22:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbiJQCjO (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 16 Oct 2022 22:39:14 -0400
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E9C45F7B
        for <linux-ide@vger.kernel.org>; Sun, 16 Oct 2022 19:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1665974352; x=1697510352;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=p1wZOeY4SDyd6Y0m0Ba/CvSp3H62dBhidZBPiS1eJu0=;
  b=Bs4RIJZyzUJH7AtZ4amQchDX66D6eeWY+WyDOmROFYHDszanPM9gI6wU
   rNoTGCcWEiR6BgQdCFUtgFx6EYlY4r7icy0R1C7rz5fsyM/wkAD6p2uFM
   bxalJkt+dH+8EED34abkEFwrag61LEg43BisB61tD0umfRaMA2OtGbu0Y
   heN2uaGIT1P2YecZEZloIPrQP3zZGV5RTO0N1KGCNaSIFmBTdj+uYOrYS
   aTus4XtXwr7siKXg3cwTNz4ebUD45EIQy0xSOdxJYbytVCcJ6ho3kENrN
   SLQDX/vYpOg1YI1XARpALH/osi0LEAYRfnibylaqMfo58g4cjsQYcWTD9
   g==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; 
   d="scan'208";a="212300247"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 10:39:12 +0800
IronPort-SDR: kDgF+1AOK4SQTBR/qVwUUflsPE2/0CDEXs0TZsQ1PhQK9ENW38HjSeHLRR3bJ4pVqbQ3rNp47s
 mU5xEQmIFViZpcej/CB2RKPJG53Wm662ESZWqJnFVsPK/+xgOljK3nf8U5AE/WzUu6/rHb13Mm
 9gOnew7cpWLmHRwYGciaTWwSF6gMeI/n2KkPptWdIh/5KVcyvdOOASVVVduFXePA5dlOichCCd
 sn8JpEnCnesLG6w436W+s2WyyogOUdgzvm79b+YCCsVNq3JaYvWesTu/SR9oYPTmKDgSCoKXjm
 T2tyedvO9rvmLqiG41O74bjH
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2022 18:53:06 -0700
IronPort-SDR: OrKzNd838fIQ6XSShAHJQ4QNfwiR0mq4RnqsHXGxN/Ft12xCKfD8trIQQbGDYQKOJyOqGVrTqg
 zwkqSnuIj6GD/ZeTJAf43zS9nNGMnWV5HxdWJBjZ7nPlaNKraVrrtCBKlKvRAgb18vbQ+UqTCK
 QrumpFj0FqJ05StMAqguh3pjDuyutjF/bUSsXxc2hv4MmZcr6fvEdvn2wQ28dsSGtvYD9YoamL
 kp9+MFtPOLdQr6GpJwINWRexhNSZssIDclB8vZFRaAB2fFP6AY3Z1wNGMfNKisvVjg4uJzO2i0
 hkI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2022 19:39:12 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MrLmH6Gtwz1RvTr
        for <linux-ide@vger.kernel.org>; Sun, 16 Oct 2022 19:39:11 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1665974351; x=1668566352; bh=p1wZOeY4SDyd6Y0m0Ba/CvSp3H62dBhidZB
        PiS1eJu0=; b=hMHzjxrLxL3XsWfoqvQ3gOskZ5nSm5FFUdTADg8EqHp0b8pipXi
        m/k57aTIk5aMarm6MzJ8CNv9kSjRA4Wwsg1AwDbvoGVqdjcKZoicsmeHD3lVFsyj
        TcUYUL2coluUGE0ZRkNUno8erlZjAdj+HOc3IDvYJIAN6N3Wf5szFgDasWaOiVjJ
        Vo4L3k8MdCNffAOYe4uREF/oU2N0AzFxOvpNoW7sgHzOnXtSYv+MvRqDxHZ+Ox0M
        Ihci6Q8EnXiobVOT5fNOsGNVzAXa8YkZAhJD+Xlst5f5/dbXwO7CI+aV5/C1bfOn
        kNEnVYRVTDZzD653pnnq00tE60f9EIrU48A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id y1Pk0YEaO7dI for <linux-ide@vger.kernel.org>;
        Sun, 16 Oct 2022 19:39:11 -0700 (PDT)
Received: from [10.225.163.121] (unknown [10.225.163.121])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MrLmF5Csbz1RvLy;
        Sun, 16 Oct 2022 19:39:09 -0700 (PDT)
Message-ID: <15bd882e-48ae-2da7-a056-098f37770937@opensource.wdc.com>
Date:   Mon, 17 Oct 2022 11:39:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 0/5] fetch sense data for ATA devices supporting sense
 reporting
Content-Language: en-US
To:     Niklas Cassel <Niklas.Cassel@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Hannes Reinecke <hare@suse.de>, Tejun Heo <tj@kernel.org>
Cc:     Hannes Reinecke <hare@suse.com>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
References: <20220926205257.601750-1-Niklas.Cassel@wdc.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220926205257.601750-1-Niklas.Cassel@wdc.com>
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

On 9/27/22 05:53, Niklas Cassel wrote:
> From: Niklas Cassel <niklas.cassel@wdc.com>
> 
> NOTE TO MAINTAINERS:
> Perhaps the SCSI patch could go into both the scsi tree and the libata
> tree to avoid any merge conflicts during the merge window.
> 
> 
> Hello,
> 
> Currently, the sense data reporting feature set is enabled for all ATA
> devices which supports the feature set (ata_id_has_sense_reporting()),
> see ata_dev_config_sense_reporting().
> 
> However, even if sense data reporting is enabled, and the device
> indicates that sense data is available, the sense data is only fetched
> for ATA ZAC devices. For regular ATA devices, the available sense data
> is never fetched, it is simply ignored. Instead, libata will use the
> ERROR + STATUS fields and map them to a very generic and reduced set
> of sense data, see ata_gen_ata_sense() and ata_to_sense_error().
> 
> When sense data reporting was first implemented, regular ATA devices
> did fetch the sense data from the device. However, this was restricted
> to only ATA ZAC devices in commit ca156e006add ("libata: don't request
> sense data on !ZAC ATA devices").
> 
> With the recent fixes surrounding sense data and NCQ autosense:
> https://lore.kernel.org/linux-ide/20220916122838.1190628-1-niklas.cassel@wdc.com/T/#u
> together with the patches in this series, we want to, once again,
> fetch the sense data for all ATA devices supporting sense reporting.
> ata_gen_ata_sense() should only be used for devices that don't support
> the sense data reporting feature set.
> 
> If we encounter a device that is misbehaving because the sense data is
> actually fetched, then that device should be quirked such that it
> never enables the sense data reporting feature set in the first place,
> since such a device is obviously not compliant with the specification.

Applied to for-6.2. Thanks !

> 
> 
> Kind regards,
> Niklas
> 
> Damien Le Moal (1):
>   scsi: Define the COMPLETED sense key
> 
> Niklas Cassel (4):
>   ata: libata: fix NCQ autosense logic
>   ata: libata: clarify when ata_eh_request_sense() will be called
>   ata: libata: only set sense valid flag if sense data is valid
>   ata: libata: fetch sense data for ATA devices supporting sense
>     reporting
> 
>  drivers/ata/libata-eh.c   | 18 +++++++++++++-----
>  drivers/ata/libata-sata.c | 21 ++++++++++++++-------
>  drivers/ata/libata-scsi.c | 16 ++++++++++++++++
>  drivers/ata/libata.h      |  1 +
>  include/scsi/scsi_proto.h |  4 ++--
>  5 files changed, 46 insertions(+), 14 deletions(-)
> 

-- 
Damien Le Moal
Western Digital Research

