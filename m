Return-Path: <linux-clk+bounces-13299-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CD89A30C5
	for <lists+linux-clk@lfdr.de>; Fri, 18 Oct 2024 00:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B04C91C217A2
	for <lists+linux-clk@lfdr.de>; Thu, 17 Oct 2024 22:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF80D1DDA3A;
	Thu, 17 Oct 2024 22:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gCnQWfaI"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE5F1D7E35
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 22:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729204343; cv=none; b=nmSYRijIjMbuIsFN/ka3ENe/WUGykzHDkMEicJRfbUaXLkGgixQ1MFJuCIC5CA94czXRSfAWgcCsKGG6Zc4l1Lkn0T3X4szFWLOuGsjIb6hvgMij5dZUb1bu3Jyt17ExBME2XnBlJFku64cTpX7crNDD15v1naWoGukjp6en9c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729204343; c=relaxed/simple;
	bh=3W/uNKsgl51aObHzXqj7nWpdqWQBUxBYXhXlOtUD27M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1h1WP6LZYm7vigaF1rD5TcQBj7JSqmbCgMhW+C7WkdqBbuxTGPpMJlMwMwdQTIdKySHdr4AKXyMm0ZnTPsa83fTW50oKX6qIlQW7f/q4bQhwJkyzoi1m4z4czbeoCYyrx2x/L6biuumAom4gLbJ4No5pW/QEU882R5x9AtWt1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gCnQWfaI; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539fe76e802so1853208e87.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 15:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729204338; x=1729809138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1bAbTMxbfgYNlTKNWKS5RZ8x7THZ7byycyiuJihGoA0=;
        b=gCnQWfaIDWJ3WVPLPGFhcmqYg+px4YdpIAjgnFm0o/UQwQemJYSdBop/7WwJabUfMn
         Z7cawowS//NA1EBIzOytah1wYHRSSXX1K03EWOZllcvHV+Dn+jbHCms6vjoodTP1TOkj
         RHuTlkRGgSpRAMYgeOambSpeG1dCYA7nbphBecRYGWHLfzk8ozE6aDZwx0YlcKZ6GoXW
         +Pnm05RihfATxVcs6MlV8QMl0Sn0S7MbHzaJlGzEYLk4nC1XRffdQvdRi+tizrhHV6Ja
         QwA1PhWzsVVouCFLlZGKUHq4xDEr1JVyyhO53FPuy5Ral+MhnTKnvxFC0UR51N167KmX
         fMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729204338; x=1729809138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bAbTMxbfgYNlTKNWKS5RZ8x7THZ7byycyiuJihGoA0=;
        b=vx3Op12fs1bbD+4hx+Y5LzuS9i9vPXU3eQsv11eQ5ejYpceCZTs9/tjj4ZAqFIOlXZ
         tA6ADfWOlmBB0iEdWaLfOGfhviPOXB2hSD9zad/4/VTQ0Xrh8DDLgnlOuPnRn8sTGllp
         dMUefzIxNsN+MCCRsGUV2kINoE88Ji32xRkrsOrv81jDMCYuZbv53ffv796qkrONOkvt
         bF/MT2WX578LbdcZFtl2847tpToTiSS/JTJCGBCvaFai+Q/sw+/oo0SBrJpiFTUgHyXH
         L4CdZbA5HZNQ3oyiT7/KyS/jcbSbhJJhgnDUgsOIcuVkpmRK/9PChziTBNvDRD0CFMnZ
         Cc+g==
X-Forwarded-Encrypted: i=1; AJvYcCU90V9+kWGIlqzLNzRARJIWm5n3uF1FUNv9c4q27cQhGPPiylz1thYJHTOwWAaKyAcwDZfQCNO/EnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaDmHT1xpM6/CI1+GxxGJgtYEsA4oFS3eplsAuEf5PJSPkkUJ0
	jGT+HIZy1FCtoEUFd3FPKcg30LDxBtZLWkoMlM0lXlabpLgaMlnCeGiKArz3MpU=
X-Google-Smtp-Source: AGHT+IE+pRPFhrFxZdHJW8QRmvo7/ciXFM11eKDEHMaMRxethyUPdqsKcubQrsXLWMC5Vt6meMV12Q==
X-Received: by 2002:a05:6512:31c1:b0:539:8b02:8f1d with SMTP id 2adb3069b0e04-53a154b0defmr257508e87.30.1729204338000;
        Thu, 17 Oct 2024 15:32:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a1520468asm45198e87.216.2024.10.17.15.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 15:32:16 -0700 (PDT)
Date: Fri, 18 Oct 2024 01:32:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, 
	quic_pavir@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, 
	bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
Message-ID: <abro3enahzbugcwokcyyhwybbokestbigvzhywxhnfrdjihni3@7ej2hkgbgtf6>
References: <20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com>
 <20241015-qcom_ipq_cmnpll-v4-4-27817fbe3505@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015-qcom_ipq_cmnpll-v4-4-27817fbe3505@quicinc.com>

On Tue, Oct 15, 2024 at 10:16:54PM +0800, Luo Jie wrote:
> The CMN PLL clock controller allows selection of an input
> clock rate from a defined set of input clock rates. It in-turn
> supplies fixed rate output clocks to the hardware blocks that
> provide ethernet functions such as PPE (Packet Process Engine)
> and connected switch or PHY, and to GCC.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi |  6 +++++-
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 20 +++++++++++++++++++-
>  2 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> index 91e104b0f865..77e1e42083f3 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> @@ -3,7 +3,7 @@
>   * IPQ9574 RDP board common device tree source
>   *
>   * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  /dts-v1/;
> @@ -164,6 +164,10 @@ &usb3 {
>  	status = "okay";
>  };
>  
> +&cmn_pll_ref_clk {
> +	clock-frequency = <48000000>;
> +};
> +
>  &xo_board_clk {
>  	clock-frequency = <24000000>;
>  };
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 14c7b3a78442..93f66bb83c5a 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -3,10 +3,11 @@
>   * IPQ9574 SoC device tree source
>   *
>   * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #include <dt-bindings/clock/qcom,apss-ipq.h>
> +#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
>  #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
>  #include <dt-bindings/interconnect/qcom,ipq9574.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -19,6 +20,11 @@ / {
>  	#size-cells = <2>;
>  
>  	clocks {
> +		cmn_pll_ref_clk: cmn-pll-ref-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};

Which block provides this clock? If it is provided by the external XO
then it should not be a part of the SoC dtsi.

> +
>  		sleep_clk: sleep-clk {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
> @@ -243,6 +249,18 @@ mdio: mdio@90000 {
>  			status = "disabled";
>  		};
>  
> +		cmn_pll: clock-controller@9b000 {
> +			compatible = "qcom,ipq9574-cmn-pll";
> +			reg = <0x0009b000 0x800>;
> +			clocks = <&cmn_pll_ref_clk>,
> +				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
> +				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
> +			clock-names = "ref", "ahb", "sys";
> +			#clock-cells = <1>;
> +			assigned-clocks = <&cmn_pll CMN_PLL_CLK>;
> +			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
> +		};
> +
>  		qfprom: efuse@a4000 {
>  			compatible = "qcom,ipq9574-qfprom", "qcom,qfprom";
>  			reg = <0x000a4000 0x5a1>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

