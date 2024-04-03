Return-Path: <linux-clk+bounces-5355-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB628896591
	for <lists+linux-clk@lfdr.de>; Wed,  3 Apr 2024 09:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8683E2847B4
	for <lists+linux-clk@lfdr.de>; Wed,  3 Apr 2024 07:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44CA25D48D;
	Wed,  3 Apr 2024 07:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J+mhxvgV"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D4D55E4C
	for <linux-clk@vger.kernel.org>; Wed,  3 Apr 2024 07:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712128163; cv=none; b=HPqtiuoZf/sre7vVUKiEmXtSQZzu/SmZ6T0OjtkMA6FQjJySJghIiHSFyNzjBDiE8+y0sbTlQMJ2C6byriMvnyeW9nCj4Rb1yTKmdrp8mqqdibrScXObYeequV7AysVFmxaZS49nbQ7ixnEHCT4Vke1ktxsGQjjW/CxNAKbg6Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712128163; c=relaxed/simple;
	bh=w8lYqOHfeCnx5dohRvnbfVZFUThxcvDdyzU7nBE59jI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oibku0M/Id2Gqpl+zt3K6ryz9nKeMJZ1pql+Ce3K8Wb/vwUIeHOaGYV9+c2CjUY0xcpyOoOQVSfPg/kjM+kd8jHMfLuskk7SU6ItjM6X3tXH/oDXtwR9psWuc0RApSzfzPxoJdjEyfZ1KeEVtnhRQEfWx3kDWBXNMz8B42DDgfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J+mhxvgV; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513d717269fso7152084e87.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Apr 2024 00:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712128159; x=1712732959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fYpb7gc5mEpIwDyiesaebegaIhLVavoAyYkXkWaJkd8=;
        b=J+mhxvgV798NfJSu4mpXLuTqMnZYtL8xQlS8peavd899vAeZCoQDurPTP1quA9L5rb
         B/5KLaRnWhcXj1cO/CySzKE2L99kNuvd5nFhbw1UnYreM+fltEClWLdwLh8IWA/zZwgK
         6hx08WWBciMJw23bPvDOr4Q5he7sTDzbB8NpANRxlyCfugtix00C271uPjAwOxeQvOgO
         GQNYZw07dCn54MvnyU1egXXSlrbTFkeuZ/V1VKspxst5QzMbppBrX7fSNOkLqKkG35FM
         GdVPVEhsXsOBU1XL6UWBWFaZ5jCbezgbFI31ZeSki893OimLURRxzhMR9VueU0FvIzay
         AMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712128159; x=1712732959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYpb7gc5mEpIwDyiesaebegaIhLVavoAyYkXkWaJkd8=;
        b=IuwR8/8yMbUFbeUxCsnTXRU820UCjY2c1qhPJPXi2GWonic1RxxM4tVnZY84fYFAU1
         9ckcZ9hRxO3ok16SG9D3XZY+vEbvw5ARlkUhbyGoY+FV2ZOi20gBWDjhT4gsMmYnqWYb
         ioGJU9YnpeV1lLhAKLAPUOZ8VJiDk2FV2q46mjfCuMDFQgr03RlV1PbGws8PV+ly6pt4
         eyhnz6vppz3Oow+4QskYP+RWV5sR+LLZpQAYGE6HkeW5KjHanvM10H+VG2hI3UBKq18A
         QP4Jk4fE+DDzGL/2TxBky/roqcbJ+J1xBFo2NmqIbk3L3HSAAoufsdqeFJoqu9atu5u6
         pB2A==
X-Forwarded-Encrypted: i=1; AJvYcCVBSWDbI4uCluYCQWAGyhv5ixbwV/OqJmmFx/a64EHQ81IYr+zHRfVri2KaJlCnf6YbnHj9xVnbDUqx7gzkbdyPYdCA/0a9SsYx
X-Gm-Message-State: AOJu0Yx8cM6PTaBOym22+Ge4tBP7IZAsGw049py8mDWNd5n77b4p5bGj
	Bj2XuhXxHJ75YSZ0J2juIO7M9CyFEzWC+0wNcU4MKOn0OGTVEs98gOZFk6fZp5I=
X-Google-Smtp-Source: AGHT+IGGM6CQsdZ/zpAkCWsQwBnDwuHSf+3IyMRVPph3ekNhTZzXuzT/k/YugeG5SWY4hrWXeLQtRw==
X-Received: by 2002:ac2:58f2:0:b0:513:3d26:7cc6 with SMTP id v18-20020ac258f2000000b005133d267cc6mr8383432lfo.15.1712128158365;
        Wed, 03 Apr 2024 00:09:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id wy11-20020a170906fe0b00b00a4e4a3e69acsm5069973ejb.71.2024.04.03.00.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 00:09:17 -0700 (PDT)
Message-ID: <1a6fccd3-452c-423f-b73e-cef5f9d01633@linaro.org>
Date: Wed, 3 Apr 2024 09:09:15 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] dt-bindings: interconnect: Add Qualcomm IPQ9574
 support
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 djakov@kernel.org, dmitry.baryshkov@linaro.org, quic_anusha@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20240402103406.3638821-1-quic_varada@quicinc.com>
 <20240402103406.3638821-2-quic_varada@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240402103406.3638821-2-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2024 12:34, Varadarajan Narayanan wrote:
> +#define ICC_NSSNOC_NSSCC	10
> +#define ICC_NSSNOC_SNOC_0	11
> +#define ICC_NSSNOC_SNOC_1	12
> +#define ICC_NSSNOC_PCNOC_1	13
> +#define ICC_NSSNOC_QOSGEN_REF	14
> +#define ICC_NSSNOC_TIMEOUT_REF	15
> +#define ICC_NSSNOC_XO_DCD	16
> +#define ICC_NSSNOC_ATB		17
> +#define ICC_MEM_NOC_NSSNOC	18
> +#define ICC_NSSNOC_MEMNOC	19
> +#define ICC_NSSNOC_MEM_NOC_1	20
> +
> +#define ICC_NSSNOC_PPE		0
> +#define ICC_NSSNOC_PPE_CFG	1
> +#define ICC_NSSNOC_NSS_CSR	2
> +#define ICC_NSSNOC_IMEM_QSB	3
> +#define ICC_NSSNOC_IMEM_AHB	4
> +
> +#define MASTER(x)	((ICC_ ## x) * 2)
> +#define SLAVE(x)	(MASTER(x) + 1)

You already received comment to make your bindings consistent with other
Qualcomm bindings. Now you repeat the same mistake.

No, that is neither consistent nor greppble.


Best regards,
Krzysztof


