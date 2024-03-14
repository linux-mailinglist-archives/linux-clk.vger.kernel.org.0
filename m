Return-Path: <linux-clk+bounces-4579-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C9A87BE38
	for <lists+linux-clk@lfdr.de>; Thu, 14 Mar 2024 15:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CA7A1C21CA1
	for <lists+linux-clk@lfdr.de>; Thu, 14 Mar 2024 14:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966AB6FE17;
	Thu, 14 Mar 2024 14:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ri8Mz3cH"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA3D6FBB7
	for <linux-clk@vger.kernel.org>; Thu, 14 Mar 2024 14:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710424813; cv=none; b=eLCtMlXR4VBeX8PV3b/ldHU+HV6tc1nYLJi592nuUtk+wQaCNuVCPsdPAQq/BEPDdK5U5cCeW4RTyuwmxljjshHC2yqr27Ri454a6LbkaMqi6VARGrGpyQ//cj61jyGqnfWZ7WTmUnagEsQZ78fR6NPZMtZo87HuOctaFusri6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710424813; c=relaxed/simple;
	bh=hIlmhR3AzpmS8Vgf5z1Vc+JUV312hQfTQ06lv4JjRys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVQ888xgJcf7bzq0l0mYiEzxU6ho8jRlwo8YbtBTG4YrA/lCRuXMWbWZiNOOjvHYSj2qBHCLHIKfy2zh+5ydgr2M107vjAsI84bXV7WkhJ0eSnbp4dFuv+spnHb4giuwuymrRhuQXGS0rAyx+on0jIGeC0blCT1XWpP0eiXt1mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ri8Mz3cH; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51331634948so1959697e87.0
        for <linux-clk@vger.kernel.org>; Thu, 14 Mar 2024 07:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710424808; x=1711029608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FxNLG3KW46YsRyLUDeirw2sQ0+ONikiBJMDP2FhU0UA=;
        b=ri8Mz3cH4KNRQiNXdJLBe2OMCeyhWFnRIub4ycboIIJeBmxtYs3PPyqukoH1y5rAfC
         ni2sSkNc10D4ioy96BjG6X5rAQBywoLV8gQ1kT12px8d3AqAyzoHZSaqaUZImtYGZOiV
         H3hensV7O4fxyxNh/YQQb48kSg2sIAOhAEIp6F6QCuhFxPA6uKIjDl8QsjISaZgMT8Zz
         i+o94YVumapeOZ/PMlAO4jWAd8KGRn3blVXDX9rkypCf0jVS6s8uUAfoxpSZFBrGZek9
         Vw6YFYWUGT63QwYd4Gqx8J9NVbGLMEbbpu1GT5ijew/2JCdixKhsgrFNqz7ygMZKXBdC
         qslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710424808; x=1711029608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FxNLG3KW46YsRyLUDeirw2sQ0+ONikiBJMDP2FhU0UA=;
        b=ZhecxpiUEhHjzLWn4V9D6H4r177VrxITKA9bv1XQxoESDLjk+Irp8Cr5yf3trOEiFM
         mRFRgEwgTR+jaToAryN5wzJeFBaZ7o/hEBnwC1ExMpIANx67IzErSvetj5C+lNDP35ce
         /XlPKLCy7cmul28BpiVAYmsu6KPIldiQgDf2oeKOWvw+5DYeHMaHGVYxaoxDcnewb4jl
         Z0d9FHOKEakT7oMnmCpJljmBe1WyD78UlfwK8taPM/mXQ7JCRR1jz6QFPTgChllTLHqs
         bNJ3/V882fs9H/aUMb3lpDsWphxux1zamIeiXRBYE6SQ3ppS1GNZ/vsbzRNmzldNhkkJ
         Pjjw==
X-Forwarded-Encrypted: i=1; AJvYcCWfCbs+bLAEDheapIIaeiAUlNe+SiXyrL3HZozYe4Uma/fQGrwp/jjABxQja6ji4D+kuhG6st2fZdfhSpzEGkizzJxJ9w+ymmOe
X-Gm-Message-State: AOJu0YyWfCCUGjK9Nbi2Qyw7j33XhcftM7Yfln2Z9CITnQqk5GByTSMm
	iDqTQwuqHRqjcq1wktPxsM6smRAn7YrptOEyCPvO+xCzVH+jGsnG7yZ40h/lzr4=
X-Google-Smtp-Source: AGHT+IHue9gaD3zPtJZnyQCeG7GuQwFP18YfHf0KLTKt0TTAlkcgMAoYq0PpAFe1/h3NaSxXwr70dQ==
X-Received: by 2002:a19:e056:0:b0:513:c5d1:a537 with SMTP id g22-20020a19e056000000b00513c5d1a537mr792222lfj.10.1710424808071;
        Thu, 14 Mar 2024 07:00:08 -0700 (PDT)
Received: from [172.30.204.13] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a19-20020a19ca13000000b00513d10789easm263158lfg.180.2024.03.14.07.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 07:00:07 -0700 (PDT)
Message-ID: <8affb3d8-6210-43e6-8cbb-de28bdcf326a@linaro.org>
Date: Thu, 14 Mar 2024 15:00:02 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: apss-ipq-pll: use stromer ops for IPQ5018 to
 fix boot failure
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240311-apss-ipq-pll-ipq5018-hang-v1-1-8ed42b7a904d@gmail.com>
 <58f07908-127a-438d-84e2-e059f269859b@linaro.org>
 <2b95a593-225e-47b1-8bda-03240eb0f81e@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <2b95a593-225e-47b1-8bda-03240eb0f81e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 3/14/24 14:50, Gabor Juhos wrote:
> 2024. 03. 13. 19:36 keltezéssel, Konrad Dybcio írta:
>>
>>
>> On 3/11/24 16:06, Gabor Juhos wrote:
>>> Booting v6.8 results in a hang on various IPQ5018 based boards.
>>> Investigating the problem showed that the hang happens when the
>>> clk_alpha_pll_stromer_plus_set_rate() function tries to write
>>> into the PLL_MODE register of the APSS PLL.
>>>
>>> Checking the downstream code revealed that it uses [1] stromer
>>> specific operations for IPQ5018, whereas in the current code
>>> the stromer plus specific operations are used.
>>>
>>> The ops in the 'ipq_pll_stromer_plus' clock definition can't be
>>> changed since that is needed for IPQ5332, so add a new alpha pll
>>> clock declaration which uses the correct stromer ops and use this
>>> new clock for IPQ5018 to avoid the boot failure.
>>>
>>> 1.
>>> https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/blob/NHSS.QSDK.12.4/drivers/clk/qcom/apss-ipq5018.c#L67
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 50492f929486 ("clk: qcom: apss-ipq-pll: add support for IPQ5018")
>>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
>>> ---
>>> Based on v6.8.
>>> ---
>>>    drivers/clk/qcom/apss-ipq-pll.c | 20 +++++++++++++++++++-
>>>    1 file changed, 19 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
>>> index 678b805f13d45..11f1ae59438f7 100644
>>> --- a/drivers/clk/qcom/apss-ipq-pll.c
>>> +++ b/drivers/clk/qcom/apss-ipq-pll.c
>>> @@ -55,6 +55,24 @@ static struct clk_alpha_pll ipq_pll_huayra = {
>>>        },
>>>    };
>>>    +static struct clk_alpha_pll ipq_pll_stromer = {
>>> +    .offset = 0x0,
>>> +    .regs = ipq_pll_offsets[CLK_ALPHA_PLL_TYPE_STROMER_PLUS],
>>
>> CLK_ALPHA_PLL_TYPE_STROMER?
> 
> I admit that using CLK_ALPHA_PLL_TYPE_STROMER would be less confusing. However
> 'ipq_pll_offsets' array has no entry for that enum, and given the fact that the
> CLK_ALPHA_PLL_TYPE_STROMER_PLUS entry uses the correct register offsets it makes
>   little sense to add another entry with the same offsets.
> 
> Although the 'clk_alpha_pll_regs' in clk-alpha-pll.c has an entry for
> CLK_ALPHA_PLL_TYPE_STROMER, but the offsets defined there are not 'exactly' the
> same as the ones defined locally in 'ipq_pll_offsets'. They will be identical if
> [1] gets accepted but we are not there yet.

Oh, I completely overlooked that this driver has its own array.. Hm..

I suppose it would make sense to rename these indices to IPQ_PLL_x to
help avoid such confusion..

Konrad

