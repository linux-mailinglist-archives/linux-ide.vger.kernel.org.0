Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8A5267C157
	for <lists+linux-ide@lfdr.de>; Thu, 26 Jan 2023 01:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbjAZAIp (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 25 Jan 2023 19:08:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjAZAIo (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 25 Jan 2023 19:08:44 -0500
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13EF61D7D
        for <linux-ide@vger.kernel.org>; Wed, 25 Jan 2023 16:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1674691723; x=1706227723;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bqiTBIDtB8cR2IL9Fddn5UpoO7IbqMKb9MtEVMq2O9M=;
  b=ZXbhbcIduXHnj+dbq2wwxNzzCrRp01o1vOplfkSpzxIslzPDZMDDzvgu
   GnSndQeqkk0NzxJAQolxpoQtj5z9dg5ngWogKYKxThJVNvQ63ReX6xIY2
   hyGCxaNvRU/OviAKQtbBvPOJzvJ1KhpjsYqyf2k/5eN6+cTSY0xHOykmv
   +3U4zVPYDcxjZki8upLZceIhxpcXxFKu93uWW1VjPxzbWFjDQVj0yj8c7
   L0aWBwpDtxQc7JiRJzVEccbrFdttbZyw43PEIQyDkWCR5PGF8ZRZXEdM5
   3kk3WMSR1/oP19A4ADj08UCB4Igkl2cOm8nhWpQZWsowIrIOlVW6esm/U
   g==;
X-IronPort-AV: E=Sophos;i="5.97,246,1669046400"; 
   d="scan'208";a="221573861"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2023 08:08:42 +0800
IronPort-SDR: RjgiJAXmIR2Ornr//DZ26fi3J6JbQHERyPH7EZDUADbe0XbO7meTVfJLHxrhL7hH6q/lGdiOGE
 AvJrQT4w42cS0d+ZIpueZoJV/i0EMxKuL79tSUuwj9vR2X0Fq4XAYLuxLZZGbTYVToua8HUBUU
 dDHTfXDtdwQL88q8KRPEoRZJbZXqbRvmVjRofDoADoBtZRUvDjhUlQzwKtZfPjbH6oxhfCeQ89
 UvFoWAXcruTvSB3LSWXmbL6Ie2L1hJJ8uLctLHhLHuH4J1x4UT1TqW8wDlmX3/H66CHzvjQNFn
 gyA=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jan 2023 15:26:13 -0800
IronPort-SDR: LYh2MxqaENIJKYtaxt0/E8be5utF7Is2HH7laeDhB4ObT8AZ9AniMGFewWLQcFTRjWVxFgbH8U
 Q4fwrnyeg7FNFQe//L/9ZYYeEbl/argzZI2P6gTAyjrMpEddquRj2bWu9BcLy/L4QMHh0W3qr4
 m4h7aSFQEug9GlcVoJf5ijFAkrpFslVTgQn1eTE0JaYRfXSrZAXfI/oWGpaM75MWzbHfwdxe2F
 LrNbw0iQIa5kxSMYEyq4Y1U5uIJ6PKKr+IS/WO1MpruuhfgkEoQSYJrnd00baZiJB4WUX4Eiy1
 xA0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jan 2023 16:08:42 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P2Lf20TMPz1RwqL
        for <linux-ide@vger.kernel.org>; Wed, 25 Jan 2023 16:08:42 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1674691721; x=1677283722; bh=bqiTBIDtB8cR2IL9Fddn5UpoO7IbqMKb9Mt
        EVMq2O9M=; b=D1qinNipZ0InhzIo9mG41bgwFKuB4jvgpRMY0SySS+lsBCpppwy
        /9q/kcSJVOKEwMawPl+ptwd0nPI41z42kRLFBtA7q9PBAwXZTVafJbQJm5JYZoGL
        uzFmOnSkN7t++1J+2hVpGjwfR/Ftp/BYoyHHzBDBsWbCErXb8/kpmVj031bm/8s0
        Iik5pLaCGPdYQNGYkMuZdTPjpdBPUQLWb5Eq7DuulW/Cl5J9voCw1forHaeq3e7w
        ybSP1o/RqXb00LD9uRRQEDjINQVnE+JBc3c25zEkrisEr65CiOR+aUnpy7DxeTxw
        OskUa3ahS9bZwWsvn3qa7mc92SM274MY7KA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id HeNom09vtuZm for <linux-ide@vger.kernel.org>;
        Wed, 25 Jan 2023 16:08:41 -0800 (PST)
Received: from [10.89.81.12] (c02drav6md6t.dhcp.fujisawa.hgst.com [10.89.81.12])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P2Ldz3L8Pz1RvLy;
        Wed, 25 Jan 2023 16:08:39 -0800 (PST)
Message-ID: <7ad86714-000e-92ec-5306-df016ea7503a@opensource.wdc.com>
Date:   Thu, 26 Jan 2023 09:08:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 01/18] block: introduce duration-limits priority class
Content-Language: en-US
To:     Keith Busch <kbusch@kernel.org>
Cc:     Bart Van Assche <bvanassche@acm.org>,
        Niklas Cassel <niklas.cassel@wdc.com>,
        Paolo Valente <paolo.valente@linaro.org>,
        Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Hannes Reinecke <hare@suse.de>, linux-scsi@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-block@vger.kernel.org
References: <20230124190308.127318-1-niklas.cassel@wdc.com>
 <20230124190308.127318-2-niklas.cassel@wdc.com>
 <bd0ce7ad-cf9e-a647-9b1e-cb36e7bbe30f@acm.org>
 <731aeacc-74c0-396b-efa0-f9ae950566d8@opensource.wdc.com>
 <873e0213-94b5-0d81-a8aa-4671241e198c@acm.org>
 <4c345d8b-7efa-85c9-fe1c-1124ea5d9de6@opensource.wdc.com>
 <5066441f-e265-ed64-fa39-f77a931ab998@acm.org>
 <275993f1-f9e8-e7a8-e901-2f7d3a6bb501@opensource.wdc.com>
 <Y9G3LUem6X/fUz22@kbusch-mbp.dhcp.thefacebook.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <Y9G3LUem6X/fUz22@kbusch-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 2023/01/26 8:11, Keith Busch wrote:
> On Wed, Jan 25, 2023 at 10:19:45AM +0900, Damien Le Moal wrote:
>> On 1/25/23 09:05, Bart Van Assche wrote:
>>
>>> which it is not sure that it will be integrated in other storage 
>>> standards (NVMe, ...). Isn't the purpose of the block layer to provide 
>>> an interface that is independent of the specifics of a single storage 
>>> standard? This is why I'm in favor of letting the ATA core translate one 
>>> of the existing I/O priority classes into a CDL instead of introducing a 
>>> new I/O priority class (IOPRIO_CLASS_DL) in the block layer.
>>
>> We discussed CDL with Hannes in the context of NVMe over fabrics. Their
>> may be interesting extensions to consider for NVMe in that context (the
>> value for local PCI attached NVMe drive is more limited at best).
> 
> I wouldn't necessarily rule out CDL for PCI attached in some future TP. NVMe
> does allow rotating media, and they'll want feature parity if CDL is considered
> useful in other protocols.

True. If NVMe HDDs come to market, we'll definitely want a CDL feature too.

-- 
Damien Le Moal
Western Digital Research

