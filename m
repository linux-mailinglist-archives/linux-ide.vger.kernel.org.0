Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 551842E1BFD
	for <lists+linux-ide@lfdr.de>; Wed, 23 Dec 2020 12:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728414AbgLWLrD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ide@lfdr.de>); Wed, 23 Dec 2020 06:47:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:55316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728406AbgLWLrD (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Wed, 23 Dec 2020 06:47:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B49D1223E4
        for <linux-ide@vger.kernel.org>; Wed, 23 Dec 2020 11:46:22 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AE6028673A; Wed, 23 Dec 2020 11:46:22 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-ide@vger.kernel.org
Subject: [Bug 205107] No HDD spindown/parking on shutdown
Date:   Wed, 23 Dec 2020 11:46:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo io_ide@kernel-bugs.osdl.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: IDE
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: reagentoo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: io_ide@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205107-11633-rDhXkrsbyC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205107-11633@https.bugzilla.kernel.org/>
References: <bug-205107-11633@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=205107

Dmitry Baranov (reagentoo@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |reagentoo@gmail.com

--- Comment #21 from Dmitry Baranov (reagentoo@gmail.com) ---
Hi,

Thank you all for your research.
I created the following udev rule for myself to solve this problem:

/etc/udev/rules.d/01-manage_start_stop.rules:

ACTION=="add|change", DRIVERS=="usb-storage", SUBSYSTEM=="scsi_disk",
RUN+="/bin/sh -c 'echo 1 >/sys/class/scsi_disk/%k/manage_start_stop'"

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
