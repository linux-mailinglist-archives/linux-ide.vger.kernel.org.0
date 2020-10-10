Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36A80289E80
	for <lists+linux-ide@lfdr.de>; Sat, 10 Oct 2020 07:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgJJFQE (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 10 Oct 2020 01:16:04 -0400
Received: from sonic316-13.consmr.mail.bf2.yahoo.com ([74.6.130.123]:34416
        "EHLO sonic316-13.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726886AbgJJFP4 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 10 Oct 2020 01:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602306951; bh=t02qgn9EOfF++hcv9Sm/4Wm5mSTrfq3DNOylXcazWr4=; h=Date:From:Reply-To:Subject:References:From:Subject; b=L3GBiLvhxrCTgICWp1x3ErN1/z2wH4vfdy7+g9vyVKicI8bKuFr59tBsPhm4A3CyIdY1ZnsyYgQIXU+iOOoXnc6OR4tyIxwP8N2+Nja+deb4jthjGFx+mw/aRD0eQ6W9/4h01pyfytsjHM7LcywvBI9lYTjDzEX63iAuCKE505pW91NgQVDr1EsMEiFX7cCCQjIGadOrAXV50CB/ieAjVP2lea8UDic9ezBS/zCNuJ8oS1Vh1aSVkd+8K3QcoB9ThFhIfJQkiTkuIHj9Krfa7RM80iikd9vSMOzDS+oPprwkAr7VckCAgRDu3525SE8v3hCnkS1ZjVM+dQX/18V4kw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602306951; bh=dIOO4R+XDkcOhBNkqfKYUDuDWMU8uJQeo+cVZKCW1+V=; h=Date:From:Subject; b=k+oT61DC9o8dmVyIv6tBLZ39M07w1SsNJipCmVHviK6OSS9ynDiPgO0jeFCgROp91fl5mtuwUEuKB0CjxtY6rnthiOc1u+5GyXP0nCCriETaTvlvqGZpPkYrQMuZ8tyAusYIQ8vVZBFRuCh7FVChi5HxQUsRvO4sBH9l3npa3acK0Jm1UfGqr64o3eHvjrMAQkfOMs/kCH0pCsGLnLYf/RhZjwJWAKxktPYnTn13heUSQCX5QM6dCwmkvwzoE2T8T5h7wvaCCRiB3BPtLRu10IYRR3Ct6BpemEAFVwac3Rrbpsj6ryTqhVHdWmN+k+KkpiUzTbDaF7vhQDohT8ECVg==
X-YMail-OSG: QeC1WuIVM1nvk6r3xvZbqhaQNwE_RRnQFyuHns2_a80RVtUdx.7bffARjP2Wgau
 b.4zts9Sbms__Mw7.wF3upPjhHbLGlb3G5VlQunxxHrn7HH.l9YT8s3LyVVyE8x4YUWJR.oY.6zd
 86bRlgI7bxdurytEGF31oNjJvqnuzCtwRc4PehgAT52PQMzoHqSyFHcHGebF5uN8idGGnBWSDRkR
 h1vLYmDoKfdgmq3JHV1hfg6kDoQnfscouFFfAzz0Hb7i9nMEPI_5G4XzeLIytSmscHbW9WvP95mg
 i7wrPmnpBbKGQeMdZAwhtCv.AwXQChoOJBvZ9SotvPS4.aZrvmP.StAQABteLJaTgfKME.4B9U5T
 aDjoqZC00AyJFRtkJ2tl2cm_BYg53_sW_063BQPOi8.8SaPYlFXl_ADy3rYSdhAtPrs.FAWYauAh
 Lq_Qghz61c0XXw.zCLUSE5SFM9Yar2I8M.2hPs.szCpKfx4Y5uP6of1DfKb4xtKCybRnME3Zk3c6
 tGIoPbYCDoBGZYCJTM9957kBlesmBRfhgrIAQpL5aNw62ssBcM.H1S07opW3zhIwIyJipMXqUEoq
 gMer1Rp77U.00zPk9feFtJ3Ps7ufCCuSL4WYz5ZPd6ZxwUn1pN5mH6M.3HIcNEjGz6LDUfC7b1QJ
 TIu9Nje3QCPG8gg.kDbisHPri3F.SSRj2y_a1UAyHtGQaMgaeopZJJj1zt.zJPSvIyok2iy3_xDs
 IPs0asGWG0NqubXw2ZVYQYMDUK5CRR3O.RX0dclQ57mn9CHmnRW.bCFB.4NJ3l9aqs4MwAO.hwpr
 14X.gWjJAWJsJEGD02F5sJQjh6pCJGKgXI95Yu9S_1bX6x9OkkV0F7RtAdbm4Z6a00esTT12KwG8
 GcFeBE3wJsca89MAiVPt1dNZ7WfAEL_9IdsvtLN8k6GBc_YrASQDfxxgpJVe6MrqHfD9cYTmzcb7
 3lw_p36IYNQwLnEkHyslNRNYXmDdmdoV1beTGdNwInL01CNf5og.anfHdckDDu2BMFaPRklW1Yoa
 BidBgTPurMfn3pGvHmcy_CJyrO4_LWSPEwfy79QB1onBD.iU4nuk2O3DZtWwOWZgH.ZrNUoy0Nhb
 _.TiFOZ0pj9agZMjZ5okIMeG03XiGql7bKVbdTBsMIee8W.7eRF6qnXyY8icSTPq.5Spxg5Yv6mD
 BZj4g_BGgxWIjvgJPCF3atDGssZGMlR46ewR_o5sSYU2s3zPB7T0Enj3h_ZHis0N48FXJdEUGP8C
 oDI90ulT8..bmwqyTRnLncNGbKDJCdUD.d7a_l5FDNKHkU0.wHSP6_Ygxn1MGPoJLrO78h2DaUEz
 qe6XI.QGDbqmL7ARiVtWM40eCqXJrHcb5WygZuRbYpwD4jW5tT3BuU4v2sBdH1sJg0ao5O_LRaoL
 kCLC8SIuVknY3iDXBpzl2Lo09hTgX4C89x5my5L1VxDSloj.kjOh_8WVHRw02T7AMGoMOwg--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.bf2.yahoo.com with HTTP; Sat, 10 Oct 2020 05:15:51 +0000
Date:   Sat, 10 Oct 2020 05:15:46 +0000 (UTC)
From:   Miss Vina Omran Hussain <ms.vinaomran@gmail.com>
Reply-To: miss.vina24@gmail.com
Message-ID: <437599445.18596.1602306946424@mail.yahoo.com>
Subject: Dearest,
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <437599445.18596.1602306946424.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16795 YMailNodin Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Dearest,

Good day and how are you doing today. I'm really delighted to communicate w=
ith you and I believe we can achieve everything together and create somethi=
ng great in nearest future. My name is Ms. Vina Omran Hussain Ibrahim  and =
I'm a young girl of 24 year old from Kobani a city in the Aleppo Governorat=
e in Northern Syria and presently, I'm residing in the Republic of Burkina =
Faso as a refugee due to killing of my parents by the ISIS fighters on the =
year 2015 popularly know as "Kobani Massacre" that was carried out by the D=
aesh/ISIS fighters. Please don't be discouraged for hearing this. I believe=
 deep down inside me that you will never break my heart or let me down in a=
nyway.

My beloved father(Mr.Omran Hussain Ibrahim ) was the Mayor of the city of K=
obani and also the Head of Aleppo Investment Authority. The brutal killing =
of my father took place one early morning by the Daesh/ISIS fighters as a r=
esult of the ongoing civil war in Syria. I was in my first year in the Univ=
ersity of Aleppo studying Arts and Humanities before the sad incident and t=
hat led to the death of my beloved father. Darling, I know that it is too e=
arly to disclose my life story to you but please bear with me. My living co=
ndition is very critical, please I need your possible help to reclaim my in=
heritance and start a new life. My uncle have sought to kill me so that he =
will have full control of my father's estate but I am happy that all his ev=
il failed.

Meanwhile, I decided to travel abroad in order to secure my future but the =
problem is that since I don't have an international passport, I cannot be a=
llowed to enter any Country freely and legally. However, the only choice fo=
r me was to enter Turkey, because it is not far from Kobani and many people=
 are crossing to Turkey so I joined them and crossed over to Turkey. It was=
 in my presence that the Turkish soldiers gunned down Kader Ortakaya a famo=
us woman activist at the Turkey and Syria border. A lot happened during thi=
s conflict, it was awful, I only thank God that I'm alive today.

I arrived to Burkina Faso through the help of International Red Cross and R=
ed Crescent Movement, they were moving people away from the Turkish border =
because of the insecurity of the border, so they moved some people to Canad=
a, some to Germany and Italy and few to Morocco and Burkina Faso. I decided=
 to come to Burkina Faso, because when my beloved father was alive, he reve=
aled to me about the sum of $27.5 Million which he deposited in one of the =
Banks in Burkina Faso with my name as his next of kin. On my arrival to Oua=
gadougou, where the Bank is located, I contacted them to clear the money, b=
ut the Branch operation Manager who confirmed the deposited amount of money=
 told me that my status as a refugee according to the Laws of Burkina Faso =
does not permit me to engage in any Bank transaction. He advised me to nomi=
nate a trustee who will stand on my behalf and carry out the operation. Thi=
s has become necessary after I have been denied the right to own a Bank acc=
ount or perform other forms of financial transaction here because I am a po=
litical asylum seeker. So, I decided to get in touch with you so that you w=
ill help me with the transfer of this money into your Bank account for inve=
stment in your Country.  After you have received the money in your Bank acc=
ount,  you will send me some amount of money to process my traveling papers=
 because I want to relocate to your Country where I will start a new life w=
ith you.  And I intend to complete my academic studies in your Country.  I =
accept to share my life with you and give you all my attention from day one=
 of the meetings.

Immediately you confirm your interest to help me, then I will give you more=
 details as to how we shall conclude this transaction. Please do let me kno=
w if you are interested in helping me with the transfer of the money into y=
our bank account for possible investment in your Country so that I will sen=
d you more details on how you will stand as my trustee and finalize the tra=
nsaction with the Bank where my dad deposited the money. I beg you please t=
o keep this as a top secret between us for confidential reasons. At the mom=
ent I am living in the Mission House. Life in this place is very unbearable=
 because we are not allowed to go out and we are monitored by the Church se=
curity guard. Please help me because I want to leave this place quickly to =
live my normal with you.

I look forward to hearing from you soon.

Yours truly
Ms.Vina Omran Hussain Ibrahim .
