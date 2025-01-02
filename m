Return-Path: <linux-clk+bounces-16563-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C8E9FFD4A
	for <lists+linux-clk@lfdr.de>; Thu,  2 Jan 2025 18:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F9D07A15D1
	for <lists+linux-clk@lfdr.de>; Thu,  2 Jan 2025 17:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1A41B3952;
	Thu,  2 Jan 2025 17:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BomG9JDS"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504821ACEAC
	for <linux-clk@vger.kernel.org>; Thu,  2 Jan 2025 17:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735840685; cv=none; b=aRutW7vwLZkhcTYcFN/0oziiT2eRwux9AOHmxlekhlrBRcQdE4/W/P9llJS4GwabyjOJ+EfLfHqWfM56RNfmC3NqRb8Emq/qM6uxcYiZcR6uME10bPwdcT3yHO21K0dhy2vTxHiuN0r3mFp6rYXMV3TD8wI2rmlmJJMZXCPfucM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735840685; c=relaxed/simple;
	bh=70wPxSyGoP1AIDAlE5kyW2D9wBgD5qtMuvxi7M6K9L0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZuzzqBDoPck3VV9ebQTXgyoI9H05BfeD+g4M3DAZ+KcdRKEfXtWr3w+tbfYzCnnu0iTxfaC4PwcyKAytrRaUh0oq4mdH04kidyHftUmuisa+AasUEJ9CLMBejrsRMirXYOgCrjiXCuSDXuPt35aImK/6n23SyTGhdGStfEzLSIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BomG9JDS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43616c12d72so18874085e9.2
        for <linux-clk@vger.kernel.org>; Thu, 02 Jan 2025 09:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735840680; x=1736445480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tCngGj3ERzx+kGRd3Llf5o6LEqqH/9Whmo07Um1JaOU=;
        b=BomG9JDSyu52J9S4FiPl+ABC3au+K3EEbW8Vx2OlEK8uuZcYz8ReZPWflc40FWB7PJ
         Q+x5wH1dG00mt7Trpm53yh63usv4ixlqXUdS9yere4yBnKnJ1pa/OxnXqu4AcmDQfunC
         NQs3zYbVq9QaY1ir3IB6F6bcPU9DznZUJe3terIkhmwyT3OuvZpYnUD0pjlBZ05daHEe
         2qshQkv8ECDE/zV3U5ctC5u33aukrq36113HiQC7/NRQyV6sw46ViVWzsfbtXKzMwdNl
         1x8m+zHQSrOUP3zwS35EqvBCmgrr15lUmgBYP0FvZITFzAgTcxOeh/FPmOtGHvDI+Jec
         pt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735840680; x=1736445480;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tCngGj3ERzx+kGRd3Llf5o6LEqqH/9Whmo07Um1JaOU=;
        b=UTqIzxYag6S7SCeqVIfG18g7J6fwU3ZahzD3Ul16dWwByd8eyQ8TxyS9JAuk5Ouwko
         FJPl6YZ1coUFJG+G6CUq6P19q92fFN5O2fndlabjrwoMpBIELpU8vBBcT0KuU2myotJm
         SL3khqEoyDGOj+72kv91JlddNj4Itz87hBFc5cm8uGBKrEcWpK2Q25xmjeqqVAQrVBsy
         3gy9yViJxrgAqRloqgcm60WE5lZM/XB+9/hsFTsSuKEgZTexBwNt75V1vW98xxqGon9C
         0cFVFwlz2DMrTWB8aC53WVt6BWWSZTWjsqyE6rsH4H07lNb/Srb0vU88OeIllyLaT15H
         ay8g==
X-Forwarded-Encrypted: i=1; AJvYcCWiypMquClEqTrS/x1KJlyF18rljvAlfxD48fIyCk3qkB31TXLt638/to3H5HOu9MyXMOqASdVeVhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbWOaE4CJwxhjL0xi/JKzioepw6v2VDIR1Utc2HOI7itG8oV3G
	sx98G2zhUw2N3f2ONY1Hhb/b4cj7pvatNONc704WWDXMEkNZ3pNjnCQPhTB8Gk8=
X-Gm-Gg: ASbGncuDvFsZu2VqSTOLlbIQX18erXHG/PKqSFrsK6ZXX9K4hhtQksqHqDXHSCttk8F
	7D/PNLx9VZq3UyJ/FMS76rkbcmrYsc8RpqMP6TPei5GGtHSP0u+Ca83FZVgDgOhApvQFYLo8FSo
	malffkQYjZrp+Vi6aytTweo9TmRF6AbEMPKyjj+xTBrryHyfWkdKIvJSv2CVw/HB0SqXTMEoWkx
	gHR1iq0JcOQdHArQhfFnm72V5cIQUW3LFkoR1gCnMysy6kU1t0lhwGEOvvWmx5kZHbgV8Xe
X-Google-Smtp-Source: AGHT+IFgkYrJOCTXgJymqCv1qh1ladO5Vd6MkMz8g2qcOcczFLlXadnGD88iWWbyvyZwZM17zNXKOA==
X-Received: by 2002:a05:600c:4e41:b0:436:1902:23b5 with SMTP id 5b1f17b1804b1-43668b5e060mr158353075e9.4.1735840680579;
        Thu, 02 Jan 2025 09:58:00 -0800 (PST)
Received: from [172.16.0.204] ([79.164.49.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661289995sm456989895e9.36.2025.01.02.09.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 09:58:00 -0800 (PST)
Message-ID: <a017543d-a27e-466e-bf51-9eb7e70ab215@linaro.org>
Date: Thu, 2 Jan 2025 19:57:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: x1e80100: Add CCI definitions
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
 <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-5-cb66d55d20cc@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-5-cb66d55d20cc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 1/2/25 18:32, Bryan O'Donoghue wrote:
> Add in 2 CCI busses. One bus has two CCI bus master pinouts:
> cci_i2c_scl0 = gpio101
> cci_i2c_sda0 = gpio102
> cci_i2c_scl1 = gpio103
> cci_i2c_sda1 = gpio104
> 
> A second bus has a single CCI bus master pinout:
> cci_i2c_scl2 = gpio105
> cci_i2c_sda2 = gpio106

I notice that the change assigns "aon_cci" function to gpio235 and gpio236
pins, and they do serve as cci1_i2c1 sda/scl pins, thus here is the second
CCI bus master.

So, I assume the commit message is not correct...

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 150 +++++++++++++++++++++++++++++++++
>   1 file changed, 150 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 5c7b0c048d41a4ba3d74bbf77216ad09b652ed30..97ebf5596dfc3caa920ef85722ca8afd49cd3c24 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -4648,6 +4648,84 @@ usb_1_ss1_dwc3_ss: endpoint {
>   			};
>   		};
>   
> +		cci0: cci@ac15000 {
> +			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
> +			reg = <0 0x0ac15000 0 0x1000>;
> +
> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "cpas_ahb",
> +				      "cci";
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci0_default>;
> +			pinctrl-1 = <&cci0_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci0_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci0_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		cci1: cci@ac16000 {
> +			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
> +			reg = <0 0x0ac16000 0 0x1000>;
> +
> +			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_1_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "cpas_ahb",
> +				      "cci";
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci1_default>;
> +			pinctrl-1 = <&cci1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci1_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci1_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>   		camcc: clock-controller@ade0000 {
>   			compatible = "qcom,x1e80100-camcc";
>   			reg = <0 0x0ade0000 0 0x20000>;
> @@ -5271,6 +5349,78 @@ tlmm: pinctrl@f100000 {
>   			gpio-ranges = <&tlmm 0 0 239>;
>   			wakeup-parent = <&pdc>;
>   
> +			cci0_default: cci0-default-state {
> +				cci0_i2c0_default: cci0-i2c0-default-pins {
> +					/* cci_i2c_sda0, cci_i2c_scl0 */
> +					pins = "gpio101", "gpio102";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				cci0_i2c1_default: cci0-i2c1-default-pins {
> +					/* cci_i2c_sda1, cci_i2c_scl1 */
> +					pins = "gpio103", "gpio104";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci0_sleep: cci0-sleep-state {
> +				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
> +					/* cci_i2c_sda0, cci_i2c_scl0 */
> +					pins = "gpio101", "gpio102";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
> +					/* cci_i2c_sda1, cci_i2c_scl1 */
> +					pins = "gpio103", "gpio104";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci1_default: cci1-default-state {
> +				cci1_i2c0_default: cci1-i2c0-default-pins {
> +					/* cci_i2c_sda2, cci_i2c_scl2 */
> +					pins = "gpio105","gpio106";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				cci1_i2c1_default: cci1-i2c1-default-pins {
> +					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
> +					pins = "gpio235","gpio236";
> +					function = "aon_cci";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci1_sleep: cci1-sleep-state {
> +				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
> +					/* cci_i2c_sda2, cci_i2c_scl2 */
> +					pins = "gpio105","gpio106";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
> +					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
> +					pins = "gpio235","gpio236";
> +					function = "aon_cci";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
>   			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
>   				/* SDA, SCL */
>   				pins = "gpio0", "gpio1";
> 

--
Best wishes,
Vladimir

