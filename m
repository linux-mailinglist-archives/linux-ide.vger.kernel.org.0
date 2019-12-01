Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 105C510E2EF
	for <lists+linux-ide@lfdr.de>; Sun,  1 Dec 2019 19:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbfLASRY (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sun, 1 Dec 2019 13:17:24 -0500
Received: from mtax.cdmx.gob.mx ([187.141.35.197]:15919 "EHLO mtax.cdmx.gob.mx"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727312AbfLASRY (ORCPT <rfc822;linux-ide@vger.kernel.org>);
        Sun, 1 Dec 2019 13:17:24 -0500
X-Greylist: delayed 6460 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Dec 2019 13:17:23 EST
X-NAI-Header: Modified by McAfee Email Gateway (4500)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cdmx.gob.mx; s=72359050-3965-11E6-920A-0192F7A2F08E;
        t=1575217591; h=DKIM-Filter:X-Virus-Scanned:
         Content-Type:MIME-Version:Content-Transfer-Encoding:
         Content-Description:Subject:To:From:Date:Message-Id:
         X-AnalysisOut:X-AnalysisOut:X-AnalysisOut:
         X-AnalysisOut:X-AnalysisOut:X-SAAS-TrackingID:
         X-NAI-Spam-Flag:X-NAI-Spam-Threshold:X-NAI-Spam-Score:
         X-NAI-Spam-Rules:X-NAI-Spam-Version; bh=M
        8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs4
        8=; b=RxenI3z6o3k2qAKywt2Qv+DsedKPW5/PVdqJ3mlxEJrk
        RBeAabvNOgP2XP18jviVJ14wF9SzHqMOknLPBgiYsRYbg6ZGL6
        o3rdzoNjhHQCsxHKS/bjTm06d8PtdVsnZt1RTt4X+RwiycAYuI
        cZwVHspU8tFUYLb1CBCVa5pVb1o=
Received: from cdmx.gob.mx (correo.cdmx.gob.mx [10.250.108.150]) by mtax.cdmx.gob.mx with smtp
        (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
         id 217f_5ff5_7b928ed5_50eb_49ff_a2ec_0f7bedf8edde;
        Sun, 01 Dec 2019 10:26:30 -0600
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id AD5C31E2192;
        Sun,  1 Dec 2019 10:18:16 -0600 (CST)
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 04Fl1Faz5swS; Sun,  1 Dec 2019 10:18:16 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 439DF1E27AB;
        Sun,  1 Dec 2019 10:13:05 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.9.2 cdmx.gob.mx 439DF1E27AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cdmx.gob.mx;
        s=72359050-3965-11E6-920A-0192F7A2F08E; t=1575216785;
        bh=M8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs48=;
        h=Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:
         From:Date:Message-Id;
        b=iEUmqUogGpJbRvKsG2Ptc4/98wSA/EjGYuBoN8Icd34qjhSUHs/RhVHNqponGQCVi
         KcCB78RgsYTW1HSSXjP70ITD2jYA5kZNn37PMpyWsNF/qeNtdmJ+gok8VMmrSejvSX
         6hken3Qr02z5bGoeT7elmEfCDNi5pfyvo/XHjxjs=
X-Virus-Scanned: amavisd-new at cdmx.gob.mx
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id MPa_2GA6gllb; Sun,  1 Dec 2019 10:13:05 -0600 (CST)
Received: from [192.168.0.104] (unknown [188.125.168.160])
        by cdmx.gob.mx (Postfix) with ESMTPSA id EE1691E2F7D;
        Sun,  1 Dec 2019 10:04:24 -0600 (CST)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Congratulations
To:     Recipients <aac-styfe@cdmx.gob.mx>
From:   "Bishop Johnr" <aac-styfe@cdmx.gob.mx>
Date:   Sun, 01 Dec 2019 17:04:17 +0100
Message-Id: <20191201160424.EE1691E2F7D@cdmx.gob.mx>
X-AnalysisOut: [v=2.2 cv=R5pzIZZX c=1 sm=1 tr=0 p=6K-Ig8iNAUou4E5wYCEA:9 p]
X-AnalysisOut: [=zRI05YRXt28A:10 a=T6zFoIZ12MK39YzkfxrL7A==:117 a=9152RP8M]
X-AnalysisOut: [6GQqDhC/mI/QXQ==:17 a=8nJEP1OIZ-IA:10 a=pxVhFHJ0LMsA:10 a=]
X-AnalysisOut: [pGLkceISAAAA:8 a=wPNLvfGTeEIA:10 a=M8O0W8wq6qAA:10 a=Ygvjr]
X-AnalysisOut: [iKHvHXA2FhpO6d-:22]
X-SAAS-TrackingID: 5b9e3ed5.0.72334611.00-2347.121910817.s12p02m001.mxlogic.net
X-NAI-Spam-Flag: NO
X-NAI-Spam-Threshold: 3
X-NAI-Spam-Score: -5000
X-NAI-Spam-Rules: 1 Rules triggered
        WHITELISTED=-5000
X-NAI-Spam-Version: 2.3.0.9418 : core <6686> : inlines <7165> : streams
 <1840193> : uri <2949749>
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Money was donated to you by Mr and Mrs Allen and Violet Large, just contact=
 them with this email for more information =


EMail: allenandvioletlargeaward@gmail.com
