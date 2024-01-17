Return-Path: <linux-clk+bounces-2509-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A067830933
	for <lists+linux-clk@lfdr.de>; Wed, 17 Jan 2024 16:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7093CB21CA2
	for <lists+linux-clk@lfdr.de>; Wed, 17 Jan 2024 15:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17BF21347;
	Wed, 17 Jan 2024 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IoFWo24i"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275E92136A
	for <linux-clk@vger.kernel.org>; Wed, 17 Jan 2024 15:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705504113; cv=none; b=Ei7BcdnZOmRrdusBRn+G1bQ1fwTfCv2bYzLoMUSSkgVuNgEUC8r9guvRvb+PtRp/OUg7ilFXbjLY93r/10dalBWlSGbLLFxtRDW91VomxMYXyrMlNTRCPq6z/FMHF7N0+MgpQfjtDZ+iWFJaug2M2K0xF54Qi69/UzyK1D3jziU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705504113; c=relaxed/simple;
	bh=i3U2j7vOQbkMVl1sDwVpugX13EUmGtzhct0T+w72pZY=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=kOjMHrj5B0qPgl1BsQ10MxgiXvZyem12iA4Z2IJ0dLFarwJXgBCkz27dY3gctWo02ZPYmwmyB+YQT32VxiRd7RbhxwS6x2GQu+a1GH/K2ySOQqFHP5y3qL/+Djq/1/V4tV9duMs/u36mjTxTwBAxLo3ANm5tbGqI7BcLX1UWkm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IoFWo24i; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-559de6145c3so674103a12.1
        for <linux-clk@vger.kernel.org>; Wed, 17 Jan 2024 07:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705504110; x=1706108910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kkGmMglMSGi1Tk3tWRTcLr5B6FcpdYBkxOQWqzkF1BE=;
        b=IoFWo24iaR3hQ1M4rgyN5CUsu5s6R53Or23kOcZeAqzVW7oNlFjA5XnUV8PwNRIvHG
         fnOQ4jCWvvy1V916ykLmXv3PU0TUahEAWNR8cHwtFjtlWZdWCQWiqJmplSU2RjG8fWyf
         +/rqkP2yLXHal/9HxxftrMD+exN4LhtmAemTVy5hwtJmKQDCFevaJ3zJWw2/XuczMeOy
         WfgjzYUrAtKRKhDE7PeiCZRGNetHh11E/maAf3ROqiMIy32B0hZoMl92EOkUkJXZ4iI/
         1Pfhbpqka0CjaMpqrs0ttbi+wG/PdGC6yjOwUFkZxkArZz+WhKKt13ME1m+f1Z6ruR3i
         EQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705504110; x=1706108910;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kkGmMglMSGi1Tk3tWRTcLr5B6FcpdYBkxOQWqzkF1BE=;
        b=o1XAIB6qUlBLhNDPqLHPaABrNzY4qbgizAPhPwZ4itpXrO5vreOdM2dFJTH3Nb/Ag/
         ZB10B/vWUJDxsRBtqf2ttOccNM3OKnVc+7ruHhUUwTq3JwMRL/W249FpBY2SlMCAIv0W
         Jgw7rgtDuuY44aI31f+wIiDeCmL3rHaBn4l6tMnj0ZxYCIMjzGduJsQBUwewWtPUgnFY
         LQjWxmQ9xy/fW96SN64209PKK3HuHZepF1LwsYYOx57Y9+A3wN4cwCDdkY4nZoBt0jvQ
         B1Wrw5YAwOT15Fw6ZXsyUPB9RsCWelCjlqK2T+3Afa0EB3sAhQJq672sa20VKJWOCFje
         JHZA==
X-Gm-Message-State: AOJu0YwZEod5YcvdsAW1FSczAi1dwBr+LAs9YkMu8BIwsSpCUsKgimqB
	xtLLzLHKqigdtWglePzYpZ+bDHwjeg5Iyw==
X-Google-Smtp-Source: AGHT+IFcr+ez01bxt2+jBCE1HBgBtrHmVB1u3dibyd63ZbwxzQ93NvPhsVzA0lDEagXIip7zsb1ZPA==
X-Received: by 2002:a17:907:a08f:b0:a2c:b0a6:8ab with SMTP id hu15-20020a170907a08f00b00a2cb0a608abmr5384441ejc.7.1705504110276;
        Wed, 17 Jan 2024 07:08:30 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090608d300b00a2adc93e308sm7838583eje.222.2024.01.17.07.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 07:08:29 -0800 (PST)
Message-ID: <c72ca8b2-55a6-4ec7-8013-0a563d6dcdfe@linaro.org>
Date: Wed, 17 Jan 2024 15:08:27 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] arm64: dts: exynos: gs101: define USI8 with I2C
 configuration
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: peter.griffin@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 alim.akhtar@samsung.com, jirislaby@kernel.org, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, andre.draszik@linaro.org,
 kernel-team@android.com, willmcvicker@google.com
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
 <20240109125814.3691033-12-tudor.ambarus@linaro.org>
 <CAPLW+4=U9DBmwgxyWz3cy=V-Ui7s2Z9um4xbEuyax1o=0zB_NA@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4=U9DBmwgxyWz3cy=V-Ui7s2Z9um4xbEuyax1o=0zB_NA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/16/24 18:03, Sam Protsenko wrote:
>> USI8 CONFIG register comes with a 0x0 reset value, meaning that USI8
>> doesn't have a default protocol (I2C, SPI, UART) at reset. Thus the
>> selection of the protocol is intentionally left for the board dts file.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>> v3: reorder usi8 clock order (thanks Andre'!). Did not make any
>> difference at testing as the usi driver treats the clocks in bulk.
>> v2:
>> - identify and use gate clocks instead of dividers
>> - move cells and pinctrl properties from dts to dtsi
>> - move IRQ type constant on the previous line
>>
>>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 29 ++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> index 6aa25cc4676e..f14a24628d04 100644
>> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> @@ -352,6 +352,35 @@ pinctrl_peric0: pinctrl@10840000 {
>>                         interrupts = <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH 0>;
>>                 };
>>
>> +               usi8: usi@109700c0 {
>> +                       compatible = "google,gs101-usi",
>> +                                    "samsung,exynos850-usi";
>> +                       reg = <0x109700c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK>,
>> +                                <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&sysreg_peric0 0x101c>;
> I'd also add samsung,mode for the "default" USI mode here, just to
> avoid providing it later in the board's dts. But that's a matter of
> taste I guess.
> 

USI8 CONFIG register comes with a 0x0 reset value, meaning that USI8
doesn't have a default protocol (I2C, SPI, UART) at reset. Thus the
selection of the protocol is intentionally left for the board dts file.

I wanted to emphasize that USI8 doesn't have any HW defaults and its
mode must be chosen by each particular board.

I mentioned the same in the commit message, please tell if you feel it
needs updating.

Cheers,
ta

