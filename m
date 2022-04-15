Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFD1502A94
	for <lists+linux-ide@lfdr.de>; Fri, 15 Apr 2022 14:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238574AbiDOM70 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 15 Apr 2022 08:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353825AbiDOM7Z (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 15 Apr 2022 08:59:25 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE82CA0FD
        for <linux-ide@vger.kernel.org>; Fri, 15 Apr 2022 05:56:57 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id c15so9428903ljr.9
        for <linux-ide@vger.kernel.org>; Fri, 15 Apr 2022 05:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=lDs0XYshYZ/Fd5UwCJKdlI8hN6t6rPSzlrpXFIAfIGLcVP2s46kXKHvOwq46Oz0clz
         tiSNpMBX5hNHle+5TAJ0rfI84B0iLai1eFPXX1E46Y4on8Ih/79J0/nB2NLkbUaePoe5
         Xj51UVkgIFzDlXffbY0mHi+qeYuSGfJm/1FnWI+Jmd66eoiAVTjYIu5W7OzZHJAoTz0r
         qqi146N79flgD+FxLz2ODiAq7Y3q0eH7cjto1GZR9MoRCnuyBXtHD6++4dOLrS+qTNRa
         DxcA4BQUBv27zWLiMqSRvR4V9BjwOny0aEpIHuwUHlGPikxV8fkzpGyo+wNDm0ke4QMY
         Tjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=wLf/tkYFYR4fETTCF4FCs4uujhIrlslSFoFLMr7q4xdgJqlSYHtcz2vM9w/ywEUzQW
         txzyXNV6rsdZ+fF9h//ETEjl4g+dDpPHwm+zxJAVasCCOmi2ZiSD17GxJnr5PIWaIXHv
         XmFPTI/czc2F33cBNEx/h1787yC8oT8AsjNCuTeMTP6sNxucDLlsrvZVydfmCWpegUzj
         Cec9/kJh/M9U74HT3GICew4KGAvqGHWroqrxaaRb/eh4SxsblmYLD74W2S47LZivWFPW
         Bwhu+F/ChCqh49qYAzszpPxzCACNh5o3YsmBKBhMJZ90e7Zi4ftqJbG67EgK3G+w6k+P
         d2tA==
X-Gm-Message-State: AOAM533jmxkt+f08wfh4FVzxh6QnkkKfrPPF3v4Cis+XzTXArOlEe2PK
        JVl1pF7PRfNOSstUeGs514umeyRDeachnEPF/yQ=
X-Google-Smtp-Source: ABdhPJzIzT6xAPyZZmIBchZeSqogxwSvggrozwGk5+8sFPRzV2w4WHkf/PhHrPyLmAjz00+AuFzNU9JrY7uwukTsDyM=
X-Received: by 2002:a05:651c:890:b0:248:5819:b949 with SMTP id
 d16-20020a05651c089000b002485819b949mr4315366ljq.476.1650027416191; Fri, 15
 Apr 2022 05:56:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6512:2602:0:0:0:0 with HTTP; Fri, 15 Apr 2022 05:56:55
 -0700 (PDT)
Reply-To: robertsodjo63@gmail.com
From:   Roberts kodjo <robertazulioffice01@gmail.com>
Date:   Fri, 15 Apr 2022 12:56:55 +0000
Message-ID: <CACF-mbn0MU4T5F_iytx5J95L8E2585SFZB8W3aDAXyzN1K+_Qw@mail.gmail.com>
Subject: =?UTF-8?B?SGVsbMOzLiBFbGh1bnl0IMO8Z3lmZWxlbSDDvGd5dsOpZGplIHZhZ3lvaywgYWtpIG9seQ==?=
        =?UTF-8?B?YW4gZm9udG9zIMO8Z3lrw6ludCBkb2xnb3pvdHQsIGFtZWx5ZXQgbWVnIGtlbGwgYmVzesOpbG5lbSA=?=
        =?UTF-8?B?w5ZubmVsIGF6IGVsaHVueXQgw7xneWZlbGVtLCBhIGhhbMOhbGEgZWzFkXR0IDgsOCBtaWxsacOzIFVT?=
        =?UTF-8?B?RCDDqXJ0w6lrxbEsIG5lbSBpZ8OpbnllbHQgdmFneW9ubmFsIGthcGNzb2xhdGJhbi4gS8OpcmxlayA=?=
        =?UTF-8?B?w61yaiB2aXNzemEgw6lzIHbDoXJqIFRvdsOhYmJpIHLDqXN6bGV0ZWsgYXogw7xnZ3llbCBrYXBjc29s?=
        =?UTF-8?B?YXRiYW4uIFJvYmVydHMga29kam8s?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.9 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,MIXED_ES,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:233 listed in]
        [list.dnswl.org]
        * -0.0 BAYES_40 BODY: Bayes spam probability is 20 to 40%
        *      [score: 0.2422]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [robertsodjo63[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [robertazulioffice01[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [robertazulioffice01[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.9 MIXED_ES Too many es are not es
        *  3.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org


