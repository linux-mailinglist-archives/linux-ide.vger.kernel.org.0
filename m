Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB4FD1F19
	for <lists+linux-ide@lfdr.de>; Thu, 10 Oct 2019 05:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfJJDtE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ide@lfdr.de>); Wed, 9 Oct 2019 23:49:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:46600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726524AbfJJDtE (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Wed, 9 Oct 2019 23:49:04 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-ide@vger.kernel.org
Subject: [Bug 205107] No HDD spindown/parking on shutdown
Date:   Thu, 10 Oct 2019 03:49:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo io_ide@kernel-bugs.osdl.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: IDE
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: kaurman@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: io_ide@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205107-11633-yghSQz0sAi@https.bugzilla.kernel.org/>
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

Kaur Männamaa (kaurman@outlook.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kaurman@outlook.com

--- Comment #1 from Kaur Männamaa (kaurman@outlook.com) ---
(In reply to Hélder from comment #0)

> 
> 
> I'll attach smartctl logs for both HDDs. The logs say old_age and pre_fail,
> but this is most likely not true, as I have bought them recently and
> smartctl doesn't seem to be that smart at times.
> 

old_age and pre_fail indicate the type of the data given, they are not the
result of interpreting the data. Also, one of the logs seems to be missing
unless I missed something myself :)

Could you unmount (umount -v your/drive*?) and then power off the external
drive manually (udisksctl power-off -b /your/drive) and see if the problem
remains? You might also want to check that the drive indeed is / has remained
off before shutting down (hdparm -C /your/drive).

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
