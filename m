Return-Path: <linux-ide+bounces-1025-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B36893597
	for <lists+linux-ide@lfdr.de>; Sun, 31 Mar 2024 21:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B70AC281D22
	for <lists+linux-ide@lfdr.de>; Sun, 31 Mar 2024 19:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638D0146D75;
	Sun, 31 Mar 2024 19:29:28 +0000 (UTC)
X-Original-To: linux-ide@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31E19463
	for <linux-ide@vger.kernel.org>; Sun, 31 Mar 2024 19:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711913368; cv=none; b=KHlFQtd6ILEJ/4w2fYdU+Qm3u9cty/VX+X/bV2MawUdtr5ukx39dFDUPGPSs9UlUvQMS2ilqEldcav5h8MHcHyY4Ij6sFK5123Mm8B+J4fR054/vFszhMSxnLL8XfKh0rbe5aZoEET7aNTndb0Uknm14/l+NPbWPPh9lpBYusPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711913368; c=relaxed/simple;
	bh=f5ljg/Wc7ME7G04qzot3/0WoJ9Z5hK3QSpk2j3B01do=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=dLRlL1suh/S/GZJ6JbIZtIBlevw4vB/qQXveR3KTWLIT++HHc6UPCYmTbVe4Gu7IkBQA6xb9MQWJDQLxLOLVcZLvXlhEYI5E0tB8MkZ5fWvLhujHr7HzeoJD0c3DclVYDVT3a6b2Qq3iKL48OfZm8R9XXROCt0tzIIRArI69qQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7cc7a6a043bso441161839f.0
        for <linux-ide@vger.kernel.org>; Sun, 31 Mar 2024 12:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711913366; x=1712518166;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X8E6BccGg7QBRqyiJt5ld5mepNqMnMyoDuErjNXyThI=;
        b=db1XyYITitH6V0JVqfXNZxWYcpGhUoJ7DWphxrC6qNXr4Xxw7D/Il2+fm5eNLdIuAY
         5QVLj3+cQDX2+HHSINduri0siKEk8BFM6WAHgWVbDzO2KpAtQUX+ezM+DnxOhkJFD+AC
         0JAolsKE34yfXQ8z3IZkRYgnYSyrJSEGwlE/bpKP8AfnnxksceX9pjuq8eTmG2WicciR
         0G1aqlyHfX1L8gnJcjOYI7mXUgObbX+HBBPXMKrGUjPFEqx2hGb1gF6heBkIl9nPPLmB
         xQRgguSqE5M8ZESkRBhGkdUigtORfroogkdhO17Aibv1BXtPw+KrC6z323plw+lgqKeH
         lnVA==
X-Forwarded-Encrypted: i=1; AJvYcCWCpo2SnOu4+kPaKx5iDgguX+cQE/LSih6b9hIKL5fFw3BFwCx8j7FAi7uIuQkq5RZtWMLCENYMDd1+qxTaAAFOv6g4yLHo7/bW
X-Gm-Message-State: AOJu0Yykw4Jq/2oY8dgXOyKELH1cftiq+9auvLmnNvC4rlUGEDlSXn27
	PaHClXGv/XkW5TYt9QlYgF+yqnZ2NEek5Nj80WHBaux4PJI/flbdm9CqYXRcaDyUqzdCYAvicE0
	9s7RdsH56WtbYozMfOb1E5boHoCRU7PZTLLLaKT7BEuWbxkmkGwj7Rx4=
X-Google-Smtp-Source: AGHT+IGptXJRZnPSMNtiqp2ps1An8cGZzR2w0P6ZXD4+BiSBlp68VHmHUT+vbOVPbNeH3HqDQk/bPFK0BzRSVKy84IiUnumV00ZI
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3422:b0:7cc:ea7:4f0f with SMTP id
 n34-20020a056602342200b007cc0ea74f0fmr373025ioz.3.1711913366042; Sun, 31 Mar
 2024 12:29:26 -0700 (PDT)
Date: Sun, 31 Mar 2024 12:29:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000011ce560614f9e4a6@google.com>
Subject: [syzbot] [ide?] WARNING in ata_scsi_queuecmd
From: syzbot <syzbot+5a834bc6771dddfa994e@syzkaller.appspotmail.com>
To: cassel@kernel.org, dlemoal@kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    962490525cff Merge tag 'probes-fixes-v6.9-rc1' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11171735180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f64ec427e98bccd7
dashboard link: https://syzkaller.appspot.com/bug?extid=5a834bc6771dddfa994e
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-96249052.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c5a4f1f7db02/vmlinux-96249052.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ea148b99c50a/bzImage-96249052.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5a834bc6771dddfa994e@syzkaller.appspotmail.com

------------[ cut here ]------------
raw_local_irq_restore() called with IRQs enabled
WARNING: CPU: 0 PID: 1166 at kernel/locking/irqflag-debug.c:10 warn_bogus_irq_restore+0x29/0x30 kernel/locking/irqflag-debug.c:10
Modules linked in:
CPU: 0 PID: 1166 Comm: kworker/u32:9 Not tainted 6.9.0-rc1-syzkaller-00021-g962490525cff #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
Workqueue: writeback wb_workfn (flush-8:0)
RIP: 0010:warn_bogus_irq_restore+0x29/0x30 kernel/locking/irqflag-debug.c:10
Code: 90 f3 0f 1e fa 90 80 3d 6c e3 ec 04 00 74 06 90 c3 cc cc cc cc c6 05 5d e3 ec 04 01 90 48 c7 c7 c0 c2 2c 8b e8 28 2c 72 f6 90 <0f> 0b 90 90 eb df 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc9000467e9d8 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff888022a70400 RCX: ffffffff814fe149
RDX: ffff88802384a440 RSI: ffffffff814fe156 RDI: 0000000000000001
RBP: 0000000000000246 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 000000002d2d2d2d R12: ffff8880232f2680
R13: 0000000000000246 R14: ffff8880232f0010 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff88806b000000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000040 CR3: 000000002fd56000 CR4: 0000000000350ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
 _raw_spin_unlock_irqrestore+0x74/0x80 kernel/locking/spinlock.c:194
 spin_unlock_irqrestore include/linux/spinlock.h:406 [inline]
 ata_scsi_queuecmd+0xda/0x160 drivers/ata/libata-scsi.c:4204
 scsi_dispatch_cmd drivers/scsi/scsi_lib.c:1610 [inline]
 scsi_queue_rq+0x12af/0x36a0 drivers/scsi/scsi_lib.c:1852
 blk_mq_dispatch_rq_list+0x452/0x2030 block/blk-mq.c:2058
 __blk_mq_do_dispatch_sched block/blk-mq-sched.c:170 [inline]
 blk_mq_do_dispatch_sched block/blk-mq-sched.c:184 [inline]
 __blk_mq_sched_dispatch_requests+0xcdf/0x1620 block/blk-mq-sched.c:309
 blk_mq_sched_dispatch_requests+0xd4/0x150 block/blk-mq-sched.c:331
 blk_mq_run_hw_queue+0x645/0x9a0 block/blk-mq.c:2273
 blk_mq_dispatch_plug_list block/blk-mq.c:2774 [inline]
 blk_mq_flush_plug_list.part.0+0x611/0x1d90 block/blk-mq.c:2822
 blk_mq_flush_plug_list block/blk-mq.c:1296 [inline]
 blk_add_rq_to_plug+0x117/0x540 block/blk-mq.c:1299
 blk_mq_submit_bio+0x1602/0x20f0 block/blk-mq.c:3014
 __submit_bio+0xfd/0x310 block/blk-core.c:619
 __submit_bio_noacct_mq block/blk-core.c:698 [inline]
 submit_bio_noacct_nocheck+0x98a/0xd50 block/blk-core.c:727
 submit_bio_noacct+0x746/0x1ba0 block/blk-core.c:837
 ext4_io_submit+0xa6/0x140 fs/ext4/page-io.c:378
 ext4_do_writepages+0xf0f/0x3250 fs/ext4/inode.c:2699
 ext4_writepages+0x303/0x730 fs/ext4/inode.c:2768
 do_writepages+0x1a3/0x7f0 mm/page-writeback.c:2612
 __writeback_single_inode+0x163/0xf90 fs/fs-writeback.c:1650
 writeback_sb_inodes+0x5a6/0x10d0 fs/fs-writeback.c:1941
 __writeback_inodes_wb+0xff/0x2e0 fs/fs-writeback.c:2012
 wb_writeback+0x7db/0xb30 fs/fs-writeback.c:2119
 wb_check_start_all fs/fs-writeback.c:2245 [inline]
 wb_do_writeback fs/fs-writeback.c:2271 [inline]
 wb_workfn+0x9fb/0xf40 fs/fs-writeback.c:2304
 process_one_work+0x9a9/0x1ac0 kernel/workqueue.c:3254
 process_scheduled_works kernel/workqueue.c:3335 [inline]
 worker_thread+0x6c8/0xf70 kernel/workqueue.c:3416
 kthread+0x2c1/0x3a0 kernel/kthread.c:388
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:243
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

