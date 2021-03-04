Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7988F32C267
	for <lists+linux-ide@lfdr.de>; Thu,  4 Mar 2021 01:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390038AbhCCV7N (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 3 Mar 2021 16:59:13 -0500
Received: from verein.lst.de ([213.95.11.211]:35595 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1357087AbhCCIRs (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Wed, 3 Mar 2021 03:17:48 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 755F768B02; Wed,  3 Mar 2021 08:41:07 +0100 (CET)
Date:   Wed, 3 Mar 2021 08:41:07 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Atsushi Nemoto <anemo@mba.ocn.ne.jp>, linux-ide@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: tx4938 and tx4939 ide drivers
Message-ID: <20210303074107.GA8880@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi all,

the tx4938 and tx4939 legacy ide drivers are some of the few that do
not have libata equivalents, which is a bad thing given that CONFIG_IDE
is planned to go away this year.  Are there any users of this hardware
left, and if yes willing to help with the move to libata?

Note that these drivers are pretty strange in that they were only added
in 2008, which was long after the ide driver subsystems has been
deprecated.
