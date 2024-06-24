Return-Path: <linux-clk+bounces-8539-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 976C59143EC
	for <lists+linux-clk@lfdr.de>; Mon, 24 Jun 2024 09:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EDB7281BBB
	for <lists+linux-clk@lfdr.de>; Mon, 24 Jun 2024 07:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D465C47F41;
	Mon, 24 Jun 2024 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M9Dzyolz"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAB2481C4
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 07:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719215702; cv=none; b=FNzDZqExclruVkbWDiu84/KebkFYoUg8kKo7EDQhOkW7fwWT303sq+UxY7rB1DAWE4D6KnpJz7DxYaS6ruwgh6rtvnx3opK/nnYpOfaWHD3ddLMstNpqm+Jp/1bjpjTE7TKzncKiZGgWNbWw78ASkct18oyNMx2nCkyoOrZr1Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719215702; c=relaxed/simple;
	bh=Qh9MDcKwCyw7Mbi/hRWrwIu3PlGij2ziUEdnM+Dsxec=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HJ9TNPwIvzDSSxzxyUM4MARWeVkgklXugWB7CisP55dcXhpOJ3jo1DBabXi4SCgewD3K9BJ139g03aVT6Hs/S/Pd+I6ZrodstMFMEr7JBh0Ib81+NpI6DSp8Qh1Rs1S2/NEQxB4WzDC4kSeG4urpRsxXcB8Z0MxnjKPC+nwUQxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M9Dzyolz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4217d808034so33374285e9.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 00:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719215699; x=1719820499; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TS9goykDVpDmGN1AqSF2YehuqmY4k81SgI4Za/Eo4xI=;
        b=M9Dzyolz1ok4Fsa5vGFLHSgdr0lsBkGsaGEp+RG11+7S3UHebM7+wYTWOOwY11Zg6N
         +Ms6Pzv+hlM/3DBAcR2S2zDPv2uoZ5DN5pjLedcgTiRgW7NzpbL4vto3wO2p2oSZhFuX
         QpzHtv1z7jwIynIjMjiZCcxvrsCEylpPyeVn/VbZSmD6+Im/IPeDoL+TIgUNpxRa53PK
         1z7kUMQkSTN6qZgeHPStfhaP+fWh2YHQuTQglQYA7rBAsShn260WWZaxBZH4VsIuAgTl
         cNXw3tlC2jv59bd9g0sLlw8jzrDQ42PyzLPHDIFlNWxeIDnQqjCO1cOZf8lChgx6D2Fu
         Q+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719215699; x=1719820499;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TS9goykDVpDmGN1AqSF2YehuqmY4k81SgI4Za/Eo4xI=;
        b=xOnZw45qYY0MZBm7Z5T2B5DojUOvWNJeGy8iHQJn6pouD44r0z0nshw1/ma5ZyxK4A
         JtD0+xeCreONit9h7D+YLeB5q9WGQE2HcIv1CNdvgxKbN6UikqX3E7w7kvs1DEGqaC9L
         lg0FgEjQm/GaV9Ej87pwvXMvnFSSAJ1DaCsPnm9YPWxzX4gVBNEWQSC3fuOOO8VjiV2O
         E+mWI9F3/6wlMWpj5lUBNwCCT05Qk4ZDupAXXpZ3SOt1EaWxnVE8rsZgS/hgZR+lY4YD
         XHpN1GJcEhZ5POGjZj5L9JzHQcspDEFI2mWF8Q6i+TAPf5vaQlrGLThTTr/Bcbtp3Lhz
         CMog==
X-Forwarded-Encrypted: i=1; AJvYcCWwpu4ChxAsVcUuMxaeuFK7QsSvFVO1yRELlaQJY/bBF1/hXOGui8PKk1tUnmWC3YaytnCDsiKh2Nr5kCOPrpDsQJb8pNQrAwe0
X-Gm-Message-State: AOJu0YyE4tLsgrseJRer5nZIWPeNMti75tLoLmt8wsDiiZ92+C0CfXS8
	0seX2hc9SZUiKOvZoOejoyuK0vKmWVdXvjSRJcsxvA9M3zAPlJqsRpgsudLEsRk=
X-Google-Smtp-Source: AGHT+IHC2Ujuq/ZCIG4kG2fhD2t0jCwNd1zVk1svp1kygq3tIeFIHGU6D3120PBJnDcNJlkBLJnskQ==
X-Received: by 2002:a05:600c:4f94:b0:424:90f4:309e with SMTP id 5b1f17b1804b1-42490f43132mr14515415e9.6.1719215698891;
        Mon, 24 Jun 2024 00:54:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf01:774b:55fd:ab74? ([2a01:e0a:982:cbb0:cf01:774b:55fd:ab74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424819224d9sm130305585e9.45.2024.06.24.00.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 00:54:58 -0700 (PDT)
Message-ID: <c59a50e1-5d06-4d8c-98ab-4a86c7b821de@linaro.org>
Date: Mon, 24 Jun 2024 09:54:57 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/5] clk: qcom: dispcc-sm8650: Park RCG's clk source at XO
 during disable
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
 <20240621-topic-sm8650-upstream-fix-dispcc-v1-1-7b297dd9fcc1@linaro.org>
 <7a5dd5a7-b9ad-4ae7-8267-8dc4c221fef2@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <7a5dd5a7-b9ad-4ae7-8267-8dc4c221fef2@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/06/2024 18:56, Taniya Das wrote:
> 
> 
> On 6/21/2024 7:31 PM, Neil Armstrong wrote:
>> The RCG's clk src has to be parked at XO while disabling as per the
>> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
>>
>> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/clk/qcom/dispcc-sm8650.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
>> index c9d2751f5cb8..31c82f791b44 100644
>> --- a/drivers/clk/qcom/dispcc-sm8650.c
>> +++ b/drivers/clk/qcom/dispcc-sm8650.c
>> @@ -339,7 +339,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx0_aux_clk_src = {
>>           .parent_data = disp_cc_parent_data_0,
>>           .num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>>           .flags = CLK_SET_RATE_PARENT,
>> -        .ops = &clk_rcg2_ops,
>> +        .ops = &clk_rcg2_shared_ops,
>>       },
>>   };
>> @@ -457,7 +457,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx2_aux_clk_src = {
>>           .parent_data = disp_cc_parent_data_0,
>>           .num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>>           .flags = CLK_SET_RATE_PARENT,
>> -        .ops = &clk_rcg2_ops,
>> +        .ops = &clk_rcg2_shared_ops,
>>       },
>>   };
>> @@ -516,7 +516,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx3_aux_clk_src = {
>>           .parent_data = disp_cc_parent_data_0,
>>           .num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>>           .flags = CLK_SET_RATE_PARENT,
>> -        .ops = &clk_rcg2_ops,
>> +        .ops = &clk_rcg2_shared_ops,
>>       },
>>   };
>> @@ -560,7 +560,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
>>           .parent_data = disp_cc_parent_data_5,
>>           .num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
>>           .flags = CLK_SET_RATE_PARENT,
>> -        .ops = &clk_rcg2_ops,
>> +        .ops = &clk_rcg2_shared_ops,
>>       },
>>   };
>> @@ -575,7 +575,7 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
>>           .parent_data = disp_cc_parent_data_5,
>>           .num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
>>           .flags = CLK_SET_RATE_PARENT,
>> -        .ops = &clk_rcg2_ops,
>> +        .ops = &clk_rcg2_shared_ops,
>>       },
>>   };
>> @@ -647,7 +647,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
>>           .parent_data = disp_cc_parent_data_0,
>>           .num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>>           .flags = CLK_SET_RATE_PARENT,
>> -        .ops = &clk_rcg2_ops,
>> +        .ops = &clk_rcg2_shared_ops,
>>       },
>>   };
>> @@ -667,7 +667,7 @@ static struct clk_rcg2 disp_cc_sleep_clk_src = {
>>           .parent_data = disp_cc_parent_data_9,
>>           .num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
>>           .flags = CLK_SET_RATE_PARENT,
>> -        .ops = &clk_rcg2_ops,
>> +        .ops = &clk_rcg2_shared_ops,
>>       },
> Technically not required for this RCG as the source is sleep clock.

Ack

>>   };
>> @@ -682,7 +682,7 @@ static struct clk_rcg2 disp_cc_xo_clk_src = {
>>           .parent_data = disp_cc_parent_data_0_ao,
>>           .num_parents = ARRAY_SIZE(disp_cc_parent_data_0_ao),
>>           .flags = CLK_SET_RATE_PARENT,
>> -        .ops = &clk_rcg2_ops,
>> +        .ops = &clk_rcg2_shared_ops,
>>       },
>>   };
> This RCG supports only XO frequency and can be ignored.

Ack,

Thx,
Neil

>>
> 


