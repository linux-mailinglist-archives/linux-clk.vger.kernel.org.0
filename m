Return-Path: <linux-clk+bounces-5715-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E26689FCCA
	for <lists+linux-clk@lfdr.de>; Wed, 10 Apr 2024 18:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06CB41F22780
	for <lists+linux-clk@lfdr.de>; Wed, 10 Apr 2024 16:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3078F17A922;
	Wed, 10 Apr 2024 16:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ItZiX76g"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CA1176FB8
	for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 16:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712766423; cv=none; b=AJCF//iC/mcK0CfPHvul3z+OADSelJDt91jwEcRTMU95Id7OZYaEDC1QlviAWli1ZL9/LIj8FOcBxRKoHKWqlV+Ae0Tora/kK0+Q042WjUMMIxIBbQaPEqpXoh9lYgke0hCqeRpK1FLmDiIPZxA3LseprPMrMRZOfkb3R5tev7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712766423; c=relaxed/simple;
	bh=e/GEkf8P0wYBm5uig9U0DNz2a6t7yeVNyXGJwgHgSm4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IKv5TtqArRo6pg33vCJ1ScgZz8RYpA0zL7CsmIrt3Z44IVNdM5fA7RlWbj4YbV4xNm+HUJgz4V5zTDZsOYeN+BDNT3rkXI8wzeJmu6LQNsGF4XssFepD3DvPeZBm7I4RMK6hrhYoCoEulHZXxnurl+P+9T+bzJNuSTrrWmegfZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ItZiX76g; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-343f62d8124so3639411f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 09:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712766420; x=1713371220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxVQh9SSU/d8FDSoMYuLyU8JV5z5DA+pxMW1PQ1kSMc=;
        b=ItZiX76gwklJE9GnpuQz8o5CVL4ijJAmQ5TlfiZrkD9hyfXtVUdKkSAt1q3PdXsxl+
         rVCah2fVODqed5WPnno1XEgpZlUyxuJtkls6Bu6DR7lkojtwePHuN3YtXI6JoSizR2fZ
         zXRV+WuPNzi6/IYYF4rMJPL2HFM0Z3tZuVApxobEf4Tur5thpJY+NZvJIldlWY5Xujk7
         FsJNWh62hotvGD8I9D3wsJFjtQgl15hGHqRBbl6jXk9YNrCDG4yh2yZ5YwC0WHrL2ZMg
         0LIOvkQBVzk970XAqAJXTUkADpQKjrZvcsj9OsTUOgcgFoh4RdgLQ5jB5UhkimaLjJKl
         2CGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712766420; x=1713371220;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lxVQh9SSU/d8FDSoMYuLyU8JV5z5DA+pxMW1PQ1kSMc=;
        b=lESHkmmOG3aNSbXU8aM0nifZiz0wPdHei7in+sN1Ih8MS6ePhBoXonOSmRQ90Re5zd
         H5iBbbyh33hQ2vrrsuhUfGFzSDK1NQjhbwGKxaE1i8jnbIlpDaeA86EJchZkg2yoQceL
         LNUOOU3TuabflDvclGBfR8bSjhZzoymiViM5RtQla6VYer07V/x5ToVj9at5SySNsIYc
         CWIp6uIV9TEvwYPv0pTrZOJc3w9ORkHN/BFjl0YzS9mPKXTKT9mIxdDno0bYxGYpCeTy
         59Bmi2ha5WdOnzlbgc8zc/UP7n/929yWONOUj86bnXL3B3jDjxdmr7u8WX6BY1MB64ol
         Bvwg==
X-Forwarded-Encrypted: i=1; AJvYcCUTcL2gkgoc7653Dy/Fqmjdr7iBPK7R54Ezjrw+Y6hgJT4Pzr4naDYGb6cVZCJC0ccIAYIls7HbSiTvzsTQNqzGIqweyknZIxEy
X-Gm-Message-State: AOJu0YzB4pp2SEowAWPwmaJax2D4vQ+bD6yjHvZWela+WkVwk31pVZRY
	DRhmE4KphBnkCuQD+ZoWgFGvHFZVmJI1yu2A9zMMQ4ctJsyf+9UzVjMEGKvW6uE=
X-Google-Smtp-Source: AGHT+IHZFc/6pVRJCyCR14e1nWlCRAHaazj0LCJPd45I2qCAAvypTz4MNRFZ/Iepmeg8s6A9JnS5xg==
X-Received: by 2002:a5d:4e52:0:b0:341:ab37:6a25 with SMTP id r18-20020a5d4e52000000b00341ab376a25mr1992881wrt.43.1712766419581;
        Wed, 10 Apr 2024 09:26:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:760d:c2fa:a66b:fed3? ([2a01:e0a:982:cbb0:760d:c2fa:a66b:fed3])
        by smtp.gmail.com with ESMTPSA id dx18-20020a0560000e1200b00343d840b3f8sm14039138wrb.33.2024.04.10.09.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 09:26:59 -0700 (PDT)
Message-ID: <068ea75e-9c8a-45b7-8472-995a462c6c55@linaro.org>
Date: Wed, 10 Apr 2024 18:26:57 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/4] clk: qcom: dispcc-sm8550: fix DisplayPort clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240408-dispcc-dp-clocks-v1-0-f9e44902c28d@linaro.org>
 <20240408-dispcc-dp-clocks-v1-3-f9e44902c28d@linaro.org>
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
In-Reply-To: <20240408-dispcc-dp-clocks-v1-3-f9e44902c28d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2024 13:47, Dmitry Baryshkov wrote:
> On SM8550 DisplayPort link clocks use frequency tables inherited from
> the vendor kernel, it is not applicable in the upstream kernel. Drop
> frequency tables and use clk_byte2_ops for those clocks.
> 
> Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sm8550.c | 20 ++++----------------
>   1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
> index 3672c73ac11c..38ecea805503 100644
> --- a/drivers/clk/qcom/dispcc-sm8550.c
> +++ b/drivers/clk/qcom/dispcc-sm8550.c
> @@ -345,26 +345,17 @@ static struct clk_rcg2 disp_cc_mdss_dptx0_aux_clk_src = {
>   	},
>   };
>   
> -static const struct freq_tbl ftbl_disp_cc_mdss_dptx0_link_clk_src[] = {
> -	F(162000, P_DP0_PHY_PLL_LINK_CLK, 1, 0, 0),
> -	F(270000, P_DP0_PHY_PLL_LINK_CLK, 1, 0, 0),
> -	F(540000, P_DP0_PHY_PLL_LINK_CLK, 1, 0, 0),
> -	F(810000, P_DP0_PHY_PLL_LINK_CLK, 1, 0, 0),
> -	{ }
> -};
> -
>   static struct clk_rcg2 disp_cc_mdss_dptx0_link_clk_src = {
>   	.cmd_rcgr = 0x8170,
>   	.mnd_width = 0,
>   	.hid_width = 5,
>   	.parent_map = disp_cc_parent_map_7,
> -	.freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
>   	.clkr.hw.init = &(struct clk_init_data) {
>   		.name = "disp_cc_mdss_dptx0_link_clk_src",
>   		.parent_data = disp_cc_parent_data_7,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_7),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_byte2_ops,
>   	},
>   };
>   
> @@ -418,13 +409,12 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_link_clk_src = {
>   	.mnd_width = 0,
>   	.hid_width = 5,
>   	.parent_map = disp_cc_parent_map_3,
> -	.freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
>   	.clkr.hw.init = &(struct clk_init_data) {
>   		.name = "disp_cc_mdss_dptx1_link_clk_src",
>   		.parent_data = disp_cc_parent_data_3,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_byte2_ops,
>   	},
>   };
>   
> @@ -478,13 +468,12 @@ static struct clk_rcg2 disp_cc_mdss_dptx2_link_clk_src = {
>   	.mnd_width = 0,
>   	.hid_width = 5,
>   	.parent_map = disp_cc_parent_map_3,
> -	.freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
>   	.clkr.hw.init = &(struct clk_init_data) {
>   		.name = "disp_cc_mdss_dptx2_link_clk_src",
>   		.parent_data = disp_cc_parent_data_3,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_byte2_ops,
>   	},
>   };
>   
> @@ -538,13 +527,12 @@ static struct clk_rcg2 disp_cc_mdss_dptx3_link_clk_src = {
>   	.mnd_width = 0,
>   	.hid_width = 5,
>   	.parent_map = disp_cc_parent_map_3,
> -	.freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
>   	.clkr.hw.init = &(struct clk_init_data) {
>   		.name = "disp_cc_mdss_dptx3_link_clk_src",
>   		.parent_data = disp_cc_parent_data_3,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_byte2_ops,
>   	},
>   };
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK

Fixes the:
[   25.428008] msm-dp-display ae90000.displayport-controller: _opp_config_clk_single: failed to set clock rate: -22

Thanks !

Neil

