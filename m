Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 811974E2B53
	for <lists+linux-ide@lfdr.de>; Mon, 21 Mar 2022 15:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349717AbiCUO6e (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 21 Mar 2022 10:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239139AbiCUO6b (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 21 Mar 2022 10:58:31 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC107628A
        for <linux-ide@vger.kernel.org>; Mon, 21 Mar 2022 07:57:05 -0700 (PDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 0FC5C210F1;
        Mon, 21 Mar 2022 14:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1647874624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=26s5nW/mETOfrOgbfuL2FL4lSIGRiv0Bt+IGeZRSg7g=;
        b=Z2NMlMOtkhmC+G+qI1bkqLbotWx9WajJaNNzH6W24/soE859Bfe+ewZ7KF5ZTgoQ0Q0Srb
        PNYkRO3Gu11FJeotJ7pu2GQ47+f+I/J7zLH2X/q3omkFucPXzNHlm/AmLexTeGrEMr/Sq+
        THu3w3ckt3WRjAVhztWmX8MZ80olVkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1647874624;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=26s5nW/mETOfrOgbfuL2FL4lSIGRiv0Bt+IGeZRSg7g=;
        b=AbRrK7a5v8UfnOAxfWYO1gXUKlJDnge67cyCMyFhW59zvzLIm1Fu5gLvu3LiGh+sWtFH7W
        tnex4YwoXRfh2xAw==
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
        by relay2.suse.de (Postfix) with ESMTP id CE2B7A3B87;
        Mon, 21 Mar 2022 14:57:03 +0000 (UTC)
Received: by adalid.arch.suse.de (Postfix, from userid 16045)
        id BAD90519382E; Mon, 21 Mar 2022 15:57:03 +0100 (CET)
From:   Hannes Reinecke <hare@suse.de>
To:     Damien LeMoal <damien.lemoal@wdc.com>
Cc:     linux-ide@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>,
        Hannes Reinecke <hare@suse.de>
Subject: [PATCHv2 0/3] libata: sysfs naming
Date:   Mon, 21 Mar 2022 15:56:56 +0100
Message-Id: <20220321145659.97150-1-hare@suse.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi all,

here's my second attempt the align the libata object naming with sysfs.
Key point is to introduce an 'ata' bus, which serves to collect all
libata object (ata_port, ata_link, and ata_device).

To facilitate that the name of the 'ata_port' object changes from 'ata'
to 'port'. To provide backwards compability I've added an additional
class object for the ata_port with the name of 'ata'.
This additional object can be disabled with the config option
ATA_SYSFS_COMPAT.

As usual, comments and reviews are welcome.

Hannes Reinecke (3):
  libata: sysfs naming option
  libata: CONFIG_ATA_SYSFS_COMPAT
  libata: sanitize PMP link naming

 drivers/ata/Kconfig            | 10 +++++++
 drivers/ata/libata-transport.c | 55 ++++++++++++++++++++++++++++++----
 include/linux/libata.h         | 54 ++++++++++-----------------------
 3 files changed, 76 insertions(+), 43 deletions(-)

-- 
2.29.2

