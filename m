Return-Path: <linux-clk+bounces-1460-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B66B8136C2
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 17:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF5CE1F220E8
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 16:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D1561FD8;
	Thu, 14 Dec 2023 16:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zmuahzZQ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC2A11A
	for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 08:50:04 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a1db6c63028so965911266b.2
        for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 08:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702572603; x=1703177403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2f0vWrrLN9r6JtVj/pJTYCM7OCom47ePUJz9CUtDnDo=;
        b=zmuahzZQS2KWryRjR7KVD0d4vm7Xcv0XCn1dJHFrTw5JXdpdYxz1c8BhEWLkpYftSj
         pb8+BlSouNhItuqGzPkuaa+gUfNuLx5KTaoTe86FPLMK8G1X6EMxfowBNqSgC8sNY1Qs
         g45EPwxwGvcSdPDS+cUT3kBK/NXqOH6rQNvBZ2tg3aGK5JH9OGwRELEjkUYt9gjUafiE
         WBbqEPx53RgvqUQvMQ2NKicNZEeB66bjmAky3rqEmtNVYO9OupaFii5/9cizCFK7pdOP
         NXhsbCuAwz3D3+I1K83J0lxvSBwU/WaRrMpVz1ZfUaBQSp+pRWX7Eaqx3SGYcfwsEpVf
         G1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702572603; x=1703177403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2f0vWrrLN9r6JtVj/pJTYCM7OCom47ePUJz9CUtDnDo=;
        b=C+bRBA8a5OL7rVBHNwSsUHk+bUlHvfoBGKNAe6y+tABRM9hR+GbLgdIMGKM34jxQni
         vEwC+2rQbq8ITR9h3U1erfK8PgFjbV3pz85Z37F/ktKDz2HFtKK4uTNyDvUD8HQ0546h
         ph1gdoECdZgwoSuX4GVYGQRco3u2UJSN1qB5+Yi0EHneRi/h29YvpmqH5YXXdk1xPGv0
         sMm7ItdDlHaBEhNNbiYxb9IXwoo4jufSvWkPOAtfm1Wdk/QMV2Tu3WA2OGd4booNphFQ
         FMcXSgBuwfduwqIl0hmMAZQdB/ZQXRMdiv3Puq03sny9ybgnmPU+fgulTKuSaE/DPAyx
         o0NA==
X-Gm-Message-State: AOJu0YxK0P5uKWhsC4aDG8K0efYb/X3xfo16K4wSvw1eGaCpe4dsnVzc
	tFZrj85C0U5KrKG4QsqVjdU4Kg==
X-Google-Smtp-Source: AGHT+IFqN6jd0HwTI8TIzOyJhG8PU84CZEn8n0N9wDpvc+C3xEqS/xMMqiIg76BOxfw1lgzjj0eH+w==
X-Received: by 2002:a17:907:741:b0:a1c:fba4:b9ab with SMTP id xc1-20020a170907074100b00a1cfba4b9abmr7233987ejb.95.1702572603142;
        Thu, 14 Dec 2023 08:50:03 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id tn9-20020a170907c40900b00a1f7ab65d3fsm8530308ejc.131.2023.12.14.08.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:50:02 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 14 Dec 2023 18:49:32 +0200
Subject: [PATCH v2 03/10] dt-bindings: clock: qcom: Document the X1E80100
 GPU Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231214-x1e80100-clock-controllers-v2-3-2b0739bebd27@linaro.org>
References: <20231214-x1e80100-clock-controllers-v2-0-2b0739bebd27@linaro.org>
In-Reply-To: <20231214-x1e80100-clock-controllers-v2-0-2b0739bebd27@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3726; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=wZ8w3YuTxVRUPTbMl52SaOakLwx7kzXshaNYLEqrGyM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlezIqJtNO1+zCLhJRLusrGMkFrWzmvrCB5zMpD
 BeKY0TmbtiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXsyKgAKCRAbX0TJAJUV
 Vky+D/wLq2lvq39AhYFZvXUn+VjOFiaoeVUKx2qT0CVxpBo4uNlSbA6Y7M2sZ4orcxlpwmWzLgG
 wKjEKXaXKJLf9FKtWD6RoGlOue2X3JZT8GYv2F8fuj/l34MUoTslu5Xtj7iLQ2bVvdLF3r3Xgqt
 nGqoUH96qcaKdrW5YqtCcPWyXXEZ5XFv7LS/bepQJN7WIMNcgsoDhWBVCQJz/8DFyBe72H3rpqI
 rkzrmyjDiIQ2FaIoKf0nhKMppovwm20UPD48c5/9mtBl1RboyTGiOJjRuVdzcgI+s4xSSKFi2xE
 Hc20ifK/K+QWPYvQm2XBFQmd6qjlVTtQdNJRqUumeA/hLlpStYK7AgzlhN74az6KpA9C/gX56lE
 hQpLZsDN5lRG9P7B9Lc3mgw+MMMRfB5e8CrpZR7Xrsjhpsm7Xo0Bu+zrn0j7OSuKyCtiexWXk8C
 WVljoHlBSej8zLEROv0D52E8WlWOxLDnGG5LSNxj/v5FOGYo95GfBmqn0QpOfxACpzUPLNMkJX/
 hWefD8IIoHE3DshE+bi60HcDWAGh5TyH+Q3jFPZD1BDoBoizeLU1z+dZtP+MwXMFJehewqvQhl+
 5AP6MY61x9LofdE5G/FBfjLwsQuQ1v5ebNbq1LNg6Uo9sbu/JLaco76bms5jFhPUbvRqWdECWLH
 Z6D1cdrBFfpLwAQ==
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
index 000000000000..6240df8b5a3b
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
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
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


