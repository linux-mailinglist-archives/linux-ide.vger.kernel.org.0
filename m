Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5092FB3CD
	for <lists+linux-ide@lfdr.de>; Tue, 19 Jan 2021 09:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbhASINH (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 19 Jan 2021 03:13:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731808AbhASIMb (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 19 Jan 2021 03:12:31 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A759C061574
        for <linux-ide@vger.kernel.org>; Tue, 19 Jan 2021 00:11:48 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id i63so15633591wma.4
        for <linux-ide@vger.kernel.org>; Tue, 19 Jan 2021 00:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=CseN3BiBpJYn6k+hUUx2TxuA3gS6VM1QHXLDLxQNUzc=;
        b=O1PPH4nqCalT6VEZN9yDr3VU64f0BnZXNVwAGRvrkC3v8YNR2p3veTD2ru0lR8noCB
         olK8/TReyNLmuD0DJmkoZiutTDl7dtHZXteRWjuFesZMWb3SXPCpipcLy42xeBlvamt7
         vb7XfZ5BWxomQb4Ariu2RgoveCvWVTLmx+61pXkldLjlsQV5yJdxWvREHDWfYtJs3chX
         Vpj4csmlObt41UaziVCFaUoCIPkFLotpDsz29LWRKNENp71nu7UGiSWy0QO9cisTI5jV
         4AdM0MOSgqGYHD25etDoT0BqGenVUKh0hWfaGDB9Q2lUbF91n8fcWgDyRVf9oHRma1uy
         OSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=CseN3BiBpJYn6k+hUUx2TxuA3gS6VM1QHXLDLxQNUzc=;
        b=aK+NfZn7UwRA1CEM3FMXZ5Ahexv8EynNJrhVMHrmv8kkrmkRiAEgJVqpvqd/g4To1a
         moESAarAd8cjEazOJ/cPE/XWXO076O1s5E9tLe4UWjQyf4wP1mxpGNnXlbeI5n+qml5z
         qxXefxbs9AsoCe+XMMn39R5RNXzqJjQUK9MgfT+RbKOkZYfrJhYk3P0xYZTrwrJ5tEMS
         9oDM0kheGqpD4ZQKVB4ITsuVHaTC057POGcsM9BAx9sl5KR7vZbuUpqIPgTpxPuoI7jN
         G95CR1clQVUxcvg9UJroOXtzDpfI6+d9zKaPNiEi+5HeIbUDq4XmjDKqbqwFjsp6ij9+
         1Gaw==
X-Gm-Message-State: AOAM532J2kDPOStHEkBCYJ3iZKAGl0tz878NWE/Wn4ldsdKgLdXxXIsz
        mlJTY5bjAudppaLy6olgNGsPssz2Uv/UMlL3jmM=
X-Google-Smtp-Source: ABdhPJw3S0D3SEpyH3gxjGC4qdLfXqr7KKaMflOCrIs/nKq2UQPa9BD9vz8JcddTfoOi+c5AtZGsSkXzgU2hB8E0Hnc=
X-Received: by 2002:a1c:2e8b:: with SMTP id u133mr2843613wmu.189.1611043906741;
 Tue, 19 Jan 2021 00:11:46 -0800 (PST)
MIME-Version: 1.0
Reply-To: paulwagne7@gmail.com
Sender: avionprecision1@gmail.com
Received: by 2002:adf:f10a:0:0:0:0:0 with HTTP; Tue, 19 Jan 2021 00:11:46
 -0800 (PST)
From:   Paul Wagner <pw9076424@gmail.com>
Date:   Tue, 19 Jan 2021 09:11:46 +0100
X-Google-Sender-Auth: W5_1QmhG0NxBOLVXkXSyjZxfUmE
Message-ID: <CAABQx0Z5v-Xv=rjW2tSCXqrfjvT1+sVjHEe3RRsYbuY9vfCjow@mail.gmail.com>
Subject: =?UTF-8?B?U2Now7ZuZW4gVGFn?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hallo,

Mein Name ist Paul Wagner, ein Familienanwalt des verstorbenen Herrn
Thomas. Ich habe einen Vorschlag f=C3=BCr Sie bez=C3=BCglich meines verstor=
benen
Mandanten Thomas . Bitte schreiben Sie mir f=C3=BCr weitere Einzelheiten
zur=C3=BCck.

Gr=C3=BC=C3=9Fe
Paul Wagner
