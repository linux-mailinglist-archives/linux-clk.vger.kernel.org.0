Return-Path: <linux-clk+bounces-16574-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 634469FFEDB
	for <lists+linux-clk@lfdr.de>; Thu,  2 Jan 2025 19:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 656AA18838B8
	for <lists+linux-clk@lfdr.de>; Thu,  2 Jan 2025 18:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447D4192B96;
	Thu,  2 Jan 2025 18:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bhKBxDqs"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3EC17B506
	for <linux-clk@vger.kernel.org>; Thu,  2 Jan 2025 18:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735843888; cv=none; b=eA6MKvaHpGLKJJJ8dgquAFS5nmcueHflwPli5s5PL3IexWcrNIWWOItTKT2sZeyOWnrpTeSAeUnXQwnRY8Sl6CIzFEhNXXv+fS6jwdxm3zrNgNFCu5C8yHHvw9/UMu2Ghe1TUPu/nLcCPpgpQ1xsaKlx9j4uxb0W2XO7KnJ/mTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735843888; c=relaxed/simple;
	bh=3vtZEneD4YmI3fBVj12hcS/+xalvyFqzM1PYABWyW6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UiF14EzIImK6XfSI41SohsV/xvmv5sFJpOuL8lmJiY6DXkhfXOKKIJrUj5mpqCJa5bFNVk2PTHYbBix6x7JLOGyk2UH4sLkpcgKHaLzSEqLglqHrTpqJkvYKLheBa5Xb9qykCJSZl22UguZUXPE8qRXdDR9WSn4mSsrsko6uIWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bhKBxDqs; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385e44a1a2dso1372041f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 02 Jan 2025 10:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735843884; x=1736448684; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6T3WBl7QnFzkgV2IQFMi/3j+j3esVt8efB4fRofS+jo=;
        b=bhKBxDqsF88gPOIboc1H4uZVnQokUo5m7EWU62HJtODdz3Q/FprYVIcooI99XjsKj9
         RqtGw0ZDogL/exVyNNLYHs9C1Yu1SiPsPdxKh2z7cl4jxYQyitQYdXrbtRXomrX4ly7q
         C5fA0Ly/4VPsoLA+lTIl8yevPTZWFEUajmQv8DxKyFWVZC9y3uSnq1/vcgMLg8PdaRfM
         cgWQumFfKcyGnULwwA5e7rKK2C2khJtXfBLgOqEyCtszSzAtT/rbtQ/89TdjMYIsH+jy
         r9vjzZt8I2NA4fRBq5IrK+45J/qCOqWQ5WirHUSxo1u2NslhqNZ9xt/LM4aqb3IcpyNI
         STzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735843884; x=1736448684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6T3WBl7QnFzkgV2IQFMi/3j+j3esVt8efB4fRofS+jo=;
        b=f8nWa5HkJy7UH3JXOfqa42RWFUPo7ILd+X9ibhjJ74e6RIkpvuTN5iPYjja8cR7HAL
         6wP189i3Zh4A3JCXR1WvJ/qyxex32Xuq8iSSsqPgKbLTnCdEZ5C9kz7iYXn7Qrw8v6BX
         XxR1nZlBf7L6t2vUcpK0WnxbUEQL5fXbJtTkGcM657ON0XIR85Aq4lUdfJ1arXnrSe6Q
         75dbBb+9djygVfidUlbL1UWDqIOExDc5Mcds4txtNNVSLtvDMqfqTTDw/tDqKixq2oAr
         G8Dq2E7qCPjGVdetzTxQLT2aNAcPV3z+uxNHdlx/r2OlfTjVWfR3p+1Tbwg9P/gK26cX
         7Q+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXelFwP1U4E5VDO9fO67nkidVDEEB/XwM5cqcKYHJq9LbPvpozgq4GUmWzFLMYtTVQm3f4aNpeC9SI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwhPF7ELoKST7dxwXwjPr1RCMB1xEOgeBdGnAygMQUVlrqmTXr
	QvDrNELVEOVqM4kfp7SiGBG9xZQOrozXInYiRf1ECnRzhQTXOalZxw+mNjOi6aQ=
X-Gm-Gg: ASbGncshS6/7Oq9r0w2Zlz8vyypEWOirmU4MC511B469CYeRBguvPXtGjqMs1RP6JJO
	HMKZ8cULQ7oVtK3RHnXfvewHeyxDq0p20dwzOkEfar2MMHs0N5F6tfDeH+RuhAq2gXV9ue3o/N+
	qH7RP6K+o0vkkYKlaCBuQXahlXLOwIQ3a5nDCJXn8ZeLWDUK37QV81YvtqLF9YESK/pIoBN9Vsp
	k1ehdcnNnos/Izxb7OXxXY91RdlEnKhw4l2lVEq5oxyAlm09TSiMIdgnBqLLnm8ScjsvmxA
X-Google-Smtp-Source: AGHT+IFK5jTcY5BkHImuhFxNLmANSOh3LEZ9dsamKhwRZOkF6y2DSkxcL/ZYV+0+5WBmBXgCUwP1nw==
X-Received: by 2002:a5d:584c:0:b0:385:f909:eb33 with SMTP id ffacd0b85a97d-38a223f745fmr16467016f8f.10.1735843884117;
        Thu, 02 Jan 2025 10:51:24 -0800 (PST)
Received: from [172.16.0.204] ([79.164.49.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828cc8sm38715916f8f.17.2025.01.02.10.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 10:51:23 -0800 (PST)
Message-ID: <67e923f5-83e9-403a-9c13-3cef9d032304@linaro.org>
Date: Thu, 2 Jan 2025 20:51:20 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
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
 <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-6-cb66d55d20cc@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-6-cb66d55d20cc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/2/25 18:32, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block
> 
> 4 x CSIPHY
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 185 +++++++++++++++++++++++++++++++++
>   1 file changed, 185 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 97ebf5596dfc3caa920ef85722ca8afd49cd3c24..0b5b48d2c59e0b18816ea131e0f687b8bf84e1da 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -4726,6 +4726,191 @@ cci1_i2c1: i2c-bus@1 {
>   			};
>   		};
>   
> +		camss: isp@acb6000 {
> +			compatible = "qcom,x1e80100-camss";
> +
> +			reg = <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0acb7000 0 0x2000>,
> +			      <0 0x0acb9000 0 0x2000>,
> +			      <0 0x0acbb000 0 0x2000>,
> +			      <0 0x0acc6000 0 0x1000>,
> +			      <0 0x0acca000 0 0x1000>,
> +			      <0 0x0ace4000 0 0x2000>,
> +			      <0 0x0ace6000 0 0x2000>,
> +			      <0 0x0ace8000 0 0x2000>,
> +			      <0 0x0acec000 0 0x2000>,
> +			      <0 0x0acf6000 0 0x1000>,
> +			      <0 0x0acf7000 0 0x1000>,
> +			      <0 0x0acf8000 0 0x1000>,
> +			      <0 0x0acc7000 0 0x2000>,
> +			      <0 0x0accb000 0 0x2000>,
> +			      <0 0x0ac62000 0 0x4000>,
> +			      <0 0x0ac71000 0 0x4000>;
> +			reg-names = "csid_wrapper",
> +				    "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy4",
> +				    "csitpg0",
> +				    "csitpg1",
> +				    "csitpg2",
> +				    "vfe_lite0",
> +				    "vfe_lite1",
> +				    "vfe0",
> +				    "vfe1";
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
> +				 <&camcc CAM_CC_CSID_CLK>,
> +				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY4_CLK>,
> +				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +			clock-names = "camnoc_rt_axi",
> +				      "camnoc_nrt_axi",
> +				      "core_ahb",
> +				      "cpas_ahb",
> +				      "cpas_fast_ahb",
> +				      "cpas_vfe0",
> +				      "cpas_vfe1",
> +				      "cpas_vfe_lite",
> +				      "cphy_rx_clk_src",
> +				      "csid",
> +				      "csid_csiphy_rx",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "csiphy4",
> +				      "csiphy4_timer",
> +				      "gcc_axi_hf",
> +				      "gcc_axi_sf",
> +				      "vfe0",
> +				      "vfe0_fast_ahb",
> +				      "vfe1",
> +				      "vfe1_fast_ahb",
> +				      "vfe_lite",
> +				      "vfe_lite_ahb",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid";
> +
> +			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csid2",
> +					  "csid_lite0",
> +					  "csid_lite1",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "csiphy4",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe_lite0",
> +					  "vfe_lite1";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cam_ahb",
> +					     "cam_hf_mnoc",
> +					     "cam_sf_mnoc",
> +					     "cam_sf_icp_mnoc";
> +
> +			iommus = <&apps_smmu 0x800 0x60>,
> +				 <&apps_smmu 0x860 0x60>,
> +				 <&apps_smmu 0x1800 0x60>,
> +				 <&apps_smmu 0x1860 0x60>,
> +				 <&apps_smmu 0x18e0 0x00>,
> +				 <&apps_smmu 0x1900 0x00>,
> +				 <&apps_smmu 0x1980 0x20>,
> +				 <&apps_smmu 0x19a0 0x20>;
> +
> +			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +					<&camcc CAM_CC_IFE_1_GDSC>,
> +					<&camcc CAM_CC_TITAN_TOP_GDSC>;
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
> +				port@0 {
> +					reg = <0>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +				};
> +			};
> +		};
> +
>   		camcc: clock-controller@ade0000 {
>   			compatible = "qcom,x1e80100-camcc";
>   			reg = <0 0x0ade0000 0 0x20000>;
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

