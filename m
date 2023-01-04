Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD13765CC6C
	for <lists+linux-ide@lfdr.de>; Wed,  4 Jan 2023 05:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234141AbjADEoB (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 3 Jan 2023 23:44:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbjADEn7 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 3 Jan 2023 23:43:59 -0500
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D919B13DF2
        for <linux-ide@vger.kernel.org>; Tue,  3 Jan 2023 20:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1672807437; x=1704343437;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PQgM4ru4EBImllGV+1RP6lK0PqWbLhfzRnpDMQkTjv4=;
  b=JTYIK+2zqsi5IaYtnZBB3ojj0UsZnyEua6W8eU947pnqtyYO6yb0fEoD
   ZtyI4JFIQxAkH6Ulh2gTkWptQq0sd7UDiJ4gt6lUGhWzGicyUv7jHRYFk
   IqPh04sohrEt6FR0HEZzypWVnX3JfC24UIqVmwcQTYdeRp//GZbidDlCC
   a/wlZfkOwZ5DIsm4LLYwIFkmQA5rcRElacpskCmms51qvnunskGktkHt0
   WK8S8OZAMtnRPddpUNLZNgUNMeR+Ur0gk4m6/vYzZmM9Wl2wgikCYtCTB
   K/9hlfjJQnFXghhvdDtjKIONslsCMPdtZf8H/G9uKWIPWPoVrvG0ehAyL
   w==;
X-IronPort-AV: E=Sophos;i="5.96,297,1665417600"; 
   d="scan'208";a="331980740"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 04 Jan 2023 12:43:57 +0800
IronPort-SDR: Fjh3BiOj5yMEozwa0rpqfKBcwjjZnsFMAzWqwzXDUi1tKcLnhuu+M2fBIa1KaHD5kvSHdffqP3
 9+ezFGC/Idg6jWtxwCIBzJzAvDv0/qoSDw59g/qiwKIOj3IObUPL1vFS9ga1YrlTtN3fiR1Ctj
 jipDT7MjcLmBUPydNBMgPAxu+gJ34BGF5nVzAhcemDq+WhjBtwf3Pf+Ig0PuYDhLX69+DzqBeP
 vfmqzTittfxJkOHBDGvR4gViVO40dNVIMRdW2ubt9SCLuoUtA+IEA9qPmgj0owesPw0shO1Gxs
 dFw=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Jan 2023 20:01:54 -0800
IronPort-SDR: 0ISQVzgHkuXGV4gdoRYp5sXX5Ng+khms6cRq7l8R695Nca4PrgaQMnZgxX3LcHihFyX6gvR8pi
 6oGdStHRKbFAELTGJOpiGImxefs/T5IG1zvelFDYn8i9UQq5R7KY/7IKUM+Fgkac49CbGfNtM3
 U9+cspKta3wG3VtwS7cDykdxVHhVvxEVhUGfTh4N+MFxT4nqWjWqbmgiSFeDHdQQd+AiK7Tlrw
 iJCwn8ls5zLeOOQKa1v8LBfOuYh4YYlrFnidqXnrZJHDWNFOWsncrP1+aX5bYs0np+dRUuGZmn
 gMw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Jan 2023 20:43:57 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nmxnn0JW2z1RvTp
        for <linux-ide@vger.kernel.org>; Tue,  3 Jan 2023 20:43:57 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1672807436; x=1675399437; bh=PQgM4ru4EBImllGV+1RP6lK0PqWbLhfzRnp
        DMQkTjv4=; b=W+9MMxyLM+flzdLoYfFmqY0yFwv3lD79ekRXbFpL83ZttR3fVO9
        Yudm/b16IbEfYGZyr4Cc73mnJYcYOB0Avc05FpL9XyrfhDUyhjwGWpE71xFefVlm
        q60+6CCEzxwIKZ5tuITQStEnsgoWlRoYkjYWcVrTpN/4x7V9I+OBjf8tI7JX9x6w
        OdnXAilRofAOH97OZ+maPk6OfpS66IHyZt3eBUNF715Bib2+JmAevsvfytkV7YHZ
        GeSzQxqS6E+SlMhTcrP2WpzLK6FqSOGnVeP7bzkHOww8eqXNVLEXxLaC2wmh4Klo
        N+mtLU2ae36CLHcEZPNz+D0Ymcv6dW6i+wA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id E8giS4XVtRy3 for <linux-ide@vger.kernel.org>;
        Tue,  3 Jan 2023 20:43:56 -0800 (PST)
Received: from [10.225.163.5] (unknown [10.225.163.5])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nmxnl2P4pz1RvLy;
        Tue,  3 Jan 2023 20:43:55 -0800 (PST)
Message-ID: <49c92e50-5452-8c3e-1517-a0bb1e4e72a0@opensource.wdc.com>
Date:   Wed, 4 Jan 2023 13:43:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 0/7] misc libata improvements
Content-Language: en-US
To:     Niklas Cassel <niklas.cassel@wdc.com>,
        Mikael Pettersson <mikpelinux@gmail.com>,
        Brian King <brking@us.ibm.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20221229170005.49118-1-niklas.cassel@wdc.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20221229170005.49118-1-niklas.cassel@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 12/30/22 01:59, Niklas Cassel wrote:
> Hello there,
> 
> This series contains misc libata improvements.
> 
> These improvements were identified while developing support for Command
> Duration Limits (CDL). All patches in this series (i.e. V1 of these
> patches) were orignally sent out as part of the CDL series, found here:
> https://lore.kernel.org/linux-scsi/510732e0-7962-cf54-c22c-f1d7066895f5@opensource.wdc.com/T/
> 
> However, as these improvements are completely unrelated to CDL, they can
> be merged independently, and should not need to wait for other patches.

Applied the series to for-6.3. Patch 1 had a small conflict that I fixed
up. Thanks !

> 
> 
> Kind regards,
> Niklas
> 
> 
> Changes since V1:
> -Added missing chain sign-off (in addition to author sign-off).
> -Picked up tags from John.
> -Rephrased commit message for patch 1/7 as suggested by John.
> -Rephrased commit subject for patch 3/7 to more clearly hightlight
>  that this is simply an improvement, and not strictly a bug fix.
> 
> Damien Le Moal (2):
>   ata: libata: simplify qc_fill_rtf port operation interface
>   ata: libata-scsi: improve ata_scsiop_maint_in()
> 
> Niklas Cassel (5):
>   ata: scsi: rename flag ATA_QCFLAG_FAILED to ATA_QCFLAG_EH
>   ata: libata: read the shared status for successful NCQ commands once
>   ata: libata: respect successfully completed commands during errors
>   ata: libata: move NCQ related ATA_DFLAGs
>   ata: libata-scsi: do not overwrite SCSI ML and status bytes
> 
>  drivers/ata/acard-ahci.c      |   8 +-
>  drivers/ata/libahci.c         | 171 ++++++++++++++++++++++++++--------
>  drivers/ata/libata-core.c     |  12 +--
>  drivers/ata/libata-eh.c       |  22 ++---
>  drivers/ata/libata-sata.c     |   7 +-
>  drivers/ata/libata-scsi.c     |  11 ++-
>  drivers/ata/libata-sff.c      |  10 +-
>  drivers/ata/libata-trace.c    |   2 +-
>  drivers/ata/sata_fsl.c        |   5 +-
>  drivers/ata/sata_inic162x.c   |  14 ++-
>  drivers/ata/sata_promise.c    |   2 +-
>  drivers/ata/sata_sil24.c      |   7 +-
>  drivers/ata/sata_sx4.c        |   2 +-
>  drivers/scsi/ipr.c            |  11 +--
>  drivers/scsi/libsas/sas_ata.c |  11 +--
>  include/linux/libata.h        |  25 ++---
>  16 files changed, 201 insertions(+), 119 deletions(-)
> 

-- 
Damien Le Moal
Western Digital Research

