Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B74C55064C8
	for <lists+linux-ide@lfdr.de>; Tue, 19 Apr 2022 08:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242567AbiDSGrC (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 19 Apr 2022 02:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232364AbiDSGrB (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 19 Apr 2022 02:47:01 -0400
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F453136C
        for <linux-ide@vger.kernel.org>; Mon, 18 Apr 2022 23:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650350660; x=1681886660;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8WWWeqkjRsJguwhNbQdCeYL7WvDMBr86xY9Uzcx3OXA=;
  b=e6t/7/jVb/ip7j9NlLCJGs/2caNg6f1Xr02ivRFoJbrjzhLh07t1RvSb
   ZEd+17E0fVU3G6MPMTHPQeoUyrnn6pqVy3UDRUey/+6XHfTfaRiRvluHM
   YARsCuqILIUN3UFC520tpK7pgSgWBh2JHyK5JoySGrz5426G2Upgd4CZu
   5cMgy2EtodQPZIg2ZAzTiCBeA98bD/D2zrBZSE1SBksz9tjVomaYGmeTO
   zmV63n7nLg26px6T/DgyN3vw25vq3RfNuDSAeCSbzT1s4lTGcVY1VPfNS
   HPun6D2SEZnSAWNj85PY5LyPonZZuTi3w1gtkCTqMQCFYf9jkUy1PPLdP
   A==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643644800"; 
   d="scan'208";a="199133685"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2022 14:44:19 +0800
IronPort-SDR: 5I5nZoQtMwBx2Cc8hdHHRY5O+TGIEywgdXR9w0Do0KAT4qNcuoaTzWJB3AedjmTTTi7Bq0pOi2
 rGD7F3DTdFt4P8bHIg5TrCLYpV/SzWHPwBFdHGXEPiIA3jDVNKajwwwv7y7NXh+X6Med/7Rwd3
 8Zyc1xTgti7QMOO0oR00zIU8MmrbVcTqtzIwcPysJNldb99f67atb9WEiWZJfe0GqUHlGtLk6C
 RAY/81DyOtJTF8JJW/nRPFU+E3u3PJW1aW+hiugmkWLhWLHMS9exgdD/AmS1Q7npClXfdybUbw
 SM8cEAVR53Da1STp4TQYAj8U
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2022 23:14:39 -0700
IronPort-SDR: 8ay4hsMA4DsNX3XxQz/FaFy9f4lclLK52pW8qZ0Zz8C4ypLvPoALbf2rHooM9qKA7ScQYxlstt
 rLUgMtThpFcYrebdk13eDUbkdquEoBZpPfeYtrob015kUVLd51/khqfvf8ah6UgiUAGtfMxHHp
 d+tdoqOORTGu7iGQjarRoRnysLhq2RsAMt/xafC99VBjeGASoLyEMfxu/deVbFPgYCs9JIfIVU
 EC3DcBD645O7coC4ua5MO2kLKRA73kdAqq/skGeKZM5nV44yv1IfxA25mdwuZKHJzlYz7VaY/q
 BS0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2022 23:44:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KjDmf371Mz1SHwl
        for <linux-ide@vger.kernel.org>; Mon, 18 Apr 2022 23:44:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1650350657; x=1652942658; bh=8WWWeqkjRsJguwhNbQdCeYL7WvDMBr86xY9
        Uzcx3OXA=; b=rErrfmkm1eN0G90XNiKwz3BP6CTW8icQ48Osq+ekJiG4DQxQwid
        6zuPxQsa7uK/IW/QcPikMBUOlxEhg2FyYhGVfoww/j0nQ+3ywc1cCSUtsx5r7RGg
        CCczSTFxS5ZiJLygtA3jK4PeoCirK+m79Uu7q9IbR08R2P079vtIB8Ek+AwokjaN
        QZEKWDEC+tynmqWGUkJRp0asRXe50vqTEIXVvre2eAH2Y9+RDA9KbBCwsJXqd7fW
        99ND1HhAqLnRrgaE0T/Se9JEuG9CfKfsL4Gi5wbc7NqMiUn24LTOUX47mczpNPNB
        z98Vk1QBz3A2y+esuzpgZn1GNUPflMzit7A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id dceI05BdoD8a for <linux-ide@vger.kernel.org>;
        Mon, 18 Apr 2022 23:44:17 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KjDmc3KYcz1Rvlx;
        Mon, 18 Apr 2022 23:44:16 -0700 (PDT)
Message-ID: <7991758d-16b4-c9c4-0425-c2ec41943db8@opensource.wdc.com>
Date:   Tue, 19 Apr 2022 15:44:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] Drop Documentation/ide/
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Cc:     patches@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
        Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org,
        linux-block@vger.kernel.org
References: <20220419011021.15527-1-rdunlap@infradead.org>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220419011021.15527-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 4/19/22 10:10, Randy Dunlap wrote:
> Drop all Documentation/ide/ since IDE support was deleted by
> Christoph Hellwig <hch@lst.de>, Jun 16 2021.
> 
> Fixes: b7fb14d3ac63 ("ide: remove the legacy ide driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: linux-ide@vger.kernel.org
> Cc: linux-block@vger.kernel.org

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Jonathan,

Are you going to take this patch or do you want me to queue it through the
libata tree ?

-- 
Damien Le Moal
Western Digital Research
