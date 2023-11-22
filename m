Return-Path: <linux-ide+bounces-39-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3807F466A
	for <lists+linux-ide@lfdr.de>; Wed, 22 Nov 2023 13:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D334B20A65
	for <lists+linux-ide@lfdr.de>; Wed, 22 Nov 2023 12:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6FD3D3A5
	for <lists+linux-ide@lfdr.de>; Wed, 22 Nov 2023 12:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GZMUg9Gc"
X-Original-To: linux-ide@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECB5BCB;
	Wed, 22 Nov 2023 04:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700656288; x=1732192288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BBCCOb13D6V1+k0L3ZDSfb8MooCW3vyJXHnVN3aQm0E=;
  b=GZMUg9GcfghE6gfKYkcfiGqF/Qlo3agYujkfRqgUNbbz7fMO2NLnXJwX
   d71X49rO5h6LbHXmtxNd8T0Ol6isp9YjxMOkgbnfLe6FSXLsfD3trmd8U
   DX3CtMjE52/ruDtVinu6nvSIsSmRfHXXaScH5hADvMtAPrciUbYgIZxyL
   h8eo0lO6f5h3t5+j1q8nwoQ63nHn6ACGPosXB+I0vlQrLN6a9+rt7xkZE
   UuA+bO5U9NSYpXb7kk1sQAdDGNR+GfvW4oHDsAOtZQ6/4HxtRqIyebmtY
   LrUhxDJizb5lNHUNUOtYAe0RIFjYavB1GtrL+EFSrWJ9iyVBOv0yCPjTP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="382440194"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="382440194"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 04:31:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="833000109"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="833000109"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 04:31:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r5mLd-0000000G5Uh-3mPn;
	Wed, 22 Nov 2023 14:28:53 +0200
Date: Wed, 22 Nov 2023 14:28:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Damien Le Moal <dlemoal@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org
Subject: Re: [PATCH v5 35/39] ata: pata_ep93xx: remove legacy pinctrl use
Message-ID: <ZV30BfLTsWVSSH9l@smile.fi.intel.com>
References: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
 <20231122-ep93xx-v5-35-d59a76d5df29@maquefel.me>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122-ep93xx-v5-35-d59a76d5df29@maquefel.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 22, 2023 at 12:00:13PM +0300, Nikita Shubin wrote:
> Drop legacy acquire/release since we are using pinctrl for this now.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



