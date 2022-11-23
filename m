Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B95C2636169
	for <lists+linux-clk@lfdr.de>; Wed, 23 Nov 2022 15:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237157AbiKWOUg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 23 Nov 2022 09:20:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237064AbiKWOUc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Nov 2022 09:20:32 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B5C654F5
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 06:20:24 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id x5so25549773wrt.7
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 06:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7te0vel29soMxRllHr57VveDfFHJcBPQQEi2+x2vELY=;
        b=a3m3viXN3IzLNf7p+L4t8UXvrLaFB6T6anOc0Sg+/ktJ1Tuvjbu8Vb95NXXRv63e9G
         0ZuDTMg5kkd+jtuCgtnLo0M2P8dgRkUQPgB60Tx5AJAKIR6kdXHnRebfp2OiHxaDl2Sc
         zta/2/sttlWMSfHMRnxh9XjAgY+q43ZlgOllf2Yhn3/kASu5KKa8H8NYc1KE2AeECTWV
         DuzRgNTX8q6wQFG9q8Ns0c76AtqaQ+u3j8sRjK2boejgx/vfv9ey5p/bVr3PZnizrkF8
         RlMJO9cHAWOxnojttB7ZwZnlyAyRcA6aHTbFvxP1Wv9lz0pxuPAYsIV0uu1v8wHCKuns
         re1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7te0vel29soMxRllHr57VveDfFHJcBPQQEi2+x2vELY=;
        b=k9Q0tsWlcRF7De4hW5gWD72bKtNY1bkbm81H3z7QpjYR14dp3MHT0iY7ZUdO/+AAzq
         sJyI+369CqVZ07915XKAaXRuFpivGpUIF5io1wJMjapqYRYPWw6mre01NdVRP97k3+Sp
         Lh1SuzLypMiEx1sOa9RhJj+OQ2kqqeKe3/5ymcDlXxcFdFyfm2ifY4j7gWPQu86H27nI
         eb65DJhGDeEoMpO/Z1fUSPzGIjsaKuRTJq23mBBGOU+iTCo3XxJrbPn5dbEHRo111u/F
         uI+rNHLU69/WF/zIWn82NtfUMQcEbyQptwYnm2Lid7x2LU5x5yZ+Zoklx+jMu7CPjbia
         xzAA==
X-Gm-Message-State: ANoB5pnwnDxCj8ea9k4ibfHEoKkhMJb4NQKzZ6a91kzYlLOTepurUlv+
        nPQHK4dE+HjmxJSUWJoUrVnFzw==
X-Google-Smtp-Source: AA0mqf4GrGMqqZLuTtwDxVsItw3cIKwn5sYR13+/xSINmwn3L6b2DfAt7GJd3ZcDy9kPHyuW7Ifo3A==
X-Received: by 2002:a5d:6e90:0:b0:241:e3b9:36a0 with SMTP id k16-20020a5d6e90000000b00241e3b936a0mr4715085wrz.607.1669213223272;
        Wed, 23 Nov 2022 06:20:23 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c4ec900b003cfd58409desm2837438wmq.13.2022.11.23.06.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 06:20:22 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 2/9] dt-bindings: clock: Add SM8550 TCSR CC clocks
Date:   Wed, 23 Nov 2022 16:20:02 +0200
Message-Id: <20221123142009.594781-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123142009.594781-1-abel.vesa@linaro.org>
References: <20221123142009.594781-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add bindings documentation for clock TCSR driver on SM8550.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

Changes since v1:
 * based on recent bindings, like Krzysztof asked
 * used qcom,gcc.yaml and dropped redundant properties
 * used additionalProperties instead unevaluatedProperties
 * renamed qcom,tcsrcc-sm8550.h to qcom,sm8550-tcsrcc.h, to match
   compatible
 * added dual lincese to qcom,sm8550-tcsrcc.h
 * moved patch to the beginning of patchset
 * dropped redundant "bindings" from subject line

 .../bindings/clock/qcom,sm8550-tcsrcc.yaml    | 39 +++++++++++++++++++
 .../dt-bindings/clock/qcom,sm8550-tcsrcc.h    | 18 +++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsrcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-tcsrcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsrcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsrcc.yaml
new file mode 100644
index 000000000000..a4531a7cad8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsrcc.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsrcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TCSR Clock Controller on SM8550
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and
+  power domains on SM8550
+
+  See also:: include/dt-bindings/clock/qcom,sm8550-tcsrcc.h
+
+allOf:
+  - $ref qcom,gcc.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8550-tcsrcc
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@1fc0000 {
+      compatible = "qcom,sm8550-tcsrcc";
+      reg = <0x1fc0000 0x30000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,sm8550-tcsrcc.h b/include/dt-bindings/clock/qcom,sm8550-tcsrcc.h
new file mode 100644
index 000000000000..4ce98ffc43ce
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8550-tcsrcc.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_SM8550_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_SM8550_H
+
+/* GCC clocks */
+#define TCSR_PCIE_0_CLKREF_EN					0
+#define TCSR_PCIE_1_CLKREF_EN					1
+#define TCSR_UFS_CLKREF_EN					2
+#define TCSR_UFS_PAD_CLKREF_EN					3
+#define TCSR_USB2_CLKREF_EN					4
+#define TCSR_USB3_CLKREF_EN					5
+
+#endif
-- 
2.34.1

