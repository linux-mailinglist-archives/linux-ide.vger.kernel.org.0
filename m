Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19C7A6FE78C
	for <lists+linux-ide@lfdr.de>; Thu, 11 May 2023 00:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236499AbjEJWwf (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 10 May 2023 18:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjEJWwe (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 10 May 2023 18:52:34 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C8A61A4
        for <linux-ide@vger.kernel.org>; Wed, 10 May 2023 15:52:23 -0700 (PDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id D697C2198E;
        Wed, 10 May 2023 22:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1683759141; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=7I6gEUsPDPLHJG5F6lFv3u01NDEKoye1kqcNxdWAgG4=;
        b=zvMdbZXErsOMeaVon5GpDSEVRI+FHK0IXwXHVxS7caqNJwl0Z4fWU8CZBNvC1K6hSb99M7
        UAfxR70VMpb1bVp5SKDNXst2BcyMoJ4Hz+EsQ7w5TUyFQ+yx4dOjYfLXljQdHOlY8tN3ie
        kceHVYPhTY0Nk5Z3wMtONL5L+jkti1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1683759141;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=7I6gEUsPDPLHJG5F6lFv3u01NDEKoye1kqcNxdWAgG4=;
        b=lCHwhdCS3+VLZ9QZqghgIwSBeR0LRVNvZRPCaumLqV3zb2fKNYfPnUFDMoMJZbJhVKrl0L
        fJlGzCoJqsOXkXCQ==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
        by relay2.suse.de (Postfix) with ESMTP id C9D952C143;
        Wed, 10 May 2023 22:52:21 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
        id BA51051C34DF; Thu, 11 May 2023 00:52:21 +0200 (CEST)
From:   Hannes Reinecke <hare@suse.de>
To:     Damien LeMoal <dlemoal@kernel.org>
Cc:     linux-ide@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH 0/6] libata: remove references to 'old' error handler
Date:   Thu, 11 May 2023 00:52:05 +0200
Message-Id: <20230510225211.111113-1-hare@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi all,

now that the ipr driver has been modified to not hook into libata
all drivers now use the 'new' error handler, so we can remove any
references to it. And do a general cleanup to remove callbacks
which are no longer needed.

Hannes Reinecke (6):
  ata: remove reference to non-existing error_handler()
  ata,scsi: remove ata_sas_port_{start,stop} callbacks
  ata,scsi: remove ata_sas_port_destroy()
  ata: remove ata_sas_sync_probe()
  ata: inline ata_port_probe()
  ata,scsi: cleanup ata_port_probe()

 drivers/ata/libata-core.c          | 166 +++++++++++------------------
 drivers/ata/libata-eh.c            | 148 +++++++++++--------------
 drivers/ata/libata-sata.c          |  77 -------------
 drivers/ata/libata-scsi.c          |  21 +---
 drivers/ata/libata-sff.c           |  32 +++---
 drivers/ata/libata.h               |   2 -
 drivers/scsi/libsas/sas_ata.c      |   6 +-
 drivers/scsi/libsas/sas_discover.c |   2 +-
 include/linux/libata.h             |   6 +-
 9 files changed, 143 insertions(+), 317 deletions(-)

-- 
2.35.3

