Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D59C515DDD
	for <lists+linux-ide@lfdr.de>; Tue,  7 May 2019 09:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfEGHG0 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 7 May 2019 03:06:26 -0400
Received: from mga17.intel.com ([192.55.52.151]:21156 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726297AbfEGHG0 (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 7 May 2019 03:06:26 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 May 2019 00:01:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,441,1549958400"; 
   d="scan'208";a="168918218"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
  by fmsmga002.fm.intel.com with ESMTP; 07 May 2019 00:01:23 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 7 May 2019 00:01:23 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.33]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.70]) with mapi id 14.03.0415.000;
 Tue, 7 May 2019 15:01:21 +0800
From:   "Zhang, Ning A" <ning.a.zhang@intel.com>
To:     "tj@kernel.org" <tj@kernel.org>,
        "axboe@kernel.dk" <axboe@kernel.dk>
CC:     "Zhang, Ning A" <ning.a.zhang@intel.com>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>
Subject: tuning ATA wait time
Thread-Topic: tuning ATA wait time
Thread-Index: AQHVBKKsc7aJwLwMO0mbKvcD7w3fcw==
Date:   Tue, 7 May 2019 07:01:21 +0000
Message-ID: <1557212480.30633.4.camel@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.16.122]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B161DD63EB8DF74EAF505D8EB732266E@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

RGVhciBtYWludGFpbmVycyBhbmQgZGV2ZWxvcGVyczoNCg0KPiAJLyogU3BlYyBtYW5kYXRlcyB0
byB3YWl0IGZvciAiPj0gMm1zIiBiZWZvcmUgY2hlY2tpbmcgc3RhdHVzDQo+IAkgKiBhZnRlciBy
ZXNldC7CoMKgV2Ugd2FpdCAxNTBtcywgYmVjYXVzZSB0aGF0IHdhcyB0aGUgbWFnaWMNCj4gCSAq
IGRlbGF5IHVzZWQgZm9yIEFUQVBJIGRldmljZXMgaW4gSGFsZSBMYW5kaXMncyBBVEFEUlZSLCBm
b3INCj4gCSAqIHRoZSBwZXJpb2Qgb2YgdGltZSBiZXR3ZWVuIHdoZW4gdGhlIEFUQSBjb21tYW5k
IHJlZ2lzdGVyIGlzDQo+IAkgKiB3cml0dGVuLCBhbmQgdGhlbiBzdGF0dXMgaXMgY2hlY2tlZC7C
oMKgQmVjYXVzZSB3YWl0aW5nIGZvcg0KPiAJICogImEgd2hpbGUiIGJlZm9yZSBjaGVja2luZyBz
dGF0dXMgaXMgZmluZSwgcG9zdCBTUlNULCB3ZQ0KPiAJICogcGVyZm9ybSB0aGlzIG1hZ2ljIGRl
bGF5IGhlcmUgYXMgd2VsbC4NCj4gCSAqDQo+IAkgKiBPbGQgZHJpdmVycy9pZGUgdXNlcyB0aGUg
Mm1TIHJ1bGUgYW5kIHRoZW4gd2FpdHMgZm9yIHJlYWR5Lg0KPiAJICovDQo+IAlBVEFfV0FJVF9B
RlRFUl9SRVNFVAk9wqDCoDE1MCwNCg0KDQppZiB0aGUgc3BlYyBtYW5kYXRlcyB0byB3YWl0IGZv
ciAiPj0ybXMiLCBzZXQgZGVmYXVsdCB3YWl0IHRpbWUgdG8NCjE1MG1zIGlzIHRvbyBtdWNoIGxv
bmdlciB0aGFuIHNwZWMuIHRoaXMgY29tbWVudCB3YXMgYWRkZWQgMTEgeWVhcnMgYWdvDQoyMDA4
LCBkb2VzIHRoZSBpc3N1ZSBzdGlsbCBleGlzdCBvbiBtb2Rlcm4gU0FUQSBjb250cm9sbGVyPw0K
DQpjb3VsZCB3ZSB0dW5pbmcgdGhpcyBmb3IgYmV0dGVyIHBlcmZvcm1hbmNlIG9uIGRyaXZlciBs
b2FkIHRpbWU/DQoNCkJSLg0KTmluZy4NCg0K
