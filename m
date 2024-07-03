Return-Path: <linux-clk+bounces-9090-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB539925F3D
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jul 2024 13:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAE2BB3475E
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jul 2024 11:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BC21836C3;
	Wed,  3 Jul 2024 10:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FnQTbK93"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457A818309B
	for <linux-clk@vger.kernel.org>; Wed,  3 Jul 2024 10:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004081; cv=none; b=W5SEQcbIZ4QqLJT1R5qW01Q1wFTDYR/2+XhcANCKOE4zO3F+OWbZ812jHvywC1t9yGDUMQXDOAHWZsHFO2zWFFVu7tw7CR2oVRYTrzfbLpCHx31Q37FwD/5kG4y+XwBT9vAx+hBS2PcMtdXnrOW79l2RgE0tCs/lum4QLW04EY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004081; c=relaxed/simple;
	bh=do6Gp1iB68aYQAhrfYoKUQHa4wNJkqzWCt6HYY2A6gA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fzU+G0qUE85Z/IUKCTcHj6EvqGr6FbTHblowD2iI88RdMfRX2xU/q2bOyf2Q0lKM+owB1EdWxrWt47WQ/PBom3TT+rXI//J+j2udraMe9uIF5oX6RSRaMZvgXVsRHwIi2Nlu5wVTDevWUDkWC0neCRpSztV5C2gk5PdBOcdxiPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FnQTbK93; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ec408c6d94so53759021fa.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Jul 2024 03:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720004077; x=1720608877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlOwgA2oPXO1Req4JpCHFaG+S8N43204bimZ4vVEKzk=;
        b=FnQTbK93d1tItmVurwLFb2M2fAJEWu3M9Qe2NgmGYWDaO1ezP5XxIfQIl6brjUbaDR
         MV1GMSU5DnhvhxlzrIQLCsW81Ew1fPAA+6GMoge4hOBauYWvebL7jpm6WOjEBZiL5mUj
         DLkU7g6SNZJjGNc1XoHJYlb9JfhTcYz0J21fqd44DfAr2rYh0GST1rDP9V4nHrhO3T1Z
         FiInJYfLA4fDVhxCt+6SH7AK4OX16sOaTWxeh10oLVURnh3bodKdJI4jPzqxXtuKPvDw
         m4XPyF+EIvHFnwSWJER3WlHEj2OxBQLR7Ot1kBewJmazv2uhnhCbc9z88ogjEDrPTu7F
         dARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720004077; x=1720608877;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rlOwgA2oPXO1Req4JpCHFaG+S8N43204bimZ4vVEKzk=;
        b=kYy3lgQljkyBCVCRTi2db/MnZk5t2Us1mSAEb4lCXJzct5YQi6Q9SDYnsSvGD4utaq
         AQcughqpkz21nsAz5cJB6yCG7ai+GXsqJe0mcGTmuJTQcGD6Vb+ea/Co1KArCQAP9P+q
         I0eZO9CjnGbAu0LPMC+g2GTDokR3JRUyeqqAK0da0DrOk/j9KhQ0S+LdeA+zerPGo4qZ
         efOQnL0HhVGZGcovTRVPheFzUG4PRe6NPGV6y5HZu9ChxtZI3sjwZAHHun9e35oQk1lT
         WQoYpfrD+bdeWNPSke66OCtlkGFwgpRYAOtgxj6oEfmDKg2+y6F7io6ZiTwBkx4+pQs7
         +j4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnwPjFhT0Ipl0hR7vA8jnB85bvRNp1brc74ygzUhroLwM9PoCgsOFGGK2U+uum/rphde12zTd+1an7I+8TE9Yp1hS/TzwBmI+s
X-Gm-Message-State: AOJu0YyZ71/Z5WqydDKS2nQjcB2NfF0lPyJx2SDERcdDmkvvM35yNyLz
	E33qksODprvg4rH1o6HxpVemdX6izx5il6yTvyTgpaBPnAnbLez73/s9vkwbwFU=
X-Google-Smtp-Source: AGHT+IFeGsG5TeLKU7VX6O7WQdWbFt2TMF/Q9K55GPSurTDC3XQJCOCEimowm1HlG2bUkeLZmrPjTw==
X-Received: by 2002:a05:651c:2c6:b0:2ec:543f:6013 with SMTP id 38308e7fff4ca-2ee5e3acd8dmr64013921fa.13.1720004075177;
        Wed, 03 Jul 2024 03:54:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef03:73b5:7503:ee71? ([2a01:e0a:982:cbb0:ef03:73b5:7503:ee71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fbbfesm15660302f8f.66.2024.07.03.03.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 03:54:34 -0700 (PDT)
Message-ID: <6353f1d2-5bd3-4194-9932-0d92f78f8d75@linaro.org>
Date: Wed, 3 Jul 2024 12:54:33 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 02/10] clk: meson: a1: pll: Constify struct regmap_config
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
 <20240703-clk-const-regmap-v1-2-7d15a0671d6f@gmail.com>
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
In-Reply-To: <20240703-clk-const-regmap-v1-2-7d15a0671d6f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2024 11:50, Javier Carrasco wrote:
> `a1_pll_regmap_cfg` is not modified and can be declared as const to
>   move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>   drivers/clk/meson/a1-pll.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> index a16e537d139a..4d0a6305b07f 100644
> --- a/drivers/clk/meson/a1-pll.c
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -295,7 +295,7 @@ static struct clk_regmap *const a1_pll_regmaps[] = {
>   	&hifi_pll,
>   };
>   
> -static struct regmap_config a1_pll_regmap_cfg = {
> +static const struct regmap_config a1_pll_regmap_cfg = {
>   	.reg_bits   = 32,
>   	.val_bits   = 32,
>   	.reg_stride = 4,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

