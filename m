Return-Path: <linux-clk+bounces-20995-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C40A9A87B
	for <lists+linux-clk@lfdr.de>; Thu, 24 Apr 2025 11:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CE1E7AEE35
	for <lists+linux-clk@lfdr.de>; Thu, 24 Apr 2025 09:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDEE425744A;
	Thu, 24 Apr 2025 09:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sh38oJ8H"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD9C255E30
	for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487259; cv=none; b=ove/qS8Sn2M/S1BCzJ6S+Taitic6vgrehW69BBZS9voorkj6E/X7OqC2yhKzn0KZhvssmVX2ou8w82faGmiL+HFcMytVIIJGOFYXZghWem5z3T2keopmtW5F2iglelpEjiRaOeu7KT5GU6yANonN/0IEciZWQJxwEDrY2GtjCJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487259; c=relaxed/simple;
	bh=W2UdDM9Gz5lK2YImWaOi4sawa1oA0xKXY9iJZEb34wU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pQVhAwxBUW+i5UJ9AasJNXer9XapchL7tZv37r8FiA41dUPYdSo/rSOH+KEGGTdKAR9xrtnoGXddhJiVA5sC2lQAxaNnlmScAyf49dy0chQhoxfd5c7hZL726xsB6UKEXk+PeuSkcOEOuhkLcTg3qpMIqYetbu7nu7mUJmsz5aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sh38oJ8H; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-391342fc0b5so577620f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 02:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745487256; x=1746092056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VtiMeBtG7DKFIw/MlZYPyAoFtecT0rBQL9R+KBs9yMk=;
        b=sh38oJ8HTQdcmD6Kl1dDD54+5NzOLoLVvGiC0pMAp3KIgu63cTY67XTGc53J6wHumR
         Mk8uWVJeftnvaDVNCdmIDjgjGt/eKnnxrZWxShWTTBd1q1NU3ON7ek0mOMN0vvBiN4sj
         2hn3wNf5ydBJHG1e5aY64C1jxRxOSOmoWbtj/1vqH2Eup6L3g9cAKiSGM8MSzzmRnXAX
         PM2Os5RjCBQ+ow42ovTFVUlkMNTDY9Gt4NwOOBVkUFBSJfgz27W/gGsiFwJcolBwjoRh
         yyutPLKTRldJ5ZjHeKo/tPD1AVAmEVTGZb+WzNxuGjlgGasykl3RnJAVcXueWZqcOJu/
         5vOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487256; x=1746092056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VtiMeBtG7DKFIw/MlZYPyAoFtecT0rBQL9R+KBs9yMk=;
        b=ln586Z4FFiowtVowqlyKsCuhIQq8QT4tWjgzWGPiXDSb4RLgNVv/+4Lkx81rrg6QFs
         lRWTeDhCq5HXbvrK63dtR6yYSlGqVz50pG8Jdun+i7rI+dY3uERmQPXgi1CmFmiz8ORo
         3Y3rkm6y8Uw5Sy1IeF0AY4Y5eXof2RoL1BXHR9Yd1i2UQu3YwojN9cbNVeQkMShi0lu/
         DVqpw4FhdMmR9IBVwJM9nNsl6iSECf3UnQMLO0bB+e7i84NLtqdZ/52oCTvKAUV6pMMC
         h+CUfV2TnOR245BNXxtBlSAyMoYtl8U8ad1s+BptLQlmE6TceHQGmH85LZBIUj81ar4W
         FLig==
X-Forwarded-Encrypted: i=1; AJvYcCUyhY6oYdnz0xHZQ9ZxcgILlSiPCt07FARLmyp1FDdW+Un4X7QOkOrm4FnCNB8/vPRXtwRnNLO3tk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXv0w98Nw1w1CS7kAhcxIHRInF1JydhOZb7C05llgdHT/i89+L
	6Mntb2w3J/rIOShNHKN7ALaUNH2HeK63zD7pKo7LRMVtz8xy9x3AEMiEl3fhudA=
X-Gm-Gg: ASbGncuPW9ppf5csE12zSn4vnWtlqlCB7lhOBPREYNcRjKfbFCfIByHe6SCyGr/Kz1C
	vhWIrZSTw3sRA+g0JtgkknUIUpWyWrvLlGdbMfi9MqnOFQsh4gKITtM3+//qRyvtlhc9dUeot0M
	iYGchOrlb7Fs98OqUrSo9TIzKgHzEC4lbYnw6SuZecGhnjpF/Wl0mksMcS8OpfCgmZkx58lFQKv
	sew5sRxeTYYl9xC2WH/u2VIVqpA6d82WlRqxBa69YvuSSV7KTJMKRiXr6Wlj0YLU6yyjdUobguh
	lRFS+zJH9hHjJDPYfU8dOUYWDfkGs4uTTNIWSl3CeUst1kSMm+DLLhuSMFizGf93PyK5IemWO9l
	DSWmvCA==
X-Google-Smtp-Source: AGHT+IEdBmL2+QOX0Fby79sdwrm+D04fNRL3vM33gjqGvaPB6uAl38Q5X0016d+zpuDYUabB6o/lJg==
X-Received: by 2002:a05:6000:4008:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a06cf4b575mr1650020f8f.9.1745487255883;
        Thu, 24 Apr 2025 02:34:15 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ea48sm1476432f8f.94.2025.04.24.02.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 02:34:15 -0700 (PDT)
Message-ID: <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
Date: Thu, 24 Apr 2025 10:34:14 +0100
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 07:40, Krzysztof Kozlowski wrote:
>> +  vdd-csiphy-0p8-supply:
> Same comment as other series on the lists - this is wrong name. There
> are no pins named like this and all existing bindings use different name.

The existing bindings are unfortunately not granular enough.

I'll post s series to capture pin-names per the SoC pinout shortly.

---
bod

