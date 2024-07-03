Return-Path: <linux-clk+bounces-9089-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0533B925B35
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jul 2024 13:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F1FD1F222A2
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jul 2024 11:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D93418307C;
	Wed,  3 Jul 2024 10:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kKjtKxiR"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85EB183070
	for <linux-clk@vger.kernel.org>; Wed,  3 Jul 2024 10:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004072; cv=none; b=QO023zfUbjAbJq7abBrYsYGnurWnKyrr2HNmyLZ9JV7WeaAQ8OGynGt47vhXznzAYEVR6aSlYYj6kxd/EukCoN03vz7pNK4hZZ1aEq/HnCOKM2jZDRmyNmGwgmIDnXxaolvofzedcYt6cj1Sh9i8Cms+VpDw0rin0jxq1y+dojs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004072; c=relaxed/simple;
	bh=I/GpiHkKyV3BTuoiY5xI07I/ghOqMqti1L8LlNhnjHk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sfz7b2NnWIcx8XEjATuXC33X9UOYJ6KJeozqQwsV36HMBTlQ5PKdeKYc0uEJ0W5Wjbroyzdj5WCDPKXk/ecuuzc5TkX4koIhIvZZmBdeKDo7DEKa9Pvj2PS78IkXTj215jAjJ3SoeF6Zm0qyE6iwnDAgmur/rl63wtZgzvuZBDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kKjtKxiR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-366df217347so2928908f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Jul 2024 03:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720004069; x=1720608869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=po7h5jyYg7hwETO6R9fEgslkMlPrxWStSZ0gtZEh01Y=;
        b=kKjtKxiRnvDk0EkNLNuhlnrdj5Rwd24+ycGDACZ1ZioNUN23Dx3M/+hfM3ZSMVw3+H
         Hrki1XZcYyiRm5gGNeZnCt0f1BRzYtCWnhGjjqwkpxkhg9Z/2d0djUmeW+3I2pUSQiGH
         HB9MIh9CcUWD+tjAdYEUdaQ35ih9tLauSYODTK831/BV246qaMsSm9kuEdhczynyy6Zp
         yJ/I+U/+17+LO2O6Yqk6ZiUa2ZJe+t8wwM86/XTkWIN+UlKU4XcEePwdTmOaQaDcXkRx
         GrzqfiCCxO1Rne2WUlyyKt2JsxuKUvjiXQhG/M1DOtiOvJzUItpTzwC84KMGHggW+/Ub
         GrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720004069; x=1720608869;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=po7h5jyYg7hwETO6R9fEgslkMlPrxWStSZ0gtZEh01Y=;
        b=M5dGxJ7P2qSKudi/c/diEp6Or+NsR8eaASbL1zrFXbyTxbh4xr1s3/A23mQngG94sS
         3PPrBa6D7ymuPRh7NMowcpsBQqqKgk5nFnbOwATRIoCyhPXG3FyUCZ4NKDJhuLvi41y+
         s3mzHQy6f0Yzuyq/DyVxgOHTDJynrVK00+Ucu2jBzpxTMiADOUwl01zlJAHkNr+4FA69
         XeDzbVziHNM/1KcbadGT9ChgZLJ1As7aSalDDZpnEQ70SnM4Gbja+h68A2DGNWb4QGEU
         6kCc9AiJ9mTR3IhP45naYaVjgJu/TJOdWZnmobfaD2tNbjRhZW+XF7YU4hlR1gqiFhWu
         sR9g==
X-Forwarded-Encrypted: i=1; AJvYcCXVmKwqcq9CZUrBtDwTU2qZMfzaNuQME9XBEulyMc9xhsWqtcBTU2unhJDo+k4NBFxdaglLkmbPGdNkkQpYmHKW6ODzmhtslqe3
X-Gm-Message-State: AOJu0YzeMspuSYwBxkOrebeKoP2KjOQdUghq2HfoxIbc4NdjhmGdjLYM
	vPGmvPYeu8GkmDjOZtJ46zMhjEQqd8YwId23mZPDXj0BLYa+Kc6+2UHlAJD/vL0=
X-Google-Smtp-Source: AGHT+IFMCkLGFvnP8HSPPqHrZs1or35FFjDvFpUWNEiNiN89WTN27PTcrYD99R4NsVRe24lUHiGeYQ==
X-Received: by 2002:adf:e947:0:b0:367:96bd:127e with SMTP id ffacd0b85a97d-36796bd12femr418667f8f.46.1720004069003;
        Wed, 03 Jul 2024 03:54:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef03:73b5:7503:ee71? ([2a01:e0a:982:cbb0:ef03:73b5:7503:ee71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fbbfesm15660302f8f.66.2024.07.03.03.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 03:54:28 -0700 (PDT)
Message-ID: <b604e36e-18a4-4d01-b896-a37cd9fc1317@linaro.org>
Date: Wed, 3 Jul 2024 12:54:27 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 01/10] clk: meson: a1: peripherals: Constify struct
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
 <20240703-clk-const-regmap-v1-1-7d15a0671d6f@gmail.com>
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
In-Reply-To: <20240703-clk-const-regmap-v1-1-7d15a0671d6f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2024 11:50, Javier Carrasco wrote:
> `a1_periphs_regmap_cfg` is not modified and can be declared as const to
> move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>   drivers/clk/meson/a1-peripherals.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
> index 99b5bc450446..728ad13924ad 100644
> --- a/drivers/clk/meson/a1-peripherals.c
> +++ b/drivers/clk/meson/a1-peripherals.c
> @@ -2183,7 +2183,7 @@ static struct clk_regmap *const a1_periphs_regmaps[] = {
>   	&dmc_sel2,
>   };
>   
> -static struct regmap_config a1_periphs_regmap_cfg = {
> +static const struct regmap_config a1_periphs_regmap_cfg = {
>   	.reg_bits   = 32,
>   	.val_bits   = 32,
>   	.reg_stride = 4,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

