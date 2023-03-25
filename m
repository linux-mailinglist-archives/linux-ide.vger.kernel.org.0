Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4628D6C8E89
	for <lists+linux-ide@lfdr.de>; Sat, 25 Mar 2023 14:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbjCYNba (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Sat, 25 Mar 2023 09:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbjCYNb3 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Sat, 25 Mar 2023 09:31:29 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD0E1164E
        for <linux-ide@vger.kernel.org>; Sat, 25 Mar 2023 06:31:28 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id f5-20020a4ad805000000b005399cfd276bso693945oov.6
        for <linux-ide@vger.kernel.org>; Sat, 25 Mar 2023 06:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=salesforce-data-com.20210112.gappssmtp.com; s=20210112; t=1679751087;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wiMO8UZ0+pta0GDPVyxAsdnF8tCIEhzYVyAx+cWEZSU=;
        b=Ai0/YL3uPcgGD3jvE8N+rRUrXANm7Z7OsHwBiF7FiMG9och5VUE267R1SRmTAb3r8E
         P+tCKYj9cQcZPQIBQQDeaUD3+UR2kKAw7FcORl3DJSuewzuN2axvK9tpLsO6BPn9i+NS
         5zWLoNoMb4lLQxkUC10KRAPnczMIVksLxy5uWZUpsE8IJIXIhEPeuq1r719tXd4UlXid
         zeQGw1UCeVerH3jv+icjYd7BD0hloQe2+5/AnJfY2xTO70dqkFWHHmaGxbd4cskxaSnd
         r8tiWtQY+eebu7SxFQpSZgybGwp3a9aUBntH8PLYkoUizSCDe3bZRmqxE8FDsWh3BSBp
         y9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679751087;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wiMO8UZ0+pta0GDPVyxAsdnF8tCIEhzYVyAx+cWEZSU=;
        b=FYxnA56ktQPE5EaODf0tYgEF9Pt0hsaSP43HYcbqgXT1+T/XXMXcUhmoiR7h2BAXxn
         4K7jMSWcLtqU5AyldEc3k1Ln7WSA66edIWryiGSP0ghOG6QFCP1s8hntDST1LeacwLTT
         yGIwHKEibU3RV+gnvzt1fpCbXvM2TRIpJMGIf9PM1F/5lNcjcHeI4//ZDeHhpqoTp3k0
         3C3mMTXFK7tZbMHxWup+nGh1AMP4xP0OmQgMDmkZi47kyqljqJBMF3004GmojQ3S+GBm
         xOqTNrrg/DTDIKTF1w/uQ2Glv/y2lYV7xYSVzoUAexO3J4lR1XyXZAVPDFhgwiDY2of8
         pLAw==
X-Gm-Message-State: AO0yUKWWkdENpsD1mCX6U4GRiQp0p5oKE4toXwXR7UZ2NnjyN7HlaVw3
        pw4idJggJJU/8p3fz7JBxwn3A5C5n3mtvjRnr7fJ+w==
X-Google-Smtp-Source: AK7set+v0YVMM4uF3j3pAzF85SIIHyEzgZucnvYddLd47LPFHbwB/JCUhblRb+SlMFI1bYNA+a8Q8DIEGZ7/JqCWwpo=
X-Received: by 2002:a4a:e243:0:b0:525:5f43:215a with SMTP id
 c3-20020a4ae243000000b005255f43215amr4145265oot.1.1679751087563; Sat, 25 Mar
 2023 06:31:27 -0700 (PDT)
MIME-Version: 1.0
From:   Paula Henderson <paula@salesforce-data.com>
Date:   Sat, 25 Mar 2023 19:01:16 +0530
Message-ID: <CAF7sO0bmPoGgTputR+s-+FxC5+bG-_TZTFMbmDcD+RWuAxWvOQ@mail.gmail.com>
Subject: RE:BIO International Convention Attendees Email List-2023
To:     Paula Henderson <paula@salesforce-data.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        FILL_THIS_FORM,FILL_THIS_FORM_LONG,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi,

Would you be interested in acquiring BIO International Convention
Attendees Email List 2023?

List Includes: Company Name, First Name, Last Name, Full Name, Contact
Job Title, Verified Email Address, Website URL, Mailing address, Phone
number, Industry and many more=E2=80=A6

Number of Contacts :18,632
Cost : $ 1,764

If you=E2=80=99re interested please let me know I will assist you with furt=
her details.

Kind Regards,
Paula Henderson
Marketing Coordinators
