Return-Path: <linux-clk+bounces-15910-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4BA9F4526
	for <lists+linux-clk@lfdr.de>; Tue, 17 Dec 2024 08:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB85B16983A
	for <lists+linux-clk@lfdr.de>; Tue, 17 Dec 2024 07:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71ED1D54E3;
	Tue, 17 Dec 2024 07:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UxzZpC0w"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82FF1D4605
	for <linux-clk@vger.kernel.org>; Tue, 17 Dec 2024 07:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734420716; cv=none; b=D1LYSVyz6twGn/Zx8Wxr+5hmyBS3EycwpRzePdXQTJ84eWdpfOVh67fdhP5owh3NWC+y5APZ+QUd2J6ro4nI0oyJ8uyZ0ppZtXh6PSNuBnVBPFSAtXtLNvfDz+A99tQtOFmyVFf+pMr8/ZCRPmm/uDIKCIkmfM7fR7JfoEdx5kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734420716; c=relaxed/simple;
	bh=HcevyDIjXqeH1BJWuf9qTIg8G912SY0yijOkdZWDTMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=B0ta1gVF7Eph67ASBZAOU4OuV4tHoBnebf76ALhqOsv8i49vPGzg3LMuXGJ7g0E10k6RC87bdoLqbtin/4Z/7dM5prMbP2rS/kNmgcBoClW0Vx8ipVDF3eYJKEXZWlkTIKlfpLb4AgEXKWBJEcbeMtc2iNLtiaWa0X7hzQfZLJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UxzZpC0w; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30156c52c25so2984631fa.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2024 23:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734420713; x=1735025513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=irlnEietpgBrAeJ+taxGypHB9smY9TNmFZlh4E6shLQ=;
        b=UxzZpC0w/agChHMA+YLDWZosYEsMsKVQ2+pBI405Zwqrqno0q/hXUFKTTmR4GhsWDK
         ge/U7oJmFyC5g7yDBCtqDI8XSjOFk1qTREd5JM6HRkDKca/G+lj3AVEp8uPZxnMur/wV
         ldYL3ZNsEKSG9VV/zqWsBHAp0hq4BW0qm4U5Wj4FtkMikfWSTjpd6t1VeU3iSp8BYN9y
         /RDg/vqNRJaYPjiwq2uQcsg3X/lRMaSGOZHlwh+DwGOU6R079Dpxauq8azN8A1xkeitD
         Jv/0akGaFf9qtmzxdfqngqVGaI1767Wc2oXNZ9+CB2TQi0mdRsybAd5BQKUbfSpWCIKD
         rlvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734420713; x=1735025513;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=irlnEietpgBrAeJ+taxGypHB9smY9TNmFZlh4E6shLQ=;
        b=pa6rkx/qvXCEjPC8QdISAhImfNEna6auCDEoHEavaap2OMasehSa1lbwqmX0LJx2w5
         30xXFxVixt2NfcCAlhRcF/zpZCw9kXpoGia5pQRv8sdSnfpwrrORB2T0wJ2464iQeSU2
         OQiHDi4aBUuaAAc6F9v69fU69hasy6J6maop/B2riGgOQuOjV6hotkZiC77SC9Fu7W3e
         x1CL0AwPdw8g7DNv7KRizmm7Rm0zsbb/Rkr2lSyK6m4O30uQOe6ESTAPJ96Una5irCoo
         fiDRiWhDHrq8+IJ7dlNMA3M3qdvwBk8+IfCpjsmQLwDqDokDUJ1wNEDYFz0WzZe+77K2
         z+qA==
X-Forwarded-Encrypted: i=1; AJvYcCWm9ygOnQsOd17iAYxSmpCNLcBDocFsVeuOZ7MxasPqUHKrQOjiHnDzy0dIXrcCujYx3Kga4topmww=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR1P9NklWaVEvgSLmPGfVxhOmSJeIVpTzcQI4hE5Rus6tXLob7
	6VqMRGaz4OKH2LeytujsQmLFW5B7UfSdBHdnDkzmyOguvFYpZxUnGQLFf1Fo5HQ=
X-Gm-Gg: ASbGnct4s/JvWlXcwKxEsREr+LrLyjs/4SCpxPjdoNCPPrbmtCwejU+LqVbtNq7Ki0P
	ft93HpRqoWVvcPdf4mkNd65kiLLEfz3EEgN9Ue8Z3HtyWQL3S6/+sFOVGi4BHziRNParCIyO7hl
	CR+6xWBvVNdbMqLpSyixWxANA5IRDHjvxLluvux5ELrVPqt01m84wHP+3WfiLZGA8PCvpoyfsDh
	j2LcTbmaBQtLHodz8RtszOp9HBw2PlcQGC5KsHO8bBEbpqqNGKFzcMfuJQ6L3jHtAy4iX0c0zas
	13FbbmNYloUqVQPLrkoev9cOflZK/nPDMuQ=
X-Google-Smtp-Source: AGHT+IEyWahOJ8Zd5zTaFmvHz4CvalrV0yobbMuaGCGFfjB+NeQt/agu8M+geYVJeB3xxs2fbNvEKQ==
X-Received: by 2002:a05:6512:6c6:b0:540:2300:25d2 with SMTP id 2adb3069b0e04-54099b72a8cmr1873622e87.14.1734420712707;
        Mon, 16 Dec 2024 23:31:52 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120b9f509sm1071308e87.28.2024.12.16.23.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 23:31:51 -0800 (PST)
Message-ID: <565d14e1-1478-4a60-8f70-a76a732cde97@linaro.org>
Date: Tue, 17 Dec 2024 09:31:50 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: sdm670: add camss and cci
Content-Language: ru-RU
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241216223019.70155-13-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard.

On 12/17/24 00:30, Richard Acayan wrote:
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm670.dtsi | 185 +++++++++++++++++++++++++++
>   1 file changed, 185 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index 328096b91126..d4e1251ada04 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -6,6 +6,7 @@
>    * Copyright (c) 2022, Richard Acayan. All rights reserved.
>    */
>   
> +#include <dt-bindings/clock/qcom,camcc-sdm845.h>
>   #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
>   #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>   #include <dt-bindings/clock/qcom,rpmh.h>
> @@ -1168,6 +1169,34 @@ tlmm: pinctrl@3400000 {
>   			gpio-ranges = <&tlmm 0 0 151>;
>   			wakeup-parent = <&pdc>;
>   
> +			cci0_default: cci0-default-state {
> +				pins = "gpio17", "gpio18";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci0_sleep: cci0-sleep-state {
> +				pins = "gpio17", "gpio18";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci1_default: cci1-default-state {
> +				pins = "gpio19", "gpio20";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci1_sleep: cci1-sleep-state {
> +				pins = "gpio19", "gpio20";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
>   			qup_i2c0_default: qup-i2c0-default-state {
>   				pins = "gpio0", "gpio1";
>   				function = "qup0";
> @@ -1400,6 +1429,162 @@ spmi_bus: spmi@c440000 {
>   			#interrupt-cells = <4>;
>   		};
>   
> +		cci: cci@ac4a000 {
> +			compatible = "qcom,sdm670-cci", "qcom,msm8996-cci";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			reg = <0 0x0ac4a000 0 0x4000>;
> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc TITAN_TOP_GDSC>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_SOC_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "soc_ahb",
> +				      "cpas_ahb",
> +				      "cci";
> +
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&cci0_default &cci1_default>;
> +			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
> +
> +			status = "disabled";
> +
> +			cci_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		camss: camera-controller@acb3000 {

Wasn't it agreed recently to have 'isp' as a generic device name for CAMSS IP?

> +			compatible = "qcom,sdm670-camss";
> +			reg = <0 0x0acb3000 0 0x1000>,
> +			      <0 0x0acba000 0 0x1000>,
> +			      <0 0x0acc8000 0 0x1000>,
> +			      <0 0x0ac65000 0 0x1000>,
> +			      <0 0x0ac66000 0 0x1000>,
> +			      <0 0x0ac67000 0 0x1000>,
> +			      <0 0x0acaf000 0 0x4000>,
> +			      <0 0x0acb6000 0 0x4000>,
> +			      <0 0x0acc4000 0 0x4000>;
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe_lite";
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&gcc GCC_CAMERA_AXI_CLK>,
> +				 <&camcc CAM_CC_SOC_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "cpas_ahb",
> +				      "csi0",
> +				      "csi1",
> +				      "csi2",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "gcc_camera_ahb",
> +				      "gcc_camera_axi",
> +				      "soc_ahb",
> +				      "vfe0",
> +				      "vfe0_axi",
> +				      "vfe0_cphy_rx",
> +				      "vfe1",
> +				      "vfe1_axi",
> +				      "vfe1_cphy_rx",
> +				      "vfe_lite",
> +				      "vfe_lite_cphy_rx";
> +
> +			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csid2",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe_lite";
> +
> +			iommus = <&apps_smmu 0x808 0x0>,
> +				 <&apps_smmu 0x810 0x8>,
> +				 <&apps_smmu 0xc08 0x0>,
> +				 <&apps_smmu 0xc10 0x8>;
> +
> +			power-domains = <&camcc IFE_0_GDSC>,
> +					<&camcc IFE_1_GDSC>,
> +					<&camcc TITAN_TOP_GDSC>;
> +			power-domain-names = "ife0",
> +					     "ife1",
> +					     "top";
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				camss_port0: port@0 {
> +					reg = <0>;
> +				};
> +
> +				camss_port1: port@1 {
> +					reg = <1>;
> +				};
> +
> +				camss_port2: port@2 {

Likely labels to ports are excessive here, please remove them.

> +					reg = <2>;
> +				};
> +			};
> +		};
> +
>   		camcc: clock-controller@ad00000 {
>   			compatible = "qcom,sdm670-camcc", "qcom,sdm845-camcc";
>   			reg = <0 0x0ad00000 0 0x10000>;

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

