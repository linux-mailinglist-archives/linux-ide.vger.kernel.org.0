Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3698471980
	for <lists+linux-ide@lfdr.de>; Sun, 12 Dec 2021 10:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhLLJgY (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 12 Dec 2021 04:36:24 -0500
Received: from mxout03.lancloud.ru ([45.84.86.113]:54320 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbhLLJgY (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 12 Dec 2021 04:36:24 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 9693D20EBD48
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Message-ID: <e272e139-f506-b762-db0a-e76df25552d1@omp.ru>
Date:   Sun, 12 Dec 2021 12:36:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 14/68] libata: move DPRINTK to ata debugging
Content-Language: en-US
To:     Hannes Reinecke <hare@suse.de>,
        Damien LeMoal <damien.lemoal@wdc.com>
CC:     <linux-ide@vger.kernel.org>
References: <20211210072905.15666-1-hare@suse.de>
 <20211210072905.15666-15-hare@suse.de>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20211210072905.15666-15-hare@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 10.12.2021 10:28, Hannes Reinecke wrote:

> Replace all DPRINTK calls with the ata_XXX_dbg functions.

    It's ata_dev_dbg() everywhere, no need for XXX. :-)
    And you also remove some DPRINTK() calls.

> Signed-off-by: Hannes Reinecke <hare@suse.de>
[...]

MBR, Sergey
