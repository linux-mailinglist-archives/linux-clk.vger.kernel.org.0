Return-Path: <linux-clk+bounces-1218-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8323580DE73
	for <lists+linux-clk@lfdr.de>; Mon, 11 Dec 2023 23:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B41FE1C21570
	for <lists+linux-clk@lfdr.de>; Mon, 11 Dec 2023 22:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D2E55C3C;
	Mon, 11 Dec 2023 22:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GYEiDsYT"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60DD4CB
	for <linux-clk@vger.kernel.org>; Mon, 11 Dec 2023 14:46:17 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-54c7744a93fso7084192a12.2
        for <linux-clk@vger.kernel.org>; Mon, 11 Dec 2023 14:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702334776; x=1702939576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsoAJFNu26vdr9BNYCc1ynSJNeqXOKNtue+SyOGrHv0=;
        b=GYEiDsYTT2675lhvf/KofvcZTZqOceb1/Fzsqz8Q00XI/hxQzPmSL99bs1fW2S7dxF
         vxXPeJsfWrsl2OCtgRAwassohSffpVGgyaSeIQOMINI8hpEe0FCiIPI5OT8Q5mtYsad0
         dgcXu1ghHyY0Yi2tgU4OCjStlHZ1WOU/gqIJ0g6b2fbv7Mn3cBlY7EzGIoRySolZEukr
         io5lqrzXXorY+rU5Nbi5ETc2BAgPxEyfam3dvnPfA8IORHIdHF4Gwd6ygAFK1JSnUP1f
         4QQuHqRkNdD70StiVl8PZwlbdi3Tj5FtVBqeFtfCNA6geqA/dgJJot84xSzzuQW1qhQo
         GfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702334776; x=1702939576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsoAJFNu26vdr9BNYCc1ynSJNeqXOKNtue+SyOGrHv0=;
        b=YsZnzk9dG5y62SBAHouaGeuXJslpVnOprphcJySzPpjgFnWUeR+LV4bT73fwE9ZDsR
         TNhGJTl6+AqoOMAJjX51oDOyfZJwCNVq4IfR+HNzEpPHtganBZ9WCLgo1JWgg1jBoon8
         NKxik9d1hsSczMBC1rsUDjrEgfAcnRlOeOJ9783910Ac1txKn54UE7qCZEGoyNRi/tEx
         rIFJ5pxC6TvFetao98hyAbUBEU4aMZs8Ff5Bf5iH7MeITntwyWFYUwRPjeFG5F3plxtc
         oFzzou5wFL4gRJoxNWmcpB1RyGU+9MDgZYsNY7LyNyti2kjbGxNZV4X6QBaT2gGnMUtX
         2vkw==
X-Gm-Message-State: AOJu0Yzqcm7P/xqip4YrMWgUNRpt7h3iVFgFoGjr4nO4bx6X4NZL08xe
	g0pY0AdRmc2Jq9zkD50OeP2m3Q==
X-Google-Smtp-Source: AGHT+IFjzGN56nJFx7UWbbpRdpJPod42FVYRi7QEWaFziOvnik51wqovoGShopF2Lt3+iMtjRX3pbg==
X-Received: by 2002:aa7:d3ce:0:b0:54c:92:4ae2 with SMTP id o14-20020aa7d3ce000000b0054c00924ae2mr2723475edr.39.1702334775768;
        Mon, 11 Dec 2023 14:46:15 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id if3-20020a0564025d8300b0054afcab0af2sm4091789edb.59.2023.12.11.14.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 14:46:15 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 12 Dec 2023 00:45:43 +0200
Subject: [PATCH 03/10] dt-bindings: clock: qcom: Document the X1E80100 GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231212-x1e80100-clock-controllers-v1-3-0de1af44dcb3@linaro.org>
References: <20231212-x1e80100-clock-controllers-v1-0-0de1af44dcb3@linaro.org>
In-Reply-To: <20231212-x1e80100-clock-controllers-v1-0-0de1af44dcb3@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3659; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Mt9Ann6pvcQzOxyXDovwQfzxG+r67mYDygEFsM73+zM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBld5EnOum58/Y8bNSCadJzormqjEV6x2tBwkUmG
 IiDVMDkKeSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXeRJwAKCRAbX0TJAJUV
 VkanEACdHssHxT2z6Q+78DOiJXWPBkewKYg1MLr/DZfTCfJfhAnd5n9AUNAufpYwt8dVR1rA3zv
 2TO4Vi3Mtfk4AZSt7dYFZ2MYAGGTv9TzjHVB48Cbnl5wTP/GhGcmPHCerrfCiijVcTSwNgDiplG
 kG9rY+uiJCZgXp4n1iCkjscu8N9u1tgU9TAEq5m1Xj/Y0a+WF/T4Z44hnn/pgxEOM4zdcbCN9vF
 ALZLplnpJBQyhgRvVYHrbG7K3oWkg44nET5IzIS3Gb0DXH+yQ53NM0/kKN01BTqn85rxfy8K454
 1NRUq342c2IcfsJyD8HFXJ5NlXHFM38pvQQkdhw8xxfSssDAGo/vkgz6DQzHcb/z5Oj5Cwjk/r+
 CJRcJGrMahukBUbvlt0I6kXj/4mNNL/+/GOmnYYsmdKK+wI7r9tH70GpeUlmd+8YeSU5zb15PFg
 KZI6QMfT2Z0OgNbjiOt8M7CsodgFNBoeLp0f7xbQReTlnTAXMlI4/8XsP1SOXo/v0kD2zEV6SIR
 BMU8ELzHijVx45REYiUYso6MlXSL0axtUhh1twO7unLmmdvHhjvKx/zYgJYdzSdtLL/bqvI+7BV
 LLCW0IhQGeqCtIwI5yVP0HpEdeb8g6QdX+hxTHUCtBXYRqPgEWZBVd/x+Aw0ASCOaIcQPcJOITo
 uqUoECGtklnEh2w==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Rajendra Nayak <quic_rjendra@quicinc.com>

Add bindings documentation for the X1E80100 Graphics Clock Controller.

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
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


