Return-Path: <linux-clk+bounces-23880-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 079FAAF01DD
	for <lists+linux-clk@lfdr.de>; Tue,  1 Jul 2025 19:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FCFA520A7E
	for <lists+linux-clk@lfdr.de>; Tue,  1 Jul 2025 17:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F782820A0;
	Tue,  1 Jul 2025 17:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bUFQL+z4"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B48281531
	for <linux-clk@vger.kernel.org>; Tue,  1 Jul 2025 17:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751390944; cv=none; b=ZAVjVSDr2oCnvSaojg/IzgTcaruPz5mxqI19gxh35OK2xDG6qY2JYBqpTElPzAN2vvmophPBssIRwd63AGpJoVgQZt0W0rImaTM6vp4ZEl91y4hsGRWptUKd3usJBd7Heyc1JpdMnGZM8jujiJy0zgKQSHLMeDrMcAGmUTr0LkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751390944; c=relaxed/simple;
	bh=f3r9QS6Ff7gAlNMdR46m+asSbUOrL1rpH8x+IyKBwJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ISlCzl9LP/esY1+/yXuRnTqMPhdKPFS95TtCWCv7D1QTSptWKy1jRU78ZLKrZ2gR0BAUk9wdaqr8U3E76EYU1AcGn0hv3HMMZdGu3IF2xA0PU0fXk8k4YmvcvXQpitP83e6pZEGRVWHxH1Br6bbFaX4PPHZ3folj7spqMHmlUcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bUFQL+z4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso59253745e9.3
        for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 10:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751390940; x=1751995740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/y6Hgcw/oLowryHfdzVYEkIORqp2EL/7QgmBhCk+m8I=;
        b=bUFQL+z4pJMGbY3T0olgZjpGs3Ppjt7g1gXuW/XiZ/z/eYj0yZZwWrXUrieCxms4nX
         TwFg3ZSBcPXzN02KBIyhp6EIgbg56qgm48L9b5ZgA44O0p/xsnGRkX9udb/JpiSL3OKV
         h5meN8vg7N+br3ynt3zhW0UOB5xSYutgX4rSgp7tPFyeh4Wus4GEG47/9UXBVHPOEsvh
         ePACKkZmJIvpmbS/rMlGMB9I99VWWDnv5tVnrO78IfcC7dVjbCahuViK4Ol2sZLMpO2B
         2ZkgDsDukg0b/4YgJptaxVgnEq4ZF4qlJql9+Kg6av0I6y8iBXjEeZW1k8xY7QX0S7BE
         4liQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751390940; x=1751995740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/y6Hgcw/oLowryHfdzVYEkIORqp2EL/7QgmBhCk+m8I=;
        b=iA8ugpS5nvADdcC5xksLHJPzyqD2/CLNxmtkyEVcMG9N4PmIh9IDAjfXIksfB7ZhER
         7NhaUz9CQ/yGeGAntYnJ7H1NRcM8B8GCRLhx+ncIpcS4gSI+j1YI4BhDBhK+8dYt3zyz
         t1fEj+Vt+ABeIqKVQ1r7nYd+L2ycTxebA0knxAl5B38+qWpuaBZ2eSzIKa2eT3xv6/so
         OBGWAm0sDYd5Fy7jDm2b9FgjO0jzQLC2oXYSnMDDFI8ImEUlMueLIe4xXSxwLvq3iBxG
         7nXsqH1P9lk1myuCPl/ZeUHA4Y4N/ZRxpQ/OzCuMF4SMrqpZ065F5z6bq54eF8k3mi2l
         nSgw==
X-Forwarded-Encrypted: i=1; AJvYcCWJr1JKORO0NPXQCHjm3/YNfxCcqy9HLFb2VRyGU4gNi5bvNwLcDEpAhPy7sMcVyb2mYtiOg3LnGl4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6nlFOTiNKTcVjDZkH1rc4w+cpSZoiOkn0/+l8urpk3GIXvpca
	auf0LI13MLh1UuxAh5H5WBkk2/W3nTbKfwj5K9ZKxU3azcih9DNb9dMhUo1mqYJhMhU=
X-Gm-Gg: ASbGncvFyXB6/k2ioIWXce13gq3IBn3c4RPVcqfTQyjBry7vIua4a4e73zrDNzj4bhe
	Bj1Wvn0boFsM6WQ/B0Y5iJtSKIwyFeVHW+EqS5iVld0HiwzvgI9XwYz7jx/hmQOeFGd/PcVQ26L
	rbEXB+kqO+zz3qZCk/3ULfA30Wjogquhip4Q1hGLDtFYS/+7wCga5u9BoTArZdHQWR9D6Zn8Xu4
	OMktGZaROrcFxC23VnOuOjzClzvuXTtb/Drl8y590kzZ7954dGwIzt6rmjkhslNTfv/lQlxgGSC
	cJKAtwal+D/VGczt1yLE8ckl147n2FAq98qZxgG6kSRFVHNkx0lcaTaCmwtqMPc80KsjaBFHHCZ
	LvA==
X-Google-Smtp-Source: AGHT+IGOjQY9tSAGB2eFqWczvzKFeSwWfbshRjZbRtV8jkqhQWE3SX1v/Q7xboVyabgLEHGsCDwfkw==
X-Received: by 2002:a05:600c:35c9:b0:453:608:a18b with SMTP id 5b1f17b1804b1-453947d8ff2mr165994175e9.9.1751390940040;
        Tue, 01 Jul 2025 10:29:00 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:1425:eda1:87ab:f850])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b1b9sm198716175e9.11.2025.07.01.10.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 10:28:59 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 01 Jul 2025 19:28:38 +0200
Subject: [PATCH 6/6] arm64: dts: qcom: x1e80100: Add videocc
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-x1e-videocc-v1-6-785d393be502@linaro.org>
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Add the video clock controller for X1E80100, similar to sm8550.dtsi. It
provides the needed clocks/power domains for the iris video codec.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a9a7bb676c6f8ac48a2e443d28efdc8c9b5e52c0..890eaaa40184a18bff54f2d750968112a2546d19 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,sm8450-videocc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5171,6 +5172,20 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,x1e80100-videocc";
+			reg = <0 0x0aaf0000 0 0x10000>;
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_QMIP_VIDEO_VCODEC_AHB_CLK>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
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
2.49.0


