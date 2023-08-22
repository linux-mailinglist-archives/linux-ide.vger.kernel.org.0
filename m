Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA82D784E61
	for <lists+linux-ide@lfdr.de>; Wed, 23 Aug 2023 03:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232073AbjHWBp1 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 22 Aug 2023 21:45:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232089AbjHWBpW (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 22 Aug 2023 21:45:22 -0400
X-Greylist: delayed 916 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 18:45:20 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02DACE4B
        for <linux-ide@vger.kernel.org>; Tue, 22 Aug 2023 18:45:19 -0700 (PDT)
X-AuditID: cb7c291e-06dff70000002aeb-8f-64e54c315fd8
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id EA.9C.10987.13C45E46; Wed, 23 Aug 2023 05:00:50 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=FPeHwQymFr9KtTfwpVWkzstRC+g+ALivDbN7xfPDg7ybdr0zpgtD5RxIptnBm4MKG
          Es72MKi+1HvjWvg/ceWzTtVgPFRxGh/S5ob4xjMWUyujCh8e2O/+GsPAL5QZnuknD
          LCCL4hlMvOUQ/JvaGIm6ZjQ70h5XtTADjinS84MFE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=PaMxYC0DQQVHQxMal7TISByB9od33FFXZtV7KIcxxIyzPV51Z8Ae6qDojYnOw3xdv
          pPCCGNJRFcuIkElceMaZg2Eq2zx7rnm7OOP+XZXCyoyYMl7xbPcfEEsP59msCebSu
          rhBEQNSvQ3Qtft3nikSmOeJi7VPOzr77w4sTaYV/w=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:31:02 +0500
Message-ID: <EA.9C.10987.13C45E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-ide@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:16 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsVyyUKGW9fI52mKweVLbBbHdjxicmD0+LxJ
        LoAxissmJTUnsyy1SN8ugStjyboLLAW7mSva+hexNDA+Zupi5OCQEDCROPZPvYuRi0NIYA+T
        xLfJ35lBHBaB1cwSPZuPskM4D5kl+pecZocoa2aUuNfYB1TGycErYC1x+u1lJhCbWUBP4sbU
        KWwQcUGJkzOfsEDEtSWWLXzNDLKOWUBN4mtXCUhYWEBM4tO0ZewgtoiArET/x1NgrWwC+hIr
        vjYzgtgsAqoSr85dA4sLCUhJbLyynm0CI/8sJNtmIdk2C8m2WQjbFjCyrGKUKK7MTQSGWrKJ
        XnJ+bnFiSbFeXmqJXkH2JkZgGJ6u0ZTbwbj0UuIhRgEORiUe3p/rnqQIsSaWAXUdYpTgYFYS
        4ZX+/jBFiDclsbIqtSg/vqg0J7X4EKM0B4uSOK+t0LNkIYH0xJLU7NTUgtQimCwTB6dUA2NQ
        x0OXl7oSeUdtldvfl2z/d8x5+hyx4nzlJVmdwk03lPwm5hzuU/KxU/NpYOwX9rEJvDA3IvBy
        Y7LvTUt/19R17bMavN4ulrB6zXrXMuTW6+Iv7ZNPvbHy+h7EuClW4fz0vy9DN8+69L38pN4B
        g6UG/6dEFp9c9SXqeYpO+qGyG41vJz4XV1ViKc5INNRiLipOBADXr0pOPwIAAA==
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_LOW,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [203.124.41.30 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

