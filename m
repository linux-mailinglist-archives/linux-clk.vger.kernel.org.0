Return-Path: <linux-clk+bounces-19451-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA47AA60393
	for <lists+linux-clk@lfdr.de>; Thu, 13 Mar 2025 22:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BC9E17A17F
	for <lists+linux-clk@lfdr.de>; Thu, 13 Mar 2025 21:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB52B1F875B;
	Thu, 13 Mar 2025 21:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tJamV0ca"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D211F7075
	for <linux-clk@vger.kernel.org>; Thu, 13 Mar 2025 21:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741902204; cv=none; b=sOtfsxIIfSbw8OajIZPCtx4z7DPiLCtGPpN2h5o1IX+zycDKtUnrYlmn4X5mGbUwl8sbclFwV/jw6jy1XxvlFWMLvKETjkJO/S7tUuRObeDz3UK0sU4nw8Pl1euWxB15yNRc7ShLh+PjZxSDpo+ElFxNtD1ubIlJuZTPLVHYXDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741902204; c=relaxed/simple;
	bh=a3wrzpVCaYNuMwQuNJHx7mKyoFe02+zkw63lLomddaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RcMvi52yWOQCt+oPgmVmAAP9v3hzn1aIuYpLmOqaRkDqc4ptnwgRfz5j9vcMzFPCHXelyFxsG9BOiCjo/sdg9GvO4NBbitTsfk+Iznrys3mhZDlQ3oWg4jSbCoghkeXuTqwWx/9n4Jm6gQ5Ru6t5C1Z3rhkwxD7kvXgV2ZiGgj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tJamV0ca; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abbb12bea54so275480166b.0
        for <linux-clk@vger.kernel.org>; Thu, 13 Mar 2025 14:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741902201; x=1742507001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZMmcHfeB4rBHuWqkNhUsUagbSg6bNeQKDj5E5I8kNM=;
        b=tJamV0caOKAODX9elPyfz2762PepQmOA4jbp8A54lFjSBTVt2Xou5vNiwkLCI6hfnH
         1SB7mG3JjSRP0A77cF05jv8EfIVuWsqK7ukUpny6Re8Fgv3ShReQQkXNObLWfAzxbex2
         JZLR4j0mWicYX7QZMIOEXouEgyVdhwNPlLbF/MkEVp7SAA4MnKAObExbymNkCFvOSstV
         u49hePDOSN3PSgXCbSC+V6RtTvH/hevhURgs8TjjjK5bVCg2KEgb552DJHCATB1XMGjf
         uURrvc3yMm3FCJQl3FzSXkRvTppAdkh+V+RfuxnIN8Gv8EjhvIi+EMpnjTEGg9Au1TGu
         1XVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741902201; x=1742507001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZMmcHfeB4rBHuWqkNhUsUagbSg6bNeQKDj5E5I8kNM=;
        b=AE28aYBQQVHFFhDztmszOzL1PlV0yKaKh+D5wC3jFw/YxVvbjfyAnO3hjvyzwe6DSu
         CLnzEcVKb5nu1ndlRPbMBNuD5Eyvwmb/yuvbBGDrevRvRfZaTca1QDV1ZdIljKoqO116
         02la22b/rjKuHn9bgGoa1IK0ADPlocRgN81upkhWt4WxKg7CjIy/wlcP76zwXXooYHO3
         P+LqzMzzpSFi2rWuQMEcUUng+eNgS2jcwZLV6C/s4aiZvO11aQNXPx2U0vOxWjoSKzKz
         VHPgsMPp7ibpvusPvT7elgVwNvU2yU4dePExqVtQLmw31tWYRoiiBPSxQ5dmQOGSf/4o
         bpbA==
X-Forwarded-Encrypted: i=1; AJvYcCXPRZMM9DyKeVVc/w4JKgMzp9LANF75/Sap1ZX92BZgfOmH5urMjraMFf8/20kzGlHa0rB8owDPTT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVuRI6ECUsLnhE7uW3zL/vBUwuXS1/e44y2+/rNInZbx4tD3sz
	sacL7Qw1Fqe0dklcPg5J2wihiTw5SIMhncpBixshJRxq21ampNQ3vO5lrSFbb00=
X-Gm-Gg: ASbGncvzr+R5u8I2ZEzZTAf2QA33RL8BstqrzkzUFrAuEeO+hm3Lt4DFUod8NULmhEz
	SmXkujMLjG48a43/zxKdEoumOWCVVccPjNyDQz66h5TE5xKl9AbCERjAItVLg3aX1Niimp7uHvb
	pW3xFFzCgQd/y0V/1rLDTLKaAU+YDBFadM51A760b4AcG9BFn59Yx+M1lVpXrx1XOVNsVC59mnT
	Rd5+tBBy4v09Qh2GEyrA5R2oAtC2JCt6iDe3W0eInM2qBZU/njrlz7O4gS9nPZ0ACt+rBx23yDg
	pFHloDeQsXqddlWw2ZVDzW+TVi2xnnxjzZOrDh228W/QutbqNCYlDgcpOsz8gXKe39rVa5L2AD+
	VIAlB1Cz+kt6LVNoy9T06Isjja/9K7WfG7B7ZlT/Y8Yel19nebdIJatQJxH/5N6pXUFwt
X-Google-Smtp-Source: AGHT+IEoowJuPUsYRRA5+TwZx73pPwDGjlSG75J2GAB4x1TkjB/AGGligwnBjapO7S/jscNp4DnL5w==
X-Received: by 2002:a17:907:2d0f:b0:ac2:8a59:92f4 with SMTP id a640c23a62f3a-ac330408d5cmr8908566b.51.1741902200774;
        Thu, 13 Mar 2025 14:43:20 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a489e0sm126938866b.151.2025.03.13.14.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 14:43:20 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 13 Mar 2025 21:43:16 +0000
Subject: [PATCH v5 4/5] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-4-846c9a6493a8@linaro.org>
References: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org>
In-Reply-To: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2

Add in two CCI busses.

One bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio101
cci_i2c_scl0 = gpio102

cci_i2c_sda1 = gpio103
cci_i2c_scl1 = gpio104

The second bus has two CCI bus master pinouts:
cci_i2c_sda2 = gpio105
cci_i2c_scl2 = gpio106

aon_cci_i2c_sda3 = gpio235
aon_cci_i2c_scl3 = gpio236

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 150 +++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 065a219e69c632eca288c9ade001949e37b92173..4ae0f67a634a982143df7aa933ec4de697f357a5 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5117,6 +5117,84 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac15000 0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac16000 0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;
@@ -5741,6 +5819,78 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				cci0_i2c0_default: cci0-i2c0-default-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default-state {
+				cci1_i2c0_default: cci1-i2c0-default-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105","gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235","gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105","gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235","gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio0", "gpio1";

-- 
2.48.1


