Return-Path: <linux-ide+bounces-1567-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A45E590D773
	for <lists+linux-ide@lfdr.de>; Tue, 18 Jun 2024 17:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 498E02841BD
	for <lists+linux-ide@lfdr.de>; Tue, 18 Jun 2024 15:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0E112E6D;
	Tue, 18 Jun 2024 15:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqfuEmMG"
X-Original-To: linux-ide@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A701C4A35
	for <linux-ide@vger.kernel.org>; Tue, 18 Jun 2024 15:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718724960; cv=none; b=CjdfG8EOWtOnQ7bPpOMEZfuGWrKhPcXFJ3zLhVysL55G1P7y7IZgRu6nYVtThY4k3iHFK5lGA7cxlCzqIBZ2KH77/G26unVpUj4jEXh/pjSW+S3BdSHkE3NqPmKmno2SiwE+f9uzfAtmiRaP4g9wRgRAtGOBYUXZdoVvaVJZWV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718724960; c=relaxed/simple;
	bh=EoHDznwl9xnbrsJAqRS+9II5WH9wikgnPGUR2W32mDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=airj++HQ5ws6eAIYmgUqYxHrKvEdbK5Y0lZ5vkBhODbIuupOdCs8i8oy1RCMpgGyWLQ/RPrGE+qfEwvq62r61nj1rkiIVgtA5GmB/UaCxqpk6M+A/vYvqy+XJ0cONmsPAp9T90X03QeeFzmXiVkoC4zkTA5JnYwzgEmPgwETSBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqfuEmMG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D70EC3277B;
	Tue, 18 Jun 2024 15:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718724960;
	bh=EoHDznwl9xnbrsJAqRS+9II5WH9wikgnPGUR2W32mDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eqfuEmMGy2Q233hpmEBV0EJ9bP/0v6Bsh4Wn0SPz6T1vw+Q9vJEHKGYYx6q5ltpIJ
	 LGze+g0y2usT10ja6A3fGT6SslpQd7mj0coC4JYN5eENXEfsUDVJSUxIcGKvYQwxVZ
	 j1ueCOP6iQusB6e8cDFliCTeidWTXlUUL86IQ8xTiGFwga9B9gWJs1BW+j0xHLNzwh
	 vtStgtG9uaz1uvSeePseqwU3Hn4JPU+EZsD8bzN6QnOtchUt4KMssOEiEF/F6Ug5Ru
	 VQLACrZluguwroZpsdfzdtX5DZCyyEVRUHb5Vr8aIoJfNqtWMGTZBnSqWD9b1+AvaD
	 vysVuTywyiPDA==
From: Niklas Cassel <cassel@kernel.org>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-ide@vger.kernel.org
Subject: [PATCH 3/5] ata: libata: Assign print_id at port allocation time
Date: Tue, 18 Jun 2024 17:35:41 +0200
Message-ID: <20240618153537.2687621-10-cassel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618153537.2687621-7-cassel@kernel.org>
References: <20240618153537.2687621-7-cassel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2055; i=cassel@kernel.org; h=from:subject; bh=EoHDznwl9xnbrsJAqRS+9II5WH9wikgnPGUR2W32mDM=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGNIKV3qfOrhF54C82r2P8QnT/ZbqpaVvaVj15GzURP47O yuyk/sYOkpZGMS4GGTFFFl8f7jsL+52n3Jc8Y4NzBxWJpAhDFycAjCRNVqMDLdnvItq6XmhOOuX 4x2zKc2PViZym9kevLEhjW/S2mqVSayMDG/i3Uw0wnbK6jha94koX5P939ezK2KxYXhZnXPoBuf rrAA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit

While the assignment of ap->print_id could have been moved to
ata_host_alloc(), let's simply move it to ata_port_alloc().

If you allocate a port, you want to give it a unique name that can be used
for printing.

By moving the ap->print_id assignment to ata_port_alloc(), means that we
can also remove the ap->print_id assignment from ata_sas_port_alloc().

This will allow a LLD to use the ata_port_*() print functions before
ata_host_register() has been called.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/ata/libata-core.c | 6 ++----
 drivers/ata/libata-sata.c | 1 -
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 0dc6e18bf492..fb4835c2ba2d 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -5463,7 +5463,7 @@ struct ata_port *ata_port_alloc(struct ata_host *host)
 
 	ap->pflags |= ATA_PFLAG_INITIALIZING | ATA_PFLAG_FROZEN;
 	ap->lock = &host->lock;
-	ap->print_id = -1;
+	ap->print_id = atomic_inc_return(&ata_print_id);
 	ap->local_port_no = -1;
 	ap->host = host;
 	ap->dev = host->dev;
@@ -5903,10 +5903,8 @@ int ata_host_register(struct ata_host *host, const struct scsi_host_template *sh
 		WARN_ON(host->ports[i]);
 
 	/* give ports names and add SCSI hosts */
-	for (i = 0; i < host->n_ports; i++) {
-		host->ports[i]->print_id = atomic_inc_return(&ata_print_id);
+	for (i = 0; i < host->n_ports; i++)
 		host->ports[i]->local_port_no = i + 1;
-	}
 
 	/* Create associated sysfs transport objects  */
 	for (i = 0; i < host->n_ports; i++) {
diff --git a/drivers/ata/libata-sata.c b/drivers/ata/libata-sata.c
index c564eac9d430..def0026188f7 100644
--- a/drivers/ata/libata-sata.c
+++ b/drivers/ata/libata-sata.c
@@ -1234,7 +1234,6 @@ struct ata_port *ata_sas_port_alloc(struct ata_host *host,
 	ap->flags |= port_info->flags;
 	ap->ops = port_info->port_ops;
 	ap->cbl = ATA_CBL_SATA;
-	ap->print_id = atomic_inc_return(&ata_print_id);
 
 	return ap;
 }
-- 
2.45.2


