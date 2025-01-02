Return-Path: <linux-clk+bounces-16552-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC7E9FFBBF
	for <lists+linux-clk@lfdr.de>; Thu,  2 Jan 2025 17:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09AE01882947
	for <lists+linux-clk@lfdr.de>; Thu,  2 Jan 2025 16:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB37186E46;
	Thu,  2 Jan 2025 16:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hFshTgGR"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2308617A5BE
	for <linux-clk@vger.kernel.org>; Thu,  2 Jan 2025 16:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735835663; cv=none; b=aoLiu8S//ykf+JGinsx13uFOnVYln9kJko6dMVaqGr5jVRwXSyZuHYIOB85qx14BOMeP0uPNDDSBpy/Ao6MzYdN7VH+A9xegYSTrShpTzzW4me05UwGX4jfHDB6nMeNLcIQLT2n/N9vbGNUh6DudUSCN1gdu7MU0thHX7MnEL58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735835663; c=relaxed/simple;
	bh=fjvzO6KffOj9sfc5EIby2AXHfhoZiX0qQfPWKO/dzKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OrLr4hYpSsHsTfCHmDIoHyMWd0S9Hgit5arLlSQJICh74H3OCu/IpvM2xVbDZe7FJo8Mul+y+gEJcfiz2ElCxbx6etec6QrbtTmvupZsKL3efgN+jS3hxjNNNffeHHw56wqrEQPVYIXdrO/dLE0eIt+cnQ00RROKCiUu/REXlck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hFshTgGR; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436341f575fso119720645e9.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jan 2025 08:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735835656; x=1736440456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPzOhMrUaAX5ZkaDgmyUGAbRthcflOScBviLrrbA1DU=;
        b=hFshTgGRcRKITxUUmhtqBHds8gy5Ktmj7tQV494NcnBcolQgK4MqYCqg8ON5TyIILk
         Ths0a3lyDwAogG3y5xY4f/UcDHCle6fKaJVyA1Hf42jDxXfZTR4Ifjy/Xi5u+1f5FoRV
         ppCRWmSfmpfpwCuNItTaBT5H+J6+uUmwKz6X+uFhOtd/K7DlUDvwV0qvruRacpgP4Xcg
         E4AWAlDIzYWtJTc5DuOLpU+pEMKu6r1C/uq7/4t/a9TZRoFl6Z+LPKoxIBB2qjGw6NdP
         bZnUPF4nVxu0azaYZOlJV0EgXoFaR6Oq+vT4uqeuHpq+Ju7iKN8dkPtz/UupXV4vfThF
         XNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735835656; x=1736440456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPzOhMrUaAX5ZkaDgmyUGAbRthcflOScBviLrrbA1DU=;
        b=I0V+XZXrjxuEGcShDrB7SzOln4J2tYdXxsogsf0yG/hyXPaIcGSjID2BEnMhokoFan
         UK+FbzPr9gKaQuc9NuC+Z0gDfQXSALE5m/nzpkedaefpm0NJ5AncjVSTMUmvsI1jiGhe
         4srvNYjq2E+9IQa5zI6tZTXXGiHC+kglo8hXV17g6wy1V411zwBh+hIPAVowTMxQ8jZZ
         47RQfKk+VWnq2+Q6gmgoFO38ynRJxecBxKpHQ76eL/ol8bFJMnBGYootTa5b+r06MHHm
         RAxdET0qk1auVO86MWAnsHYPkggVbK6zMZ3MhwzLgRNqi1u1iJLxRbv4wkPCJW3om7l0
         F3kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQHzyJsNm3yWr39FQvRk57Ajy3fyC48pKo40ADE4ohjcGNA4knvQQfFp8wKpPvFztKtAggqFrBSwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOchTI/iaSFYuJ6W6LxovSVfjK+aZHQXSvw9mDoGvCOw0ssoT4
	gvmrwYZMzJL2fw0BS9PI9oXfy0BrHWrhx/okXQMe9Vy5DNiAJ3trcoxFx15qw9Q=
X-Gm-Gg: ASbGncudUjrL3KDIlD7SzlVnAuBbieNOypL6P3fr8WvoTg+4WnjURsuE5zF93mEe2M7
	IaSs2/IpZEo6QRJC0VE6FMGnSUMl945wrc0JmW4zaGo9RPddOxbj9FcJX0FFZDWPfA0T3dXCoem
	9r/Xig/FNdblsG10JeKkK5GJfrc+zbVvmcrJupNfEu6Z3WKIr0Cg8l0O9fw2gVn6JmEOt+kSSl7
	ERq76D4OaPTJ8FlOCtc05HTw5+WW0P+dL+HE5xsUYfx9HWfPa7yPoOHXPYwrmlZ1w==
X-Google-Smtp-Source: AGHT+IHzGfi8JqgrtJkJCqsaRzgZmxPWRir2HsTiv6pOD1D/PSO5j8J0EGMa87PX9JhMa12ajsfr7w==
X-Received: by 2002:a05:600c:4586:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-43668a3a3c4mr357327115e9.21.1735835655821;
        Thu, 02 Jan 2025 08:34:15 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b295sm499265665e9.33.2025.01.02.08.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 08:34:15 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 02 Jan 2025 16:32:10 +0000
Subject: [PATCH v3 5/6] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-5-cb66d55d20cc@linaro.org>
References: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
In-Reply-To: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-1b0d6

Add in 2 CCI busses. One bus has two CCI bus master pinouts:
cci_i2c_scl0 = gpio101
cci_i2c_sda0 = gpio102
cci_i2c_scl1 = gpio103
cci_i2c_sda1 = gpio104

A second bus has a single CCI bus master pinout:
cci_i2c_scl2 = gpio105
cci_i2c_sda2 = gpio106

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 150 +++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 5c7b0c048d41a4ba3d74bbf77216ad09b652ed30..97ebf5596dfc3caa920ef85722ca8afd49cd3c24 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4648,6 +4648,84 @@ usb_1_ss1_dwc3_ss: endpoint {
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
@@ -5271,6 +5349,78 @@ tlmm: pinctrl@f100000 {
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
2.45.2


