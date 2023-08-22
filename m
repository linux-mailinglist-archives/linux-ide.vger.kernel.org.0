Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E688783BF5
	for <lists+linux-ide@lfdr.de>; Tue, 22 Aug 2023 10:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbjHVIl1 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 22 Aug 2023 04:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbjHVIl0 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 22 Aug 2023 04:41:26 -0400
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A1A1AE;
        Tue, 22 Aug 2023 01:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1692693684; x=1724229684;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JEuQhJWMxvaSnNF6qgcszFDjxMGBBk4KOC8OxZoDf1E=;
  b=ofTdbXXShYyV4Yh7/hkTdqpsitSY0dZJKPKyXipydQfTtiwBRLbpG/mX
   uL9TuXRE3GoFOblXt0wHnlMeda18b7kmPXIUbAo+A+V5Z4i1zrGuiqbXP
   dFTFRogE8Oon4d696/ih5v8gSpRozVD2jFrSqwoPYnr4K+5zQzoLtS96Z
   /g5ZJESvowgJGNA64mi6qo1o0C6+wOA889euqmDlQGNcJJqr9em7GxTVt
   A4XjoMdUNcaUhtMbPQLSeVpUZ5rtvo53P8/Mc+ieW0ivxzQttG+jqYy5O
   sf2EOd5GW8LV6j0q0bhPPs7Mmzmy1lno5l91nZSVaBYXFGXR2uxF0cQWd
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,192,1684771200"; 
   d="scan'208";a="346987956"
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
  by ob1.hgst.iphmx.com with ESMTP; 22 Aug 2023 16:41:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBMEEj/Pgou7G82Sfg01Iu1N/8Z+kT5zEG/s9V2rBgOLz31zFv25DlEAWvVrSz4WctMMwtrE+1zd3CWjls+AF2gosdg3dJqDU4orBJ8zBoEkB0Lk5y1hjpNF1KS/1K2WrRxciHI+gsWP794iCZcgwXglZF4zbHJ9VvPVtf4sG67ZmRoRwfZXPzZl8gycDmNxULs173f011eEi8TvCel6DJwPgIIw1v+znqRSb7sRT531U9pBShSkIwQIpnKMtAoMPSr/Y6CX2Br/uLFpMIMD8dmDJPREMK+/UxbN3zshxGD3ghuk2/bJTzW7W9nuqhT7FXthHnaX3sHw7jEVm301NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEuQhJWMxvaSnNF6qgcszFDjxMGBBk4KOC8OxZoDf1E=;
 b=SQc7DK8Oj3Ot88Qq2sZQ3OYQmpbE5EuLoasv4C+rnvMNEkM5gqSfJkQhqRHvAVg7F3CP9ZIWq1pxSfcRx5VdPZmTLLw3KWkATSypmJ1ApIpeDCA5kbJjfVTVslvQ5nRvytaA7OL6iIW3f+bxzAtf4r0gFPwxFaRb4BTGivF9McXMiubJzh8zszGu67cjn+iDtJEodNX3Kt3ivlgztqU2olfLUlw0VgQFyI+D0+KDbDEDt6J3BJoVb6OW22m8SWc0IGN97nJDk+7CHihzCESuos6PApv6SR5wWFsGSGwsXN7CI9NAAM0ClHgiGbsgwABH9HZPiuzRKHV4iDfpOEABsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEuQhJWMxvaSnNF6qgcszFDjxMGBBk4KOC8OxZoDf1E=;
 b=mKsjM5aQsJ8DZImIAGaMSTc5/Ff2/mVfIm6cXrglWOI4siCesxBv4IbyUCEtqtnaXEjwEzNyvEivPiUkSIt4ggsPqk40N59IdrmRjCgOKnJpbTtCoEJFHLCKgGwK3icZP5JXRHkj23rT18d5meEjkWtqlRXGvvFDfqzDos1SBL4=
Received: from MN2PR04MB6272.namprd04.prod.outlook.com (2603:10b6:208:e0::27)
 by DM6PR04MB6697.namprd04.prod.outlook.com (2603:10b6:5:240::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6723.11; Tue, 22 Aug
 2023 08:41:20 +0000
Received: from MN2PR04MB6272.namprd04.prod.outlook.com
 ([fe80::d093:80b3:59e5:c8a9]) by MN2PR04MB6272.namprd04.prod.outlook.com
 ([fe80::d093:80b3:59e5:c8a9%6]) with mapi id 15.20.6723.013; Tue, 22 Aug 2023
 08:41:19 +0000
From:   Niklas Cassel <Niklas.Cassel@wdc.com>
To:     Szuying Chen <chensiying21@gmail.com>
CC:     "dlemoal@kernel.org" <dlemoal@kernel.org>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Jesse1_Chang@asmedia.com.tw" <Jesse1_Chang@asmedia.com.tw>,
        "Richard_Hsu@asmedia.com.tw" <Richard_Hsu@asmedia.com.tw>,
        Szuying Chen <Chloe_Chen@asmedia.com.tw>
Subject: Re: Re: [PATCH] ahci: libahci: clear pending interrupt status
Thread-Topic: Re: [PATCH] ahci: libahci: clear pending interrupt status
Thread-Index: AQHZ1NRspWSxu4evs0W3Ixc52Q3EYw==
Date:   Tue, 22 Aug 2023 08:41:19 +0000
Message-ID: <ZOR0rkJcY5P67yXk@x1-carbon>
References: <20230814041720.76214-1-Chloe_Chen@asmedia.com.tw>
In-Reply-To: <20230814041720.76214-1-Chloe_Chen@asmedia.com.tw>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB6272:EE_|DM6PR04MB6697:EE_
x-ms-office365-filtering-correlation-id: 1d95be33-efdb-463f-4dd7-08dba2eb8e9f
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v8d9O6tAL5B+4jErQ+/Bq9neyl57S8qr8FMVRnkDpg37hSJTqNF8hdHCnDakeXXiQ/H8m1EudVuKk3Bm6jvPzH47bjho5jvy3YxV991tqMYT/Fy4q80CCzY8J7/bzT+4RkR84HEBMuN3/MNY0p+UcKEt81HWuTsOVyMT4B3vX8091YW6jpzoVY184mk/f6Gtk0A4dHU++qnUUEwcoIPQjpF6qyPI9fOfdojSgLUtD7MupcibAaYTaSdfgUh0YRR5dK1WJMkmHu+zDTj5OsWCTydjE45QwDIzy94MYQf+bAGAD7CJPJSx2BTqVnmKHli4g2jZgBHneE39ckcwD7xBczJRxwbTP8DNkPOpeOHmeaQjnay6l251t7YCtPZGRaW074XvxnIv34e/fLOopSySfwTtmeEoAOq+8B3+heAHssoSRDqX7KOt+FKOhcm2VGJfF2O00DJt7SI5J3p7NqJEA9S/wpomcNA7tPA6GdleQbGwAYdV5zDCDTtyiRn11c6JASvJlKJHZJ0J1/jyN8q4k1lpxFPtEVQgfNjs3P+l2eMHouQ1f0kxCXmsErZa8Bq1lp9Q48FkGC5w9E45vwsppUfTn6U2aCWkVIVGgUIT6c2S0hGpzaatYU+OGpv5NvJk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR04MB6272.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(136003)(39860400002)(346002)(376002)(366004)(1800799009)(186009)(451199024)(54906003)(76116006)(66446008)(6916009)(66476007)(66556008)(64756008)(316002)(66946007)(6512007)(9686003)(82960400001)(91956017)(8676002)(8936002)(4326008)(33716001)(41300700001)(122000001)(478600001)(71200400001)(38070700005)(38100700002)(53546011)(6506007)(6486002)(83380400001)(30864003)(2906002)(86362001)(5660300002)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2ZpaGtHdU54YytnaEdZZFVqN0JhcEJuaU0vek5NMXFSSjI4bzBFQVVnWmxN?=
 =?utf-8?B?RTdnSms1bVVqd3dBWHVvcnVZbnBpdjRSSkpKN09nR0xQdlFldGtleGkxUTV6?=
 =?utf-8?B?d3lUOU0zQ0dzRGtpZGo1bS9Uak5PRm1TNU1Rek9ud0ZHaEg1QXVJMlRnKzdK?=
 =?utf-8?B?a285ZFhBYWtiVnpwMiswWW9MVG9PTmVTS3BDS3A5VUdmNFhTSkxYbUZySkhR?=
 =?utf-8?B?YjBkVlp3NXlZYXlXazJjT29KOTBWRXNlZlZHbFZobzBjc0EvYW9FSG9Qbm5l?=
 =?utf-8?B?NmlLZlM1aXl6am9SYVRoWjBZSjJ2QVR2MUhlQWs1S0Q1eDV0YnpTYmRjRHNy?=
 =?utf-8?B?K0hWYWxJeWVLcHArZkJYZkp0ZHZIRm1EKzI5Q1lYVVNqTk1ZMlI4VEZ1RVVK?=
 =?utf-8?B?NUc0eWdDWGhSTFQvNTluVDhLOXJOR3NWWFNiTVV2Y21DVHBJa1czZzg0bnZN?=
 =?utf-8?B?a1RNYkMxUGYxaDhGQUZBQWJKcmdBN3kvYnI0VHZrVE4yTnhOMUphQk1xZ3Rm?=
 =?utf-8?B?UVMzRzBwWnRNQXA1cHMvcUplTjh5T2k5dU1jc2dQMmJkRnZQYnVmMTRhMXl0?=
 =?utf-8?B?a3UydnFZTnFLd0EwMHY1L0JXc1dZaXVkRkxSZ2JaZVhneVJmK3ZHOFZ6R3E0?=
 =?utf-8?B?ZWU5ekJjR09Odno5NG1JYTJoOTdnWE5rMFE1NXM4dlRRdXFzRXZvUXpOY0xM?=
 =?utf-8?B?SEJ3eTlVeDVTZXg4dHhhNjFLU29yMG15N2JRdFZKMnhWNjFPWldwQzZDejlF?=
 =?utf-8?B?eXpicjVLNnFrczllYTJuanJqUnp5N2k5dXVmN01nL0lacjc4U1p3dmxMeVpD?=
 =?utf-8?B?Yk9RTFc3QUViVFcvcnhDWHlHTXhkZDVJTFI3K1FTSE95WWxFMFVTelNXL0V2?=
 =?utf-8?B?WHNUcDg1aEUwem1zNmpXTW5LeStmd2xBcUxLZ3ZBckttU3IxbTg1K043UlRC?=
 =?utf-8?B?SFNYWDFWeWFRNXRSWldjaXlacjFGeEM4QjZLQUxVSzUwbmVmN1FWQjZzUlpt?=
 =?utf-8?B?bzg3cEVCV2dqOWxYdit1OW1WMEw1OHFGZ1daeHZHME0rNjlKTUlVNGtKYWhJ?=
 =?utf-8?B?SDdVcFNCQTY0ek4vWEpTemVaM1Nsb0wybFU2UStaRHZIcTI3Vlo5NngyUWRV?=
 =?utf-8?B?S3V1ZXZSLzFGUFJQWWN4U2h4aU9HM0VJaE5IbFhUMHI4SktueFJNZ1lxNUtW?=
 =?utf-8?B?eXB4VmcxV1JLREFXYjJzOXBlUFRvTGlpMUMyb0RBc3JXekNQems3M3hSUUZK?=
 =?utf-8?B?M21mZE1pQ3dPSUVCS01seFllN1BjMkRicEpwQWR3RVZkOVN5UU02MHJPZVVS?=
 =?utf-8?B?UTJFL2U3VkRIT3FKVUhaM3lWd2tnSm5pZWR2ZkdUbkhwZFk3YmxNSVFzdW1W?=
 =?utf-8?B?R2NIc01DcWJUeUVLSUlaTHh6TnNWLzZjSVc2enRyT2dzRVJSMXRLT0dQcUZJ?=
 =?utf-8?B?dVhWZHpWRFJ2Q0Izb3dOcWhJakhjT0prZW9iQmc1S0Fjd2VuRzRUamgwQlEz?=
 =?utf-8?B?YWJxUFpOWEM0WldxZTFBSFhWNkl3YUFkazkxb3h0bStGKzYyaTVDdVVwbE4w?=
 =?utf-8?B?aHZHdTkzcTVZWXpuUUU4anlwRXZKdE14WitJbVFEbjVQWWlmalkycTRTV2Zp?=
 =?utf-8?B?OXJpdkVqR0c2MWxyWFQrd1p6a3dJclRGT05GTnJrT3lyZDdQYWxYeTd4ZlhY?=
 =?utf-8?B?UzZPVnA3YWJKcnk4WnRWSGxPbldEZ1hZMStSQ3NGTUtXSGtZaE1Id2ZYVDds?=
 =?utf-8?B?MjhudEJOZlR0V2Vncno3M0JZeWp4a1VlbDVUQmxlaVVqT2Q0U3c5ckNVVEVy?=
 =?utf-8?B?ZDdPSVJxMis4a0VINFZUUGZzY1M0UG5UZFdtZnY3K0tEV1l4ZGthNVFKOUw5?=
 =?utf-8?B?aUE4L2xCelROcnJDR1M4NE9BMmppU1U1K2x2NW9tSEN1TC80cHN5ejFQbEpv?=
 =?utf-8?B?RjVwV2cvTUlLUHF6M0Q2OXJqTEUvd0t5eE9FOTFKRkRaOWRkcnZwUXhISWJl?=
 =?utf-8?B?WDI1K29DSUFuZnJJakp0aUFOa0M4QW83RHlKMGF5K3M4NzBoS1lZcitLd2Zo?=
 =?utf-8?B?OWo4QjNtb0lyM1RaYUFKMkZlRHYxV0t0MDF6bm5ZZzNFRHBOZVN1bFJhVkpp?=
 =?utf-8?B?YkJYL1prNFUvbWhqRjRJNkZ0V2Jqb2lrSGV1Um5qOGtOMmRpL1ZhQVc5Q3I2?=
 =?utf-8?B?NHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E75C9805F1C8EE44918950645CE882B0@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /QYH7igI+yGfedo/oDIxgaMWFLhAEeOKewtMbboxavF46DFuxsLZN0mQd6NoMmAvfu5XUCr0SspuPeRyTAmshIJMf+ItYZ4wePW3+g+GYfCJpzV60vXySe6ff8hw9ET4pTQOt1MEAw+jBHdiVbz9uXOWBJIVJcQb1SyB4BCOsf5LJ1iKXnhUUD+weQsDVSCSO1ieRk0Z1vXrJFs1fuEFT9Qr+jKeUmIA31riW0RtfMjiUBmnJ5qwkwdX5AidcsZyH/9m6P8I1wubOWuaZ+enosMghlk1wZTICCRhkUqkKZV0mx8kgyRR3Pe33531s3fu1uumE4juShde2/MYsJvW3NRQ1zitNf6eynCv+dvUANyPFofkb3nRjrCx+dzQLyYsTvKGIwMKI7yr2Ce8ljdw34SmRMmTac77hVaaIn8tqRDCdrwEbmtzB9Ai8QQ3c5XbBZRFJlHTHMjiPyXJUOZRYUsSTGwLtCW3kbh9l23EVdrC8iyoDSDH/N6YtSfNuQpMtAptXG0VpW3M+d5FoHaSi3IizfrThDVflzyWnvXxSYEK7COjg9fyBzycR4ZPjM1wQlVeDdfPesiN8LSNyr/nmMnCYaiY/heHzUMQ9xncIsnApmkh1wOje/lOb3pdR7xsdnQYuZGs7g2dqCqh0M6RN4XCrXwG9z9Fu6csVrZe94XJTKFtRBThyCT/QmNwp0d1f2ASa2Ia4OrVhSdCRBm7pQMFc/iRuqNggRjcng74MAGhmNw4gHQZa6WOmt25Arbj/w33wKdk2vPNZYva7WmkZL91HlE8CrvEVUxbNE4IkgS9M3ztCg6cB2TLuUBncCgInE1ri75hWQkOr05H9SyN8fwwkJKwsmuRXT9OoK6rM91Ou+bi1NuCqCPm0qEqO8c2
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB6272.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d95be33-efdb-463f-4dd7-08dba2eb8e9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 08:41:19.6808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m8HbQDiLR6h/drTn5dUWUoIYb8EvBrkqpwtkB5/p7xGlJ6J8veyuvPu/53cdXaE7oytRfCrAsE1yxAefZTePzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6697
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

T24gTW9uLCBBdWcgMTQsIDIwMjMgYXQgMTI6MTc6MjBQTSArMDgwMCwgU3p1eWluZyBDaGVuIHdy
b3RlOg0KPiBPbiA4LzEwLzIzIDE3OjU5LCBEYW1pZW4gTGUgTW9hbCB3cm90ZTogDQo+ID5PbiA4
LzEwLzIzIDE4OjMxLCBTenV5aW5nIENoZW4gd3JvdGU6DQo+ID4+PiBPbiA4LzEwLzIzIDE0OjEy
LCBEYW1pZW4gTGUgTW9hbCB3cm90ZTogDQo+ID4+PiAgICBPbiA4LzEwLzIzIDE0OjA1LCBTenV5
aW5nIENoZW4gd3JvdGU6DQo+ID4+PiAgICA+IFdoZW4gSVNSIGhhbmRsZSBpbnRlcmZhY2UgZmF0
YWwgZXJyb3Igd2l0aCBlcnJvciByZWNvdmVyeSBhZnRlciBjbGVhciBQeElTDQo+ID4+PiAgICA+
IGFuZCBQeElFLiBBbm90aGVyIEZJUyhTREIgRklTIHdpdGggZXJyKSB0aGF0IHNldCBQeElTLklG
UyB0byAxIGlzIHJlY2V2aWVkDQo+ID4+PiAgICA+IGR1cmluZyBlcnJvciByZWNvdmVyeSwgd2hp
Y2ggY2F1c2luZyB0aGUgSEJBIG5vdCBpc3N1ZSBhbnkgbmV3IGNvbW1hbmRzDQo+ID4+PiAgICA+
IGFmdGVyIGNtZC5TVCBzZXQgMS4NCj4gPj4+DQo+ID4+PiAgICBUaGlzIGlzIG5vdCB2ZXJ5IGNs
ZWFyLiBJZiB0aGVyZSB3YXMgYSBmYXRhbCBlcnJvciwgdGhlIGRyaXZlIHNob3VsZCBiZSBpbg0K
PiA+Pj4gICAgZXJyb3Igc3RhdGUgYW5kIG5vIG90aGVyIFNEQiBGSVMgY2FuIGJlIHJlY2VpdmVk
IGFzIHRoZSBkcml2ZSBkb2VzIGFic29sdXRlbHkNCj4gPj4+ICAgIG5vdGhpbmcgd2hpbGUgaW4g
ZXJyb3Igc3RhdGUgKGl0IG9ubHkgd2FpdHMgZm9yIGEgcmVhZCBsb2cgMTBoIGNvbW1hbmQgdG8g
YmU+DQo+ID4+PiAgICBpc3N1ZWQgdG8gZ2V0IGl0IG91dCBvZiBlcnJvciBzdGF0ZSkuIFNvIGlm
IHlvdSBhcmUgc2VlaW5nIDIgU0RCIEZJUyB3aXRoDQo+ID4+PiAgICBlcnJvcnMgb25lIGFmdGVy
IHRoZSBvdGhlciwgeW91IGhhdmUgYSBidWdneSBkZXZpY2UuLi4NCj4gPj4+DQo+ID4+PiAgICBI
b3dldmVyLCBJIG1heSBiZSBtaXN1bmRlcnN0YW5kaW5nIHlvdXIgaXNzdWUgaGVyZS4gQ291bGQg
eW91IHByb3ZpZGUgbW9yZQ0KPiA+Pj4gICAgZGV0YWlscyBhbmQgYSBkbWVzZyBvdXRwdXQgZXhh
bXBsZSBvZiB0aGUgaXNzdWUgPw0KPiA+PiANCj4gPj4gQWNjb3JkaW5nIHRvIEFIQ0kgMS4zLjEg
c3BlY2lmaWNhdGlvbiBjaDYuMS45LCB3aGVuIGFuIFJfRVJSIGlzIHJlY2VpdmVkDQo+ID4+IG9u
IGFuIEgyRCBEYXRhIEZJUyBpbiBub3JtYWwgb3BlcmF0aW9uLCB0aGUgSEJBIHNldHMgUHhJUy5J
RlMgdG8gMQ0KPiA+PiAoZmF0YWwgZXJyb3IpIGFuZCBoYWx0cyBvcGVyYXRpb24uIFJlZmVycmlu
ZyB0byBTQVRBIDMuMCBzcGVjaWZpY2F0aW9uIHdlDQo+ID4+IGtub3cgdGhlIGRldmljZSB3aWxs
IGhhbHQgcXVldWVkIGNvbW1hbmQgcHJvY2Vzc2luZyBhbmQgdHJhbnNtaXQgU0RCIEZJUyB0bw0K
PiA+PiBob3N0IHdpdGggRVJSIGJpdCBpbiBTdGF0dXMgZmllbGQgc2V0IHRvIG9uZShzZXQgUHhJ
Uy5URkVTIHRvIDEpLg0KPiA+DQo+ID5TdXJlLCBidXQgdGhhdCBTQkQgRklTIHNob3VsZCBiZSBj
b21wbGV0ZWx5IGlnbm9yZWQgYnkgdGhlIGFkYXB0ZXIgc2luY2UgaXQNCj4gPnN0b3BwZWQgb3Bl
cmF0aW9uLiBJZiB5b3Ugc2VlIGl0LCB0aGVuIGl0IG1lYW5zIHRoYXQgdGhlIGhhbmRsaW5nIG9m
IHRoZSBmaXJzdA0KPiA+ZXJyb3Igd2FzIGluY29tcGxldGUuDQo+ID4NCj4gVGhlIFNEQiBGSVMg
IGhhcHBlbnMgYmV0d2VlbiBweElTLklFIHdhcyBjbGVhcmVkIGFuZCBQeENNRC5TVCBub3QgY2xl
YXJlZA0KPiB0byAwLiBCZWNhdXNlIHRoZSBQeENNRC5TVCBzdGlsbCBzZXR0aW5nLCBzbyB0aGUg
U0RCIEZJUyBjYW4ndCBpZ25vcmVkLiAgDQo+IA0KPiA+PiBJbiBvdXIgY2FzZSwgdGhlIElTUiBo
YW5kbGVzIGZhdGFsIGVycm9ycyhQeElTLklGUykgYW5kIGVudGVycyBlcnJvciANCj4gPj4gcmVj
b3ZlcnkgYWZ0ZXIgY2xlYW5pbmcgdXAgUHhJUyBhbmQgUHhJRS4gVGhlbiBhIFNEQiBGSVMgaXMg
cmVjZWl2ZWQgDQo+ID4+IHdpdGggaW50ZXJydXB0IGJpdChQeElTLlRGRVMpIHNldCB0byAxLiBB
Y2NvcmRpbmcgdG8gQUhDSSAxLjMuMSANCj4gPj4gc3BlY2lmaWNhdGlvbiBjaDYuMi4yLCBIQkEg
Y2FuJ3QgaXNzdWUoY21kLlNUIHNldCB0byAxKSBhbnkgbmV3IGNvbW1hbmRzDQo+ID4+IHVuZGVy
IFB4SVMuVEZFUyBhbGl2ZSBkdXJpbmcgZXJyb3IgcmVjb3ZlcnkuDQo+ID4NCj4gPkJ1dCBob3cg
Y29tZSB5b3Ugc2VlIGEgbmV3IGNvbW1hbmQgYmVpbmcgaXNzdWVkID8gVGhpcyBlbnRpcmUgc2l0
dWF0aW9uIHNob3VsZA0KPiA+cmVzdWx0IGluIGEgcG9ydCByZXNldCB3aXRoIHRoZSBmaXJzdCBl
cnJvci4gSSBkbyBub3Qgc2VlIGhvdyB0aGlzIGlzIHBvc3NpYmxlLg0KPiA+QXJlIHlvdSBzYXlp
bmcgdGhhdCB0aGUgcG9ydCByZXNldCBpcyBub3QgY2xlYW5pbmcgdGhpbmdzIHVwIHByb3Blcmx5
ID8gQ291bGQNCj4gPnlvdSBzaGFyZSB0aGUgZG1lc2cgb3V0cHV0IG9mIHRoaXMgY2FzZSA/DQo+
ID4NCj4gPg0KPiBkbWVzZzoNCj4gWyAgNjU0LjI0NDk1OF0gbm91dmVhdSAwMDAwOjA5OjAwLjA6
IEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtJT19QQUdFX0ZBVUxUIA0KPiBkb21haW49MHgwMDE5IGFk
ZHJlc3M9MHgwIGZsYWdzPTB4MDAwMF0gDQo+IFsgIDY1NC40NjA1MjJdIG5vdXZlYXUgMDAwMDow
OTowMC4wOiBBTUQtVmk6IEV2ZW50IGxvZ2dlZCBbSU9fUEFHRV9GQVVMVCANCj4gZG9tYWluPTB4
MDAxOSBhZGRyZXNzPTB4MCBmbGFncz0weDAwMDBdIA0KPiBbICA2NTYuMTgwMzc1XSBhdGE3LjAw
OiBleGNlcHRpb24gRW1hc2sgMHgxMCBTQWN0IDB4N2MwIFNFcnIgMHgyMDAxMDANCg0KSGVsbG8g
U3p1eWluZyBDaGVuLA0KDQpGcm9tIHlvdXIgbG9ncyB3ZSBjYW4gc2VlIHRoYXQgU0VyciAweDIw
MDEwMDoNClRoaXMgbWVhbnMgdGhhdCBQeFNFUlIuRElBRy5DIHdhcyBzZXQuDQoNClRoaXMgbWVh
bnMgdGhhdDoNCiJDYWxjdWxhdGVkIERpZmZlcmVudCBDUkMgdGhhbiBSZWNlaXZlZDogV2hlbiB0
aGlzIG9jY3VycywgdGhlIEhCQSByZXR1cm5zDQpSX0VSUiBhbmQgcmV0dXJucyB0byBpZGxlLiIN
Cg0KKFNpbmNlIFB4SVMuSUZTIGlzIHNldCwgd2Uga25vdyB0aGF0IGl0IHdhcyBhIEQySCBEYXRh
IEZJUyB0aGF0IGhhZCBpbnZhbGlkDQpDUkMuIChJZiBpdCB3YXMgYSBEMkggbm9uLURhdGEgRklT
IFB4SVMuSU5GUyB3b3VsZCBoYXZlIGJlZW4gc2V0IGluc3RlYWQuKSkNCg0KDQpTbyB5b3VyIGNv
bW1pdCBtZXNzYWdlIGlzIHdyb25nLiBJbiB5b3VyIGNhc2UgaXQgaXMgdGhlIEhCQSB0aGF0IHNl
bmRzDQphIFJfRVJSIHRvIHRoZSBkZXZpY2UsIHNvIHlvdSBzaG91bGQgbG9vayBhdCAiNi4xLjEw
IENSQyBlcnJvciBpbiByZWNlaXZlZA0KRklTIiBhbmQgbm90ICI2LjEuOSBEZXZpY2UgcmVzcG9u
ZHMgdG8gRklTIHdpdGggUl9FUlIiLg0KDQoiV2hlbiBhIENSQyBlcnJvciBvY2N1cnMgb24gYSBE
MkggRGF0YSBGSVMsIHRoZSBIQkEgc2V0cyBQeElTLklGUyB0byDigJgx4oCZLg0KQWZ0ZXIgYSBD
UkMgZXJyb3Igb24gYSBEMkggRGF0YSBGSVMsIHRoZSBkZXZpY2UgbWF5IHNlbmQgYSBEMkggUmVn
aXN0ZXIgRklTDQp0byBpbmRpY2F0ZSB0aGUgcmVhc29uIGZvciB0aGUgZXJyb3IuIFRoZSBob3N0
IHNob3VsZCBhbGxvdyBwb3N0aW5nIG9mDQpub24tRGF0YSBGSVNlcyBiZWZvcmUgUHhDTUQuU1Qg
aXMgY2xlYXJlZCB0byDigJgw4oCZLiINCg0KTG9va2luZyBhdCB0aGUgc3RhdGUgbWFjaGluZSAi
NS4zLjExLjIgRFI6UmVjZWl2ZSIgeW91IHdpbGwganVtcCB0byBzdGF0ZQ0KRVJSOkZhdGFsLiAo
TWVhbmluZyB0aGF0IHdlIG5lZWQgdG8gY2xlYXIgUHhDTUQuU1QgaW4gb3JkZXIgdG8gaXNzdWUg
bmV3DQpjb21tYW5kcy4pDQoNCg0KVGhlIEhCQSBzaG91bGQgdGhpcyB0cmlnZ2VyIGFuIGVycm9y
IGlycSB3aGVuIG5vdGljaW5nIHRoZSBiYWQgQ1JDLg0KDQpJdCBpcyBwb3NzaWJsZSB0aGF0IHRo
ZSBIQkEgdHJpZ2dlcnMgYW5vdGhlciBlcnJvciBJUlEgd2hlbiByZWNlaXZpbmcNCmEgRDJIIHdp
dGggVEZFUyBiaXQgc2V0LCBpZiBpdCBpcyByZWNlaXZlZCBiZWZvcmUgUHhDTUQuU1QgaXMgY2xl
YXJlZA0KdG8gMCwgc2VlIE5EUjpBY2NlcHQ6DQpGSVMgVHlwZSBpcyBEMkggUmVnaXN0ZXIgYW5k
IFB4Q01ELlNUPTAsIGp1bXAgdG8gUDpSZWdGSVNVcGRhdGUsIHdoaWNoDQpkb2VzIG5vdCB0cmln
Z2VyIGFueSBJUlEuDQpJZiBQeENNRC5TVCBpcyBzZXQsIHRoZSBzdGF0ZSBtYWNoaW5lIHdpbGwg
aW5zdGVhZCBqdW1wIHRvIFJlZ0ZJUzpFbnRyeS4NCg0KDQpTbywgaW4gb3JkZXIgdG8gdW5kZXJz
dGFuZCB3aGF0IGlzIGdvaW5nIG9uLCBjYW4geW91IHBsZWFzZSBhZGQNCnVuY29uZGl0aW9uYWwg
cHJpbnRzIGluIGFoY2lfZXJyb3JfaW50cigpLCBzbyB3ZSBjYW4gYWN0dWFsbHkgc2VlDQpob3cg
bWFueSB0aW1lcyB0aGlzIGlzIGNhbGxlZC4gKFJpZ2h0IG5vdyBpdCBzZWVtcyB0byBvbmx5IGJl
IGNhbGxlZA0Kb25jZSkuIFBsZWFzZSBhbHNvIHByaW50IHdoZW4gUHhDTUQuU1QgaXMgY2xlYXJl
ZCB0byAwLg0KKFNvIHRoYXQgd2UgY2FuIHZlcmlmeSB0aGF0IGFoY2lfZXJyb3JfaW50cigpIGlz
IG5ldmVyIGNhbGxlZCBhZnRlcg0KdGhhdCkuIEFsc28gcGxlYXNlIHJlbW92ZSBhbGwgcHJpbnRz
IGZyb20gb3RoZXIgZHJpdmVycywgZS5nLiBub3V2ZWF1Lg0KDQoNCktpbmQgcmVnYXJkcywNCk5p
a2xhcw0KDQoNCg0KPiBhY3Rpb24gMHg2IGZyb3plbiANCj4gWyAgNjU2LjE4MDM4NF0gYXRhNy4w
MDogaXJxX3N0YXQgMHgwODAwMDAwMCwgaW50ZXJmYWNlIGZhdGFsIGVycm9yIA0KPiBbICA2NTYu
MTgwMzg2XSBhdGE3OiBTRXJyb3I6IHsgVW5yZWNvdkRhdGEgQmFkQ1JDIH0gDQo+IFsgIDY1Ni4x
ODAzODldIGF0YTcuMDA6IGZhaWxlZCBjb21tYW5kOiBSRUFEIEZQRE1BIFFVRVVFRCANCj4gWyAg
NjU2LjE4MDM5MF0gYXRhNy4wMDogY21kIDYwLzAwOjMwOjI4OmE5OjljLzBhOjAwOjAxOjAwOjAw
LzQwIHRhZyA2IG5jcSANCj4gZG1hIDEzMTA3MjAgaW4gDQo+IAlyZXMgNDAvMDA6MDE6MDA6MDA6
MDAvMDA6MDA6MDA6MDA6MDAvMDAgRW1hc2sgMHgxMCAoQVRBIGJ1cyBlcnJvcikgDQo+IFsgIDY1
Ni4xODAzOTVdIGF0YTcuMDA6IHN0YXR1czogeyBEUkRZIH0gDQo+IFsgIDY1Ni4xODAzOTddIGF0
YTcuMDA6IGZhaWxlZCBjb21tYW5kOiBSRUFEIEZQRE1BIFFVRVVFRCANCj4gWyAgNjU2LjE4MDM5
OF0gYXRhNy4wMDogY21kIDYwLzAwOjM4OjI4OmIzOjljLzBhOjAwOjAxOjAwOjAwLzQwIHRhZyA3
IG5jcSANCj4gZG1hIDEzMTA3MjAgaW4gDQo+IAlyZXMgNDAvMDA6ZmY6MDA6MDA6MDAvMDA6MDA6
MDA6MDA6MDAvMDAgRW1hc2sgMHgxMCAoQVRBIGJ1cyBlcnJvcikgDQo+IFsgIDY1Ni4xODA0MDJd
IGF0YTcuMDA6IHN0YXR1czogeyBEUkRZIH0gDQo+IFsgIDY1Ni4xODA0MDNdIGF0YTcuMDA6IGZh
aWxlZCBjb21tYW5kOiBSRUFEIEZQRE1BIFFVRVVFRCANCj4gWyAgNjU2LjE4MDQwNF0gYXRhNy4w
MDogY21kIDYwLzAwOjQwOjI4OmJkOjljLzBhOjAwOjAxOjAwOjAwLzQwIHRhZyA4IG5jcSANCj4g
ZG1hIDEzMTA3MjAgaW4NCj4gCXJlcyA0MC8wMDpmZjowMDowMDowMC8wMDowMDowMDowMDowMC8w
MCBFbWFzayAweDEwIChBVEEgYnVzIGVycm9yKSANCj4gWyAgNjU2LjE4MDQwOF0gYXRhNy4wMDog
c3RhdHVzOiB7IERSRFkgfSANCj4gWyAgNjU2LjE4MDQxMF0gYXRhNy4wMDogZmFpbGVkIGNvbW1h
bmQ6IFJFQUQgRlBETUEgUVVFVUVEIA0KPiBbICA2NTYuMTgwNDExXSBhdGE3LjAwOiBjbWQgNjAv
MDA6NDg6Mjg6Yzc6OWMvMGE6MDA6MDE6MDA6MDAvNDAgdGFnIDkgbmNxIA0KPiBkbWEgMTMxMDcy
MCBpbiANCj4gCXJlcyA0MC8wMDpmZjowMDowMDowMC8wMDowMDowMDowMDowMC8wMCBFbWFzayAw
eDEwIChBVEEgYnVzIGVycm9yKSANCj4gWyAgNjU2LjE4MDQxNF0gYXRhNy4wMDogc3RhdHVzOiB7
IERSRFkgfSANCj4gWyAgNjU2LjE4MDQxNl0gYXRhNy4wMDogZmFpbGVkIGNvbW1hbmQ6IFJFQUQg
RlBETUEgUVVFVUVEIA0KPiBbICA2NTYuMTgwNDE3XSBhdGE3LjAwOiBjbWQgNjAvMDA6NTA6Mjg6
ZDE6OWMvMGE6MDA6MDE6MDA6MDAvNDAgdGFnIDEwIG5jcSANCj4gZG1hIDEzMTA3MjAgaW4gDQo+
IAlyZXMgNDAvMDA6ZmY6MDA6MDA6MDAvMDA6MDA6MDA6MDA6MDAvMDAgRW1hc2sgMHgxMCAoQVRB
IGJ1cyBlcnJvcikgDQo+IFsgIDY1Ni4xODA0MjFdIGF0YTcuMDA6IHN0YXR1czogeyBEUkRZIH0g
DQo+IFsgIDY1Ni4xODA0MjNdIGF0YTc6IGhhcmQgcmVzZXR0aW5nIGxpbmsgDQo+IFsgIDY1OS4y
MTAzMjhdIGFtZF9pb21tdV9yZXBvcnRfcGFnZV9mYXVsdDogNDggY2FsbGJhY2tzIHN1cHByZXNz
ZWQgDQo+IFsgIDY1OS4yMTAzMzNdIG5vdXZlYXUgMDAwMDowOTowMC4wOiBBTUQtVmk6IEV2ZW50
IGxvZ2dlZCBbSU9fUEFHRV9GQVVMVCANCj4gZG9tYWluPTB4MDAxOSBhZGRyZXNzPTB4MCBmbGFn
cz0weDAwMDBdIA0KPiBbICA2NTkuMjEwMzQ1XSBub3V2ZWF1IDAwMDA6MDk6MDAuMDogQU1ELVZp
OiBFdmVudCBsb2dnZWQgW0lPX1BBR0VfRkFVTFQgDQo+IGRvbWFpbj0weDAwMTkgYWRkcmVzcz0w
eDAgZmxhZ3M9MHgwMDAwXSANCj4gWyAgNjU5LjIxMDM1Ml0gbm91dmVhdSAwMDAwOjA5OjAwLjA6
IEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtJT19QQUdFX0ZBVUxUIA0KPiBkb21haW49MHgwMDE5IGFk
ZHJlc3M9MHgwIGZsYWdzPTB4MDAwMF0gDQo+IFsgIDY1OS44MTEwNjldIG5vdXZlYXUgMDAwMDow
OTowMC4wOiBBTUQtVmk6IEV2ZW50IGxvZ2dlZCBbSU9fUEFHRV9GQVVMVCANCj4gZG9tYWluPTB4
MDAxOSBhZGRyZXNzPTB4MCBmbGFncz0weDAwMDBdIA0KPiBbICA2NTkuODExMDgwXSBub3V2ZWF1
IDAwMDA6MDk6MDAuMDogQU1ELVZpOiBFdmVudCBsb2dnZWQgW0lPX1BBR0VfRkFVTFQgDQo+IGRv
bWFpbj0weDAwMTkgYWRkcmVzcz0weDAgZmxhZ3M9MHgwMDAwXSANCj4gWyAgNjU5LjgxMTA4Nl0g
bm91dmVhdSAwMDAwOjA5OjAwLjA6IEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtJT19QQUdFX0ZBVUxU
IA0KPiBkb21haW49MHgwMDE5IGFkZHJlc3M9MHgwIGZsYWdzPTB4MDAwMF0gDQo+IFsgIDY1OS44
Mjc2NjldIG5vdXZlYXUgMDAwMDowOTowMC4wOiBBTUQtVmk6IEV2ZW50IGxvZ2dlZCBbSU9fUEFH
RV9GQVVMVCANCj4gZG9tYWluPTB4MDAxOSBhZGRyZXNzPTB4MCBmbGFncz0weDAwMDBdIA0KPiBb
ICA2NTkuODI3Njc2XSBub3V2ZWF1IDAwMDA6MDk6MDAuMDogQU1ELVZpOiBFdmVudCBsb2dnZWQg
W0lPX1BBR0VfRkFVTFQgDQo+IGRvbWFpbj0weDAwMTkgYWRkcmVzcz0weDAgZmxhZ3M9MHgwMDAw
XSANCj4gWyAgNjU5LjgyNzY4MF0gbm91dmVhdSAwMDAwOjA5OjAwLjA6IEFNRC1WaTogRXZlbnQg
bG9nZ2VkIFtJT19QQUdFX0ZBVUxUIA0KPiBkb21haW49MHgwMDE5IGFkZHJlc3M9MHgwIGZsYWdz
PTB4MDAwMF0gDQo+IFsgIDY1OS44NzgzMTldIG5vdXZlYXUgMDAwMDowOTowMC4wOiBBTUQtVmk6
IEV2ZW50IGxvZ2dlZCBbSU9fUEFHRV9GQVVMVCANCj4gZG9tYWluPTB4MDAxOSBhZGRyZXNzPTB4
MCBmbGFncz0weDAwMDBdIA0KPiBbICA2NjQuNDI2ODA1XSBhbWRfaW9tbXVfcmVwb3J0X3BhZ2Vf
ZmF1bHQ6IDI0OCBjYWxsYmFja3Mgc3VwcHJlc3NlZCANCj4gWyAgNjY0LjQyNjgwOV0gbm91dmVh
dSAwMDAwOjA5OjAwLjA6IEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtJT19QQUdFX0ZBVUxUIA0KPiBk
b21haW49MHgwMDE5IGFkZHJlc3M9MHgwIGZsYWdzPTB4MDAwMF0gDQo+IFsgIDY2NC40MjY4MTld
IG5vdXZlYXUgMDAwMDowOTowMC4wOiBBTUQtVmk6IEV2ZW50IGxvZ2dlZCBbSU9fUEFHRV9GQVVM
VCANCj4gZG9tYWluPTB4MDAxOSBhZGRyZXNzPTB4MCBmbGFncz0weDAwMDBdIA0KPiBbICA2NjQu
NDI2ODI1XSBub3V2ZWF1IDAwMDA6MDk6MDAuMDogQU1ELVZpOiBFdmVudCBsb2dnZWQgW0lPX1BB
R0VfRkFVTFQgDQo+IGRvbWFpbj0weDAwMTkgYWRkcmVzcz0weDAgZmxhZ3M9MHgwMDAwXSANCj4g
WyAgNjY0LjY3NjI5NF0gbm91dmVhdSAwMDAwOjA5OjAwLjA6IEFNRC1WaTogRXZlbnQgbG9nZ2Vk
IFtJT19QQUdFX0ZBVUxUIA0KPiBkb21haW49MHgwMDE5IGFkZHJlc3M9MHgwIGZsYWdzPTB4MDAw
MF0gDQo+IFsgIDY2NC42NzYzMDVdIG5vdXZlYXUgMDAwMDowOTowMC4wOiBBTUQtVmk6IEV2ZW50
IGxvZ2dlZCBbSU9fUEFHRV9GQVVMVCANCj4gZG9tYWluPTB4MDAxOSBhZGRyZXNzPTB4MCBmbGFn
cz0weDAwMDBdIA0KPiBbICA2NjQuNjc2MzEzXSBub3V2ZWF1IDAwMDA6MDk6MDAuMDogQU1ELVZp
OiBFdmVudCBsb2dnZWQgW0lPX1BBR0VfRkFVTFQgDQo+IGRvbWFpbj0weDAwMTkgYWRkcmVzcz0w
eDAgZmxhZ3M9MHgwMDAwXSANCj4gWyAgNjY0LjY5MzUwMV0gbm91dmVhdSAwMDAwOjA5OjAwLjA6
IEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtJT19QQUdFX0ZBVUxUIA0KPiBkb21haW49MHgwMDE5IGFk
ZHJlc3M9MHgwIGZsYWdzPTB4MDAwMF0gDQo+IFsgIDY2NC42OTM1MTNdIG5vdXZlYXUgMDAwMDow
OTowMC4wOiBBTUQtVmk6IEV2ZW50IGxvZ2dlZCBbSU9fUEFHRV9GQVVMVCANCj4gZG9tYWluPTB4
MDAxOSBhZGRyZXNzPTB4MCBmbGFncz0weDAwMDBdIA0KPiBbICA2NjQuNjkzNTIxXSBub3V2ZWF1
IDAwMDA6MDk6MDAuMDogQU1ELVZpOiBFdmVudCBsb2dnZWQgW0lPX1BBR0VfRkFVTFQgDQo+IGRv
bWFpbj0weDAwMTkgYWRkcmVzcz0weDAgZmxhZ3M9MHgwMDAwXSANCj4gWyAgNjY0LjcxMTQ4MF0g
bm91dmVhdSAwMDAwOjA5OjAwLjA6IEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtJT19QQUdFX0ZBVUxU
IA0KPiBkb21haW49MHgwMDE5IGFkZHJlc3M9MHgwIGZsYWdzPTB4MDAwMF0gDQo+IFsgIDY2Ni4x
ODAzOThdIGF0YTc6IHNvZnRyZXNldCBmYWlsZWQgKDFzdCBGSVMgZmFpbGVkKSANCj4gWyAgNjY2
LjE4MDQwNV0gYXRhNzogaGFyZCByZXNldHRpbmcgbGluayANCj4gWyAgNjcwLjA1NDk4N10gYW1k
X2lvbW11X3JlcG9ydF9wYWdlX2ZhdWx0OiA5OSBjYWxsYmFja3Mgc3VwcHJlc3NlZA0KPiBbICA2
NzAuMDU0OTkyXSBub3V2ZWF1IDAwMDA6MDk6MDAuMDogQU1ELVZpOiBFdmVudCBsb2dnZWQgW0lP
X1BBR0VfRkFVTFQgDQo+IGRvbWFpbj0weDAwMTkgYWRkcmVzcz0weDAgZmxhZ3M9MHgwMDAwXQ0K
PiBbICA2NzAuMDU1MDAzXSBub3V2ZWF1IDAwMDA6MDk6MDAuMDogQU1ELVZpOiBFdmVudCBsb2dn
ZWQgW0lPX1BBR0VfRkFVTFQgDQo+IGRvbWFpbj0weDAwMTkgYWRkcmVzcz0weDAgZmxhZ3M9MHgw
MDAwXQ0KPiBbICA2NzAuMDU1MDEwXSBub3V2ZWF1IDAwMDA6MDk6MDAuMDogQU1ELVZpOiBFdmVu
dCBsb2dnZWQgW0lPX1BBR0VfRkFVTFQgDQo+IGRvbWFpbj0weDAwMTkgYWRkcmVzcz0weDAgZmxh
Z3M9MHgwMDAwXQ0KPiANCj4gDQo+IGRtZXNnIChhZGQgY2xlYXIgcGVuZGluZyBJbnRlcnJ1cHQp
Og0KPiBbICAxMjAuMjM2ODQ3XSBhaGNpX2Vycm9yX2ludHI6IGludGVyZmFjZSBmYXRhbCBlcnJv
cg0KPiBbICAxMjAuMjM2ODU0XSBhaGNpX2Vycm9yX2ludHI6IGZyZWV6ZSAoc2V0IFB4SUUgdG8g
MCkNCj4gWyAgMTIwLjI2NTI2OF0gYXRhNzogbGltaXRpbmcgU0FUQSBsaW5rIHNwZWVkIHRvIDMu
MCBHYnBzDQo+IFsgIDEyMC4yNjUyNzVdIGF0YTcuMDA6IGV4Y2VwdGlvbiBFbWFzayAweDEwIFNB
Y3QgMHgzZjAgU0VyciAweDQwMDAwMCANCj4gYWN0aW9uIDB4NiBmcm96ZW4NCj4gWyAgMTIwLjI2
NTI3OV0gYXRhNy4wMDogaXJxX3N0YXQgMHgwODAwMDAwMCwgaW50ZXJmYWNlIGZhdGFsIGVycm9y
DQo+IFsgIDEyMC4yNjUyODFdIGF0YTc6IFNFcnJvcjogeyBIYW5kc2hrIH0NCj4gWyAgMTIwLjI2
NTI4NV0gYXRhNy4wMDogZmFpbGVkIGNvbW1hbmQ6IFdSSVRFIEZQRE1BIFFVRVVFRA0KPiBbICAx
MjAuMjY1Mjg3XSBhdGE3LjAwOiBjbWQgNjEvMDA6MjA6YTg6Yjk6NTAvMGE6MDA6MDA6MDA6MDAv
NDAgdGFnIDQgbmNxIA0KPiBkbWEgMTMxMDcyMCBvdQ0KPiAJcmVzIDQwLzAwOmZmOjAwOjAwOjAw
LzAwOjAwOjAwOjAwOjAwLzAwIEVtYXNrIDB4MTAgKEFUQSBidXMgZXJyb3IpDQo+IFsgIDEyMC4y
NjUyOTVdIGF0YTcuMDA6IHN0YXR1czogeyBEUkRZIH0NCj4gWyAgMTIwLjI2NTI5N10gYXRhNy4w
MDogZmFpbGVkIGNvbW1hbmQ6IFdSSVRFIEZQRE1BIFFVRVVFRA0KPiBbICAxMjAuMjY1Mjk5XSBh
dGE3LjAwOiBjbWQgNjEvMjA6Mjg6YTg6YzM6NTAvMDM6MDA6MDA6MDA6MDAvNDAgdGFnIDUgbmNx
IA0KPiBkbWEgNDA5NjAwIG91dA0KPiAJcmVzIDQwLzAwOmZmOjAwOjAwOjAwLzAwOjAwOjAwOjAw
OjAwLzAwIEVtYXNrIDB4MTAgKEFUQSBidXMgZXJyb3IpDQo+IFsgIDEyMC4yNjUzMDVdIGF0YTcu
MDA6IHN0YXR1czogeyBEUkRZIH0NCj4gWyAgMTIwLjI2NTMwN10gYXRhNy4wMDogZmFpbGVkIGNv
bW1hbmQ6IFdSSVRFIEZQRE1BIFFVRVVFRA0KPiBbICAxMjAuMjY1MzA5XSBhdGE3LjAwOiBjbWQg
NjEvMDA6MzA6Yzg6YzY6NTAvMGE6MDA6MDA6MDA6MDAvNDAgdGFnIDYgbmNxIA0KPiBkbWEgMTMx
MDcyMCBvdQ0KPiAJcmVzIDQwLzAwOmZmOjAwOjAwOjAwLzAwOjAwOjAwOjAwOjAwLzAwIEVtYXNr
IDB4MTAgKEFUQSBidXMgZXJyb3IpDQo+IFsgIDEyMC4yNjUzMTRdIGF0YTcuMDA6IHN0YXR1czog
eyBEUkRZIH0NCj4gWyAgMTIwLjI2NTMxNl0gYXRhNy4wMDogZmFpbGVkIGNvbW1hbmQ6IFdSSVRF
IEZQRE1BIFFVRVVFRA0KPiBbICAxMjAuMjY1MzE4XSBhdGE3LjAwOiBjbWQgNjEvMDA6Mzg6Yzg6
ZDA6NTAvMGE6MDA6MDA6MDA6MDAvNDAgdGFnIDcgbmNxIA0KPiBkbWEgMTMxMDcyMCBvdQ0KPiAJ
cmVzIDQwLzAwOjAwOjAwOjAwOjAwLzAwOjAwOjAwOjAwOjAwLzAwIEVtYXNrIDB4MTAgKEFUQSBi
dXMgZXJyb3IpDQo+IFsgIDEyMC4yNjUzMjRdIGF0YTcuMDA6IHN0YXR1czogeyBEUkRZIH0NCj4g
WyAgMTIwLjI2NTMyNV0gYXRhNy4wMDogZmFpbGVkIGNvbW1hbmQ6IFdSSVRFIEZQRE1BIFFVRVVF
RA0KPiBbICAxMjAuMjY1MzI3XSBhdGE3LjAwOiBjbWQgNjEvMDA6NDA6Yzg6ZGE6NTAvMGE6MDA6
MDA6MDA6MDAvNDAgdGFnIDggbmNxIA0KPiBkbWEgMTMxMDcyMCBvdQ0KPiAJcmVzIDQwLzAwOjAw
OjAwOjAwOjAwLzAwOjAwOjAwOjAwOjAwLzAwIEVtYXNrIDB4MTAgKEFUQSBidXMgZXJyb3IpDQo+
IFsgIDEyMC4yNjUzMzNdIGF0YTcuMDA6IHN0YXR1czogeyBEUkRZIH0NCj4gWyAgMTIwLjI2NTMz
NF0gYXRhNy4wMDogZmFpbGVkIGNvbW1hbmQ6IFdSSVRFIEZQRE1BIFFVRVVFRA0KPiBbICAxMjAu
MjY1MzM2XSBhdGE3LjAwOiBjbWQgNjEvMDA6NDg6Yzg6ZTQ6NTAvMGE6MDA6MDA6MDA6MDAvNDAg
dGFnIDkgbmNxIA0KPiBkbWEgMTMxMDcyMCBvdQ0KPiAJcmVzIDQwLzAwOjAwOjAwOjAwOjAwLzAw
OjAwOjAwOjAwOjAwLzAwIEVtYXNrIDB4MTAgKEFUQSBidXMgZXJyb3IpDQo+IFsgIDEyMC4yNjUz
NDJdIGF0YTcuMDA6IHN0YXR1czogeyBEUkRZIH0NCj4gWyAgMTIwLjI2NTM0Nl0gYXRhNzogaGFy
ZCByZXNldHRpbmcgbGluaw0KPiBbICAxMjAuMjY1MzQ4XSBhdGE3OiBhaGNpX2hhcmRyZXNldCAq
KioqKg0KPiBbICAxMjAuMjY1MzUyXSBhaGNpIDAwMDA6MGE6MDAuMDogYWhjaV9zdG9wX2VuZ2lu
ZTogUE9SVF9JUlFfU1RBVCAweDQwMDAwMDA4DQo+IFBPUlRfQ01EIDB4MDAwNGM2MTcNCj4gWyAg
MTIwLjI2NTM1Nl0gYWhjaSAwMDAwOjBhOjAwLjA6IGFoY2lfc3RvcF9lbmdpbmU6IHNldHRpbmcg
SEJBIHRvIGlkbGUgDQo+IChzZXR0aW5nIFB4Q01ELlNUIHRvIDApIA0KPiBbICAxMjAuOTM3NTIy
XSBhaGNpIDAwMDA6MGE6MDAuMDogYWhjaV9zdGFydF9lbmdpbmU6IGNoZWNrIA0KPiBQT1JUX1ND
Ul9FUlIgMHgwMDAwMDAwMCwgYW5kIHRvIGNsZWFyDQo+IFsgIDEyMC45Mzc1MzRdIGFoY2kgMDAw
MDowYTowMC4wOiBhaGNpX3N0YXJ0X2VuZ2luZTogY2hlY2sgDQo+IFBPUlRfSVJRX1NUQVQgMHg0
MDAwMDAwOCwgYW5kIHRvIGNsZWFyIA0KPiBbICAxMjAuOTM3NTQ0XSBhdGE3OiBhaGNpX3NvZnRy
ZXNldCAqKioqKg0KPiBbICAxMjAuOTM3NTUwXSBhaGNpIDAwMDA6MGE6MDAuMDogYWhjaV9zdG9w
X2VuZ2luZTogc2V0dGluZyBIQkEgdG8gaWRsZSAgDQo+IChzZXR0aW5nIFB4Q01ELlNUIHRvIDAp
IA0KPiBbICAxMjAuOTM3NTU1XSBhaGNpIDAwMDA6MGE6MDAuMDogYWhjaV9zdGFydF9lbmdpbmU6
IGNoZWNrIA0KPiBQT1JUX1NDUl9FUlIgMHgwMDAwMDAwMCwgYW5kIHRvIGNsZWFyDQo+IFsgIDEy
MC45Mzc1NTldIGFoY2kgMDAwMDowYTowMC4wOiBhaGNpX3N0YXJ0X2VuZ2luZTogY2hlY2sgDQo+
IFBPUlRfSVJRX1NUQVQgMHgwMDAwMDAwMCwgYW5kIHRvIGNsZWFyIA0KPiBbICAxMjEuMDk3MjMx
XSBhdGE3OiBTQVRBIGxpbmsgdXAgMy4wIEdicHMgKFNTdGF0dXMgMTIzIFNDb250cm9sIDMyMCkN
Cj4gWyAgMTIxLjExMzQ5M10gYXRhNy4wMDogY29uZmlndXJlZCBmb3IgVURNQS8xMzMNCj4gWyAg
MTIxLjExMzU3MF0gYXRhNzogRUggY29tcGxldGUNCj4gDQo+IEkgaGF2ZSBwcmludGsgUHhJUyAm
IFB4Q01EIHZhbHVlcyB0byBjaGVjayBwZW5kaW5nIGludGVycnVwdC4NCj4gSXQgU0JEIEZJUyB3
aXRoIEVSUiB0byBzZXR0aW5nIFB4SVMuVEZFUyBhbmQgUHhJUy5TREJTIGJpdC4gDQo+IA0KPiA+
Pg0KPiA+Pj4gICAgPg0KPiA+Pj4gICAgPiBTaWduZWQtb2ZmLWJ5OiBTenV5aW5nIENoZW4gPENo
bG9lX0NoZW5AYXNtZWRpYS5jb20udHc+DQo+ID4+PiAgICA+IC0tLQ0KPiA+Pj4gICAgPiAgZHJp
dmVycy9hdGEvbGliYWhjaS5jIHwgMTIgKysrKysrKysrKysrDQo+ID4+PiAgICA+ICAxIGZpbGUg
Y2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4gICAgPg0KPiA+Pj4gICAgPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9hdGEvbGliYWhjaS5jIGIvZHJpdmVycy9hdGEvbGliYWhjaS5jDQo+ID4+
PiAgICA+IGluZGV4IDA2YWVjMzVmODhmMi4uMGFlNTFmZDk1ZDQ2IDEwMDY0NA0KPiA+Pj4gICAg
PiAtLS0gYS9kcml2ZXJzL2F0YS9saWJhaGNpLmMNCj4gPj4+ICAgID4gKysrIGIvZHJpdmVycy9h
dGEvbGliYWhjaS5jDQo+ID4+PiAgICA+IEBAIC02NzksOSArNjc5LDIxIEBAIHN0YXRpYyBpbnQg
YWhjaV9zY3Jfd3JpdGUoc3RydWN0IGF0YV9saW5rICpsaW5rLCB1bnNpZ25lZCBpbnQgc2NfcmVn
LCB1MzIgdmFsKQ0KPiA+Pj4gICAgPg0KPiA+Pj4gICAgPiAgdm9pZCBhaGNpX3N0YXJ0X2VuZ2lu
ZShzdHJ1Y3QgYXRhX3BvcnQgKmFwKQ0KPiA+Pj4gICAgPiAgew0KPiA+Pj4gICAgPiArICAgICBz
dHJ1Y3QgYWhjaV9ob3N0X3ByaXYgKmhwcml2ID0gYXAtPmhvc3QtPnByaXZhdGVfZGF0YTsNCj4g
Pj4+ICAgID4gICAgICAgdm9pZCBfX2lvbWVtICpwb3J0X21taW8gPSBhaGNpX3BvcnRfYmFzZShh
cCk7DQo+ID4+PiAgICA+ICAgICAgIHUzMiB0bXA7DQo+ID4+PiAgICA+DQo+ID4+PiAgICA+ICsg
ICAgIC8qIGNsZWFyIFNFcnJvciAqLw0KPiA+Pj4gICAgPiArICAgICB0bXAgPSByZWFkbChwb3J0
X21taW8gKyBQT1JUX1NDUl9FUlIpOw0KPiA+Pj4gICAgPiArICAgICB3cml0ZWwodG1wLCBwb3J0
X21taW8gKyBQT1JUX1NDUl9FUlIpOw0KPiA+Pj4gICAgPiArDQo+ID4+PiAgICA+ICsgICAgIC8q
IGNsZWFyIHBvcnQgSVJRICovDQo+ID4+PiAgICA+ICsgICAgIHRtcCA9IHJlYWRsKHBvcnRfbW1p
byArIFBPUlRfSVJRX1NUQVQpOw0KPiA+Pj4gICAgPiArICAgICBpZiAodG1wKQ0KPiA+Pj4gICAg
PiArICAgICAgICAgICAgIHdyaXRlbCh0bXAsIHBvcnRfbW1pbyArIFBPUlRfSVJRX1NUQVQpOw0K
PiA+Pj4gICAgPiArDQo+ID4+PiAgICA+ICsgICAgIHdyaXRlbCgxIDw8IGFwLT5wb3J0X25vLCBo
cHJpdi0+bW1pbyArIFBPUlRfSVJRX1NUQVQpOw0KPiA+Pj4gICAgPiArDQo+ID4+PiAgICA+ICAg
ICAgIC8qIHN0YXJ0IERNQSAqLw0KPiA+Pj4gICAgPiAgICAgICB0bXAgPSByZWFkbChwb3J0X21t
aW8gKyBQT1JUX0NNRCk7DQo+ID4+PiAgICA+ICAgICAgIHRtcCB8PSBQT1JUX0NNRF9TVEFSVDsN
Cj4gPj4+ICAgID4gLS0NCj4gPj4+ICAgID4gMi4zOS4yDQo+ID4+PiAgID4NCj4gPj4+DQo+ID4+
PiAgIC0tDQo+ID4+PiAgIERhbWllbiBMZSBNb2FsDQo+ID4+PiAgICBXZXN0ZXJuIERpZ2l0YWwg
UmVzZWFyY2gNCj4gPj4+DQo+ID4+IFRoYW5rcy4NCj4gPj4NCj4gPg0KPiA+LS0gDQo+ID5EYW1p
ZW4gTGUgTW9hbA0KPiA+V2VzdGVybiBEaWdpdGFsIFJlc2VhcmNo
