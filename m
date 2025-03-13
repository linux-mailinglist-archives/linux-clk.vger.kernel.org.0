Return-Path: <linux-clk+bounces-19450-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3399A6038F
	for <lists+linux-clk@lfdr.de>; Thu, 13 Mar 2025 22:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8D87176B24
	for <lists+linux-clk@lfdr.de>; Thu, 13 Mar 2025 21:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A174E1F75A9;
	Thu, 13 Mar 2025 21:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pbEhd9pM"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BEA1F582F
	for <linux-clk@vger.kernel.org>; Thu, 13 Mar 2025 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741902203; cv=none; b=YGdEFLiESS+wKzz0v/f/tLeiwWXZvEWRiCsobokHemcpuTlV1ZAWQ7uK0krS7e4E77VCNVD+Lfj0nBPCgoFO71Wxdx45rMGKUA4DrapiXkRXunBRmYUHuwXi6dPXQlOcAr3cLeDIayd1kAc1lFZq5/D1zdWAqLPVKYpp1QyOGqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741902203; c=relaxed/simple;
	bh=CU+/XDQ60jyq3i9MimUs3kFmTV8jnj/R31j8nRU/h1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y/hU+zRqyminf+A2yWZY2avgOFo+XqOFpFA2uDMSzpRctz/TRNXEef6t6aFr8gAHphEoIH87+8n9fr7jHClrsf4SQ/6UF4W2WtmorOuRAdZkHTRZcc33DQVqmuS7b0NqufHqZ/22puAzk/Ir58YJgxq46Joq2k1sUv2hP/tGQQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pbEhd9pM; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so2117328a12.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Mar 2025 14:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741902199; x=1742506999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DObyF/iUzXjPpPEbY0w+cm8oMYW2eB7he9g871AEyE=;
        b=pbEhd9pM8ra3fKyT2RD25J71QAUmiOcCl1UN/Ih1RumGcG5o38g4d00Dwf//mJKKUZ
         J91FTzCrmIFKaQT6oR7WLFqylYQur3v32DyOT9RVk5rueH6RS7PKO2euBG81y6k2AShs
         c7150ofqLXOe8WPWZdu5wjeDVmefVZtMmxTZQ4D1TGHQ9wc5Q+IEtOy2iwKdJ5bSFmLR
         qwwONoOkPdjyBgN+wRidak4xPrgIF8OJDSJeTOiDhT2BXvxiHL6pYhJPn0oKeR93J2mT
         pn1bYYAV7A2T6oPw75HqWisbuhX4f4SyG9j7NdLUi5YEqxURd727OLYyx/Hy380sS0c3
         Wf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741902199; x=1742506999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DObyF/iUzXjPpPEbY0w+cm8oMYW2eB7he9g871AEyE=;
        b=ubQ5MPHH6qTJPEIQ5E4tBryvlvxmBj8J6ErXUeQhD1wOa+xjHRpDb1R/RhgTi2LMYe
         5nBnXTfNAqE6TWR6FdLJkpoTJt7qdRZ9rq/puylkrr53BueQE+XhrVJb0rQyuLCM8z88
         soFJze2ADvyygWPRIRQKGHbiiwFxCuuhkSBL/c3Zl5tRsYHyAYHfsS2sek+/E2JMoG1w
         xglf1bjwFSRHsfg9f2B8R6944ZvgJfnX+C+M054lQHdAGGAZKNsG38ovJD6CW3bYAX3L
         sSYeVBJyRhebLo2+I5acSSubPt/52uDzQf6JMQwYX6Ve7CnTrkPuPfrDAmneJg5Cp1w7
         JqtA==
X-Forwarded-Encrypted: i=1; AJvYcCWwPahIc68a9cPcmKFOUq4V16r5UwAdLGkN4IBg3hH6MBvI8eZSM9hCGcLp6Y0e4WeLff7ZpsN4Fq8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx23hk5KNptHMHUecbRotZYUlkvZarnVsP27ZWGhRC3dk4OHaBc
	mI4xP6TxZt2g2ufAr0Z4FOKtP/oLbczPuRrK56JOx2SBOWkCBiupWe1NV0xee8M=
X-Gm-Gg: ASbGncs8B7UQslsVSFFWqofkOvUFNrKD0dTwU5UWK9TZEIiTGYi1/lw+YNV0CgtFVhJ
	Z9ZsQY/IGJN88Msajr6uiEJDMzZXEciGp2rRB2aQC4Vy8t0KDH2NVSpVQSLFf3dwVPwRXmct7iR
	Uh0pZIgc/eN7iciisebYDpW+e37IN1npm6DHJO5fnkOWd+/GpTyiknv1ktqnDo5DLkifiWbXXOY
	Mp9RFKp4Mf4PYQsimNKJNDm5hsWTprocc6yl8r4CDn3lWZvUkcnA+PhuEPjamCrePIEigGy4rV+
	RrPd3o8ThbRDNMTKIr1s17vaBdcJsBkDnoY1riAv8VRv1IJhqlyl0ARvBs6Aya34UmrNRwqOyth
	aCjA0BrhPJc9AuNZpDz6hiaGKmzhGOWugmAyWF1s5KY4HwjVmXh29N2R3q+TxIr4/xdKOqJ54+3
	hcEAs=
X-Google-Smtp-Source: AGHT+IGqp9Nz1XfOSp4Qxd087skZCs2Rbdil1yKkGG8XXXQucMNRahCo9RWdRZoOFBRNF3FMGjSfAw==
X-Received: by 2002:a17:907:7241:b0:ac2:892f:43b with SMTP id a640c23a62f3a-ac330376b95mr10613866b.36.1741902199562;
        Thu, 13 Mar 2025 14:43:19 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a489e0sm126938866b.151.2025.03.13.14.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 14:43:18 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 13 Mar 2025 21:43:15 +0000
Subject: [PATCH v5 3/5] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-3-846c9a6493a8@linaro.org>
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
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 46b79fce92c90d969e3de48bc88e27915d1592bb..065a219e69c632eca288c9ade001949e37b92173 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5116,6 +5117,22 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.48.1


