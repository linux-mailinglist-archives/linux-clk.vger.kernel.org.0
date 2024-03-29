Return-Path: <linux-clk+bounces-5190-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C9489213E
	for <lists+linux-clk@lfdr.de>; Fri, 29 Mar 2024 17:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B4731F27A58
	for <lists+linux-clk@lfdr.de>; Fri, 29 Mar 2024 16:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E53385950;
	Fri, 29 Mar 2024 16:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gXP3Yvn2"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EADD8529D
	for <linux-clk@vger.kernel.org>; Fri, 29 Mar 2024 16:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711728439; cv=none; b=NI5tAvYFJ9OPU7/sUOeY13G6jFxe46urQahxsNAeqlFGbD7bWucqQOVZow6Dfoo8tMDxFv33apJuQRlKKutrB69mOHmfE2HxJQVyWW3XLLePOtP9Xznxf0f65h3A9+f2DEHIX/X5HibjaKRs61Yof3kgft8/d1t505DoRRqkfsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711728439; c=relaxed/simple;
	bh=uVZ8lncSEx9CgZgnVNmxK+Avk1jx1A/buaRNSBdBkc8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bR7RKn+1uSU/p77dJWEorphiOKxaUM/mlAzW0SzQuaOA2jtKC9ObUVnihDPNIpuIHUAr7SkQBa5d49RtVOBEA13Zr0meUijc8OkAIrEuEzCEvJ2EnlRFEEiXhChI4jZNrNU4ugC4dkMIfJYbbiFeR5bUwNGzUYK4LlKcSRlfmBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gXP3Yvn2; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33ecb04e018so1534069f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 29 Mar 2024 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711728435; x=1712333235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkjrKE6IuMRJrcH8UKGD1gXPrQ5QNm+lu1/8bGgH4ic=;
        b=gXP3Yvn2nCksWB2s+DQJfXyA3DLjho1vR825qPT5s3tzWzpW58ryo79uLPKRAf2maP
         xlf/UDF7v3OCcYWim1I6y7yrTdFatTtouQJzA86quESJSl0lLKWvEiLBuZ/lDwpkR57L
         OQXSGD9k8Cm+SkQx1qhRttL1HFx2m3B6iycF6lF0SF/XwnG5vPRqecm70Kc9hNqAxNxh
         EeGgsOF+msCM/1SYb4J927KoWPqpgeWM2vTJIsGeDI+HzlPCX906HtGbthqb2opxnw54
         XYJ9//9sQ6T6fwKrI6gdxrzEUHFWjwGvEGBjpTnl+vZitgvMUUrHHferetWT2ffofYg/
         219g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711728435; x=1712333235;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NkjrKE6IuMRJrcH8UKGD1gXPrQ5QNm+lu1/8bGgH4ic=;
        b=R6HyWX8XzYXYpFV4HDlEvyeolx7op3Y8nIL9xjF8p/2nhDcaH8Ql8VbKs4JRTstPoC
         taaJZfesKZ4Idlr9XWOZnsYVj9dTu0eTS1YFVZ248p2/CXJ2xxJm1TgF5yWdRDYhQat9
         bouTH95vwLF1WTZwAjEpCRBim4kB6mO8aL0YSxV1sJTUMucWZKXwOFI6HKHpNJXeGQKf
         MKfVpNRkTGpYzvOgfPtuoBaHNTvWASMOcTZD0OosdOpcS7FqRgYP1eXe7VlJPp8JWbjX
         hs1QJjXHncwiJqR043wZBG1+0iM5M/9m0ysHyJI4YB03H4HZQnmLb4ByqLWd8QC3rgLl
         osGg==
X-Forwarded-Encrypted: i=1; AJvYcCUJwLuqp7a1RG7Yoj0W65mElleKdkPGe984OaWxIESM2Nqbow5ION6yNCCkX+CqC7td2qi9jUySvF6kR2TCzhhkqwiSp5Nabo/R
X-Gm-Message-State: AOJu0YyJLK/iL3oA3Kdc3MQENwRPnKnGte0pW3yTCg0UyQQ9FZ8JA78U
	dBnVMvKLZYXM+bjZi2u9aHhRar6vlWhcyqVOg5dROkFCff1OUhtWQbnlg1RiHkg=
X-Google-Smtp-Source: AGHT+IFuCPG+afiseNRtV6C8sMI1cvLkX2q2Mn+253xYnh8lGDw5llJy33URLv+YoNPPIFIxTDY2Ag==
X-Received: by 2002:a5d:4b08:0:b0:341:8c2e:5001 with SMTP id v8-20020a5d4b08000000b003418c2e5001mr1696413wrq.64.1711728435308;
        Fri, 29 Mar 2024 09:07:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3cd8:c97b:1468:c232? ([2a01:e0a:982:cbb0:3cd8:c97b:1468:c232])
        by smtp.gmail.com with ESMTPSA id k17-20020adff5d1000000b00341b7388dafsm4478433wrp.77.2024.03.29.09.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 09:07:14 -0700 (PDT)
Message-ID: <7424b114-05df-4603-88ac-ba59aec45c9e@linaro.org>
Date: Fri, 29 Mar 2024 17:07:13 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v11 2/7] clk: meson: add vclk driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Nicolas Belin <nbelin@baylibre.com>, Jagan Teki
 <jagan@amarulasolutions.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
 <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-2-04f55de44604@linaro.org>
 <1jzfuh8bd7.fsf@starbuckisacylon.baylibre.com>
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
In-Reply-To: <1jzfuh8bd7.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/03/2024 13:33, Jerome Brunet wrote:
> 
> On Mon 25 Mar 2024 at 12:09, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> The VCLK and VCLK_DIV clocks have supplementary bits.
>>
>> The VCLK gate has a "SOFT RESET" bit to toggle after the whole
>> VCLK sub-tree rate has been set, this is implemented in
>> the gate enable callback.
>>
>> The VCLK_DIV clocks as enable and reset bits used to disable
>> and reset the divider, associated with CLK_SET_RATE_GATE it ensures
>> the rate is set while the divider is disabled and in reset mode.
>>
>> The VCLK_DIV enable bit isn't implemented as a gate since it's part
>> of the divider logic and vendor does this exact sequence to ensure
>> the divider is correctly set.
> 
> checkpatch reports a few easy CHECKs and one WARNING.
> Could you please fix these ?
> 
> Other than that, It looks OK.

Ack
thx

Neil

> 
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/clk/meson/Kconfig  |   4 ++
>>   drivers/clk/meson/Makefile |   1 +
>>   drivers/clk/meson/vclk.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++
>>   drivers/clk/meson/vclk.h   |  51 ++++++++++++++++
>>   4 files changed, 197 insertions(+)
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index 29ffd14d267b..8a9823789fa3 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -30,6 +30,10 @@ config COMMON_CLK_MESON_VID_PLL_DIV
>>   	tristate
>>   	select COMMON_CLK_MESON_REGMAP
>>   
>> +config COMMON_CLK_MESON_VCLK
>> +	tristate
>> +	select COMMON_CLK_MESON_REGMAP
>> +
>>   config COMMON_CLK_MESON_CLKC_UTILS
>>   	tristate
>>   
>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>> index 9ee4b954c896..9ba43fe7a07a 100644
>> --- a/drivers/clk/meson/Makefile
>> +++ b/drivers/clk/meson/Makefile
>> @@ -12,6 +12,7 @@ obj-$(CONFIG_COMMON_CLK_MESON_PLL) += clk-pll.o
>>   obj-$(CONFIG_COMMON_CLK_MESON_REGMAP) += clk-regmap.o
>>   obj-$(CONFIG_COMMON_CLK_MESON_SCLK_DIV) += sclk-div.o
>>   obj-$(CONFIG_COMMON_CLK_MESON_VID_PLL_DIV) += vid-pll-div.o
>> +obj-$(CONFIG_COMMON_CLK_MESON_VCLK) += vclk.o
>>   
>>   # Amlogic Clock controllers
>>   
>> diff --git a/drivers/clk/meson/vclk.c b/drivers/clk/meson/vclk.c
>> new file mode 100644
>> index 000000000000..3ea813a0a995
>> --- /dev/null
>> +++ b/drivers/clk/meson/vclk.c
>> @@ -0,0 +1,141 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include "vclk.h"
>> +
>> +/* The VCLK gate has a supplementary reset bit to pulse after ungating */
>> +
>> +static inline struct meson_vclk_gate_data *
>> +clk_get_meson_vclk_gate_data(struct clk_regmap *clk)
>> +{
>> +	return (struct meson_vclk_gate_data *)clk->data;
>> +}
>> +
>> +static int meson_vclk_gate_enable(struct clk_hw *hw)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
>> +
>> +	meson_parm_write(clk->map, &vclk->enable, 1);
>> +
>> +	/* Do a reset pulse */
>> +	meson_parm_write(clk->map, &vclk->reset, 1);
>> +	meson_parm_write(clk->map, &vclk->reset, 0);
>> +
>> +	return 0;
>> +}
>> +
>> +static void meson_vclk_gate_disable(struct clk_hw *hw)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
>> +
>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>> +}
>> +
>> +static int meson_vclk_gate_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
>> +
>> +	return meson_parm_read(clk->map, &vclk->enable);
>> +}
>> +
>> +const struct clk_ops meson_vclk_gate_ops = {
>> +	.enable = meson_vclk_gate_enable,
>> +	.disable = meson_vclk_gate_disable,
>> +	.is_enabled = meson_vclk_gate_is_enabled,
>> +};
>> +EXPORT_SYMBOL_GPL(meson_vclk_gate_ops);
>> +
>> +/* The VCLK Divider has supplementary reset & enable bits */
>> +
>> +static inline struct meson_vclk_div_data *
>> +clk_get_meson_vclk_div_data(struct clk_regmap *clk)
>> +{
>> +	return (struct meson_vclk_div_data *)clk->data;
>> +}
>> +
>> +static unsigned long meson_vclk_div_recalc_rate(struct clk_hw *hw,
>> +						     unsigned long prate)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>> +
>> +	return divider_recalc_rate(hw, prate, meson_parm_read(clk->map, &vclk->div),
>> +				   vclk->table, vclk->flags, vclk->div.width);
>> +}
>> +
>> +static int meson_vclk_div_determine_rate(struct clk_hw *hw,
>> +					      struct clk_rate_request *req)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>> +
>> +	return divider_determine_rate(hw, req, vclk->table, vclk->div.width,
>> +				      vclk->flags);
>> +}
>> +
>> +static int meson_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
>> +					unsigned long parent_rate)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>> +	int ret;
>> +
>> +	ret = divider_get_val(rate, parent_rate, vclk->table, vclk->div.width,
>> +			      vclk->flags);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	meson_parm_write(clk->map, &vclk->div, ret);
>> +
>> +	return 0;
>> +};
>> +
>> +static int meson_vclk_div_enable(struct clk_hw *hw)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>> +
>> +	/* Unreset the divider when ungating */
>> +	meson_parm_write(clk->map, &vclk->reset, 0);
>> +	meson_parm_write(clk->map, &vclk->enable, 1);
>> +
>> +	return 0;
>> +}
>> +
>> +static void meson_vclk_div_disable(struct clk_hw *hw)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>> +
>> +	/* Reset the divider when gating */
>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>> +	meson_parm_write(clk->map, &vclk->reset, 1);
>> +}
>> +
>> +static int meson_vclk_div_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>> +
>> +	return meson_parm_read(clk->map, &vclk->enable);
>> +}
>> +
>> +const struct clk_ops meson_vclk_div_ops = {
>> +	.recalc_rate = meson_vclk_div_recalc_rate,
>> +	.determine_rate = meson_vclk_div_determine_rate,
>> +	.set_rate = meson_vclk_div_set_rate,
>> +	.enable = meson_vclk_div_enable,
>> +	.disable = meson_vclk_div_disable,
>> +	.is_enabled = meson_vclk_div_is_enabled,
>> +};
>> +EXPORT_SYMBOL_GPL(meson_vclk_div_ops);
>> +
>> +MODULE_DESCRIPTION("Amlogic vclk clock driver");
>> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/clk/meson/vclk.h b/drivers/clk/meson/vclk.h
>> new file mode 100644
>> index 000000000000..20b0b181db09
>> --- /dev/null
>> +++ b/drivers/clk/meson/vclk.h
>> @@ -0,0 +1,51 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
>> + */
>> +
>> +#ifndef __VCLK_H
>> +#define __VCLK_H
>> +
>> +#include "clk-regmap.h"
>> +#include "parm.h"
>> +
>> +/**
>> + * struct meson_vclk_gate_data - vclk_gate regmap backed specific data
>> + *
>> + * @enable:	vclk enable field
>> + * @reset:	vclk reset field
>> + * @flags:	hardware-specific flags
>> + *
>> + * Flags:
>> + * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
>> + */
>> +struct meson_vclk_gate_data {
>> +	struct parm enable;
>> +	struct parm reset;
>> +	u8 flags;
>> +};
>> +
>> +extern const struct clk_ops meson_vclk_gate_ops;
>> +
>> +/**
>> + * struct meson_vclk_div_data - vclk_div regmap back specific data
>> + *
>> + * @div:	divider field
>> + * @enable:	vclk divider enable field
>> + * @reset:	vclk divider reset field
>> + * @table:	array of value/divider pairs, last entry should have div = 0
>> + *
>> + * Flags:
>> + * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
>> + */
>> +struct meson_vclk_div_data {
>> +	struct parm div;
>> +	struct parm enable;
>> +	struct parm reset;
>> +	const struct clk_div_table *table;
>> +	u8 flags;
>> +};
>> +
>> +extern const struct clk_ops meson_vclk_div_ops;
>> +
>> +#endif /* __VCLK_H */
> 
> 


