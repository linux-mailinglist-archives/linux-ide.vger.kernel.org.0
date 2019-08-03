Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF4D8087E
	for <lists+linux-ide@lfdr.de>; Sun,  4 Aug 2019 00:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728817AbfHCWCv (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 3 Aug 2019 18:02:51 -0400
Received: from sonic316-21.consmr.mail.ne1.yahoo.com ([66.163.187.147]:41254
        "EHLO sonic316-21.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728033AbfHCWCv (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 3 Aug 2019 18:02:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1564869769; bh=ex6GOWezVctaT/1XLEMn1P2aiTuWa+R1B5VnNmRQpvw=; h=Date:From:Reply-To:Subject:From:Subject; b=rHajBgVlxBwWFTqLwGZGcThlUDsN780bbPWW+frpvrtFZstZn5COv0ThrWggAY/1uDiMA+z98Vlt+rGAYeUl8DCaGte9ABAHuJML82+RwRauXCDfhVPd24qKOKOQTVPfGicsjkKbYlg1bSkYL7Ag684s2wr/x8kWiadIUxB8Eos9CpymNs50Y9Om+Ogj0EJMX3X4RPAsat81huDDTFyCeekyznL6MxiOx+19BQAR5d4vkk4nYnvQvCKNuvjszi1yG1qGxiLKCfYOdiZx07Vlt6F7rLEz5VrPK7pMKw3/HcumGDIpxEI4QCHJ/qRcdUVsmNZDoVk5uETpFUcFk7zUzg==
X-YMail-OSG: rF8BxBoVM1kNnr.Kqld_vJ4DuisSSG2Vms_L28ya0oGbLh24BMx_tQl.pP9My9N
 i_VTrV56zXQLJp7Qde6FQJEeqTPtoIfWggeimXJtWkS7QyTdwX_oxz3Fn2On35ShhfPUbs2sxnHm
 RLgHYVSrTC_0rgQouIr5Ck7WTExajTzEMT4ubK1ahDxx3O0E4uLhODQhJUZrsYA2EPmRdyMY_oIU
 q6p8_zYbO7i68YP4MP8fbVNHoEsq.lEIaZXt4S.LeAgYt0I07j3eN3_FCSCgVNWRRtW0HuIGEuj7
 TneAKu.apr_h5CHR_Ha_IvAGYAkLVOy36y8NaZJKgjEoZ4h5fuMFPZtgGaFpKB4yijSLFEdy2UMn
 3hu5RYzh_wOk8Usiv0pEGdqiN84S_HPb8AbxqZbVmtNwqsWJnfFXNsJoo0WRD.PhrKqDyYGPNfPe
 3Lsc7DkJ8XMm2DvHC4TKEm8WlhOPbOO4lTvqvv7ki_xZ6B6YSO6BBe3AH90RhZQwKDTs8Afu1RVV
 PZzDrCFWUd54J1pxZ9yafdxLExKkGYKnJJWmALwWQJlptFdcNp409aaoSnrB0CcZ9ya0Xo5sbbqk
 RWVVwBL.Cm7NrcwZ20e_KTZLErq0hd70LxE11aTFsnRwzdpbz4f3hdc8aRsNfiECm1BWLUJcUW7l
 exoKiyRYI7ue5lzqcQlJCNAo_zeYJGzPDoQUDlNaOMdQ0dduM6ziQ2l11V.Z_6d_GFOcQU7_AhoM
 YVc5yF0MmaHD1G9QBxCmGkYapX19JVRkJ.dApJFnDJSvoAJdg025nIr1UzYdqxwzFPZdf0zgdW_c
 j1afLiWtejm5IoulNHuhAygFFcggCngtkU9_WHDcxHKFXadd_LTdTZkc6NwxbhVNcyIu5pmCO2j6
 64nytkvAndMjFKT1kL62mPbQE8Fdvq.vlABrZ_CdApfxqbC_BvziFQ0_6aLdqYtzU6KX9G2p21yO
 4i.8MOTijrBI9ERDK7B.lB7EPORcTnqmmB2BTNtsTshSPlxgnigc5zEu.qy_r7IGlZceARlUJ6dR
 A.d3OLBtQIVB95xnkmWAXgK6Zpm84lQCVfB8VCtbWmA363MQJqVPM5.ku8e.Io_hGQuKyB6JYGKj
 nRtmuGAursW9FZgtt2NrAuAEmrA0MD2kHvdBMR4mG4Z0WppjvXVN4RVuAy1aEIn2aSNJTZSjaI_L
 XPwST_a008Mm0n700hfEfW5WLmKL0eztrfpeOtt76XCh0hjnCfGQzNOkA3_qDSdw-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.ne1.yahoo.com with HTTP; Sat, 3 Aug 2019 22:02:49 +0000
Date:   Sat, 3 Aug 2019 22:02:46 +0000 (UTC)
From:   James Berger <jamesbergner398@gmail.com>
Reply-To: jamesbergner398@gmail.com
Message-ID: <972244226.692978.1564869766968@mail.yahoo.com>
Subject: My sincere Greetings
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org


I am James Berger,

I'm 49 years old, from the united states but I am currently in Syria for peace keeping mission. I am the commanding officer of the third Battalion soldier regime.

Please forgive my manners am not good when it comes to Internet because that is not really my field I actually connected with you from LinkedIn. Here in Syria we are not allowed to go out that makes it very bored for me so I just think I need a friend to talk to outside to keep me going. I would love to get to know the "real" you as a friend.

Respectfully,

James Berger
