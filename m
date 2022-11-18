Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 486CC62FC55
	for <lists+linux-clk@lfdr.de>; Fri, 18 Nov 2022 19:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242583AbiKRSSr (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 18 Nov 2022 13:18:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242567AbiKRSSp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Nov 2022 13:18:45 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8F67209F;
        Fri, 18 Nov 2022 10:18:42 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIHuBK7003653;
        Fri, 18 Nov 2022 18:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=o1t9GjHGlESeAzokSbeDFTWvlADd30KotBntvKCevno=;
 b=hvnV1QR+xG1+FF+N1VG5i9sJ/R9b56XKgTfS7AmzLqW1DHlebJTgJx6L/ilFpvIjNqdH
 1V+BeSgvx29T4GO4v7bdOOLn3kKYwCPF8LijGqUJIZzlcVwUhUUWIipFDBNYB264hTCO
 EWkp6fP/JbJhWMHjBP5YaX3aUNQiWbJfYWG+cEqBGYnJbmz3yw4zrj4kf9djtNR9RtCL
 M4UOag6e+cOq3FNd6avzo5OG5+VCe40XgoxONOxN1lXUCd8AuHrfXOBH/48d8T4PuaDl
 hR9IWa8sucVEYlYPMjMXMOubxAhAM/u/+sROO3XVqETAMi5ztybnqfVlAb61RsxrTFxY ZQ== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kx0u7swds-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Nov 2022 18:18:38 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AIIIbEj005583
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Nov 2022 18:18:37 GMT
Received: from hu-molvera-sd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 18 Nov 2022 10:18:37 -0800
From:   Melody Olvera <quic_molvera@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Taniya Das <quic_tdas@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH v4 1/2] dt-bindings: clock: Add QDU1000 and QRU1000 GCC clocks
Date:   Fri, 18 Nov 2022 10:18:25 -0800
Message-ID: <20221118181826.28269-2-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118181826.28269-1-quic_molvera@quicinc.com>
References: <20221118181826.28269-1-quic_molvera@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OTRBhs2xyBmz5tlbgTfDBmfjQ7pQyOPR
X-Proofpoint-ORIG-GUID: OTRBhs2xyBmz5tlbgTfDBmfjQ7pQyOPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_06,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180108
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device tree bindings for global clock controller on QDU1000 and
QRU1000 SoCs.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 .../bindings/clock/qcom,gcc-qdu1000.yaml      |  70 ++++++++
 include/dt-bindings/clock/qcom,gcc-qdu1000.h  | 170 ++++++++++++++++++
 2 files changed, 240 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-qdu1000.yaml
 create mode 100644 include/dt-bindings/clock/qcom,gcc-qdu1000.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-qdu1000.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-qdu1000.yaml
new file mode 100644
index 000000000000..90935a6795ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-qdu1000.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-qdu1000.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller for QDU1000 and QRU1000
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+maintainers:
+  - Melody Olvera <quic_molvera@quicinc.com>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on QDU1000 and QRU1000
+
+  See also:
+  - include/dt-bindings/clock/qcom,gcc-qdu1000.h
+
+properties:
+  compatible:
+    items:
+      - const: qcom,gcc-qdu1000
+      - const: syscon
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: PCIE 0 Pipe clock source
+      - description: PCIE 0 Phy Auxiliary clock source
+      - description: USB3 Phy wrapper pipe clock source
+    minItems: 2
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
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@100000 {
+      compatible = "qcom,gcc-qdu1000", "syscon";
+      reg = <0x00100000 0x001f4200>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>,
+               <&pcie_0_pipe_clk>, <&pcie_0_phy_aux_clk>,
+               <&usb3_phy_wrapper_pipe_clk>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/qcom,gcc-qdu1000.h b/include/dt-bindings/clock/qcom,gcc-qdu1000.h
new file mode 100644
index 000000000000..99edb688fef2
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-qdu1000.h
@@ -0,0 +1,170 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_QDU1000_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_QDU1000_H
+
+/* GCC clocks */
+#define GCC_GPLL0					0
+#define GCC_GPLL0_OUT_EVEN				1
+#define GCC_GPLL1					2
+#define GCC_GPLL2					3
+#define GCC_GPLL2_OUT_EVEN				4
+#define GCC_GPLL3					5
+#define GCC_GPLL4					6
+#define GCC_GPLL5					7
+#define GCC_GPLL5_OUT_EVEN				8
+#define GCC_GPLL6					9
+#define GCC_GPLL7					10
+#define GCC_GPLL8					11
+#define GCC_AGGRE_NOC_ECPRI_DMA_CLK			12
+#define GCC_AGGRE_NOC_ECPRI_DMA_CLK_SRC			13
+#define GCC_AGGRE_NOC_ECPRI_GSI_CLK_SRC			14
+#define GCC_BOOT_ROM_AHB_CLK				15
+#define GCC_CFG_NOC_ECPRI_CC_AHB_CLK			16
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK			17
+#define GCC_DDRSS_ECPRI_DMA_CLK				18
+#define GCC_ECPRI_AHB_CLK				19
+#define GCC_ECPRI_CC_GPLL0_CLK_SRC			20
+#define GCC_ECPRI_CC_GPLL1_EVEN_CLK_SRC			21
+#define GCC_ECPRI_CC_GPLL2_EVEN_CLK_SRC			22
+#define GCC_ECPRI_CC_GPLL3_CLK_SRC			23
+#define GCC_ECPRI_CC_GPLL4_CLK_SRC			24
+#define GCC_ECPRI_CC_GPLL5_EVEN_CLK_SRC			25
+#define GCC_ECPRI_XO_CLK				26
+#define GCC_ETH_DBG_SNOC_AXI_CLK			27
+#define GCC_GEMNOC_PCIE_QX_CLK				28
+#define GCC_GP1_CLK					29
+#define GCC_GP1_CLK_SRC					30
+#define GCC_GP2_CLK					31
+#define GCC_GP2_CLK_SRC					32
+#define GCC_GP3_CLK					33
+#define GCC_GP3_CLK_SRC					34
+#define GCC_PCIE_0_AUX_CLK				35
+#define GCC_PCIE_0_AUX_CLK_SRC				36
+#define GCC_PCIE_0_CFG_AHB_CLK				37
+#define GCC_PCIE_0_CLKREF_EN				38
+#define GCC_PCIE_0_MSTR_AXI_CLK				39
+#define GCC_PCIE_0_PHY_AUX_CLK				40
+#define GCC_PCIE_0_PHY_RCHNG_CLK			41
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC			42
+#define GCC_PCIE_0_PIPE_CLK				43
+#define GCC_PCIE_0_SLV_AXI_CLK				44
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK			45
+#define GCC_PDM2_CLK					46
+#define GCC_PDM2_CLK_SRC				47
+#define GCC_PDM_AHB_CLK					48
+#define GCC_PDM_XO4_CLK					49
+#define GCC_QMIP_ANOC_PCIE_CLK				50
+#define GCC_QMIP_ECPRI_DMA0_CLK				51
+#define GCC_QMIP_ECPRI_DMA1_CLK				52
+#define GCC_QMIP_ECPRI_GSI_CLK				53
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK			54
+#define GCC_QUPV3_WRAP0_CORE_CLK			55
+#define GCC_QUPV3_WRAP0_S0_CLK				56
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC			57
+#define GCC_QUPV3_WRAP0_S1_CLK				58
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC			59
+#define GCC_QUPV3_WRAP0_S2_CLK				60
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC			61
+#define GCC_QUPV3_WRAP0_S3_CLK				62
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC			63
+#define GCC_QUPV3_WRAP0_S4_CLK				64
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC			65
+#define GCC_QUPV3_WRAP0_S5_CLK				66
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC			67
+#define GCC_QUPV3_WRAP0_S6_CLK				68
+#define GCC_QUPV3_WRAP0_S6_CLK_SRC			69
+#define GCC_QUPV3_WRAP0_S7_CLK				70
+#define GCC_QUPV3_WRAP0_S7_CLK_SRC			71
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK			72
+#define GCC_QUPV3_WRAP1_CORE_CLK			73
+#define GCC_QUPV3_WRAP1_S0_CLK				74
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC			75
+#define GCC_QUPV3_WRAP1_S1_CLK				76
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC			77
+#define GCC_QUPV3_WRAP1_S2_CLK				78
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC			79
+#define GCC_QUPV3_WRAP1_S3_CLK				80
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC			81
+#define GCC_QUPV3_WRAP1_S4_CLK				82
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC			83
+#define GCC_QUPV3_WRAP1_S5_CLK				84
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC			85
+#define GCC_QUPV3_WRAP1_S6_CLK				86
+#define GCC_QUPV3_WRAP1_S6_CLK_SRC			87
+#define GCC_QUPV3_WRAP1_S7_CLK				88
+#define GCC_QUPV3_WRAP1_S7_CLK_SRC			89
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK			90
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK			91
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK			92
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK			93
+#define GCC_SDCC5_AHB_CLK				94
+#define GCC_SDCC5_APPS_CLK				95
+#define GCC_SDCC5_APPS_CLK_SRC				96
+#define GCC_SDCC5_ICE_CORE_CLK				97
+#define GCC_SDCC5_ICE_CORE_CLK_SRC			98
+#define GCC_SNOC_CNOC_GEMNOC_PCIE_QX_CLK		99
+#define GCC_SNOC_CNOC_GEMNOC_PCIE_SOUTH_QX_CLK		100
+#define GCC_SNOC_CNOC_PCIE_QX_CLK			101
+#define GCC_SNOC_PCIE_SF_CENTER_QX_CLK			102
+#define GCC_SNOC_PCIE_SF_SOUTH_QX_CLK			103
+#define GCC_TSC_CFG_AHB_CLK				104
+#define GCC_TSC_CLK_SRC					105
+#define GCC_TSC_CNTR_CLK				106
+#define GCC_TSC_ETU_CLK					107
+#define GCC_USB2_CLKREF_EN				108
+#define GCC_USB30_PRIM_MASTER_CLK			109
+#define GCC_USB30_PRIM_MASTER_CLK_SRC			110
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK			111
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC		112
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC	113
+#define GCC_USB30_PRIM_SLEEP_CLK			114
+#define GCC_USB3_PRIM_PHY_AUX_CLK			115
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC			116
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK			117
+#define GCC_USB3_PRIM_PHY_PIPE_CLK			118
+#define GCC_SM_BUS_AHB_CLK				119
+#define GCC_SM_BUS_XO_CLK				120
+#define GCC_SM_BUS_XO_CLK_SRC				121
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC			122
+#define GCC_ETH_100G_C2C_HM_APB_CLK			123
+#define GCC_ETH_100G_FH_HM_APB_0_CLK			124
+#define GCC_ETH_100G_FH_HM_APB_1_CLK			125
+#define GCC_ETH_100G_FH_HM_APB_2_CLK			126
+#define GCC_ETH_DBG_C2C_HM_APB_CLK			127
+#define GCC_AGGRE_NOC_ECPRI_GSI_CLK			128
+#define GCC_PCIE_0_PIPE_CLK_SRC				129
+#define GCC_PCIE_0_PHY_AUX_CLK_SRC			130
+
+/* GCC resets */
+#define GCC_ECPRI_CC_BCR				0
+#define GCC_ECPRI_SS_BCR				1
+#define GCC_ETH_WRAPPER_BCR				2
+#define GCC_PCIE_0_BCR					3
+#define GCC_PCIE_0_LINK_DOWN_BCR			4
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR			5
+#define GCC_PCIE_0_PHY_BCR				6
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR		7
+#define GCC_PCIE_PHY_CFG_AHB_BCR			8
+#define GCC_PCIE_PHY_COM_BCR				9
+#define GCC_PDM_BCR					10
+#define GCC_QUPV3_WRAPPER_0_BCR				11
+#define GCC_QUPV3_WRAPPER_1_BCR				12
+#define GCC_QUSB2PHY_PRIM_BCR				13
+#define GCC_QUSB2PHY_SEC_BCR				14
+#define GCC_SDCC5_BCR					15
+#define GCC_TCSR_PCIE_BCR				16
+#define GCC_TSC_BCR					17
+#define GCC_USB30_PRIM_BCR				18
+#define GCC_USB3_DP_PHY_PRIM_BCR			19
+#define GCC_USB3_DP_PHY_SEC_BCR				20
+#define GCC_USB3_PHY_PRIM_BCR				21
+#define GCC_USB3_PHY_SEC_BCR				22
+#define GCC_USB3PHY_PHY_PRIM_BCR			23
+#define GCC_USB3PHY_PHY_SEC_BCR				24
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR			25
+
+#endif
-- 
2.38.1

