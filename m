Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13F9C151DB0
	for <lists+linux-ide@lfdr.de>; Tue,  4 Feb 2020 16:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbgBDPya convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ide@lfdr.de>); Tue, 4 Feb 2020 10:54:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:59244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727301AbgBDPya (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Tue, 4 Feb 2020 10:54:30 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-ide@vger.kernel.org
Subject: [Bug 206405] New: kernel crash during boot debian server on qemu+kvm
Date:   Tue, 04 Feb 2020 15:54:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo io_ide@kernel-bugs.osdl.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: IDE
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: antdev66@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: io_ide@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206405-11633@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206405

            Bug ID: 206405
           Summary: kernel crash during boot debian server on qemu+kvm
           Product: IO/Storage
           Version: 2.5
    Kernel Version: 5.5.0/5.5.1
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: IDE
          Assignee: io_ide@kernel-bugs.osdl.org
          Reporter: antdev66@gmail.com
        Regression: No

Created attachment 287109
  --> https://bugzilla.kernel.org/attachment.cgi?id=287109&action=edit
screenshot of the bug

For the bug see the attached screenshot.
Previous 5.4.x series kernels work correctly.

Thanks,
Antonio

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
