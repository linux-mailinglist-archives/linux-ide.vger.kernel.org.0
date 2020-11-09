Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC7F52AC8B4
	for <lists+linux-ide@lfdr.de>; Mon,  9 Nov 2020 23:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729785AbgKIWjB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ide@lfdr.de>); Mon, 9 Nov 2020 17:39:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:58490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729493AbgKIWjB (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Mon, 9 Nov 2020 17:39:01 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-ide@vger.kernel.org
Subject: [Bug 205107] No HDD spindown/parking on shutdown
Date:   Mon, 09 Nov 2020 22:39:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo io_ide@kernel-bugs.osdl.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: IDE
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: amubtdx@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: io_ide@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205107-11633-1Xi1bZp21V@https.bugzilla.kernel.org/>
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

--- Comment #20 from Alexis Murzeau (amubtdx@gmail.com) ---
(In reply to Hélder from comment #15)
> PS: Under normal circumstances, I execute the script, unplug the HDD
> manually and then shut the system down as normal.
> PPS: Multiple messages were sent due to the networking problems forcing me
> to refresh the page until the reply is visibly sent.
> 
> - Hélder

Hi,

Does setting "manage_start_stop" to 1 in sysfs for you disk before shutting
down spin down the hard disk gracefully ? (without having to use udisksctl
power-off)

You have to find the correct path in the sysfs with something like this:
find /sys -name manage_start_stop
echo 1 > /sys/.../manage_start_stop
poweroff

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
