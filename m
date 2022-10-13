Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEB65FD209
	for <lists+linux-ide@lfdr.de>; Thu, 13 Oct 2022 02:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbiJMA6m (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 12 Oct 2022 20:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232414AbiJMA6K (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 12 Oct 2022 20:58:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EB644D143;
        Wed, 12 Oct 2022 17:55:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E5132616F9;
        Thu, 13 Oct 2022 00:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6098CC433C1;
        Thu, 13 Oct 2022 00:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665620653;
        bh=eYYfN7zhVXu7HoSsesfCM1CBNUKWw1PFo052PAgMnNo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MRngRB4r3lx7aNqGdWuoEa1iAyUA459gjUg8uhG/SlhTxrGxmE6aTTPtoOseynDhU
         y66Yy7r5zJdCe9Nq0uwpV1dIuxouPwpYS8mU1lRuLbZaaCCjhLkU1WyfOPr0s7TbbQ
         dYqajiHJDVTTyKw71xeUfctTo2bv26YmmDmo8JADho2HNPIM8alMa4ypyx28UXNPn0
         oFGmMtXg6CkiChd6bQccZzs0m+gt+DH3jaEWE9mbEJyzi4qN6fr/tmMil+LTqtCjzb
         zn4HCuw0D9NnQy4OEmwaDdpbbxjnqCi7+GU16ot9p+bu5UVAvNe2OWFJGhceTzrOqy
         /oelsPI1d24eg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Hannes Reinecke <hare@suse.de>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Sasha Levin <sashal@kernel.org>, hdegoede@redhat.com,
        axboe@kernel.dk, linux-ide@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 14/33] ata: libahci_platform: Sanity check the DT child nodes number
Date:   Wed, 12 Oct 2022 20:23:13 -0400
Message-Id: <20221013002334.1894749-14-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013002334.1894749-1-sashal@kernel.org>
References: <20221013002334.1894749-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

[ Upstream commit 3c132ea6508b34956e5ed88d04936983ec230601 ]

Having greater than AHCI_MAX_PORTS (32) ports detected isn't that critical
from the further AHCI-platform initialization point of view since
exceeding the ports upper limit will cause allocating more resources than
will be used afterwards. But detecting too many child DT-nodes doesn't
seem right since it's very unlikely to have it on an ordinary platform. In
accordance with the AHCI specification there can't be more than 32 ports
implemented at least due to having the CAP.NP field of 5 bits wide and the
PI register of dword size. Thus if such situation is found the DTB must
have been corrupted and the data read from it shouldn't be reliable. Let's
consider that as an erroneous situation and halt further resources
allocation.

Note it's logically more correct to have the nports set only after the
initialization value is checked for being sane. So while at it let's make
sure nports is assigned with a correct value.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ata/libahci_platform.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platform.c
index 0910441321f7..64d6da0a5303 100644
--- a/drivers/ata/libahci_platform.c
+++ b/drivers/ata/libahci_platform.c
@@ -451,14 +451,24 @@ struct ahci_host_priv *ahci_platform_get_resources(struct platform_device *pdev,
 		}
 	}
 
-	hpriv->nports = child_nodes = of_get_child_count(dev->of_node);
+	/*
+	 * Too many sub-nodes most likely means having something wrong with
+	 * the firmware.
+	 */
+	child_nodes = of_get_child_count(dev->of_node);
+	if (child_nodes > AHCI_MAX_PORTS) {
+		rc = -EINVAL;
+		goto err_out;
+	}
 
 	/*
 	 * If no sub-node was found, we still need to set nports to
 	 * one in order to be able to use the
 	 * ahci_platform_[en|dis]able_[phys|regulators] functions.
 	 */
-	if (!child_nodes)
+	if (child_nodes)
+		hpriv->nports = child_nodes;
+	else
 		hpriv->nports = 1;
 
 	hpriv->phys = devm_kcalloc(dev, hpriv->nports, sizeof(*hpriv->phys), GFP_KERNEL);
-- 
2.35.1

