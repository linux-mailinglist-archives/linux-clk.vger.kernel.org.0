Return-Path: <linux-clk+bounces-455-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 879BD7F4803
	for <lists+linux-clk@lfdr.de>; Wed, 22 Nov 2023 14:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40A7D281417
	for <lists+linux-clk@lfdr.de>; Wed, 22 Nov 2023 13:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C8756469;
	Wed, 22 Nov 2023 13:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZrS1Y1vz"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B729BD5E
	for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 05:42:21 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-543c3756521so9296518a12.2
        for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 05:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700660540; x=1701265340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BWOWZJ4bKKTaHvDdXp7NnJtygL/XFE5ozRJDhdsHlg=;
        b=ZrS1Y1vzGcBuK+b2wTXMV+uh+3azLkG0ftZqCKno6oT0mphIQE0GeGBGgoiXv0p7l+
         AXwtWHdmFOeNROoGpdNXiKybWKdoPt5aBUScWC+FoU/05iumT3dZubDc0AiUxqxD2aCr
         acOyqfy8vdqDne3gChaAEmcbXFWcYWVof36Gdma3vezBfUEMBJdNNCzoXZ32FvhSC34+
         d4hjpwwBJ+oJeo/YgsT7dq3F1yT4uePrYgKFgkqg0LJdkjiszyy7eRNV/aUbbJZCWmZM
         hT75DPgzocfXGLv/N+CYYVHOE/KTbLg/xAS96ii3zBGYkhOTICWdULrlqXS1ED8IaRPk
         lxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700660540; x=1701265340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BWOWZJ4bKKTaHvDdXp7NnJtygL/XFE5ozRJDhdsHlg=;
        b=mRUlqJwUiBtrWmIudrbIJGp9M0LCONMjY6wWse+OnF53FIb0ntaXu+1+F8A6LRaAHI
         iTGMelWqHXbE6FI5fcD/5VOwR1dh2eWSdhp1Y7HUa/M+VBdKXYIknn19IilvtxEASFFf
         GbGXXt/CE5HtfID3uGkhfce3G0mwxvIZ527pqr3W1wmFI9yfAWV0+2gLj2P17yeLn9Zw
         LgUvktqUrRmFxMmm8oP2n0GgU/XmrXXY37z7TDrqZYhC8JhRUok54rxVdDsupo19lswR
         EnAfgdCrzsEjampyU7GO5qKNMLiBqDjd9Wdpnzn/QhHf0QNtRKdZjz5gyZKf+LAONCy2
         Tg2A==
X-Gm-Message-State: AOJu0YyZwvp7o3g7Gnd0TT3e5hDKjxncmddqQVp6Jf64VCEVnRkHUder
	FTA49ymIEEjpJHUYd1JNN3Tm2w==
X-Google-Smtp-Source: AGHT+IHKSnvRJnL0sSO4h5SVtYo5MxXvzsFAyXQ3kyjLuPM0Xi+Dlk0mOGgEwCYBXupDONo/5EzbuA==
X-Received: by 2002:a17:907:d38a:b0:a00:a591:929 with SMTP id vh10-20020a170907d38a00b00a00a5910929mr1860465ejc.24.1700660540106;
        Wed, 22 Nov 2023 05:42:20 -0800 (PST)
Received: from [127.0.1.1] ([86.123.99.122])
        by smtp.gmail.com with ESMTPSA id a1-20020a170906190100b009a19701e7b5sm6676797eje.96.2023.11.22.05.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 05:42:19 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 22 Nov 2023 15:42:12 +0200
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Document the X1E80100 TCSR
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-x1e80100-clk-tcsrcc-v1-1-43078c6d6452@linaro.org>
References: <20231122-x1e80100-clk-tcsrcc-v1-0-43078c6d6452@linaro.org>
In-Reply-To: <20231122-x1e80100-clk-tcsrcc-v1-0-43078c6d6452@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2897; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=ABrzOdHYRscdBJgZXnNOaPRIjzqaXUQAEaqk/uMwhbk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlXgU3PRluQqdUeuBzlGbnF7n829L6a1tCWnvwM
 l1wl0OXeC6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZV4FNwAKCRAbX0TJAJUV
 VtitD/9TZeupU1efniF1r1nYwFg6Coy5n1fYHyAkyNUxMDoU7aWqQHBf0QqPKbQ1RUC4HfGnQe+
 y/62OKh8F2Ok24X/oOZH/Bj2BaYoYzWDzVcrFssNssowTSMJ1ky2lUW/IJt6b0VGO1hHQaOFx0U
 RWqwWcJrlkTY4xfsRhKU7s3faWzQsWQLlE7mnS/pUQ1bJ1jB+O3UU9LAFPKoFnoWyRgPrfjopTg
 5cWvmF17Wo+QGrk//X3rh9kCzyg2uZbY4P6QBr5uUznskb8nNPjl7FrczqMW5c3u2GObbsJJdRO
 kmI3kt1xSnZ63yUSrnpX5XtslugIAwKVl66ALQE5Xtdcb9FOjxzLVJWzHqGp4yTFIbSmy0uZzcV
 JAEnq5DjJ1lqs1VMi24XncNZXl/nprtmF7uEsffpd1Baf7upISet2zqDygwAJjsDmieTzCjaWzK
 i5mHSYrSTTz0ghybcTKOhNwxefGozxfWwqYtXchlOu8zPZNTPtL0ncZmPCYVmuqp8aXN7KyRplM
 uLQarmeVBZHtklb8FpltnT52BI1g3CJhOqiJdG3WZoAH3lZkVwPh0xk45gKdySlodKgGBfpseoX
 UZYdrYXez2koW/TYgZf/es5eRtN1kGv/aF7exvXbWSl67NLA79qB8s8Z4WkqhGVDk8l/iWqTnCJ
 QiLGkhC3aLdHH+Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add bindings documentation for the X1E80100 TCSR Clock Controller.

Co-developed-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/clock/qcom,x1e80100-tcsr.yaml         | 55 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,x1e80100-tcsr.h     | 23 +++++++++
 2 files changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
new file mode 100644
index 000000000000..4adc8ee0287c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,x1e80100-tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TCSR Clock Controller on X1E80100
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and
+  power domains on X1E80100
+
+  See also:: include/dt-bindings/clock/qcom,x1e80100-tcsr.h
+
+properties:
+  compatible:
+    items:
+      - const: qcom,x1e80100-tcsr
+      - const: syscon
+
+  clocks:
+    items:
+      - description: TCXO pad clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    clock-controller@1fc0000 {
+      compatible = "qcom,x1e80100-tcsr", "syscon";
+      reg = <0x1fc0000 0x30000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,x1e80100-tcsr.h b/include/dt-bindings/clock/qcom,x1e80100-tcsr.h
new file mode 100644
index 000000000000..bae2c4654ee2
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,x1e80100-tcsr.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_X1E80100_TCSR_CC_H
+#define _DT_BINDINGS_CLK_QCOM_X1E80100_TCSR_CC_H
+
+/* TCSR CC clocks */
+#define TCSR_PCIE_2L_4_CLKREF_EN				0
+#define TCSR_PCIE_2L_5_CLKREF_EN				1
+#define TCSR_PCIE_8L_CLKREF_EN					2
+#define TCSR_USB3_MP0_CLKREF_EN					3
+#define TCSR_USB3_MP1_CLKREF_EN					4
+#define TCSR_USB2_1_CLKREF_EN					5
+#define TCSR_UFS_PHY_CLKREF_EN					6
+#define TCSR_USB4_1_CLKREF_EN					7
+#define TCSR_USB4_2_CLKREF_EN					8
+#define TCSR_USB2_2_CLKREF_EN					9
+#define TCSR_PCIE_4L_CLKREF_EN					10
+#define TCSR_EDP_CLKREF_EN					11
+
+#endif

-- 
2.34.1


