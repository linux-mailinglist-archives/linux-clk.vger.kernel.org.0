Return-Path: <linux-clk+bounces-7817-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9142F8FE578
	for <lists+linux-clk@lfdr.de>; Thu,  6 Jun 2024 13:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19AD4283992
	for <lists+linux-clk@lfdr.de>; Thu,  6 Jun 2024 11:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA510195977;
	Thu,  6 Jun 2024 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BUBvDUnU"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CC2195819
	for <linux-clk@vger.kernel.org>; Thu,  6 Jun 2024 11:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717673768; cv=none; b=IuVP4DL+EE2VydMrg7tifT7Wtly6hZ0HKYA58cETVFVyB8APbuY1A6soj9sR0Oi5DG+MZ5MG6KURKOLzauRB9t6XosR69oI2DLfr5ivFbfvyiDmASYX2QJp8B9oUpzPTzUvTQ+CKML58YLxnWYEupSG1PFaR1fXsM0Hqsl4LZD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717673768; c=relaxed/simple;
	bh=sI0N+gXKPVP3QbPJPNuP8btkVLaRyBbKcbcqKnzx9k4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RHzu/h5PaO1xKoeb/mWYjMbdHf9qOI3pHshhH0ZhxzJohdqMf74A8TtROgjLi8MKJemgiAQkABwW19YR1xXBQcvkAj2igBo+eZOS4TIBzQ9aGSpZmJ4otScaSbfUeOE2g6ZdPyZHWBaTQaoVqwbfVBsW73XpD/ey1DmLfRgeb6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BUBvDUnU; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eaa80cb4d3so11998251fa.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Jun 2024 04:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717673765; x=1718278565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PK95U6T1OzBc7SkUtP7fADcsaPx2Hq7BisLs6oxG+E8=;
        b=BUBvDUnU2ClY6SImcYoBg42L0nd60dQ3nwdx7EsvZ/BPQHQjH/rk2QFIPxsrvBarNf
         2b+wtTVQSRfWzQqlaisoxDM89OoMNNtph5VTFKLUoHMHBkgGLvmMFi+guQ2Rkf3vPXHt
         VWn7HP6isa1ocJ5xPMolm/7kxyb0ucaDavxCiVM1+rTclMlXORwS6O3zrbXYwEB2gv1f
         gG3q/8mYsKxqWdVn4HWWMl/dQe/YBmueHNk7rDkclvzuTjh2JApzM6GCT0Prejpb+Oni
         m7nQCFc0JjR8+KsNb82uIwNGSuPyJPbzgeAiHNJVQoLUynjpBMhGi+5D4AzJ91svIZuY
         DNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717673765; x=1718278565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PK95U6T1OzBc7SkUtP7fADcsaPx2Hq7BisLs6oxG+E8=;
        b=AYnVRARrisXnBa5lprT7MB2+O17hsBJ7LAD0qgyUdjEHD8zmsQT/XFxg68qqewU+M6
         ic9+Nqu1YmG6FNQA1ppCm5F4hetrhYfvcQZAA90liTkYutiYslFEdbsJubsKDzEEMNUe
         agzXQ+MI80Y1o59yxpDMb0JETozFzTNkXIS5xruy7J1ijrPmyGUr7UzLJFnAEf2REgvN
         BAnU/cEcrHCkaHv/2RToU4bH7478U+KqpyTckxcz/tL7aLZQMdshHXQLd3l0bbMPTz7Q
         Ea2qNEfbUYcwEKChcrhL3xWxvgl6UgpHN4qXliLBKTemi56/oiIIbuqjNgiYksbPfjkb
         vrfg==
X-Forwarded-Encrypted: i=1; AJvYcCWgoK3LWLbuqxxRDjApE5SpuFpmaPNUVk5OBeCMLKWQ/RGlucvzXYpd1JAN4FVrq9ifrUj2LIJD4WKzLlE6mShjii7JSykNumcu
X-Gm-Message-State: AOJu0Yzo/HarHU41FFwMEWslIr3ZsfYcnKEAx2oLCs3Yy2hjPbcsDri0
	rEbGlSKD0gAbnaKoi/QgCH/kL3JjKediQglXRAdfTq4a6NuYVpwTH6ingNBn4OI=
X-Google-Smtp-Source: AGHT+IFaqbwXaxAArcyvx7On9m+sJ6KzrQFc91FEgGNgyqyQ462UA9Qvof5eF34yYRXObErVp+HIyA==
X-Received: by 2002:a2e:8814:0:b0:2ea:b908:d82c with SMTP id 38308e7fff4ca-2eac79c7c5fmr42505111fa.22.1717673764847;
        Thu, 06 Jun 2024 04:36:04 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c80581c05sm84014866b.7.2024.06.06.04.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 04:36:04 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 06 Jun 2024 13:36:00 +0200
Subject: [PATCH v4 1/5] dt-bindings: clock: Add Qcom QCM2290 GPUCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-topic-rb1_gpu-v4-1-4bc0c19da4af@linaro.org>
References: <20240606-topic-rb1_gpu-v4-0-4bc0c19da4af@linaro.org>
In-Reply-To: <20240606-topic-rb1_gpu-v4-0-4bc0c19da4af@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717673761; l=3930;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=sI0N+gXKPVP3QbPJPNuP8btkVLaRyBbKcbcqKnzx9k4=;
 b=+bolgQM0KQdj5ZJhddh9aE5/mCjBndTCLL1xVp7WhUrpIENDI929+TM02w5EBYb2f6o3qLwAu
 czIQuy40yC8D0H9txRfDhjnLc9mmZIw9o+lq74/MR56FHX6Nm/arbHg
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Add device tree bindings for graphics clock controller for Qualcomm
Technology Inc's QCM2290 SoCs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/clock/qcom,qcm2290-gpucc.yaml         | 77 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcm2290-gpucc.h     | 32 +++++++++
 2 files changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
new file mode 100644
index 000000000000..734880805c1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,qcm2290-gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller on QCM2290
+
+maintainers:
+  - Konrad Dybcio <konradybcio@kernel.org>
+
+description: |
+  Qualcomm graphics clock control module provides the clocks, resets and power
+  domains on Qualcomm SoCs.
+
+  See also::
+    include/dt-bindings/clock/qcom,qcm2290-gpucc.h
+
+properties:
+  compatible:
+    const: qcom,qcm2290-gpucc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AHB interface clock,
+      - description: SoC CXO clock
+      - description: GPLL0 main branch source
+      - description: GPLL0 div branch source
+
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
+  required-opps:
+    description:
+      A phandle to an OPP node describing required CX performance point.
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@5990000 {
+            compatible = "qcom,qcm2290-gpucc";
+            reg = <0x0 0x05990000 0x0 0x9000>;
+            clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
+                     <&rpmcc RPM_SMD_XO_CLK_SRC>,
+                     <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+                     <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+            power-domains = <&rpmpd QCM2290_VDDCX>;
+            required-opps = <&rpmpd_opp_low_svs>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+            #power-domain-cells = <1>;
+        };
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,qcm2290-gpucc.h b/include/dt-bindings/clock/qcom,qcm2290-gpucc.h
new file mode 100644
index 000000000000..7c76dd05278f
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,qcm2290-gpucc.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_QCM2290_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_QCM2290_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK			0
+#define GPU_CC_CRC_AHB_CLK		1
+#define GPU_CC_CX_GFX3D_CLK		2
+#define GPU_CC_CX_GMU_CLK		3
+#define GPU_CC_CX_SNOC_DVM_CLK		4
+#define GPU_CC_CXO_AON_CLK		5
+#define GPU_CC_CXO_CLK			6
+#define GPU_CC_GMU_CLK_SRC		7
+#define GPU_CC_GX_GFX3D_CLK		8
+#define GPU_CC_GX_GFX3D_CLK_SRC		9
+#define GPU_CC_PLL0			10
+#define GPU_CC_SLEEP_CLK		11
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK	12
+
+/* Resets */
+#define GPU_GX_BCR			0
+
+/* GDSCs */
+#define GPU_CX_GDSC			0
+#define GPU_GX_GDSC			1
+
+#endif

-- 
2.45.2


