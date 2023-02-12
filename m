Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8FA693A16
	for <lists+linux-ide@lfdr.de>; Sun, 12 Feb 2023 21:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjBLU7Y (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 12 Feb 2023 15:59:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjBLU7Y (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sun, 12 Feb 2023 15:59:24 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3675AEB43
        for <linux-ide@vger.kernel.org>; Sun, 12 Feb 2023 12:59:23 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id hx15so27351962ejc.11
        for <linux-ide@vger.kernel.org>; Sun, 12 Feb 2023 12:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zK680p2X1pUlhJx3NNHZ4Clg4FYmh3UCp+9uo1iSl8Y=;
        b=hAHst7GbPT34f4SHz19+GSpk3sq0Z73m2bLWKyqjoO8vF8ejSG1zstct9LnL4wekri
         B7YhmatOE/iu6HisrjIQWxCop1wwaHqapCzKQhNgU6/pOfKwjRwlPmi1phn+Hyusuqna
         uGde6eYeBVrIhM+cC/ltZ9WI6WgYf5U0UqO7trAnZ6vmRMRAiWRK40sgk8j+tR7RsoE8
         /FhcSLR5gSV9D08mYhRWuVSs3Z8jbKkmHWaYWH1TbMAhs6HLIwr3DM9aPe9Lzj+TKZJ7
         1C8nSyUXG4GTPhffReUM7qQAtYjWh1La1te7Oyymfo8h3imjZgTEjHrtZDA6EvivtqT/
         y8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zK680p2X1pUlhJx3NNHZ4Clg4FYmh3UCp+9uo1iSl8Y=;
        b=1UBUI8xqscaiRQl6jRvmfJrPo7xbgMo+mwhwmkKXbLfQf7G5zRo3GQaBnovZYrL26a
         XBOsXhjXOz9hIVGB2eWSXWgyEGXMt79mMrO50oCONlLqqIPJUtQOdmtsV74nfJ789wYW
         SYhXc3cgJ+k6ch0ACt4UQiuzNW81Ypyllm7ydhAnK8cxcU3XJWuo2UWNKqKrKkGbIW9o
         rhIURTMuAKbZzjZiWSDV/HIh2OoDHkZyVUf69OYi4l2HGXGKx+f1bHx052rek0gph4eU
         VqIK1yc5J1RB/QU7XpyOdFl5Sd7bTbbTQGyAg0+/Uk670QW45xl3GwNvKT6GXPZfyCN4
         eSYQ==
X-Gm-Message-State: AO0yUKX/kok9UXF+xHUeptOVE36N7RTZVOF4MTYcht8S070GrN4lzBMF
        AiYwFSaqcIn4Y169rFI9S314VkeagekEsHtyySM=
X-Google-Smtp-Source: AK7set/6ZnV1MRwIX0+qr6gZahFA1K+dR6NzL/9ZHq0xpvdlH0uvZU25pf7zvKZ2OWg7Ti2RnsetXQRGdvVln7drViQ=
X-Received: by 2002:a17:907:20b3:b0:87b:d79f:9953 with SMTP id
 pw19-20020a17090720b300b0087bd79f9953mr3470877ejb.11.1676235561693; Sun, 12
 Feb 2023 12:59:21 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6f02:c24e:b0:46:c70e:2559 with HTTP; Sun, 12 Feb 2023
 12:59:21 -0800 (PST)
Reply-To: compcom013@gmail.com
From:   MoTown By Mojo <paetwine@gmail.com>
Date:   Sun, 12 Feb 2023 22:59:21 +0200
Message-ID: <CABZfpGO6xsk6ZVw9M8r5+uY1s1Y0ER-iE03CvM3PrRxCDGkXpg@mail.gmail.com>
Subject: Quotation Required Urgently
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

-- 
Hello

We require a quote based on the attached documents below

Would be much appreciated if you go through the quotation attached and
reply ASAP with your quotes accordingly.

Regards
