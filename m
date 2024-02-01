Return-Path: <linux-clk+bounces-3224-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D6E8456A8
	for <lists+linux-clk@lfdr.de>; Thu,  1 Feb 2024 12:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F35F2851CC
	for <lists+linux-clk@lfdr.de>; Thu,  1 Feb 2024 11:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640F915D5B3;
	Thu,  1 Feb 2024 11:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="evldtosh"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBC315B995
	for <linux-clk@vger.kernel.org>; Thu,  1 Feb 2024 11:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706788609; cv=none; b=mw5tATdp+8NMy6Bp+2tErcQiOUvnpPEaYswd3ctufA8x90C5DZVbLEzBs7Uo6mQ5kxeenW/86cTAXnIQ49G/xfEPNMh06/VFzNWFLns0t148gvFx4CAWArwDuVhszlBeNVRG2AuUh3CAz+CnAsvFYqV+nJ6OhCA3sPi7GjpFbU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706788609; c=relaxed/simple;
	bh=RfmXQyvEyel69xPdhImaszos039ws3Lu/IQlwJQIF3g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Aw6nYx9F1dFEe+pdasmgCHdJ9j0rTYT7mFMR8/hPsihcMjMZkBTlbeTa0Jv3TudVXhhiMH3+v/JkDu4/mLRMCmB4GpFBTZz+gJofiYq9NzGvuog743yhJ45v/nD56VTPV2eKQu4xv0CPHNJecXG8lHbWH47Edus19UIeB9m94rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=evldtosh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40fb3b5893eso7277645e9.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Feb 2024 03:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706788606; x=1707393406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UzaWP/6dtk16YfMVdAvaDfLCxRKNmuhmg2gmErctQc8=;
        b=evldtoshW45feD2aPb3OoYeqnFY2GG4gHjyEAeHCZf1bIdHal9vqOr8PcPTGVYEHZo
         WUMsM3kgtKbLZV/H6Gw1CquJoDP4jB5iUkaMLCpczB7TYVInXofmg162yIsTutfi+yV0
         IaGZyUk2pP7YYzBxnDKVVQbRzsfqJ/R3cXY6w3nICiU0KpBcEr+h5pRRU/g1ss7Adk45
         bLDiRIxh4ac0bkKrS5/ZeIcSgThMKzww0HKPSqbgbeueOfERToOc2EUKll0XAHc+OXJG
         YO5nUm5C/ErAaws2IDc6trEDW86HxbMkKFbGrY6PCdEFLuvui87MG5KqpQ2iHQsr9XIY
         iUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706788606; x=1707393406;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzaWP/6dtk16YfMVdAvaDfLCxRKNmuhmg2gmErctQc8=;
        b=CoSTbvAzZv+w61rFgoXij+eYdWD0Jp9/UcnFS79TptxhJVfBlQOWhlJulXQx4i2i38
         GjPU71Ycq6j9yELBd+F72dwYsX41WFAFUCtyrCdOCbfo2sTMLMMW/ynlCVBFaXfNST55
         Qwfm0CC2VdzsRVM0Ny4JMSvg0LrJkUhlJ9MdPfB2NDi5otPc12lvM6tcOYn25fYwbNpI
         Kty0g2wcS176owwG8eVWYDSG3OMyNsGj4iL03nudOP6klkFdcIHhUp06ONtr3QDqEPpV
         BDh1rXV61NyqqfHAm6CdCEek0aiYXJFr3gJitt4PfMWxNGY5EvFCNOtN4gjzZSL+zAQN
         NQzg==
X-Gm-Message-State: AOJu0YwG+WmyDTMqGefViATXDWFXxVJraRJWQfp+6m2PaPpK48EBJjE8
	eIr1md0/7Ndfx+F3wRCHp6wdVFQBiCwcZYAUm+B5F6saYDES2/AUj/+SYavPTcs=
X-Google-Smtp-Source: AGHT+IH3xQv15i/rUEPOTbg1xkEyQ/z+dTi//c+Mo/pC9to5fm/kXZccoS2X8OLxv+GC/rXP2Zn1VA==
X-Received: by 2002:a05:600c:1c06:b0:40e:46b6:bc48 with SMTP id j6-20020a05600c1c0600b0040e46b6bc48mr1586219wms.41.1706788605859;
        Thu, 01 Feb 2024 03:56:45 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUSbCo4GSIJ1EQ1Lh5Gndw9BXaoOrip1LEEj+lfkbP2EfE33NOZRz2cNqppVBEzOouSsaqfrqyuZy3fRFCSATxZdil1v/qESdp3mxpdptGNsjnuyjlpdtH2eyuT3mL7xDifDMQMd+JlYOlA+VJStnVmd8xq1yszvx202pCmd5HqfBG5QOt4oIdsn07ZC3+Cdc98tOzRZVC4Cc5GA4ra3dNADbxtBAyV8e5Ns7RyRSeOlIzKylhmaKfjjh63U5GfF9wBi8xHkE3CO9hdT/olr8y7geZ/tggYHQKRQHVn1gL/uS1ib0sDvrFoNx/iZCMlMCqheIxRFzzZBWFkch1JMS/Xvb+PzydzGxH2ELstLlpOhTPIyuLjQGGZ4iKuU+aVT11rq3RI4aOHxiFdwwh1s2ry/xSvZ9GxsSk2Ubb/u8ZwsKllCjnVDFN2D5gxuJLJ7tTUCBytUTxP8b+eZpbjhLX5bMJcMF1nQV+fi8V4Zd36pg==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id e6-20020a05600c448600b0040efb490814sm4141897wmo.27.2024.02.01.03.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 03:56:45 -0800 (PST)
Message-ID: <4c2c425b-3ddd-4484-98cf-3f7768c94e82@linaro.org>
Date: Thu, 1 Feb 2024 12:56:43 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v2 3/3] arm64: dts: exynos: Add SPI nodes for
 Exynos850
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240125013858.3986-1-semen.protsenko@linaro.org>
 <20240125013858.3986-4-semen.protsenko@linaro.org>
 <170678377409.179918.13077326172475089482.b4-ty@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <170678377409.179918.13077326172475089482.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/02/2024 11:36, Krzysztof Kozlowski wrote:
> 
> On Wed, 24 Jan 2024 19:38:58 -0600, Sam Protsenko wrote:
>> Some USI blocks can be configured as SPI controllers. Add corresponding
>> SPI nodes to Exynos850 SoC device tree.
>>
>>
> 
> Applied, thanks!
> 
> [3/3] arm64: dts: exynos: Add SPI nodes for Exynos850
>       https://git.kernel.org/krzk/linux/c/98473b0d78caa5502b7eee05553ee168f0b0b424

And dropped. You did not test it.

For some time, all Samsung SoCs and its variants are expected not to
introduce any new `dtbs_check W=1` warnings. Several platforms, like all
ARM64 Samsung SoCs, have already zero warnings, thus for such platforms
it is extra easy for the submitter to validate DTS before posting a
patch. The patch briefly looks like it is not conforming to this rule.
Please confirm that you tested your patch and it does not introduce any
new warnings (linux-next is decisive here).

Best regards,
Krzysztof


