Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F64F4B22BB
	for <lists+linux-ide@lfdr.de>; Fri, 11 Feb 2022 11:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237261AbiBKKFE (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 11 Feb 2022 05:05:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232994AbiBKKFD (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 11 Feb 2022 05:05:03 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D9DE93
        for <linux-ide@vger.kernel.org>; Fri, 11 Feb 2022 02:05:02 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id v47so23257692ybi.4
        for <linux-ide@vger.kernel.org>; Fri, 11 Feb 2022 02:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=RUm+BHjHjBqeaGuCk1BVfImjY9k8WWn0rEUOHAWVbOo=;
        b=psFGZJ827/4eTx1bCeVSjILuhCe7wB8X44nZ3x3DVJRaaq3ZQ2BzKLgWbpDeX9HQ+i
         unzcMZqrqnd8emoo+NXp9o95pHxgX4gjx71MZlPVinXx+pWVL1fK8DxfuPTYaIBI5xe4
         zBgKYL7oy1255H05xhqA6hG/8fvywQsb3McW9FREcJiWVrb2E4m5/Oc5IxuJIyjHDfZh
         MY0pPx+oXlm8OzwTLCLciqRcLDdrf/n7mXQX5LENtvgSOcjrushoVGAhBYWAyU0pn8v4
         NdVwnWnAGuHpTZIEh8EOz3PPDBhFwg7LexVjhBe5PU+9zZ8MdYq96CsejNHYY1cqpxDR
         55rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=RUm+BHjHjBqeaGuCk1BVfImjY9k8WWn0rEUOHAWVbOo=;
        b=Zlzn12BVqm5tRNSr5ISO96vx0vtHFZwjnPAIEJqTrnXFnLKOzdv2G1hoVYnwlX2evx
         F2euMwd1YUqx9XiHKXevSJ8msnM/OOZhquLgqlNe9Ss9Ees8v0JOJiAefydxFQjR8Az7
         efFoz6Vnu3esCmsmmgsdMe37Mc6VFsP+2/vXuYr4OfxYOVWW1rbB9m8uMSV2/JM/MEy5
         skk5c3T0+gPaxPOHpv+4PNOzqoNp26q7iijLwYY9wwUlyzpTJpgx3ZpnKIj/D3nmQvac
         iZElLsQUXO5bEaGKwLZd7zMfAOXjq6P8ojRzpGkv4VCi4wJib6ZJlvMnn/QKtGwBRcUF
         X5OA==
X-Gm-Message-State: AOAM532O7qxzBKi5SyT/LeCFoVeHEMC4HSvlUpxj3JvmM1kbV+7ulkzW
        Rb4FaluwtgHWEFD4X79Y+uZzO+beKlUlxTGMgz4=
X-Google-Smtp-Source: ABdhPJxFD0i7gs8uThJ//VCa7+helg4jwziEmJuqyZhUHMWlfsuHd6R+kmKqUxwaCK8aFXx4Dd5Dpi7pXbcjFVfqS7I=
X-Received: by 2002:a81:2ed6:: with SMTP id u205mr822573ywu.23.1644573901888;
 Fri, 11 Feb 2022 02:05:01 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7000:1fa9:0:0:0:0 with HTTP; Fri, 11 Feb 2022 02:05:01
 -0800 (PST)
Reply-To: michellegoodman035@gmail.com
From:   Shayma <shaymamarwan08@gmail.com>
Date:   Fri, 11 Feb 2022 10:05:01 +0000
Message-ID: <CA+HOoT0zN_GdxP2_Q-GKWHHy7Yw_ZiMU2vp_t9=2VMAAvrXCaA@mail.gmail.com>
Subject: Halllo
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b2c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [shaymamarwan08[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [shaymamarwan08[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [michellegoodman035[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hallo, ich hoffe du hast meine Nachricht erhalten.
Ich brauche schnelle Antworten
Danke.
Michelle
