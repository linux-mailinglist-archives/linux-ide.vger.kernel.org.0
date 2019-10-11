Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74ABBD43FE
	for <lists+linux-ide@lfdr.de>; Fri, 11 Oct 2019 17:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbfJKPRe (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 11 Oct 2019 11:17:34 -0400
Received: from sonic310-24.consmr.mail.ne1.yahoo.com ([66.163.186.205]:46467
        "EHLO sonic310-24.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726331AbfJKPRe (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 11 Oct 2019 11:17:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1570807052; bh=sgFa7Cs4ss6n8sA+brLiAjHMpjB11xRWsbVGUlCB1X4=; h=Date:From:Reply-To:Subject:From:Subject; b=RyBSVRZjm+z/r9lKjD0fqHUMusA2iT4iBtj/EulwMY8KnBdsjK2mHRlNjmTcmqXptMUl/k6TTgbAXS5+a8jn27hROXK4l1Vpalr7ArCacuV5q9ZxeRGswikpMDVK2MtjDovFFWzHrMZVarMHIS5rILkaGX8dHGGisxCrePqL9M8eKugbZAmDQKM/cH1av3kWIzPJvGNVOX7JiX/qnW3bLQKB4c3CDzOt1jlzIH209NsO2yjnaysEQhcWXYs4z5JxHcLFhAU3JBvKhoCiT60wh9nKgxcAXo14DxkogoHQVVlb9hCdb4OSxQgsOby3X6mW8ynql6Mo7cUhpsbWfmRMUg==
X-YMail-OSG: jtPhGHkVM1ngVCbWaT2NHvxoPpetfYWTYMAhW7zBQaSod181Z5Zbo9KyiqS1G00
 oG0XePPx2LozpaxgaWkhqyDWYmsbHB4GxGU5j00Yv0zyPsvk7y6PbQ6cFUrXm1jTSFG41ead01Br
 QDFc0X.CPoTYZ22fokva70X88ntPOauFNWaaLakjQEBY5OrRD2vlWQxWigCdpg0G1rzpcKmKn5pc
 noJVvf14WhpslBTGkL0rBeAp.p3RoWyUpAgV4KGz2eL2o.4lHYunYXxKacNg7N6zo65XdRy3vpWO
 H5JBJ135d0An7BFWsClIDklrV3iuh8NoNXC2hWH6Yxomrwj6aC9Mqj7cu8nbM9JFjAFfTQKZcKoP
 cQzOuv1C7bYSUEcjR5Pj0d_aA_82w0UD4_KUomJC6HiNkU4OXOf7yh3yO9jqWr8K6KLktSb2gGGx
 Arj5ohj5D3ZBdYXvrjjOzIr1LUNclI_NoLz38OJBNXPPnDvBuXG7kMlV5aw.BBW25XgWPdoDv35y
 qyXujU4yC.tr2MDcixm7u5lxUEZLD_niy9oyxLzMTAhm8bLFHHrAKxMFdNlZI.6iEZmQIHHp39xm
 w3.WW2HvolfDuEefMVvDBDtvIjcaSfm4yko.L5F_tBEhPe2V0rnumRppVVBLmXKlKKJ96ea.8nOV
 rx08S4lZwG3tkChv47DnCKNsMBBsF39VA8s4q_y2.Xk7zygBPKKSpMf4UJdyEx8j_kB9LhqCTr42
 2JbQ81XF4Rzqspt9b0ufe_00zXin6f6XklfU6G5fNERWEKfO0ejdhcvYEMhWUEZz5CncuimNk97i
 2rLTBOfras4SzDLFXY6i7GKMXyWtIUlhZP8T8mg1h6SdQFb2RKGNuJRtth6_8ZZ2yF.hV3HbzO5I
 HI7CxUeTuO_nknNdbGmEsPXg4hJbX6QK0Gkd5MeHuhiMqdioHfmgsEURABX2x54dNQ8jxpEpSEX8
 SIBlTF2cDr_VvqhqRmb81MLS4Z6zS9B40iJoS3ia_u0seJ9R_jNPiK5YclpRCdUDSLTRpjm636am
 IvXqYIE4s0DQ1cP97uLoDZfrmsuu7R7UIxT5CW60Z1yKrjGzNeAPPaMBO0EmfVTuQpRGHt22cvWb
 Oe5oPjPj8NdvMOh1QJoDSRSE3U4CNvsDp9G6HcBHmibmva08ChtDrUWurQucEGLZt.KlcVH_Fcxs
 4noE7OaBnqU5iGXVv_mg290CuGP4jmTGTLwO3RddyXQQ6BjwoJQaMqRDUEgxyWF_98y5p5mD1CFF
 ywEgVxNU.XKNKlRNztMlcYqpdaZJCAyBTQdr9sXcTAnHrB8BCYwYB
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Fri, 11 Oct 2019 15:17:32 +0000
Date:   Fri, 11 Oct 2019 15:17:31 +0000 (UTC)
From:   "Dr.Youssef Bakary" <mrs.nathaliehamon777@gmail.com>
Reply-To: dr.youssefbakary1960@gmail.com
Message-ID: <177579065.239974.1570807051618@mail.yahoo.com>
Subject: HELLO
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
