Return-Path: <linux-clk+bounces-9721-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0298F933A40
	for <lists+linux-clk@lfdr.de>; Wed, 17 Jul 2024 11:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25DB31C21379
	for <lists+linux-clk@lfdr.de>; Wed, 17 Jul 2024 09:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A9917DE07;
	Wed, 17 Jul 2024 09:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TzMf839E"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5704517DA0C
	for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 09:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721209633; cv=none; b=N7cpe+cPTwv5elJNEZf0/hVxE/yNI5XFwTpXwAYvcWMHrvfMVuQYH5fwLnoPPB+SBh7cwQMjUni/oViHaCtQj/cJAq/WTlpXHx14dMk6G5S9zHuL/BG7xi9JxN1Axahwg0Q7kB/AOiMq+lCjfko8Isnc6r9cQypZkT+8kuvHXzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721209633; c=relaxed/simple;
	bh=//Iz1yeTeHxItLfcrpLR6gqmO5Yfh5NJNYqkEOc2ucE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0av7/PxQWDwI6zntqtxrR9JKI53SaJ2ArCVRHLSDt8YSuGd9skgZ2SrN74Ec6Gvl4/cD3pGeEYccqgCzsVlhBTNy3pU8oC21pXJq9TydIGbKJa5TQQxkfGVnFPyA1bYjV2WutvxGmJAeoC1JBjw9SH7dCOVGnfkaSzGAyywb10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TzMf839E; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a79f9a72a99so115767466b.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 02:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721209628; x=1721814428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XOBkvszif5fgt7EeZSYSbNzTTBVJPTV6vNRINOgprJ4=;
        b=TzMf839E2E5/XW7Vt4vnQyzemtHRMDit6xp0M2j2QLZLMTBHHsWvr1stdXB4oYSpWI
         IeL+uKQ3WyOIMzjIZlikEQftfP/98GAA6uhIToFbPPfEniniPr3wTJNETVZva1Mrydlf
         Umh+eR24a3XKnCTB7ij8Djr65+2nQQkDdi/ra46s1VNEB0S2HSJIsCcXXOs9oXCJcCQL
         KjyBRzPtTK9MFs03jCAKp9uB3Has4bNpSVJeWzrUwsauc2j+p8+odlhgyDchPKjuAR0n
         xPZJIJJjRmnWG14LRbRKdCSyKwEaqPAbqVfy57wz7GQAAWVUIOHwKKFS49thld1qkewI
         /Iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721209628; x=1721814428;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOBkvszif5fgt7EeZSYSbNzTTBVJPTV6vNRINOgprJ4=;
        b=HTELhMDVsW8HUjymgYLxin1Kwm+3UlvNX1OfgE2FV8SP8ZiT+rbRQyEZY+blWtmoZe
         wkNES6OTcppo8vuzBgtSDBCR8/4OLhbgBLoRcUq6mFL5tOhruxtI2lb/ki4e+exohP1z
         x7sMbTR9b1sePuZMoCxxjnk48pCzumvzGwE9UOLpiexLKK9tb3EEl6CuDaHirYd0PAU0
         aVOtGC907o2wuhZ7AkvEr41BFxHCP+RcqyFdmPnNXsZz4zuv4N0+fd4ySyVSXKdBRibI
         yksM8BhAh/fK2rULL8xxpFUpFOSPMQGD5jzu9kLSVKc08rq3B+qXL93DuatQMA8NYrRj
         GJeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRY7P9mHiIQMVttcy6JzFhNtE4bK7gfGMOWoTMC6P7kX+JLUAwug5Hbj/5UGorIcXrDoxk72T1pLndeMBsuinPn41dQ4hnmwsa
X-Gm-Message-State: AOJu0YzKvX+0uJjko0DuZbDMJjBn1u1m9CkR6Zg/7ORtf1yoXYz9FxkB
	ABCIqSksG7PiHqih7CilwOdMw3km/pfAZO2be6hs/IdQHUJ/ZHg//+WHg1jsXMk=
X-Google-Smtp-Source: AGHT+IEi2Xc1whKIJtWgOaID7wyzeU+S7ZIxdi5zPQ7Xi6Td3NI7g04SETpjdn9nZeKOm662PuztbA==
X-Received: by 2002:a17:906:f0d4:b0:a72:62e0:6636 with SMTP id a640c23a62f3a-a7a008d0741mr113017366b.24.1721209627396;
        Wed, 17 Jul 2024 02:47:07 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5ea443sm428024766b.91.2024.07.17.02.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 02:47:07 -0700 (PDT)
Message-ID: <94e48e19-781e-4de3-a4e6-da8e923a1294@linaro.org>
Date: Wed, 17 Jul 2024 11:47:04 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: qcom: dispcc-sm8650: add missing
 CLK_SET_RATE_PARENT flag
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
 <20240716-topic-sm8650-upstream-fix-dispcc-v3-2-5bfd56c899da@linaro.org>
 <dccttz5b44bl3lwmcaqz6wjx3n4sv3eq4yh6276vzwrtkcvqcw@qxhbo7bylnsg>
 <9ad10d92-d755-4fae-b206-6e8648be6d48@linaro.org>
 <CAA8EJpr9L+AKDhuHfQa=Nco7fvG9vLH3a+gxVhENrhz12b3n=Q@mail.gmail.com>
 <278354ec-532b-48de-8ee1-5477ddb4a285@linaro.org>
 <kxrhhb3vdojbnqfbwks2qmob55fwm3onleood73qfk6esl7g2c@q66kw5am4emc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <kxrhhb3vdojbnqfbwks2qmob55fwm3onleood73qfk6esl7g2c@q66kw5am4emc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2024 6:46 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 16, 2024 at 03:46:24PM GMT, neil.armstrong@linaro.org wrote:
>> On 16/07/2024 15:44, Dmitry Baryshkov wrote:
>>> On Tue, 16 Jul 2024 at 15:32, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>>
>>>> On 16/07/2024 13:20, Dmitry Baryshkov wrote:
>>>>> On Tue, Jul 16, 2024 at 11:05:22AM GMT, Neil Armstrong wrote:
>>>>>> Add the missing CLK_SET_RATE_PARENT for the byte0_div_clk_src
>>>>>> and byte1_div_clk_src, the clock rate should propagate to
>>>>>> the corresponding _clk_src.
>>>>>>
>>>>>> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> ---
>>>>>>    drivers/clk/qcom/dispcc-sm8650.c | 2 ++
>>>>>>    1 file changed, 2 insertions(+)
>>>>>
>>>>> This doesn't seem correct, the byte1_div_clk_src is a divisor, so the
>>>>> rate should not be propagated. Other platforms don't set this flag.
>>>>>
>>>>
>>>> Why not ? the disp_cc_mdss_byte1_clk_src has CLK_SET_RATE_PARENT and a div_table,
>>>> and we only pass DISP_CC_MDSS_BYTE1_CLK to the dsi controller.
>>>
>>> Yes, the driver sets byte_clk with the proper rate, then it sets
>>> byte_intf_clk, which results in a proper divisor.
>>> If we have CLK_SET_RATE_PARENT for byte1_div_clk_src, then setting
>>> byte_intf_clk rate will also result in a rate change for the byte_clk
>>> rate.
>>>
>>> Note, all other platforms don't set that flag for this reason (I think
>>> I had to remove it during sm8450 development for this reason).
>>>
>>
>> Ack, I think this deserves a comment explaining this, I'll add it.
> 
> But where to place it? This applies to _all_ dispcc controllers.

Commit message

Konrad

