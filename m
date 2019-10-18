Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F98FDC4D9
	for <lists+linux-ide@lfdr.de>; Fri, 18 Oct 2019 14:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390082AbfJRM1U (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 18 Oct 2019 08:27:20 -0400
Received: from sonic307-1.consmr.mail.bf2.yahoo.com ([74.6.134.40]:34788 "EHLO
        sonic307-1.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728735AbfJRM1T (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 18 Oct 2019 08:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1571401638; bh=sgFa7Cs4ss6n8sA+brLiAjHMpjB11xRWsbVGUlCB1X4=; h=Date:From:Reply-To:Subject:From:Subject; b=NvFH4pXUHpkWlCtKsXr36+UNcjK6eMQZM90+bOuzJAs/UUkeLNXYdPryvSa4stPS4X/147Xy3fAFtYwOxLfF3r+b0lF9J2M90HLmCiEblCotAaLcu5yZfKsJ5H9CY2WYaeb5jfLKFOANTb9YTx6mjue0X4ScIoUmmMYsCKJpDkXOgONMw06cPyXlqfh6VBgWXTKxgnFmSYmrFdRt0mocUDgkRUCpdaEBD9IxdHeUFpZ3c8CCFHCKzpoUWNvKFTSCin2uROYOhbQ+Ala8wItP/MXCOZ49xm8McnvJKPX5FYFvji6tpqYBJcnhmh3RCkyQsVpUfbeAb1LKlNWYRYylLQ==
X-YMail-OSG: Syn4Ah8VM1nIx0k_VCwV2jlixvLKpGVusNgY1zhXrdejT0tEHwsWawzkomHJDqL
 1UQeMxelF_AhA00PkreSD9dd42iLOy0zARJ4XbykWRYocdCqR3JCwQAKDV7ecNw7DYnSSr6FuBV_
 xA19rvZEntKq_tfm_Sj3c.LXrHXXZnA2DTV7ljZpLQP2V3ApRNcbCAL1imFE5fxRDAFXDnyU1zU2
 6_npNEZnrtNy3nO.4swJF3_dozR7pgE9y8o2kUtSMpcU8PGIQu0Dbex9JHWD2ew6Ejwi3D0QJvpx
 9VX2Ru9qINYYktG8AikLvroMlQets6e7JaZaSPXhxjqtdcsLzGBh2nZRu7P8JsxOPlVu3GAPSTaV
 M79eaIMNUpTSTyQfUdUwUWRt3.J.a3p7AGdHtduv21nKmSP7yv0pjk4_vS4_8L8UvCKk_HXgc_AX
 g1bkEG_OrXA_pHTIOghlKeIabPwFZ_Y3sJv6A8Jf_yOVgrPRuhZpPRKCx0W9uGZ3Ojlznka1jnG2
 AXhfvXDMj.BIbWhkp.CGw68IF5CBXP5qZNdIhYe53Egi2m0GRmu4GUdI26IccxuYCwrw5tb6joqV
 4M4mvJstkyYpm4Lxtm3F7Q93g3wNc7SoDp4FRfPnqJigL_JyV_aZNIk.HUJV.a9KaOdqlTmnWC87
 QIdQ4boNt8taOq1e6Vi0n4AyGKTY.wzHtOWBu2psYfu3VHzYLqkidMw5dJjeNFpJg5Q44U0IbCvK
 6uPVhnkrDAccIxkExi6PriWIdpLqhA1YlCbUkhTuc2PB154RHvT08FIS4CbEx0xHbVH1d0YaqZeI
 MYDssWtK19zVN7CinBix.o6kTuKYiIndIBiUczy.dC.xh5AtGszK1yn9Xp0W5O0kCxywvmDNjnne
 sVWW80HrlxAcagk0uUqaWu6i_r1U1RJo7v98olF6_uX35.s9CeSpfSoksU5i3A4yarTg30BJcYPu
 rmYSaPgv.FddJgUrQz4cnrYEZilDKNABt6f9w3SAvQnktPEXDMwgSn261fGFO7EGrYWeHtwNQpDo
 4hCpMiF6ZDI_gfCwuHQJR2h6LExFkKScEPaflRUkBeeA8XHj.Zh6xwJB_.Zcf61nSqE4MhW3J5Dt
 1B5HiwZVSfpR6hDnnNdcOSSriX8uCiIT5lpn.irsCDp_c.30khlsGdY..wPIAI3NEHFW_CRymaQg
 QkuevVPNWvTn9Tlw7DXgqwwNJOfJciNbxfZ_ndLugem33Tpi31qc_adpQBSSJ6x2j1rtdHRe1Bxz
 KFkyB2PRQnAtDDD8Z26H7a6OndKG6mky3jSdlhperJ6.H4oHKojsyP4J_0ksZ9uaChoI.ozr6x8F
 jUNw3
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.bf2.yahoo.com with HTTP; Fri, 18 Oct 2019 12:27:18 +0000
Date:   Fri, 18 Oct 2019 12:27:13 +0000 (UTC)
From:   "Dr.Youssef Bakary" <mrs.nathaliehamon777@gmail.com>
Reply-To: dr.youssefbakary1960@gmail.com
Message-ID: <91502178.2267156.1571401633603@mail.yahoo.com>
Subject: Dear Friend
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Dear Friend

I am Dr. Youssef Bakary, I Have a Business Proposal of $5.3 million For You=
.
I am aware of the unsafe nature of the internet, and was compelled to use t=
his medium due to the nature of this project. I have access to very vital i=
nformation that can be used to transfer this huge amount of money, which ma=
y culminate into the investment of the said=20
funds into your company or any lucrative venture in your country.
If you will like to assist me as a partner then indicate your interest, aft=
er which we shall both discuss the modalities and the sharing percentage.Up=
on receipt of your reply on your expression of Interest
 I will give you full details, on how the business will be executed I am op=
en for negotiation.=20
Thanks for your anticipated cooperation.
Note you might receive this message in your inbox or spam or junk folder, d=
epends on your web host or server network.

Thanks=E2=80=99
Best Regards
Dr. Youssef Bakary,
