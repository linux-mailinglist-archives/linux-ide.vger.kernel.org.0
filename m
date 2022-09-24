Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C54945E88BE
	for <lists+linux-ide@lfdr.de>; Sat, 24 Sep 2022 08:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbiIXG3O (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 24 Sep 2022 02:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233404AbiIXG3N (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 24 Sep 2022 02:29:13 -0400
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9054C147F14
        for <linux-ide@vger.kernel.org>; Fri, 23 Sep 2022 23:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1664000950; x=1695536950;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=l3JCm5qSZzb6ujJKtq3kEW3pKkqRShXgolJdPRSTV/o=;
  b=b6oSyy3iJ1CdhawuvT927poxKpjP+Eboc6GwwJbxzgchefywN+GENW59
   BYU83WiDlSCJ2JTuVwXl0euuX1maCp9CfY3yKmRK577ttwtlTC6MM9/hJ
   oplvs7y2h4Q9R8mLqpQoiM9P51GGjErJ1xVEzV9ZVnqIGLFibdnkb91Gg
   VXL9sTVq/v8AvqQcqAuZPyeT9bx0XoMZmnZVImYGKt/P/5Oi1mQ64qB2T
   xlOP6XKDejt3bmj73oB9/g9e17U4jmSAHp3qI0gf+J+Ctmyyoalq6tqde
   P77PhzxiwvCooLmbeVA6l6/QpmintZ5LCp91+kzW1mAjfA+KXzf+zPIHG
   w==;
X-IronPort-AV: E=Sophos;i="5.93,341,1654531200"; 
   d="scan'208";a="324269414"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 24 Sep 2022 14:29:09 +0800
IronPort-SDR: 7yWsLMyCOZOy9qs+IsLHJL+ArxQUC5GkNypbxQZtQo9VqAGoK7p7SKenMtIZms2iAdGq4yO6dB
 oRprYEbaxoHfQOqmWYadf89yltWjDyT781QXDl8m4WcM8GaWgaqqEtHQgv38/FAaNmktET1imL
 pUnfyAsnhHYVjhJ+8KtjbEuI79L3fhutZZHYHHUSgEXRbb8JtsFkYxlDuLltwLNZsgIPnOwfju
 MWxpxDsiqzQMtF7ih3vsG5QW6IdVOFfiNZJD+Wr4YWQ13Y2bjc9XhuK0XSlglvwo1IV1EURpYs
 Yw3+vAjlFlRVWwTOTyCAw6Tu
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Sep 2022 22:49:11 -0700
IronPort-SDR: FrQPyNaDpzIq2AUk7nJzL4mcrepMNmoXN6H0fyeErqcpxoJ5B1f+ms5FJ223JA1uosGuQ5j5J0
 Jadmq+Ak+QwU7grFdwD1PFpGNYE/P9g42CrW2EEgg46yu2fo6J3X2gXtXoiBIhwEysUhO6giGC
 N4fBoIirQ+JV2rQfJXSrl02ORoMejmQCxtNt3uSunaisK+JeCsNjxhQkFdDuppvUUyjblmcuJN
 QP1t15u+d1xhjS46LXcoiQ9AAA+26gQz9Kz5pc9+qkTpNMOHTF0VPGx6WyR654c6LKTJtdWlPL
 L8k=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Sep 2022 23:29:11 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MZJyG6R8Yz1RwqL
        for <linux-ide@vger.kernel.org>; Fri, 23 Sep 2022 23:29:10 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1664000950; x=1666592951; bh=l3JCm5qSZzb6ujJKtq
        3kEW3pKkqRShXgolJdPRSTV/o=; b=jTc6nOKhcqhysPpB9jYB9T/At+qaWA7VIV
        4XpUIhfXQRR1kDUrLGPzA4LrUO2TW1fQnzXJ9VWFJjbfrqqjJmnbyPI7aMlTm55y
        Iqp3r0fPL7Dj/E9eIDVtdl2v6NF/+zSOVbV1p1y9pUMRrZ959nE0lahOxVpLFVB+
        d6kB/IScBSYd9TlmL2UFMmGJTi1Fq99nmxv4lvOey2squjhT7tXPawHQwkLMechC
        XGnuTp1PmbvS6NrsrJ9uTz2/2gtAruJL8MHIOUBt6/oTMSgxPz9NNJtzlBBWLvNY
        1CqxcFbPvahTUq6KK4Jff1NAwgPTeNRqqeWzf7CbdTAb/1/2M00w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Y1gCOU9UOBnp for <linux-ide@vger.kernel.org>;
        Fri, 23 Sep 2022 23:29:10 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MZJyF5PLFz1RvTp;
        Fri, 23 Sep 2022 23:29:09 -0700 (PDT)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        John Garry <john.garry@huawei.com>
Subject: [PATCH 1/2] ata: libata-scsi: Fix initialization of device queue depth
Date:   Sat, 24 Sep 2022 15:29:06 +0900
Message-Id: <20220924062907.959856-2-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220924062907.959856-1-damien.lemoal@opensource.wdc.com>
References: <20220924062907.959856-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

For SATA devices supporting NCQ, drivers using libsas first initialize a
scsi device queue depth based on the controller and device capabilities,
leading to the scsi device queue_depth field being 32 (ATA maximum queue
depth) for most setup. However, if libata was loaded using the
force=3D[ID]]noncq argument, the default queue depth should be set to 1 t=
o
reflect the fact that queuable commands will never be used. This is
consistent with manually setting a device queue depth to 1 through sysfs
as that disables NCQ use for the device.

Fix ata_scsi_dev_config() to honor the noncq parameter by sertting the
device queue depth to 1 for devices that do not have the ATA_DFLAG_NCQ
flag set.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 drivers/ata/libata-scsi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
index 29e2f55c6faa..ff9602a0e54e 100644
--- a/drivers/ata/libata-scsi.c
+++ b/drivers/ata/libata-scsi.c
@@ -1055,6 +1055,7 @@ EXPORT_SYMBOL_GPL(ata_scsi_dma_need_drain);
 int ata_scsi_dev_config(struct scsi_device *sdev, struct ata_device *dev=
)
 {
 	struct request_queue *q =3D sdev->request_queue;
+	int depth =3D 1;
=20
 	if (!ata_id_has_unload(dev->id))
 		dev->flags |=3D ATA_DFLAG_NO_UNLOAD;
@@ -1100,13 +1101,10 @@ int ata_scsi_dev_config(struct scsi_device *sdev,=
 struct ata_device *dev)
 	if (dev->flags & ATA_DFLAG_AN)
 		set_bit(SDEV_EVT_MEDIA_CHANGE, sdev->supported_events);
=20
-	if (dev->flags & ATA_DFLAG_NCQ) {
-		int depth;
-
+	if (dev->flags & ATA_DFLAG_NCQ)
 		depth =3D min(sdev->host->can_queue, ata_id_queue_depth(dev->id));
-		depth =3D min(ATA_MAX_QUEUE, depth);
-		scsi_change_queue_depth(sdev, depth);
-	}
+	depth =3D min(ATA_MAX_QUEUE, depth);
+	scsi_change_queue_depth(sdev, depth);
=20
 	if (dev->flags & ATA_DFLAG_TRUSTED)
 		sdev->security_supported =3D 1;
--=20
2.37.3

