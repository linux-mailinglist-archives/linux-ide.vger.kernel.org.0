Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01A6656D1F1
	for <lists+linux-ide@lfdr.de>; Mon, 11 Jul 2022 01:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbiGJXIf (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 10 Jul 2022 19:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiGJXIe (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 10 Jul 2022 19:08:34 -0400
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5B5A5F63
        for <linux-ide@vger.kernel.org>; Sun, 10 Jul 2022 16:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1657494512; x=1689030512;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mKne22iKALzQ3J0xLcJU8NPKnJVHQYik+HOhe8r31SI=;
  b=f64l87Dm5MY1q0qb+U4qtmSHBGiWsSSTBsSWpoRHcO+Y6bXfDMdm90Rz
   I3RblogT2gSGj+U299oWKyIg87VzUE5lAzbstMoDCbUGw946PHm+z/jrq
   7HSV+yHRZmjUdXaUOXwDj8CMOUgOXbGiV3CNLb3IsxFxltA6qDced0OGV
   tnZCz/I3iwiMxEBphrviItb9X2eb3hjY9e1seD9G0wM7EZ68ClQJ8hsx6
   kJoodT99P1UCjhyntj4C6gRW+WvJqLgFKX5unWUbWRo4yzziQfxlKEdK4
   feqS+z+7xIIs74c3uPe0eUVmJhxnerE3RrzEkycM4pt7tsJ7F/bOMKa+Q
   g==;
X-IronPort-AV: E=Sophos;i="5.92,261,1650902400"; 
   d="scan'208";a="205310165"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 11 Jul 2022 07:08:30 +0800
IronPort-SDR: BpnA7fXkRuLKfp3RXlbl0BamdTXS853tYV6lnV7xnGkscdmSlulhJU/yIicZzCBg92PxZfjyI8
 YZB6yiKd3POQvYaF2SnkwGxehGeiVkLaAre3wt7mztvrPvnkJK/AG8o/D+koNim+0ljR7btiKi
 Js6dml5PZuRx58Zz4t/2QnYLHCv4Im0IS/Ot8oGNuKFe9f2Q5Z0GdlzShcIldLbsJ0rCmkdKA9
 ivu40+jVQNrCcAdvyS0C1mmYFIrTIIlxdr1IqYUGGSU166oG4B3PQ/6fyFMJcQ7lN3+/opEA8R
 CoM//j12MFrmyEdj9PW7F1Yn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2022 15:30:09 -0700
IronPort-SDR: /zYExmVkVitcV8xzFncH4qU+W7Q+l1k+dm1yY+RgdDS/duDpq6K7ZcaaRu3/Z/igMSoO4wSgRx
 tZi6Jetr5PeZMianJMXGApl+M4hDQNQSNrsrZL2TFGj2NaYj25oweFDp4f9tgy9heRbaEWkuXY
 fmBLlzI1Qd6c9azx2lbMDFXBu67V9kNX+5W8P3JrYhJv4NMQr7CWFBcyyQnniWqCuuRWz03JBz
 FccOPAXHFZmO6/iN2N63nNMhZ6JX/pLu0tc3+KRmRJWWyLTXBqAJB5OjExXi/bh8m+2pXuDxjK
 EfE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2022 16:08:31 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lh2kP5VgYz1Rwry
        for <linux-ide@vger.kernel.org>; Sun, 10 Jul 2022 16:08:29 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1657494509; x=1660086510; bh=mKne22iKALzQ3J0xLcJU8NPKnJVHQYik+HO
        he8r31SI=; b=LFBrpQ2567/K4oU4UX1SyFMfJ8BAa4bdsk1UJ/NMSHvt37CYjOf
        1kbvpSo8/bCcW9xh3pjCSJKXmr8wvDZv/F8hxNeg7l97iwC8m6L2E7G+eKJF1Lt5
        tuHTFC7W6GUwcMXVmAQRGXBOUdnaBe2+GGkRBtMgeAxHuz3t0zjI6GvNFJO2Ip7O
        JEAGQxLI1dFWwGgeZXKVQ/AhQ47Ukri78yOLdbxnM9K3sBHTAoJ8M7KnTr8t/e4j
        +5SzXzsyZHnO99NQ/x7k8lv2NhJWaoJ9mbn6ecUdD/LZHdctnaPoKFR77Z78u8U+
        PSrqKxNyIHtWMXXPfCzy7HEip35NWR6kZYQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id enyBkMBk4lFa for <linux-ide@vger.kernel.org>;
        Sun, 10 Jul 2022 16:08:29 -0700 (PDT)
Received: from [10.225.163.114] (unknown [10.225.163.114])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lh2kK2D3Hz1RtVk;
        Sun, 10 Jul 2022 16:08:25 -0700 (PDT)
Message-ID: <6367a264-a3d3-8857-9b5a-2afcd25580cb@opensource.wdc.com>
Date:   Mon, 11 Jul 2022 08:08:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 0/5] DMA mapping changes for SCSI core
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Christoph Hellwig <hch@lst.de>
Cc:     joro@8bytes.org, will@kernel.org, jejb@linux.ibm.com,
        m.szyprowski@samsung.com, robin.murphy@arm.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ide@vger.kernel.org, iommu@lists.linux-foundation.org,
        iommu@lists.linux.dev, linux-scsi@vger.kernel.org,
        linuxarm@huawei.com
References: <1656590892-42307-1-git-send-email-john.garry@huawei.com>
 <b5f80062-e8ef-9597-1b0c-393140950dfb@huawei.com>
 <20220706134447.GA23753@lst.de> <yq1y1x47jgn.fsf@ca-mkp.ca.oracle.com>
 <5fd4814a-81b1-0e71-58e0-57a747eb684e@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <5fd4814a-81b1-0e71-58e0-57a747eb684e@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 7/9/22 01:17, John Garry wrote:
> On 07/07/2022 21:35, Martin K. Petersen wrote:
>> Christoph,
>>
>>> Yes, I've mostly been waiting for an ACK from Martin.
>> Sorry, I'm on vacation this week. The series looks OK to me although I
>> do agree that it would be great if the max was reflected in the queue'=
s
>> hard limit and opt in the soft limit.
>=20
> Ah, I think that I misunderstood Damien's question. I thought he was=20
> asking why not keep shost max_sectors at dma_max_mapping_size() and the=
n=20
> init each sdev request queue max hw sectors at dma_opt_mapping_size().

I was suggesting the reverse :) Keep the device hard limit
(max_hw_sectors) to the max dma mapping and set the soft limit
(max_sectors) to the optimal dma mapping size.

>=20
> But he seems that you want to know why not have the request queue max=20
> sectors at dma_opt_mapping_size(). The answer is related to meaning of=20
> dma_opt_mapping_size(). If we get any mappings which exceed this size=20
> then it can have a big dma mapping performance hit. So I set max hw=20
> sectors at this =E2=80=98opt=E2=80=99 mapping size to ensure that we ge=
t no mappings=20
> which exceed this size. Indeed, I think max sectors is 128Kb today for=20
> my host, which would be same as dma_opt_mapping_size() value with an=20
> IOMMU enabled. And I find that only a small % of request size may excee=
d=20
> this 128kb size, but it still has a big performance impact.
>=20
>>
>> Acked-by: Martin K. Petersen<martin.petersen@oracle.com>
>=20
> Thanks,
> John


--=20
Damien Le Moal
Western Digital Research
