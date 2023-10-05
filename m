Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7156A7BABAA
	for <lists+linux-ide@lfdr.de>; Thu,  5 Oct 2023 22:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbjJEU4K (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 5 Oct 2023 16:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbjJEU4J (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 5 Oct 2023 16:56:09 -0400
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CCC06A6;
        Thu,  5 Oct 2023 13:56:07 -0700 (PDT)
Received: from gsql.ggedos.sk (off-20.infotel.telecom.sk [212.5.213.20])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by hosting.gsystem.sk (Postfix) with ESMTPSA id B82437A0430;
        Thu,  5 Oct 2023 22:56:06 +0200 (CEST)
From:   Ondrej Zary <linux@zary.sk>
To:     Damien Le Moal <dlemoal@kernel.org>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Tim Waugh <tim@cyberelk.net>,
        linux-parport@lists.infradead.org, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ata: pata_parport: implement set_devctl
Date:   Thu,  5 Oct 2023 22:55:57 +0200
Message-Id: <20231005205559.6504-3-linux@zary.sk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20231005205559.6504-1-linux@zary.sk>
References: <20231005205559.6504-1-linux@zary.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Add missing ops->sff_set_devctl implementation.

Fixes: 246a1c4c6b7f ("ata: pata_parport: add driver (PARIDE replacement)")
Cc: stable@vger.kernel.org
Signed-off-by: Ondrej Zary <linux@zary.sk>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/ata/pata_parport/pata_parport.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/ata/pata_parport/pata_parport.c b/drivers/ata/pata_parport/pata_parport.c
index 258d189f42e5..cf87bbb52f1f 100644
--- a/drivers/ata/pata_parport/pata_parport.c
+++ b/drivers/ata/pata_parport/pata_parport.c
@@ -51,6 +51,13 @@ static void pata_parport_dev_select(struct ata_port *ap, unsigned int device)
 	ata_sff_pause(ap);
 }
 
+static void pata_parport_set_devctl(struct ata_port *ap, u8 ctl)
+{
+	struct pi_adapter *pi = ap->host->private_data;
+
+	pi->proto->write_regr(pi, 1, 6, ctl);
+}
+
 static bool pata_parport_devchk(struct ata_port *ap, unsigned int device)
 {
 	struct pi_adapter *pi = ap->host->private_data;
@@ -252,6 +259,7 @@ static struct ata_port_operations pata_parport_port_ops = {
 	.hardreset		= NULL,
 
 	.sff_dev_select		= pata_parport_dev_select,
+	.sff_set_devctl		= pata_parport_set_devctl,
 	.sff_check_status	= pata_parport_check_status,
 	.sff_check_altstatus	= pata_parport_check_altstatus,
 	.sff_tf_load		= pata_parport_tf_load,
-- 
Ondrej Zary

