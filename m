Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0CD679B315
	for <lists+linux-ide@lfdr.de>; Tue, 12 Sep 2023 01:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238963AbjIKWJN (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 11 Sep 2023 18:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237342AbjIKMkg (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 11 Sep 2023 08:40:36 -0400
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB73CEB;
        Mon, 11 Sep 2023 05:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1694436030; x=1725972030;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qgYUUHBcPYiiyIl/PE9267OAPK7+W73dr+53LuQ/L0Y=;
  b=W76XPVE9uBhMHiSgrdEo3axDnauQQPUP+0wNzlaGTo3JXKR/v38Je04j
   mFFLZhzHRI7jBIX/UNHjRK7YRXox9g34rL+5cq00h5rl0aVEJba8i7daj
   BMfXg0tSiQm5xwBt2Uj+GgNLR0GAVBTYiPncqs2h6KIseFGcEbRHfm9Kv
   ji+gB+Xhee39qwPsPiT0zYE5JtF//hD+sM1OUj48EGCbx9brkQchMgLdw
   KFm/1F6m5Zrm1cvES3BIUZc268FSyCftImII269Ch5lBCvWxk2bMXFzg7
   WZm7Y5/DRIChYbN0lTd0SHWNYjEMq7F9fl8id/XjrPBQcFFkI4uIwbgYz
   Q==;
X-CSE-ConnectionGUID: 7/quHq70S4CuD6H5eyIfsA==
X-CSE-MsgGUID: 1qIoxiBXSg6VIZ6b9F1RaA==
X-IronPort-AV: E=Sophos;i="6.02,244,1688400000"; 
   d="scan'208";a="348910558"
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
  by ob1.hgst.iphmx.com with ESMTP; 11 Sep 2023 20:40:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPOhAb8f0PXwFUymWTXSHX1viITTgQEtZv/GuLmnUz3zx5f1pYRUnQgv7yg7iOpWmnbBBRdj5v+uX00XxcoPw59FC9OkzLoM3yHmEpTiqRrV1+PA9o/qkf69LSisnydHQniTnSVg3NlUHj/krWwPvFlkZoA3d1UZfCEW6jUNEQe7OmPQt2XnsbHWX+l96JSOYK1ZMJ3ByXljhbq6E5q27VcHXgzPEjd1MPw7pyhN7AoNW5D2InaNYgFwEe3Fxdy15yI+HeXrX3W6AKra0DBWLPx5tR47BhHvTqvJbRPzf1Ke8IU1UYzrjIigeWNPQ7KXgbE4dkgN0VtaqLq5PdiWgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgYUUHBcPYiiyIl/PE9267OAPK7+W73dr+53LuQ/L0Y=;
 b=WKvSFvM1e6zEuQR+0bmkcp5D8tLfwzbZnw0LzpfCBJFmVBOGDdCc+/V4JJmGtLCQKMydvP7b+KphmzqWkKIgbjj297wZkJSK5iPKJz3kMNST/jyC1rySH52lRpflwKO2h1G2+2ZPJTM/38J4DnMH4/aQ2NlkFFGrHfdO4QWtofnD7tz5IRgglSh4a3kM6KMCeLbXSHaVEM7AWhTxzEH1qipC5N/+q54XYwW9Y+4GglBf4wzT4SDNvgANWXyHigVITLqpyafE2wyKuur/tTRVoPoMye+69a3qxht2gasdXAHs4oAqeT5wHg+CDxN2v4ZurUCxT5UG7m58GdznwKnBQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgYUUHBcPYiiyIl/PE9267OAPK7+W73dr+53LuQ/L0Y=;
 b=lkWJ12kqraY/uzcC+0u/4R3dovdKj4/q1CsGPcDSFr14Uf9K9P+kHfrWcH7qCrDjtH1LVB8kp2251c6YdwudxVaHqK6mkwpxPU7+GpxNXvwqdDQYovNehgrdczfRjIRu+isdQkTp13Rn6rsYIoHIjw5fnQN8ASTFWjhNJna0I7Y=
Received: from MN2PR04MB6272.namprd04.prod.outlook.com (2603:10b6:208:e0::27)
 by CO6PR04MB7796.namprd04.prod.outlook.com (2603:10b6:303:13b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.16; Mon, 11 Sep
 2023 12:40:26 +0000
Received: from MN2PR04MB6272.namprd04.prod.outlook.com
 ([fe80::ac1f:2999:a2a6:35a5]) by MN2PR04MB6272.namprd04.prod.outlook.com
 ([fe80::ac1f:2999:a2a6:35a5%2]) with mapi id 15.20.6792.009; Mon, 11 Sep 2023
 12:40:26 +0000
From:   Niklas Cassel <Niklas.Cassel@wdc.com>
To:     Damien Le Moal <dlemoal@kernel.org>
CC:     kernel test robot <oliver.sang@intel.com>,
        "linan666@huaweicloud.com" <linan666@huaweicloud.com>,
        "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
        "lkp@intel.com" <lkp@intel.com>, luojian <luojian5@huawei.com>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        "htejun@gmail.com" <htejun@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linan122@huawei.com" <linan122@huawei.com>,
        "yukuai3@huawei.com" <yukuai3@huawei.com>,
        "yi.zhang@huawei.com" <yi.zhang@huawei.com>,
        "houtao1@huawei.com" <houtao1@huawei.com>,
        "yangerkun@huawei.com" <yangerkun@huawei.com>
Subject: Re: [PATCH v4] ata: libata-eh: Honor all EH scheduling requests
Thread-Topic: [PATCH v4] ata: libata-eh: Honor all EH scheduling requests
Thread-Index: AQHZ4V8Fhmj5bt9aZE6JyD/cOfJ8WLAP2peAgAVijoCAAFpigA==
Date:   Mon, 11 Sep 2023 12:40:26 +0000
Message-ID: <ZP8Kuag5zl90GyEx@x1-carbon>
References: <20230906084212.1016634-1-linan666@huaweicloud.com>
 <202309071557.3a90e7a8-oliver.sang@intel.com> <ZPo6fXqTbmwDyopr@x1-carbon>
 <d88625ca-9bc7-cf33-2fa7-9e71d4153e7f@kernel.org>
In-Reply-To: <d88625ca-9bc7-cf33-2fa7-9e71d4153e7f@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB6272:EE_|CO6PR04MB7796:EE_
x-ms-office365-filtering-correlation-id: b80cbb55-5e58-455b-4712-08dbb2c44643
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HbaUqEGneUSfMq6f2otGiLoOxQFbQAUC0mAZyVhuaznWdiDjiktyOWj/IfRLg35OOFXl1zkTnXtGyk8fOpCQDZ4Pbey0YNwOUKcwEpOe/C/9k7/Hoz/Qa4mPJZt6gI3ENkHzMmLXgdoyAJP+yt4Xxtic+xkbUwmepdCi0WMoBNIZmQzV4M0b1Qr2lSyTT4o9ML24Z2ZWX8sF93H8gcIkYwrRxz2Kstx5+K6FmUxUrxLMJTcW7mqoZQYQdtgQKVbOI9++k7s9vNPHepzUrbsknc6xJVc395Vs9F+J10Lk8hK+mPQpGEg6+3NBbJi1cEuX7g+wamSyy16gR8SJtq3+v4H1n4AI1wkPDbNK7WbpVDnfpNHcE1R5CnVQqXkqDs/Bp22GxUNECmJenohMfdbosSGkgIVHCS7gKUvyrDICU6ij8r1jxZZB/zy5TQ1L+7tWlvhwB0EROvyL//WQZ8l/JppFYr6WwJK/f1tvtbap+iq/oLFbsCFmOhUpUUnFK2C5k3egaoml3kSBn97hgF34he8FzZX9GNoXTtr9XEatU3tzaAWbYgwsWOcsXLlJY31SC5HW4qLMdpnRd4+qp9J1vWw6rM3G835Q5ImgGojv/8Tp1/PgPnSQCMhdcC9dh5MTx6tQUgiyKL0OwDA2sXNuLA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR04MB6272.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(396003)(366004)(346002)(136003)(376002)(1800799009)(451199024)(186009)(6486002)(9686003)(6512007)(966005)(71200400001)(76116006)(86362001)(38100700002)(122000001)(38070700005)(82960400001)(2906002)(83380400001)(26005)(53546011)(478600001)(6506007)(66946007)(91956017)(66476007)(64756008)(6916009)(66556008)(4326008)(5660300002)(41300700001)(8676002)(8936002)(33716001)(7416002)(316002)(66446008)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N282VEZpRk0vUFg2OG9INktIazBzNG1hbEI4NTc2QjRrRW5WN3lJR2pKSmFH?=
 =?utf-8?B?Y1dNN0hWNnNoZ0Ixd3dYZnRXcUs5WXNOUndvZTQ5aG1ZTVRFZUFVUWNQWEVD?=
 =?utf-8?B?cGJMUnRFOHVZTHpEd0pkTE12NjBxQWlvTHdMTm9iYU9GbVZNVGtBVHlCZnRK?=
 =?utf-8?B?c3ZVU1JBSExKRGUyOUJDN3k3eS9wSkNCSmt2akIvY1JiT0dpL2lpSTNFMDJC?=
 =?utf-8?B?UVNqTWo1eVdpdXZHZmNlQjh2VGlyYkRSZTJHV1NWWm9IYjdQMGZ2aGZlL2RI?=
 =?utf-8?B?Q0Z2Q2hmRjNGODVXSzNLZHVWdmtiSXJGaDNkKy9YMW1WZHNQTFN5bHJaMlls?=
 =?utf-8?B?QXpGOWVSZnZXQnFTdG1oY1hnR1d3Yk9CcTM0WVFZcHQvZkh3dWM2WnEyYUY2?=
 =?utf-8?B?MEpDa1Z1eC9FaC9Vb3pseUU4YWI1Q053NllzZTI3SzJkRitsS0xaVUsyanVS?=
 =?utf-8?B?Qk5Sa1NUZUIwcDhYZTdCYnM5bkx6ZmE2Vll3eHhhZ2d5SFZabEp3aU1lL21t?=
 =?utf-8?B?NS9TTHM5WHJkdmVCUGQyM0x1ZDB4V0tuUERwWi9xdWhIZ3VIdk5PdVRYQitv?=
 =?utf-8?B?VHJFVWJyaXhSRVJSMWdHcGQxTGw4bGdLZXhrd2ozMktHc2pWQWMyNG1XenFk?=
 =?utf-8?B?aUtzZ0JsTFowTE83bHFjVThpVlJNTGZselZjbnRoQkYrUlNid2kvRlVQK0h0?=
 =?utf-8?B?dW1KTWFrRERFQ2lPb1JsS2MvQTJRRmd6VWI0QVA4N0w4UzhKTWQzc3BXUUhL?=
 =?utf-8?B?SUlNUyswZjc3NjQyUUhRNytEdW9GcmZtdUVXckl0RS85L0xiZjdpNVUrOW5C?=
 =?utf-8?B?eGttWTNVZGVKSVRwSVB4cFROQVVMRkRydnFFbEtaNlhMdkRNOFNSRXRialBo?=
 =?utf-8?B?VEF4Z24yYkVWVDd4eHJRbjFJbWgzRTE3VDV3SkNXdi8wZi9NTGVtMTh4UTdt?=
 =?utf-8?B?SzVjQkkwbWowV2hKQzRlRUJ5V3VpL0g1U002QWtxSlVyd2V0aXMzKy9Semo3?=
 =?utf-8?B?VnJNanVKMnJjaTJzeHBYVUprNU9Lc3ptanYwbG5Oakhhd1VZZGtuMlcxUG4v?=
 =?utf-8?B?Ni80aU81L2l1KzZ5VlZFWk5PbW5td3c4akR3bXpydHp2RTYwQ1Y1Vi9Nd0RS?=
 =?utf-8?B?ZTE4ZERtUmh2VGgyOUlvaVgrNE02Vm1nYTBZMjc2RWlkZnpjajdTYnpmR2hP?=
 =?utf-8?B?L2FEOGoxVjlPeFpWSGhLWUdCOExtKy9YT3lNd2dlT3JMZG43V3ZCeDFYVDFu?=
 =?utf-8?B?T1JkeS8wYUxTQWdrdmR6OS84WkNCMFdWbmZDL2ViUXJadDlWcVc4L2s3bHdn?=
 =?utf-8?B?WFJ1bG85QS90QWpQajl4WUJzZVFpblhaMHdtWWRxd2IyUklrQXBIVUpxLzV0?=
 =?utf-8?B?aXJRRVdYZGF3U0NwUGhiMkxMM1RsT3M2WTh0M0t3dnJueTBlNWtQdnBOWW5m?=
 =?utf-8?B?bHFGdFQ2ckN1Ylp3TzQ3T3EyY09IYXJPVzhhbk8rdHIzMmJFS1NIY2doZXBh?=
 =?utf-8?B?VlJjelV2U0V5eFJNR055bkRDRTJEZElxQUFXVU5NV0JicVN4NDlkRG5GYlVx?=
 =?utf-8?B?bEVGeHJheDZNczYyUzR3M0U3K1BwS3A0dDcrajk0aGtWL0hxTUF1c1h6OFcv?=
 =?utf-8?B?OFhaTkx2N1dNRzl2SW15dkJpMXgvbDAxNTBLRURaZTRDUFkxNk8vem9UOWd0?=
 =?utf-8?B?emMrQnZYbmFSUENORzcvT285SWk3QmFBUkFRTWRuRllXeGNvbmsxVUY1SkI3?=
 =?utf-8?B?dHRKZVBONCtSZ2xaWW9VNG9wczFBc3p4Z3ErZzUrTDlQWFZHbmRISHU3dzVD?=
 =?utf-8?B?a2RwOFlyYU01eFcrbG0ydTU2WlByWFh2Q3cwYm92cnpEUk41TTVSNjNOZ09N?=
 =?utf-8?B?dzBwKy9HQVZSVGQvYWZmMWZ2eUYvYUhCTUF0eklzRVBwekRpTzFBZ2pLR25B?=
 =?utf-8?B?d2lMWHRubzRGdG84MUJkc1hZTU5lSjA0TkVVbkkwL2NCREhHY2ZiMVBadUNS?=
 =?utf-8?B?bzBoSHhrK1hNdjJ1Tmpqci85UGxIMFVnQmNUc1RmajRxeVlYVGJNMEhYaE5p?=
 =?utf-8?B?WUhyUDhwK21hMnZIeWlDZmJSUjRVZFZIa0FzTThCOWFhSTVyRk5IbW5IeGRo?=
 =?utf-8?B?Vk5ZRDNJbTl4cGU4eVBPMTBsNkRRUjVnQjNNL1BMd1ltRGtTejVFbjJ6aHp4?=
 =?utf-8?B?b2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A201431BF9759340B54A5450EDE52036@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?MHFrSTdJODRibkt4RGdNWHJSTHBva2xuc3FDekFqSldENjN4K1pCN1Z1TWJy?=
 =?utf-8?B?ajQ1R1JGVm55aGI2eEs1d1E2U1pJZzZmYXZCSDhlMVIrc3AxZUJxdzRzTWRW?=
 =?utf-8?B?UmhsOExKdjk4dVovZDdMcUF6Q2xmWnpzeVhtbXpFNE45eUpzdytHSnlJak9L?=
 =?utf-8?B?aTU4S3NaVDh0T3JFb3RTVlB1Qm00NE9BdE9Yblg2SWVWMFZhY0ZrSTIyNUx3?=
 =?utf-8?B?TUdsdVduNFhMOW9vTURwbnBsYlJ0NHZDRGpob0gwejJ5eHQvMW83WUFudFg0?=
 =?utf-8?B?Z0d1alZ4Z3g5d2ovWmlPSjQ2VTNrekdLU09xbkwwSCt3SkU5cDl2TUk2OFZi?=
 =?utf-8?B?WUMzbnU3NTUybE0zd3Zua1hNdGJ5YzFCWFBmUEM1WkEvMGZteFhKbDZUZDR3?=
 =?utf-8?B?UEkwL01TOHdyTE82cUROQnhXK0hPcHIzVHFmT05ER1dHeWFibmd4NEtOT1Y5?=
 =?utf-8?B?RHFYTE8wSGJVUWg2cGV1Q0ZRTlcxWjNMY254V2ZxM3g4YWtyUUxnWVVPbXc1?=
 =?utf-8?B?cldBR2lidUpMSTVHVS9jOS9vVjh0eGxERml5OHp2NzQzZ2ZyYlNRa1ZEUmZK?=
 =?utf-8?B?ZjFaRzU0L2hDbFdCU2lQYkwxRG5Na2t0ak1VQU9KUnNZTTdhMG1IYXpaNHZ2?=
 =?utf-8?B?YVdIckZWWnFFMkFrbmM5N0I5REViem8vT2lIbjRhbDdpcTdSSUJLU291VVJJ?=
 =?utf-8?B?TDhSZTRvSjdkVG83bU1jMzNQU1BtQkhWUkhUM3BLdHhCWVlFYmlOZ1F4SjJF?=
 =?utf-8?B?WXArZ2xWNmREOWx0THlTUDg1eTRDRWM2dmlZYytQMHRuc1NSUDI1cDVsQW5Z?=
 =?utf-8?B?NVE1bFA0VWFXNnRxRDJxMDM2RXBMVzJVT1lwcXlaRGRJcWtkUFV2OVVLcllM?=
 =?utf-8?B?WVY4QkdVWXRFb1BNdG5EMGhVMUhBYzlHL2lyVnlHK1VlMUIvaUdsc0FlaW5M?=
 =?utf-8?B?b3QvWkQrMjQzYUp4N1llNU1rbG8xZW4wZTJEVWZ4c1NkQ3N4a0dvblh0TG8w?=
 =?utf-8?B?em9VSHlwcEJKeWgxdTBadEpTZ01CeEdDL21qeVh1OXB5WFFia0dUeHMvNThj?=
 =?utf-8?B?eThIMnRuWmlOdkNhWk5BWHVSWDhCYTl6dTNLL3VOU0tpMFhmdzVKVk95Y3gz?=
 =?utf-8?B?c1gyWWVjVURCNzluUlFMcUkxUjNLaGowUnhBYVIvWHJTL1hOZEV4WnhsYit2?=
 =?utf-8?B?WmVkd2JPWE9haDBWcE5BdVQwOVIzeW5CY3djVjUzTXBhaE1NY1k1SW4wL2Vu?=
 =?utf-8?B?V3EyR1JsdC9VdVhiTHJkV0J2dDBuenFhUFJ6eFFBV25BZEQrUmIzODYrNlQ4?=
 =?utf-8?Q?FeZCUXCn1YO38=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB6272.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b80cbb55-5e58-455b-4712-08dbb2c44643
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2023 12:40:26.4993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tV6sno4M7nH4CKpi+MdeTsXMVLCqEDXTpv7guJXstZxO3wLyru0g5LZWv0wSpa1aRWIii6WfR1KQXwzXGEFRbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7796
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

T24gTW9uLCBTZXAgMTEsIDIwMjMgYXQgMDQ6MTY6NTVQTSArMDkwMCwgRGFtaWVuIExlIE1vYWwg
d3JvdGU6DQo+IE9uIDkvOC8yMyAwNjowMiwgTmlrbGFzIENhc3NlbCB3cm90ZToNCj4gPiBPbiBU
aHUsIFNlcCAwNywgMjAyMyBhdCAwMzo0MzoxOVBNICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3
cm90ZToNCj4gPj4NCj4gPj4NCj4gPj4gSGVsbG8sDQo+ID4+DQo+ID4+IGtlcm5lbCB0ZXN0IHJv
Ym90IG5vdGljZWQgImtlcm5lbF9CVUdfYXRfZHJpdmVycy9hdGEvbGliYXRhLXNmZi5jIiBvbjoN
Cj4gPj4NCj4gPj4gY29tbWl0OiBkM2QwOTlkNWMyZGQzOGRiODRhYmQ5NmRmMzlmOWYwODI4YzE2
YjdiICgiW1BBVENIIHY0XSBhdGE6IGxpYmF0YS1laDogSG9ub3IgYWxsIEVIIHNjaGVkdWxpbmcg
cmVxdWVzdHMiKQ0KPiA+PiB1cmw6IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC1sYWItbGtwL2xp
bnV4L2NvbW1pdHMvbGluYW42NjYtaHVhd2VpY2xvdWQtY29tL2F0YS1saWJhdGEtZWgtSG9ub3It
YWxsLUVILXNjaGVkdWxpbmctcmVxdWVzdHMvMjAyMzA5MDYtMTY0OTA3DQo+ID4+IGJhc2U6IGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2dpdC9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4
LmdpdCA2NWQ2ZTk1NGUzNzg3MmZkOWFmYjVlZjNmYzA0ODFiYjNjMmYyMGY0DQo+ID4+IHBhdGNo
IGxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDkwNjA4NDIxMi4xMDE2NjM0
LTEtbGluYW42NjZAaHVhd2VpY2xvdWQuY29tLw0KPiA+PiBwYXRjaCBzdWJqZWN0OiBbUEFUQ0gg
djRdIGF0YTogbGliYXRhLWVoOiBIb25vciBhbGwgRUggc2NoZWR1bGluZyByZXF1ZXN0cw0KPiA+
Pg0KPiA+PiBpbiB0ZXN0Y2FzZTogYm9vdA0KPiA+Pg0KPiA+PiBjb21waWxlcjogZ2NjLTEyDQo+
ID4+IHRlc3QgbWFjaGluZTogcWVtdS1zeXN0ZW0teDg2XzY0IC1lbmFibGUta3ZtIC1jcHUgU2Fu
ZHlCcmlkZ2UgLXNtcCAyIC1tIDE2Rw0KPiA+IA0KPiA+IFVuZm9ydHVuYXRlbHkgdGhlIHByb2Js
ZW0gcmVwb3J0ZWQgYnkgdGhlIGtlcm5lbCB0ZXN0IHJvYm90IGlzIHZlcnkgcmVhbC4NCj4gPiBJ
IGNvdWxkIHJlcHJvZHVjZSB3aXRob3V0IHRvbyBtdWNoIGVmZm9ydCBpbiBRRU1VLg0KPiA+IA0K
PiA+IFRoZSBwcm9ibGVtIGlzIGJhc2ljYWxseSB0aGF0IHdlIGNhbm5vdCBzaW1wbHkgcGVyZm9y
bSBhIGhvc3RfZWhfc2NoZWR1bGVkLS07DQo+ID4gaW4gYXRhX3N0ZF9lbmRfZWgoKS4NCj4gPiAN
Cj4gPiBhdGFfc3RkX2VuZF9laCgpIGlzIGNhbGxlZCBhdCB0aGUgZW5kIG9mIGF0YV9zY3NpX3Bv
cnRfZXJyb3JfaGFuZGxlcigpLA0KPiA+IHNvIGl0IGlzIGNhbGxlZCBvbmNlIGV2ZXJ5IHRpbWUg
YXRhX3Njc2lfcG9ydF9lcnJvcl9oYW5kbGVyKCkgaXMgY2FsbGVkLg0KPiA+IA0KPiA+IEhvd2V2
ZXIsIGF0YV9zY3NpX3BvcnRfZXJyb3JfaGFuZGxlcigpIHdpbGwgYmUgY2FsbGVkIGJ5IFNDU0kg
RUggZWFjaA0KPiA+IHRpbWUgU0NTSSB3YWtlcyB1cC4NCj4gPiANCj4gPiBTQ1NJIEVIIHdpbGwg
c2xlZXAgYXMgbG9uZyBhczoNCj4gPiBpZiAoKHNob3N0LT5ob3N0X2ZhaWxlZCA9PSAwICYmIHNo
b3N0LT5ob3N0X2VoX3NjaGVkdWxlZCA9PSAwKSB8fA0KPiA+ICAgICAgICAgICAgICAgICAgICAg
c2hvc3QtPmhvc3RfZmFpbGVkICE9IHNjc2lfaG9zdF9idXN5KHNob3N0KSkgew0KPiA+IAlzY2hl
ZHVsZSgpOw0KPiA+IAljb250aW51ZTsNCj4gPiB9DQo+ID4gDQo+ID4gDQo+ID4gVGhlIG1ldGhv
ZHMgaW4gbGliYXRhIHdoaWNoIHdlIHVzZSB0byB0cmlnZ2VyIEVIIGFyZToNCj4gPiANCj4gPiAx
KSBhdGFfc3RkX3NjaGVkX2VoKCksIHdoaWNoIGNhbGxzIHNjc2lfc2NoZWR1bGVfZWgoKSwgd2hp
Y2ggZG9lcw0KPiA+IGhvc3RfZWhfc2NoZWR1bGVkKys7DQo+ID4gDQo+ID4gMikgYXRhX3FjX3Nj
aGVkdWxlX2VoKCksIHdoaWNoIHdpbGwgZW5kIHVwIGluIHNjc2lfdGltZW91dCwNCj4gPiB3aGlj
aCBjYWxscyBzY3NpX2VoX3NjbWRfYWRkKCkgd2hpY2ggZG9lczoNCj4gPiBob3N0X2ZhaWxlZCsr
Ow0KPiA+IA0KPiA+IA0KPiA+IFNvIGJlZm9yZSB0aGlzIHBhdGNoLCBzZXR0aW5nIGhvc3RfZWhf
c2NoZWR1bGVkID0gMDsgaW4gYXRhX3N0ZF9lbmRfZWgoKQ0KPiA+IG1ha2VzIHVzIHNheSB0aGF0
IHdvcmtzIGJlY2F1c2UgaXQgb25seSBuZWdhdGVzIHRoZSBFSCBzY2hlZHVsZWQgYnkNCj4gPiBh
dGFfc3RkX3NjaGVkX2VoKCkuDQo+ID4gDQo+ID4gSG93ZXZlciwgaWYgd2UgZG8gaG9zdF9laF9z
Y2hlZHVsZWQtLSwgdGhlbiBpZiB0aGUgRUggd2FzIHRyaWdnZXJlZCBieQ0KPiA+IGF0YV9xY19z
Y2hlZHVsZV9laCgpLCB0aGVuIGhvc3RfZWhfc2NoZWR1bGVkIHdpbGwgZGVjcmVhc2UgPCAwLA0K
PiA+IHdoaWNoIHdpbGwgdHJpZ2dlciBTQ1NJIEVIIHRvIHdha2UgdXAgYWdhaW4gOikNCj4gPiAN
Cj4gPiBXZSBjb3VsZCBkbyBzb21ldGhpbmcgbGlrZSBvbmx5IGRlY3JlYXNpbmcgaG9zdF9laF9z
Y2hlZHVsZWQgaWYgaXQgaXMgPiAwLg0KPiA+IFRoZSBRQ3MgYWRkZWQgdG8gRUggdXNpbmcgYXRh
X3FjX3NjaGVkdWxlX2VoKCkgd2lsbCBiZSBoYW5kbGVkIGJ5DQo+ID4gYXRhX2VoX2ZpbmlzaCgp
LCB3aGljaCB3aWxsIGl0ZXJhdGUgb3ZlciBhbGwgUUNzIG93bmVkIGJ5IEVILCBhbmQgd2lsbA0K
PiA+IGVpdGhlciBmYWlsIG9yIHJldHJ5IGVhY2ggUUMuIEFmdGVyIHRoYXQgc2NzaV9lcnJvcl9o
YW5kbGVyKCkgaGFzIGZpbmlzaGVkDQo+ID4gdGhlIGNhbGwgdG8gZWhfc3RyYXRlZ3lfaGFuZGxl
cigpIChhdGFfc2NzaV9lcnJvcigpKSBpdCB3aWxsIHVuY29uZGl0aW9uYWxseQ0KPiA+IHNldCBo
b3N0X2ZhaWxlZCB0byAwOg0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9i
bG9iL3Y2LjUvZHJpdmVycy9zY3NpL3Njc2lfZXJyb3IuYyNMMjMzMS1MMjMzNw0KPiA+IA0KPiA+
IFNvIHNvbWV0aGluZyBsaWtlIHRoaXMgb24gdG9wIG9mIHRoZSBwYXRjaCBpbiAkc3ViamVjdDoN
Cj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hdGEvbGliYXRhLWVoLmMgYi9kcml2ZXJz
L2F0YS9saWJhdGEtZWguYw0KPiA+IGluZGV4IDJkNWVjZDY4YjdlMC4uOWFiMTJkN2Y2ZDlmIDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvYXRhL2xpYmF0YS1laC5jDQo+ID4gKysrIGIvZHJpdmVy
cy9hdGEvbGliYXRhLWVoLmMNCj4gPiBAQCAtOTUyLDcgKzk1MiwxMyBAQCBFWFBPUlRfU1lNQk9M
X0dQTChhdGFfc3RkX3NjaGVkX2VoKTsNCj4gPiAgICovDQo+ID4gIHZvaWQgYXRhX3N0ZF9lbmRf
ZWgoc3RydWN0IGF0YV9wb3J0ICphcCkNCj4gPiAgew0KPiA+IC0gICAgICAgYXAtPnNjc2lfaG9z
dC0+aG9zdF9laF9zY2hlZHVsZWQtLTsNCj4gPiArICAgICAgIHN0cnVjdCBTY3NpX0hvc3QgKmhv
c3QgPSBhcC0+c2NzaV9ob3N0Ow0KPiA+ICsgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4g
PiArDQo+ID4gKyAgICAgICBzcGluX2xvY2tfaXJxc2F2ZShob3N0LT5ob3N0X2xvY2ssIGZsYWdz
KTsNCj4gPiArICAgICAgIGlmIChob3N0LT5ob3N0X2VoX3NjaGVkdWxlZCA+IDApDQo+ID4gKyAg
ICAgICAgICAgICAgIGhvc3QtPmhvc3RfZWhfc2NoZWR1bGVkLS07DQo+ID4gKyAgICAgICBzcGlu
X3VubG9ja19pcnFyZXN0b3JlKGhvc3QtPmhvc3RfbG9jaywgZmxhZ3MpOw0KPiA+ICB9DQo+ID4g
IEVYUE9SVF9TWU1CT0woYXRhX3N0ZF9lbmRfZWgpOw0KPiA+IA0KPiA+IA0KPiA+IFdpdGggdGhh
dCBpbmNyZW1lbnRhbCBwYXRjaCwgSSBjYW4gbm8gbG9uZ2VyIHJlcHJvZHVjZSB0aGUgY3Jhc2gg
cmVwb3J0ZWQNCj4gPiBieSB0aGUga2VybmVsIHRlc3Qgcm9ib3QgaW4gbXkgUUVNVSBzZXR1cC4N
Cj4gDQo+IEkgYW0gbm90IGNvbmZpZGVudCB0aGF0IHBsYXlpbmcgd2l0aCBob3N0X2VoX3NjaGVk
dWxlIGNvdW50IGlzIHRoZSByaWdodA0KPiBhcHByb2FjaC4gQSBiZXR0ZXIgc29sdXRpb24gbWF5
IGJlIHRvIGNoYW5nZSB0aGUgdGltaW5nIG9mIGNsZWFyaW5nDQo+IEFUQV9QRkxBR19FSF9QRU5E
SU5HLiBSaWdodCBub3csIHRoaXMgaXMgZG9uZSBvbiBlbnRyeSB0bw0KPiBhdGFfc2NzaV9wb3J0
X2Vycm9yX2hhbmRsZXIoKSwgdW5jb25kaXRpb25hbGx5LiBTbyBhdGFfZWhfcmVzZXQoKSBzaG91
bGQgbm90DQo+IG5lZWQgdG8gY2xlYXIgdGhlIGZsYWcgYWdhaW4uIElmIHdlIHJlbW92ZSB0aGF0
LCB0aGVuIGEgbmV3IGludGVycnVwdCByZWNlaXZlZA0KPiBhZnRlciBhdGFfZWhfdGhhdygpIGFu
ZCBzZXR0aW5nIEVIX1BFTkRJTkcgd291bGQgYmUgY291Z2h0IGJ5IHRoZSByZXRyeSBsb29wIGlu
DQo+IGF0YV9zY3NpX3BvcnRfZXJyb3JfaGFuZGxlcigpLCB3aGljaCB3b3VsZCBydW4gYWdhaW4g
YXAtPm9wcy0+ZXJyb3JfaGFuZGxlcihhcCkuDQoNCkkgYWdyZWUgdGhhdCByZW1vdmluZyB0aGUg
Y2xlYXJpbmcgb2YgQVRBX1BGTEFHX0VIX1BFTkRJTkcgZnJvbSBhdGFfZWhfcmVzZXQoKQ0Kd291
bGQgYmUgYSBuaWNlciBmaXgsIGlmIHRoYXQgY2FuIGJlIGRvbmUgd2l0aG91dCBpbnRyb2R1Y2lu
ZyByZWdyZXNzaW9ucy4NCg0KTG9va2luZyBhdCBnaXQgYmxhbWU6DQpodHRwczovL2dpdGh1Yi5j
b20vdG9ydmFsZHMvbGludXgvY29tbWl0LzFlNjQxMDYwYzRiNTY0ZTgyMGFiZGI2YTRjN2E2MDNh
MGQzODYyNTANCg0KSXQgc2VlbXMgdGhhdCB0aGUgcGF0Y2ggd2FzIGFkZGVkIGJlY2F1c2Ugc29t
ZSBjb250cm9sbGVycyAibWF5IHNldCBzcHVydWlvdXMNCmVycm9yIGNvbmRpdGlvbnMgZHVyaW5n
IHJlc2V0LiINCg0KTG9va2luZyBhdCB0aGUgb3JpZ2luYWwgYnVnIHJlcG9ydCB0aGF0IHJlc3Vs
dGVkIGluIHRoaXMgd29ya2Fyb3VuZDoNCmh0dHBzOi8vbWFyYy5pbmZvLz9sPWxpbnV4LWlkZSZt
PTEyNDc2NTMyNTgyODQ5NSZ3PTINCg0KUHhJUyBpczoNClsgICAgMS40OTc4MDhdIGF0YTM6IGly
cV9zdGF0IDB4MDA0MDAwNDAsIGNvbm5lY3Rpb24gc3RhdHVzIGNoYW5nZWQNCg0KV2hpY2ggbWVh
bnMgdGhhdCBQeElTLlBDUyBhbmQgUHhJUy5QUkNTIHdhcyBzZXQuDQoNClB4SVMuUENTOg0KIlBv
cnQgQ29ubmVjdCBDaGFuZ2UgU3RhdHVzIChQQ1MpOiAxPUNoYW5nZSBpbiBDdXJyZW50IENvbm5l
Y3QgU3RhdHVzLiAwPU5vDQpjaGFuZ2UgaW4gQ3VycmVudCBDb25uZWN0IFN0YXR1cy4gVGhpcyBi
aXQgcmVmbGVjdHMgdGhlIHN0YXRlIG9mIFB4U0VSUi5ESUFHLlguDQpUaGlzIGJpdCBpcyBvbmx5
IGNsZWFyZWQgd2hlbiBQeFNFUlIuRElBRy5YIGlzIGNsZWFyZWQuIg0KDQpQeElTLlBSQ1M6DQoi
UGh5UmR5IENoYW5nZSBTdGF0dXMgKFBSQ1MpOiBXaGVuIHNldCB0byDigJgx4oCZIGluZGljYXRl
cyB0aGUgaW50ZXJuYWwgUGh5UmR5IHNpZ25hbA0KY2hhbmdlZCBzdGF0ZS4gVGhpcyBiaXQgcmVm
bGVjdHMgdGhlIHN0YXRlIG9mIFB4U0VSUi5ESUFHLk4uIFRvIGNsZWFyIHRoaXMgYml0LA0Kc29m
dHdhcmUgbXVzdCBjbGVhciBQeFNFUlIuRElBRy5OIHRvIOKAmDDigJkuIg0KDQpTbyBpdCBzZWVt
cyB0aGF0IHRoZXNlIElSUSBiaXRzIGdldCBzZXQgYXMgYSByZXN1bHQgb2YgdGhlIENPTVJFU0VU
IGl0c2VsZi4NClRodXMgdGhlIHBhdGNoIGluOg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtaWRlL2I5OTFjNzJjLTk5ZGEtZTRmMi0wNTViLWZhOGIxMmUwZWZjNEBrZXJuZWwub3JnL1Qv
I3QNCndoaWNoIGNsZWFycyBQeElTIGJlZm9yZSB0aGUgQ09NUkVTRVQpLCBpcyBub3QgcmVsZXZh
bnQgdG8gdGhpcyB3b3JrYXJvdW5kLg0KDQoNCkxvb2tpbmcgYSBiaXQgY2xvc2VyIGF0IHRoZSBv
cmlnaW5hbCBidWcgcmVwb3J0LCB0aGUgdXNlciBpcyBzaW1wbHkgY29tcGxhaW5pbmcNCnRoYXQg
aGUgaXMgc2VlaW5nIGEgaGFyZCByZXNldCBhZnRlciBwcm9iaW5nOg0KWyAgICAxLjUyMTg1Nl0g
YXRhODogZXhjZXB0aW9uIEVtYXNrIDB4MTAgU0FjdCAweDAgU0VyciAweDAgYWN0aW9uIDB4ZiB0
NA0KWyAgICAxLjUyMTkwOF0gYXRhODogaXJxX3N0YXQgMHgwMDQwMDA0MCwgY29ubmVjdGlvbiBz
dGF0dXMgY2hhbmdlZA0KWyAgICAxLjUyMTk2Ml0gYXRhODogaGFyZCByZXNldHRpbmcgbGluaw0K
DQpCdXQgb3RoZXIgdGhhbiB0aGF0LCB0aGUgSEJBIGFuZCBkcml2ZSB3b3JrcyBhcyBpdCBzaG91
bGQ6DQpodHRwczovL21hcmMuaW5mby8/bD1saW51eC1pZGUmbT0xMjQ3MDkzMTMzMjM2NTcmdz0y
DQoNCg0KTG9va2luZyBhdCB0aGUgQUhDSSAxLjMuMSBzcGVjaWZpY2F0aW9uLCBhZnRlciB0aGUg
aG9zdCBoYXMgaXNzdWVkIGEgQ09NUkVTRVQsDQp0aGUgZGV2aWNlIHdpbGwgcmVwbHkgd2lsbCBh
IENPTUlOSVQuDQoNCiJXaGVuIGEgQ09NSU5JVCBpcyByZWNlaXZlZCwgdGhlIFB4U1NUUy5ERVQg
ZmllbGQgc2hhbGwgYmUgc2V0IHRvIDFoLg0KV2hlbiB0aGUgY29tbXVuaWNhdGlvbiBuZWdvdGlh
dGlvbiBzZXF1ZW5jZSBpcyBjb21wbGV0ZSBhbmQgUGh5UmR5IGlzIHRydWUNCnRoZSBQeFNTVFMu
REVUIGZpZWxkIHNoYWxsIGJlIHNldCB0byAzaC4iDQoNCkFuZCBhY2NvcmRpbmcgdG8gIjEwLjQu
MiBQb3J0IFJlc2V0IiBpbiBBSENJIDEuMy4xLCBhZnRlciBpc3N1aW5nIGEgQ09NUkVTRVQsDQpz
b2Z0d2FyZSBtdXN0IHdhaXQgZm9yIFB4U1NUUy5ERVQgdG8gYmUgc2V0IHRvIDNoLg0KDQoNClRo
aXMgaXMgZG9uZSBieSBzYXRhX2xpbmtfaGFyZHJlc2V0KCksIHdoaWNoIGNhbGxzIHNhdGFfbGlu
a19yZXN1bWUoKSwNCndoaWNoIGNhbGxzIHNhdGFfbGlua19kZWJvdW5jZSgpLCB3aGljaCB3YWl0
cyBmb3IgUHhTU1RTLkRFVCB0byBiZSAhPSAweDEsDQphZGRpdGlvbmFsbHkgaXQgd2lsbCByZXR1
cm4gMCBpZiBQeFNTVFMuREVUID09IDB4MSBhbmQgdGltZW91dCBpcyByZWFjaGVkLi4uLi4uLg0K
KFRoaXMgaXMgYSBiaXQgdW5mb3J0dW5hdGUsIGFuZCBub3QgYWNjb3JkaW5nIHRvIEFIQ0kgc3Bl
YywgYXMgaXQgc2hvdWxkDQpzdHJpY3RseSB3YWl0IGZvciBpdCB0byBiZSAweDMuLi4gcGVyaGFw
cyB0aGVyZSBzaG91bGQgYXQgbGVhc3QgYmUgYSB3YXJuaW5nDQppZiB3ZSByZXR1cm4gd2hpbGUg
dGhlIHZhbHVlIGlzIG5vdCAweDMuLi4uLikNCg0KV2hpbGUgY2FsbGluZyBzYXRhX2xpbmtfaGFy
ZHJlc2V0KCksIHBvcnQgaXMgZnJvemVuL0lSUXMgYXJlIG1hc2tlZCwgc28gdGhpcw0Kc2hvdWxk
bid0IHRyaWdnZXIgYSBQaHlSZHkgSVJRLiBBZGRpdGlvbmFsbHkgdGhhd2luZyB0aGUgcG9ydCBj
bGVhcnMgcGVuZGluZw0KSVJRcywgc28gYW55IENPTUlOSVQgcmVjZWl2ZWQgYmVmb3JlIFB4U1NU
Uy5ERVQgZ2V0cyBzZXQgdG8gMHgzIHNob3VsZCBub3QNCnRyaWdnZXIgYW4gSVJRIHdoZW4gdGhh
d2luZyB0aGUgcG9ydC4NCg0KSWYgd2UgYXNzdW1lIHRoYXQgc2F0YV9saW5rX2RlYm91bmNlKCkg
aXMgbm90IGJyb2tlbiBhbmQgdGhlIHJlYXNvbiB3aHkNCnNhdGFfbGlua19kZWJvdW5jZSgpIHJl
dHVybmVkIHdhcyBiZWNhdXNlIFB4U1NUUy5ERVQgPT0gMHgzLCB0aGVuIHRoZSBtb3N0DQpsb2dp
Y2FsIHRoaW5nIGlzIHRoYXQgdGhpcyBpcyBhbiB1bnNvbGljaXRlZCBDT01JTklUIChpLmUuIHdl
IHJlY2VpdmVkIGENCkNPTUlOSVQgYWZ0ZXIgUHhTU1RTLkRFVCB3YXMgc2V0IHRvIDB4MyksIHNl
ZToNCiI2LjIuMi4zIFJlY292ZXJ5IG9mIFVuc29saWNpdGVkIENPTUlOSVQiIGluIEFIQ0kgMS4z
LjEuDQoNClRoZSBzcGVjIGNsYWltcyB0aGF0IHdlIHNob3VsZCBwZXJmb3JtIGFuIGFkZGl0aW9u
YWwgQ09NUkVTRVQgd2hlbiB0aGlzIGhhcHBlbnMNCih3aGVuIFB4SVMuUENTIGlzIHNldCksIHdo
aWNoIGlzIGV4YWN0bHkgd2hhdCBsaWJhaGNpIGRvZXM6DQpodHRwczovL2dpdGh1Yi5jb20vdG9y
dmFsZHMvbGludXgvYmxvYi92Ni41L2RyaXZlcnMvYXRhL2xpYmFoY2kuYyNMMTgzNA0KaHR0cHM6
Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvdjYuNS9pbmNsdWRlL2xpbnV4L2xpYmF0
YS5oI0wxNTU1DQoNCg0KU2luY2Ugd2UgY2xlYXIgYm90aCBQeElTIGFuZCBQeFNFUlIgYWZ0ZXIg
YSByZXNldCwgYmVmb3JlIHRoYXdpbmcgdGhlIHBvcnQsDQp0aGUgb25seSBsb2dpY2FsIHRoaW5n
IGlzIHRoYXQgd2UgYXJlIHJlY2VpdmluZyBhbiB1bnNvbGljaXRlZCBDT01JTklULA0KYW5kIHdo
ZW4gcmVjZWl2aW5nIGFuIHVuc29saWNpdGVkIENPTUlOSVQsIHRoZSBwcm9wZXIgYWN0aW9uIGlz
IHRvIHBlcmZvcm0NCmFuIGFkZGl0aW9uYWwgaGFyZHJlc2V0LiBTaW5jZSB0aGUgb3JpZ2luYWwg
YXV0aG9yIHdhcyBzaW1wbHkgY29tcGxhaW5pbmcNCmFib3V0IHJlc2V0IHByaW50IGluIGRtZXNn
LCBhbmQgdGhhdCBoaXMgc3lzdGVtIHdhcyBzdGlsbCB3b3JraW5nLCBJIHN1Z2dlc3QNCnRoYXQg
d2UgcmVtb3ZlIHRoZSBjbGVhcmluZyBvZiBBVEFfUEZMQUdfRUhfUEVORElORyBmcm9tIGF0YV9l
aF9yZXNldCgpLCBhcw0KaXQgYXBwZWFycyB0aGF0IGV2ZXJ5dGhpbmcgaXMgd29ya2luZyBhcyBw
ZXIgdGhlIHNwZWMuDQoNClBlcmhhcHMgd2Ugc2hvdWxkIGFsc28gYWRkIGEgd2FybmluZyBpbiBz
YXRhX2xpbmtfZGVib3VuY2UoKSBvcg0Kc2F0YV9saW5rX3Jlc3VtZSgpLCBzbyB0aGF0IHdlIGNh
biBiZSBjb25maWRlbnQgdGhhdCBQeFNTVFMuREVUIGlzIDB4MyBiZWZvcmUNCmNsZWFyaW5nIFNF
cnJvciBhbmQgUHhJUy4gKEJlY2F1c2UgaWYgdGhpcyBpcyBub3QgdGhlIGNhc2UsIHRoZW4gdGhl
IGJ1ZyBpcw0KdGhhdCBsaWJhdGEgaXMgY29udGludWluZy9yZXN1bWluZyBiZWZvcmUgdGhlIGxp
bmsgaGFzIGJlZW4gZnVsbHkgZXN0YWJsaXNoZWQuKQ0KDQoNCktpbmQgcmVnYXJkcywNCk5pa2xh
cw==
