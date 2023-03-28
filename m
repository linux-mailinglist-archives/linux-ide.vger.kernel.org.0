Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D19226CB24B
	for <lists+linux-ide@lfdr.de>; Tue, 28 Mar 2023 01:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjC0X1R (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 27 Mar 2023 19:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjC0X1Q (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 27 Mar 2023 19:27:16 -0400
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2333C1735
        for <linux-ide@vger.kernel.org>; Mon, 27 Mar 2023 16:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1679959636; x=1711495636;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8v/j5oydGaOLEzE1iZOLYHGbB0l++zz9C6Rd3Ol5Oqs=;
  b=V2hv7miNAMe+NhtDtWlfdav6dvJA71Aid0s2kIb2mJufbIXuILd51t+3
   DBZ9vsgiKFyMNOO+MBG/yOc/NOPlHOwArzgWCNzbLOSq0eeoiADvPRQZJ
   dTRpXPkYtsuLvQjmiW3tfG1WFtrouteSXEpPJJGwrAqX6S8ktqDJQel5D
   ay/fFVz8vBBWhcHEQ88UbHJRTh5hJ8aFpBSRv8PvfxbNC9wJ2ChPi4KTx
   PQAT1e5/MRIfOHAo6HQGpTzYXgeMr6Rq9q8VjgiTgmq2RwXghW7Ja4pz2
   CiBgp/bJDxgTxzcRQ+jYxmtHspCg4ZykwmUTOqiMg2rjrkwUEMUFIT7AO
   g==;
X-IronPort-AV: E=Sophos;i="5.98,295,1673884800"; 
   d="scan'208";a="338704326"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 28 Mar 2023 07:27:15 +0800
IronPort-SDR: Vxq3D5GR0YQoJ+HhVKEnZZxGYVaKD1QVS8V1P0vdqZjm3XmUMfct5yGRkbnbc6ZQawtS67imzY
 g/6iHZT/UuL1N8N6DHqBvY5CUWpAsUE27Tvm7WiIk3XfeHsmJdV1q13KGRtd3TjLHYp9rvUC3E
 RyDn61THjgf4a3L3/vwC4ulk8o9H1rjaSTv9m4W6x6/TSZ7sKPh3xU9JCqgl6CAKqcKvT5qnE/
 0drlD4TzE1m5mYVf+sFhbD2YmJU6xr6lyfQ0JOQ3NxTyvBKtDw5swm0xnt0kNyCBdZ7gtNnfQy
 K80=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Mar 2023 15:43:26 -0700
IronPort-SDR: W4hLfgcDxYvU9fgazZ3m+6CbrvjvI+XzAmHKff4k5+0ve8fibA7X3936o+B/oZ8//dMuX/f+T8
 kN45l2zo8oeZMCPjmNxk72bnoKdF4emfTyoUyvYpp/NH/cI4c1LGmUXHpRk1Tn4LhmEGbSlKxV
 krjTngwMPNSl0caJvy/8XLwHe14A4PY5REvVbomeYBDcDLfMNm1epqKq0zJXhFpRnn5liOPmWk
 S/8ofT9039hrOWL174FmRNkqMxglp57/RrSynXub88RhX2CcOlTsW/6n5l4d5CuFWe56t+2LO8
 0w0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Mar 2023 16:27:15 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Plpr26VSLz1RtVn
        for <linux-ide@vger.kernel.org>; Mon, 27 Mar 2023 16:27:14 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:content-language:references:to
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1679959634; x=1682551635; bh=8v/j5oydGaOLEzE1iZOLYHGbB0l++zz9C6R
        d3Ol5Oqs=; b=QX3rP6A9ZXTSfRgk0Wh/idvyK1hRW541DFFqqptpOyYAPq51B61
        PFRgVGVY5U9XvMLY0bpMcY+ctYCG8aR6E+YCJa70Nky49Rupw92CEDNFglF8NBhh
        YxpvhkXzaxvGjph83LPYDRDiuyxxZAK/XVhvgVKspCAoKEllgfVYW6rHQBdECely
        FW7PTCxHp2nGgM/sbtNTH3UpxRMPfigypCUJv8jnUnBsXX9bWf9iDxKLiRTlblOh
        yLBZ2eqoVI4S2mZQbTv1fOsjtkUi9C1Ge0ujbFEjITO8YfpI94p3JhQMDzqTjCFM
        LQ5rdX/x9B8LyxYbG231DYioHRurn6RUKmA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id cNZY-xdyeMqE for <linux-ide@vger.kernel.org>;
        Mon, 27 Mar 2023 16:27:14 -0700 (PDT)
Received: from [10.225.163.111] (unknown [10.225.163.111])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Plpr05zyRz1RtVm;
        Mon, 27 Mar 2023 16:27:12 -0700 (PDT)
Message-ID: <30066318-e9ca-0796-f671-23f4a85bb138@opensource.wdc.com>
Date:   Tue, 28 Mar 2023 08:27:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: ata: Drop unneeded quotes
To:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20230327170053.4100949-1-robh@kernel.org>
Content-Language: en-US
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230327170053.4100949-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 3/28/23 02:00, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>


-- 
Damien Le Moal
Western Digital Research

