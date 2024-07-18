Return-Path: <linux-clk+bounces-9798-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5DD934D5E
	for <lists+linux-clk@lfdr.de>; Thu, 18 Jul 2024 14:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1C9DB23029
	for <lists+linux-clk@lfdr.de>; Thu, 18 Jul 2024 12:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64FD13A26B;
	Thu, 18 Jul 2024 12:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lLATLgzX"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F771E53A
	for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 12:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721306740; cv=none; b=VAChnIdzZSY+fGzq7md0eJ4Sg3qnaGo7CEssingJRnsoEJe2WNttrg5KBTPml8RGJDlcG4PVPxDv14SOoFbC73m+fYy7TZIXK7RrN2CgADd0P68SfPlS23LGPtuud0t++Pf8KPuPdpCym2x72UqyK9bcDyNEPcCZy6z9JOFQtsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721306740; c=relaxed/simple;
	bh=QGyskHaVoFmRCZ2UiSNkClc8ZMM/UueMkEl9mU+l4YY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jVrtAJ6JGUB7+bXFth7znXTzz5NsuNXxDRIfJvWaN8qs2I5h71itvU2V9XIy5Mux3Hs4JUgd1y+3fjoKwcipAuu2D9MEbOP0AySyWWe+gx40NkupzarliQNvzptqarXkJZXUubQYshG7HPxlzqoIay9+BvBsBtm9LYRDwz2RiMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lLATLgzX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4266f344091so2414865e9.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 05:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721306737; x=1721911537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLm16o1N99p/GKaWwoIJx5VDLlMHAuvKF6xQ0KJlwY8=;
        b=lLATLgzXI8G1i3mOE0UbVLsRRF8J53CRzSJiNP/pst8Y1/auiH8As2SOLEDy5LguC2
         avM1vzjGIwuzuNXVEzGKB/G29bwRdv+ct7rXIxc4VzHC8bNoCk4+zuDgBr61tJacTVp8
         JdU2GB/gVUvVJb64PIPjhUtRkXhloRrCcX3yfPWq5CqYIdkjYRYSjIREgAiUk8h3FJ9i
         7y5qsSeOP+t54rQ5aRhthwqtTp8c1Cm7K3AfYABeE93D/DGoMik4paE9r9I3nfH6Ltgl
         jT7IeL6ROU7eoxX8X4YlN2OEpnOR9yMIjTDIt2yCqYOKuWzwfnbJqITF1/6NhWPaefB1
         MXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721306737; x=1721911537;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qLm16o1N99p/GKaWwoIJx5VDLlMHAuvKF6xQ0KJlwY8=;
        b=g28kjhCUdGBUAYTyJsx+Z37pS2vLrB+qxYsaNIVzK+d202Htu6OcR1XCAuhUUJURZ+
         IVtGZGmpAroFDeJaNwuPVxp3BEoj89DQQFhDSI5o4N9K4aqwfuirgVqNPr6CRSb8xCH8
         +QR8kmLIUmZchBoC5WvArou7fYoP35EDhks+TXpsroLwBeoblEJRquoQ/qPn8jlQwBm1
         xBzRibd1/tyvjuF5uVZprxcBvlmC+7ptXvPf6/TwZlivNrB/KrGsWpzE8qM/32n+BhAH
         Qo+vH/bxhl1ekhdAVbq/VQRDrqE0FYirV6la6q0M6HEqKxatilSU6STvXF3w3KiclnkA
         lJFw==
X-Forwarded-Encrypted: i=1; AJvYcCVfPN3Na9topKbALztI5HPj/Ag0oXyyazzcM6mcIyRUmR2mJCJ+/MuRgi/igimWhbNtdVAzL4TpYU/WLWQxyE5eK137/Zhiu04L
X-Gm-Message-State: AOJu0YxEHNACuweE/sld08NgeOaI0u4grZi9aAFzorBJ3yqRlzQlE1ya
	wyfr8RUhp+hWaGCgK+jIm3mVJaK5onEt47e4Hs++s3gR4ebzx8KrbomQgmg4dik=
X-Google-Smtp-Source: AGHT+IE4aUFSBsSc/TGzH5LOwVpQObZ6rzvXnNXFvQA+sXRph7ULCgzYUUO4yfehrY88zvXYcAW8yw==
X-Received: by 2002:a5d:44ce:0:b0:368:5b2f:67b5 with SMTP id ffacd0b85a97d-3685b2f6c1fmr863619f8f.20.1721306736585;
        Thu, 18 Jul 2024 05:45:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6398:c95d:f83b:e9b1? ([2a01:e0a:982:cbb0:6398:c95d:f83b:e9b1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3686659142asm506581f8f.25.2024.07.18.05.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 05:45:36 -0700 (PDT)
Message-ID: <2f094b21-aa55-4a81-b9af-ff06c34c5a67@linaro.org>
Date: Thu, 18 Jul 2024 14:45:35 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/9] reset: amlogic: convert driver to regmap
To: Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc: Jan Dakinevich <jan.dakinevich@salutedevices.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
 <20240718095755.3511992-2-jbrunet@baylibre.com>
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
In-Reply-To: <20240718095755.3511992-2-jbrunet@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/07/2024 11:57, Jerome Brunet wrote:
> To allow using the same driver for the main reset controller and the
> auxiliary ones embedded in the clock controllers, convert the
> the Amlogic reset driver to regmap.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/reset/reset-meson.c | 80 ++++++++++++++++++++-----------------
>   1 file changed, 44 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index f78be97898bc..8f3d6e9df235 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -11,36 +11,44 @@
>   #include <linux/of.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>   #include <linux/reset-controller.h>
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   
> -#define BITS_PER_REG	32
> -
>   struct meson_reset_param {
>   	int reg_count;
>   	int level_offset;
>   };
>   
>   struct meson_reset {
> -	void __iomem *reg_base;
>   	const struct meson_reset_param *param;
>   	struct reset_controller_dev rcdev;
> -	spinlock_t lock;
> +	struct regmap *map;
>   };
>   
> +static void meson_reset_offset_and_bit(struct meson_reset *data,
> +				       unsigned long id,
> +				       unsigned int *offset,
> +				       unsigned int *bit)
> +{
> +	unsigned int stride = regmap_get_reg_stride(data->map);
> +
> +	*offset = (id / (stride * BITS_PER_BYTE)) * stride;
> +	*bit = id % (stride * BITS_PER_BYTE);
> +}
> +
>   static int meson_reset_reset(struct reset_controller_dev *rcdev,
> -			      unsigned long id)
> +			     unsigned long id)
>   {
>   	struct meson_reset *data =
>   		container_of(rcdev, struct meson_reset, rcdev);
> -	unsigned int bank = id / BITS_PER_REG;
> -	unsigned int offset = id % BITS_PER_REG;
> -	void __iomem *reg_addr = data->reg_base + (bank << 2);
> +	unsigned int offset, bit;
>   
> -	writel(BIT(offset), reg_addr);
> +	meson_reset_offset_and_bit(data, id, &offset, &bit);
>   
> -	return 0;
> +	return regmap_update_bits(data->map, offset,
> +				  BIT(bit), BIT(bit));

Here, you're converting a:
writel(BIT())
to a:
reg = readl()
reg |= BIT()
writel(reg)

so indeed you should use regmap_write(data->map, offset, BIT(bit))


>   }
>   
>   static int meson_reset_level(struct reset_controller_dev *rcdev,
> @@ -48,25 +56,13 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
>   {
>   	struct meson_reset *data =
>   		container_of(rcdev, struct meson_reset, rcdev);
> -	unsigned int bank = id / BITS_PER_REG;
> -	unsigned int offset = id % BITS_PER_REG;
> -	void __iomem *reg_addr;
> -	unsigned long flags;
> -	u32 reg;
> +	unsigned int offset, bit;
>   
> -	reg_addr = data->reg_base + data->param->level_offset + (bank << 2);
> +	meson_reset_offset_and_bit(data, id, &offset, &bit);
> +	offset += data->param->level_offset;
>   
> -	spin_lock_irqsave(&data->lock, flags);
> -
> -	reg = readl(reg_addr);
> -	if (assert)
> -		writel(reg & ~BIT(offset), reg_addr);
> -	else
> -		writel(reg | BIT(offset), reg_addr);
> -
> -	spin_unlock_irqrestore(&data->lock, flags);
> -
> -	return 0;
> +	return regmap_update_bits(data->map, offset,
> +				  BIT(bit), assert ? 0 : BIT(bit));

This one if fine

>   }
>   
>   static int meson_reset_assert(struct reset_controller_dev *rcdev,
> @@ -113,30 +109,42 @@ static const struct of_device_id meson_reset_dt_ids[] = {
>   };
>   MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
>   
> +static const struct regmap_config regmap_config = {
> +	.reg_bits   = 32,
> +	.val_bits   = 32,
> +	.reg_stride = 4,
> +};
> +
>   static int meson_reset_probe(struct platform_device *pdev)
>   {
> +	struct device *dev = &pdev->dev;
>   	struct meson_reset *data;
> +	void __iomem *base;
>   
> -	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
>   
> -	data->reg_base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(data->reg_base))
> -		return PTR_ERR(data->reg_base);
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
>   
> -	data->param = of_device_get_match_data(&pdev->dev);
> +	data->param = of_device_get_match_data(dev);
>   	if (!data->param)
>   		return -ENODEV;
>   
> -	spin_lock_init(&data->lock);
> +	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
> +	if (IS_ERR(data->map))
> +		return dev_err_probe(dev, PTR_ERR(data->map),
> +				     "can't init regmap mmio region\n");
>   
>   	data->rcdev.owner = THIS_MODULE;
> -	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_REG;
> +	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
> +		* regmap_config.reg_stride;
>   	data->rcdev.ops = &meson_reset_ops;
> -	data->rcdev.of_node = pdev->dev.of_node;
> +	data->rcdev.of_node = dev->of_node;
>   
> -	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
> +	return devm_reset_controller_register(dev, &data->rcdev);
>   }
>   
>   static struct platform_driver meson_reset_driver = {


