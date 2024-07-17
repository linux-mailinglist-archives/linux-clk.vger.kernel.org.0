Return-Path: <linux-clk+bounces-9712-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F8B93388D
	for <lists+linux-clk@lfdr.de>; Wed, 17 Jul 2024 10:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B2331C20CC2
	for <lists+linux-clk@lfdr.de>; Wed, 17 Jul 2024 08:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED202E644;
	Wed, 17 Jul 2024 08:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xtism5mb"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1367629CE8
	for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 08:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721203710; cv=none; b=LHI/8xcXuLGf8hW3a4vXyjq54hObRpj+eem5qYgcqBLl0O1+8U0jg/r7mLaL4OhxDGjrkmf6PaQwHZ/Eg/yxUVzGRTPky+TdsWwX2e1n8sjjDEKECZNvU9wgpMZ9GuXxNZhJBiOzZnU0aXBLGyu4hm0c5+w7v4DeA+n5oxpTXA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721203710; c=relaxed/simple;
	bh=N/6u5o06E8eecpzMlpaqGdu7O0vVN6FnkoXJwkz33rc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=M4nqxOjWide01LQlTjIA5ri894dgajqjzYMnS1gbT66V10Xr1AP6wFLtaJlwAN7ohV5oxHYjVWzFddKC77bXSyiH/GjM1qVpDdKBgDHd/PMuuVW+NkP38V02Q9IDgfLjS7oU59Rga0ENsi4aoUvL1IcU7lfVfr5sembc+qX2duE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xtism5mb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-427b4c621b9so18474355e9.1
        for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 01:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721203706; x=1721808506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ez8A7rFRkRAcSlZAbjKr+JiYwCKFD45WAPk/SHo4ceg=;
        b=Xtism5mbiWQuFsi5zycSG1gerL0y2gTOAnTU0+bJ0Gg5G+dpqAR0MagoaVeracmLhS
         tPOSu4p00HlnOkd5dlboBDTuxXpAvJAgRS+pdwjm8+iN1UJt5pXp6o+iCg1kfF11RlZN
         8C2RVgK/aJ66ipxRUzwvlWrHbMNMSlX3hOC3XfbiQogzWEpw5SaXMGTbEMYog2hQGEHe
         r8CQG/+SEizBW0jV7WewH88BOWDbC8FerFzVTjzz61CjI2GA1sHoHhJDTdOiEHc+BzMx
         I6CschSyW/iZ3K7PGKTXz8Rk0qI5L+PiPX0ZEwPwWMtlltQfS3TmCw9RqPkyQ/yhj/5d
         sB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721203706; x=1721808506;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ez8A7rFRkRAcSlZAbjKr+JiYwCKFD45WAPk/SHo4ceg=;
        b=rmhWnID9lnrgBfRwJ7TA7cCa3W/gcDRpWB9sL9whz8xMgQFe9s68kJY0oEduCbPfvS
         p9BT79D/n3V5vujykmt7wXo+3cC6E9JZ9PHCPI71tuArapvsiAVqRCP81vUAefNEzjlN
         v9QYEtuF6UtptSXtEEtwNu3LFHbLWc5mGP6i23ef7uGAlLZceQ3qAZFnNS0RDxdWo1Vf
         celmlLHeexFKSdZE31WpbZH1ZFCXH3PY2rCn9Z7Pyw5K91vBXmcfcx/RDLr6PWHSRoAX
         xvRYzBPF9PTkUD/lVa/7ReCvISKz6JozKm7ImXO4Zj438PLbWeDAR3iWrbaY7BdXbAFI
         htXg==
X-Forwarded-Encrypted: i=1; AJvYcCVe5TvTDdEkzL9TsHF8OzblwTqm8X5RnjEtSOYWNW139WB5s5PIKeofsHm2OUKIGNpqMWkXy/08E4PkfF6hEKQ18fOGhZ9qyTR4
X-Gm-Message-State: AOJu0YyHG0F/bvEwsX3Gv6CZkVZU1iubOP1uNMWQ5YLQ4mWylbbN1NRQ
	vu+wzcMSLdmsY/uLciF2n3LGf/U4dIezWXVCvjfRpzWHFjDBnyQoNr0LlBxY7Vk=
X-Google-Smtp-Source: AGHT+IElrmBI9qZLG5DPyXj+EIK7uZw5wYoEHQkfugx5E8NXoI43qRRYhZtLVDS5Psp6Te6wmzcAYg==
X-Received: by 2002:a05:600c:35d5:b0:426:5cdf:266c with SMTP id 5b1f17b1804b1-427c2ca22femr5765825e9.7.1721203706128;
        Wed, 17 Jul 2024 01:08:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5b9:9b90:b1c4:1a1d? ([2a01:e0a:982:cbb0:c5b9:9b90:b1c4:1a1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2cc42esm196937105e9.32.2024.07.17.01.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 01:08:25 -0700 (PDT)
Message-ID: <d60cd97b-a1da-4dbd-910d-92cd62762afd@linaro.org>
Date: Wed, 17 Jul 2024 10:08:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/7] clk: qcom: dispcc-sm8550: fix several supposed typos
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
 <20240717-dispcc-sm8550-fixes-v1-1-efb4d927dc9a@linaro.org>
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
In-Reply-To: <20240717-dispcc-sm8550-fixes-v1-1-efb4d927dc9a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/07/2024 23:13, Dmitry Baryshkov wrote:
> Fix seveal odd-looking places in SM8550's dispcc driver:
> 
> - duplicate entries in disp_cc_parent_map_4 and disp_cc_parent_map_5
> - using &disp_cc_mdss_dptx0_link_div_clk_src as a source for
>    disp_cc_mdss_dptx1_usb_router_link_intf_clk
> 
> The SM8650 driver has been used as a reference.
> 
> Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sm8550.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
> index 31ae46f180a5..09e4b1e40e20 100644
> --- a/drivers/clk/qcom/dispcc-sm8550.c
> +++ b/drivers/clk/qcom/dispcc-sm8550.c
> @@ -196,7 +196,7 @@ static const struct clk_parent_data disp_cc_parent_data_3[] = {
>   static const struct parent_map disp_cc_parent_map_4[] = {
>   	{ P_BI_TCXO, 0 },
>   	{ P_DP0_PHY_PLL_LINK_CLK, 1 },
> -	{ P_DP1_PHY_PLL_VCO_DIV_CLK, 2 },
> +	{ P_DP0_PHY_PLL_VCO_DIV_CLK, 2 },
>   	{ P_DP3_PHY_PLL_VCO_DIV_CLK, 3 },
>   	{ P_DP1_PHY_PLL_VCO_DIV_CLK, 4 },
>   	{ P_DP2_PHY_PLL_VCO_DIV_CLK, 6 },

I checked and it's the right fix. Acked

> @@ -213,7 +213,7 @@ static const struct clk_parent_data disp_cc_parent_data_4[] = {
>   
>   static const struct parent_map disp_cc_parent_map_5[] = {
>   	{ P_BI_TCXO, 0 },
> -	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 4 },
> +	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
>   	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 4 },
>   };

Same here, right fix. Acked

>   
> @@ -1146,7 +1146,7 @@ static struct clk_branch disp_cc_mdss_dptx1_usb_router_link_intf_clk = {
>   		.hw.init = &(struct clk_init_data) {
>   			.name = "disp_cc_mdss_dptx1_usb_router_link_intf_clk",
>   			.parent_hws = (const struct clk_hw*[]) {
> -				&disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
> +				&disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
>   			},
>   			.num_parents = 1,
>   			.flags = CLK_SET_RATE_PARENT,
> 

This one is NAK, I checked and on SM8550 the parent of disp_cc_mdss_dptx1_usb_router_link_intf_clk is really disp_cc_mdss_dptx0_link_div_clk_src

I checked on the SM8650 side, and disp_cc_mdss_dptx1_link_div_clk_src is the parent of disp_cc_mdss_dptx1_usb_router_link_intf_clk,
so it's different on both platforms.

Neil


