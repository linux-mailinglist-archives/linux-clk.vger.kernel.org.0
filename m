Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D020668202E
	for <lists+linux-clk@lfdr.de>; Tue, 31 Jan 2023 01:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbjA3X75 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 30 Jan 2023 18:59:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbjA3X7p (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Jan 2023 18:59:45 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CCCD2410D
        for <linux-clk@vger.kernel.org>; Mon, 30 Jan 2023 15:59:43 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id mf7so18180787ejc.6
        for <linux-clk@vger.kernel.org>; Mon, 30 Jan 2023 15:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjPN7pBI5UqQh3zYwpXxa2DpIw4tZgUWZdbUG7h3884=;
        b=OLrdnLOzIkECvzt95wsqIhyo24/uSrgDF8q5Bvv0vkVC1f8PcjmrnFHpJtSjG161ih
         7H7+bgvKNhypgoAMtLTsK2oLxVamvl7BQqDrfXflzsBCdCFo/z7KN2O2nmTysf3IRjNs
         M2yzxS5WCXSYDIIt9wZiPWwJsoFjrrWSzMAeJ1UM7v9k8WToNvIoRREBeannx2TJneYr
         ++nv61VGF6ibNoItFTJcxOoyjLcJUXRv0yT/9rfkDMhF3o9uridjDBxPqf4xag8rgwGB
         DprbW5I4P6weCnbKNnmNtQFLokJ3WhiWVSGu6lFMCGBtqO2g0D0wQ/v98OwKTCvdrJCo
         p+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjPN7pBI5UqQh3zYwpXxa2DpIw4tZgUWZdbUG7h3884=;
        b=a5kax0uMUHOaVzpX8ZfXibrB3/Mcu0Q/MVSxY0OaK5pgmSfWUqbzAj9EGjsRcd5Ac9
         hA6OdSoI06LvBN0LjuraWWqNu3I8AZRgqwt/yZcVuYiA/lQ7M/WbiIU+rAWLHvY+NVk4
         uUCz6zZz+ltxo2/LXmZ22V4l2FNUjrf/OW6dB0QuTGCq/gbJRMF7WlH/uI28R2kHlkwb
         /tq/07pGjZhWl6g5MJDjK4pXlH5Ng1cMczKZ+LYQMzJ50OcyefNnY1olL2GC8gog3fbj
         oMZ6w0H7MgliqRL4QMT+ejYP7vOJYLFDIUMzKRczQvzs/koIy8ugzY3fn9EvuVXq/1hw
         IgMQ==
X-Gm-Message-State: AFqh2kpi9jaeT2AixfhSUftRAJNFwfpDPOyuZVDQ2dJtnhOKmjLneN5r
        uSMaxRTYM8xazBgmrmb44vNdUg==
X-Google-Smtp-Source: AMrXdXshBq2A+aG9X2v+nQs+pC5yo4FtU1/Zkj/YtJ/chHsF2tTwAoGKEfKxDX+wCZAwXqGx7kQdIA==
X-Received: by 2002:a17:906:3741:b0:861:eb6e:8019 with SMTP id e1-20020a170906374100b00861eb6e8019mr49525879ejc.69.1675123183202;
        Mon, 30 Jan 2023 15:59:43 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id jr23-20020a170906515700b0086f4b8f9e42sm7577751ejc.65.2023.01.30.15.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 15:59:42 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/8] dt-bindings: clock: Add Qcom SM6375 GPUCC
Date:   Tue, 31 Jan 2023 00:59:23 +0100
Message-Id: <20230130235926.2419776-6-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130235926.2419776-1-konrad.dybcio@linaro.org>
References: <20230130235926.2419776-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device tree bindings for graphics clock controller for Qualcomm
Technology Inc's SM6375 SoCs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/clock/qcom,sm6375-gpucc.yaml     | 60 +++++++++++++++++++
 include/dt-bindings/clock/qcom,sm6375-gpucc.h | 36 +++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6375-gpucc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm6375-gpucc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6375-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6375-gpucc.yaml
new file mode 100644
index 000000000000..b480ead5bd69
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm6375-gpucc.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm6375-gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller on SM6375
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@linaro.org>
+
+description: |
+  Qualcomm graphics clock control module provides clocks, resets and power
+  domains on Qualcomm SoCs.
+
+  See also:: include/dt-bindings/clock/qcom,sm6375-gpucc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm6375-gpucc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 main branch source
+      - description: GPLL0 div branch source
+      - description: SNoC DVM GFX source
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm6375-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@5990000 {
+            compatible = "qcom,sm6375-gpucc";
+            reg = <0 0x05990000 0 0x9000>;
+            clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+                     <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+                     <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>,
+                     <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+            #power-domain-cells = <1>;
+        };
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sm6375-gpucc.h b/include/dt-bindings/clock/qcom,sm6375-gpucc.h
new file mode 100644
index 000000000000..0887ac03825e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm6375-gpucc.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_BLAIR_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_BLAIR_H
+
+/* GPU CC clocks */
+#define GPU_CC_PLL0					0
+#define GPU_CC_PLL1					1
+#define GPU_CC_AHB_CLK					2
+#define GPU_CC_CX_GFX3D_CLK				3
+#define GPU_CC_CX_GFX3D_SLV_CLK				4
+#define GPU_CC_CX_GMU_CLK				5
+#define GPU_CC_CX_SNOC_DVM_CLK				6
+#define GPU_CC_CXO_AON_CLK				7
+#define GPU_CC_CXO_CLK					8
+#define GPU_CC_GMU_CLK_SRC				9
+#define GPU_CC_GX_CXO_CLK				10
+#define GPU_CC_GX_GFX3D_CLK				11
+#define GPU_CC_GX_GFX3D_CLK_SRC				12
+#define GPU_CC_GX_GMU_CLK				13
+#define GPU_CC_SLEEP_CLK				14
+
+/* GDSCs */
+#define GPU_CX_GDSC					0
+#define GPU_GX_GDSC					1
+
+/* Resets */
+#define GPU_GX_BCR					0
+#define GPU_ACD_BCR					1
+#define GPU_GX_ACD_MISC_BCR				2
+
+#endif
-- 
2.39.1

