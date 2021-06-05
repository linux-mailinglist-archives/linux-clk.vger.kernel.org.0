Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6B939C805
	for <lists+linux-clk@lfdr.de>; Sat,  5 Jun 2021 14:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbhFEMMg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 5 Jun 2021 08:12:36 -0400
Received: from relay06.th.seeweb.it ([5.144.164.167]:44317 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhFEMMg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 5 Jun 2021 08:12:36 -0400
Received: from localhost.localdomain (bband-dyn9.178-41-130.t-com.sk [178.41.130.9])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 924A73ECA8;
        Sat,  5 Jun 2021 14:10:46 +0200 (CEST)
From:   Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: clk: qcom: gcc-sm6125: Document SM6125 GCC driver
Date:   Sat,  5 Jun 2021 14:10:37 +0200
Message-Id: <20210605121040.282053-1-martin.botka@somainline.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document the newly added SM6125 GCC driver.

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
Changes in V2:
Add commit description.
Changes in V3:
Use rpmcc.h instead of rpmh.h
Changes in V4:
Fix indentation
License
 .../bindings/clock/qcom,gcc-sm6125.yaml       |  72 ++++++
 include/dt-bindings/clock/qcom,gcc-sm6125.h   | 240 ++++++++++++++++++
 2 files changed, 312 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm6125.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
new file mode 100644
index 000000000000..ab12b391effc
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-sm6125.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for SM6125
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@somainline.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on SM6125.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-sm6125.h
+
+properties:
+  compatible:
+    const: qcom,gcc-sm6125
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: sleep_clk
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  protected-clocks:
+    description:
+      Protected clock specifier list as per common clock binding.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    clock-controller@1400000 {
+        compatible = "qcom,gcc-sm6125";
+        reg = <0x01400000 0x1f0000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+        clock-names = "bi_tcxo", "sleep_clk";
+        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&sleep_clk>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,gcc-sm6125.h b/include/dt-bindings/clock/qcom,gcc-sm6125.h
new file mode 100644
index 000000000000..08ea18086824
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-sm6125.h
@@ -0,0 +1,240 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM6125_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SM6125_H
+
+#define GPLL0_OUT_AUX2				0
+#define GPLL0_OUT_MAIN				1
+#define GPLL6_OUT_MAIN				2
+#define GPLL7_OUT_MAIN				3
+#define GPLL8_OUT_MAIN				4
+#define GPLL9_OUT_MAIN				5
+#define GPLL0_OUT_EARLY				6
+#define GPLL3_OUT_EARLY				7
+#define GPLL4_OUT_MAIN				8
+#define GPLL5_OUT_MAIN				9
+#define GPLL6_OUT_EARLY				10
+#define GPLL7_OUT_EARLY				11
+#define GPLL8_OUT_EARLY				12
+#define GPLL9_OUT_EARLY				13
+#define GCC_AHB2PHY_CSI_CLK			14
+#define GCC_AHB2PHY_USB_CLK			15
+#define GCC_APC_VS_CLK				16
+#define GCC_BOOT_ROM_AHB_CLK		17
+#define GCC_CAMERA_AHB_CLK			18
+#define GCC_CAMERA_XO_CLK			19
+#define GCC_CAMSS_AHB_CLK_SRC		20
+#define GCC_CAMSS_CCI_AHB_CLK		21
+#define GCC_CAMSS_CCI_CLK			22
+#define GCC_CAMSS_CCI_CLK_SRC			23
+#define GCC_CAMSS_CPHY_CSID0_CLK		24
+#define GCC_CAMSS_CPHY_CSID1_CLK		25
+#define GCC_CAMSS_CPHY_CSID2_CLK		26
+#define GCC_CAMSS_CPHY_CSID3_CLK		27
+#define GCC_CAMSS_CPP_AHB_CLK			28
+#define GCC_CAMSS_CPP_AXI_CLK			29
+#define GCC_CAMSS_CPP_CLK			30
+#define GCC_CAMSS_CPP_CLK_SRC			31
+#define GCC_CAMSS_CPP_VBIF_AHB_CLK		32
+#define GCC_CAMSS_CSI0_AHB_CLK			33
+#define GCC_CAMSS_CSI0_CLK				34
+#define GCC_CAMSS_CSI0_CLK_SRC			35
+#define GCC_CAMSS_CSI0PHYTIMER_CLK		36
+#define GCC_CAMSS_CSI0PHYTIMER_CLK_SRC	37
+#define GCC_CAMSS_CSI0PIX_CLK			38
+#define GCC_CAMSS_CSI0RDI_CLK			39
+#define GCC_CAMSS_CSI1_AHB_CLK			40
+#define GCC_CAMSS_CSI1_CLK				41
+#define GCC_CAMSS_CSI1_CLK_SRC			42
+#define GCC_CAMSS_CSI1PHYTIMER_CLK		43
+#define GCC_CAMSS_CSI1PHYTIMER_CLK_SRC	44
+#define GCC_CAMSS_CSI1PIX_CLK			45
+#define GCC_CAMSS_CSI1RDI_CLK			46
+#define GCC_CAMSS_CSI2_AHB_CLK			47
+#define GCC_CAMSS_CSI2_CLK				48
+#define GCC_CAMSS_CSI2_CLK_SRC			49
+#define GCC_CAMSS_CSI2PHYTIMER_CLK		50
+#define GCC_CAMSS_CSI2PHYTIMER_CLK_SRC	51
+#define GCC_CAMSS_CSI2PIX_CLK			52
+#define GCC_CAMSS_CSI2RDI_CLK			53
+#define GCC_CAMSS_CSI3_AHB_CLK			54
+#define GCC_CAMSS_CSI3_CLK				55
+#define GCC_CAMSS_CSI3_CLK_SRC			56
+#define GCC_CAMSS_CSI3PIX_CLK			57
+#define GCC_CAMSS_CSI3RDI_CLK			58
+#define GCC_CAMSS_CSI_VFE0_CLK			59
+#define GCC_CAMSS_CSI_VFE1_CLK			60
+#define GCC_CAMSS_CSIPHY0_CLK			61
+#define GCC_CAMSS_CSIPHY1_CLK			62
+#define GCC_CAMSS_CSIPHY2_CLK			63
+#define GCC_CAMSS_CSIPHY_CLK_SRC		64
+#define GCC_CAMSS_GP0_CLK				65
+#define GCC_CAMSS_GP0_CLK_SRC			66
+#define GCC_CAMSS_GP1_CLK				67
+#define GCC_CAMSS_GP1_CLK_SRC			68
+#define GCC_CAMSS_ISPIF_AHB_CLK			69
+#define GCC_CAMSS_JPEG_AHB_CLK			70
+#define GCC_CAMSS_JPEG_AXI_CLK			71
+#define GCC_CAMSS_JPEG_CLK				72
+#define GCC_CAMSS_JPEG_CLK_SRC			73
+#define GCC_CAMSS_MCLK0_CLK				74
+#define GCC_CAMSS_MCLK0_CLK_SRC			75
+#define GCC_CAMSS_MCLK1_CLK				76
+#define GCC_CAMSS_MCLK1_CLK_SRC			77
+#define GCC_CAMSS_MCLK2_CLK				78
+#define GCC_CAMSS_MCLK2_CLK_SRC			79
+#define GCC_CAMSS_MCLK3_CLK				80
+#define GCC_CAMSS_MCLK3_CLK_SRC			81
+#define GCC_CAMSS_MICRO_AHB_CLK			82
+#define GCC_CAMSS_THROTTLE_NRT_AXI_CLK	83
+#define GCC_CAMSS_THROTTLE_RT_AXI_CLK	84
+#define GCC_CAMSS_TOP_AHB_CLK			85
+#define GCC_CAMSS_VFE0_AHB_CLK			86
+#define GCC_CAMSS_VFE0_CLK				87
+#define GCC_CAMSS_VFE0_CLK_SRC			88
+#define GCC_CAMSS_VFE0_STREAM_CLK		89
+#define GCC_CAMSS_VFE1_AHB_CLK			90
+#define GCC_CAMSS_VFE1_CLK				91
+#define GCC_CAMSS_VFE1_CLK_SRC			92
+#define GCC_CAMSS_VFE1_STREAM_CLK		93
+#define GCC_CAMSS_VFE_TSCTR_CLK			94
+#define GCC_CAMSS_VFE_VBIF_AHB_CLK		95
+#define GCC_CAMSS_VFE_VBIF_AXI_CLK		96
+#define GCC_CE1_AHB_CLK					97
+#define GCC_CE1_AXI_CLK					98
+#define GCC_CE1_CLK						99
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK	100
+#define GCC_CPUSS_GNOC_CLK				101
+#define GCC_DISP_AHB_CLK				102
+#define GCC_DISP_GPLL0_DIV_CLK_SRC		103
+#define GCC_DISP_HF_AXI_CLK				104
+#define GCC_DISP_THROTTLE_CORE_CLK		105
+#define GCC_DISP_XO_CLK					106
+#define GCC_GP1_CLK						107
+#define GCC_GP1_CLK_SRC					108
+#define GCC_GP2_CLK						109
+#define GCC_GP2_CLK_SRC					110
+#define GCC_GP3_CLK						111
+#define GCC_GP3_CLK_SRC					112
+#define GCC_GPU_CFG_AHB_CLK				113
+#define GCC_GPU_GPLL0_CLK_SRC			114
+#define GCC_GPU_GPLL0_DIV_CLK_SRC		115
+#define GCC_GPU_MEMNOC_GFX_CLK			116
+#define GCC_GPU_SNOC_DVM_GFX_CLK		117
+#define GCC_GPU_THROTTLE_CORE_CLK		118
+#define GCC_GPU_THROTTLE_XO_CLK			119
+#define GCC_MSS_VS_CLK					120
+#define GCC_PDM2_CLK					121
+#define GCC_PDM2_CLK_SRC				122
+#define GCC_PDM_AHB_CLK					123
+#define GCC_PDM_XO4_CLK					124
+#define GCC_PRNG_AHB_CLK				125
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK		126
+#define GCC_QMIP_CAMERA_RT_AHB_CLK		127
+#define GCC_QMIP_DISP_AHB_CLK			128
+#define GCC_QMIP_GPU_CFG_AHB_CLK		129
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK	130
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK		131
+#define GCC_QUPV3_WRAP0_CORE_CLK		132
+#define GCC_QUPV3_WRAP0_S0_CLK			133
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC		134
+#define GCC_QUPV3_WRAP0_S1_CLK			135
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC		136
+#define GCC_QUPV3_WRAP0_S2_CLK			137
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC		138
+#define GCC_QUPV3_WRAP0_S3_CLK			139
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC		140
+#define GCC_QUPV3_WRAP0_S4_CLK			141
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC		142
+#define GCC_QUPV3_WRAP0_S5_CLK			143
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC		144
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK		145
+#define GCC_QUPV3_WRAP1_CORE_CLK		146
+#define GCC_QUPV3_WRAP1_S0_CLK			147
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC		148
+#define GCC_QUPV3_WRAP1_S1_CLK			149
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC		150
+#define GCC_QUPV3_WRAP1_S2_CLK			151
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC		152
+#define GCC_QUPV3_WRAP1_S3_CLK			153
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC		154
+#define GCC_QUPV3_WRAP1_S4_CLK			155
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC		156
+#define GCC_QUPV3_WRAP1_S5_CLK			157
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC		158
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK		159
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK		160
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK		161
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK		162
+#define GCC_SDCC1_AHB_CLK				163
+#define GCC_SDCC1_APPS_CLK				164
+#define GCC_SDCC1_APPS_CLK_SRC			165
+#define GCC_SDCC1_ICE_CORE_CLK			166
+#define GCC_SDCC1_ICE_CORE_CLK_SRC		167
+#define GCC_SDCC2_AHB_CLK				168
+#define GCC_SDCC2_APPS_CLK				169
+#define GCC_SDCC2_APPS_CLK_SRC			170
+#define GCC_SYS_NOC_CPUSS_AHB_CLK		171
+#define GCC_SYS_NOC_UFS_PHY_AXI_CLK		172
+#define GCC_SYS_NOC_USB3_PRIM_AXI_CLK	173
+#define GCC_UFS_PHY_AHB_CLK				174
+#define GCC_UFS_PHY_AXI_CLK				175
+#define GCC_UFS_PHY_AXI_CLK_SRC			176
+#define GCC_UFS_PHY_ICE_CORE_CLK		177
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC	178
+#define GCC_UFS_PHY_PHY_AUX_CLK			179
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC		180
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK		181
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK		182
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK		183
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC	184
+#define GCC_USB30_PRIM_MASTER_CLK		185
+#define GCC_USB30_PRIM_MASTER_CLK_SRC	186
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK	187
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC	188
+#define GCC_USB30_PRIM_SLEEP_CLK		189
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC	190
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK	191
+#define GCC_USB3_PRIM_PHY_PIPE_CLK		192
+#define GCC_VDDA_VS_CLK					193
+#define GCC_VDDCX_VS_CLK				194
+#define GCC_VDDMX_VS_CLK				195
+#define GCC_VIDEO_AHB_CLK				196
+#define GCC_VIDEO_AXI0_CLK				197
+#define GCC_VIDEO_THROTTLE_CORE_CLK		198
+#define GCC_VIDEO_XO_CLK				199
+#define GCC_VS_CTRL_AHB_CLK				200
+#define GCC_VS_CTRL_CLK					201
+#define GCC_VS_CTRL_CLK_SRC				202
+#define GCC_VSENSOR_CLK_SRC				203
+#define GCC_WCSS_VS_CLK					204
+#define GCC_USB3_PRIM_CLKREF_CLK		205
+#define GCC_SYS_NOC_COMPUTE_SF_AXI_CLK	206
+#define GCC_BIMC_GPU_AXI_CLK			207
+#define GCC_UFS_MEM_CLKREF_CLK			208
+
+/* GDSCs */
+#define USB30_PRIM_GDSC					0
+#define UFS_PHY_GDSC					1
+#define CAMSS_VFE0_GDSC					2
+#define CAMSS_VFE1_GDSC					3
+#define CAMSS_TOP_GDSC					4
+#define CAM_CPP_GDSC					5
+#define HLOS1_VOTE_TURING_MMU_TBU1_GDSC	6
+#define HLOS1_VOTE_MM_SNOC_MMU_TBU_RT_GDSC	7
+#define HLOS1_VOTE_MM_SNOC_MMU_TBU_NRT_GDSC	8
+#define HLOS1_VOTE_TURING_MMU_TBU0_GDSC	9
+
+#define GCC_QUSB2PHY_PRIM_BCR			0
+#define GCC_QUSB2PHY_SEC_BCR			1
+#define GCC_UFS_PHY_BCR				2
+#define GCC_USB30_PRIM_BCR			3
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR		4
+#define GCC_USB3_PHY_PRIM_SP0_BCR		5
+#define GCC_USB3PHY_PHY_PRIM_SP0_BCR		6
+#define GCC_CAMSS_MICRO_BCR			7
+
+#endif
-- 
2.31.1

