Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97A8963F5C9
	for <lists+linux-ide@lfdr.de>; Thu,  1 Dec 2022 17:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbiLAQ6u (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 1 Dec 2022 11:58:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiLAQ6u (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 1 Dec 2022 11:58:50 -0500
Received: from mail-yw1-x1141.google.com (mail-yw1-x1141.google.com [IPv6:2607:f8b0:4864:20::1141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9062E9F4AC
        for <linux-ide@vger.kernel.org>; Thu,  1 Dec 2022 08:58:48 -0800 (PST)
Received: by mail-yw1-x1141.google.com with SMTP id 00721157ae682-3c090251d59so23526727b3.4
        for <linux-ide@vger.kernel.org>; Thu, 01 Dec 2022 08:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgimkW95DKWjQcuW4BoApJOKslDGPb5fQD3pyTQLT0Y=;
        b=KQZ4G9jimt9WRmtktAYxdAw7gxOWZWL3y/w+dwD8dSEbCuDQUjLr6bOlSTJxAFMXPv
         1TFhF0LdPAFcDrQ3A5ksn76dkc1M5lG7NlZYmgNyQjLOcgy2cEozICHMDDgIX3IUmD2X
         AroBf60RJYoHoLmD4xXSVQ1v4t77XUZ8CMc68qzm3lv8sh3+5uD2qgtzadl89Pwc0mUm
         rb3bF0FaNbeU9xSgjrMipjrzj4MAKmUz0ccnqOkabX2DOk7dPCz17JT80Nr54FZndYm6
         2pz0mPufY9n5x3ZTcI+oaC6EziP/oC93wFHEo07o2C+jqeK/su+40RLv/fiA/NWBctz6
         7qhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UgimkW95DKWjQcuW4BoApJOKslDGPb5fQD3pyTQLT0Y=;
        b=VqPReEipBc9HjiThPeb80xEu5HLxXbaLvgqTTaXzciJmM6g7yhc7XQj6jDrvhRR48R
         VAAsaqKbAAqva/2ywHjdhgqKSSltBmHDSmn2ARvZ+jHrw2ilKiO94b/vWTH0ijCCi3Gt
         if2Bhwmgp3KUFEUcf/1lM4OT965ruiV+1TPpqARYOB8NStNq4Agm/IQ/px88q//w62Wj
         wFj5HcSNFx5TTLULNucG9sBCCzq8ylVdv8fofCWQZLANRG7c+3/LNLCYCfMgp5AA6c6i
         GvftpePvBZSHSqL8foOpywcgReVKgryxI95AR0761giyn6357hqQUdQvGv3wFW5pKz6e
         ajSw==
X-Gm-Message-State: ANoB5pm2FXbot6ysH3klFTDfRXkggxSTrgOVE5Ags1A/TTCFGN8iUZP/
        cD5qYIsW1lzsJ5VYHkN4S2BCD7hiTmAMRV3cnT8=
X-Google-Smtp-Source: AA0mqf61X41mYf2h/CXEbHChwOFrLtuYMbQRHwY3rIGq48emgJfPsuPkQPG3fw0Yv+m5z02hnRZ1f3qyn+2/hmfHoqg=
X-Received: by 2002:a0d:fdc7:0:b0:37a:e8f:3cd3 with SMTP id
 n190-20020a0dfdc7000000b0037a0e8f3cd3mr63004805ywf.187.1669913927798; Thu, 01
 Dec 2022 08:58:47 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6918:c147:b0:f4:3cbe:28f0 with HTTP; Thu, 1 Dec 2022
 08:58:47 -0800 (PST)
Reply-To: chuinh021@gmail.com
From:   chuinh <dm6143938@gmail.com>
Date:   Thu, 1 Dec 2022 17:58:47 +0100
Message-ID: <CAN4T+zDkjhRy9Evw8mM5Evdc=Q2YGy0t8mZCRyUvfYbYh8f_cg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1141 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [dm6143938[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [dm6143938[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [chuinh021[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

-- 
Dear Friend,

I have an important message which i want to discuss with you.

Sincerely,

Mrs Chu Inh.
