Return-Path: <linux-clk+bounces-7813-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C8E8FE554
	for <lists+linux-clk@lfdr.de>; Thu,  6 Jun 2024 13:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96DF81F227EE
	for <lists+linux-clk@lfdr.de>; Thu,  6 Jun 2024 11:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789FE19580F;
	Thu,  6 Jun 2024 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ICalM9Yj"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7776D1957EA
	for <linux-clk@vger.kernel.org>; Thu,  6 Jun 2024 11:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717673262; cv=none; b=P0SuhjSPD/qok+kA4SAb4pcpkCaE8+EIYrsTRcSZ5Zd1VOUnhAQsXNfQ4CYPtLwAHkpm2uk3DJeOTmOmCh/dbK5h0p1vvA70+huYGfqGhO7OvezjcnkB3xJcRlF16mCGUkaIgZcVTB1NhK2zAiP502nxbA0zVuJ/7USJj2BHvss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717673262; c=relaxed/simple;
	bh=IKJMKta3gKbm6WrlCyDsenNN9FGXLJuX8rzYumUp5gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e0Y+Lvvv6VLzOorSlkR6LsUSGAkaQ1V4g05loOcp1PXhc8RFKPRSR3qZnn+cveiCCvYLt0S2kl1L1CX9/x9mCtdVrwmzj2PmR+L8cImK8AT33xsv/LH/6l2GdK2m39Q12Y5kcd3hmcP8PYVnYxM0nItAAHktboMj5M4BAb1/Vfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ICalM9Yj; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso75880266b.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Jun 2024 04:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717673258; x=1718278058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7H5RlqVYDUyhbQV2vrFzVsqeAI5zP+J54d70UEPgNX4=;
        b=ICalM9YjyU3RlE2NJy1LnnesmUY+7WMTwG44CEQYDmqBmwQYW+l/CBkvcyw46CuXJm
         75GSeCslSy0UxQFD8EFfwR6z6p4eFKIeq3zBuxhbkoWaVU+pMg6CZP+hQVco5dPh/Nic
         Sguo3qu0wmJcRObJds9ovhOgCDgRprGVwOLDYSaX/B/0zF/fVG3UPlDPWeyCcjfSdz8d
         hV0myeivfemDs9+Q9bDrcanhrqMKIy40hqA6fMyaSZ7Eme4thxecxNwC34ZUnJ/sdAX3
         S9Z9UvF2AJiYSIDpIoB03mwtVD1pKNdlzGIw1pBDTmQM5YomKiKSNywHyTMBLh/sN+mW
         47Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717673258; x=1718278058;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7H5RlqVYDUyhbQV2vrFzVsqeAI5zP+J54d70UEPgNX4=;
        b=MDjtt8qdfq0nJiBDfX7jwH4O2itlmztDL/UvNsNa6f/5kuudzupe2FS0/fNcRB2hny
         ZunhgT0ROzFeK/+oy7iHIG76yCWWIhK6LtKHrCDLKHTkbBJ0ip6yyIQDzph3FtLZp+8r
         vXNKFaXIPqIHRn8E8PxNX2UVmwEc7gsMHToDFXfqu7mcYheCcBR5pqE2C5fKTSMOMMJH
         wI1vKK3Py9wqUKEDUTmL8DINsJ3wt1EjuI+Hk4aZzsd6tJa4F5UR+0h6XxvhcP5fn2Vl
         TywiCnkRN8kWpYuu89Nvnmfz3VFTVEhjTEH2si+Y/MUO2Dbg7En068SyvWo/xFMBa/JM
         LmQg==
X-Forwarded-Encrypted: i=1; AJvYcCWJKd2nDugJF7LJ0QmjTHyjzYnBKCCACkH60PntUOpBU2xmqpZ8nrf4GKtQHelTzQkMmXlutnTfgLD3a44X+//iRZUUZHDMqXRC
X-Gm-Message-State: AOJu0Yznzq1TY28eaTx41YXaf7CiQ8RItg4m2vo5v8dHfWS6I7tk/sY+
	JonAUu7cUNUzUED0+NxZMlv8r8wS/bnL9TAHvztQKo3DDqpV9djeSArEBTXw9BM=
X-Google-Smtp-Source: AGHT+IFx0wGfFwN0UT4FIGaqOzJR3ykbzHdhODFPCyYmywROOYmHADOhrvqheQZuoFV0OyCitGp6Vg==
X-Received: by 2002:a17:906:3498:b0:a58:e8c7:c0b8 with SMTP id a640c23a62f3a-a699f361c21mr336766866b.7.1717673257748;
        Thu, 06 Jun 2024 04:27:37 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c8070e2fcsm83411466b.154.2024.06.06.04.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 04:27:37 -0700 (PDT)
Message-ID: <202852cb-d49e-4380-8073-8bb679fcf53e@linaro.org>
Date: Thu, 6 Jun 2024 13:27:34 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240219-topic-rb1_gpu-v3-0-86f67786539a@linaro.org>
 <20240219-topic-rb1_gpu-v3-2-86f67786539a@linaro.org>
 <b39e9d5ecfddef7b0564c2224685d9d0.sboyd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <b39e9d5ecfddef7b0564c2224685d9d0.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5.04.2024 11:37 PM, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2024-03-26 14:08:24)
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index 8a412ef47e16..27ba8aa3e577 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -779,6 +792,40 @@ static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>>         return clamp(rate, min_freq, max_freq);
>>  }
>>  
>> +void clk_huayra_2290_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>> +                                  const struct alpha_pll_config *config)
>> +{
>> +       u32 val;
>> +
>> +       clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
>> +       clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config->config_ctl_hi_val);
>> +       clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config->config_ctl_hi1_val);
>> +       clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->test_ctl_val);
>> +       clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->test_ctl_hi_val);
>> +       clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll), config->test_ctl_hi1_val);
>> +       clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
>> +       clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
>> +       clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
>> +
>> +       /* Set PLL_BYPASSNL */
>> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_BYPASSNL, PLL_BYPASSNL);
>> +       regmap_read(regmap, PLL_MODE(pll), &val);
>> +
>> +       /* Wait 5 us between setting BYPASS and deasserting reset */
>> +       udelay(5);
>> +
>> +       /* Take PLL out from reset state */
>> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
>> +       regmap_read(regmap, PLL_MODE(pll), &val);
>> +
>> +       /* Wait 50us for PLL_LOCK_DET bit to go high */
> 
> Is the bit not reliable or something? I'd expect to see a polling loop
> here but it's a sleep.

Unfortunately, it seems so.

Konrad

