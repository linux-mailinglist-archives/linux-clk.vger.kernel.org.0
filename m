Return-Path: <linux-clk+bounces-5717-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 894C689FCE1
	for <lists+linux-clk@lfdr.de>; Wed, 10 Apr 2024 18:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD6B21C2235A
	for <lists+linux-clk@lfdr.de>; Wed, 10 Apr 2024 16:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E2415B131;
	Wed, 10 Apr 2024 16:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fCU4Ukbb"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264F712AAEB
	for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 16:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712766713; cv=none; b=fsUYVp6pgn5AP7clRFwn8M8WZya2WWbW3HLkWjDR72+mowIPrkPF5yYe3QXsu5M60XR/DfkKSoW9XjL/Cz71M0E7LRS+K0fztuPgNrwZF11MXpcXBoH7Ef/6ImpykfLvcmWzOkVwEbAZfbAU8kB7YTA83aZYawJve5nYjLy8EBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712766713; c=relaxed/simple;
	bh=TigeXYTAfCmO9vFIAuFVr6YjJ9ckn95Lu8aZKR1UJco=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sC6DMFdKAyKEVT+e0mgxE99XtPRCOjOVCWFPnxaBcMwiWnDChK+Nwqx7HzG0ARZ4NXJuXf146ZQlfkc0lm1y0aO3rC+aX/ZCWq+c9ZydDfWiagwKwf7uCW+qHnQGhFWaylBRfNQUD7Hz9yDW940BNLDoIP9AwBGgZKePAiR8HuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fCU4Ukbb; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516d756eb74so6293628e87.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 09:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712766709; x=1713371509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vNeFQNktlIA8w3wmg3JURuXjlBOVomR7GbPLIUYrBQ=;
        b=fCU4UkbbngUM4GeaDoFs9UL4ocF1k3ga1FimF3yo4B5DND3bRiUyTr/w2tNaKKq6qp
         sE3oLXpLESda7rUOX+07spCRbtNGwLyyYF2+hCs6XmDfCrvS9vCeJj+G73K7ap2EKF9K
         keVcWDrdU4DZ0M8qGRbum5QrKDGzmFXObFnznoRIP09IB+2TaX06ujZDitVkJ9PiJ1hA
         LnQY6hRiSuqsqIJtlmQ4rx6QD/rfCcpff5PMfBYdYvVXiU7bUTT8spMaNpuhzJmR6Es1
         je6cF6U2D3HfR5lNpelYxGP/tDSI4lvsNAqaQsjb6G6dBqcJBJjb0MxKUuqtoDX+BhtA
         IGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712766709; x=1713371509;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9vNeFQNktlIA8w3wmg3JURuXjlBOVomR7GbPLIUYrBQ=;
        b=JakkTHTjVeusV6AoBmnCrEXpOgPFU6jPmMDfTIEhc0vytI5N77jfq8Xh28c8w/NsiW
         xUMB5Wx34OvLX/lLogZJL0jB35PagtbIgQdR62cYSzZ5aQeKNNxQGTvyVwShRKFL+48p
         WE7fAALFYkraMRGrRzcu7uys/4vRwdhBEkTz+fdbwJC6/Wmz+lib9WBVih4QQDWWYgS6
         py3/oiGDGmxLjAk0VvhyX+unWJka2vnrpSgLzLJwjp6Pf7JA+kGRpD4a5sLH4bngBjNR
         eQkxqD6X+lc8GYK1vrxqTFkkTwPfub8H6TVvTka5PyfIol1rBr17NmLEYBE96xejANE6
         dUUA==
X-Forwarded-Encrypted: i=1; AJvYcCXvIqmZ1WE6bfKdu36CoH1YVp+c4BAwHg3x/4luW9wdUWGz4aZDzX8QBnt3ppksuO4Vg8FqCLggX8T5FWX0WB2fSZhJVOYyWG9R
X-Gm-Message-State: AOJu0YwYy/tbtJu2feB6FpJdLuBqcl1+0g1jvYam/tYJcw9XalRQKFca
	2C257Tk7LXwEiEFQt1UK5oCNOCwRU+ITpWRnAbf44x1QNFEtTf+gkkXmDOKUNNg=
X-Google-Smtp-Source: AGHT+IHGJou1VZFMC+f/v3GtNtXNZ5Ds+Ksyxd87e6NwCFIm1bSR3hcPPr27KhvIrDcv/FNUkD/Vpw==
X-Received: by 2002:a19:9158:0:b0:513:82e2:4193 with SMTP id y24-20020a199158000000b0051382e24193mr2227762lfj.10.1712766709005;
        Wed, 10 Apr 2024 09:31:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:760d:c2fa:a66b:fed3? ([2a01:e0a:982:cbb0:760d:c2fa:a66b:fed3])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600c350800b0041488978873sm2705892wmq.44.2024.04.10.09.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 09:31:48 -0700 (PDT)
Message-ID: <f1d73684-0573-46e6-8f50-684354c94c33@linaro.org>
Date: Wed, 10 Apr 2024 18:31:47 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/4] clk: qcom: dispcc-sm8650: fix DisplayPort clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240408-dispcc-dp-clocks-v1-0-f9e44902c28d@linaro.org>
 <20240408-dispcc-dp-clocks-v1-4-f9e44902c28d@linaro.org>
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
In-Reply-To: <20240408-dispcc-dp-clocks-v1-4-f9e44902c28d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2024 13:47, Dmitry Baryshkov wrote:
> On SM8650 DisplayPort link clocks use frequency tables inherited from
> the vendor kernel, it is not applicable in the upstream kernel. Drop
> frequency tables and use clk_byte2_ops for those clocks.
> 
> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sm8650.c | 20 ++++----------------
>   1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
> index 9539db0d9114..3eb64bcad487 100644
> --- a/drivers/clk/qcom/dispcc-sm8650.c
> +++ b/drivers/clk/qcom/dispcc-sm8650.c
> @@ -343,26 +343,17 @@ static struct clk_rcg2 disp_cc_mdss_dptx0_aux_clk_src = {
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
>   	.clkr.hw.init = &(const struct clk_init_data) {
>   		.name = "disp_cc_mdss_dptx0_link_clk_src",
>   		.parent_data = disp_cc_parent_data_7,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_7),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_byte2_ops,
>   	},
>   };
>   
> @@ -416,13 +407,12 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_link_clk_src = {
>   	.mnd_width = 0,
>   	.hid_width = 5,
>   	.parent_map = disp_cc_parent_map_3,
> -	.freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
>   	.clkr.hw.init = &(const struct clk_init_data) {
>   		.name = "disp_cc_mdss_dptx1_link_clk_src",
>   		.parent_data = disp_cc_parent_data_3,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_byte2_ops,
>   	},
>   };
>   
> @@ -476,13 +466,12 @@ static struct clk_rcg2 disp_cc_mdss_dptx2_link_clk_src = {
>   	.mnd_width = 0,
>   	.hid_width = 5,
>   	.parent_map = disp_cc_parent_map_3,
> -	.freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
>   	.clkr.hw.init = &(const struct clk_init_data) {
>   		.name = "disp_cc_mdss_dptx2_link_clk_src",
>   		.parent_data = disp_cc_parent_data_3,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_byte2_ops,
>   	},
>   };
>   
> @@ -536,13 +525,12 @@ static struct clk_rcg2 disp_cc_mdss_dptx3_link_clk_src = {
>   	.mnd_width = 0,
>   	.hid_width = 5,
>   	.parent_map = disp_cc_parent_map_3,
> -	.freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
>   	.clkr.hw.init = &(const struct clk_init_data) {
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
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

