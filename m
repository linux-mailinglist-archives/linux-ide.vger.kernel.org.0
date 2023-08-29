Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA6CD78C197
	for <lists+linux-ide@lfdr.de>; Tue, 29 Aug 2023 11:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231828AbjH2JgS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ide@lfdr.de>); Tue, 29 Aug 2023 05:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234917AbjH2JgA (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 29 Aug 2023 05:36:00 -0400
Received: from srv.wefi.net (srv.wefi.net [80.66.63.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EE339AB
        for <linux-ide@vger.kernel.org>; Tue, 29 Aug 2023 02:35:56 -0700 (PDT)
Received: from [192.168.78.211] (213-147-165-91.nat.highway.webapn.at [213.147.165.91])
        by srv.wefi.net (Postfix) with ESMTPSA id 1AA475A3586;
        Tue, 29 Aug 2023 11:35:56 +0200 (CEST)
Message-ID: <f4f02b8d2aa8afd83c305589f576539a20e11c13.camel@wefi.net>
Subject: Re: [PATCH] ata: Add Elkhart Lake AHCI controller
From:   Werner Fischer <devlists@wefi.net>
To:     Damien Le Moal <dlemoal@kernel.org>, linux-ide@vger.kernel.org
Date:   Tue, 29 Aug 2023 11:35:54 +0200
In-Reply-To: <a74207b7-64e9-c01c-ee9a-5269c6be41af@kernel.org>
References: <7728fa4b6027269d468f6a0665017c187471a9cd.camel@wefi.net>
         <a74207b7-64e9-c01c-ee9a-5269c6be41af@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Tue, 2023-08-29 at 15:09 +0900, Damien Le Moal wrote:
> > Intel lists a total of 3 SATA controller IDs (4B60, 4B62, 4B63) in
> > [1] for those mobile PCHs.
> > This commit just adds 0x4b63 as I do not have test systems with
> > 0x4b60 and 0x4b62 SATA controllers.
> 
> Adding a mention about the other 2 IDs in a comment would be nice.

Thank you for your time reviewing the patch.
I will send a v2 with an added comment about the other 2 IDs.
