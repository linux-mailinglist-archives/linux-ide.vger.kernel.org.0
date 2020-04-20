Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD921B1904
	for <lists+linux-ide@lfdr.de>; Tue, 21 Apr 2020 00:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgDTWHP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ide@lfdr.de>); Mon, 20 Apr 2020 18:07:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:33236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726013AbgDTWHP (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Mon, 20 Apr 2020 18:07:15 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-ide@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMDczNzVdIE5ldzogSW4gQ1RSIChDbGljayB0aHJvdWdo?=
 =?UTF-8?B?IHJhdGlvKSDigJhUb3RhbOKAmSByb3cgY2FsY3VsYXRpb24gaXMgd3Jvbmc=?=
Date:   Mon, 20 Apr 2020 22:07:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo io_ide@kernel-bugs.osdl.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: IDE
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chukskaayy@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: io_ide@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-207375-11633@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207375

            Bug ID: 207375
           Summary: In CTR (Click through ratio) ‘Total’ row calculation
                    is wrong
           Product: IO/Storage
           Version: 2.5
    Kernel Version: 5.4.0 20160609
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: IDE
          Assignee: io_ide@kernel-bugs.osdl.org
          Reporter: chukskaayy@gmail.com
        Regression: No

Description:
Application crash on clicking the SAVE button while creating a new user, hence
unable to create a new user in the application.

Steps To Reproduce:
1) Logon into the application
2) Navigate to the Users Menu > New User
3) Filled all the fields
4) Clicked on ‘Save’ button
5) Seen an error page “ORA1090 Exception: Insert values Error…”
6) See the <a href=https://mp3drone.com/>attached</a> logs for more information
7) And also see the attached screenshot of the error page.

Expected: On clicking SAVE button should be prompted to a success message “New
User has been created successfully”.

Save the defect/bug in the BUG TRACKING TOOL.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
