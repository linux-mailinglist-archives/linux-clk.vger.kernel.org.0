Return-Path: <linux-clk+bounces-15948-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCCB9F58E8
	for <lists+linux-clk@lfdr.de>; Tue, 17 Dec 2024 22:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AD09189490A
	for <lists+linux-clk@lfdr.de>; Tue, 17 Dec 2024 21:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2795D1F9A98;
	Tue, 17 Dec 2024 21:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pRZYdmPS"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EF418A6DB
	for <linux-clk@vger.kernel.org>; Tue, 17 Dec 2024 21:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734471275; cv=none; b=C5ccRcJ7WSAMZviNcAphF4dmlAGcE3QuwNLtOggcUR2FRyZ63RmACQarr1Qj3szIEmyCBlvd0e2sC5zT01LVYzgMHsYe55VtdBEmcOTtq1+UYFyV617eCeFPcVXKy5rmlM2d88VbQCzo7jClEE6fYYZ2DgvlBb9T10/lQ1+fF8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734471275; c=relaxed/simple;
	bh=cHIO1XSngrpkmvX5f69LWaZ1c6D33Eq8i4jV4q9byt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLITSk7kxB7gOq2+XIzGCsFMw3Wy0cErlLiZJxDk0JIeyrkSd8QPksQ22EnVbv2x/Vu13aCE0y+SgKmKuLQIBTwqyJ3BXxcPl+hPDXzxZ4qTmG/2JIqyQi15peuVBnTGJcvJIG+IW68sq2WOdDlErT5sA3eynjlSQBzjkuo2Bmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pRZYdmPS; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54019dfd6f1so772320e87.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Dec 2024 13:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734471271; x=1735076071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xzn2Zz7RYqNAiywY0xlzFtA0UHcUhTcOGHCY2jxNuME=;
        b=pRZYdmPSqIkqDU/czxO3JwvC0/ri9TJsiNcd8f3mwbifH1Zax7OaA233OtB84n9MRf
         ibA8bSQEaF7Eio+WUfWHIuL97/ceQSFRU7BecLITHTtDQ5sIX7N+kKOk3ldXsJQ1iA7k
         gMZIv64MDjZf91PfSxJpaY4VfAxLVL0uWcGBqQzWY/21e2VGI7BwicXo0e3sV+e4LeLj
         baC6K/roFIZBrtqEgW4mlwYwfeUYzVof6gU298D/B7QzMcuaGTQUw3R0z6fuvOKYX1g+
         W9s3IBR40U03faYRwJ9DxQc1ViSiwAfku/tGQADQRjrtFoQggDB0+gqCJSXnJodD8a62
         TK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734471271; x=1735076071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xzn2Zz7RYqNAiywY0xlzFtA0UHcUhTcOGHCY2jxNuME=;
        b=Slm+41LMajOWPuAycRfI+mLGpVZOmaRPUUZEPId7XZXi9DQ2sUAh/DEX7P1zDNMo61
         DPLt+cuAghYbwPsigfpMwrOmQ74cgbGuGlp7meJkX9JjAGa0z6WxMyeWNjuuX6N6jmgo
         coi9yL8EInAyrgpopDqyilvO23RLWtHXk2VSdzYRKMerf5Bmbshno7gSF9R79/zkSkls
         AKXBIF0XTpSNQfRhAFQTH2gIH7FzzxI/vDi8AjqInaAFlDfUw2cG8E7HjEa4idGlbDJ3
         E74L9eDhzgG2jyUjUgUtmb74InM7YxkdtMzPaE+Ttgiq+41oDnzGyccUvimT5/cTvE+N
         PV4g==
X-Forwarded-Encrypted: i=1; AJvYcCW5IR84FkKHuP2tiqqQ57NfhG0F6RU5pMZuvi1LJar3Kte5UJsMNg8SBv/B3Nn2Pv1uwfctcKcj44Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZm9BvF1PsEz8MTmGqqVlmg9BBeuYeV3rs4Bs+AUz8BMjl9yHa
	iDiw4ZXNJjUD9w3wn/37NpAoLskGp3bi/ZzftlzFCSIOGJi4mQWx0+SQ+9z/g88=
X-Gm-Gg: ASbGnctvRb8SAUSR9qZ1m9TnreEy3CsCAay4um3N9jm/8aq6tkJR2MzaVLMelIeg4X6
	TiprVICCklIbF6jiahVsn8dMnjsXGMEDPTPwv6+s2Cl46ohDbyKJaAWa2v1aL3qiwvxkSvtC/x2
	bh04UmNanxLUbbOTUsoZrAz1GZ4XuULsSJ/eSyU9CZvT7DKiF4BbhriO3zNbMpqJAoZ/zYBAPJP
	Ui3KrIf39HYl9EGEtTTVTbD0eOYTJQFHG2uYivDYe5pvc+nJ69njpSHXMB0tcd3CEPYazPTdCmX
	mYj6tsRUOj20Y/b+pEsqIRUcuLtxZfFEFGQ=
X-Google-Smtp-Source: AGHT+IE+BEJ0W1/FV/6bBGoeko8VUNX1Wn6kzWtD1nsn+objj+3sZmT3W6zm5x0BZU0by8JZPF6s8Q==
X-Received: by 2002:a05:651c:b0a:b0:300:29ed:b7c1 with SMTP id 38308e7fff4ca-3044db5b8e5mr622591fa.7.1734471270953;
        Tue, 17 Dec 2024 13:34:30 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3034401d43dsm13850581fa.15.2024.12.17.13.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 13:34:29 -0800 (PST)
Message-ID: <e9dc1a6f-156b-40aa-9209-2010464d54ed@linaro.org>
Date: Tue, 17 Dec 2024 23:34:20 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: sdm670: add camss and cci
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20241216223019.70155-8-mailingradian@gmail.com>
 <20241216223019.70155-13-mailingradian@gmail.com>
 <565d14e1-1478-4a60-8f70-a76a732cde97@linaro.org> <Z2HeS7mZ976l_Mrw@radian>
Content-Language: ru-RU
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <Z2HeS7mZ976l_Mrw@radian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/24 22:25, Richard Acayan wrote:
> On Tue, Dec 17, 2024 at 09:31:50AM +0200, Vladimir Zapolskiy wrote:
>> Hi Richard.
>>
>> On 12/17/24 00:30, Richard Acayan wrote:
>>> Add the camera subsystem and CCI used to interface with cameras on the
>>> Snapdragon 670.
>>>
>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>    arch/arm64/boot/dts/qcom/sdm670.dtsi | 185 +++++++++++++++++++++++++++
>>>    1 file changed, 185 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
>>> index 328096b91126..d4e1251ada04 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
>>> @@ -6,6 +6,7 @@
>>>     * Copyright (c) 2022, Richard Acayan. All rights reserved.
>>>     */
>>> +#include <dt-bindings/clock/qcom,camcc-sdm845.h>
>>>    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
>>>    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>>>    #include <dt-bindings/clock/qcom,rpmh.h>
>>> @@ -1168,6 +1169,34 @@ tlmm: pinctrl@3400000 {
>>>    			gpio-ranges = <&tlmm 0 0 151>;
>>>    			wakeup-parent = <&pdc>;
>>> +			cci0_default: cci0-default-state {
>>> +				pins = "gpio17", "gpio18";
>>> +				function = "cci_i2c";
>>> +				drive-strength = <2>;
>>> +				bias-pull-up;
>>> +			};
>>> +
>>> +			cci0_sleep: cci0-sleep-state {
>>> +				pins = "gpio17", "gpio18";
>>> +				function = "cci_i2c";
>>> +				drive-strength = <2>;
>>> +				bias-pull-down;
>>> +			};
>>> +
>>> +			cci1_default: cci1-default-state {
>>> +				pins = "gpio19", "gpio20";
>>> +				function = "cci_i2c";
>>> +				drive-strength = <2>;
>>> +				bias-pull-up;
>>> +			};
>>> +
>>> +			cci1_sleep: cci1-sleep-state {
>>> +				pins = "gpio19", "gpio20";
>>> +				function = "cci_i2c";
>>> +				drive-strength = <2>;
>>> +				bias-pull-down;
>>> +			};
>>> +
>>>    			qup_i2c0_default: qup-i2c0-default-state {
>>>    				pins = "gpio0", "gpio1";
>>>    				function = "qup0";
>>> @@ -1400,6 +1429,162 @@ spmi_bus: spmi@c440000 {
>>>    			#interrupt-cells = <4>;
>>>    		};
>>> +		cci: cci@ac4a000 {
>>> +			compatible = "qcom,sdm670-cci", "qcom,msm8996-cci";
>>> +			#address-cells = <1>;
>>> +			#size-cells = <0>;
>>> +
>>> +			reg = <0 0x0ac4a000 0 0x4000>;
>>> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
>>> +			power-domains = <&camcc TITAN_TOP_GDSC>;
>>> +
>>> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>>> +				 <&camcc CAM_CC_SOC_AHB_CLK>,
>>> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
>>> +				 <&camcc CAM_CC_CCI_CLK>;
>>> +			clock-names = "camnoc_axi",
>>> +				      "soc_ahb",
>>> +				      "cpas_ahb",
>>> +				      "cci";
>>> +
>>> +			pinctrl-names = "default", "sleep";
>>> +			pinctrl-0 = <&cci0_default &cci1_default>;
>>> +			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
>>> +
>>> +			status = "disabled";
>>> +
>>> +			cci_i2c0: i2c-bus@0 {
>>> +				reg = <0>;
>>> +				clock-frequency = <1000000>;
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +			};
>>> +
>>> +			cci_i2c1: i2c-bus@1 {
>>> +				reg = <1>;
>>> +				clock-frequency = <1000000>;
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +			};
>>> +		};
>>> +
>>> +		camss: camera-controller@acb3000 {
>>
>> Wasn't it agreed recently to have 'isp' as a generic device name for CAMSS IP?
> 
> Yeah, will change.
> 
>>
>>> +			compatible = "qcom,sdm670-camss";
>>> +			reg = <0 0x0acb3000 0 0x1000>,
>>> +			      <0 0x0acba000 0 0x1000>,
>>> +			      <0 0x0acc8000 0 0x1000>,
>>> +			      <0 0x0ac65000 0 0x1000>,
>>> +			      <0 0x0ac66000 0 0x1000>,
>>> +			      <0 0x0ac67000 0 0x1000>,
>>> +			      <0 0x0acaf000 0 0x4000>,
>>> +			      <0 0x0acb6000 0 0x4000>,
>>> +			      <0 0x0acc4000 0 0x4000>;
>>> +			reg-names = "csid0",
>>> +				    "csid1",
>>> +				    "csid2",
>>> +				    "csiphy0",
>>> +				    "csiphy1",
>>> +				    "csiphy2",
>>> +				    "vfe0",
>>> +				    "vfe1",
>>> +				    "vfe_lite";
>>> +
>>> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>>> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
>>> +				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
>>> +				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
>>> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
>>> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
>>> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
>>> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
>>> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
>>> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
>>> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
>>> +				 <&gcc GCC_CAMERA_AHB_CLK>,
>>> +				 <&gcc GCC_CAMERA_AXI_CLK>,
>>> +				 <&camcc CAM_CC_SOC_AHB_CLK>,
>>> +				 <&camcc CAM_CC_IFE_0_CLK>,
>>> +				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
>>> +				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
>>> +				 <&camcc CAM_CC_IFE_1_CLK>,
>>> +				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
>>> +				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
>>> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
>>> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
>>> +			clock-names = "camnoc_axi",
>>> +				      "cpas_ahb",
>>> +				      "csi0",
>>> +				      "csi1",
>>> +				      "csi2",
>>> +				      "csiphy0",
>>> +				      "csiphy0_timer",
>>> +				      "csiphy1",
>>> +				      "csiphy1_timer",
>>> +				      "csiphy2",
>>> +				      "csiphy2_timer",
>>> +				      "gcc_camera_ahb",
>>> +				      "gcc_camera_axi",
>>> +				      "soc_ahb",
>>> +				      "vfe0",
>>> +				      "vfe0_axi",
>>> +				      "vfe0_cphy_rx",
>>> +				      "vfe1",
>>> +				      "vfe1_axi",
>>> +				      "vfe1_cphy_rx",
>>> +				      "vfe_lite",
>>> +				      "vfe_lite_cphy_rx";
>>> +
>>> +			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
>>> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
>>> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
>>> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
>>> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
>>> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
>>> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
>>> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
>>> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
>>> +			interrupt-names = "csid0",
>>> +					  "csid1",
>>> +					  "csid2",
>>> +					  "csiphy0",
>>> +					  "csiphy1",
>>> +					  "csiphy2",
>>> +					  "vfe0",
>>> +					  "vfe1",
>>> +					  "vfe_lite";
>>> +
>>> +			iommus = <&apps_smmu 0x808 0x0>,
>>> +				 <&apps_smmu 0x810 0x8>,
>>> +				 <&apps_smmu 0xc08 0x0>,
>>> +				 <&apps_smmu 0xc10 0x8>;
>>> +
>>> +			power-domains = <&camcc IFE_0_GDSC>,
>>> +					<&camcc IFE_1_GDSC>,
>>> +					<&camcc TITAN_TOP_GDSC>;
>>> +			power-domain-names = "ife0",
>>> +					     "ife1",
>>> +					     "top";
>>> +
>>> +			status = "disabled";
>>> +
>>> +			ports {
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +
>>> +				camss_port0: port@0 {
>>> +					reg = <0>;
>>> +				};
>>> +
>>> +				camss_port1: port@1 {
>>> +					reg = <1>;
>>> +				};
>>> +
>>> +				camss_port2: port@2 {
>>
>> Likely labels to ports are excessive here, please remove them.
> 
> How would you imagine connecting a camera to the ports, then? For MDSS,
> there's a label for the endpoint (mdss_dsi0_out) which the device DTS
> can then reference:
> 
> 	&mdss_dsi0_out {
> 		remote-endpoint = <&panel_in>;
> 		data-lanes = <0 1 2 3>;
> 	};
> 
> For CAMSS, the port labels would be used like so:
> 
> 	&camss_port1 {
> 		camss_endpoint1: endpoint {
> 			clock-lanes = <7>;
> 			data-lanes = <0 1 2 3>;
> 			remote-endpoint = <&cam_front_endpoint>;
> 		};
> 	};
> 
> Without the labels, the connection might look something like:
> 

Even if you insist on moving endpoints out of &camss, then why do
you add port labels? Unavoidably you do have endpoint labels, so
it's non-obvious why the version above is better than the next one:

	&camss_endpoint1 {
		clock-lanes = <7>;
		data-lanes = <0 1 2 3>;
		remote-endpoint = <&cam_front_endpoint>;
	};

Minus two lines of code, minus one label. Port labels are not needed.

> 	&camss {
> 		status = "okay";
> 
> 		// Modification of existing /soc/isp@acb3000/ports node
> 		ports {
> 			// Modification of existing /soc/isp@acb3000/ports/port@1 node
> 			port@1 {
> 				// New node
> 				camss_endpoint1: endpoint {
> 					clock-lanes = <7>;
> 					data-lanes = <0 1 2 3>;
> 					remote-endpoint = <&cam_front_endpoint>;
> 				};
> 			};
> 		};
> 	};
> 
> which I believe is not preferred.

Well, that's exactly how it's done right at the moment, in other words
it was preferred every time in the past.

--
Best wishes,
Vladimir

