Return-Path: <linux-ide+bounces-1029-lists+linux-ide=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BE1894B97
	for <lists+linux-ide@lfdr.de>; Tue,  2 Apr 2024 08:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94F9F281014
	for <lists+linux-ide@lfdr.de>; Tue,  2 Apr 2024 06:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF8F29428;
	Tue,  2 Apr 2024 06:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wsK8rH4a"
X-Original-To: linux-ide@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AADB374C2
	for <linux-ide@vger.kernel.org>; Tue,  2 Apr 2024 06:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712040089; cv=none; b=nBuPnRfGyUybIik6fJRIIw4DxcrlYSsIu6/d73bAz8/th5M9IqSX+SXrgJlI373mreWxI38PuSgXS8qCqW54HjU9CWmQT/EdVLXObJgGt+CHcgQ1Usg/IqRpD13ti7wK5SGHVA0MOBe/5Y8sCTm2ThuVFt+M+30F3P8qs1UjAmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712040089; c=relaxed/simple;
	bh=rqkYmlS/fobw/BjmhGIYOI1pI4kkCCPtF6Jj1xdbP+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMY9vSVf+30chFfjDYzEv/ElWX83gVu8XZ2t9kXiuBnvpuyGVAsk5d+ouoZR99d8N/ZIZhaRLRfQvHo+Ioe1ICuaXeIncB4opzdEAVhegfJh0NIuVnp/9bQ0SvxncJIxcjlOi8x3oefSD4sVfnbCVp+XMs1B5vQ5OMnrrw/50e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wsK8rH4a; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a47385a4379so1025846166b.0
        for <linux-ide@vger.kernel.org>; Mon, 01 Apr 2024 23:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712040087; x=1712644887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M6MYOLu0dQXzynu7Qavm8GI0WGja0ccSZYBAOwxiA2E=;
        b=wsK8rH4aOdoRTVkWwqzut1oAJp5rgaSVaYXesP1aZJNCbTCy4fZJUxiURMrsXqj6dG
         GXqy0SUQATa2ukRfpROcxJG/uKFpU72tpBabHB/TMl4AFBTYo0Lq+l6zD6MLvfgLXS6x
         N2MH047tI/3iDEX5Fh7OkmwLUyGhjInKPYyigNyhggY9u08ApvDN6FZdL7DN5peX8ak4
         otJW0FYcMXRVXKKPVMfKAwPLwAqIyg+Mu6t6Zr9y+XHKtkPBD+xLkD0eDoSkTkafQhj1
         YH/b7y5LDbMIZyX8r03JLyj7/lcP4bwSYVFV4BUneQ4/c2ClOd7GvGUBCMGlYR2Vd/qV
         9Ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712040087; x=1712644887;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6MYOLu0dQXzynu7Qavm8GI0WGja0ccSZYBAOwxiA2E=;
        b=T4e/oHKozacrfx75RPAfRPN4ayOngSS23y1/Q+U/w3Px6PAWu/BBV2vNcMeVjYji1Q
         KrmKRXYv+pxI5wSTs4a1mMD+Cvf98cpXuM9+V/TtCeRpxg/bQEeAlzIIZwQJc6r4HCrE
         7od1+KT7EeIlHPvMw5gqzjdY8EhDLXTOf+HbWfCMbx4/pw0oMuCieUgKlZxSGa9MicBh
         OHfr0l+PD5DhmVeAv1LGB2tTjnRxgVwZcUlu6M/6cS8boGnNO1N0Jc57QtX8wzraMPkF
         qQ1T4807E+f1mpOgRCNXEp1Y6FyeuWjDSlyfv2BQAsksCzfk2vJlPyd2WXz1ZrAdJIWB
         kuUw==
X-Forwarded-Encrypted: i=1; AJvYcCU0rU9S8q/ZDwtFQaZaMbY6IgGRIbEEAKl9a9PCbyCvz14hJHKLbVKxIAKR8EIAppanSc5n5Ffd+TrzPcCInqWLPFu0ReTwRu6F
X-Gm-Message-State: AOJu0Yzoh6Ev4XnnGaqovOWPU8l79tE4jomEVJ1krcC2D0Ks5YS1R+IB
	S+HD40zARJ7cIvK30tLksrOTSRFQ39n0ZGUKMdtteC4LnF30jO5Lhf6j6PeRU+o=
X-Google-Smtp-Source: AGHT+IEl7KirbEeP5BzgOWhZZZ9UD+N47QfmbuB4Y/zHN9zqs8OGoPUmyzJLrGmtF/k5nKZDN5VAKg==
X-Received: by 2002:a17:906:2bd0:b0:a4a:3861:d63f with SMTP id n16-20020a1709062bd000b00a4a3861d63fmr9270763ejg.21.1712040086689;
        Mon, 01 Apr 2024 23:41:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id kg26-20020a17090776fa00b00a449026672esm6118298ejc.81.2024.04.01.23.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Apr 2024 23:41:26 -0700 (PDT)
Message-ID: <971be9ec-44a2-48cb-8d67-a4d4ce3b7d46@linaro.org>
Date: Tue, 2 Apr 2024 08:41:23 +0200
Precedence: bulk
X-Mailing-List: linux-ide@vger.kernel.org
List-Id: <linux-ide.vger.kernel.org>
List-Subscribe: <mailto:linux-ide+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ide+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: ata: ahci-da850: Convert to dtschema
To: Damien Le Moal <dlemoal@kernel.org>,
 Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-ide@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240327064354.17384-1-animeshagarwal28@gmail.com>
 <d5429736-8305-4afe-89a8-fe62907616e1@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <d5429736-8305-4afe-89a8-fe62907616e1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2024 01:40, Damien Le Moal wrote:
> On 3/27/24 15:43, Animesh Agarwal wrote:
>> Convert the ahci-da850 bindings to DT schema.
>>
>> Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
> 
> Krzysztof, Rob,
> 
> Are you OK with this patch ?

You got Conor's review, who is DT maintainer.

Best regards,
Krzysztof


