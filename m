Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32881F87BC
	for <lists+linux-ide@lfdr.de>; Tue, 12 Nov 2019 06:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbfKLFRK (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 12 Nov 2019 00:17:10 -0500
Received: from mail-eopbgr80054.outbound.protection.outlook.com ([40.107.8.54]:31872
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725283AbfKLFRK (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 12 Nov 2019 00:17:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jygputyZUho0YKieZ+H3ayF/l8UWtrY/eLdh1UL95Zhtom0XxXnooE9cMWJFpY0nq0KRJMCMBn8BbhwOypmZwpdrQaoGE8QCNrI44fkL/oGKrBbFwDJJjO9t/qz8G6SdIz8To/w02aNSE9FGHNn3jkaE66d1SHZ3/zI6GsZd6S3+w0hP+fDkQwlfB4vrKg75xqb5qZ8RtJ89uyy/YzPncgMFVZdn71CfX7h8xBTKbL2CbBwtuH3UnGSKZAR0WMavdw89HquUr1pqP7MzQD2kpPR69PMQZS0ehoKVo1xklvXuNOFjN0eXmlZKA5UUl9E+fo719wSFW+jHTSBLX5RDVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPhhHxAHP+UuD1NdFA221pqluDn6X2kp4Z2mQ7QD8MI=;
 b=jRSjPPlmg41xW9fHmeCoE4sRUCACX8PFOSZfvf4RvatE0q0LE0Md6HAfxykYSNXrqZphn0Z01TNaZnx1iyrKrvztFV/durFS1N0LEA6XJM0XOi7CjjKUcbnsSyjcgahi/M2DLZtYgZtXyKV26XSvspIOmNhZvnLiXAlSgA2+EoczSRRRbvufiQMUBHBohDgrU5ooE383/E5P19QE4x37Spb/psXI1KSKQHlAyiIoNBSqVzzwsvzXwb3DGMORGN/OY4cShOUm4tyGQf1olRa7R05VsopZMe0umNojcGnv5SivnB1xX6EChIkygdf8y3FQjzWOj0Env3EmqZy/S+MAzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPhhHxAHP+UuD1NdFA221pqluDn6X2kp4Z2mQ7QD8MI=;
 b=MPN0oaiMsiGCv9ieqlagi0rNh47sVA+qGOrKDE2HGz7VctOY5JLpyDl3kY9cUN72La92S1JZ/8zRBCN3JFNZ3vZagJWMztf+5Wj/1iP4p8PZDFohpP6KFiHqcFfCey3Xyi1/vbbjngWCbqqgL5BjvMiOv1DDtyDIWdCCBpGKSnY=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB6337.eurprd04.prod.outlook.com (20.179.253.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Tue, 12 Nov 2019 05:16:26 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c%4]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 05:16:26 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     "axboe@kernel.dk" <axboe@kernel.dk>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "tj@kernel.org" <tj@kernel.org>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] ahci: imx: i.MX8QM: fix error handling
Thread-Topic: [PATCH] ahci: imx: i.MX8QM: fix error handling
Thread-Index: AQHVmRhVtJOcbRZcDU+JyEEqGXtClA==
Date:   Tue, 12 Nov 2019 05:16:26 +0000
Message-ID: <1573535674-25364-1-git-send-email-peng.fan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:203:2e::23) To AM0PR04MB4481.eurprd04.prod.outlook.com
 (2603:10a6:208:70::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0bf503f8-df2c-472f-db8c-08d7672f77c4
x-ms-traffictypediagnostic: AM0PR04MB6337:|AM0PR04MB6337:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB633777E56C4BF490F5401FFF88770@AM0PR04MB6337.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(51234002)(199004)(189003)(6436002)(66556008)(2906002)(50226002)(66476007)(8936002)(66946007)(81156014)(6486002)(81166006)(3846002)(6116002)(99286004)(66446008)(64756008)(316002)(54906003)(110136005)(5660300002)(8676002)(66066001)(478600001)(14454004)(52116002)(71200400001)(6512007)(4326008)(71190400001)(5024004)(14444005)(256004)(25786009)(86362001)(36756003)(305945005)(7736002)(44832011)(486006)(186003)(2201001)(2616005)(6506007)(476003)(2501003)(102836004)(26005)(386003)(7416002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6337;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KY0eLOBtDkdqWGEXEVP3gcz69Zc71CC6EALMx9hsCVPipM+WoU21JIAEa3D0Bo2uxI484UkV9xkaR1FVlg93aqfw7ahuafitjIl7VC/flH4o4ymqVT1/n9siEcqNDIrtLqY7EEdu7c9UfSl+YQCr349WCR93e5SS2OWt226Ns2S90boLFwqKjZVbzk6F2ZlSRAVRmieWwlEejTBLoiHliRJ4Eic+yYQNvq8ubTbSbG0GlsNJHXbYQNcPLM86zYXPclXtf5iGa5Zk2LFn15B5nMzV7UAlep5A1x3shj5ii7FhRYKzM9g3h0Y5hMd50jrRxWD1hrBgyAyzl7tiefzgURQJAQ3AheR6BVFaLizWNRKSWY3aS2/iOMFjulsAOrtlbnEqqsmiPtLKwKp1jt5Htd5MtqSNoW/K6op5qwPAPNLAQ90om7LLvFOvOaRND+ymuU0sekSNoMk0Q6hbQfYsnw==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf503f8-df2c-472f-db8c-08d7672f77c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 05:16:26.9226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z5Ga1WKMzW5BIitRM6PH3iwEPLs/xjcw0J7KGvJCJkJSwWO/e3WiR6OUnJk+wsraL17L2lSLlBqUqiKrGB192g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6337
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

When imx8_sata_enable failed, need to jump to path disable_clk.
Otherwise there will be kernel dump as following.
    Workqueue: events deferred_probe_work_func
    pstate: 60000005 (nZCv daif -PAN -UAO)
    pc : _regulator_put.part.27+0x34/0x158
    lr : _regulator_put.part.27+0x2c/0x158
    sp : ffff80001286bb00
    x29: ffff80001286bb00 x28: 0000000000000000
    x27: 0000000000000000 x26: ffff8000100fddf0
    x25: 0000000000000000 x24: 000000000000001b
    x23: ffff80001286bbd8 x22: ffff0008ea007600
    x21: ffff0008ea0104f0 x20: ffff0008ea007e00
    x19: ffff8000120753e8 x18: 0000000000000010
    x17: 00000000eefd8a54 x16: 00000000deadbeef
    x15: ffffffffffffffff x14: ffff800011f198c8
    x13: 0000000000000000 x12: 0000000000000001
    x11: 0000000000000000 x10: 0000000000000990
    x9 : ffff80001286b870 x8 : ffff0008eb99c0f0
    x7 : ffff0008eb99b880 x6 : ffff0008eb99b7c0
    x5 : 00000000000001df x4 : 0000000000001adb
    x3 : ffff8008de089000 x2 : a4c383a3cc862400
    x1 : 0000000000000000 x0 : 0000000000000001
    Call trace:
     _regulator_put.part.27+0x34/0x158
     regulator_put+0x34/0x48
     ahci_platform_put_resources+0x64/0xd0
     release_nodes+0x1b0/0x220
     devres_release_all+0x34/0x50
     really_probe+0x1b8/0x308
     driver_probe_device+0x54/0xe8
     __device_attach_driver+0x80/0xb8
     bus_for_each_drv+0x78/0xc8
     __device_attach+0xd4/0x130
     device_initial_probe+0x10/0x18
     bus_probe_device+0x90/0x98
     deferred_probe_work_func+0x64/0x98
     process_one_work+0x1e0/0x358
     worker_thread+0x208/0x488
     kthread+0x118/0x120
     ret_from_fork+0x10/0x18

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/ata/ahci_imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
index bfc617cc8ac5..1d6a5ef78259 100644
--- a/drivers/ata/ahci_imx.c
+++ b/drivers/ata/ahci_imx.c
@@ -692,6 +692,8 @@ static int imx_sata_enable(struct ahci_host_priv *hpriv=
)
 		}
 	} else if (imxpriv->type =3D=3D AHCI_IMX8QM) {
 		ret =3D imx8_sata_enable(hpriv);
+		if (ret)
+			goto disable_clk;
 	}
=20
 	usleep_range(1000, 2000);
--=20
2.16.4

