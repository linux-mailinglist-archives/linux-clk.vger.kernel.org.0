Return-Path: <linux-clk+bounces-13369-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 354169A46A7
	for <lists+linux-clk@lfdr.de>; Fri, 18 Oct 2024 21:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CB391C21D22
	for <lists+linux-clk@lfdr.de>; Fri, 18 Oct 2024 19:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A330A207A0D;
	Fri, 18 Oct 2024 19:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hb8pIgd6"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED5B206066;
	Fri, 18 Oct 2024 19:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729278833; cv=none; b=sSny72TBI5z6OSREDkZslq2uedlLN9/dw105qWL5TGAyn43aqEPpMmA6aV/D4DCUjksZKLrkqmq7hkQYvoOATs3WKPeVfVjOle1Rwdiz9EDJAME2yLE9Z+1/85GZGkKEAhICF5bpH63T82jLWT6ZN9o8mVF2+nJ+vNdxkBh6r0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729278833; c=relaxed/simple;
	bh=QYgT57lodJmrNeHPsmGspxPZj1tPERoV14QrtJd15Dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=obL1+ai3wgvx3yWmsNGtR6Jec61dIzNh57vcXfHb6ejW9aOUqDed4ZAenZcKpnt4kooocMjWxdotrQOXpewbFRLhXI2rq2fOi79ZLPLj2pcrNNo2K/j9b9QM5gN0lklZRhO05yCXOLLvCXiI6QigktFrFbUU/538abc0qc+Ts9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hb8pIgd6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IDBkhP016667;
	Fri, 18 Oct 2024 19:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ao9oGZbxaO3VolutanfkypJlYmyqZrv6bAmcGxkei9Q=; b=Hb8pIgd6jxvVdjnF
	XxALwU9SjP6vWpsSM6uJlhPKJTcSvyRT7Bt6FQ8hhXOsvtkIWiOaaBG3UBj5h8WV
	7VfEaHtSSxhUxwZUcoJxkmdVTsrUlgKAUaagniFUrJ987z0zAEg4DN3xMfWWKwgs
	zy1q8+kf2zMVVduC+oT/SW0vbA4CA6dxUgRAz76LHOlQvaQQewmNb7BCdFEfO9Q9
	jyXP0kthIfaiN3F9R8rlRCp/fDfajqCKO1jLGzdCMD4DJTXmHSXvMVIOd6RpjrZz
	r2wNlOpig+rDYrmwX3GpG4Vpt6y0jKHnrWCuzt9uaoin3MR/pKBu+06+tI0bhhYR
	5+IPTQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bh3paf05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 19:13:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IJDCJl030965
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 19:13:12 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 18 Oct 2024 12:13:07 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Sat, 19 Oct 2024 00:42:35 +0530
Subject: [PATCH 05/12] dt-bindings: clock: qcom: Add QCS615 GCC clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241019-qcs615-mm-clockcontroller-v1-5-9f1ca2048287@quicinc.com>
References: <20241019-qcs615-mm-clockcontroller-v1-0-9f1ca2048287@quicinc.com>
In-Reply-To: <20241019-qcs615-mm-clockcontroller-v1-0-9f1ca2048287@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhishek Sahu
	<absahu@codeaurora.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Stephen Boyd" <sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        "Taniya
 Das" <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u_uSEhrTsFulTVYuosGWKaX1rVyZKwHc
X-Proofpoint-ORIG-GUID: u_uSEhrTsFulTVYuosGWKaX1rVyZKwHc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180122

Add device tree bindings for global clock controller on QCS615 SoCs.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,qcs615-gcc.yaml |  59 ++++++
 include/dt-bindings/clock/qcom,qcs615-gcc.h        | 211 +++++++++++++++++++++
 2 files changed, 270 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fecc694cd71b8aeb3d420ccea5f5ffba04c8ff9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on QCS615
+
+maintainers:
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on QCS615.
+
+  See also:: include/dt-bindings/clock/qcom,qcs615-gcc.h
+
+properties:
+  compatible:
+    const: qcom,qcs615-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: bi_tcxo_ao
+      - const: sleep_clk
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#power-domain-cells'
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
+      compatible = "qcom,qcs615-gcc";
+      reg = <0x00100000 0x1f0000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>;
+      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,qcs615-gcc.h b/include/dt-bindings/clock/qcom,qcs615-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..9704091636b87108a2a8c5ccc4a6b293829d8272
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,qcs615-gcc.h
@@ -0,0 +1,211 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_QCS615_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_QCS615_H
+
+/* GCC clocks */
+#define GPLL0_OUT_AUX2_DIV					0
+#define GPLL3_OUT_AUX2_DIV					1
+#define GPLL0							2
+#define GPLL3							3
+#define GPLL4							4
+#define GPLL6							5
+#define GPLL6_OUT_MAIN						6
+#define GPLL7							7
+#define GPLL8							8
+#define GPLL8_OUT_MAIN						9
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				10
+#define GCC_AGGRE_USB2_SEC_AXI_CLK				11
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				12
+#define GCC_AHB2PHY_EAST_CLK					13
+#define GCC_AHB2PHY_WEST_CLK					14
+#define GCC_BOOT_ROM_AHB_CLK					15
+#define GCC_CAMERA_AHB_CLK					16
+#define GCC_CAMERA_HF_AXI_CLK					17
+#define GCC_CAMERA_XO_CLK					18
+#define GCC_CE1_AHB_CLK						19
+#define GCC_CE1_AXI_CLK						20
+#define GCC_CE1_CLK						21
+#define GCC_CFG_NOC_USB2_SEC_AXI_CLK				22
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				23
+#define GCC_CPUSS_AHB_CLK					24
+#define GCC_CPUSS_AHB_CLK_SRC					25
+#define GCC_CPUSS_GNOC_CLK					26
+#define GCC_DDRSS_GPU_AXI_CLK					27
+#define GCC_DISP_AHB_CLK					28
+#define GCC_DISP_GPLL0_DIV_CLK_SRC				29
+#define GCC_DISP_HF_AXI_CLK					30
+#define GCC_DISP_XO_CLK						31
+#define GCC_EMAC_AXI_CLK					32
+#define GCC_EMAC_PTP_CLK					33
+#define GCC_EMAC_PTP_CLK_SRC					34
+#define GCC_EMAC_RGMII_CLK					35
+#define GCC_EMAC_RGMII_CLK_SRC					36
+#define GCC_EMAC_SLV_AHB_CLK					37
+#define GCC_GP1_CLK						38
+#define GCC_GP1_CLK_SRC						39
+#define GCC_GP2_CLK						40
+#define GCC_GP2_CLK_SRC						41
+#define GCC_GP3_CLK						42
+#define GCC_GP3_CLK_SRC						43
+#define GCC_GPU_CFG_AHB_CLK					44
+#define GCC_GPU_GPLL0_CLK_SRC					45
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				46
+#define GCC_GPU_IREF_CLK					47
+#define GCC_GPU_MEMNOC_GFX_CLK					48
+#define GCC_GPU_SNOC_DVM_GFX_CLK				49
+#define GCC_PCIE0_PHY_REFGEN_CLK				50
+#define GCC_PCIE_0_AUX_CLK					51
+#define GCC_PCIE_0_AUX_CLK_SRC					52
+#define GCC_PCIE_0_CFG_AHB_CLK					53
+#define GCC_PCIE_0_CLKREF_CLK					54
+#define GCC_PCIE_0_MSTR_AXI_CLK					55
+#define GCC_PCIE_0_PIPE_CLK					56
+#define GCC_PCIE_0_SLV_AXI_CLK					57
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				58
+#define GCC_PCIE_PHY_AUX_CLK					59
+#define GCC_PCIE_PHY_REFGEN_CLK_SRC				60
+#define GCC_PDM2_CLK						61
+#define GCC_PDM2_CLK_SRC					62
+#define GCC_PDM_AHB_CLK						63
+#define GCC_PDM_XO4_CLK						64
+#define GCC_PRNG_AHB_CLK					65
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				66
+#define GCC_QMIP_DISP_AHB_CLK					67
+#define GCC_QMIP_PCIE_AHB_CLK					68
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				69
+#define GCC_QSPI_CNOC_PERIPH_AHB_CLK				70
+#define GCC_QSPI_CORE_CLK					71
+#define GCC_QSPI_CORE_CLK_SRC					72
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				73
+#define GCC_QUPV3_WRAP0_CORE_CLK				74
+#define GCC_QUPV3_WRAP0_S0_CLK					75
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				76
+#define GCC_QUPV3_WRAP0_S1_CLK					77
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				78
+#define GCC_QUPV3_WRAP0_S2_CLK					79
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				80
+#define GCC_QUPV3_WRAP0_S3_CLK					81
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				82
+#define GCC_QUPV3_WRAP0_S4_CLK					83
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				84
+#define GCC_QUPV3_WRAP0_S5_CLK					85
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				86
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				87
+#define GCC_QUPV3_WRAP1_CORE_CLK				88
+#define GCC_QUPV3_WRAP1_S0_CLK					89
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				90
+#define GCC_QUPV3_WRAP1_S1_CLK					91
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				92
+#define GCC_QUPV3_WRAP1_S2_CLK					93
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				94
+#define GCC_QUPV3_WRAP1_S3_CLK					95
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				96
+#define GCC_QUPV3_WRAP1_S4_CLK					97
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				98
+#define GCC_QUPV3_WRAP1_S5_CLK					99
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				100
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				101
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				102
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				103
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				104
+#define GCC_RX1_USB2_CLKREF_CLK					105
+#define GCC_RX3_USB2_CLKREF_CLK					106
+#define GCC_SDCC1_AHB_CLK					107
+#define GCC_SDCC1_APPS_CLK					108
+#define GCC_SDCC1_APPS_CLK_SRC					109
+#define GCC_SDCC1_ICE_CORE_CLK					110
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				111
+#define GCC_SDCC2_AHB_CLK					112
+#define GCC_SDCC2_APPS_CLK					113
+#define GCC_SDCC2_APPS_CLK_SRC					114
+#define GCC_SDR_CORE_CLK					115
+#define GCC_SDR_CSR_HCLK					116
+#define GCC_SDR_PRI_MI2S_CLK					117
+#define GCC_SDR_SEC_MI2S_CLK					118
+#define GCC_SDR_WR0_MEM_CLK					119
+#define GCC_SDR_WR1_MEM_CLK					120
+#define GCC_SDR_WR2_MEM_CLK					121
+#define GCC_SYS_NOC_CPUSS_AHB_CLK				122
+#define GCC_UFS_CARD_CLKREF_CLK					123
+#define GCC_UFS_MEM_CLKREF_CLK					124
+#define GCC_UFS_PHY_AHB_CLK					125
+#define GCC_UFS_PHY_AXI_CLK					126
+#define GCC_UFS_PHY_AXI_CLK_SRC					127
+#define GCC_UFS_PHY_ICE_CORE_CLK				128
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				129
+#define GCC_UFS_PHY_PHY_AUX_CLK					130
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				131
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				132
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				133
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				134
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				135
+#define GCC_USB20_SEC_MASTER_CLK				136
+#define GCC_USB20_SEC_MASTER_CLK_SRC				137
+#define GCC_USB20_SEC_MOCK_UTMI_CLK				138
+#define GCC_USB20_SEC_MOCK_UTMI_CLK_SRC				139
+#define GCC_USB20_SEC_SLEEP_CLK					140
+#define GCC_USB2_PRIM_CLKREF_CLK				141
+#define GCC_USB2_SEC_CLKREF_CLK					142
+#define GCC_USB2_SEC_PHY_AUX_CLK				143
+#define GCC_USB2_SEC_PHY_AUX_CLK_SRC				144
+#define GCC_USB2_SEC_PHY_COM_AUX_CLK				145
+#define GCC_USB2_SEC_PHY_PIPE_CLK				146
+#define GCC_USB30_PRIM_MASTER_CLK				147
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				148
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				149
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			150
+#define GCC_USB30_PRIM_SLEEP_CLK				151
+#define GCC_USB3_PRIM_CLKREF_CLK				152
+#define GCC_USB3_PRIM_PHY_AUX_CLK				153
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				154
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				155
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				156
+#define GCC_USB3_SEC_CLKREF_CLK					157
+#define GCC_VIDEO_AHB_CLK					158
+#define GCC_VIDEO_AXI0_CLK					159
+#define GCC_VIDEO_XO_CLK					160
+#define GCC_VSENSOR_CLK_SRC					161
+#define GCC_AGGRE_UFS_PHY_AXI_HW_CTL_CLK			162
+#define GCC_UFS_PHY_AXI_HW_CTL_CLK				163
+#define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK				164
+#define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK				165
+#define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK			166
+
+/* GCC Resets */
+#define GCC_EMAC_BCR                                            0
+#define GCC_QUSB2PHY_PRIM_BCR                                   1
+#define GCC_QUSB2PHY_SEC_BCR                                    2
+#define GCC_USB30_PRIM_BCR                                      3
+#define GCC_USB2_PHY_SEC_BCR                                    4
+#define GCC_USB3_DP_PHY_SEC_BCR                                 5
+#define GCC_USB3PHY_PHY_SEC_BCR                                 6
+#define GCC_PCIE_0_BCR                                          7
+#define GCC_PCIE_0_PHY_BCR                                      8
+#define GCC_PCIE_PHY_BCR                                        9
+#define GCC_PCIE_PHY_COM_BCR                                    10
+#define GCC_UFS_PHY_BCR                                         11
+#define GCC_USB20_SEC_BCR                                       12
+#define GCC_USB3_PHY_PRIM_SP0_BCR                               13
+#define GCC_USB3PHY_PHY_PRIM_SP0_BCR                            14
+#define GCC_SDCC1_BCR                                           15
+#define GCC_SDCC2_BCR                                           16
+
+/* GCC power domains */
+#define EMAC_GDSC						0
+#define PCIE_0_GDSC						1
+#define UFS_PHY_GDSC						2
+#define USB20_SEC_GDSC						3
+#define USB30_PRIM_GDSC						4
+#define HLOS1_VOTE_AGGRE_NOC_MMU_AUDIO_TBU_GDSC			5
+#define HLOS1_VOTE_AGGRE_NOC_MMU_TBU1_GDSC			6
+#define HLOS1_VOTE_AGGRE_NOC_MMU_TBU2_GDSC			7
+#define HLOS1_VOTE_AGGRE_NOC_MMU_PCIE_TBU_GDSC			8
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC			9
+#define HLOS1_VOTE_MMNOC_MMU_TBU_SF_GDSC			10
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF1_GDSC			11
+
+#endif

-- 
2.45.2


