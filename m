Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCDC2CC16A
	for <lists+linux-ide@lfdr.de>; Wed,  2 Dec 2020 16:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbgLBP4L (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 2 Dec 2020 10:56:11 -0500
Received: from vps.thesusis.net ([34.202.238.73]:52080 "EHLO vps.thesusis.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728056AbgLBP4L (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Wed, 2 Dec 2020 10:56:11 -0500
Received: from localhost (localhost [127.0.0.1])
        by vps.thesusis.net (Postfix) with ESMTP id 84D1B2DC68;
        Wed,  2 Dec 2020 10:55:30 -0500 (EST)
Received: from vps.thesusis.net ([IPv6:::1])
        by localhost (vps.thesusis.net [IPv6:::1]) (amavisd-new, port 10024)
        with ESMTP id tL-FDhZZOX4X; Wed,  2 Dec 2020 10:55:30 -0500 (EST)
Received: by vps.thesusis.net (Postfix, from userid 1000)
        id 496D62DC6A; Wed,  2 Dec 2020 10:55:30 -0500 (EST)
References: <87r1o9phgd.fsf@vps.thesusis.net> <20201202150330.GA25031@infradead.org>
User-agent: mu4e 1.5.6; emacs 26.3
From:   Phillip Susi <phill@thesusis.net>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     linux-ide@vger.kernel.org
Subject: Re: Drive reset as an EH strategy when write cache is enabled
In-reply-to: <20201202150330.GA25031@infradead.org>
Date:   Wed, 02 Dec 2020 10:55:30 -0500
Message-ID: <87blfc19u5.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org


Christoph Hellwig writes:

> If the device drops the content of the volatile write on a reset we'll
> have much problems than that..

How could it not?  The write cache is empty after a power on reset and
certainly a "hard" reset should be the same as a power on reset.
