Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 672E66FA99
	for <lists+linux-clk@lfdr.de>; Mon, 22 Jul 2019 09:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbfGVHpd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 22 Jul 2019 03:45:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:60016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbfGVHpc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Jul 2019 03:45:32 -0400
Received: from localhost.localdomain (unknown [223.226.98.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5F0B3206DD;
        Mon, 22 Jul 2019 07:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563781531;
        bh=6JdVS0Si0kj96hOBHPz3gwtQUZFWOk98rXTpwhe8jw0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KH7sAVUFWwZdwjb2wEgpHiQ9wVMFkyO7mnDbZ9Tzpz85a9HEc2vQIchN/10wIwt3n
         g7y6mWG7DsNOYO+iymVIGE3lYVFLazye0+ATXM9hfgXtlRXK9AkWFnpJ0hZywkNqUP
         7r21Y7BEUgRWFMwhHRzM+jywE2q7nXVyuIXdEedw=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 4/5] dt-bindings: clock: Document gcc bindings for SM8150
Date:   Mon, 22 Jul 2019 13:13:47 +0530
Message-Id: <20190722074348.29582-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722074348.29582-1-vkoul@kernel.org>
References: <20190722074348.29582-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Deepak Katragadda <dkatraga@codeaurora.org>

Document the global clock controller found on SM8150.

Signed-off-by: Deepak Katragadda <dkatraga@codeaurora.org>
Signed-off-by: Taniya Das <tdas@codeaurora.org>
[vkoul: port to upstream and add external clocks
	split binding to this patch]]
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/clock/qcom,gcc.txt    |  21 ++
 include/dt-bindings/clock/qcom,gcc-sm8150.h   | 243 ++++++++++++++++++
 2 files changed, 264 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8150.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
index 8661c3cd3ccf..d14362ad4132 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
@@ -23,6 +23,7 @@ Required properties :
 			"qcom,gcc-sdm630"
 			"qcom,gcc-sdm660"
 			"qcom,gcc-sdm845"
+			"qcom,gcc-sm8150"
 
 - reg : shall contain base register location and length
 - #clock-cells : shall contain 1
@@ -38,6 +39,13 @@ Documentation/devicetree/bindings/thermal/qcom-tsens.txt
 - protected-clocks : Protected clock specifier list as per common clock
  binding.
 
+For SM8150 only:
+       - clocks: a list of phandles and clock-specifier pairs,
+                 one for each entry in clock-names.
+       - clock-names: "bi_tcxo" (required)
+                      "sleep_clk" (optional)
+                      "aud_ref_clock" (optional)
+
 Example:
 	clock-controller@900000 {
 		compatible = "qcom,gcc-msm8960";
@@ -71,3 +79,16 @@ Example of GCC with protected-clocks properties:
 				   <GCC_LPASS_Q6_AXI_CLK>,
 				   <GCC_LPASS_SWAY_CLK>;
 	};
+
+Example of GCC with clocks
+	gcc: clock-controller@100000 {
+		compatible = "qcom,gcc-sm8150";
+		reg = <0x00100000 0x1f0000>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+		clock-names = "bi_tcxo",
+		              "sleep_clk";
+		clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+			 <&sleep_clk>;
+	};
diff --git a/include/dt-bindings/clock/qcom,gcc-sm8150.h b/include/dt-bindings/clock/qcom,gcc-sm8150.h
new file mode 100644
index 000000000000..90d60ef94c64
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-sm8150.h
@@ -0,0 +1,243 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM8150_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SM8150_H
+
+/* GCC clocks */
+#define GCC_AGGRE_NOC_PCIE_TBU_CLK				0
+#define GCC_AGGRE_UFS_CARD_AXI_CLK				1
+#define GCC_AGGRE_UFS_CARD_AXI_HW_CTL_CLK			2
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				3
+#define GCC_AGGRE_UFS_PHY_AXI_HW_CTL_CLK			4
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				5
+#define GCC_AGGRE_USB3_SEC_AXI_CLK				6
+#define GCC_BOOT_ROM_AHB_CLK					7
+#define GCC_CAMERA_AHB_CLK					8
+#define GCC_CAMERA_HF_AXI_CLK					9
+#define GCC_CAMERA_SF_AXI_CLK					10
+#define GCC_CAMERA_XO_CLK					11
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				12
+#define GCC_CFG_NOC_USB3_SEC_AXI_CLK				13
+#define GCC_CPUSS_AHB_CLK					14
+#define GCC_CPUSS_AHB_CLK_SRC					15
+#define GCC_CPUSS_DVM_BUS_CLK					16
+#define GCC_CPUSS_GNOC_CLK					17
+#define GCC_CPUSS_RBCPR_CLK					18
+#define GCC_DDRSS_GPU_AXI_CLK					19
+#define GCC_DISP_AHB_CLK					20
+#define GCC_DISP_HF_AXI_CLK					21
+#define GCC_DISP_SF_AXI_CLK					22
+#define GCC_DISP_XO_CLK						23
+#define GCC_EMAC_AXI_CLK					24
+#define GCC_EMAC_PTP_CLK					25
+#define GCC_EMAC_PTP_CLK_SRC					26
+#define GCC_EMAC_RGMII_CLK					27
+#define GCC_EMAC_RGMII_CLK_SRC					28
+#define GCC_EMAC_SLV_AHB_CLK					29
+#define GCC_GP1_CLK						30
+#define GCC_GP1_CLK_SRC						31
+#define GCC_GP2_CLK						32
+#define GCC_GP2_CLK_SRC						33
+#define GCC_GP3_CLK						34
+#define GCC_GP3_CLK_SRC						35
+#define GCC_GPU_CFG_AHB_CLK					36
+#define GCC_GPU_GPLL0_CLK_SRC					37
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				38
+#define GCC_GPU_IREF_CLK					39
+#define GCC_GPU_MEMNOC_GFX_CLK					40
+#define GCC_GPU_SNOC_DVM_GFX_CLK				41
+#define GCC_NPU_AT_CLK						42
+#define GCC_NPU_AXI_CLK						43
+#define GCC_NPU_CFG_AHB_CLK					44
+#define GCC_NPU_GPLL0_CLK_SRC					45
+#define GCC_NPU_GPLL0_DIV_CLK_SRC				46
+#define GCC_NPU_TRIG_CLK					47
+#define GCC_PCIE0_PHY_REFGEN_CLK				48
+#define GCC_PCIE1_PHY_REFGEN_CLK				49
+#define GCC_PCIE_0_AUX_CLK					50
+#define GCC_PCIE_0_AUX_CLK_SRC					51
+#define GCC_PCIE_0_CFG_AHB_CLK					52
+#define GCC_PCIE_0_CLKREF_CLK					53
+#define GCC_PCIE_0_MSTR_AXI_CLK					54
+#define GCC_PCIE_0_PIPE_CLK					55
+#define GCC_PCIE_0_SLV_AXI_CLK					56
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				57
+#define GCC_PCIE_1_AUX_CLK					58
+#define GCC_PCIE_1_AUX_CLK_SRC					59
+#define GCC_PCIE_1_CFG_AHB_CLK					60
+#define GCC_PCIE_1_CLKREF_CLK					61
+#define GCC_PCIE_1_MSTR_AXI_CLK					62
+#define GCC_PCIE_1_PIPE_CLK					63
+#define GCC_PCIE_1_SLV_AXI_CLK					64
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK				65
+#define GCC_PCIE_PHY_AUX_CLK					66
+#define GCC_PCIE_PHY_REFGEN_CLK_SRC				67
+#define GCC_PDM2_CLK						68
+#define GCC_PDM2_CLK_SRC					69
+#define GCC_PDM_AHB_CLK						70
+#define GCC_PDM_XO4_CLK						71
+#define GCC_PRNG_AHB_CLK					72
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				73
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				74
+#define GCC_QMIP_DISP_AHB_CLK					75
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK				76
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				77
+#define GCC_QSPI_CNOC_PERIPH_AHB_CLK				78
+#define GCC_QSPI_CORE_CLK					79
+#define GCC_QSPI_CORE_CLK_SRC					80
+#define GCC_QUPV3_WRAP0_S0_CLK					81
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				82
+#define GCC_QUPV3_WRAP0_S1_CLK					83
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				84
+#define GCC_QUPV3_WRAP0_S2_CLK					85
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				86
+#define GCC_QUPV3_WRAP0_S3_CLK					87
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				88
+#define GCC_QUPV3_WRAP0_S4_CLK					89
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				90
+#define GCC_QUPV3_WRAP0_S5_CLK					91
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				92
+#define GCC_QUPV3_WRAP0_S6_CLK					93
+#define GCC_QUPV3_WRAP0_S6_CLK_SRC				94
+#define GCC_QUPV3_WRAP0_S7_CLK					95
+#define GCC_QUPV3_WRAP0_S7_CLK_SRC				96
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
+#define GCC_QUPV3_WRAP2_S0_CLK					109
+#define GCC_QUPV3_WRAP2_S0_CLK_SRC				110
+#define GCC_QUPV3_WRAP2_S1_CLK					111
+#define GCC_QUPV3_WRAP2_S1_CLK_SRC				112
+#define GCC_QUPV3_WRAP2_S2_CLK					113
+#define GCC_QUPV3_WRAP2_S2_CLK_SRC				114
+#define GCC_QUPV3_WRAP2_S3_CLK					115
+#define GCC_QUPV3_WRAP2_S3_CLK_SRC				116
+#define GCC_QUPV3_WRAP2_S4_CLK					117
+#define GCC_QUPV3_WRAP2_S4_CLK_SRC				118
+#define GCC_QUPV3_WRAP2_S5_CLK					119
+#define GCC_QUPV3_WRAP2_S5_CLK_SRC				120
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				121
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				122
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				123
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				124
+#define GCC_QUPV3_WRAP_2_M_AHB_CLK				125
+#define GCC_QUPV3_WRAP_2_S_AHB_CLK				126
+#define GCC_SDCC2_AHB_CLK					127
+#define GCC_SDCC2_APPS_CLK					128
+#define GCC_SDCC2_APPS_CLK_SRC					129
+#define GCC_SDCC4_AHB_CLK					130
+#define GCC_SDCC4_APPS_CLK					131
+#define GCC_SDCC4_APPS_CLK_SRC					132
+#define GCC_SYS_NOC_CPUSS_AHB_CLK				133
+#define GCC_TSIF_AHB_CLK					134
+#define GCC_TSIF_INACTIVITY_TIMERS_CLK				135
+#define GCC_TSIF_REF_CLK					136
+#define GCC_TSIF_REF_CLK_SRC					137
+#define GCC_UFS_CARD_AHB_CLK					138
+#define GCC_UFS_CARD_AXI_CLK					139
+#define GCC_UFS_CARD_AXI_CLK_SRC				140
+#define GCC_UFS_CARD_AXI_HW_CTL_CLK				141
+#define GCC_UFS_CARD_CLKREF_CLK					142
+#define GCC_UFS_CARD_ICE_CORE_CLK				143
+#define GCC_UFS_CARD_ICE_CORE_CLK_SRC				144
+#define GCC_UFS_CARD_ICE_CORE_HW_CTL_CLK			145
+#define GCC_UFS_CARD_PHY_AUX_CLK				146
+#define GCC_UFS_CARD_PHY_AUX_CLK_SRC				147
+#define GCC_UFS_CARD_PHY_AUX_HW_CTL_CLK				148
+#define GCC_UFS_CARD_RX_SYMBOL_0_CLK				149
+#define GCC_UFS_CARD_RX_SYMBOL_1_CLK				150
+#define GCC_UFS_CARD_TX_SYMBOL_0_CLK				151
+#define GCC_UFS_CARD_UNIPRO_CORE_CLK				152
+#define GCC_UFS_CARD_UNIPRO_CORE_CLK_SRC			153
+#define GCC_UFS_CARD_UNIPRO_CORE_HW_CTL_CLK			154
+#define GCC_UFS_MEM_CLKREF_CLK					155
+#define GCC_UFS_PHY_AHB_CLK					156
+#define GCC_UFS_PHY_AXI_CLK					157
+#define GCC_UFS_PHY_AXI_CLK_SRC					158
+#define GCC_UFS_PHY_AXI_HW_CTL_CLK				159
+#define GCC_UFS_PHY_ICE_CORE_CLK				160
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				161
+#define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK				162
+#define GCC_UFS_PHY_PHY_AUX_CLK					163
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				164
+#define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK				165
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				166
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				167
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				168
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				169
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				170
+#define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK			171
+#define GCC_USB30_PRIM_MASTER_CLK				172
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				173
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				174
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			175
+#define GCC_USB30_PRIM_SLEEP_CLK				176
+#define GCC_USB30_SEC_MASTER_CLK				177
+#define GCC_USB30_SEC_MASTER_CLK_SRC				178
+#define GCC_USB30_SEC_MOCK_UTMI_CLK				179
+#define GCC_USB30_SEC_MOCK_UTMI_CLK_SRC				180
+#define GCC_USB30_SEC_SLEEP_CLK					181
+#define GCC_USB3_PRIM_CLKREF_CLK				182
+#define GCC_USB3_PRIM_PHY_AUX_CLK				183
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				184
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				185
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				186
+#define GCC_USB3_SEC_CLKREF_CLK					187
+#define GCC_USB3_SEC_PHY_AUX_CLK				188
+#define GCC_USB3_SEC_PHY_AUX_CLK_SRC				189
+#define GCC_USB3_SEC_PHY_COM_AUX_CLK				190
+#define GCC_USB3_SEC_PHY_PIPE_CLK				191
+#define GCC_VIDEO_AHB_CLK					192
+#define GCC_VIDEO_AXI0_CLK					193
+#define GCC_VIDEO_AXI1_CLK					194
+#define GCC_VIDEO_AXIC_CLK					195
+#define GCC_VIDEO_XO_CLK					196
+#define GPLL0							197
+#define GPLL0_OUT_EVEN						198
+#define GPLL7							199
+#define GPLL9							200
+
+/* Reset clocks */
+#define GCC_EMAC_BCR						0
+#define GCC_GPU_BCR						1
+#define GCC_MMSS_BCR						2
+#define GCC_NPU_BCR						3
+#define GCC_PCIE_0_BCR						4
+#define GCC_PCIE_0_PHY_BCR					5
+#define GCC_PCIE_1_BCR						6
+#define GCC_PCIE_1_PHY_BCR					7
+#define GCC_PCIE_PHY_BCR					8
+#define GCC_PDM_BCR						9
+#define GCC_PRNG_BCR						10
+#define GCC_QSPI_BCR						11
+#define GCC_QUPV3_WRAPPER_0_BCR					12
+#define GCC_QUPV3_WRAPPER_1_BCR					13
+#define GCC_QUPV3_WRAPPER_2_BCR					14
+#define GCC_QUSB2PHY_PRIM_BCR					15
+#define GCC_QUSB2PHY_SEC_BCR					16
+#define GCC_USB3_PHY_PRIM_BCR					17
+#define GCC_USB3_DP_PHY_PRIM_BCR				18
+#define GCC_USB3_PHY_SEC_BCR					19
+#define GCC_USB3PHY_PHY_SEC_BCR					20
+#define GCC_SDCC2_BCR						21
+#define GCC_SDCC4_BCR						22
+#define GCC_TSIF_BCR						23
+#define GCC_UFS_CARD_BCR					24
+#define GCC_UFS_PHY_BCR						25
+#define GCC_USB30_PRIM_BCR					26
+#define GCC_USB30_SEC_BCR					27
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				28
+
+#endif
-- 
2.20.1

