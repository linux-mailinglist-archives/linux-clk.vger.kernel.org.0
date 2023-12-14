Return-Path: <linux-clk+bounces-1458-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC108136BC
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 17:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62E55B20E91
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 16:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0D761FC7;
	Thu, 14 Dec 2023 16:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UcwtWV+W"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDBCF122
	for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 08:50:01 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a1fae88e66eso520037966b.3
        for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 08:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702572600; x=1703177400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2Wt9fAXkZ3ocbSZ++hiJKJPMhMtN2kMdg9DBtyKus4=;
        b=UcwtWV+WdTMGR7I1zeia9qz89u1Tqwpuq0w8TDU8jeNV4CVsE5whVdEiyrWP2URiFg
         LGSKghcysSV5MbK0ttLgcqjwSUFTmoh/7WZ98M+Q0buhy84Md7WZIqc9QKDKbW/1DKYD
         6Tor/KI93QHGBjzBZ1mru+1ZWNSw6GGFYZsNcnPtsxx/jTEiHuDYZ8T7r9uDid+v9ja+
         088CszN5bSTNUa6XcS+aP3JBaGtosqY5+ARyGmnrUY1ABjlhLByuBibOGE9pvqhvSFaH
         X0lJer7J6u2a3LKAhVzAyr6n4AqkFJ8DVddn7GpM+ETfPXSb/EuqzuSK68eUz6gjHc5t
         Rd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702572600; x=1703177400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2Wt9fAXkZ3ocbSZ++hiJKJPMhMtN2kMdg9DBtyKus4=;
        b=ud3kkOEDm/ObZTC8c38NBAc01jBpR141xAGl1FSqJlg8bRdzgQRz9j9GX/mXfp/ll/
         37De9X6ZAE6O0e9Le6ev7m/c2wkpEjY/P6COiJI7xBjqGKzff3alA8NXHxcontdQST9P
         7KEt8hbByGRLQblo1LzSBSc+GILjP0RNE/qi0WJwFjkIroxWuh/2K3+O9LUlKeU08aaK
         IjCsnv487DIdKgMtvDnklQvBV7D7VftuYp5UzduYMZ2pjBYMxBif2lOOPZRUhyHIP7nJ
         WUbAghfikQVnCEyVdzUee2rEssFoWBcTOUTzUhRABWqQqqsNTxoM0lZKb2++GjN4n4Vx
         hixA==
X-Gm-Message-State: AOJu0YwcO5azXSyy166LED3O0uvf6ICyAnMV7XqIFh7AJ7Po3KK91Pli
	bpXG8mrItm7/nGWoU434uWf1HA==
X-Google-Smtp-Source: AGHT+IGCOWJbqlqngxCwGXaFWU9O5TAVF+RVt3/auwMWynGWlG+iIA/H/qnW0PI1zApZu74LyvoKrA==
X-Received: by 2002:a17:907:3c1f:b0:a1d:511c:5be6 with SMTP id gh31-20020a1709073c1f00b00a1d511c5be6mr4231295ejc.76.1702572600221;
        Thu, 14 Dec 2023 08:50:00 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id tn9-20020a170907c40900b00a1f7ab65d3fsm8530308ejc.131.2023.12.14.08.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:49:59 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 14 Dec 2023 18:49:30 +0200
Subject: [PATCH v2 01/10] dt-bindings: clock: Drop the SM8650 DISPCC
 dedicated schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231214-x1e80100-clock-controllers-v2-1-2b0739bebd27@linaro.org>
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
 Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4633; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=k///e1KzpDnCc228R66xHigJDPcNt/klKkR8uId+QKc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlezIonPrJMBNrKMCJqB+0lmi+JqU/fXmsIWFHe
 SbaGkuJyNaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXsyKAAKCRAbX0TJAJUV
 VjCPEACUp+0G5HjLrMxsKcYQw+1fo/IR4w6vFfABGxo5OGkzIhFViTu9i8JupyKGhHrdTTyl232
 kpfAjE1RPoKI4CSu0bxwMj80P+yZv3qVrBM+jwKfvJbkqL/PSxFeO4qb0lVDFADANxGcSn6zZZI
 iPu9Q2zeQnk34PE6iSH4Vg3FiL7Mhf++BF5tVgOs2gIAgucrk4sbPnf7xDaUd93Ed2DluJ8DCSX
 EOOf4XetOXp+nVZKX/3L/5UrOs4z30Zw/zJMBoCa6B5bGSRKF9dQizw4ga0pY+GzFTz347cjgGX
 Ic1F7y1C9LEiNdxEz4JkRyvQBbG4dzcP4NQv3Jam1JsL0uYZxtlPAnlm5RUhwfRxJZu0mKW5N2Z
 atqY6lwHu2Y5XW/BVUiEit5wNSYUEau3qyqqXPNJgH619ZnsIb0kLZgfcnt9sV5Wh4dHYyOuvsi
 zisI++iyR4pVGItSw7V0tAtzpFwt86Sy3Nwd6oSbmFkBjGsIg+3IXKxHpHJuprUviLHQsn8Iszb
 encfELGYlo5BbUgftxxDuNEzz7VH72y/r4AeNpsdMvADDXZiUqjdvY6cRyVKlDRFxMzC0GGRlSd
 1qBznSZ1XjEe8i1mshe/rBAJAB8x24uGDqwb88me0R4Y45tMG6n+Zw68YQ4i2OLDW5EHdFhOsCD
 kb0v3XlqhZ/TkWg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The block is the same between these platforms, at least from devicetree
point of view. So drop the dedicated schema and use the SM8550 one instead.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |   5 +-
 .../bindings/clock/qcom,sm8650-dispcc.yaml         | 106 ---------------------
 2 files changed, 4 insertions(+), 107 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index c129f8c16b50..369a0491f8d6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -14,12 +14,15 @@ description: |
   Qualcomm display clock control module provides the clocks, resets and power
   domains on SM8550.
 
-  See also:: include/dt-bindings/clock/qcom,sm8550-dispcc.h
+  See also:
+  - include/dt-bindings/clock/qcom,sm8550-dispcc.h
+  - include/dt-bindings/clock/qcom,sm8650-dispcc.h
 
 properties:
   compatible:
     enum:
       - qcom,sm8550-dispcc
+      - qcom,sm8650-dispcc
 
   clocks:
     items:
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-dispcc.yaml
deleted file mode 100644
index 5e0c45c380f5..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,sm8650-dispcc.yaml
+++ /dev/null
@@ -1,106 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/qcom,sm8650-dispcc.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Display Clock & Reset Controller for SM8650
-
-maintainers:
-  - Bjorn Andersson <andersson@kernel.org>
-  - Neil Armstrong <neil.armstrong@linaro.org>
-
-description: |
-  Qualcomm display clock control module provides the clocks, resets and power
-  domains on SM8650.
-
-  See also:: include/dt-bindings/clock/qcom,sm8650-dispcc.h
-
-properties:
-  compatible:
-    enum:
-      - qcom,sm8650-dispcc
-
-  clocks:
-    items:
-      - description: Board XO source
-      - description: Board Always On XO source
-      - description: Display's AHB clock
-      - description: sleep clock
-      - description: Byte clock from DSI PHY0
-      - description: Pixel clock from DSI PHY0
-      - description: Byte clock from DSI PHY1
-      - description: Pixel clock from DSI PHY1
-      - description: Link clock from DP PHY0
-      - description: VCO DIV clock from DP PHY0
-      - description: Link clock from DP PHY1
-      - description: VCO DIV clock from DP PHY1
-      - description: Link clock from DP PHY2
-      - description: VCO DIV clock from DP PHY2
-      - description: Link clock from DP PHY3
-      - description: VCO DIV clock from DP PHY3
-
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  power-domains:
-    description:
-      A phandle and PM domain specifier for the MMCX power domain.
-    maxItems: 1
-
-  required-opps:
-    description:
-      A phandle to an OPP node describing required MMCX performance point.
-    maxItems: 1
-
-required:
-  - compatible
-  - reg
-  - clocks
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,sm8650-gcc.h>
-    #include <dt-bindings/clock/qcom,rpmh.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
-    #include <dt-bindings/power/qcom,rpmhpd.h>
-    clock-controller@af00000 {
-      compatible = "qcom,sm8650-dispcc";
-      reg = <0x0af00000 0x10000>;
-      clocks = <&rpmhcc RPMH_CXO_CLK>,
-               <&rpmhcc RPMH_CXO_CLK_A>,
-               <&gcc GCC_DISP_AHB_CLK>,
-               <&sleep_clk>,
-               <&dsi0_phy 0>,
-               <&dsi0_phy 1>,
-               <&dsi1_phy 0>,
-               <&dsi1_phy 1>,
-               <&dp0_phy 0>,
-               <&dp0_phy 1>,
-               <&dp1_phy 0>,
-               <&dp1_phy 1>,
-               <&dp2_phy 0>,
-               <&dp2_phy 1>,
-               <&dp3_phy 0>,
-               <&dp3_phy 1>;
-      #clock-cells = <1>;
-      #reset-cells = <1>;
-      #power-domain-cells = <1>;
-      power-domains = <&rpmhpd RPMHPD_MMCX>;
-      required-opps = <&rpmhpd_opp_low_svs>;
-    };
-...

-- 
2.34.1


