Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98693141A9F
	for <lists+linux-ide@lfdr.de>; Sun, 19 Jan 2020 01:27:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbgASA14 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ide@lfdr.de>); Sat, 18 Jan 2020 19:27:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:36020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727012AbgASA14 (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Sat, 18 Jan 2020 19:27:56 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-ide@vger.kernel.org
Subject: [Bug 205107] No HDD spindown/parking on shutdown
Date:   Sun, 19 Jan 2020 00:27:55 +0000
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
Message-ID: <bug-205107-11633-rErcm6wfLY@https.bugzilla.kernel.org/>
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

--- Comment #15 from Hélder (helder.armando@hotmail.com) ---
Let me fix some of the information I have sent.
I decided to retry these scenarios just to be certain. If I do leave the cable
plugged in until the system is completely off (never unplugged) and (prior to
shutdown):
- unmount normally (via the file manager) ->> the problem is still present
(disc doesn't spin down).
- Use the script (which includes "udisksctl power-off") ->> the problem is not
present most of the time, but the HDD is sometimes re-awoken by the system
during shutdown, resulting in the same problem.

PS: Under normal circumstances, I execute the script, unplug the HDD manually
and then shut the system down as normal.
PPS: Multiple messages were sent due to the networking problems forcing me to
refresh the page until the reply is visibly sent.

- Hélder

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
