Return-Path: <linux-clk+bounces-15347-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BD69E3683
	for <lists+linux-clk@lfdr.de>; Wed,  4 Dec 2024 10:25:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8B92285E24
	for <lists+linux-clk@lfdr.de>; Wed,  4 Dec 2024 09:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722051AAE09;
	Wed,  4 Dec 2024 09:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uEAUnB0T"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8D21AAE02
	for <linux-clk@vger.kernel.org>; Wed,  4 Dec 2024 09:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733304315; cv=none; b=o+2T1c9+LLrqI5Ct4wT8vnSKVb+WyqOMQ5KzbNmFF4D2eJkQgr7j6hR4qdUZyIQ/+fQkosug+5rHLIQgcXJ6NcODiiw79WwlD4m9xXEkPjv/hqh5jPdmPhtmLMuucUh8R7XBrTImAOq3dvOHCM9srrFp1UXJT/fRbsbwDdFs1MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733304315; c=relaxed/simple;
	bh=IOioREQ7k18L3jP39Gc/HqqFJ0dRj9fDrGSgDDoODFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VrvCq1Mi4fkuMdDlnvx05//NhvJtxGvD64YhD22RABg0VRGRkL1YnEHaR9QEPkaQvn0PycU1dGvI3Q0nVnbo/G7JXOqLZkoQSQwa06v18l5mJFbwODnahnVlU/i/I/3o68n6WULAwqUVmimX8fgKvUpPtRbxHFK0nelJ37KnwG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uEAUnB0T; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4349dea3e0dso6639445e9.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Dec 2024 01:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733304312; x=1733909112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m8DaQdDkfEfGBJ2lNaIrewpoCtOfg7AdvFQ8X4rPfJ8=;
        b=uEAUnB0TJ+0M/cZiPi30tL11ZRoZ8P8KUSnv9VP99ZKv3+gTAycXSavhg9PprWP70h
         tLzsE6CXVDYyh/7Slarn9Pbnbp9WOnGQhPqT/e+0I11yWag/mV7Pvg7iFqaDs1MSE7+x
         57fHsCBYHNKhx+1W5lBCk6pDzqtHR3w3e5+UDji2f5Y8eKkjbj9hYmpE23WUa6EBNfQl
         t0czJeafnVPWUufeqCFTJgWCmg8IwdV2d1Hhn+QQoIBzW8r5zOk5gimmeWOuDg9kJv+u
         qy4VyeJUVoP+x3S24mJupYsYaaHfllYB4ekYXl6EgPlTMdHP1b8UJ3X6pHt3YNwplQmT
         9NyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733304312; x=1733909112;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8DaQdDkfEfGBJ2lNaIrewpoCtOfg7AdvFQ8X4rPfJ8=;
        b=SH+/ck7tY4SU7CysfiZTPNVGk5dhYMw5hDqRYo1rcph/MSVNjh56r86sF/ngJ+zr0w
         N/smP0J2wcd7stdoc3PalgOund+9zXXLCSCJPBrMK1LZdg0sGTsndatVKoDWoiJrjeib
         tcbuw9mfDqv13ix5pjkik97ZFjzdCmzd2wLTVH9yiLBDDL3q8QtJQm2ih7KdDET0PyOS
         ndqDi3S4RCU5mBY9+oZ8fDj/lOjdQ9JxCnDeyRfsryF32V8aXWZ/QSpKkpkDYbfdQw7l
         Zio/HW3iwf2KOus+83oUMlzKQ7XLre1XBivUXLm67E9zmhsGUcekBBbu1E9C62mG/pCL
         6f1A==
X-Forwarded-Encrypted: i=1; AJvYcCXDPB5pEQQvONLRLLRUK2qHnEBAT/p16u/65SoTlSklC3dWx81gCgXoK/HSQqzsHALK1cwBJ8fsnvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX0lgPlOF4By4rPDhlqhoGfozpuH4J9rnLY7LOcNo8c/l8ysdM
	/HqXrypBwozut2trVfoZ12hmlAz1BR3+fm6Raklw0EHEnVBLm25Uj+aS71pBwOY=
X-Gm-Gg: ASbGncvXBkNd6inNxBw8TozvWHoyP/7xv/V6feMP17G8nI3D4DJwz4eLztkCwoKzccC
	b+c84Ln5VUDpcNtIgVGcucpI8GFGERtIsF1Em4ZBWQSPb1/Y1EWubE2VJ/Pot9vTYk7ZTjhYsIG
	cX64jPxY0hNWdv4Rntv+VoADZ/w3WNNB40MGO5YCuni6RZEkaSZC/8uLADstkGC/4vrNxy1K8VQ
	32DzReZAyWQjm0O9kDSAOBvoZZSW70Awko1iIozw11b/hwdeXQBk+SEmkL0lh+u/zuIBA==
X-Google-Smtp-Source: AGHT+IFPDrgwPysTQNJ4gCRHmPmwekHSCTmDhMf33Hj14KtYSarTwzVoBNgKPkKaUfDyt0l7DW5IFw==
X-Received: by 2002:a05:600c:46cf:b0:42c:aeee:e603 with SMTP id 5b1f17b1804b1-434d0a1f397mr18009855e9.7.1733304311559;
        Wed, 04 Dec 2024 01:25:11 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d526b312sm18208205e9.6.2024.12.04.01.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 01:25:11 -0800 (PST)
Message-ID: <52f7ce30-0159-4779-982d-7714d0b45ae3@linaro.org>
Date: Wed, 4 Dec 2024 10:25:09 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: clk-alpha-pll: Add Pongo PLL
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241128-sm8750-dispcc-v1-0-120705a4015c@linaro.org>
 <20241128-sm8750-dispcc-v1-2-120705a4015c@linaro.org>
 <aed888b8c2f49eaaffcd6cfbdda84078.sboyd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <aed888b8c2f49eaaffcd6cfbdda84078.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/12/2024 23:07, Stephen Boyd wrote:
>> -       for (count = 200; count > 0; count--) {
>> +       /* Pongo PLLs using a 32KHz reference can take upwards of 1500us to lock. */
>> +       for (count = 1500; count > 0; count--) {
>>                 ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
>>                 if (ret)
>>                         return ret;
>> @@ -378,6 +403,13 @@ static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
>>                 udelay(1);
>>         }
>>  
>> +       /* Called with clocks already registered ... */
>> +       if (pll->clkr.hw.core)
>> +               name = clk_hw_get_name(&pll->clkr.hw);
>> +       else
>> +               /* or before registering, when init data is present */
>> +               name = pll->clkr.hw.init->name;
> 
> This is sad. Why can't we enable the PLL from the clk prepare/enable
> path? PLLs are typically calibrated during clk_prepare().

I don't know. I'll move it to prepare() and see what happens.

> 
>> +
>>         WARN(1, "%s failed to %s!\n", name, action);
>>         return -ETIMEDOUT;
>>  }
>> @@ -2524,6 +2556,129 @@ const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops = {
>>  };
>>  EXPORT_SYMBOL_GPL(clk_alpha_pll_reset_lucid_evo_ops);
>>  
>> +static int alpha_pll_pongo_elu_enable(struct clk_hw *hw)
>> +{
>> +       struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>> +       struct regmap *regmap = pll->clkr.regmap;
>> +       int ret;
>> +
>> +       /* Check if PLL is already enabled */
>> +       if (trion_pll_is_enabled(pll, regmap))
>> +               return 0;
>> +
>> +       ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* Set operation mode to RUN */
>> +       regmap_write(regmap, PLL_OPMODE(pll), PLL_RUN);
>> +
>> +       ret = wait_for_pll_enable_lock(pll);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* Enable the global PLL outputs */
>> +       ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, PLL_OUTCTRL);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* Ensure that the write above goes through before returning. */
>> +       mb();
>> +
>> +       return ret;
>> +}
>> +
>> +static void alpha_pll_pongo_elu_disable(struct clk_hw *hw)
>> +{
>> +       struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>> +       struct regmap *regmap = pll->clkr.regmap;
>> +       int ret;
>> +
>> +       /* Disable the global PLL output */
>> +       ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
>> +       if (ret)
>> +               return;
>> +
>> +       /* Place the PLL mode in STANDBY */
>> +       regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
>> +}
>> +
>> +static unsigned long alpha_pll_pongo_elu_recalc_rate(struct clk_hw *hw,
>> +                                                    unsigned long parent_rate)
>> +{
>> +       struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>> +       struct regmap *regmap = pll->clkr.regmap;
>> +       u32 l;
>> +
>> +       if (regmap_read(regmap, PLL_L_VAL(pll), &l))
>> +               return 0;
>> +
>> +       l &= PONGO_PLL_L_VAL_MASK;
>> +
>> +       return alpha_pll_calc_rate(parent_rate, l, 0, pll_alpha_width(pll));
>> +}
>> +
>> +const struct clk_ops clk_alpha_pll_pongo_elu_ops = {
>> +       .enable = alpha_pll_pongo_elu_enable,
>> +       .disable = alpha_pll_pongo_elu_disable,
>> +       .recalc_rate = alpha_pll_pongo_elu_recalc_rate,
>> +};
>> +EXPORT_SYMBOL(clk_alpha_pll_pongo_elu_ops);
> 
> GPL please.

Ack (and one more as well)

Best regards,
Krzysztof

