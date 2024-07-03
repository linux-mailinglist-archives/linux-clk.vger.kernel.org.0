Return-Path: <linux-clk+bounces-9093-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 197C0925B4A
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jul 2024 13:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 998601F26C77
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jul 2024 11:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CCA18412E;
	Wed,  3 Jul 2024 10:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R4ObCPh0"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1AC18411C
	for <linux-clk@vger.kernel.org>; Wed,  3 Jul 2024 10:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004097; cv=none; b=ZI91DnoutAdjG49Hm3MqeKE1ljSfJG+wM1+dIucfQDY7Muo15M/2HzFRcSpQev/3fFYe/U4VQzvv08PRzA1+npCxnz56fDu1uYla1VE6LdzNGs6CTmL2Wownf/jDNHbwidv0hl43N2Is8VdjWHt+6H/ptZLJ3AYvIwfSS557PZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004097; c=relaxed/simple;
	bh=5CBZcY+hsCqjA7yd6DOVO1gJncK5nNvs1mJLn3kWbjo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Gk+O9fO76DiaVUdkUAj8y4lR3Bdd5FabeElFIQbUch0ESdW/pxybqe63agU2t1LfwqhZrUXZiyNwqOxSIIb6jbG1o0jhv+935twYemKOtUjqMbiyS6QzpbjAjqwdZSPoDuUskxB8eddTR0Jm4+7p43FkrJtraEFuBlvs5GMC8QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R4ObCPh0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4256eec963eso37350365e9.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Jul 2024 03:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720004094; x=1720608894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2qm0K3jIFzcKInhy4SvJXxy1XVZ9MwLxLzY8rfv6AI=;
        b=R4ObCPh09ReJRQKVDeNRifPLsJnjLt7SEEzUk7BwDPmdInpJPsxN01H4bA0anzSc4A
         FPbJFzmZTNljNRs/iMavP18XUE/xhXzbQS/6M793Lm7XroMNPtptvN4ELjzHNE0/UrM9
         8ZFAAEUNwl3g3j9f+cyTmnIhmwKcsNZeDOihLZyE3BVq0+ONxQXC/LfZEuSGBB0Kapg3
         kQKc2tmVv4DMiUMvTxaDGDn8Rfwp5GGheSQO8IATPA4beAequYVBxzzwRnEjlNySVZmO
         xm0r4olJ6ZC+UPohy73aHMPfscyOlk2YocEh7Qe0qkruN2byjVmYwuB7DOlZkOM+15Kd
         dodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720004094; x=1720608894;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q2qm0K3jIFzcKInhy4SvJXxy1XVZ9MwLxLzY8rfv6AI=;
        b=WoVl0dLKnmmIVPTPVlFf40a43ehoWJhJ7giHkkjiIkYBtQgnG/bMhbN9ym4x+NkcgO
         +2X16/Qsz89PZEKnjZQNvJU0KM+K4u9M8bL0X+znPMzoncXDL4nSbAiiIhOO6e4jzKhI
         qSTcGkXspeONcJ8pBLo+qzW6rTjaWM8UFBrUzsr/bZLmI0mTl9++HJX0QgqOv2588pXX
         a1eCX2UOM2W+WZIB5c3oJpO6aEvSO6L1omd/y/5RiEtb5i9IhnKrwYrHbDoctJOyV6UR
         Wf0I6gcCh0Wb4VLerEW1VbcJqhZcVnC3WvIXJza1NWsWdSjZ67ZnU5GQIzSYzJd1HzIg
         L6pw==
X-Forwarded-Encrypted: i=1; AJvYcCVpSdfgZQ9h15LzcUxEF6mnMzuRa1mokP93HnOk/HCFk9gdDTMX1geHKeMwzWdYVGghLIArv6sHjDCgSWm4kvEwTA6YxYJLqL+8
X-Gm-Message-State: AOJu0Yzu9t4u5DDSEE+UIV+/ATUuHO5MLi+4NJOdSI5P00tgN6zhbfNg
	s29rL3XBv4jhem+YPCooORvPhthGWTjqs98Eab9Lp+WTeOVWLuh20hiKuRh+LsE=
X-Google-Smtp-Source: AGHT+IFxj8jlEQLBpSqKhooeLWCX1htSQQ5imS6gMVsLRfICOATTre1xSXqKt543E2h6n9McHYRATQ==
X-Received: by 2002:a5d:4529:0:b0:362:1b7e:8e66 with SMTP id ffacd0b85a97d-36775730f03mr6861561f8f.71.1720004094166;
        Wed, 03 Jul 2024 03:54:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef03:73b5:7503:ee71? ([2a01:e0a:982:cbb0:ef03:73b5:7503:ee71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fbbfesm15660302f8f.66.2024.07.03.03.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 03:54:53 -0700 (PDT)
Message-ID: <40c995a4-ca34-47a8-b8d7-587c781527c1@linaro.org>
Date: Wed, 3 Jul 2024 12:54:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 05/10] clk: meson: s4: peripherals: Constify struct
 regmap_config
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
 <20240703-clk-const-regmap-v1-5-7d15a0671d6f@gmail.com>
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
In-Reply-To: <20240703-clk-const-regmap-v1-5-7d15a0671d6f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2024 11:50, Javier Carrasco wrote:
> `clkc_regmap_config` is not modified and can be declared as const to
>   move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>   drivers/clk/meson/s4-peripherals.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index 130c50554290..ba1d531fce4f 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -3747,7 +3747,7 @@ static struct clk_regmap *const s4_periphs_clk_regmaps[] = {
>   	&s4_adc_extclk_in_gate,
>   };
>   
> -static struct regmap_config clkc_regmap_config = {
> +static const struct regmap_config clkc_regmap_config = {
>   	.reg_bits       = 32,
>   	.val_bits       = 32,
>   	.reg_stride     = 4,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

