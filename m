Return-Path: <linux-clk+bounces-3266-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C929F847793
	for <lists+linux-clk@lfdr.de>; Fri,  2 Feb 2024 19:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FDE028A20A
	for <lists+linux-clk@lfdr.de>; Fri,  2 Feb 2024 18:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72FCC152DE5;
	Fri,  2 Feb 2024 18:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SQjGavV1"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6868A151CD1
	for <linux-clk@vger.kernel.org>; Fri,  2 Feb 2024 18:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706898904; cv=none; b=honUAj0y9umj5tKHFOEp3AkCx9pTGRl1pWqYNIupAxosRYr2MPDwoCZ4LWz30DEk5uNXKbzMX28WSGaUv6icaLnNGgHomZ1EEHDIo+QzHP19HL1+RNmPsqlVD6d2pAdS6y0JR6/uBKBoP7fFpIgC4kzbJYH/LXEnQK3pHDdIWyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706898904; c=relaxed/simple;
	bh=MVhUWSY/+upRsPik4dsc/FIDp5JpvuJHiJdLly35s/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IFyBcb80nn2lMO3G8fUVeluBh0lN4t+3KXCDkp5V1xxnEUQdc7AwGxIwUJa8sJSaHsp3y+Z5uLagErJFLq2rb5jGmotYAGgXhhQIuYShwsbx8bTy6QJwJJbZy6Chxs/eXfYL50luhAuFCIkjQQiiihwKCQGhHEFdLdkWyaU7aRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SQjGavV1; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a359446b57dso309502666b.3
        for <linux-clk@vger.kernel.org>; Fri, 02 Feb 2024 10:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706898900; x=1707503700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oATv8NOQxxuUnkhYBjrPZ5SJTfwj18//AqKtxSW/XOs=;
        b=SQjGavV1k6BwV0pmLpL/Wyp10cRAVmSjSF/8ShTGXkhQRo8GYFVa55Z+B7dbohCy+L
         P/aothB8/yOh7DnOO1BTjQZ5ifebe10vwlnlze+8zaFg2XIEd0ICibiWR0bauUY40r2S
         D+1UelvioAS3oiWo5lWdkWvqeoH8ETdaZBgwNAl9WChbScM0R+i37pJVxO9BPjv5rJ5d
         V/KzLHGhFJrZk10GUkfCoXVmuX6DCUzmDI/YxIDFENIljxykHvI1UJ0lqgRoahteTZ/A
         dUbVfFYWR+lbGQaLffkZhibE+eTb2TKqVrO9YlnRfMLB/v7iFBAyuzL0q8V3sziGBPHA
         7uDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706898900; x=1707503700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oATv8NOQxxuUnkhYBjrPZ5SJTfwj18//AqKtxSW/XOs=;
        b=hVA3aOhZp/XxIVkGZ7UNXIfLQ1R78fMYADLL0gy/rHbO4YGy+YxOPSnbtdgwt2oLrK
         6NntIMle/zxldpfx0SuSPzUhAv/gDccDBBsjpLef59w9nsFwTeuLpyJ+IZvPNmyBL7ZM
         GEEDt/tAoXTdeMMtgcb2/evSvtyBh82NyCQp5RwzpnLw9ly7MwDmF0JCZvPsejS0rjah
         Pi5uYjz3n7kpliVXxeIcLhJdOtBTpP8rseSJpcDADZ0wi/lNNCEPUs5WQbtB1HbXdGhi
         7b1485U2jGG6sbXjOiTbErQbNrIM+xa3bljyPpYWSE2h6hZQx0e5kwqShs0w0/6FC38a
         bJew==
X-Gm-Message-State: AOJu0YyPfkc4oVHmAjilNeZgbNloqZRJfjbxwDFvVq39Hg6mp9h4l0yx
	LEWQlPMlPEw78e/EaKRNweb9CTSS+4xhFsgdqxQRBwGKfLu5rV7BXtzPUKeBc+1WZDAa5EB6cR3
	L
X-Google-Smtp-Source: AGHT+IHqPcxgh6EwfSHLM1DTtsOp4EZquavvptK46bG9jZPEQzW7pdWTp3cMsf7EWAS97QAqiNDDvg==
X-Received: by 2002:a17:906:f8cd:b0:a35:a71d:81fe with SMTP id lh13-20020a170906f8cd00b00a35a71d81femr4240881ejb.43.1706898900428;
        Fri, 02 Feb 2024 10:35:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUonW9C6J6vA34sIMV4A5cTaacnGfQgVVjXrISKDB1og3MpxsggVwT1wBjJyhK0KjFtKr9cYfE/NfuLzK9DGrvLxjJefUzrSqPZL/YXI3eh5WLwJzWjfX6+lOqBqOMl/I/1Q/mknwihuvNUnh6URioxQagRv6P/23zQJaH3c4bZYQwWfhqYVVUCOknrRby1/TNtoY22cNzbrLLH87kddN6Jl8yClx/BBVDXc2Nt5IGdaXkW8VM5j3w2n75a6o9/UrQPSdC3nim7Ur/0J7KrMiVv6fiQs2K2fBCCsLOY22h5kSJMQlCievuQTisHnDle14RTFTjdxCFvTd09dtxd1aYY7rHmPDmt6Dk8rcVSrKuu4VS5py9zzeTYhTdRaYoFY41qO1CI5L65jp5ANaNuTooIu0qMp8SKwcW1A2l/AxOUpFxdRAqQoc8y5ScJkt0NAYGf7cdE/sHCH1VG7CwotUz/ZkHiK6tpaJGec8kE3mtlo6wSU7RBBQRxW3X7XKceI048hb5fA446bpy/o0WQysmezWQ8jD2NT3s02o+l52igLViWOwkf47DhvQauy/rjx5H+1GL6wEfoQJBYyd5tNOj4lMWNwKirGesG6uOU+XCCtKw5TybK13+xUR8hKorL4fmr73MwmHiDIkgGYYV7X/qOeZZU9SzrU56f1Us=
Received: from [127.0.1.1] ([62.231.97.49])
        by smtp.gmail.com with ESMTPSA id vh10-20020a170907d38a00b00a36fa497a65sm1051328ejc.110.2024.02.02.10.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 10:34:59 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 02 Feb 2024 20:34:38 +0200
Subject: [PATCH v4 03/10] dt-bindings: clock: qcom: Document the X1E80100
 GPU Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240202-x1e80100-clock-controllers-v4-3-7fb08c861c7c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3720; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=vLpNxW+lAlbuQp8bP9Fd2lailtB/NBx2GC9/qnTEXIM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlvTXFxbd3vfomEVsQXiJzlPXRm5YdIxdMe/yku
 CcHRX3YQlyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZb01xQAKCRAbX0TJAJUV
 VvqVEACrRXMqcu+cwViD21xTkx5fPX/yCDOXBpnBM1lRyhku3QGUlvUHcC8APiZeMc5PZrbuVL5
 xh83Lj6wY8UFtQiX6uLWHFKHr/UpvaXpxRYKZCNKjddXWalx5bQzwEjEcku0ahb4OM2FUHTEGRO
 7354AlEIt6A99UJu9JEjhQUJ1MXhDQO5LXgWYE3S6lWnvpNibLfSYm0LIbk0bhpJs/vAAfOmT87
 QqsgdFUkFGF9Eb240+aRabKiRh9BuN5ZVHRUNikG7g/WY+UiyaeM+wurje+ruuITf4qwqZwmgWr
 GN5dMKXyj3aD2xHwgvR9c1i6OuoyKQtOXVettVtlCmu/9a2YytWKN/CKahDSnRY0Ha9tjWBqO60
 G14mNMiKiRO1cHGYmFLgIUcwJgY9lfmVMgyG480CwAB8WV9tPrj5ZHF9EVgOF58N8H/dPiAfznk
 Rf4N/Q7sFV28MI0j4YHiSuzKaHGbs6ddoeoL3UpKwsqZTKVWPyhOYFH29H+16RcXLEDjF+4Aep7
 AvCFQ80HK9kPtNjmCLah/GtGYXDEWFsOuJirrruJ7vjlCYbfl9IDWbVmrmQeZJHxcGT++O1aBYI
 QkVfXsPh+AIqXw6BGP12Tgec42EK+VvVnuTAJ4/sCGsaoVAvaz4VLBHZgcaDSEe/T0wNX2uK0uW
 /3BM/LmKkC82Q3g==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Rajendra Nayak <quic_rjendra@quicinc.com>

Add bindings documentation for the X1E80100 Graphics Clock Controller.

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 ++
 include/dt-bindings/clock/qcom,x1e80100-gpucc.h    | 41 ++++++++++++++++++++++
 include/dt-bindings/reset/qcom,x1e80100-gpucc.h    | 19 ++++++++++
 3 files changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 1a384e8532a5..36974309cf69 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -18,6 +18,7 @@ description: |
     include/dt-bindings/clock/qcom,sm8550-gpucc.h
     include/dt-bindings/reset/qcom,sm8450-gpucc.h
     include/dt-bindings/reset/qcom,sm8650-gpucc.h
+    include/dt-bindings/reset/qcom,x1e80100-gpucc.h
 
 properties:
   compatible:
@@ -25,6 +26,7 @@ properties:
       - qcom,sm8450-gpucc
       - qcom,sm8550-gpucc
       - qcom,sm8650-gpucc
+      - qcom,x1e80100-gpucc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,x1e80100-gpucc.h b/include/dt-bindings/clock/qcom,x1e80100-gpucc.h
new file mode 100644
index 000000000000..61a3a8f3ac43
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,x1e80100-gpucc.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_X1E80100_GPU_CC_H
+#define _DT_BINDINGS_CLK_QCOM_X1E80100_GPU_CC_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CB_CLK						1
+#define GPU_CC_CRC_AHB_CLK					2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DEMET_DIV_CLK_SRC				8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_GX_GMU_CLK					12
+#define GPU_CC_GX_VSENSE_CLK					13
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				14
+#define GPU_CC_HUB_AON_CLK					15
+#define GPU_CC_HUB_CLK_SRC					16
+#define GPU_CC_HUB_CX_INT_CLK					17
+#define GPU_CC_MEMNOC_GFX_CLK					18
+#define GPU_CC_MND1X_0_GFX3D_CLK				19
+#define GPU_CC_MND1X_1_GFX3D_CLK				20
+#define GPU_CC_PLL0						21
+#define GPU_CC_PLL1						22
+#define GPU_CC_SLEEP_CLK					23
+#define GPU_CC_XO_CLK_SRC					24
+#define GPU_CC_XO_DIV_CLK_SRC					25
+
+/* GDSCs */
+#define GPU_CX_GDSC						0
+#define GPU_GX_GDSC						1
+
+#endif
diff --git a/include/dt-bindings/reset/qcom,x1e80100-gpucc.h b/include/dt-bindings/reset/qcom,x1e80100-gpucc.h
new file mode 100644
index 000000000000..32b43e71a16f
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,x1e80100-gpucc.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_RESET_QCOM_X1E80100_GPU_CC_H
+#define _DT_BINDINGS_RESET_QCOM_X1E80100_GPU_CC_H
+
+#define GPUCC_GPU_CC_ACD_BCR					0
+#define GPUCC_GPU_CC_CB_BCR					1
+#define GPUCC_GPU_CC_CX_BCR					2
+#define GPUCC_GPU_CC_FAST_HUB_BCR				3
+#define GPUCC_GPU_CC_FF_BCR					4
+#define GPUCC_GPU_CC_GFX3D_AON_BCR				5
+#define GPUCC_GPU_CC_GMU_BCR					6
+#define GPUCC_GPU_CC_GX_BCR					7
+#define GPUCC_GPU_CC_XO_BCR					8
+
+#endif

-- 
2.34.1


