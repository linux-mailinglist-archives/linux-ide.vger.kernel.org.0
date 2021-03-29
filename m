Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D95F234D2BA
	for <lists+linux-ide@lfdr.de>; Mon, 29 Mar 2021 16:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbhC2Osq (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Mon, 29 Mar 2021 10:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbhC2OsQ (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Mon, 29 Mar 2021 10:48:16 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E068EC061574
        for <linux-ide@vger.kernel.org>; Mon, 29 Mar 2021 07:48:15 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 184so16219976ljf.9
        for <linux-ide@vger.kernel.org>; Mon, 29 Mar 2021 07:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=5/8kk4ox/5Tuoi5bHBW9bZqDcQioEYzA8lrAMJq3ltE=;
        b=JTN8X/faQRw3YkepKgtaO71mtAd/0EdYGRGq5hOXnqQ5XCR3z6WqWR7iPmZGkR5mf0
         LjAZLzYlZpjDtPnP+almADd/mJA+iEF1aigvkvWdk+fmgAv6+GO++gLpEcLarOImLvpk
         qGAH1OybwlPhsJe8I0jt0CUObOjIOS4Z6emfrUZOcrdEPMkt74mMZ+xJuY5U7vjWHCZY
         nd/oMq3yk8yyowbwlCComm9weSyBNUpI23Fprq4Ifm3Q/5tQK2ImAlfhzOB4x+LLEonf
         JcBiEnO3zfq5Ihu4k3zJPYsVJTbHoX9Vq7B1a2q7c+12MArJjfGivVVApqW2dgd7vDVe
         82uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=5/8kk4ox/5Tuoi5bHBW9bZqDcQioEYzA8lrAMJq3ltE=;
        b=eCcbbgI4+26U+9xlIbp5rgq3TQQeUNn6Gh9ddTegW+K+DDeYFkom3rhAC5TDHFAwle
         2xrD7GBFkwMCh5DZOyPcNZRMd24BSZGKJCjb7rudEFNdL5UjwJno18SafCeMkfcwR3Xs
         863zoswEXSxm3zkv2PHS8lxkFsURctf28Mo3uJ9mfd9mJ6wTYsG6WArMo1adleyqU41V
         qJjwoObXVPhq5hpXU8HyTGKCCl6sN0+c6qh6MlNzXffDHvLUwglVBeurOba9aMYCLjaA
         d3A4PNy7DZIOqtrMyWfTQ6SkO2vrVcbxbSwKiWhxVF5JtZMj1JB4idE/Bb8qy+gltF2G
         qjxg==
X-Gm-Message-State: AOAM5302kPSubfwKvSERD5xNYTFl33iQB5fqokca0vGKTro2bopGJrPf
        CYtFTLviEXwsvqWEmZVPgMzNYXgU5h/ia7mZTGyShpsWnw==
X-Google-Smtp-Source: ABdhPJx6iAHh1mEOzhOsF/P/noG5oMItFhG//7SclqQI+COCfydVD2EqAKgcGEeiy2mzVaxPSVvThOWVuVU5zvafa7U=
X-Received: by 2002:a2e:8283:: with SMTP id y3mr18112361ljg.422.1617029294498;
 Mon, 29 Mar 2021 07:48:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:924a:0:0:0:0:0 with HTTP; Mon, 29 Mar 2021 07:48:14
 -0700 (PDT)
Reply-To: sgtmanthey1@gmail.com
From:   kayla manthey <agbedarichard@gmail.com>
Date:   Mon, 29 Mar 2021 14:48:14 +0000
Message-ID: <CA+2Vjiu7ZyD624uWHJDyfENk8=OXimrbAYXAg2024Sjv0WORRw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Vennligst jeg vil vite om du har mine tidligere meldinger.
