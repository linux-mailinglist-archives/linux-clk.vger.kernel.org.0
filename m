Return-Path: <linux-clk+bounces-660-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CF47FDFFC
	for <lists+linux-clk@lfdr.de>; Wed, 29 Nov 2023 20:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7FB51C20E07
	for <lists+linux-clk@lfdr.de>; Wed, 29 Nov 2023 19:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6505DF19;
	Wed, 29 Nov 2023 19:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T4T8COiW"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C003B10F9
	for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 10:59:52 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-543456dbd7bso2385214a12.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 10:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701284391; x=1701889191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BktGLjoUT+jQ2CjJ/2G7lqXMu8u/231fO4pfm8kXOFs=;
        b=T4T8COiWVK7oLrZ/wGWlf8ddzINpOj2gRnX/jP3iDHZlCjzCMfPWZQP5M8koGLUnoU
         hjdcmL2tXoO+iWt9XKee/xn/2eAGFjO4Yh7ArYww/5PaHi4aUlSi1CfRYSbqkzKgLT/a
         jgqjMVR9xu6ESdp3+Jzg6qwc3/nbuPrcFKy12rX/5pyBnR0rCA6TUnUL5CaH7+ZmN8JE
         QSq9BBJIZ7q4LgcvE0i9gMp0PtPq5F0ZhSHCH3YbEFooeuBa9baU5LkFzswaawwTUMLc
         3YBfZo76W7VBQZFO88LYJY05qI9fsv5X+zib68ppL5E8dw5bG/Lwe/exT1g7JDKKKdJc
         iQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701284391; x=1701889191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BktGLjoUT+jQ2CjJ/2G7lqXMu8u/231fO4pfm8kXOFs=;
        b=E+vUgcHuW3KC6eZOa8ZlacfczOUmnXppycoXSFGgvjbVTJLpZZHjxm/ZJn7dEy4/Dm
         RjOr+5xtSr0QsrI6MIfKX/xtVfhhe3By4ol+QjyQT30FL1mGJA3a/fBVUro+F9fiIxwc
         8xQx44CNkqswe2joZnoKnJcciyybjzkqN+GXjllKSpyy/ojqoabQHlSGYBN3JMD5V0Pb
         OsNpx1uVDkoV0y1Migbu9pAeSnnOecMmoQdPxpJjz2VR7sCkSVgXdH/MWraXS0djtRUT
         TiV3/8K0CWbhtlTBNU/qhmiweRdaB2pv96pAPJVl+MVxT+ntJZinVym1J6u0uNdREWEO
         zuHw==
X-Gm-Message-State: AOJu0YxZXbyxqbGN1M3UMMvkpsBUF8WDmjUbt3drVuDiX9Utmp95glQr
	E+HWX7cvXVo6QMyS9jxfZZtt1g==
X-Google-Smtp-Source: AGHT+IE4r0HSgszDAQ4bpN2R1WCQzA3fr+igrHgM9qdfErHjEMPn9P2EJTofVtTmHgo/hR5F825hEQ==
X-Received: by 2002:a17:906:2a4f:b0:9ef:e6fd:fdbf with SMTP id k15-20020a1709062a4f00b009efe6fdfdbfmr15963293eje.20.1701284391193;
        Wed, 29 Nov 2023 10:59:51 -0800 (PST)
Received: from [10.167.154.1] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id o11-20020a1709061d4b00b009faca59cf38sm8160232ejh.182.2023.11.29.10.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 10:59:50 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 29 Nov 2023 19:59:33 +0100
Subject: [PATCH v2 14/15] arm64: dts: qcom: sm6115: Add VDD_CX to GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v2-14-2a583460ef26@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701284367; l=758;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yowVSKW8+Oglx4OMpqJQ+Rw3KKYznjolCl6js+fkR+s=;
 b=vWt4jqPTrA91YGDo5lpBs7EDmMGIlJupgtH/hpPeRbIfWERwhvYAfiR5PZT8a0Kw1FQ5Uvv6i
 bfGEd2Mdp9ND7alhI8nMAbxAHBiBwYo7ooN3SM+bIdFPIZehHQD70XA
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The GCC block is mainly powered by VDD_CX. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 839c60351240..29b5b388cd94 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -784,6 +784,7 @@ gcc: clock-controller@1400000 {
 			reg = <0x0 0x01400000 0x0 0x1f0000>;
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&sleep_clk>;
 			clock-names = "bi_tcxo", "sleep_clk";
+			power-domains = <&rpmpd SM6115_VDDCX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.43.0


