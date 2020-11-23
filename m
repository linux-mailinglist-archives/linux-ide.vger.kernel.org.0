Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86B322C13CD
	for <lists+linux-ide@lfdr.de>; Mon, 23 Nov 2020 20:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389075AbgKWSmt (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 23 Nov 2020 13:42:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41029 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730923AbgKWSmt (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 23 Nov 2020 13:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606156968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=096JeDPKewJ332xLqnOXyjANbpTZ7wBm6u7KL3cO954=;
        b=BzKCmGsnrsbzXSdNf1fRq1HjJw40A9DGN7NBKuoADcufZSoRwDfmTQX8s0unKppGcuWtt3
        IHJDFZgiS8amXbJoRJyYvIJhcPfdCbcO7rTHgQpmsan13ta2LFhZsXb3uHtYqWP07/aTDa
        Z0pXFKUZbn8nb4jKej6jk3hIsJqEQG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-VkcSA-mPMzua1HLV-oivYw-1; Mon, 23 Nov 2020 13:42:46 -0500
X-MC-Unique: VkcSA-mPMzua1HLV-oivYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A67D6804012;
        Mon, 23 Nov 2020 18:42:45 +0000 (UTC)
Received: from hpz440.redhat.com (ovpn-112-221.rdu2.redhat.com [10.10.112.221])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 490BE60C04;
        Mon, 23 Nov 2020 18:42:45 +0000 (UTC)
From:   David Milburn <dmilburn@redhat.com>
To:     linux-ide@vger.kernel.org
Cc:     axboe@kernel.dk
Subject: [PATCH] libata: specify timeout value when internal command times out.
Date:   Mon, 23 Nov 2020 12:42:44 -0600
Message-Id: <1606156964-13154-1-git-send-email-dmilburn@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Specifying timeout value may help in troubleshooting failures.

Signed-off-by: David Milburn <dmilburn@redhat.com>
---
 drivers/ata/libata-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 61c762961ca8..8f1ba6208e5c 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -1600,8 +1600,8 @@ unsigned ata_exec_internal_sg(struct ata_device *dev,
 				ata_qc_complete(qc);
 
 			if (ata_msg_warn(ap))
-				ata_dev_warn(dev, "qc timeout (cmd 0x%x)\n",
-					     command);
+				ata_dev_warn(dev, "qc timeout after %lu msecs (cmd 0x%x)\n",
+					     timeout, command);
 		}
 
 		spin_unlock_irqrestore(ap->lock, flags);
-- 
2.18.1

