Return-Path: <linux-clk+bounces-5622-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB95B89BB7A
	for <lists+linux-clk@lfdr.de>; Mon,  8 Apr 2024 11:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 060DEB23AB3
	for <lists+linux-clk@lfdr.de>; Mon,  8 Apr 2024 09:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B504944373;
	Mon,  8 Apr 2024 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ysJoSw22"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4744086F
	for <linux-clk@vger.kernel.org>; Mon,  8 Apr 2024 09:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712567949; cv=none; b=a7PaUW2sDSsO1wsab0WyXOtbydt7pgJFZocfvKby896bCGNU6vfivzjgT5mDHA84e/1+jqfe9iPzw1rJctqyXQoOcLtrWw1LfU6Q5dG0ti5d92v/L+Rgu/TGZlmdjTdRfNyC7xsiQf0fhfLcW8gnG0XHiqHA3m8U493Hy5fcXNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712567949; c=relaxed/simple;
	bh=OF6arTCB8JONXOoAGJiRS/FL3eYcIUL3qR9dXl7B5SY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XnlqkM6EqvvGfJhmVQWUlhB6EkUr++pV85EP+ymYjMXMjS0q2p/zXLeWUxi8ob3ck3YyojTe0PqPPkPAW8a4IrFO/4kykNqDEJCdl/GAo0e4rX4uNi3CnKWozVrJdpJG5dK0GIJwB0c0uoSExjeClqIcdY0NckoDZLQbhUabkKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ysJoSw22; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41650de9e1eso5898165e9.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Apr 2024 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712567946; x=1713172746; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+X8sGaNu+7zgdnn3L3toqhCWyJlQ5mBbe91/Sg3EK4=;
        b=ysJoSw22fhrpiTT/IxvHIGxjENhRUKCMmXuT0yry3rtCBRdqbWwa433iyGO4SuMXVM
         vhNAGIRaBt/kp78ksyDbVZ68o/8NaUKbT+iQB4w1jnEG1kARroncRcpAlCafZE/IV96u
         kx9eNW5v/uxlEPxmiw1e6QM95VuOrATHqixdTZQ5TIskTfwF/WSkAbwxInBy0SpkfSz5
         2sTRlsPR3bHyY5MmLmTPJ6BVY2FqxSNg0AffoNsMRnJnxV8tNM4WTYsweQnU+z4pyarU
         w8AIG7Byp9TUfc1xPLo+IiRWIDB1COSNy8AaPECncSc8RDhphgIT2LQ36df9vw4cc1QZ
         PisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712567946; x=1713172746;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m+X8sGaNu+7zgdnn3L3toqhCWyJlQ5mBbe91/Sg3EK4=;
        b=S73oruk5SFyl3BrHMpwVOFnFV7NajBSIcKnQmcaETxhVIJ4Aam9MjdM+qg5FTywL6x
         LOee08E8G+lqiUdMFvCmeFOXN5gwKBW93elTkM26vUch5CwtY7cOzvex14MkW8bZWLa6
         J/nex99mObpDX622h2dK5DILJcH6yTy0puk7Q+Oueccj0nkZgXDRN5ZvSAnxWfXmA6kA
         eW8yyWBmrq7ZXn9O3AFNo664Ua3HfZ9ks4rGqSiv0oozOzJOlWslw0xNT++dz3gpg/6z
         SW3bT+G4cGKIflhK9aXSx04kXVjAZmQmn1tsoYwpYguR7LLcxxcXE9csLqPyP28Gb7uw
         2aag==
X-Forwarded-Encrypted: i=1; AJvYcCVWGIty4PO9Rzt/8NoQ7MzLIs8QLdtjKZ4w8pyqiuL49JOcDgzsrGXZujteesFVTOK1Pip2g5J3iyyCXo4CCzgajDCPmTqYFAeB
X-Gm-Message-State: AOJu0YyAzbvpSpAwle1E7PWL06KtI2nYDou77yFni1i74BFnvbF1R+UY
	iFVrxMJesGkdUe0AToJgCDAdEsyKQRoG4NZ2V4Du/JuwrKYti8gYBaGqWOpP4fU=
X-Google-Smtp-Source: AGHT+IEe+Nz6gK9it/jNyMfDPLKrr+azkgZeETNSGLMTmujr+CFQ5mGJCWue4R5KbZZwTQ+wXoWTkw==
X-Received: by 2002:a05:600c:3514:b0:415:666e:9355 with SMTP id h20-20020a05600c351400b00415666e9355mr7241821wmq.15.1712567945737;
        Mon, 08 Apr 2024 02:19:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b0c8:7091:4315:491e? ([2a01:e0a:982:cbb0:b0c8:7091:4315:491e])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c468d00b004163059bb53sm11463820wmo.16.2024.04.08.02.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 02:19:05 -0700 (PDT)
Message-ID: <1a0b8a39-7e15-4773-af5d-5888af3a47af@linaro.org>
Date: Mon, 8 Apr 2024 11:19:03 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v12 2/7] clk: meson: add vclk driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin
 <nbelin@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
 <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-2-99ecdfdc87fc@linaro.org>
 <1jmsq9pmgd.fsf@starbuckisacylon.baylibre.com>
 <2cf79f07-0ae1-4267-ac08-fe40366d87d4@linaro.org>
 <1ja5m8p4n4.fsf@starbuckisacylon.baylibre.com>
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
In-Reply-To: <1ja5m8p4n4.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2024 09:00, Jerome Brunet wrote:
> 
> On Thu 04 Apr 2024 at 18:59, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> On 04/04/2024 10:13, Jerome Brunet wrote:
>>> On Wed 03 Apr 2024 at 09:46, Neil Armstrong <neil.armstrong@linaro.org>
>>> wrote:
>>>
>>>> The VCLK and VCLK_DIV clocks have supplementary bits.
>>>>
>>>> The VCLK gate has a "SOFT RESET" bit to toggle after the whole
>>>> VCLK sub-tree rate has been set, this is implemented in
>>>> the gate enable callback.
>>>>
>>>> The VCLK_DIV clocks as enable and reset bits used to disable
>>>> and reset the divider, associated with CLK_SET_RATE_GATE it ensures
>>>> the rate is set while the divider is disabled and in reset mode.
>>>>
>>>> The VCLK_DIV enable bit isn't implemented as a gate since it's part
>>>> of the divider logic and vendor does this exact sequence to ensure
>>>> the divider is correctly set.
>>> The checkpatch warning is still there. Is it a choice or a mistake ?
>>> Documentation says "GPL v2" exists for historic reason which seems to
>>> hint "GPL" is preferred, and I suppose this is why checkpatch warns for
>>> it.
>>
>> Well I didn't see this warning, this is what I fixed:
>>
>> $ scripts/checkpatch.pl --strict drivers/clk/meson/vclk.c
>> CHECK: Alignment should match open parenthesis
>> #63: FILE: drivers/clk/meson/vclk.c:63:
>> +static unsigned long meson_vclk_div_recalc_rate(struct clk_hw *hw,
>> +                                                    unsigned long prate)
>>
>> CHECK: Alignment should match open parenthesis
>> #73: FILE: drivers/clk/meson/vclk.c:73:
>> +static int meson_vclk_div_determine_rate(struct clk_hw *hw,
>> +                                             struct clk_rate_request *req)
>>
>> CHECK: Alignment should match open parenthesis
>> #83: FILE: drivers/clk/meson/vclk.c:83:
>> +static int meson_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
>> +                                       unsigned long parent_rate)
>>
> 
> I would not ask a respin solely for this. It's nice to fix it but I was
> mostly after the warning TBH.
> 
>> <snip>
>>
>> It seems that checking a commit triggers an extra check....
>>
>> $ scripts/checkpatch.pl --strict -G 1bac9f6aa3c3
>> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
>> #58:
>> new file mode 100644
>>
>> <snip>
>>
>> WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
>> #203: FILE: drivers/clk/meson/vclk.c:141:
>> +MODULE_LICENSE("GPL v2");
> 
> Hum, I'm running checkpatch against the mail itself, not the commit. I
> still get the warning

Patch or commit seems to trigger more tests than a file directly, anyway I sent a follow-up patch:
https://lore.kernel.org/all/20240408-amlogic-v6-9-upstream-fix-clk-module-license-v1-1-366ddc0f3db9@linaro.org/

Thanks,
Neil

> 
>>
>> <snip>
>>
>> Neil
>>
>>>
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>    drivers/clk/meson/Kconfig  |   4 ++
>>>>    drivers/clk/meson/Makefile |   1 +
>>>>    drivers/clk/meson/vclk.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++
>>>>    drivers/clk/meson/vclk.h   |  51 ++++++++++++++++
>>>>    4 files changed, 197 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>>>> index 29ffd14d267b..8a9823789fa3 100644
>>>> --- a/drivers/clk/meson/Kconfig
>>>> +++ b/drivers/clk/meson/Kconfig
>>>> @@ -30,6 +30,10 @@ config COMMON_CLK_MESON_VID_PLL_DIV
>>>>    	tristate
>>>>    	select COMMON_CLK_MESON_REGMAP
>>>>    +config COMMON_CLK_MESON_VCLK
>>>> +	tristate
>>>> +	select COMMON_CLK_MESON_REGMAP
>>>> +
>>>>    config COMMON_CLK_MESON_CLKC_UTILS
>>>>    	tristate
>>>>    diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>>>> index 9ee4b954c896..9ba43fe7a07a 100644
>>>> --- a/drivers/clk/meson/Makefile
>>>> +++ b/drivers/clk/meson/Makefile
>>>> @@ -12,6 +12,7 @@ obj-$(CONFIG_COMMON_CLK_MESON_PLL) += clk-pll.o
>>>>    obj-$(CONFIG_COMMON_CLK_MESON_REGMAP) += clk-regmap.o
>>>>    obj-$(CONFIG_COMMON_CLK_MESON_SCLK_DIV) += sclk-div.o
>>>>    obj-$(CONFIG_COMMON_CLK_MESON_VID_PLL_DIV) += vid-pll-div.o
>>>> +obj-$(CONFIG_COMMON_CLK_MESON_VCLK) += vclk.o
>>>>      # Amlogic Clock controllers
>>>>    diff --git a/drivers/clk/meson/vclk.c b/drivers/clk/meson/vclk.c
>>>> new file mode 100644
>>>> index 000000000000..45dc216941ea
>>>> --- /dev/null
>>>> +++ b/drivers/clk/meson/vclk.c
>>>> @@ -0,0 +1,141 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
>>>> + */
>>>> +
>>>> +#include <linux/module.h>
>>>> +#include "vclk.h"
>>>> +
>>>> +/* The VCLK gate has a supplementary reset bit to pulse after ungating */
>>>> +
>>>> +static inline struct meson_vclk_gate_data *
>>>> +clk_get_meson_vclk_gate_data(struct clk_regmap *clk)
>>>> +{
>>>> +	return (struct meson_vclk_gate_data *)clk->data;
>>>> +}
>>>> +
>>>> +static int meson_vclk_gate_enable(struct clk_hw *hw)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
>>>> +
>>>> +	meson_parm_write(clk->map, &vclk->enable, 1);
>>>> +
>>>> +	/* Do a reset pulse */
>>>> +	meson_parm_write(clk->map, &vclk->reset, 1);
>>>> +	meson_parm_write(clk->map, &vclk->reset, 0);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void meson_vclk_gate_disable(struct clk_hw *hw)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
>>>> +
>>>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>>>> +}
>>>> +
>>>> +static int meson_vclk_gate_is_enabled(struct clk_hw *hw)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
>>>> +
>>>> +	return meson_parm_read(clk->map, &vclk->enable);
>>>> +}
>>>> +
>>>> +const struct clk_ops meson_vclk_gate_ops = {
>>>> +	.enable = meson_vclk_gate_enable,
>>>> +	.disable = meson_vclk_gate_disable,
>>>> +	.is_enabled = meson_vclk_gate_is_enabled,
>>>> +};
>>>> +EXPORT_SYMBOL_GPL(meson_vclk_gate_ops);
>>>> +
>>>> +/* The VCLK Divider has supplementary reset & enable bits */
>>>> +
>>>> +static inline struct meson_vclk_div_data *
>>>> +clk_get_meson_vclk_div_data(struct clk_regmap *clk)
>>>> +{
>>>> +	return (struct meson_vclk_div_data *)clk->data;
>>>> +}
>>>> +
>>>> +static unsigned long meson_vclk_div_recalc_rate(struct clk_hw *hw,
>>>> +						unsigned long prate)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>>> +
>>>> +	return divider_recalc_rate(hw, prate, meson_parm_read(clk->map, &vclk->div),
>>>> +				   vclk->table, vclk->flags, vclk->div.width);
>>>> +}
>>>> +
>>>> +static int meson_vclk_div_determine_rate(struct clk_hw *hw,
>>>> +					 struct clk_rate_request *req)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>>> +
>>>> +	return divider_determine_rate(hw, req, vclk->table, vclk->div.width,
>>>> +				      vclk->flags);
>>>> +}
>>>> +
>>>> +static int meson_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
>>>> +				   unsigned long parent_rate)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>>> +	int ret;
>>>> +
>>>> +	ret = divider_get_val(rate, parent_rate, vclk->table, vclk->div.width,
>>>> +			      vclk->flags);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	meson_parm_write(clk->map, &vclk->div, ret);
>>>> +
>>>> +	return 0;
>>>> +};
>>>> +
>>>> +static int meson_vclk_div_enable(struct clk_hw *hw)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>>> +
>>>> +	/* Unreset the divider when ungating */
>>>> +	meson_parm_write(clk->map, &vclk->reset, 0);
>>>> +	meson_parm_write(clk->map, &vclk->enable, 1);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void meson_vclk_div_disable(struct clk_hw *hw)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>>> +
>>>> +	/* Reset the divider when gating */
>>>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>>>> +	meson_parm_write(clk->map, &vclk->reset, 1);
>>>> +}
>>>> +
>>>> +static int meson_vclk_div_is_enabled(struct clk_hw *hw)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>>> +
>>>> +	return meson_parm_read(clk->map, &vclk->enable);
>>>> +}
>>>> +
>>>> +const struct clk_ops meson_vclk_div_ops = {
>>>> +	.recalc_rate = meson_vclk_div_recalc_rate,
>>>> +	.determine_rate = meson_vclk_div_determine_rate,
>>>> +	.set_rate = meson_vclk_div_set_rate,
>>>> +	.enable = meson_vclk_div_enable,
>>>> +	.disable = meson_vclk_div_disable,
>>>> +	.is_enabled = meson_vclk_div_is_enabled,
>>>> +};
>>>> +EXPORT_SYMBOL_GPL(meson_vclk_div_ops);
>>>> +
>>>> +MODULE_DESCRIPTION("Amlogic vclk clock driver");
>>>> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
>>>> +MODULE_LICENSE("GPL v2");
>>>> diff --git a/drivers/clk/meson/vclk.h b/drivers/clk/meson/vclk.h
>>>> new file mode 100644
>>>> index 000000000000..20b0b181db09
>>>> --- /dev/null
>>>> +++ b/drivers/clk/meson/vclk.h
>>>> @@ -0,0 +1,51 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
>>>> + */
>>>> +
>>>> +#ifndef __VCLK_H
>>>> +#define __VCLK_H
>>>> +
>>>> +#include "clk-regmap.h"
>>>> +#include "parm.h"
>>>> +
>>>> +/**
>>>> + * struct meson_vclk_gate_data - vclk_gate regmap backed specific data
>>>> + *
>>>> + * @enable:	vclk enable field
>>>> + * @reset:	vclk reset field
>>>> + * @flags:	hardware-specific flags
>>>> + *
>>>> + * Flags:
>>>> + * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
>>>> + */
>>>> +struct meson_vclk_gate_data {
>>>> +	struct parm enable;
>>>> +	struct parm reset;
>>>> +	u8 flags;
>>>> +};
>>>> +
>>>> +extern const struct clk_ops meson_vclk_gate_ops;
>>>> +
>>>> +/**
>>>> + * struct meson_vclk_div_data - vclk_div regmap back specific data
>>>> + *
>>>> + * @div:	divider field
>>>> + * @enable:	vclk divider enable field
>>>> + * @reset:	vclk divider reset field
>>>> + * @table:	array of value/divider pairs, last entry should have div = 0
>>>> + *
>>>> + * Flags:
>>>> + * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
>>>> + */
>>>> +struct meson_vclk_div_data {
>>>> +	struct parm div;
>>>> +	struct parm enable;
>>>> +	struct parm reset;
>>>> +	const struct clk_div_table *table;
>>>> +	u8 flags;
>>>> +};
>>>> +
>>>> +extern const struct clk_ops meson_vclk_div_ops;
>>>> +
>>>> +#endif /* __VCLK_H */
>>>
> 
> 


