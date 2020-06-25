Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD10209AE1
	for <lists+linux-ide@lfdr.de>; Thu, 25 Jun 2020 10:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390470AbgFYIAB (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 25 Jun 2020 04:00:01 -0400
Received: from sonic307-56.consmr.mail.ne1.yahoo.com ([66.163.190.31]:38139
        "EHLO sonic307-56.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726930AbgFYIAB (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 25 Jun 2020 04:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1593072000; bh=vwV4urvHmtj8/z2Hz3v0lsFR9fF0PlT1hahNolY0i4c=; h=Date:From:Reply-To:Subject:References:From:Subject; b=k5JNl3PojlP0UyR4SRBmPosPQ4x3UlpyPAhM15JIJ7pEdAXmVT8kjz2fFihOm1oC/A8R+shYSbxQHSzR0/+vhqNUXB76n2scBjapH11cl9S9XYGcuH6XBculOXPNysc3uAawF4oX82Ihq47wZKE1PRh/dORuxyqBYgd+9aL2DYPh7Fy4pvS1HHFPRrazUX0XQ10nrbGJt0xPExkd2e6mP5yDCWSuAnuBSzmqLVw3kRNc3wx0bkrPCQ31oJVih3jlM1t7L3qCdGrXVkI6mvJcglXVvd1P7tvGqPxOdRkVkxL+44vnCkoKtCGZnrlgX76meScS30Ak6UveAE1MF7v3jA==
X-YMail-OSG: rqHSDR4VM1kMf7BHp9tmLnx1HO36s7QY6gtWluiit4oto0sPCDrQAd3amMKeOod
 w87axEyvWeUAs4aELjVBck8uJLydSwrkHbJcKlYRJdl550i0HcdAah2k7BQ1rSfUeDAa5wjx4smV
 2bKwyKlorS7NMCi2JAQ8y60o_Yi42NjjX5vE5rnZUwUYMWn6p.NvHIBara9NM56ZBV95Ib3NjRtd
 z7V5N.ve7wmr74b6tgn5YatI2RgYoIPh81u3mqvGQKluS7HETAJxq61QPTwFi84yWqLe0eF7yFOq
 hfxZ8Rw6n_gKGY8oeX.XCzb.lWVOibxD0Rib9UWcBD7mtTaX1Ysplp5EVmkQvQtgxQuv1PlJXiX.
 A14DNpw8ncm1f30FZYKtGYu82cnbcJVhYvzeiOgL.VsjPxQmaC0fNndXG43sgfuWz.6.T1l4PZ0.
 .7psKwUL35.K5LQQ7ePxNS3rrm5JBvEOjHZXJ9pqpOcNj7uiTL1vVb7ENvb0zQnyOwYoQOXj46BM
 mXRb5dDrSQpPDpZE8yX0V2FepQ3d1ZP8OxScReKXJVk0DZDWVHfBikOy_HKlZ4PpcqaOjMwlY.g7
 vxaPj0OwSURzVm7bKhqhhalgrUS7yLNcR0HV7nvFNJg5CQe711tY8PxnABm1SPfA_hm3oHo_5KFd
 mGYzFbDkSqlgnJ9XuH1uePiqDdRRsOPp0r50oNaQuCczf_HV.qGFmt8DedFEi_1WI_q2CWvRcLX1
 ZVTnSaKBbOqmLAne3U7Al24O6uLAYseb48AikKXYDSYM0xlWtweohgXrLMLg6RpWa4FixedXubqU
 u.CrkS6dYdVsOU9EA8rmnQIIbFPuqu.VFj8JFHrUq6b_uoY_XZji0LfwFzXoVgHmHM.y9EsJ_4HX
 U1x.hrBlXSFGgnh.guI1ESKHn389V7.DOZB1qhRYztS9AsAmRNNcyV1PE4B82qy4jgk0pskFq2g4
 UjFn8Ihr.NffbwHkTkiaqCoGbUSw9Xnvs6x0B4GuNTK3FZOI5k_mxoUK_QIqX1zjpWvr1IKbsSiP
 Diz728bzMcdD_oohIHEFyXLnW05wJvW2Jw.gDzS.oC9_jbdC2fSO1Vw.BDNzi7nr3JpjCcDnCLod
 ScW5p_IKhaUUS1bOACQVgpS1PHlxOBmqxjGkL7XMGk1o4EURuBHC_Wy.B0V1NeRXMqW4wCqn3cMf
 HljICxR9gdI7TDWpyXiZ6tjLLUotRp1W99L91GLqQt2hIV7t36pxNz2aBWe1a2f69otsQAsgp24C
 _POEw57NEfBr5JLZULNcqYvlPHxTr7YH5lRdb.e2EWgt_fGndA7Q4XMq_S2HdUkewRoSy
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Thu, 25 Jun 2020 08:00:00 +0000
Date:   Thu, 25 Jun 2020 07:59:59 +0000 (UTC)
From:   Mrs Maria Johnson <mrsmariajohnson07@gmail.com>
Reply-To: mrsmariajohnson07@gmail.com
Message-ID: <19678630.3454598.1593071999951@mail.yahoo.com>
Subject: GOOD DAY.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <19678630.3454598.1593071999951.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16138 YMailNodin Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2)
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Good day!

I am Mrs Maria Johnson an Active Banker, I saw your email address while browsing through the bank DTC Screen in my office yesterday, so i decided to use this very chance to know you more. I have deal of ($10.5 million Dollars) to transfer into your account, if you are interested get back to me for more details.

I am waiting for your response.
Thanks,
Mrs Maria Johnson
