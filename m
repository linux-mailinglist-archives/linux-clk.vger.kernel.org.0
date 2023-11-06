Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF437E1BEF
	for <lists+linux-clk@lfdr.de>; Mon,  6 Nov 2023 09:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbjKFI0K (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 6 Nov 2023 03:26:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbjKFI0J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Nov 2023 03:26:09 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2D31BF
        for <linux-clk@vger.kernel.org>; Mon,  6 Nov 2023 00:26:06 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40859c466efso30994025e9.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Nov 2023 00:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699259164; x=1699863964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWWgLSIojExMEKZZG5MX5woSm7KoDCOw0EHW73wWRwM=;
        b=UrEYMR+gBkTTbK3YrCVcb+x53O8dG/pqG8DgOSqXeMdov9KLwKwjNc7DO5sFPplGMO
         suYG/meFH+HSnK6+quo84ztr/JbYkoU63NANRBZukWcrID1oEtilu65V65djFGRNb+5w
         fDnso2Cdn3dP/vc/JO43IOUS9PpuNJ03ngeL22kpnUgOpfJxzH3CPFvEwkzocLeftKA1
         +kE12s4Y7yC5mjOc1gidv44vrrPgVOj9PdCpJ0D6ywqcFp3b2LZdV6eWFwNivAm/K7SF
         GxgWyTkmfHyeT4x+Mcq8pKTq29fQPIIwShYY5D0RoQ1wfJzq138WeoUkMZ+kEj3BV1Iw
         x2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699259164; x=1699863964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWWgLSIojExMEKZZG5MX5woSm7KoDCOw0EHW73wWRwM=;
        b=ey0HbJX16JzyM27RGxd94Ln0ByIc7+WyawrwNypXjDN7EVlM1wcX17G/5I4nWuRnTo
         5vVTqOwCqbIjuAvOySdLtywBuQCVMSg2LHkBgTe077cbSP8QtsRH5vH0sssugDG2LtXI
         /n7ArCUkH8Ulnz74c0PwF13c9Ns0pwqhO7YhHd0V1MdzyUh+faY0pyOz0wDd247z3sEv
         gzHj6cevpZmlBF2LvX9p68c0o9Qr69M/g9msqukeJgPQ3rE6zFsoUa2aeZojBiuXCmjH
         13a387+oNfkXYiA1uHFQnJ5L1dXk0V/MCLlUhESstv/z3qqQs08WmX8x4gc/kAo/soQK
         S3kw==
X-Gm-Message-State: AOJu0YxfHPxp/AxXLBAD3DAnr0y4jPlXED+dGKFogp5gpOnF7pIgIYEa
        CI4iUk8651smpTr2adCkWXelzVxm3eznOl3/prlTsQ==
X-Google-Smtp-Source: AGHT+IEelmLjm+eo7meSao3PHt69QAQaZFqE1vc1N1fx1ZcgNuQK6HywjxvdEJ5/K1rbY+6gXsBKyQ==
X-Received: by 2002:a05:600c:3b93:b0:401:b2c7:34a8 with SMTP id n19-20020a05600c3b9300b00401b2c734a8mr24084832wms.7.1699259164570;
        Mon, 06 Nov 2023 00:26:04 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id az25-20020a05600c601900b004095874f6d3sm11610663wmb.28.2023.11.06.00.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 00:26:04 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 06 Nov 2023 09:25:55 +0100
Subject: [PATCH v3 02/11] dt-bindings: clock: qcom: document the SM8650
 General Clock Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231106-topic-sm8650-upstream-clocks-v3-2-761a6fadb4c0@linaro.org>
References: <20231106-topic-sm8650-upstream-clocks-v3-0-761a6fadb4c0@linaro.org>
In-Reply-To: <20231106-topic-sm8650-upstream-clocks-v3-0-761a6fadb4c0@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12721;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=JqMPIE0IEcB6PeEvYIN1Fc1KG17/HwZdgpROEIyQk7w=;
 b=owEBbAKT/ZANAwAKAXfc29rIyEnRAcsmYgBlSKMVBG7XUvE2L7L9/n0ghQLzXhNq3Ad/9VErWy+W
 jC8qFPKJAjIEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUijFQAKCRB33NvayMhJ0TBAD/
 dtLP4HhyVnbWYQAZ0bgMtt5iMUm6zLSTyh/EmOQRn2xl1O4amtM1m8Vm162d40jPatiUjkdFRPH8Tu
 KivG+mCHwMR/ne7u0E3mw4kOrdu2GyK4nFmuUFBf3n6q4qXCqn0T0ud8NN9JWsqsmIg+IcWplu923t
 lVVRnbS/7artHBq1uEoTbCePcAfws6F0zofU+5AoiYVFxUUF0ZsscFB1Oaaj64xObdAYQyIflThiDr
 9BB06qLbLlEh0x7OnyVlpI3elNneqgRDOeFhEjYnph9jwAgveglWDH5jbwvFqH401lJ1Tvfo/CcVgf
 IQkAfgo1O+L3Pe0fHCjocXtKaligijzfGqplYe9JIwzKV16za6MgDEPF6jMPGv2PqcvMtzSrQGu7zm
 11B/yy+Az/tm6W8kz1qtT+COqGWCf1ZAcY4jWMIAdobGF7muQ3BdEaoSqzr7s0n9ry4u9y5WdSGakl
 J6eaCEXRQ1sj8SZYVmke7fcX9eqERFGJ11AWH1AvKDiyoDO+MixnkwZfaLbvsVIk6jomnjAx+F91+q
 e7tvhrvQLbpLqWIl26Uzz0FEn5cD0aO6ed0nG1qqLOhnUTQYQ8hi5LUxKKcrqUDgJhExrQPv2T860Q
 OCRX8xWi2u3MdS7QJPCEzfQdcm4K894MfVBVr0HEW9VlcRZaRBHCNGt4B9
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add bindings documentation for the SM8650 General Clock Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/clock/qcom,sm8650-gcc.yaml |  65 ++++++
 include/dt-bindings/clock/qcom,sm8650-gcc.h        | 254 +++++++++++++++++++++
 2 files changed, 319 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
new file mode 100644
index 000000000000..b54761cc8674
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm8650-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on SM8650
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on SM8650
+
+  See also:: include/dt-bindings/clock/qcom,sm8650-gcc.h
+
+properties:
+  compatible:
+    const: qcom,sm8650-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board Always On XO source
+      - description: Sleep clock source
+      - description: PCIE 0 Pipe clock source
+      - description: PCIE 1 Pipe clock source
+      - description: PCIE 1 Phy Auxiliary clock source
+      - description: UFS Phy Rx symbol 0 clock source
+      - description: UFS Phy Rx symbol 1 clock source
+      - description: UFS Phy Tx symbol 0 clock source
+      - description: USB3 Phy wrapper pipe clock source
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
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@100000 {
+      compatible = "qcom,sm8650-gcc";
+      reg = <0x00100000 0x001f4200>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>,
+               <&pcie0_phy>,
+               <&pcie1_phy>,
+               <&pcie_1_phy_aux_clk>,
+               <&ufs_mem_phy 0>,
+               <&ufs_mem_phy 1>,
+               <&ufs_mem_phy 2>,
+               <&usb_1_qmpphy>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,sm8650-gcc.h b/include/dt-bindings/clock/qcom,sm8650-gcc.h
new file mode 100644
index 000000000000..0c543ba46079
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8650-gcc.h
@@ -0,0 +1,254 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM8650_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SM8650_H
+
+/* GCC clocks */
+#define GCC_AGGRE_NOC_PCIE_AXI_CLK				0
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				1
+#define GCC_AGGRE_UFS_PHY_AXI_HW_CTL_CLK			2
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				3
+#define GCC_BOOT_ROM_AHB_CLK					4
+#define GCC_CAMERA_AHB_CLK					5
+#define GCC_CAMERA_HF_AXI_CLK					6
+#define GCC_CAMERA_SF_AXI_CLK					7
+#define GCC_CAMERA_XO_CLK					8
+#define GCC_CFG_NOC_PCIE_ANOC_AHB_CLK				9
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				10
+#define GCC_CNOC_PCIE_SF_AXI_CLK				11
+#define GCC_DDRSS_GPU_AXI_CLK					12
+#define GCC_DDRSS_PCIE_SF_QTB_CLK				13
+#define GCC_DISP_AHB_CLK					14
+#define GCC_DISP_HF_AXI_CLK					15
+#define GCC_DISP_XO_CLK						16
+#define GCC_GP1_CLK						17
+#define GCC_GP1_CLK_SRC						18
+#define GCC_GP2_CLK						19
+#define GCC_GP2_CLK_SRC						20
+#define GCC_GP3_CLK						21
+#define GCC_GP3_CLK_SRC						22
+#define GCC_GPLL0						23
+#define GCC_GPLL0_OUT_EVEN					24
+#define GCC_GPLL1						25
+#define GCC_GPLL3						26
+#define GCC_GPLL4						27
+#define GCC_GPLL6						28
+#define GCC_GPLL7						29
+#define GCC_GPLL9						30
+#define GCC_GPU_CFG_AHB_CLK					31
+#define GCC_GPU_GPLL0_CLK_SRC					32
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				33
+#define GCC_GPU_MEMNOC_GFX_CLK					34
+#define GCC_GPU_SNOC_DVM_GFX_CLK				35
+#define GCC_PCIE_0_AUX_CLK					36
+#define GCC_PCIE_0_AUX_CLK_SRC					37
+#define GCC_PCIE_0_CFG_AHB_CLK					38
+#define GCC_PCIE_0_MSTR_AXI_CLK					39
+#define GCC_PCIE_0_PHY_RCHNG_CLK				40
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC				41
+#define GCC_PCIE_0_PIPE_CLK					42
+#define GCC_PCIE_0_PIPE_CLK_SRC					43
+#define GCC_PCIE_0_SLV_AXI_CLK					44
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				45
+#define GCC_PCIE_1_AUX_CLK					46
+#define GCC_PCIE_1_AUX_CLK_SRC					47
+#define GCC_PCIE_1_CFG_AHB_CLK					48
+#define GCC_PCIE_1_MSTR_AXI_CLK					49
+#define GCC_PCIE_1_PHY_AUX_CLK					50
+#define GCC_PCIE_1_PHY_AUX_CLK_SRC				51
+#define GCC_PCIE_1_PHY_RCHNG_CLK				52
+#define GCC_PCIE_1_PHY_RCHNG_CLK_SRC				53
+#define GCC_PCIE_1_PIPE_CLK					54
+#define GCC_PCIE_1_PIPE_CLK_SRC					55
+#define GCC_PCIE_1_SLV_AXI_CLK					56
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK				57
+#define GCC_PDM2_CLK						58
+#define GCC_PDM2_CLK_SRC					59
+#define GCC_PDM_AHB_CLK						60
+#define GCC_PDM_XO4_CLK						61
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				62
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				63
+#define GCC_QMIP_DISP_AHB_CLK					64
+#define GCC_QMIP_GPU_AHB_CLK					65
+#define GCC_QMIP_PCIE_AHB_CLK					66
+#define GCC_QMIP_VIDEO_CV_CPU_AHB_CLK				67
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK				68
+#define GCC_QMIP_VIDEO_V_CPU_AHB_CLK				69
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				70
+#define GCC_QUPV3_I2C_CORE_CLK					71
+#define GCC_QUPV3_I2C_S0_CLK					72
+#define GCC_QUPV3_I2C_S0_CLK_SRC				73
+#define GCC_QUPV3_I2C_S1_CLK					74
+#define GCC_QUPV3_I2C_S1_CLK_SRC				75
+#define GCC_QUPV3_I2C_S2_CLK					76
+#define GCC_QUPV3_I2C_S2_CLK_SRC				77
+#define GCC_QUPV3_I2C_S3_CLK					78
+#define GCC_QUPV3_I2C_S3_CLK_SRC				79
+#define GCC_QUPV3_I2C_S4_CLK					80
+#define GCC_QUPV3_I2C_S4_CLK_SRC				81
+#define GCC_QUPV3_I2C_S5_CLK					82
+#define GCC_QUPV3_I2C_S5_CLK_SRC				83
+#define GCC_QUPV3_I2C_S6_CLK					84
+#define GCC_QUPV3_I2C_S6_CLK_SRC				85
+#define GCC_QUPV3_I2C_S7_CLK					86
+#define GCC_QUPV3_I2C_S7_CLK_SRC				87
+#define GCC_QUPV3_I2C_S8_CLK					88
+#define GCC_QUPV3_I2C_S8_CLK_SRC				89
+#define GCC_QUPV3_I2C_S9_CLK					90
+#define GCC_QUPV3_I2C_S9_CLK_SRC				91
+#define GCC_QUPV3_I2C_S_AHB_CLK					92
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				93
+#define GCC_QUPV3_WRAP1_CORE_CLK				94
+#define GCC_QUPV3_WRAP1_QSPI_REF_CLK				95
+#define GCC_QUPV3_WRAP1_QSPI_REF_CLK_SRC			96
+#define GCC_QUPV3_WRAP1_S0_CLK					97
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				98
+#define GCC_QUPV3_WRAP1_S1_CLK					99
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				100
+#define GCC_QUPV3_WRAP1_S2_CLK					101
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				102
+#define GCC_QUPV3_WRAP1_S3_CLK					103
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				104
+#define GCC_QUPV3_WRAP1_S4_CLK					105
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				106
+#define GCC_QUPV3_WRAP1_S5_CLK					107
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				108
+#define GCC_QUPV3_WRAP1_S6_CLK					109
+#define GCC_QUPV3_WRAP1_S6_CLK_SRC				110
+#define GCC_QUPV3_WRAP1_S7_CLK					111
+#define GCC_QUPV3_WRAP1_S7_CLK_SRC				112
+#define GCC_QUPV3_WRAP2_CORE_2X_CLK				113
+#define GCC_QUPV3_WRAP2_CORE_CLK				114
+#define GCC_QUPV3_WRAP2_IBI_CTRL_0_CLK_SRC			115
+#define GCC_QUPV3_WRAP2_IBI_CTRL_2_CLK				116
+#define GCC_QUPV3_WRAP2_IBI_CTRL_3_CLK				117
+#define GCC_QUPV3_WRAP2_S0_CLK					118
+#define GCC_QUPV3_WRAP2_S0_CLK_SRC				119
+#define GCC_QUPV3_WRAP2_S1_CLK					120
+#define GCC_QUPV3_WRAP2_S1_CLK_SRC				121
+#define GCC_QUPV3_WRAP2_S2_CLK					122
+#define GCC_QUPV3_WRAP2_S2_CLK_SRC				123
+#define GCC_QUPV3_WRAP2_S3_CLK					124
+#define GCC_QUPV3_WRAP2_S3_CLK_SRC				125
+#define GCC_QUPV3_WRAP2_S4_CLK					126
+#define GCC_QUPV3_WRAP2_S4_CLK_SRC				127
+#define GCC_QUPV3_WRAP2_S5_CLK					128
+#define GCC_QUPV3_WRAP2_S5_CLK_SRC				129
+#define GCC_QUPV3_WRAP2_S6_CLK					130
+#define GCC_QUPV3_WRAP2_S6_CLK_SRC				131
+#define GCC_QUPV3_WRAP2_S7_CLK					132
+#define GCC_QUPV3_WRAP2_S7_CLK_SRC				133
+#define GCC_QUPV3_WRAP3_CORE_2X_CLK				134
+#define GCC_QUPV3_WRAP3_CORE_CLK				135
+#define GCC_QUPV3_WRAP3_QSPI_REF_CLK				136
+#define GCC_QUPV3_WRAP3_QSPI_REF_CLK_SRC			137
+#define GCC_QUPV3_WRAP3_S0_CLK					138
+#define GCC_QUPV3_WRAP3_S0_CLK_SRC				139
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				140
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				141
+#define GCC_QUPV3_WRAP_2_IBI_2_AHB_CLK				142
+#define GCC_QUPV3_WRAP_2_IBI_3_AHB_CLK				143
+#define GCC_QUPV3_WRAP_2_M_AHB_CLK				144
+#define GCC_QUPV3_WRAP_2_S_AHB_CLK				145
+#define GCC_QUPV3_WRAP_3_M_AHB_CLK				146
+#define GCC_QUPV3_WRAP_3_S_AHB_CLK				147
+#define GCC_SDCC2_AHB_CLK					148
+#define GCC_SDCC2_APPS_CLK					149
+#define GCC_SDCC2_APPS_CLK_SRC					150
+#define GCC_SDCC4_AHB_CLK					151
+#define GCC_SDCC4_APPS_CLK					152
+#define GCC_SDCC4_APPS_CLK_SRC					153
+#define GCC_UFS_PHY_AHB_CLK					154
+#define GCC_UFS_PHY_AXI_CLK					155
+#define GCC_UFS_PHY_AXI_CLK_SRC					156
+#define GCC_UFS_PHY_AXI_HW_CTL_CLK				157
+#define GCC_UFS_PHY_ICE_CORE_CLK				158
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				159
+#define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK				160
+#define GCC_UFS_PHY_PHY_AUX_CLK					161
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				162
+#define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK				163
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				164
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC				165
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				166
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC				167
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				168
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC				169
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				170
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				171
+#define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK			172
+#define GCC_USB30_PRIM_MASTER_CLK				173
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				174
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				175
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			176
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		177
+#define GCC_USB30_PRIM_SLEEP_CLK				178
+#define GCC_USB3_PRIM_PHY_AUX_CLK				179
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				180
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				181
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				182
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				183
+#define GCC_VIDEO_AHB_CLK					184
+#define GCC_VIDEO_AXI0_CLK					185
+#define GCC_VIDEO_AXI1_CLK					186
+#define GCC_VIDEO_XO_CLK					187
+#define GCC_GPLL0_AO						188
+#define GCC_GPLL0_OUT_EVEN_AO					189
+#define GCC_GPLL1_AO						190
+#define GCC_GPLL3_AO						191
+#define GCC_GPLL4_AO						192
+#define GCC_GPLL6_AO						193
+
+/* GCC resets */
+#define GCC_CAMERA_BCR						0
+#define GCC_DISPLAY_BCR						1
+#define GCC_GPU_BCR						2
+#define GCC_PCIE_0_BCR						3
+#define GCC_PCIE_0_LINK_DOWN_BCR				4
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR				5
+#define GCC_PCIE_0_PHY_BCR					6
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR			7
+#define GCC_PCIE_1_BCR						8
+#define GCC_PCIE_1_LINK_DOWN_BCR				9
+#define GCC_PCIE_1_NOCSR_COM_PHY_BCR				10
+#define GCC_PCIE_1_PHY_BCR					11
+#define GCC_PCIE_1_PHY_NOCSR_COM_PHY_BCR			12
+#define GCC_PCIE_PHY_BCR					13
+#define GCC_PCIE_PHY_CFG_AHB_BCR				14
+#define GCC_PCIE_PHY_COM_BCR					15
+#define GCC_PDM_BCR						16
+#define GCC_QUPV3_WRAPPER_1_BCR					17
+#define GCC_QUPV3_WRAPPER_2_BCR					18
+#define GCC_QUPV3_WRAPPER_3_BCR					19
+#define GCC_QUPV3_WRAPPER_I2C_BCR				20
+#define GCC_QUSB2PHY_PRIM_BCR					21
+#define GCC_QUSB2PHY_SEC_BCR					22
+#define GCC_SDCC2_BCR						23
+#define GCC_SDCC4_BCR						24
+#define GCC_UFS_PHY_BCR						25
+#define GCC_USB30_PRIM_BCR					26
+#define GCC_USB3_DP_PHY_PRIM_BCR				27
+#define GCC_USB3_DP_PHY_SEC_BCR					28
+#define GCC_USB3_PHY_PRIM_BCR					29
+#define GCC_USB3_PHY_SEC_BCR					30
+#define GCC_USB3PHY_PHY_PRIM_BCR				31
+#define GCC_USB3PHY_PHY_SEC_BCR					32
+#define GCC_VIDEO_AXI0_CLK_ARES					33
+#define GCC_VIDEO_AXI1_CLK_ARES					34
+#define GCC_VIDEO_BCR						35
+
+/* GCC power domains */
+#define PCIE_0_GDSC						0
+#define PCIE_0_PHY_GDSC						1
+#define PCIE_1_GDSC						2
+#define PCIE_1_PHY_GDSC						3
+#define UFS_PHY_GDSC						4
+#define UFS_MEM_PHY_GDSC					5
+#define USB30_PRIM_GDSC						6
+#define USB3_PHY_GDSC						7
+
+#endif

-- 
2.34.1

