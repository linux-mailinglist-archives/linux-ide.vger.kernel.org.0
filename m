Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2E2617F85
	for <lists+linux-ide@lfdr.de>; Wed,  8 May 2019 20:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfEHSIx (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 8 May 2019 14:08:53 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37216 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726544AbfEHSIw (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 8 May 2019 14:08:52 -0400
Received: by mail-pf1-f194.google.com with SMTP id g3so10891815pfi.4
        for <linux-ide@vger.kernel.org>; Wed, 08 May 2019 11:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SpJ2lO7Hf4iICB+8shwVOVK2JdSr+6WkoIZrngdYYfc=;
        b=bi42Ip2KB/9QJqCJ/YywdUnb+eotERAzeKeK3YLtu1ohUfov8nW+o0etGa5bqPh6hh
         Q1fQ+/yJFTaqIfh5FEOorb5R5m04I9qQ5cIUxLsjUUQmuOAop/HwItWzB1fS012irdy7
         6/ir2T2oTgy2IiwVOmYA90AlS3T3qHlIt5yYxTooqaSxFgPA4UAJKkQ3VSyxeRzNgFyF
         bYGAlJM2qpHImqCkCXgcEhj1E4M7kzi+tpyo3Dksp9C22I/m/qmZYu3cC/zVaZ729eZh
         1J9RWW/V6yruYJQPhnIOjnTHrglHdNoBHFL+qqrnUY2Yz9U6R4Ylpn9UzcL9qaALW0pK
         CNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SpJ2lO7Hf4iICB+8shwVOVK2JdSr+6WkoIZrngdYYfc=;
        b=IKIJDfuz1D9YvahBU2nV30hoW40c/4gM510tQuNjn/J7ozTAtDzKNOSQwpKKP6qc1q
         vLtYx4cqPjrJX9hTwUt4XYRcUAKTyRhTqFS+Xa5OmZCwXLiMoGJT6But9WMlic0sK92x
         PsFTssoQxx1mWKpG1yiQuUx83BN47h+vtsZo8tZju5Sj1IzTdlC9TqYTViSUNy5MzY2O
         8Enkg76ZiFQIumaE5AgnRf4erPuti5KNrriczJ+i+tv6rvyQJ2N1gtrzzF9XASl2K+9d
         Qe7q+FUo9aidqYv9jKC89ggxI3Lvh8xYDPEVr4aHV5pmMLhENeOqQFG1IybuqRfAsUWA
         X9aA==
X-Gm-Message-State: APjAAAUf1sLs4H7U9gIUZ9hBaPq64JvViGKO7mi1fLTlnaQ/s5YpjR4W
        u+GwqnP8tsi7Dxr8+A3ee4Ke8w==
X-Google-Smtp-Source: APXvYqyiWsv0c9g/811cwhhQ6P+9MZqtJz91kVqI15fyVl6DavQbYFkTph9ScT+pVpl9sjhjQLTzpA==
X-Received: by 2002:aa7:8ec6:: with SMTP id b6mr22796874pfr.234.1557338932043;
        Wed, 08 May 2019 11:08:52 -0700 (PDT)
Received: from [192.168.1.121] (66.29.164.166.static.utbb.net. [66.29.164.166])
        by smtp.gmail.com with ESMTPSA id 15sm21831988pfy.88.2019.05.08.11.08.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 11:08:50 -0700 (PDT)
Subject: Re: [PATCH] ide: officially deprecated the legacy IDE driver
To:     Christoph Hellwig <hch@lst.de>, davem@davemloft.net
Cc:     linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190508180140.12364-1-hch@lst.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <c0332901-27ac-7d8c-7bee-a1d7616627f8@kernel.dk>
Date:   Wed, 8 May 2019 12:08:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508180140.12364-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On 5/8/19 12:01 PM, Christoph Hellwig wrote:
> After a recent chat with Dave we agreed to try to finally kill off the
> legacy IDE code base.  Set a two year grace period in which we try
> to move everyone over.  There are a few pieces of hardware not
> supported by libata yet, but for many of them we aren't even sure
> if there are any users.  For those that have users we have usually
> found a volunteer to add libata support.

I fully support this.

Acked-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

