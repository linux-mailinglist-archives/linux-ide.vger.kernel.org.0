Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9C69D8DCA
	for <lists+linux-ide@lfdr.de>; Wed, 16 Oct 2019 12:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbfJPKXC (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 16 Oct 2019 06:23:02 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:47100 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726394AbfJPKXC (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Wed, 16 Oct 2019 06:23:02 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 7BE6C3E9025F397CF751;
        Wed, 16 Oct 2019 18:22:59 +0800 (CST)
Received: from localhost.localdomain (10.67.212.75) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Wed, 16 Oct 2019 18:22:53 +0800
From:   John Garry <john.garry@huawei.com>
To:     <axboe@kernel.dk>
CC:     <linux-ide@vger.kernel.org>, <linuxarm@huawei.com>,
        <linux-kernel@vger.kernel.org>, John Garry <john.garry@huawei.com>
Subject: [PATCH] libata: Ensure ata_port probe has completed before detach
Date:   Wed, 16 Oct 2019 18:19:52 +0800
Message-ID: <1571221192-216909-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.212.75]
X-CFilter-Loop: Reflected
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

With CONFIG_DEBUG_TEST_DRIVER_REMOVE set, we may find the following WARN:

[   23.452574] ------------[ cut here ]------------
[   23.457190] WARNING: CPU: 59 PID: 1 at drivers/ata/libata-core.c:6676 ata_host_detach+0x15c/0x168
[   23.466047] Modules linked in:
[   23.469092] CPU: 59 PID: 1 Comm: swapper/0 Not tainted 5.4.0-rc1-00010-g5b83fd27752b-dirty #296
[   23.477776] Hardware name: Huawei D06 /D06, BIOS Hisilicon D06 UEFI RC0 - V1.16.01 03/15/2019
[   23.486286] pstate: a0c00009 (NzCv daif +PAN +UAO)
[   23.491065] pc : ata_host_detach+0x15c/0x168
[   23.495322] lr : ata_host_detach+0x88/0x168
[   23.499491] sp : ffff800011cabb50
[   23.502792] x29: ffff800011cabb50 x28: 0000000000000007
[   23.508091] x27: ffff80001137f068 x26: ffff8000112c0c28
[   23.513390] x25: 0000000000003848 x24: ffff0023ea185300
[   23.518689] x23: 0000000000000001 x22: 00000000000014c0
[   23.523987] x21: 0000000000013740 x20: ffff0023bdc20000
[   23.529286] x19: 0000000000000000 x18: 0000000000000004
[   23.534584] x17: 0000000000000001 x16: 00000000000000f0
[   23.539883] x15: ffff0023eac13790 x14: ffff0023eb76c408
[   23.545181] x13: 0000000000000000 x12: ffff0023eac13790
[   23.550480] x11: ffff0023eb76c228 x10: 0000000000000000
[   23.555779] x9 : ffff0023eac13798 x8 : 0000000040000000
[   23.561077] x7 : 0000000000000002 x6 : 0000000000000001
[   23.566376] x5 : 0000000000000002 x4 : 0000000000000000
[   23.571674] x3 : ffff0023bf08a0bc x2 : 0000000000000000
[   23.576972] x1 : 3099674201f72700 x0 : 0000000000400284
[   23.582272] Call trace:
[   23.584706]  ata_host_detach+0x15c/0x168
[   23.588616]  ata_pci_remove_one+0x10/0x18
[   23.592615]  ahci_remove_one+0x20/0x40
[   23.596356]  pci_device_remove+0x3c/0xe0
[   23.600267]  really_probe+0xdc/0x3e0
[   23.603830]  driver_probe_device+0x58/0x100
[   23.608000]  device_driver_attach+0x6c/0x90
[   23.612169]  __driver_attach+0x84/0xc8
[   23.615908]  bus_for_each_dev+0x74/0xc8
[   23.619730]  driver_attach+0x20/0x28
[   23.623292]  bus_add_driver+0x148/0x1f0
[   23.627115]  driver_register+0x60/0x110
[   23.630938]  __pci_register_driver+0x40/0x48
[   23.635199]  ahci_pci_driver_init+0x20/0x28
[   23.639372]  do_one_initcall+0x5c/0x1b0
[   23.643199]  kernel_init_freeable+0x1a4/0x24c
[   23.647546]  kernel_init+0x10/0x108
[   23.651023]  ret_from_fork+0x10/0x18
[   23.654590] ---[ end trace 634a14b675b71c13 ]---

With KASAN also enabled, we may also get many use-after-free reports.

The issue is that when CONFIG_DEBUG_TEST_DRIVER_REMOVE is set, we may
attempt to detach the ata_port before it has been probed.

This is because the ata_ports are async probed, meaning that there is no
guarantee that the ata_port has probed prior to detach. When the ata_port
does probe in this scenario, we get all sorts of issues as the detach may
have already happened.

Fix by ensuring synchronisation with async_synchronize_full(). We could
alternatively use the cookie returned from the ata_port probe
async_schedule() call, but that means managing the cookie, so more
complicated.

Signed-off-by: John Garry <john.garry@huawei.com>
---
Note: This has only been boot tested and manual driver remove/add.
         My system has no disk attached to the ahci host.

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 28c492be0a57..74c9b3032d46 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -6708,6 +6708,9 @@ void ata_host_detach(struct ata_host *host)
 {
 	int i;
 
+	/* Ensure ata_port probe has completed */
+	async_synchronize_full();
+
 	for (i = 0; i < host->n_ports; i++)
 		ata_port_detach(host->ports[i]);
 
-- 
2.17.1

