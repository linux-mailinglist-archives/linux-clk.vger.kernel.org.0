Return-Path: <linux-clk+bounces-593-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 036AF7FA5E9
	for <lists+linux-clk@lfdr.de>; Mon, 27 Nov 2023 17:14:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 276761C2088A
	for <lists+linux-clk@lfdr.de>; Mon, 27 Nov 2023 16:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEE735F16;
	Mon, 27 Nov 2023 16:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xWGQFs4c"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B8FEA
	for <linux-clk@vger.kernel.org>; Mon, 27 Nov 2023 08:14:41 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5094727fa67so6344679e87.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Nov 2023 08:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701101680; x=1701706480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2vOa7sAsTt4vB8DyrW+ksy/yD+xOGvGom1YweA1IhM=;
        b=xWGQFs4cnNP1G5Hy9TXJ0bmde/hQIlWztwlu8CQVIZI0SU2ZS7PG7/dhX/bJkTc6jU
         XQX71aUsnW5VambcAxCCQ0Q+EN6Db/XtAulG1kfGJatAA9gx1/UcAY94OTKgdN62PSc1
         kS1gw59Inwm/ZKBoX3j+n4oQJ91MYEwX2R4oYDemgp2NTUuimR3Mf1DaNs4prniiPT5R
         HTJS0xCmfw4wpaXDaCOA6fTTJAO1QkXSSbo2Mr/rfp2iB9Aq/aNGXysrq2EoOyK75XFk
         yX9flQ3/q60ymOD9VsLoK14uPDJ2VDDw95LlK1XsFiR+brUBFv8GEfBU32CAUO56x6yq
         wQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701101680; x=1701706480;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o2vOa7sAsTt4vB8DyrW+ksy/yD+xOGvGom1YweA1IhM=;
        b=G/ybC4Zfk+xUeLF/Wpimlpm10RPeOpOrXPbJrXMuNk8fjoyWysKYTlJ2Z7BMByZHEK
         Oscuww5lZ3PTSqzCiUJpRP6+EiG3XkfXshDDr8ZYg5KIOhSQXtOHn1+scRxDlbUzpum3
         BKVmfTxbI/z3FfXG1FUTwBGJsRIkub3pDPywsTXVAV9fT2eV1ytnfk83gyCDXx6Y3gK4
         UrHRFheAUJLPs1vqH3rqVuTqRSA2TYiDRbRpoFFEMy8afjYUTrnHUFx9JHBT9tKYjSRc
         7zqqEX80jQAlasRVUwvslMWQN/W7c3cYe5IWvoAZdhIMtYlwNPCCd0iCVtlh0opw7P/n
         ejAA==
X-Gm-Message-State: AOJu0YwAN1eXT9SF08Nl9PZc+y45zeKl4u/Un5wOeXkiDW1iNwSVyN2+
	wKsqBj6ogXL16pH023XiKbbKCQ==
X-Google-Smtp-Source: AGHT+IHyo6ztHgNX18sTH2cNNi7/anQssZJBWMkVbCoSK0zP1VlwyicHcNrshfD2A0J0UMJDV9tbeg==
X-Received: by 2002:a05:6512:3b10:b0:505:7113:1d0f with SMTP id f16-20020a0565123b1000b0050571131d0fmr11220409lfv.13.1701101680043;
        Mon, 27 Nov 2023 08:14:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a15:ac68:b4a4:85ff? ([2a01:e0a:982:cbb0:5a15:ac68:b4a4:85ff])
        by smtp.gmail.com with ESMTPSA id d5-20020a05600c34c500b0040b349c91acsm15086215wmq.16.2023.11.27.08.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 08:14:39 -0800 (PST)
Message-ID: <4e5e33c1-45d5-4c83-b647-bfb603347156@linaro.org>
Date: Mon, 27 Nov 2023 17:14:37 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v9 07/12] clk: meson: add vclk driver
Content-Language: en-US, fr
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin
 <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Remi Pommarel
 <repk@triplefau.lt>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-7-95256ed139e6@linaro.org>
 <1j7cm7dx1b.fsf@starbuckisacylon.baylibre.com>
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
Organization: Linaro Developer Services
In-Reply-To: <1j7cm7dx1b.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2023 15:41, Jerome Brunet wrote:
> 
> On Fri 24 Nov 2023 at 09:41, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> The VCLK and VCLK_DIV clocks have supplementary bits.
>>
>> The VCLK has a "SOFT RESET" bit to toggle after the whole
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
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/clk/meson/Kconfig  |   5 ++
>>   drivers/clk/meson/Makefile |   1 +
>>   drivers/clk/meson/vclk.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++
>>   drivers/clk/meson/vclk.h   |  51 ++++++++++++++++
>>   4 files changed, 198 insertions(+)
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index 29ffd14d267b..59a40a49f8e1 100644
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
>> @@ -140,6 +144,7 @@ config COMMON_CLK_G12A
>>   	select COMMON_CLK_MESON_EE_CLKC
>>   	select COMMON_CLK_MESON_CPU_DYNDIV
>>   	select COMMON_CLK_MESON_VID_PLL_DIV
>> +	select COMMON_CLK_MESON_VCLK
> 
> This particular line belong in the next patch
> 
>>   	select MFD_SYSCON
>>   	help
>>   	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
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
>> index 000000000000..47f08a52b49f
>> --- /dev/null
>> +++ b/drivers/clk/meson/vclk.c
>> @@ -0,0 +1,141 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include "vclk.h"
>> +
>> +/* The VCLK gate has a supplementary reset bit to pulse after ungating */
>> +
>> +static inline struct clk_regmap_vclk_data *
>> +clk_get_regmap_vclk_data(struct clk_regmap *clk)
>> +{
>> +	return (struct clk_regmap_vclk_data *)clk->data;
>> +}
>> +
>> +static int clk_regmap_vclk_enable(struct clk_hw *hw)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
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
>> +static void clk_regmap_vclk_disable(struct clk_hw *hw)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
>> +
>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>> +}
>> +
>> +static int clk_regmap_vclk_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
>> +
>> +	return meson_parm_read(clk->map, &vclk->enable);
>> +}
>> +
>> +const struct clk_ops clk_regmap_vclk_ops = {
>> +	.enable = clk_regmap_vclk_enable,
>> +	.disable = clk_regmap_vclk_disable,
>> +	.is_enabled = clk_regmap_vclk_is_enabled,
>> +};
>> +EXPORT_SYMBOL_GPL(clk_regmap_vclk_ops);
> 
> s/clk_regmap_vclk/meson_vclk at least for what is exported, ideally most
> all the code.
> 
> I get clk_regmap_ comes from code copied from clk_regmap.c.
> The reason the this part is different (and not using parm) if that when
> I converted amlogic to regmap, I hope we could make this generic,
> possibly converging between aml and qcom (which was the only other
> platform using regmap for clock at the time). This is why clk_regmap.c
> is a bit different from the other driver.
> 
> For the aml specific drivers, best to look at the mpll or cpu-dyndiv one.
> 
>> +
>> +/* The VCLK Divider has supplementary reset & enable bits */
>> +
>> +static inline struct clk_regmap_vclk_div_data *
>> +clk_get_regmap_vclk_div_data(struct clk_regmap *clk)
>> +{
>> +	return (struct clk_regmap_vclk_div_data *)clk->data;
>> +}
>> +
>> +static unsigned long clk_regmap_vclk_div_recalc_rate(struct clk_hw *hw,
>> +						     unsigned long prate)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>> +
>> +	return divider_recalc_rate(hw, prate, meson_parm_read(clk->map, &vclk->div),
>> +				   vclk->table, vclk->flags, vclk->div.width);
>> +}
>> +
>> +static int clk_regmap_vclk_div_determine_rate(struct clk_hw *hw,
>> +					      struct clk_rate_request *req)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>> +
>> +	return divider_determine_rate(hw, req, vclk->table, vclk->div.width,
>> +				      vclk->flags);
>> +}
>> +
>> +static int clk_regmap_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
>> +					unsigned long parent_rate)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
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
>> +static int clk_regmap_vclk_div_enable(struct clk_hw *hw)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>> +
>> +	/* Unreset the divider when ungating */
>> +	meson_parm_write(clk->map, &vclk->reset, 0);
>> +	meson_parm_write(clk->map, &vclk->enable, 1);
>> +
>> +	return 0;
>> +}
>> +
>> +static void clk_regmap_vclk_div_disable(struct clk_hw *hw)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>> +
>> +	/* Reset the divider when gating */
>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>> +	meson_parm_write(clk->map, &vclk->reset, 1);
>> +}
>> +
>> +static int clk_regmap_vclk_div_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>> +
>> +	return meson_parm_read(clk->map, &vclk->enable);
>> +}
>> +
>> +const struct clk_ops clk_regmap_vclk_div_ops = {
>> +	.recalc_rate = clk_regmap_vclk_div_recalc_rate,
>> +	.determine_rate = clk_regmap_vclk_div_determine_rate,
>> +	.set_rate = clk_regmap_vclk_div_set_rate,
>> +	.enable = clk_regmap_vclk_div_enable,
>> +	.disable = clk_regmap_vclk_div_disable,
>> +	.is_enabled = clk_regmap_vclk_div_is_enabled,
>> +};
>> +EXPORT_SYMBOL_GPL(clk_regmap_vclk_div_ops);
>> +
>> +MODULE_DESCRIPTION("Amlogic vclk clock driver");
>> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/clk/meson/vclk.h b/drivers/clk/meson/vclk.h
>> new file mode 100644
>> index 000000000000..4f25d7ad2717
>> --- /dev/null
>> +++ b/drivers/clk/meson/vclk.h

Is vclk.c/h ok ? clk-vclk doesn't look pretty, but I can switch to it to
keep files organized.

Neil

>> @@ -0,0 +1,51 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
>> + */
>> +
>> +#ifndef __VCLK_H
>> +#define __VCLK_H
> 
> This is too generic.
> Please add the MESON prefix like the other clock driver please.
> 
>> +
>> +#include "clk-regmap.h"
>> +#include "parm.h"
>> +
>> +/**
>> + * struct clk_regmap_vclk_data - vclk regmap backed specific data
>> + *
>> + * @enable:	vclk enable field
>> + * @reset:	vclk reset field
>> + * @flags:	hardware-specific flags
>> + *
>> + * Flags:
>> + * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
>> + */
>> +struct clk_regmap_vclk_data {
>> +	struct parm enable;
>> +	struct parm reset;
>> +	u8 flags;
>> +};
>> +
>> +extern const struct clk_ops clk_regmap_vclk_ops;
>> +
>> +/**
>> + * struct clk_regmap_vclk_div_data - vclk_div regmap back specific data
>> + *
>> + * @div:	divider field
>> + * @enable:	vclk divider enable field
>> + * @reset:	vclk divider reset field
>> + * @table:	array of value/divider pairs, last entry should have div = 0
>> + *
>> + * Flags:
>> + * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
>> + */
>> +struct clk_regmap_vclk_div_data {
>> +	struct parm div;
>> +	struct parm enable;
>> +	struct parm reset;
>> +	const struct clk_div_table *table;
>> +	u8 flags;
>> +};
>> +
>> +extern const struct clk_ops clk_regmap_vclk_div_ops;
>> +
>> +#endif /* __VCLK_H */
> 


