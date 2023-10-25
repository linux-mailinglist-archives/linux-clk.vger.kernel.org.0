Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB9487D6D5D
	for <lists+linux-clk@lfdr.de>; Wed, 25 Oct 2023 15:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344620AbjJYNem (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 25 Oct 2023 09:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344572AbjJYNel (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Oct 2023 09:34:41 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562A7B4;
        Wed, 25 Oct 2023 06:34:37 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39PBuMDh032482;
        Wed, 25 Oct 2023 13:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=Im47LQ4bagq4vg44EgIKhsdexxEEJQC1O75RgqyRoFw=;
 b=Y5bm1um/2l9pLs8ZYnX9BfszdqGgvVUXZb6BEnH18BA3axmiFmarmHJMKQQHrCc8/SJV
 dk0sJ/DaWMNuJLyqCS5UwKfmgTf/WSHBMuoQemxdGUgOunAmx+9Ifz70KUz+NiBtJTbz
 qzOSw7njWnk+72c7l5fxXFv+z2KElX8YxBglcjoqTtzA0+Pk/I/URQtEQ0EValL9Vbk3
 4E5I6TOmvdfkxrE79NpP2SE02D9JePa+QVXaUh6sk6FuFFT4ULjkNsrqWSs78gRjehaj
 U58OHW3St1gY1AR6A80o4/t/DETasPTBWt5ut95Y59JLE6ojSE/bJQRcLAdGggiA5EYu zg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3txumsh0xw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Oct 2023 13:34:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39PDYBsr031954
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Oct 2023 13:34:11 GMT
Received: from blr-ubuntu-87.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Wed, 25 Oct 2023 06:34:05 -0700
From:   Sibi Sankar <quic_sibis@quicinc.com>
To:     <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC:     <agross@kernel.org>, <conor+dt@kernel.org>,
        <quic_tdas@quicinc.com>, <quic_rjendra@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <neil.armstrong@linaro.org>, <abel.vesa@linaro.org>,
        <quic_tsoni@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Add SC8380XP GCC clocks
Date:   Wed, 25 Oct 2023 19:03:17 +0530
Message-ID: <20231025133320.4720-2-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231025133320.4720-1-quic_sibis@quicinc.com>
References: <20231025133320.4720-1-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0z5nuz40-5yVzi0kUt2s9HFWyg7AdbZ0
X-Proofpoint-ORIG-GUID: 0z5nuz40-5yVzi0kUt2s9HFWyg7AdbZ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-25_02,2023-10-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310250118
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Rajendra Nayak <quic_rjendra@quicinc.com>

Add device tree bindings for global clock controller on SC8380XP SoCs.

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 .../bindings/clock/qcom,sc8380xp-gcc.yaml     |  72 +++
 include/dt-bindings/clock/qcom,sc8380xp-gcc.h | 485 ++++++++++++++++++
 2 files changed, 557 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc8380xp-gcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sc8380xp-gcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8380xp-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8380xp-gcc.yaml
new file mode 100644
index 000000000000..8b231e1d25ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8380xp-gcc.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sc8380xp-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on SC8380XP
+
+maintainers:
+  - Rajendra Nayak <quic_rjendra@quicinc.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on SC8380XP
+
+  See also:: include/dt-bindings/clock/qcom,sc8380xp-gcc.h
+
+properties:
+  compatible:
+    const: qcom,sc8380xp-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: PCIe 3 pipe clock
+      - description: PCIe 4 pipe clock
+      - description: PCIe 5 pipe clock
+      - description: PCIe 6a pipe clock
+      - description: PCIe 6b pipe clock
+      - description: USB QMP Phy 0 clock source
+      - description: USB QMP Phy 1 clock source
+      - description: USB QMP Phy 2 clock source
+
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@100000 {
+      compatible = "qcom,sc8380xp-gcc";
+      reg = <0x00100000 0x200000>;
+      clocks = <&bi_tcxo_div2>,
+               <&sleep_clk>,
+               <&pcie3_phy>,
+               <&pcie4_phy>,
+               <&pcie5_phy>,
+               <&pcie6a_phy>,
+               <&pcie6b_phy>,
+               <&usb_1_ss0_qmpphy 0>,
+               <&usb_1_ss1_qmpphy 1>,
+               <&usb_1_ss2_qmpphy 2>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,sc8380xp-gcc.h b/include/dt-bindings/clock/qcom,sc8380xp-gcc.h
new file mode 100644
index 000000000000..c4cf449accf8
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sc8380xp-gcc.h
@@ -0,0 +1,485 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SC8380XP_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SC8380XP_H
+
+/* GCC clocks */
+#define GCC_AGGRE_NOC_USB_NORTH_AXI_CLK				0
+#define GCC_AGGRE_NOC_USB_SOUTH_AXI_CLK				1
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				2
+#define GCC_AGGRE_USB2_PRIM_AXI_CLK				3
+#define GCC_AGGRE_USB3_MP_AXI_CLK				4
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				5
+#define GCC_AGGRE_USB3_SEC_AXI_CLK				6
+#define GCC_AGGRE_USB3_TERT_AXI_CLK				7
+#define GCC_AGGRE_USB4_0_AXI_CLK				8
+#define GCC_AGGRE_USB4_1_AXI_CLK				9
+#define GCC_AGGRE_USB4_2_AXI_CLK				10
+#define GCC_AGGRE_USB_NOC_AXI_CLK				11
+#define GCC_AV1E_AHB_CLK					12
+#define GCC_AV1E_AXI_CLK					13
+#define GCC_AV1E_XO_CLK						14
+#define GCC_BOOT_ROM_AHB_CLK					15
+#define GCC_CAMERA_AHB_CLK					16
+#define GCC_CAMERA_HF_AXI_CLK					17
+#define GCC_CAMERA_SF_AXI_CLK					18
+#define GCC_CAMERA_XO_CLK					19
+#define GCC_CFG_NOC_PCIE_ANOC_AHB_CLK				20
+#define GCC_CFG_NOC_PCIE_ANOC_NORTH_AHB_CLK			21
+#define GCC_CFG_NOC_PCIE_ANOC_SOUTH_AHB_CLK			22
+#define GCC_CFG_NOC_USB2_PRIM_AXI_CLK				23
+#define GCC_CFG_NOC_USB3_MP_AXI_CLK				24
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				25
+#define GCC_CFG_NOC_USB3_SEC_AXI_CLK				26
+#define GCC_CFG_NOC_USB3_TERT_AXI_CLK				27
+#define GCC_CFG_NOC_USB_ANOC_AHB_CLK				28
+#define GCC_CFG_NOC_USB_ANOC_NORTH_AHB_CLK			29
+#define GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK			30
+#define GCC_CNOC_PCIE1_TUNNEL_CLK				31
+#define GCC_CNOC_PCIE2_TUNNEL_CLK				32
+#define GCC_CNOC_PCIE_NORTH_SF_AXI_CLK				33
+#define GCC_CNOC_PCIE_SOUTH_SF_AXI_CLK				34
+#define GCC_CNOC_PCIE_TUNNEL_CLK				35
+#define GCC_DDRSS_GPU_AXI_CLK					36
+#define GCC_DISP_AHB_CLK					37
+#define GCC_DISP_HF_AXI_CLK					38
+#define GCC_DISP_XO_CLK						39
+#define GCC_GP1_CLK						40
+#define GCC_GP1_CLK_SRC						41
+#define GCC_GP2_CLK						42
+#define GCC_GP2_CLK_SRC						43
+#define GCC_GP3_CLK						44
+#define GCC_GP3_CLK_SRC						45
+#define GCC_GPLL0						46
+#define GCC_GPLL0_OUT_EVEN					47
+#define GCC_GPLL4						48
+#define GCC_GPLL7						49
+#define GCC_GPLL8						50
+#define GCC_GPLL9						51
+#define GCC_GPU_CFG_AHB_CLK					52
+#define GCC_GPU_GPLL0_CPH_CLK_SRC				53
+#define GCC_GPU_GPLL0_DIV_CPH_CLK_SRC				54
+#define GCC_GPU_MEMNOC_GFX_CLK					55
+#define GCC_GPU_SNOC_DVM_GFX_CLK				56
+#define GCC_PCIE0_PHY_RCHNG_CLK					57
+#define GCC_PCIE1_PHY_RCHNG_CLK					58
+#define GCC_PCIE2_PHY_RCHNG_CLK					59
+#define GCC_PCIE_0_AUX_CLK					60
+#define GCC_PCIE_0_AUX_CLK_SRC					61
+#define GCC_PCIE_0_CFG_AHB_CLK					62
+#define GCC_PCIE_0_MSTR_AXI_CLK					63
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC				64
+#define GCC_PCIE_0_PIPE_CLK					65
+#define GCC_PCIE_0_SLV_AXI_CLK					66
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				67
+#define GCC_PCIE_1_AUX_CLK					68
+#define GCC_PCIE_1_AUX_CLK_SRC					69
+#define GCC_PCIE_1_CFG_AHB_CLK					70
+#define GCC_PCIE_1_MSTR_AXI_CLK					71
+#define GCC_PCIE_1_PHY_RCHNG_CLK_SRC				72
+#define GCC_PCIE_1_PIPE_CLK					73
+#define GCC_PCIE_1_SLV_AXI_CLK					74
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK				75
+#define GCC_PCIE_2_AUX_CLK					76
+#define GCC_PCIE_2_AUX_CLK_SRC					77
+#define GCC_PCIE_2_CFG_AHB_CLK					78
+#define GCC_PCIE_2_MSTR_AXI_CLK					79
+#define GCC_PCIE_2_PHY_RCHNG_CLK_SRC				80
+#define GCC_PCIE_2_PIPE_CLK					81
+#define GCC_PCIE_2_SLV_AXI_CLK					82
+#define GCC_PCIE_2_SLV_Q2A_AXI_CLK				83
+#define GCC_PCIE_3_AUX_CLK					84
+#define GCC_PCIE_3_AUX_CLK_SRC					85
+#define GCC_PCIE_3_CFG_AHB_CLK					86
+#define GCC_PCIE_3_MSTR_AXI_CLK					87
+#define GCC_PCIE_3_PHY_AUX_CLK					88
+#define GCC_PCIE_3_PHY_RCHNG_CLK				89
+#define GCC_PCIE_3_PHY_RCHNG_CLK_SRC				90
+#define GCC_PCIE_3_PIPE_CLK					91
+#define GCC_PCIE_3_PIPE_DIV_CLK_SRC				92
+#define GCC_PCIE_3_PIPEDIV2_CLK					93
+#define GCC_PCIE_3_SLV_AXI_CLK					94
+#define GCC_PCIE_3_SLV_Q2A_AXI_CLK				95
+#define GCC_PCIE_4_AUX_CLK					96
+#define GCC_PCIE_4_AUX_CLK_SRC					97
+#define GCC_PCIE_4_CFG_AHB_CLK					98
+#define GCC_PCIE_4_MSTR_AXI_CLK					99
+#define GCC_PCIE_4_PHY_RCHNG_CLK				100
+#define GCC_PCIE_4_PHY_RCHNG_CLK_SRC				101
+#define GCC_PCIE_4_PIPE_CLK					102
+#define GCC_PCIE_4_PIPE_DIV_CLK_SRC				103
+#define GCC_PCIE_4_PIPEDIV2_CLK					104
+#define GCC_PCIE_4_SLV_AXI_CLK					105
+#define GCC_PCIE_4_SLV_Q2A_AXI_CLK				106
+#define GCC_PCIE_5_AUX_CLK					107
+#define GCC_PCIE_5_AUX_CLK_SRC					108
+#define GCC_PCIE_5_CFG_AHB_CLK					109
+#define GCC_PCIE_5_MSTR_AXI_CLK					110
+#define GCC_PCIE_5_PHY_RCHNG_CLK				111
+#define GCC_PCIE_5_PHY_RCHNG_CLK_SRC				112
+#define GCC_PCIE_5_PIPE_CLK					113
+#define GCC_PCIE_5_PIPE_DIV_CLK_SRC				114
+#define GCC_PCIE_5_PIPEDIV2_CLK					115
+#define GCC_PCIE_5_SLV_AXI_CLK					116
+#define GCC_PCIE_5_SLV_Q2A_AXI_CLK				117
+#define GCC_PCIE_6A_AUX_CLK					118
+#define GCC_PCIE_6A_AUX_CLK_SRC					119
+#define GCC_PCIE_6A_CFG_AHB_CLK					120
+#define GCC_PCIE_6A_MSTR_AXI_CLK				121
+#define GCC_PCIE_6A_PHY_AUX_CLK					122
+#define GCC_PCIE_6A_PHY_RCHNG_CLK				123
+#define GCC_PCIE_6A_PHY_RCHNG_CLK_SRC				124
+#define GCC_PCIE_6A_PIPE_CLK					125
+#define GCC_PCIE_6A_PIPE_DIV_CLK_SRC				126
+#define GCC_PCIE_6A_PIPEDIV2_CLK				127
+#define GCC_PCIE_6A_SLV_AXI_CLK					128
+#define GCC_PCIE_6A_SLV_Q2A_AXI_CLK				129
+#define GCC_PCIE_6B_AUX_CLK					130
+#define GCC_PCIE_6B_AUX_CLK_SRC					131
+#define GCC_PCIE_6B_CFG_AHB_CLK					132
+#define GCC_PCIE_6B_MSTR_AXI_CLK				133
+#define GCC_PCIE_6B_PHY_AUX_CLK					134
+#define GCC_PCIE_6B_PHY_RCHNG_CLK				135
+#define GCC_PCIE_6B_PHY_RCHNG_CLK_SRC				136
+#define GCC_PCIE_6B_PIPE_CLK					137
+#define GCC_PCIE_6B_PIPE_DIV_CLK_SRC				138
+#define GCC_PCIE_6B_PIPEDIV2_CLK				139
+#define GCC_PCIE_6B_SLV_AXI_CLK					140
+#define GCC_PCIE_6B_SLV_Q2A_AXI_CLK				141
+#define GCC_PCIE_RSCC_AHB_CLK					142
+#define GCC_PCIE_RSCC_XO_CLK					143
+#define GCC_PCIE_RSCC_XO_CLK_SRC				144
+#define GCC_PDM2_CLK						145
+#define GCC_PDM2_CLK_SRC					146
+#define GCC_PDM_AHB_CLK						147
+#define GCC_PDM_XO4_CLK						148
+#define GCC_QMIP_AV1E_AHB_CLK					149
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				150
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				151
+#define GCC_QMIP_DISP_AHB_CLK					152
+#define GCC_QMIP_GPU_AHB_CLK					153
+#define GCC_QMIP_VIDEO_CV_CPU_AHB_CLK				154
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK				155
+#define GCC_QMIP_VIDEO_V_CPU_AHB_CLK				156
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				157
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				158
+#define GCC_QUPV3_WRAP0_CORE_CLK				159
+#define GCC_QUPV3_WRAP0_QSPI_S2_CLK				160
+#define GCC_QUPV3_WRAP0_QSPI_S3_CLK				161
+#define GCC_QUPV3_WRAP0_S0_CLK					162
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				163
+#define GCC_QUPV3_WRAP0_S1_CLK					164
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				165
+#define GCC_QUPV3_WRAP0_S2_CLK					166
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				167
+#define GCC_QUPV3_WRAP0_S2_DIV_CLK_SRC				168
+#define GCC_QUPV3_WRAP0_S3_CLK					169
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				170
+#define GCC_QUPV3_WRAP0_S3_DIV_CLK_SRC				171
+#define GCC_QUPV3_WRAP0_S4_CLK					172
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				173
+#define GCC_QUPV3_WRAP0_S5_CLK					174
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				175
+#define GCC_QUPV3_WRAP0_S6_CLK					176
+#define GCC_QUPV3_WRAP0_S6_CLK_SRC				177
+#define GCC_QUPV3_WRAP0_S7_CLK					178
+#define GCC_QUPV3_WRAP0_S7_CLK_SRC				179
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				180
+#define GCC_QUPV3_WRAP1_CORE_CLK				181
+#define GCC_QUPV3_WRAP1_QSPI_S2_CLK				182
+#define GCC_QUPV3_WRAP1_QSPI_S3_CLK				183
+#define GCC_QUPV3_WRAP1_S0_CLK					184
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				185
+#define GCC_QUPV3_WRAP1_S1_CLK					186
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				187
+#define GCC_QUPV3_WRAP1_S2_CLK					188
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				189
+#define GCC_QUPV3_WRAP1_S2_DIV_CLK_SRC				190
+#define GCC_QUPV3_WRAP1_S3_CLK					191
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				192
+#define GCC_QUPV3_WRAP1_S3_DIV_CLK_SRC				193
+#define GCC_QUPV3_WRAP1_S4_CLK					194
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				195
+#define GCC_QUPV3_WRAP1_S5_CLK					196
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				197
+#define GCC_QUPV3_WRAP1_S6_CLK					198
+#define GCC_QUPV3_WRAP1_S6_CLK_SRC				199
+#define GCC_QUPV3_WRAP1_S7_CLK					200
+#define GCC_QUPV3_WRAP1_S7_CLK_SRC				201
+#define GCC_QUPV3_WRAP2_CORE_2X_CLK				202
+#define GCC_QUPV3_WRAP2_CORE_CLK				203
+#define GCC_QUPV3_WRAP2_QSPI_S2_CLK				204
+#define GCC_QUPV3_WRAP2_QSPI_S3_CLK				205
+#define GCC_QUPV3_WRAP2_S0_CLK					206
+#define GCC_QUPV3_WRAP2_S0_CLK_SRC				207
+#define GCC_QUPV3_WRAP2_S1_CLK					208
+#define GCC_QUPV3_WRAP2_S1_CLK_SRC				209
+#define GCC_QUPV3_WRAP2_S2_CLK					210
+#define GCC_QUPV3_WRAP2_S2_CLK_SRC				211
+#define GCC_QUPV3_WRAP2_S2_DIV_CLK_SRC				212
+#define GCC_QUPV3_WRAP2_S3_CLK					213
+#define GCC_QUPV3_WRAP2_S3_CLK_SRC				214
+#define GCC_QUPV3_WRAP2_S3_DIV_CLK_SRC				215
+#define GCC_QUPV3_WRAP2_S4_CLK					216
+#define GCC_QUPV3_WRAP2_S4_CLK_SRC				217
+#define GCC_QUPV3_WRAP2_S5_CLK					218
+#define GCC_QUPV3_WRAP2_S5_CLK_SRC				219
+#define GCC_QUPV3_WRAP2_S6_CLK					220
+#define GCC_QUPV3_WRAP2_S6_CLK_SRC				221
+#define GCC_QUPV3_WRAP2_S7_CLK					222
+#define GCC_QUPV3_WRAP2_S7_CLK_SRC				223
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				224
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				225
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				226
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				227
+#define GCC_QUPV3_WRAP_2_M_AHB_CLK				228
+#define GCC_QUPV3_WRAP_2_S_AHB_CLK				229
+#define GCC_SDCC2_AHB_CLK					230
+#define GCC_SDCC2_APPS_CLK					231
+#define GCC_SDCC2_APPS_CLK_SRC					232
+#define GCC_SDCC4_AHB_CLK					233
+#define GCC_SDCC4_APPS_CLK					234
+#define GCC_SDCC4_APPS_CLK_SRC					235
+#define GCC_SYS_NOC_USB_AXI_CLK					236
+#define GCC_UFS_PHY_AHB_CLK					237
+#define GCC_UFS_PHY_AXI_CLK					238
+#define GCC_UFS_PHY_AXI_CLK_SRC					239
+#define GCC_UFS_PHY_ICE_CORE_CLK				240
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				241
+#define GCC_UFS_PHY_PHY_AUX_CLK					242
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				243
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				244
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				245
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				246
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				247
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				248
+#define GCC_USB20_MASTER_CLK					249
+#define GCC_USB20_MASTER_CLK_SRC				250
+#define GCC_USB20_MOCK_UTMI_CLK					251
+#define GCC_USB20_MOCK_UTMI_CLK_SRC				252
+#define GCC_USB20_MOCK_UTMI_POSTDIV_CLK_SRC			253
+#define GCC_USB20_SLEEP_CLK					254
+#define GCC_USB30_MP_MASTER_CLK					255
+#define GCC_USB30_MP_MASTER_CLK_SRC				256
+#define GCC_USB30_MP_MOCK_UTMI_CLK				257
+#define GCC_USB30_MP_MOCK_UTMI_CLK_SRC				258
+#define GCC_USB30_MP_MOCK_UTMI_POSTDIV_CLK_SRC			259
+#define GCC_USB30_MP_SLEEP_CLK					260
+#define GCC_USB30_PRIM_MASTER_CLK				261
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				262
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				263
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			264
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		265
+#define GCC_USB30_PRIM_SLEEP_CLK				266
+#define GCC_USB30_SEC_MASTER_CLK				267
+#define GCC_USB30_SEC_MASTER_CLK_SRC				268
+#define GCC_USB30_SEC_MOCK_UTMI_CLK				269
+#define GCC_USB30_SEC_MOCK_UTMI_CLK_SRC				270
+#define GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC			271
+#define GCC_USB30_SEC_SLEEP_CLK					272
+#define GCC_USB30_TERT_MASTER_CLK				273
+#define GCC_USB30_TERT_MASTER_CLK_SRC				274
+#define GCC_USB30_TERT_MOCK_UTMI_CLK				275
+#define GCC_USB30_TERT_MOCK_UTMI_CLK_SRC			276
+#define GCC_USB30_TERT_MOCK_UTMI_POSTDIV_CLK_SRC		277
+#define GCC_USB30_TERT_SLEEP_CLK				278
+#define GCC_USB3_MP_PHY_AUX_CLK					279
+#define GCC_USB3_MP_PHY_AUX_CLK_SRC				280
+#define GCC_USB3_MP_PHY_COM_AUX_CLK				281
+#define GCC_USB3_MP_PHY_PIPE_0_CLK				282
+#define GCC_USB3_MP_PHY_PIPE_1_CLK				283
+#define GCC_USB3_PRIM_PHY_AUX_CLK				284
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				285
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				286
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				287
+#define GCC_USB3_SEC_PHY_AUX_CLK				288
+#define GCC_USB3_SEC_PHY_AUX_CLK_SRC				289
+#define GCC_USB3_SEC_PHY_COM_AUX_CLK				290
+#define GCC_USB3_SEC_PHY_PIPE_CLK				291
+#define GCC_USB3_TERT_PHY_AUX_CLK				292
+#define GCC_USB3_TERT_PHY_AUX_CLK_SRC				293
+#define GCC_USB3_TERT_PHY_COM_AUX_CLK				294
+#define GCC_USB3_TERT_PHY_PIPE_CLK				295
+#define GCC_USB4_0_CFG_AHB_CLK					296
+#define GCC_USB4_0_DP0_CLK					297
+#define GCC_USB4_0_DP1_CLK					298
+#define GCC_USB4_0_MASTER_CLK					299
+#define GCC_USB4_0_MASTER_CLK_SRC				300
+#define GCC_USB4_0_PHY_P2RR2P_PIPE_CLK				301
+#define GCC_USB4_0_PHY_PCIE_PIPE_CLK				302
+#define GCC_USB4_0_PHY_PCIE_PIPE_CLK_SRC			303
+#define GCC_USB4_0_PHY_RX0_CLK					304
+#define GCC_USB4_0_PHY_RX1_CLK					305
+#define GCC_USB4_0_PHY_USB_PIPE_CLK				306
+#define GCC_USB4_0_SB_IF_CLK					307
+#define GCC_USB4_0_SB_IF_CLK_SRC				308
+#define GCC_USB4_0_SYS_CLK					309
+#define GCC_USB4_0_TMU_CLK					310
+#define GCC_USB4_0_TMU_CLK_SRC					311
+#define GCC_USB4_1_CFG_AHB_CLK					312
+#define GCC_USB4_1_DP0_CLK					313
+#define GCC_USB4_1_DP1_CLK					314
+#define GCC_USB4_1_MASTER_CLK					315
+#define GCC_USB4_1_MASTER_CLK_SRC				316
+#define GCC_USB4_1_PHY_P2RR2P_PIPE_CLK				317
+#define GCC_USB4_1_PHY_PCIE_PIPE_CLK				318
+#define GCC_USB4_1_PHY_PCIE_PIPE_CLK_SRC			319
+#define GCC_USB4_1_PHY_RX0_CLK					320
+#define GCC_USB4_1_PHY_RX1_CLK					321
+#define GCC_USB4_1_PHY_USB_PIPE_CLK				322
+#define GCC_USB4_1_SB_IF_CLK					323
+#define GCC_USB4_1_SB_IF_CLK_SRC				324
+#define GCC_USB4_1_SYS_CLK					325
+#define GCC_USB4_1_TMU_CLK					326
+#define GCC_USB4_1_TMU_CLK_SRC					327
+#define GCC_USB4_2_CFG_AHB_CLK					328
+#define GCC_USB4_2_DP0_CLK					329
+#define GCC_USB4_2_DP1_CLK					330
+#define GCC_USB4_2_MASTER_CLK					331
+#define GCC_USB4_2_MASTER_CLK_SRC				332
+#define GCC_USB4_2_PHY_P2RR2P_PIPE_CLK				333
+#define GCC_USB4_2_PHY_PCIE_PIPE_CLK				334
+#define GCC_USB4_2_PHY_PCIE_PIPE_CLK_SRC			335
+#define GCC_USB4_2_PHY_RX0_CLK					336
+#define GCC_USB4_2_PHY_RX1_CLK					337
+#define GCC_USB4_2_PHY_USB_PIPE_CLK				338
+#define GCC_USB4_2_SB_IF_CLK					339
+#define GCC_USB4_2_SB_IF_CLK_SRC				340
+#define GCC_USB4_2_SYS_CLK					341
+#define GCC_USB4_2_TMU_CLK					342
+#define GCC_USB4_2_TMU_CLK_SRC					343
+#define GCC_VIDEO_AHB_CLK					344
+#define GCC_VIDEO_AXI0_CLK					345
+#define GCC_VIDEO_AXI1_CLK					346
+#define GCC_VIDEO_XO_CLK					347
+#define GCC_PCIE_3_PIPE_CLK_SRC					348
+#define GCC_PCIE_4_PIPE_CLK_SRC					349
+#define GCC_PCIE_5_PIPE_CLK_SRC					350
+#define GCC_PCIE_6A_PIPE_CLK_SRC				351
+#define GCC_PCIE_6B_PIPE_CLK_SRC				352
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				353
+#define GCC_USB3_SEC_PHY_PIPE_CLK_SRC				354
+#define GCC_USB3_TERT_PHY_PIPE_CLK_SRC				355
+
+/* GCC power domains */
+#define GCC_PCIE_0_TUNNEL_GDSC					0
+#define GCC_PCIE_1_TUNNEL_GDSC					1
+#define GCC_PCIE_2_TUNNEL_GDSC					2
+#define GCC_PCIE_3_GDSC						3
+#define GCC_PCIE_3_PHY_GDSC					4
+#define GCC_PCIE_4_GDSC						5
+#define GCC_PCIE_4_PHY_GDSC					6
+#define GCC_PCIE_5_GDSC						7
+#define GCC_PCIE_5_PHY_GDSC					8
+#define GCC_PCIE_6_PHY_GDSC					9
+#define GCC_PCIE_6A_GDSC					10
+#define GCC_PCIE_6B_GDSC					11
+#define GCC_UFS_MEM_PHY_GDSC					12
+#define GCC_UFS_PHY_GDSC					13
+#define GCC_USB20_PRIM_GDSC					14
+#define GCC_USB30_MP_GDSC					15
+#define GCC_USB30_PRIM_GDSC					16
+#define GCC_USB30_SEC_GDSC					17
+#define GCC_USB30_TERT_GDSC					18
+#define GCC_USB3_MP_SS0_PHY_GDSC				19
+#define GCC_USB3_MP_SS1_PHY_GDSC				20
+#define GCC_USB4_0_GDSC						21
+#define GCC_USB4_1_GDSC						22
+#define GCC_USB4_2_GDSC						23
+#define GCC_USB_0_PHY_GDSC					24
+#define GCC_USB_1_PHY_GDSC					25
+#define GCC_USB_2_PHY_GDSC					26
+
+/* GCC resets */
+#define GCC_AV1E_BCR						0
+#define GCC_CAMERA_BCR						1
+#define GCC_DISPLAY_BCR						2
+#define GCC_GPU_BCR						3
+#define GCC_PCIE_0_LINK_DOWN_BCR				4
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR				5
+#define GCC_PCIE_0_PHY_BCR					6
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR			7
+#define GCC_PCIE_0_TUNNEL_BCR					8
+#define GCC_PCIE_1_LINK_DOWN_BCR				9
+#define GCC_PCIE_1_NOCSR_COM_PHY_BCR				10
+#define GCC_PCIE_1_PHY_BCR					11
+#define GCC_PCIE_1_PHY_NOCSR_COM_PHY_BCR			12
+#define GCC_PCIE_1_TUNNEL_BCR					13
+#define GCC_PCIE_2_LINK_DOWN_BCR				14
+#define GCC_PCIE_2_NOCSR_COM_PHY_BCR				15
+#define GCC_PCIE_2_PHY_BCR					16
+#define GCC_PCIE_2_PHY_NOCSR_COM_PHY_BCR			17
+#define GCC_PCIE_2_TUNNEL_BCR					18
+#define GCC_PCIE_3_BCR						19
+#define GCC_PCIE_3_LINK_DOWN_BCR				20
+#define GCC_PCIE_3_NOCSR_COM_PHY_BCR				21
+#define GCC_PCIE_3_PHY_BCR					22
+#define GCC_PCIE_3_PHY_NOCSR_COM_PHY_BCR			23
+#define GCC_PCIE_4_BCR						24
+#define GCC_PCIE_4_LINK_DOWN_BCR				25
+#define GCC_PCIE_4_NOCSR_COM_PHY_BCR				26
+#define GCC_PCIE_4_PHY_BCR					27
+#define GCC_PCIE_4_PHY_NOCSR_COM_PHY_BCR			28
+#define GCC_PCIE_5_BCR						29
+#define GCC_PCIE_5_LINK_DOWN_BCR				30
+#define GCC_PCIE_5_NOCSR_COM_PHY_BCR				31
+#define GCC_PCIE_5_PHY_BCR					32
+#define GCC_PCIE_5_PHY_NOCSR_COM_PHY_BCR			33
+#define GCC_PCIE_6A_BCR						34
+#define GCC_PCIE_6A_LINK_DOWN_BCR				35
+#define GCC_PCIE_6A_NOCSR_COM_PHY_BCR				36
+#define GCC_PCIE_6A_PHY_BCR					37
+#define GCC_PCIE_6A_PHY_NOCSR_COM_PHY_BCR			38
+#define GCC_PCIE_6B_BCR						39
+#define GCC_PCIE_6B_LINK_DOWN_BCR				40
+#define GCC_PCIE_6B_NOCSR_COM_PHY_BCR				41
+#define GCC_PCIE_6B_PHY_BCR					42
+#define GCC_PCIE_6B_PHY_NOCSR_COM_PHY_BCR			43
+#define GCC_PCIE_PHY_BCR					44
+#define GCC_PCIE_PHY_CFG_AHB_BCR				45
+#define GCC_PCIE_PHY_COM_BCR					46
+#define GCC_PCIE_RSCC_BCR					47
+#define GCC_PDM_BCR						48
+#define GCC_QUPV3_WRAPPER_0_BCR					49
+#define GCC_QUPV3_WRAPPER_1_BCR					50
+#define GCC_QUPV3_WRAPPER_2_BCR					51
+#define GCC_QUSB2PHY_HS0_MP_BCR					52
+#define GCC_QUSB2PHY_HS1_MP_BCR					53
+#define GCC_QUSB2PHY_PRIM_BCR					54
+#define GCC_QUSB2PHY_SEC_BCR					55
+#define GCC_QUSB2PHY_TERT_BCR					56
+#define GCC_QUSB2PHY_USB20_HS_BCR				57
+#define GCC_SDCC2_BCR						58
+#define GCC_SDCC4_BCR						59
+#define GCC_UFS_PHY_BCR						60
+#define GCC_USB20_PRIM_BCR					61
+#define GCC_USB30_MP_BCR					62
+#define GCC_USB30_PRIM_BCR					63
+#define GCC_USB30_SEC_BCR					64
+#define GCC_USB30_TERT_BCR					65
+#define GCC_USB3_MP_SS0_PHY_BCR					66
+#define GCC_USB3_MP_SS1_PHY_BCR					67
+#define GCC_USB3_PHY_PRIM_BCR					68
+#define GCC_USB3_PHY_SEC_BCR					69
+#define GCC_USB3_PHY_TERT_BCR					70
+#define GCC_USB3_UNIPHY_MP0_BCR					71
+#define GCC_USB3_UNIPHY_MP1_BCR					72
+#define GCC_USB3PHY_PHY_PRIM_BCR				73
+#define GCC_USB3PHY_PHY_SEC_BCR					74
+#define GCC_USB3PHY_PHY_TERT_BCR				75
+#define GCC_USB3UNIPHY_PHY_MP0_BCR				76
+#define GCC_USB3UNIPHY_PHY_MP1_BCR				77
+#define GCC_USB4_0_BCR						78
+#define GCC_USB4_0_DP0_PHY_PRIM_BCR				79
+#define GCC_USB4_1_DP0_PHY_SEC_BCR				80
+#define GCC_USB4_2_DP0_PHY_TERT_BCR				81
+#define GCC_USB4_1_BCR						82
+#define GCC_USB4_2_BCR						83
+#define GCC_USB_0_PHY_BCR					84
+#define GCC_USB_1_PHY_BCR					85
+#define GCC_USB_2_PHY_BCR					86
+#define GCC_VIDEO_BCR						87
+#endif
-- 
2.17.1

