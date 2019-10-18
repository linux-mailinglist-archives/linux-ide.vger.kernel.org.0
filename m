Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16F7DDCFD8
	for <lists+linux-ide@lfdr.de>; Fri, 18 Oct 2019 22:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443261AbfJRUQ2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ide@lfdr.de>); Fri, 18 Oct 2019 16:16:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:41126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729451AbfJRUQ2 (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Fri, 18 Oct 2019 16:16:28 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-ide@vger.kernel.org
Subject: [Bug 205107] No HDD spindown/parking on shutdown
Date:   Fri, 18 Oct 2019 20:16:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo io_ide@kernel-bugs.osdl.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: IDE
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: helder.armando@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: io_ide@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205107-11633-iZXAt4Dsb8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205107-11633@https.bugzilla.kernel.org/>
References: <bug-205107-11633@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=205107

--- Comment #5 from Hélder (helder.armando@hotmail.com) ---
Anyone? As a temporary fix, I shut down all the devices before turning the
system off manually with the following code:

#!/bin/sh
sudo umount -v /dev/sdb*
sudo umount -v /dev/sdc*
sudo umount -v /dev/sdd*
sudo udisksctl power-off -b /dev/sdb
sudo udisksctl power-off -b /dev/sdc
sudo udisksctl power-off -b /dev/sdd
sudo umount -v /dev/sda*
sudo udisksctl power-off -b /dev/sda


It is not a real fix, though.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
