Return-Path: <linux-clk+bounces-23146-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD262ADE589
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jun 2025 10:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A21D916F563
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jun 2025 08:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDC727F007;
	Wed, 18 Jun 2025 08:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hFNMK0v0"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B189A27EC76
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 08:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750235297; cv=none; b=mfgprM/AM+LEPIwCb5/we1HvumRmQWgEMCFlpUlkU6mGgTD2iAw768BRTsWNfyI7W9K3Eksw3UxMFbAZg0BHNRcyQL+Iyb4n8hnbGTG53neCV06UmlkVyvIMgfU7L05zQ0uw7i9wluZm3SX3H5vpbHTlr5zYjkTk9kJcyO+k8ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750235297; c=relaxed/simple;
	bh=3asa5TniM42B8mxsX6+ZKjpxOQm4wJdwzje+nMHfkEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tu12DVZXG7bppGJF7SQ91z1r0SASTm2T+RjjTELyZOvkmf8whuGKuWoFBvw8KFknfdTrANkEjFjNczM0OunIN0IPcbgZLMWss/mt08sH2fVOPC7bjEy8uJ4fJON/cORKLCBr/7IMeITrtnzYkG2HRaPpUqMyBd9M6ArH3XVn/+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hFNMK0v0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4eb4acf29so936525f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 01:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750235294; x=1750840094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dAB1KFolAhtJgPLCNg/mHV2FDuFjiwI4pqfdHMCq72I=;
        b=hFNMK0v0fKHMmVyXtAnNPxLNyFqbivuQbCIX5EcknQIj4sV2hX67FinNrd6dN7gcO0
         8rkIe0ZICmEbNVgSbZs/YkXFx/K/778jp+wtMnkypN19p1svyyEfdhIpPmfBzmgC71WK
         ZB1yOnrSIuJvy3eZ0EXR+ozaQ8n81jdN8A6gR+iynEXDs2D2VYz2llsGE9Z2Qj0i4Wbk
         NurqN2RVpMkruDODQd6EFF/eKi69JEZd6JsC+prEiY3RkflEsJskYSIMUGzrneI1Qy7g
         nmZU4jXZaAOopuvhYiSdUdn9pyJs2HIjNUTntFhlV5diP2FGRMzLQMUA0B4LV45e1dzN
         Dm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750235294; x=1750840094;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAB1KFolAhtJgPLCNg/mHV2FDuFjiwI4pqfdHMCq72I=;
        b=mdEUaeQe1fUd46dLZT6T6aWuR517WmqMWrT3F671dyC0k+Gcb90guZuvZ9VRjX09oO
         9B/WnSi0K2do3xjgjNnFqj48QwT3+OwJ81e+cUGpF4vHqoot4fU2sbA4fYG3IPbA6ns9
         WZnZyv2iRdoZ6fB+H3zEsBma1oo9UVGMMx9zsrXwcEMw32p+Rp8cuOBFwRTgA+sN1+t2
         +jXzKysmkq88kCWLoL8IO9SrP2LcXBP9xXbXRZw1ISITECH/Q0GYlQI76NMo5LZA7wQF
         74A1qH9NnR9ICRngCJEa0Bav2UoYMVM4wSJKxUhVhQTwUku7EH7XOp1Mt/DrXFbFAKsK
         g5aw==
X-Forwarded-Encrypted: i=1; AJvYcCXirohRK8weUdmAsbCgjg6u7qcLg/OB1WWThbBEFFU4KVW6otoQXqWGqK/dApqCcIyhTI4+W8q5LJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRqWwl8dRvaAb1jjFqbBBtiYxTauDaAsOWJingj3bEtcwYVGJ6
	P9PQgc6EQ08jRuxsQXULRaNlMdGcAiu7m2LPmF5632nhT49i0FtPG/MddOzxxT9BzO0=
X-Gm-Gg: ASbGncvFbBbB79CGTMY5BG8HNlY0pG9+NtB3sIZf4TD3mw50D1XDU3r9IDLPJe7hYWT
	ObIgdk9vIk2yQSW3moo1ThEMEA0Ww5XSH2YEHgezkLiBuY+Bc6QRXNbuQOBlIvMUd+FIDcqGbOt
	ec1nzXek6RrYtA0hmQ/ArnfLlHY7WbaRgqFxB8UAFERmbaE+P34X6adU6gADQwm3NDx5Ufb2aGV
	62jgtx03kVY4GZYhGeEUqt4Mup4ZhMvog5n0N0F5WVmJAmfFlidON99oCmBEl+8+oidb0yHfKtS
	oNQxXowLIFnZGbYAKZQ1T8pAB7Ex1cpbycdaYZKroEZ5Y2EbhgYe13ovi7gfEKo1fnFAakjI8Uz
	ji7HWInw=
X-Google-Smtp-Source: AGHT+IEprwipG9q6XIESI5sdRLoyTfDlnOgcmO3o69MyV1WWyhSo6jKYIfJfdr8pd/BlFyyUshJepg==
X-Received: by 2002:a05:600c:1c12:b0:43b:cab3:1fd1 with SMTP id 5b1f17b1804b1-4533ca487dbmr56926295e9.1.1750235294000;
        Wed, 18 Jun 2025 01:28:14 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e184724sm197066785e9.39.2025.06.18.01.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 01:28:13 -0700 (PDT)
Message-ID: <8a986ebb-5c25-46d9-8a2f-7c0ad7702c15@linaro.org>
Date: Wed, 18 Jun 2025 10:28:10 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/17] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-8-ee633e3ddbff@linaro.org>
 <n5djafe2bm4cofoa3z4urfogchhfacybzou763nelttgfspo25@bywfd5febe6g>
 <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
 <738a889d-9bd5-40c3-a8f5-f76fcde512f4@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <738a889d-9bd5-40c3-a8f5-f76fcde512f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/06/2025 16:04, Dmitry Baryshkov wrote:
> On 13/06/2025 17:02, Krzysztof Kozlowski wrote:
>> On 13/06/2025 15:55, Dmitry Baryshkov wrote:
>>>>   
>>>> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>>   
>>>>   static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>>   {
>>>> +	unsigned long flags;
>>>>   	u32 data;
>>>>   
>>>> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>>>> +	--pll->pll_enable_cnt;
>>>> +	if (pll->pll_enable_cnt < 0) {
>>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
>>>> +					  "bug: imbalance in disabling PLL bias\n");
>>>> +		return;
>>>> +	} else if (pll->pll_enable_cnt > 0) {
>>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>> +		return;
>>>> +	} /* else: == 0 */
>>>> +
>>>>   	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>>   	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>>>>   	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>>>>   	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>   	ndelay(250);
>>>
>>> What is this ndelay protecting? Is is to let the hardware to wind down
>>> correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
>>> by dsi_pll_enable_pll_bias() in another thread, which would mean that
>>> corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
>>> without any delay between them.
>>>
>>
>> Great question, but why do you ask me? The code was there already and
>> MSM DRM drivers are not something I know and could provide context about.
> 
> Because it's you who are changing the code as you've faced the issue 
> with recalc_rate.
> 
Heh, the answer is then: I don't know. I think authors of the code could
know.

Best regards,
Krzysztof

