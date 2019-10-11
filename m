Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3CA0D4B22
	for <lists+linux-ide@lfdr.de>; Sat, 12 Oct 2019 01:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbfJKXpK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ide@lfdr.de>); Fri, 11 Oct 2019 19:45:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:49850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726354AbfJKXpJ (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Fri, 11 Oct 2019 19:45:09 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-ide@vger.kernel.org
Subject: [Bug 205107] No HDD spindown/parking on shutdown
Date:   Fri, 11 Oct 2019 23:45:09 +0000
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
Message-ID: <bug-205107-11633-Kbp2m0lwKv@https.bugzilla.kernel.org/>
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

--- Comment #4 from Hélder (helder.armando@hotmail.com) ---
I have just run those commands. The disk was unmounted and visibly shutdown.
The problem did not remain here, but it still does on regular shutdown.

Side note: I'm not sure if this is expected, but even when I use "shutdown -P
now", systemd appears to handle it still.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
