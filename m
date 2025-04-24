Return-Path: <linux-clk+bounces-21022-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D379A9B39E
	for <lists+linux-clk@lfdr.de>; Thu, 24 Apr 2025 18:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36EA31BA4565
	for <lists+linux-clk@lfdr.de>; Thu, 24 Apr 2025 16:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3F227FD68;
	Thu, 24 Apr 2025 16:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q+N+zlIN"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C418327FD70
	for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745511233; cv=none; b=LMrp3lpq/HDtaLqrVXcr/KMTeunTkWXS0CtXtOD1Li4oULgsRJNwNyb/OV8iDQNAHjVNm2+W72Ji+NnapTZ0Krnhg5npOcubLfS9JH4/hhLi95Le3u8Ucdwa+bK8fMUbxwWQ+/Ap2gtlctvRq06TjCSfWGdgcLMlJ3sYX3qAtY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745511233; c=relaxed/simple;
	bh=Dw+SKeV8qbpQrNo+aH6L+cZKLIRLMEZ5C31rjsazirw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m1mJa5JSyjuVzy2KtnjJ8VsTj4+ahlvrIVBNcNsPqhCaVQJETs6NvQOFtUJNl75hXMIBawwbKxebs5LPwxkLCQPEac/8NypljPkpzC/3M4vpV8MhmPfbwdPpPe82caANXxTNKr62gFU+dpq5j7GrbU5A7YvfopEQZLebZ7iU0nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q+N+zlIN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1efc4577so743761f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 09:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745511230; x=1746116030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xoqGBxqToQFbUCVFUs3Rhe0Fq/kgYP3j2kJdzJbbkmM=;
        b=q+N+zlINVknwYD7uAifplmEmpWWH0/d2c9tGpU3g3gr4T1Fm6EACpU5qED+CmUfQ3r
         qsuHeXXjppOXvh1VVxr0Y45m8jz+vOcaJhrZgARrb/gX2/OmishnKSTAKK6PbTQqqjku
         rFNzbfZQeOIDV2qhpjnp8E5ft55ViP+TgBpISl7ZBCNdzLyMIJ2JS4Toj8LLBqhSwWF6
         OXRLuEldmKoXVN1RSde1VV98EmlRvxIIP/hytIIqzrwKqurVHOsKzHd7d4aiA0vNqPM8
         IovEnTCyxIASWbpfGSHiiQocWYKrcVt+9CPWVQpEVln0HXnqKeQD5oOv5UVyjSNl6XDI
         Rr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745511230; x=1746116030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xoqGBxqToQFbUCVFUs3Rhe0Fq/kgYP3j2kJdzJbbkmM=;
        b=bUJpE/bxrjrzKUA9BDtCQU+ttIzHSXpT6MYNMliSSeetVWGDRt/3X+XS39Wo/6HUwI
         AhbOqkTK9e2n9/jt/yMFSRyJyP6QucxBKgkjjEd3AhL4BSkTooQvLZa3Tg1UdYan/QXN
         +0ZLAdQQBCnPyukcV+9vvfF3mo+qoh5Ydg6hZSG9ea2WMuFewZyqTh9UHCcEOBT6pvuD
         NZ6wd20Bhuk0HdIwlZ+qSzLEYfXeacmOjlZHyjXCUstPQ79PJ1FxF1bzwEIWcJGcWlo4
         ADdD5V1UD2IPGO+A6ZGnlQ5SQ3mfYXAPUVO88QA/u4q6raVjyswrBUA2dtZaeQNCB+PI
         ULAg==
X-Forwarded-Encrypted: i=1; AJvYcCXTiMXnDVYQQkbioU5xAcfQe2V1svQ528Mx/xJ0VP9WTjPaCWqu7pn5hC5gWCnHSwXQVC6pC8vp3Vk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHz9RxCd1d55h7alKi4ddV5NUcOaSc4SUwtgE7JKrv0lWTlw6c
	vGnppSTC1PZd0m603SHS2Z5ZOgDQHGRwL17HXUEVL8dpd69T/IIYU4tWpQVj2xU=
X-Gm-Gg: ASbGncvzpsfmdajE1+k/rThhHSNoa75LcOZsReHjMqQa4Ptj3JTV7PDPezdaTO3QMw4
	Zr9WsYakoNrgmGWSWV+cXLNXW6LpwQ47Xzn2SxXRgYq1d00MVKTK7mV/QePyFVyf2PJwj3GfUKK
	k85IQJ5vfCtoIu2dZVMmG8f19lsgMbMsaSQ6JAgjd8oqSY3VYRQFmhe+eEVXWx6+e19U5JFhXGP
	R4tPBc33c+dQcQgfURLtgszdkv2Unuz+txfRxST+6Xvw6xBTfePL9J/eBz/f2Rb4mzLqTuVOjXy
	jwl+nngQGAfnoRRM81PR1bvHjpA4DDlykkVj4PgM17mu/pr2OyFSLIPEXLjrICxDqm4GEuosjPE
	voGWE0g==
X-Google-Smtp-Source: AGHT+IHjGEtl8c4nNfdv63Bu0fnAs76LEcgQP5CuedFuXi7DkoDIBaKDKjRS1tXSKCPZK7Jmlww6rg==
X-Received: by 2002:a5d:6dac:0:b0:394:d0c3:da5e with SMTP id ffacd0b85a97d-3a06cfa827cmr2963860f8f.47.1745511230050;
        Thu, 24 Apr 2025 09:13:50 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54c4c5sm2512602f8f.88.2025.04.24.09.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:13:49 -0700 (PDT)
Message-ID: <d97194a7-2b7d-4a76-998b-92da495e8bd2@linaro.org>
Date: Thu, 24 Apr 2025 17:13:48 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
 <6a4ec36c-c003-4ce8-9433-8c12ed3188ee@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <6a4ec36c-c003-4ce8-9433-8c12ed3188ee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 16:54, Krzysztof Kozlowski wrote:
> On 24/04/2025 12:17, Bryan O'Donoghue wrote:
>> On 24/04/2025 11:07, Krzysztof Kozlowski wrote:
>>> On 24/04/2025 11:34, Bryan O'Donoghue wrote:
>>>> On 24/04/2025 07:40, Krzysztof Kozlowski wrote:
>>>>>> +  vdd-csiphy-0p8-supply:
>>>>> Same comment as other series on the lists - this is wrong name. There
>>>>> are no pins named like this and all existing bindings use different name.
>>>>
>>>> The existing bindings are unfortunately not granular enough.
>>>>
>>>> I'll post s series to capture pin-names per the SoC pinout shortly.
>>> How are the pins/supplies actually called?
>>>
>>> Best regards,
>>> Krzysztof
>>
>> I don't think strictly algning to pin-names is what we want.
>>
>> Here are the input pins
>>
>> VDD_A_CSI_0_1_1P2
>> VDD_A_CSI_2_4_1P2
>> VDD_A_CSI_0_1_0P9
>> VDD_A_CSI_2_4_0P9
>>
>> I think the right way to represent this
>>
>> yaml:
>> csiphy0-1p2-supply
>> csiphy1-1p2-supply
> 
> But there is no separate supply for csiphy0 and csiphy1. Such split
> feels fine if you have separate CSI phy device nodes, which now I wonder
> - where are they?
> 
> Best regards,
> Krzysztof

The main hardware argument for it is probably these PHYs do live inside 
of the TITAN_TOP_GDSC power-domain, which is the same collapsible 
power-domain that all of the other CAMSS components live inside of.

As I recall we had a four way - albeit long discussion on this in 
Dublin, you, me, Vlad and Neil and my memory was we would implement 
multiple rails in the existing CAMSS PHY structure and then look at how 
to model the PHYs differently in DTS.

The Test Pattern Generators - TPGs would then also fit into this new 
model for the PHYs.

---
bod

