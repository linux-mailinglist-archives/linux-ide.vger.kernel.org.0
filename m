Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9807641C03
	for <lists+linux-ide@lfdr.de>; Wed, 12 Jun 2019 08:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbfFLGKx (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 12 Jun 2019 02:10:53 -0400
Received: from mail-eopbgr60088.outbound.protection.outlook.com ([40.107.6.88]:30909
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725902AbfFLGKx (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Wed, 12 Jun 2019 02:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZ4B3yVpqWB95ARgIQBJOP1L5xDa2kSNl8zq6eo03zo=;
 b=QB256TFD8TvdqncBhSZW7r9WSCv9R/4x5k37LQZy/rx0JWVZYQL1NWUapzt+TvnYEVAfYxNt917gnH+2Jgj9lAyxNBnBqNwZHamRiOr2LwJ4iUOLqetbjwsAu4xAf2+3zJkn8tAgn4IrmvLV4MxCb11ddorZXaWGbgqoSkJPjgc=
Received: from VI1PR04MB4640.eurprd04.prod.outlook.com (20.177.56.27) by
 VI1PR04MB6031.eurprd04.prod.outlook.com (20.179.24.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 12 Jun 2019 06:10:49 +0000
Received: from VI1PR04MB4640.eurprd04.prod.outlook.com
 ([fe80::9dfe:752d:9e88:fe86]) by VI1PR04MB4640.eurprd04.prod.outlook.com
 ([fe80::9dfe:752d:9e88:fe86%7]) with mapi id 15.20.1987.010; Wed, 12 Jun 2019
 06:10:49 +0000
From:   Udit Kumar <udit.kumar@nxp.com>
To:     "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        "axboe@kernel.dk" <axboe@kernel.dk>
CC:     Varun Sethi <V.Sethi@nxp.com>, Leo Li <leoyang.li@nxp.com>,
        Andy Tang <andy.tang@nxp.com>, Udit Kumar <udit.kumar@nxp.com>
Subject: [PATCH] ahci_qoriq: bug fix for ecc_addr
Thread-Topic: [PATCH] ahci_qoriq: bug fix for ecc_addr
Thread-Index: AQHVIOWUmeLal8Pxn0+KvwDpDymBUw==
Date:   Wed, 12 Jun 2019 06:10:48 +0000
Message-ID: <1560319823-20418-1-git-send-email-udit.kumar@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PN1PR0101CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:d::30) To VI1PR04MB4640.eurprd04.prod.outlook.com
 (2603:10a6:803:70::27)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=udit.kumar@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-originating-ip: [92.120.1.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2c9f92a-7315-485b-662b-08d6eefcb621
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB6031;
x-ms-traffictypediagnostic: VI1PR04MB6031:
x-microsoft-antispam-prvs: <VI1PR04MB60317FC18AB6C45ED9079C6791EC0@VI1PR04MB6031.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(39860400002)(396003)(366004)(346002)(136003)(189003)(199004)(110136005)(478600001)(2906002)(305945005)(7736002)(54906003)(316002)(99286004)(102836004)(52116002)(81156014)(8676002)(81166006)(5660300002)(44832011)(6506007)(50226002)(386003)(8936002)(36756003)(256004)(53936002)(6512007)(6436002)(6486002)(2501003)(4744005)(25786009)(4326008)(6116002)(3846002)(66066001)(71190400001)(71200400001)(476003)(26005)(186003)(14454004)(2616005)(86362001)(68736007)(73956011)(486006)(66446008)(66946007)(64756008)(66556008)(66476007);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6031;H:VI1PR04MB4640.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: G8+3Ctwzy8/l9ocT4arHFgVyxBNgwNppT2UGoB6ZezRF+AD4ifAGXmbOkW8K6OSVaT8t+s4tuJp0Fl0u5NjPUml9y4bcHEqPhSFCDSJD1oCsWDL9+pGnw7p5fhCc1UrMh6ytSE/3ce0175a5gSX0ATDRzd63iOnk+mfOpqNJEeRBSOmKSyOq/tCs2HFFncAnikT+bCTriOUH3CM+TGMqfECjelEHskbrhGPOdkbsrF2xnivn03gxOBfKtPBBrK23/X/7DyV44bphxxNhNqBdirRIptmaLHlWMXMEgFW2gp9m0AKlrGwmAAFp8raBJzTyHggO3bVv9yttPEuOZJ1E44CjX7cE4LpgPgmMYcuRHsmafHK53aXyT8kZIusJgBOHOKbKZbCGpnjY62Dew1f15HoPsNLxnjRiRfjjFlmoyQw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c9f92a-7315-485b-662b-08d6eefcb621
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 06:10:49.7201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: udit.kumar@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6031
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

T3JpZ2luYWwgZHJpdmVyIGV4cGVjdCBhIHJlZ2lzdGVyIG5vZGUgd2l0aCBuYW1lICJzYXRhLWVj
YyINCnRoaXMgbm9kZSBpcyBvZiA2NCBiaXQgd2lkZS4NCkluIEFDUEkgc3VjaCBub2RlcyBjYW4g
YmUgcHJvdmlkZWQgd2l0aCBRV29yZE1lbW9yeSwgYnV0DQpRV29yZE1lbW9yeSBjYW4gbm90IGhv
bGQgRGVzY3JpcHRvck5hbWUgbW9yZSB0aGFuIDQgY2hhcmFjdGVycy4NCg0KVGhlcmVmb3JlIHRo
aXMgcGF0Y2ggY2hhbmdlcyBwbGF0Zm9ybSBwcm9wZXJ0eSByZXRyaXZhbCBiYXNlZA0KdXBvbiBp
bmRleCBpbnN0ZWFkIG9mIG5hbWVkLg0KDQpTaWduZWQtb2ZmLWJ5OiBVZGl0IEt1bWFyIDx1ZGl0
Lmt1bWFyQG54cC5jb20+DQotLS0NCiBkcml2ZXJzL2F0YS9haGNpX3FvcmlxLmMgfCA0ICstLS0N
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pDQoNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2F0YS9haGNpX3FvcmlxLmMgYi9kcml2ZXJzL2F0YS9haGNpX3Fvcmlx
LmMNCmluZGV4IGVhMTE3NWYuLmYxNzkxMzcgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2F0YS9haGNp
X3FvcmlxLmMNCisrKyBiL2RyaXZlcnMvYXRhL2FoY2lfcW9yaXEuYw0KQEAgLTI4MSw5ICsyODEs
NyBAQCBzdGF0aWMgaW50IGFoY2lfcW9yaXFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCiAJcW9yaXFfcHJpdi0+dHlwZSA9IChlbnVtIGFoY2lfcW9yaXFfdHlwZSlvZl9pZC0+
ZGF0YTsNCiANCiAJaWYgKHVubGlrZWx5KCFlY2NfaW5pdGlhbGl6ZWQpKSB7DQotCQlyZXMgPSBw
bGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsDQotCQkJCQkJICAgSU9SRVNPVVJDRV9N
RU0sDQotCQkJCQkJICAgInNhdGEtZWNjIik7DQorCQlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3Vy
Y2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDEpOw0KIAkJaWYgKHJlcykgew0KIAkJCXFvcmlxX3By
aXYtPmVjY19hZGRyID0NCiAJCQkJZGV2bV9pb3JlbWFwX3Jlc291cmNlKGRldiwgcmVzKTsNCi0t
IA0KMS45LjENCg0K
