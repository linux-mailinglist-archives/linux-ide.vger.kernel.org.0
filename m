Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D27261748EE
	for <lists+linux-ide@lfdr.de>; Sat, 29 Feb 2020 20:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbgB2To5 (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 29 Feb 2020 14:44:57 -0500
Received: from sonic302-22.consmr.mail.ne1.yahoo.com ([66.163.186.148]:38716
        "EHLO sonic302-22.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727102AbgB2To5 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 29 Feb 2020 14:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1583005495; bh=YR8wGsHZxrVLbZLbTkExH+WvaqI93EK8wnfiRBAnvNY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=lwyRxYNceCrW8iK4qrPr3kZZNaLGqXhL4C5CsW6xO0Y/YIUigw3lqxzbvr48v7UErt+F2JkAckWMmsP5WYT5iEWWYBJnzRkdCe6DNBNkkICIB2okgvHgTMAdYGUHWJ2H/KaxDr4yjWjMpIadXxP5cIsLH1FsL4kI+Gvml2uj3OsYv9fYdUv3j+H9Db/vxBKqjq8ABoB3DzxpM70lzYA9t9TlIDVeu7q4W74pvCscYOLZ9+WYT/5yIzVX7639/sQE7/5rOqPinj0DsdhLaB2sYlkHOMhfpELNzJUwLEMHma2TZXKVnXnfbaqPmN4OrL+p6jH6RroZo3+bYxyKZjsVlQ==
X-YMail-OSG: _Hb_EBEVM1nI5jyemvhmbvBjHswh6ERxPk4MQmgQflfoyU5JCBYQAobq.jQY4C_
 iFfyF.IkCJiOVMK2kEe2FoNaIVcQs5_lcCjuzDIHG8.iorrec0BLOsm1IIzt8l6.bxXYfAJBctb4
 ywdFPxN8F0rNg2kCt0yQiLqCjFaKF2fmQxq2Ql4J3RIopYyUunIXC3ZDF.seIR2M8ozIjisIzOc9
 E1LRI4w9643r2ktDHj48ihwGq_HrdDFe8wL.Qd3dZStUyqw2gtXaM3GyZoUWHJxkQdfOCm6sMvAe
 gyI.FY5dOapPg7OPZlep4bPf.y77hpO0vdqyIQhDaHs_.vMZ4Mjo7vv9fCdoGSh_7N.AZKiIMMSn
 n7HDTIwXNDxAFLeXyCqifq9HFdAp.xXp3nEQB0vNd5COKg2YeQpeoCbfTA7LUiI4XfJocbdQxPkZ
 697tHPb_9D2el44yVD4NwYg_4xEwJ26RD6PztDoGopTwlUvDKlDszg71B2sbEMxOCUQBlaxXZHSi
 LjwFsJP_eXMHribflAAo0Z4NwKc5vujPKz.DAd5em4SFwLyMbgib8DL5eu88wd_Kq5xCfDLHKR_l
 eFQR3w61dIy99lnY_IiL3xiug8TLuhptDb5l2jBSzgDk9XZMjB_dsR972JjtH9VWor7ekENYt7.T
 X8jdjulsBlKiBQcF2n4Qb9Qk_Kefm6g7bnmSyFF3JVOegpDkW9emnuH3ne.jvUbrHiORkdnHFvR7
 YzVeVNnX6lDHtg4pw5ZUoEL5pKxCWINkZ0PWefmzZyPZ.nSCEw7DEYNJn2GlI4oVdrzzKqCZe.14
 Lhuaf03B5RTxIAnPjdfYz54.SfW_kgy0tMLgqXYB2u4tpjQ9BbtFLItqleGD_msWYR9n6k5vaedp
 oaJ_QmUon_DcT3ZRCjlYQFO89q6wHmIAOH4.m2hJ9Vosgxij3ear7kPlbU5wq5cRrjF27eIBt.a6
 BDr2QCEwhKi7mwnCduGEhmAbd4Lt2Haw7ZUAVwXZ9IQXuXedkLxN5BvCIbt8GT2EAk2Jff_3mRtm
 XU3n6yNZbzdfL2D2A2m8yu1vWZuPvL1cXuTgM5XqKVCWC4GtdyZJu70qLUlThLKccWPQ8igdi1c1
 K2yLQ4HRKZwViRTj2ECGOPPbx4Z9zoeIZawQ7VPp6LfW7hquRItnaPN8YafT8Vah4d.N05Kg_Ix9
 2Ntq4Yd68j.5NElMc7ZUP1WbIpW6A_vhskbiy245aTjV9wKG8c1bYUL3.XXr0FCWS27PWUyZpF4_
 PsE94LRY4ZfXc8Wnuq1VmskZU93aR0AM75LN_nmrVIhtdMM7VR3Dd7k1XvqmlXHDxWwSXgHhTVJA
 jOdIeZg--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ne1.yahoo.com with HTTP; Sat, 29 Feb 2020 19:44:55 +0000
Date:   Sat, 29 Feb 2020 19:44:54 +0000 (UTC)
From:   "Mrs. Maria Johnson" <mrsmariiajohnson03@gmail.com>
Reply-To: mrsmariiajohnson03@gmail.com
Message-ID: <1608217654.2441157.1583005494039@mail.yahoo.com>
Subject: Mrs Maria Johnson!
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1608217654.2441157.1583005494039.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15302 YMailNodin Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2)
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Dear friend.

I am Mrs Maria Johnson an Active Banker, I saw your email address while browsing through the bank DTC Screen in my office yesterday, so i decided to use this very chance to know you more I have deal of ($10.5 million Dollars) to transfer into your account, if you are interested get back to me for more details.

Thanks for your co-operation.

Your faithfully
Mrs Maria Johnson
 
