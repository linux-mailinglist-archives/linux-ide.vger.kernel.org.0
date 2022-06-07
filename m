Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (unknown [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F642533C35
	for <lists+linux-ide@lfdr.de>; Wed, 25 May 2022 14:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233827AbiEYMDd (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 25 May 2022 08:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbiEYMDc (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 25 May 2022 08:03:32 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD6DFD3F
        for <linux-ide@vger.kernel.org>; Wed, 25 May 2022 05:03:31 -0700 (PDT)
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4L7V3b15CWz683hj;
        Wed, 25 May 2022 19:59:23 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 25 May 2022 14:03:28 +0200
Received: from [10.47.92.26] (10.47.92.26) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 25 May
 2022 13:03:28 +0100
Message-ID: <a8ff6eeb-e7be-287d-589a-8fe5bea535e3@huawei.com>
Date:   Wed, 25 May 2022 13:03:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] libata: drop 'sas_last_tag'
To:     Hannes Reinecke <hare@suse.de>,
        Damien LeMoal <damien.lemoal@wdc.com>
CC:     <linux-ide@vger.kernel.org>
References: <20220525114942.92934-1-hare@suse.de>
From:   John Garry <john.garry@huawei.com>
In-Reply-To: <20220525114942.92934-1-hare@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.92.26]
X-ClientProxiedBy: lhreml718-chm.china.huawei.com (10.201.108.69) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 25/05/2022 12:49, Hannes Reinecke wrote:
> Unused now.
> 
> Fixes: 4f1a22ee7b57 ("libata: Improve ATA queued command allocation")
> 
> Cc: John Garry<john.garry@huawei.com>
> Signed-off-by: Hannes Reinecke<hare@suse.de>


Thanks,

Reviewed-by: John Garry <john.garry@huawei.com>
