Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 662314E2491
	for <lists+linux-ide@lfdr.de>; Mon, 21 Mar 2022 11:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346451AbiCUKpT (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 21 Mar 2022 06:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346497AbiCUKpR (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 21 Mar 2022 06:45:17 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C3D6445
        for <linux-ide@vger.kernel.org>; Mon, 21 Mar 2022 03:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647859423; x=1679395423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=39lQFPaAsZGtBJ5QWIPS3WXrEgu0jXjQJxlv/5KWFB0=;
  b=RCXM6a4pByZLvB0wfG5SKLATrzlq7RA0Lf/7OXJZN0K1ppiC7we9Sgxy
   NbraReS2E3LTOrE5lm5w56kkWdp3lO9G/TVWtaFPKqfU6XtMjFcEsixue
   9f9NJa0cfa0FlHfAyzUMk4VCWC/CBsQB5nhrHueAaCBmgven9wNYziIJ0
   b9KAnr86UTjgQpr7x9XqKy17EA7VqPz6uBQJ2adgqDuZIP5sgCvZXq0qV
   Uvo/kmLYga52w2EdAncLHSMYFk76HIKBH6nKs86F5EB6IEiC9S+d1c/Tb
   VtzvKkIbxPflJl9s41xWRezfy+vbzGEJe54Zsf/LDlgz2fAHHF5sY8h25
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="282346667"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; 
   d="scan'208";a="282346667"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 03:43:43 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; 
   d="scan'208";a="543166624"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 03:43:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nWFV9-003pNZ-94;
        Mon, 21 Mar 2022 12:43:03 +0200
Date:   Mon, 21 Mar 2022 12:43:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Christian Lamparter <chunkeey@gmail.com>,
        linux-ide@vger.kernel.org,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH v2 2/2] ata: libata-core: Disable READ LOG DMA EXT for
 Samsung 840 EVOs
Message-ID: <YjhWtp+AdcN1ot9t@smile.fi.intel.com>
References: <47b12037459a0df1748dac7440c0f5030e5c3ef4.1647720651.git.chunkeey@gmail.com>
 <fe2ff41a52ce2647fd12f69a0d6eba8e3cf05b06.1647720651.git.chunkeey@gmail.com>
 <468f57ae-47e8-7032-b391-7ddfd6853dbb@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <468f57ae-47e8-7032-b391-7ddfd6853dbb@omp.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Mon, Mar 21, 2022 at 11:00:51AM +0300, Sergey Shtylyov wrote:
> On 3/19/22 11:11 PM, Christian Lamparter wrote:

...

> > +	{ "Samsung SSD 840 EVO*",	NULL,	ATA_HORKAGE_NO_NCQ_TRIM |
> > +						ATA_HORKAGE_NO_DMA_LOG |
> > +						ATA_HORKAGE_ZERO_AFTER_TRIM, },
> >  	{ "Samsung SSD 840*",		NULL,	ATA_HORKAGE_NO_NCQ_TRIM |
> >  						ATA_HORKAGE_ZERO_AFTER_TRIM, },
> 
>   Shouldn't this entry be modified instead?

Wouldn't it modify much more devices with unknown outcome?
I would be on the safer side as done by this patch.

-- 
With Best Regards,
Andy Shevchenko


