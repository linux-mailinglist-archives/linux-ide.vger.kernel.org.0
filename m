Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6B62B1FAC
	for <lists+linux-ide@lfdr.de>; Fri, 13 Nov 2020 17:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgKMQKe (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 13 Nov 2020 11:10:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbgKMQKd (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 13 Nov 2020 11:10:33 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1120BC0613D1
        for <linux-ide@vger.kernel.org>; Fri, 13 Nov 2020 08:10:33 -0800 (PST)
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1605283831;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=CAM0jsz1iV5Fitq2uidp7kRIqI59oEjB/3hKEYcykPQ=;
        b=tlAZzrnN3xkMqYB4h1ExdT9N/PT6sFsleoXQnE/UmAFO5tS66TYUKktFSgWQ7zg/1n9IR1
        aSG3hk7mJM307v6lgAS7pxjYI53f9uQGhYAjKEe43lAozFKi/dgGzzA67w4Lkq9aVMwv/B
        5gyIGLjtaWqbBpT8d3AV6VrOQNV9+5ZpvwhpjrfKlGMCh/1LF1XyCP9ngazT/WMjkjHq6j
        2KF503lAXKVOS7Z/6UyK6fwGts4b+y7xi+kp9Kvc5JXsKl3OLRAcpWvmqRTn3iRALupRxr
        iImNyKusxRtZfFy0Qlyd82ZmpZleaeQ85jlrgDrGpsU5FJ+xyX0Ao2jK8UMTZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1605283831;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=CAM0jsz1iV5Fitq2uidp7kRIqI59oEjB/3hKEYcykPQ=;
        b=JuH8pcZPf0oj9RP62t4gjR0P37v4O1DLSztU07qxx5Qk0Z+ZXosPecdN8C+M7zFan1QmO0
        3SzSXbYc3rTpcaAQ==
To:     linux-ide@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 0/2] ide: Remove in_interrupt()
Date:   Fri, 13 Nov 2020 17:10:19 +0100
Message-Id: <20201113161021.2217361-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

In the discussion about preempt count consistency across kernel
configurations:

 https://lore.kernel.org/r/20200914204209.256266093@linutronix.de/

it was concluded that the usage of in_interrupt() and related context
checks should be removed from non-core code.

This ide subsystem has two in_interrupts() checks before mutex/wait-event
invocations.

Sebastian


