Return-Path: <linux-clk+bounces-8221-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 039D190DBE1
	for <lists+linux-clk@lfdr.de>; Tue, 18 Jun 2024 20:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4785AB20EE9
	for <lists+linux-clk@lfdr.de>; Tue, 18 Jun 2024 18:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B04D15ECDC;
	Tue, 18 Jun 2024 18:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B1CnBC4l"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDF51171C
	for <linux-clk@vger.kernel.org>; Tue, 18 Jun 2024 18:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718736661; cv=none; b=BNI9Z4kKL974jFkKzWF7QomB5pAR7SOz7qYfQCoSaoknfZdlTMLr7d3VsTj5HcEDcXhpX4z17WwJBiEHbTGasWO41wvH4qNLNgERw4KvoO9N3BDJLdvDw2UiUZdU9GOZF4EcaxAtN+l/C87MGaJW4nhVXOSNBt4M2E8LcdTrv4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718736661; c=relaxed/simple;
	bh=NkHkzXa3IOCwA/bnH2ptoDEs9xXxwvdNDNIjWAKEBgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWUKGYFqPN/WeP4sHN+96uBIOVUOUkRoLTPErAwRdQTmmXdKrxVSVwcO4o+/MEfOMe3897As+/lmAn4fFoKDlN6gKHneTLwMflStvMqIjOfG7RrsWZctf7J11DuI4JBHD0xfoFQ8l6z3H36byJfl03pzxaN7s6R75zbTX75lLWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B1CnBC4l; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-35f2d723ef0so4862582f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Jun 2024 11:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718736659; x=1719341459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4NNuHMGJgaTKLiPOtfYsc30dpCZBTyvx+s6PAIySkOw=;
        b=B1CnBC4lv0uxVhTJbMMGvOs0BWMpAcBioHJ2pf2C56XX4fYvC27/QDtazMbHCar/ti
         /kjpXDCVZcgA3iRYgkIaDHEEdYrP3oD+smcGm85WdlfdoaLXgUjAGnUrKbLiA8hg5P6R
         +Jl0IeOt29DLT9UrjIieWa6Z9EgT340zxob6iBgrX7g8cYxCeZ4QXOKeQZVD/eELbsq0
         cIviw/Buu7wB9o708z3WKx9xr40FCnBMjvzHg3IU8XDIPHZKkI6LU9JZzoWqJvSPaH4D
         8jdP0z9r1b1nDK32Pwa2ABEl8jjHKR0vycOf9ORWyqU5pJ5KxdY4BOTUNJcH8XxxV2AT
         OXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718736659; x=1719341459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4NNuHMGJgaTKLiPOtfYsc30dpCZBTyvx+s6PAIySkOw=;
        b=eum5Gu2Trig7dZB2vnC+2/rqgDXacPDfPCPPYylYtQZqsqkYp7bchm8UNRvCLXaqWY
         ZBHGke3YDYAeeXw3rRDG+UvPUABqSlI/y+urp57HKgz/xFGA7KkH9kr54HgnihHuiOQ4
         BkINB+G4mI5oSlL3tFVJvJPSUxfXbjQaxbyZF6odbqjoH10Q2jBBb8DeQBZcW7Nto8m6
         d1W7XblOsz6aKnzkykGur+lbnEzd/iykTdCsukzg6yQ4KzW5DHVJ3ckN1c/+0i5n7z1/
         JEo6+K/XKKkMG+aLMZzUbCdN2oURlSjNegBg4zFDg44EyGmkT2YqPS2MS3rbpktxmfbU
         /ajw==
X-Forwarded-Encrypted: i=1; AJvYcCW9JwEwEdfs9mzr+7NdnJskEYGknefOV7vFpMy6UNyWWc1e80eHFT4ya8DDk9ADLqbVHxfl1ZBk63Wx5hQGc2G79zeN3LVw+vh6
X-Gm-Message-State: AOJu0YxVCgTabva389MNIxjjKtZbjwqyMN5GJ885p2zOixSnFeRyityo
	CX/vbnnmXoFMgkMQTOJ09qHepiawwGXZM3TUjboUXmgW3SoOT1T+stkUYSnVeOo=
X-Google-Smtp-Source: AGHT+IEQ5dUal8MlXaC9EXR+oZ5/RpW012l22b3onGYiqW8pfuRDA//boP9uvD07m2VUMQn/ucFrhQ==
X-Received: by 2002:a05:6000:8:b0:35f:e0f:69a6 with SMTP id ffacd0b85a97d-363175b925cmr328399f8f.27.1718736658756;
        Tue, 18 Jun 2024 11:50:58 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:5d11:7fa7:8997:f811? ([2a00:f41:9028:9df3:5d11:7fa7:8997:f811])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c8fbsm14732083f8f.43.2024.06.18.11.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 11:50:58 -0700 (PDT)
Message-ID: <ad04e203-4244-4cd3-9c9a-fae002962990@linaro.org>
Date: Tue, 18 Jun 2024 20:50:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/23] gcc-sdm845: Add rates to the GP clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 phone-devel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-2-e3f6662017ac@gmail.com>
 <wnf3mfgdm4p4f5wrxdtlx4wccnizdvohc7iiyu5t22eeb67r57@xun3r73hksrg>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <wnf3mfgdm4p4f5wrxdtlx4wccnizdvohc7iiyu5t22eeb67r57@xun3r73hksrg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 19:50, Dmitry Baryshkov wrote:
> On Tue, Jun 18, 2024 at 04:59:36PM GMT, Dzmitry Sankouski wrote:
>> sdm845 has "General Purpose" clocks that can be muxed to
>> SoC pins.
>>
>> Those clocks may be used as e.g. PWM sources for external peripherals.
>> Add more frequencies to the table for those clocks so it's possible
>> for arbitrary peripherals to make use of them.
>>
>> See also: bf8bb8eaccf(clk: qcom: gcc-msm8916: Add rates to the GP clocks)
> 
> Each time I look at the table attached to the GP CLK, I feel that it's
> plain wrong. In the end the GPCLK can in theory have arbitrary value
> depending on the usecase.
> 
> Bjorn, Konrad, maybe we should add special clk_ops for GP CLK which
> allow more flexibility than a default clk_rcg2_ops?

If we can somehow get max m/n/d values for all possible parents, sure

Konrad

