Return-Path: <linux-clk+bounces-3268-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9639684779A
	for <lists+linux-clk@lfdr.de>; Fri,  2 Feb 2024 19:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D14F28A48A
	for <lists+linux-clk@lfdr.de>; Fri,  2 Feb 2024 18:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A22153BFF;
	Fri,  2 Feb 2024 18:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wf1bQJCD"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A7B152E15
	for <linux-clk@vger.kernel.org>; Fri,  2 Feb 2024 18:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706898908; cv=none; b=nL+TkJjRR8+T0Di6TRrH9Gwpvquq6VtvgUbVZoAkRcQ4wF65kniIXuSkM8OryEDI1NFhQodOoFu+3OmxVdmZ5fDlFz5JUPfPSJSztBxNzY38O4umbgD13O+mZT+OkDpx7U7BpswORXL1EoqtTQQxlMm5fVf6LoB24MKnskuDhfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706898908; c=relaxed/simple;
	bh=5o9rPc9rPhaIIYD3Qv1YS+E1/PQUOBaulRbsW2qNMng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hVRDk2K4g5kp9Xz8nSV7jJuveT7Q1+6frsbWKn50d9ZDb8EnKyFZ0ELoSj+4h2C2lmkPSjiEQuwUz4u/feVmaX9WLIpzwmGqFrJuLpftOe8bWieTahqhGDIQwQveNCV0E9namjoDvrzWV1nv9lQ1Si9/9QxHsy3+vp2/vxDrGT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wf1bQJCD; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a29c4bbb2f4so299449566b.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Feb 2024 10:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706898904; x=1707503704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SqvowzPBNes54tkE+QmrMP2CFzr9rwDQb7eM4POy6yQ=;
        b=wf1bQJCDQLarKuG9oNOwLNbpls8sJnjzUbxzz1IJzTdHoMkEjEcSFaoHW9/RSzbB76
         j6mAtsl9/m0QCIKnAUZzek3IiRDyNaI7NNW0qncxSyxHdOwVpUhF0WGdyTHqzGjN32/B
         lTHdTwKAjcl8DYaTEtJsdhHOtaWBzNBM38b1pggeeKcnYTJFbfHZdJhX6BuAlWDlsmtY
         KlnBnNTagoUJp21+R7gWG4szfYEJrWhXd07G4eO7zgqut6oVTU6yHyRGPU6VTLux+tkQ
         Ng65fCZDwq/j00i8QjpNg01YNwbJv2BjhHPREzMp5DWEyY0PODCC1pSgGuEgGyOC/gTu
         zAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706898904; x=1707503704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqvowzPBNes54tkE+QmrMP2CFzr9rwDQb7eM4POy6yQ=;
        b=jSaWVB6W8GL1j5OS4ZDuFGSg3X2DJzmJJgNNjYAUA6NxeYk1aTBp6q7EiDktzQfZAh
         ArXGxfzj+zzujVXjDZptG4CGpn1NE/riUvWvHEkHlaDTBZFkOw40aSDdylKIrp0BPi88
         gr9Qth3o6El8Aayy7gSTqMjq51l39nEMecAU6dsuZ4sUZIMkskR+brQs/N0KRgoyyzre
         lKL1A4xcpKzJoQXZrpjLRZTHURqKmPF5YYJ2ZH5rXtVhQVgSDfjf92fXX4xiGCdgc0CL
         mP5XGofh3JiJm+/mxS+g28rjR2CW+fxZRvKsssZyZlXrK1ET5yUd8FjlXHOF60kSImw2
         Uvow==
X-Gm-Message-State: AOJu0YxyzjxW7eDNW/EBzT0cbPGqQKQIIMklRKhI8QONZseFoSy7bARY
	msSMgYDsCFhbm821oNCp8yWfMwdOBBNtw6t5PXnG4Qn9cBPFxtcsaAyHy8UZkKKOiGg/mLxPtXN
	K
X-Google-Smtp-Source: AGHT+IEYXIRbeof76XJrq/TdKwvgjQBoDChGYGEO2/0bdC3eogIDuPhxfc3uwCqNWOhRoQjIgenUqg==
X-Received: by 2002:a17:906:f890:b0:a30:be5e:c8e7 with SMTP id lg16-20020a170906f89000b00a30be5ec8e7mr6032102ejb.44.1706898903859;
        Fri, 02 Feb 2024 10:35:03 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU27UBwtprRk5Z7qnWqhge4q8luRZzOEn5iIx+/1ppetdHPphEEfwZAbqDcwfL4YU+p2jQBxl4B/dRXd3S4p6yP3S0aqjPYj661ShRBbiWM35+1XKsNak7L+qhJL3cWLFJL36cInkNouni3QsOMq91wm8yMTAn3MwfRmVwxeCzTi9ib+ajtvAz8LFhxxkwQnQGapSAsOWIXZuRf+3eo4IC3PRbEgEFkOl9Huc+qLH9StYhH3sV43qVFAivtiPT3nYDsIWGvhWdDqUqr7UA0/RPCouqSNQcwRUa3t/7mPf8Bq3bjDvL9gzN29FFkJTvi8PPTIhTBPkdw5h+sXPg8B3OZo7gi9dSkTjyqxaCFGZDGzSOTEVsfdu1VigEbCtq6v5vtmKerpv79llMamO/5/2m0EEoAMmxGLxqqDHBFGT7ID+uf/PFwZbElcRkOobe39FIsq35IsMJ2yyxZVts8sycWDlmq/s/CalZNlGsqf1J/GCbjtE2N3N8p8OVTVnhBnjcMGuwF1ObTjE5rGca820iDSKKRoGTJke4O0/nJhPOeNGqFW45L7WudAngl7Ealk8brNo9YakDH6D5fzbaaPXTpz/s7c7/cSeG5fSPvQ9KrutpmXRQr0ccqHb8zgJoO69FacqlaVV0Xgf3Cqy5ddrUHt6UNm8b453Vdh5I=
Received: from [127.0.1.1] ([62.231.97.49])
        by smtp.gmail.com with ESMTPSA id vh10-20020a170907d38a00b00a36fa497a65sm1051328ejc.110.2024.02.02.10.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 10:35:03 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 02 Feb 2024 20:34:40 +0200
Subject: [PATCH v4 05/10] dt-bindings: clock: qcom: Document the X1E80100
 Camera Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240202-x1e80100-clock-controllers-v4-5-7fb08c861c7c@linaro.org>
References: <20240202-x1e80100-clock-controllers-v4-0-7fb08c861c7c@linaro.org>
In-Reply-To: <20240202-x1e80100-clock-controllers-v4-0-7fb08c861c7c@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6323; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=58HK41X2RwoVKAc3y1UdEE+FwgqR6qC/7J65pR95bFk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlvTXHmvzFPPQCCK7dNqdInIXWlVjfvxF+Se4SL
 KgKR7O1+SaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZb01xwAKCRAbX0TJAJUV
 Vt7SD/99ldtJBppmvH7rWo8MgRDNex4VDNQE10VBpo0FeFvRtXwy2sa3szPTZ+mUms1lvjzHOdO
 qxoTLouOEQK1q+LYBxUjbbaTZ9Esv+L1CzGiFOsvt7WtW/YABPTAMxQrxvEySV67FD5G+0BV+5Z
 o6OMZoAXufYWu+1hA6SQ+0lzF9d6VrdD8ecj0orjf8ccKjNxZSCWIWN4sURgQuR+Y47J+0oWOJh
 w/V85cV8VlEWE53uIWVi2pFMBUJe970RDcoANiRULJ44vrbp/I+ql2JHtlssON+kukxr1zTLQg2
 j1bg18Pi1fPC3Pe5oGW0U4uimoERxEABKEFoNki/sEsrOXJR7tKXef7wPUKdvaAxDPxUZppwZEQ
 b0VZUK6Dv5Tt0Byme4tW1J8RX+9rdODzxkWUid23Pxf6O8uSt8afZeRy22srdV+UbTbwUNuNNcC
 tI1XgsOX8LJqro8hnYdsC7VkkfDddHDaZ1tJ92ciF7BpHYyidayXTgR3y+tonG7RnXvaHPRJSBm
 JQlzSQhseViOmQrdTCiEo1EZOiUvUjwVW7Pt3ePF/MwCTtDU20NzlG0IxtHCbmf2m/jx8J0IJ76
 92XzXaLHCYrDAxaQG1WsTeM+x5dQQfo13jmuerM1YOdUsGk3qEw4+gmstkyBP7NcvMQP0LxkROX
 VVQ/lzr0mQ6fuAw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Rajendra Nayak <quic_rjendra@quicinc.com>

Add bindings documentation for the X1E80100 Camera Clock Controller.

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   2 +
 include/dt-bindings/clock/qcom,x1e80100-camcc.h    | 135 +++++++++++++++++++++
 2 files changed, 137 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 48986460f994..fa0e5b6b02b8 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -17,6 +17,7 @@ description: |
     include/dt-bindings/clock/qcom,sm8450-camcc.h
     include/dt-bindings/clock/qcom,sm8550-camcc.h
     include/dt-bindings/clock/qcom,sc8280xp-camcc.h
+    include/dt-bindings/clock/qcom,x1e80100-camcc.h
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -27,6 +28,7 @@ properties:
       - qcom,sc8280xp-camcc
       - qcom,sm8450-camcc
       - qcom,sm8550-camcc
+      - qcom,x1e80100-camcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,x1e80100-camcc.h b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
new file mode 100644
index 000000000000..d72fdfb06a7c
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
@@ -0,0 +1,135 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_X1E80100_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_X1E80100_H
+
+/* CAM_CC clocks */
+#define CAM_CC_BPS_AHB_CLK					0
+#define CAM_CC_BPS_CLK						1
+#define CAM_CC_BPS_CLK_SRC					2
+#define CAM_CC_BPS_FAST_AHB_CLK					3
+#define CAM_CC_CAMNOC_AXI_NRT_CLK				4
+#define CAM_CC_CAMNOC_AXI_RT_CLK				5
+#define CAM_CC_CAMNOC_AXI_RT_CLK_SRC				6
+#define CAM_CC_CAMNOC_DCD_XO_CLK				7
+#define CAM_CC_CAMNOC_XO_CLK					8
+#define CAM_CC_CCI_0_CLK					9
+#define CAM_CC_CCI_0_CLK_SRC					10
+#define CAM_CC_CCI_1_CLK					11
+#define CAM_CC_CCI_1_CLK_SRC					12
+#define CAM_CC_CORE_AHB_CLK					13
+#define CAM_CC_CPAS_AHB_CLK					14
+#define CAM_CC_CPAS_BPS_CLK					15
+#define CAM_CC_CPAS_FAST_AHB_CLK				16
+#define CAM_CC_CPAS_IFE_0_CLK					17
+#define CAM_CC_CPAS_IFE_1_CLK					18
+#define CAM_CC_CPAS_IFE_LITE_CLK				19
+#define CAM_CC_CPAS_IPE_NPS_CLK					20
+#define CAM_CC_CPAS_SFE_0_CLK					21
+#define CAM_CC_CPHY_RX_CLK_SRC					22
+#define CAM_CC_CSI0PHYTIMER_CLK					23
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				24
+#define CAM_CC_CSI1PHYTIMER_CLK					25
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				26
+#define CAM_CC_CSI2PHYTIMER_CLK					27
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				28
+#define CAM_CC_CSI3PHYTIMER_CLK					29
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				30
+#define CAM_CC_CSI4PHYTIMER_CLK					31
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				32
+#define CAM_CC_CSI5PHYTIMER_CLK					33
+#define CAM_CC_CSI5PHYTIMER_CLK_SRC				34
+#define CAM_CC_CSID_CLK						35
+#define CAM_CC_CSID_CLK_SRC					36
+#define CAM_CC_CSID_CSIPHY_RX_CLK				37
+#define CAM_CC_CSIPHY0_CLK					38
+#define CAM_CC_CSIPHY1_CLK					39
+#define CAM_CC_CSIPHY2_CLK					40
+#define CAM_CC_CSIPHY3_CLK					41
+#define CAM_CC_CSIPHY4_CLK					42
+#define CAM_CC_CSIPHY5_CLK					43
+#define CAM_CC_FAST_AHB_CLK_SRC					44
+#define CAM_CC_GDSC_CLK						45
+#define CAM_CC_ICP_AHB_CLK					46
+#define CAM_CC_ICP_CLK						47
+#define CAM_CC_ICP_CLK_SRC					48
+#define CAM_CC_IFE_0_CLK					49
+#define CAM_CC_IFE_0_CLK_SRC					50
+#define CAM_CC_IFE_0_DSP_CLK					51
+#define CAM_CC_IFE_0_FAST_AHB_CLK				52
+#define CAM_CC_IFE_1_CLK					53
+#define CAM_CC_IFE_1_CLK_SRC					54
+#define CAM_CC_IFE_1_DSP_CLK					55
+#define CAM_CC_IFE_1_FAST_AHB_CLK				56
+#define CAM_CC_IFE_LITE_AHB_CLK					57
+#define CAM_CC_IFE_LITE_CLK					58
+#define CAM_CC_IFE_LITE_CLK_SRC					59
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				60
+#define CAM_CC_IFE_LITE_CSID_CLK				61
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				62
+#define CAM_CC_IPE_NPS_AHB_CLK					63
+#define CAM_CC_IPE_NPS_CLK					64
+#define CAM_CC_IPE_NPS_CLK_SRC					65
+#define CAM_CC_IPE_NPS_FAST_AHB_CLK				66
+#define CAM_CC_IPE_PPS_CLK					67
+#define CAM_CC_IPE_PPS_FAST_AHB_CLK				68
+#define CAM_CC_JPEG_CLK						69
+#define CAM_CC_JPEG_CLK_SRC					70
+#define CAM_CC_MCLK0_CLK					71
+#define CAM_CC_MCLK0_CLK_SRC					72
+#define CAM_CC_MCLK1_CLK					73
+#define CAM_CC_MCLK1_CLK_SRC					74
+#define CAM_CC_MCLK2_CLK					75
+#define CAM_CC_MCLK2_CLK_SRC					76
+#define CAM_CC_MCLK3_CLK					77
+#define CAM_CC_MCLK3_CLK_SRC					78
+#define CAM_CC_MCLK4_CLK					79
+#define CAM_CC_MCLK4_CLK_SRC					80
+#define CAM_CC_MCLK5_CLK					81
+#define CAM_CC_MCLK5_CLK_SRC					82
+#define CAM_CC_MCLK6_CLK					83
+#define CAM_CC_MCLK6_CLK_SRC					84
+#define CAM_CC_MCLK7_CLK					85
+#define CAM_CC_MCLK7_CLK_SRC					86
+#define CAM_CC_PLL0						87
+#define CAM_CC_PLL0_OUT_EVEN					88
+#define CAM_CC_PLL0_OUT_ODD					89
+#define CAM_CC_PLL1						90
+#define CAM_CC_PLL1_OUT_EVEN					91
+#define CAM_CC_PLL2						92
+#define CAM_CC_PLL3						93
+#define CAM_CC_PLL3_OUT_EVEN					94
+#define CAM_CC_PLL4						95
+#define CAM_CC_PLL4_OUT_EVEN					96
+#define CAM_CC_PLL6						97
+#define CAM_CC_PLL6_OUT_EVEN					98
+#define CAM_CC_PLL8						99
+#define CAM_CC_PLL8_OUT_EVEN					100
+#define CAM_CC_SFE_0_CLK					101
+#define CAM_CC_SFE_0_CLK_SRC					102
+#define CAM_CC_SFE_0_FAST_AHB_CLK				103
+#define CAM_CC_SLEEP_CLK					104
+#define CAM_CC_SLEEP_CLK_SRC					105
+#define CAM_CC_SLOW_AHB_CLK_SRC					106
+#define CAM_CC_XO_CLK_SRC					107
+
+/* CAM_CC power domains */
+#define CAM_CC_BPS_GDSC						0
+#define CAM_CC_IFE_0_GDSC					1
+#define CAM_CC_IFE_1_GDSC					2
+#define CAM_CC_IPE_0_GDSC					3
+#define CAM_CC_SFE_0_GDSC					4
+#define CAM_CC_TITAN_TOP_GDSC					5
+
+/* CAM_CC resets */
+#define CAM_CC_BPS_BCR						0
+#define CAM_CC_ICP_BCR						1
+#define CAM_CC_IFE_0_BCR					2
+#define CAM_CC_IFE_1_BCR					3
+#define CAM_CC_IPE_0_BCR					4
+#define CAM_CC_SFE_0_BCR					5
+
+#endif

-- 
2.34.1


