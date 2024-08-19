Return-Path: <linux-clk+bounces-10864-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D250956F68
	for <lists+linux-clk@lfdr.de>; Mon, 19 Aug 2024 17:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D1421C21EDF
	for <lists+linux-clk@lfdr.de>; Mon, 19 Aug 2024 15:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B210D165F1F;
	Mon, 19 Aug 2024 15:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZBkOHFIR"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE46813C670
	for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2024 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083072; cv=none; b=FQiOC/ab/i2fZECoc07+Sy56yPXxIpbe57HNpx/yomdfv/v7iWiGZeHjNr91CppLbAPLd2lJS32M/jptWMKSKZLaxU3eOkwdIhRRARe7QPyvSK+jn/RQrZ0JVnn9vJGxboWqLkIs6nAjiAGhvVpOrMPku+JiGI8wchYKKFLjnzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083072; c=relaxed/simple;
	bh=mp5LMuBSzTVnZiVMfzCI4ELMyqOZCnZ146c3JWPIvCw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Jd9FM0OZn6IELyyGzycwaiW9O1LggBB3qPXCn8kICb6K0JrWArNmfvDLHy/YXNBtTGuO4M/Ab1x0YZceckIg2TCoFGDhN3bWSdhUW7mUhYmNhJo1XvcJtGaRmPMTv57QLz5U8T/DrS3UT0/9OHl6/w63pbmOtqoiOrAau9eNXGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZBkOHFIR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428085a3ad1so39424725e9.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2024 08:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724083069; x=1724687869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYLXx6IK436ZXUWm98Vv0I9P30RpVgjMhTotCo81moA=;
        b=ZBkOHFIR5Xzbgf9fCp/QaGj0sHjkKR4qY/6ufb893OlQ48kOhLieW5H5X0qGlMLDXb
         afTPUy87JF51DdZYvYhjgCw2fkhR1T60dY1NX2yEVe5V5ZON6aWpk3y3/Xi5c03glIj7
         anFgJrjZQu1yuTJk/10Tqd35WsU+SxVc/dAQ25CQosdzzYQm1/LRwVJ2JHynwLMCPnhu
         ArK0UpaWbzyMFTewMkVocdcF8V9huL2+nXY8nJj45ZkQWP+E4SdBlmPi+kDC6kBOgiP+
         3tw5Y6IqEgvKRuRDl+P2K53HHkCLOIoE1mPmZt63p8c0WwI1M76YaZLjMrAIN7gd+vS9
         yl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724083069; x=1724687869;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gYLXx6IK436ZXUWm98Vv0I9P30RpVgjMhTotCo81moA=;
        b=klIP97ogttO35m2Q7adDbSFL9oAy7J5nn4hcP3VduYJImI7m06mi+Xos3+0ZGuypoo
         4Djpdo7lGnKIYlrZx9IR8enAOoaZOEC5z/NtaptKQXdImEIxT+s+VgebDyIZ0P98homl
         Iop3Ml/FRXkqM0nZ1fmizUc/pLP7mNbHpBRGPmB79XNIlxMzj8bUo09V5GUOWjkUOKfp
         5odG4hMC51tVAyyGKnOKARNL9hMVFn6KYKnpZbDaQ7kIlTqJvAYL17lrurGi1wp3C9ig
         vFSquvZnM7E4XgHcMATRy5eqka0WZnCy7EtvpbNHpfSawB6nysMuKEZ2UQfEigqEuTCQ
         2AFw==
X-Forwarded-Encrypted: i=1; AJvYcCXEIxo6rUOJmZJoQdydTxodh0/f9FQhHOX2gb71oxPlXMpQVaBtEnYqfXeyA4LCIDKRgn6ItmtrXUTHpX4YqHUCgCrDtACLkkfK
X-Gm-Message-State: AOJu0YyPppIAzvLXe4lGpkTu+D2zylgDPuXiZKulV7ZB6GfvXa1k8Rzw
	bqqWhhpL3m7FfCQhdqU5bhmMjcrnIEjWhRwOCqTBw7XDHzJVvMZUoP+RV5m5hSg=
X-Google-Smtp-Source: AGHT+IEWZ9kdWV6uTHZAXTq9g0kGd7Rheid4jblAqZmzIcGKVPLZkk5lJdCcW5NMGYbQoypK0W3cIQ==
X-Received: by 2002:a05:600c:46c9:b0:427:985b:178b with SMTP id 5b1f17b1804b1-429ed79e585mr67849275e9.16.1724083068540;
        Mon, 19 Aug 2024 08:57:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898aabe9sm10897543f8f.92.2024.08.19.08.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 08:57:48 -0700 (PDT)
Message-ID: <614de1b0-fcaf-457c-9183-1f3cd7f91b38@linaro.org>
Date: Mon, 19 Aug 2024 17:57:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 4/9] reset: amlogic: add driver parameters
To: Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
 <20240808102742.4095904-5-jbrunet@baylibre.com>
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
In-Reply-To: <20240808102742.4095904-5-jbrunet@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2024 12:27, Jerome Brunet wrote:
> To allow using the same driver for the main reset controller and the
> auxiliary ones embedded in the clock controllers, allow to customise
> the reset offset, same as the level offset. Also add an option to make
> the level reset active low or high.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/reset/reset-meson.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index 460ad2f8360f..8addd100e601 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -18,7 +18,9 @@
>   
>   struct meson_reset_param {
>   	unsigned int reg_count;
> +	unsigned int reset_offset;
>   	unsigned int level_offset;
> +	bool level_low_reset;
>   };
>   
>   struct meson_reset {
> @@ -46,6 +48,7 @@ static int meson_reset_reset(struct reset_controller_dev *rcdev,
>   	unsigned int offset, bit;
>   
>   	meson_reset_offset_and_bit(data, id, &offset, &bit);
> +	offset += data->param->reset_offset;
>   
>   	return regmap_write(data->map, offset, BIT(bit));
>   }
> @@ -59,9 +62,10 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
>   
>   	meson_reset_offset_and_bit(data, id, &offset, &bit);
>   	offset += data->param->level_offset;
> +	assert ^= data->param->level_low_reset;
>   
>   	return regmap_update_bits(data->map, offset,
> -				  BIT(bit), assert ? 0 : BIT(bit));
> +				  BIT(bit), assert ? BIT(bit) : 0);
>   }
>   
>   static int meson_reset_assert(struct reset_controller_dev *rcdev,
> @@ -84,17 +88,23 @@ static const struct reset_control_ops meson_reset_ops = {
>   
>   static const struct meson_reset_param meson8b_param = {
>   	.reg_count	= 8,
> +	.reset_offset	= 0x0,
>   	.level_offset	= 0x7c,
> +	.level_low_reset = true,
>   };
>   
>   static const struct meson_reset_param meson_a1_param = {
>   	.reg_count	= 3,
> +	.reset_offset	= 0x0,
>   	.level_offset	= 0x40,
> +	.level_low_reset = true,
>   };
>   
>   static const struct meson_reset_param meson_s4_param = {
>   	.reg_count	= 6,
> +	.reset_offset	= 0x0,
>   	.level_offset	= 0x40,
> +	.level_low_reset = true,

Just a comment, I would rather leave the "default" users of this driver with the default value
and use level_high_reset = true for the clock ones

Neil

>   };
>   
>   static const struct of_device_id meson_reset_dt_ids[] = {


