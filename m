Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0069C65BA69
	for <lists+linux-ide@lfdr.de>; Tue,  3 Jan 2023 06:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236763AbjACFWa (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 3 Jan 2023 00:22:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236862AbjACFVt (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 3 Jan 2023 00:21:49 -0500
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8DDB4
        for <linux-ide@vger.kernel.org>; Mon,  2 Jan 2023 21:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1672723179; x=1704259179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RfCzNezCIKCURHprUN2jJmFdSJzlmGw4xrYVLLd5RBo=;
  b=Kp93pKdatPG9s3Ys0j4ptFZmVQZasmiy0kEi/FuNTmF9RyJb3ge7W1mQ
   Kex4dftsSi/6t2Aqo8DKImeEr8aququYCO5QyKYMXVRLOyT/D+cHUrTNO
   efmGQnh/reqpKAukiLCspyOXw8PLfXYsH+Xm2Mg+jnwRjeFqvGXdSJGli
   KYnL8W+dSEjRXroJiVfDDht5TmjgxB9ONFAN/X44j1w07UJPwTEMWhrGk
   3KOJl0m/nUkatusyFDv9S4ZClIrHv9Rj1R8bGr/sS51oxT/ZmbcZRWtiv
   0AV/3x+kwV9o1lJjHJ5hyC0PfIH4Hn0KDUqwyms5EAf/h3pVmX4Hjv7G0
   g==;
X-IronPort-AV: E=Sophos;i="5.96,295,1665417600"; 
   d="scan'208";a="218126874"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 03 Jan 2023 13:19:38 +0800
IronPort-SDR: A5rJBVESzBBB3TgHfKjtUtssJvLihWCnTRqg422+XfFl3BO4opkhP1J+sNm1qgn66EvWQ4q4c9
 JHWkhsOBfZjhskM1q4cNAoetsHY4YOb0Lz01qbIaPn4phI1IGyUBWTDNJu0FkgeTzdPV4sGl0u
 hW8WDLLlWdDIfM25eh5JJ55qplKT0cWBwSGma1SsrLieSmQbs/xF+6+7KVBoEAERirtzbUlh5v
 ioPRFuG9RRH6PvVdNf4UFtReZd4cXWCmjRuYIyctuE3vrM9IuzKUuOv89u2fEpltlsazm16syC
 A/U=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jan 2023 20:31:52 -0800
IronPort-SDR: 1cPztNO7LA0ThHtjW1nPlgpWb+7ubqk9uRDqEtX6oCN6k1naZ185aUG4kN8BVLSqQvKtjM46Fv
 b2nLzgPjfZkZ5/l6/ljZgJIEHPVHK+hF9xzQoONXDqytopUq4lEv8rFukgcoFI0+qD65a/pHrm
 /wYVkkwEbu5QD8bf+b3ZR5iieO3zaveRlwUikyYVcoVxhknJPaarakraljBvU05aDhZjPIoSWs
 RfJ3LUDtQDNL6G3kSAEMlyaDrqqAxuWGNUUzAmIfjECc2PH+/l23VdjNGu1cFvMLl4/ISCaDaP
 FCA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jan 2023 21:19:39 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NmLdQ1cFtz1RvLy
        for <linux-ide@vger.kernel.org>; Mon,  2 Jan 2023 21:19:38 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1672723177; x=1675315178; bh=RfCzNezCIKCURHprUN
        2jJmFdSJzlmGw4xrYVLLd5RBo=; b=UU0u/TU/uNjmy4D7ug9F8GauaAUGkVFKd4
        qgpz9c2zSsWcG2sSIJ/CbBn9FUnopZQG1a6JgyE1lsYEomCzaIwqvqnziUlqPSDc
        7EAVriuydXuENdlbPTLAAD5jC6jyaBurpXXKYrkc8V+/6vhAKWtv4bJQ6TCafHGS
        ZdpclQ/7ssHeA+2H3XDUPZWqA4eilEp12JnYByVaNqL37DyqzX8WaiI1B3eahDoe
        zw5Ia4FnMdhy8ifvrF9v17HhVIsLCJ/rbd3uAejtAAPx9ydenuJGGpX2vAdu7E7g
        HyV4XxdC+luXrpObKsRMuBjyw21MIjWjWZ6L3Gnsu1HGzVA/xOcw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 0pv4WTpq1ti0 for <linux-ide@vger.kernel.org>;
        Mon,  2 Jan 2023 21:19:37 -0800 (PST)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NmLdN4Tdtz1RvTp;
        Mon,  2 Jan 2023 21:19:36 -0800 (PST)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org, linux-block@vger.kernel.org,
        Jens Axboe <axboe@kernel.dk>
Cc:     "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>,
        Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH v7 7/7] ata: libata: Enable fua support by default
Date:   Tue,  3 Jan 2023 14:19:24 +0900
Message-Id: <20230103051924.233796-8-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103051924.233796-1-damien.lemoal@opensource.wdc.com>
References: <20230103051924.233796-1-damien.lemoal@opensource.wdc.com>
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

Change the default value of the fua module parameter to 1 to enable fua
support by default for all devices supporting it.

With this change, ata_dev_config_fua() will now set the flag
ATA_DFLAG_FUA by default for devices that support FUA. This will cause
ata_scsiop_mode_sense() to set the DPOFUA bit in the DEVICE-SPECIFIC
PARAMETER field in the mode parameter header. The SCSI disk driver
performs a MODE SENSE and looks at the DPOFUA bit, it then calls
blk_queue_write_cache() with the value of the DPOFUA bit, to inform the
block layer if FUA is supported or not. The block layer will not issue
REQ_FUA requests if it has not been informed that the device actually
support FUA.

FUA support can be disabled for all drives or for individual drives
using the force=3D[ID]nofua libata module argument.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 drivers/ata/libata-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 97ade977b830..2967671131d2 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -127,9 +127,9 @@ int atapi_passthru16 =3D 1;
 module_param(atapi_passthru16, int, 0444);
 MODULE_PARM_DESC(atapi_passthru16, "Enable ATA_16 passthru for ATAPI dev=
ices (0=3Doff, 1=3Don [default])");
=20
-int libata_fua =3D 0;
+int libata_fua =3D 1;
 module_param_named(fua, libata_fua, int, 0444);
-MODULE_PARM_DESC(fua, "FUA support (0=3Doff [default], 1=3Don)");
+MODULE_PARM_DESC(fua, "FUA support (0=3Doff, 1=3Don [default])");
=20
 static int ata_ignore_hpa;
 module_param_named(ignore_hpa, ata_ignore_hpa, int, 0644);
--=20
2.39.0

