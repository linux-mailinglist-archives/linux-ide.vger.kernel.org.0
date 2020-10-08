Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9D22874DA
	for <lists+linux-ide@lfdr.de>; Thu,  8 Oct 2020 15:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730301AbgJHNGE (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Thu, 8 Oct 2020 09:06:04 -0400
Received: from sonic301-2.consmr.mail.bf2.yahoo.com ([74.6.129.41]:46178 "EHLO
        sonic301-2.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730190AbgJHNGE (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Thu, 8 Oct 2020 09:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602162362; bh=089ar9RHzd2zQcYC0FXkOn0CBAJxUePuYFcp8M8NzqQ=; h=Date:From:Reply-To:Subject:References:From:Subject; b=Wf0lN0dYw5B213qYWscJ6Vv1pZ77kAU7uE/FGGM0C54MApakBfdhqzs+afPeEIOt5Uzr6l/3sl6NFwbEZeaT1W60li6XDOoY6HQJYSw7LeVF47fxN+fqx/9Irdz+vZVOSys2qkHNlJw2pMhXBh6KsOX2GeaFhiSPKwn9JsvpbwhuxgBm1llLCnw5ogvgIl+CD6zrJP9y+z6B0H3UEOCLi+3PG4xfiB9Z8wDagRWi7Osc/bZPAuPZUaShT0v45Sdq+i8AjznHi1pDH5hjKtMSJOpsaVQ3CMXNQHoYLBU/IcfGhPVUqbWTR2lEJZCCSVfRmptOv9BidJoYYnWzWbI/Cw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602162362; bh=5vIS9SHKdoR3XdaMX3329aMvlyD5m6VZX8FLWGpRB0b=; h=Date:From:Subject; b=Q+wzoK50kwKwTQJ6U6DGsUJapj3cnwJizzNW89dNYTFXBHYupVhwAjsEFLq0X0vNCeB788vJ5C8kkisLo4twCV03twxxUvGHhJuWsRKdTKNCLWji3doDQGvdXeI2GL1snpkZOMKhkss1Yq1U9Acqy8DS4SyH7Gk/OOGHgv6BCg+MjJM9D0mK2vhvVORe2T6OYY2IPFzXr3/UbuCxAhMQ/vDpRerEFUxcr90u29b4i4m5QQavTJuiWw28CBDfuRwqKCuAhexjFsIhQtqCAMsw7E28/sZeBST19Q+a32YBAIEbFd20v/1BzjQ3y5Uv3p2NUkmkUOBKAqRk3m+ACWYyOg==
X-YMail-OSG: 9ZVu2wQVM1lrBYi93GWa5TkFyvV4PsCVETFdJD7sll.YTA4vuhylWvY09Nk6T_Y
 wjwS00F3lxVzNRzyre51qPSctCZ1yCULGy1Z9Sdi697iQMG6PTKCp5.ANZ_cpaZAnQipKi7oO1no
 KJsNyl6zXsikSAihaCOQ40O2cAmMH2x6nFChnNhWbunyPZBnflZznmHGmLmI3Dr188gy2pjnwN.j
 0pYDIXackXTSL.JyVFm9JMPp9ZbEo_4t0MVfsvLmD18.J1s42ZWPkB_dC8jrLrLgqouQzLZ5MT7h
 e8TWDv97EpSWFGTGT7S3jLS_E8b1HjT5aMaNrhH4bzK0fQiNGcBbVHhx9u1KqKCwGWcNVZIxd_A4
 CVMToJ9Xxpr0FtayLunrgub4PjpkGS9Xo0vGgxmmfBCUog5tLU4o8GjnD.XzDXWDWx5h9iFG7XY2
 jEe93fKQqkviWanvYS57VoyFY3pFewsmfew0fAMfD9pAU73xj4NhXp6aSBpQ2EqnDMk8cJsv1PMR
 KKeo_OVkD5Rx31vHswxGxfc.FefTlyeHv2kMwQ5xqDW1xJoSFvlvb9Lo5v2BRiW6MrkGog2qLTRd
 IEsZiAfpRIcXiDHnX1fh441xZU3cD5hMKkd4a18B3FLrCmKaeXfbSMMe2iCgMc5GpxzylHb7A8Ca
 u_Yc.8qM6rK_n3X2BE24qlQQNoQmCNShplHPfWX.sU_HJl6E_gxpzdNT169IVesCtJLExD8Hynpu
 kWPUXWRaoqg.ioqCAret2ixL7CdaPzs38sVLQnbiwkpFf6l2iYvzaxgHcwj_XcdRxPEHFDENk.O5
 _nBDlxKinm10bkWjbCnQgZvZz7pCCp4WuFvBguT.fccRP266xqb3WKpX0KtZfHzL0e2nYO0e0MeB
 xjFGdXi.FHKmNdVaij28ny3P7P1I3Ok_Z0RSJdFoHQ_xyXwwC2MHBOqGIcDTZWD0oh_dAXf2GtJv
 Xg39yn5mfZIq3eIJ_JdNfa41QoBz9JH.W2W2zoD9n3zFXZXKzjC804_9HZyxaHQ9HB04zmo98hJy
 M2ZHSeq4hHoAIDq5lLcyunoDUwezwdSYLG8NkmzNdfYfDiOULKwI_PUyJpM1unEKNSl52b9.g2Ck
 ImPDMsSS2tdcsyytVg74W3Ty57vIHfKiEFRu7esFdvpvq9zCMkrPzhZSuQ3SgN_cErF3ZjqUh0oN
 W6rkClD93HBgvBFIqCrLYtvZcrbPX7W7_aowNmYnayfm02zTYfThLsxBi.ODKYjZ_nvoKUxu9BBu
 Nt90WLH9fK9H00caB28jBQbrB4JBJHyXuIE39oWwKkIQgyDCDEQaoy9djwPme0dQS1j8fD6pq_ou
 2zg2KQmYZnHfGgtrZqU6oxZIdkatuusvM9AlIiBeZ.ckqBwSX8OgTSrv1aFWKj.1WCL4MDV.heXh
 T9qrluIYqZyRqAlpu2ZkaLicEmYr84k7LX5O3cZJgOjn7E7vUXTj88MN4S1LBhhCH9ooV
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.bf2.yahoo.com with HTTP; Thu, 8 Oct 2020 13:06:02 +0000
Date:   Thu, 8 Oct 2020 13:05:57 +0000 (UTC)
From:   Miss Vina Omran Hussain <ms.vinaomran@gmail.com>
Reply-To: miss.vina24@gmail.com
Message-ID: <1515317925.398661.1602162357265@mail.yahoo.com>
Subject: Dearest
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1515317925.398661.1602162357265.ref@mail.yahoo.com>
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
live my normal with you.Please all communications should be through this em=
ail address for confidential purposes ( miss.vina24@gmail.com ).

I look forward to hearing from you soon.

Yours truly
Ms.Vina Omran Hussain Ibrahim .
miss.vina24@gmail.com
