Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94F016641C2
	for <lists+linux-ide@lfdr.de>; Tue, 10 Jan 2023 14:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233615AbjAJN1l (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 10 Jan 2023 08:27:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233058AbjAJN1R (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 10 Jan 2023 08:27:17 -0500
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F6810B3
        for <linux-ide@vger.kernel.org>; Tue, 10 Jan 2023 05:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1673357236; x=1704893236;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9NoQ954DbHhZGptKeI7CVe5HvdsPZfAJoSreUyiSqMQ=;
  b=rK6uTfNYFgxnBXMDT8B56ZrEnisI6cO5kFk/WipZgP2rSogeQ8QRnBqk
   rwTlx4OOooeILVR6fX0dgNcTnlB3uyod1R4c+V63z1sm8lyTCpunfLeeH
   B2sKFHOkqw42zNycsT7Y+C3y2QBvxphL6N88EeC3lyUOY/VtbEh700K2Q
   FAZMoFLEMghOtIpJuzRoYzU1wmZH8H/PyT4ljJIOvFSExlcF2N/Ne2ZR2
   K5RCWml1cxF0xU0HAXFsG+HHbbva/gl+fhpFXGFVTHllvbzVPEkzauxq2
   /HUou/CEEJ/qWHyexK79XFwNsjovJuDnbRm664n/q6rsZvV2yQF973C/7
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,315,1665417600"; 
   d="scan'208";a="220321120"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 10 Jan 2023 21:27:16 +0800
IronPort-SDR: +CafU/cKQStcDrM7a68bvg/Nrx4QEeNvGjDOF8MRZkec+pxhU9U5CNPzXpNr8KpUWm9X6+fHsa
 JxwaqdowQZkTt/grCC2GlUM+DkKX4afumN7ilEwbA6g9wb06oaFpSZAcu/dTXGXnjPE/2/4QKI
 Q335jm8ikLaizSh6XmROvLLCHaTK2R+Wa5v0qCAXrfSFZXI9nj024ZSwgwo6ppaAxsWvrZSEed
 cuiV7m9InDkFHQABhsl+fd0LIWDs/jgBvnOZbziZu07wLuDCSLOVwTvUbwcMl1Nh5SoCpMDNpL
 e/E=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jan 2023 04:39:21 -0800
IronPort-SDR: qMsecV++Jha3raE7neEhrDrAEqJCI4+cYmpMgz+XNcybXMdHVEsfxkMOwD2AepCXrzO0FHfp49
 yrkKnXEao3hkRPitCXiKWe6StFhOvu9bPPOBtmccQ5yeE5OOfMmvHcMawcFRy4lNMnxuf8tjq6
 5KmRRKvip/aTIJ/lW7IzLy0QLfyF+X+MQlxiZIMDP2UsG+M9wsZRU7WVjZn/rDev59eqLSBER8
 dVX5eSHLgkbL5+cds9pROzA3oilB7OEZM4B43Gi/2+k4ZkHXME+QWoSbV4Fwyv9w9qU9SMFgAz
 NHM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jan 2023 05:27:16 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nrs6q6lzmz1RwqL
        for <linux-ide@vger.kernel.org>; Tue, 10 Jan 2023 05:27:15 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1673357235; x=1675949236; bh=9NoQ954DbHhZGptKeI
        7CVe5HvdsPZfAJoSreUyiSqMQ=; b=Vmnu+i171HpiBcTqWESdtDKLCNFOA4cz4r
        kHQIJJ13YxbvQpwf4HMm06pCNQobcCt6xXBYyPgGDI/BjvhOpm1ZrOn1dIfiLB9S
        AvMIRWAkjcvUCuc6THCfoxH1CoPZCrHS35TkDbsK0w5eNw0P2dGM+9QHhs24q6V6
        IWHau9SXJjagDzYfBbOCUQCnuHMpQCMYQafzkcrAuOesTBxplh0p0p7nluj+Is1K
        nopqDaOHCTN2IdxFs281D1M98hL+SYHqzCVK0UKNeTl4/LqNm4egiWwjCRWrhKn5
        cb5IwKp8PulrZ2DOEvXuHtJ7OShAakf4q2r1TXXrh0J0hh3OJhTA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id fwV6L05xcN-w for <linux-ide@vger.kernel.org>;
        Tue, 10 Jan 2023 05:27:15 -0800 (PST)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nrs6p4glgz1RvLy;
        Tue, 10 Jan 2023 05:27:14 -0800 (PST)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org, linux-block@vger.kernel.org,
        Jens Axboe <axboe@kernel.dk>
Cc:     "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Christoph Hellwig <hch@lst.de>
Subject: [PATCH v9 2/6] ata: libata: Introduce ata_ncq_supported()
Date:   Tue, 10 Jan 2023 22:27:06 +0900
Message-Id: <20230110132710.252015-3-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110132710.252015-1-damien.lemoal@opensource.wdc.com>
References: <20230110132710.252015-1-damien.lemoal@opensource.wdc.com>
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

Introduce the inline helper function ata_ncq_supported() to test if a
device supports NCQ commands. The function ata_ncq_enabled() is also
rewritten using this new helper function.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 include/linux/libata.h | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/include/linux/libata.h b/include/linux/libata.h
index 3b7f5d9e2f87..059ca7f2b69c 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -1691,21 +1691,35 @@ extern struct ata_device *ata_dev_next(struct ata=
_device *dev,
 	     (dev) =3D ata_dev_next((dev), (link), ATA_DITER_##mode))
=20
 /**
- *	ata_ncq_enabled - Test whether NCQ is enabled
- *	@dev: ATA device to test for
+ *	ata_ncq_supported - Test whether NCQ is supported
+ *	@dev: ATA device to test
  *
  *	LOCKING:
  *	spin_lock_irqsave(host lock)
  *
  *	RETURNS:
- *	1 if NCQ is enabled for @dev, 0 otherwise.
+ *	true if @dev supports NCQ, false otherwise.
  */
-static inline int ata_ncq_enabled(struct ata_device *dev)
+static inline bool ata_ncq_supported(struct ata_device *dev)
 {
 	if (!IS_ENABLED(CONFIG_SATA_HOST))
-		return 0;
-	return (dev->flags & (ATA_DFLAG_PIO | ATA_DFLAG_NCQ_OFF |
-			      ATA_DFLAG_NCQ)) =3D=3D ATA_DFLAG_NCQ;
+		return false;
+	return (dev->flags & (ATA_DFLAG_PIO | ATA_DFLAG_NCQ)) =3D=3D ATA_DFLAG_=
NCQ;
+}
+
+/**
+ *	ata_ncq_enabled - Test whether NCQ is enabled
+ *	@dev: ATA device to test
+ *
+ *	LOCKING:
+ *	spin_lock_irqsave(host lock)
+ *
+ *	RETURNS:
+ *	true if NCQ is enabled for @dev, false otherwise.
+ */
+static inline bool ata_ncq_enabled(struct ata_device *dev)
+{
+	return ata_ncq_supported(dev) && !(dev->flags & ATA_DFLAG_NCQ_OFF);
 }
=20
 static inline bool ata_fpdma_dsm_supported(struct ata_device *dev)
--=20
2.39.0

