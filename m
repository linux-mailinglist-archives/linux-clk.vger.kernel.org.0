Return-Path: <linux-clk+bounces-19426-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB6DA5F1E7
	for <lists+linux-clk@lfdr.de>; Thu, 13 Mar 2025 12:06:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F165F17B4C0
	for <lists+linux-clk@lfdr.de>; Thu, 13 Mar 2025 11:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283652661A1;
	Thu, 13 Mar 2025 11:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QARWbnQl"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E06266183;
	Thu, 13 Mar 2025 11:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741863911; cv=none; b=PDmWE3Awooh27MX0a84daao87H/3ATxOzJ1NLxJefuIwfGGmc7Ums2zMGydY7xpAF8Il9IZSvaVJT+fJh0ZkK7cgEbQ3OhRl7PS8W5c8FoYzzDEdGHNu3ncXEvQPrDZd16BxAuEM4UdjvQ0Oi/C/7x1wiT1XAp0+0FkaM6dpLww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741863911; c=relaxed/simple;
	bh=dMJFJ8ec+WeVtT8oJuJ7Ogu1n6GSh1vn9s8mTcbxO4I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hvZIh2i/EZt/qpP6Pc2JFmMVgQKH4Zs5BviJ5fUtsgnVwJGEEgF6vwfTJ0jml+jGEZNLCD10FSn6VyzNL4wZP4Kw9ebkcEMtUD7xR92qieRsuHjNonOAczVeEehaivvZHXFPKpvhbStZ9xZQy18QpD3amVYSMJ4yzzTLypn4PjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QARWbnQl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D9pjwg018375;
	Thu, 13 Mar 2025 11:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0QwkjKm3e4xeycYUe5rNlzYIgj2EwKevgS+4OZCuo84=; b=QARWbnQlTOqJr4Y9
	45OIaNHUAZSSlhhMH5qmiNI/gEN4ng/+5+6MPZ9+0uhn26yoO6xr2KpLuiEwF3gN
	pmKYsRQilo6Ky6v9gqcFtJnuyTVRUfJe5i1463Om1dP7nnUqu/t8PMjDXvzzGRBO
	twnESU2xOD9eHbBXz9HTEZpSz9a5AtD1ckCqx5cfdhkBjdCPchd5Xwd0UglWjZ18
	5dafuBlKgIWrIy8EuTDHibl9Mo3X+onDjfkFXlsMc+uU4KzTFmVPLK6hBzviOztF
	ch09Sujv5aFMIQiI6d79HtaY6Kyui0+0qf179cJgpnDp+8K97WHjL7Dk9vC+RTLQ
	md0Lcw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nwn4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 11:04:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52DB4gn2009448
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 11:04:42 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Mar 2025 04:04:34 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
        <geert+renesas@glider.be>, <lumag@kernel.org>, <heiko@sntech.de>,
        <biju.das.jz@bp.renesas.com>, <quic_tdas@quicinc.com>,
        <nfraprado@collabora.com>, <elinor.montmasson@savoirfairelinux.com>,
        <ross.burton@arm.com>, <javier.carrasco@wolfvision.net>,
        <ebiggers@google.com>, <quic_anusha@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH v12 3/6] dt-bindings: clock: Add ipq9574 NSSCC clock and reset definitions
Date: Thu, 13 Mar 2025 16:33:56 +0530
Message-ID: <20250313110359.242491-4-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313110359.242491-1-quic_mmanikan@quicinc.com>
References: <20250313110359.242491-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MKiGM4lSAoTgIaFa9nnwDJgUcUENL4sJ
X-Authority-Analysis: v=2.4 cv=Q4XS452a c=1 sm=1 tr=0 ts=67d2bbcc cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=H2gZMHGF_bg0Ongu4KcA:9 a=RVmHIydaz68A:10 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: MKiGM4lSAoTgIaFa9nnwDJgUcUENL4sJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130087

From: Devi Priya <quic_devipriy@quicinc.com>

Add NSSCC clock and reset definitions for ipq9574.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V12:
	- No change.

 .../bindings/clock/qcom,ipq9574-nsscc.yaml    |  98 +++++++++++
 .../dt-bindings/clock/qcom,ipq9574-nsscc.h    | 152 ++++++++++++++++++
 .../dt-bindings/reset/qcom,ipq9574-nsscc.h    | 134 +++++++++++++++
 3 files changed, 384 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,ipq9574-nsscc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq9574-nsscc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
new file mode 100644
index 000000000000..17252b6ea3be
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,ipq9574-nsscc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ9574
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Anusha Rao <quic_anusha@quicinc.com>
+
+description: |
+  Qualcomm networking sub system clock control module provides the clocks,
+  resets on IPQ9574
+
+  See also::
+    include/dt-bindings/clock/qcom,ipq9574-nsscc.h
+    include/dt-bindings/reset/qcom,ipq9574-nsscc.h
+
+properties:
+  compatible:
+    const: qcom,ipq9574-nsscc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: CMN_PLL NSS 1200MHz (Bias PLL cc) clock source
+      - description: CMN_PLL PPE 353MHz (Bias PLL ubi nc) clock source
+      - description: GCC GPLL0 OUT AUX clock source
+      - description: Uniphy0 NSS Rx clock source
+      - description: Uniphy0 NSS Tx clock source
+      - description: Uniphy1 NSS Rx clock source
+      - description: Uniphy1 NSS Tx clock source
+      - description: Uniphy2 NSS Rx clock source
+      - description: Uniphy2 NSS Tx clock source
+      - description: GCC NSSCC clock source
+
+  '#interconnect-cells':
+    const: 1
+
+  clock-names:
+    items:
+      - const: xo
+      - const: nss_1200
+      - const: ppe_353
+      - const: gpll0_out
+      - const: uniphy0_rx
+      - const: uniphy0_tx
+      - const: uniphy1_rx
+      - const: uniphy1_tx
+      - const: uniphy2_rx
+      - const: uniphy2_tx
+      - const: bus
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
+    #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
+    clock-controller@39b00000 {
+      compatible = "qcom,ipq9574-nsscc";
+      reg = <0x39b00000 0x80000>;
+      clocks = <&xo_board_clk>,
+               <&cmn_pll NSS_1200MHZ_CLK>,
+               <&cmn_pll PPE_353MHZ_CLK>,
+               <&gcc GPLL0_OUT_AUX>,
+               <&uniphy 0>,
+               <&uniphy 1>,
+               <&uniphy 2>,
+               <&uniphy 3>,
+               <&uniphy 4>,
+               <&uniphy 5>,
+               <&gcc GCC_NSSCC_CLK>;
+      clock-names = "xo",
+                    "nss_1200",
+                    "ppe_353",
+                    "gpll0_out",
+                    "uniphy0_rx",
+                    "uniphy0_tx",
+                    "uniphy1_rx",
+                    "uniphy1_tx",
+                    "uniphy2_rx",
+                    "uniphy2_tx",
+                    "bus";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,ipq9574-nsscc.h b/include/dt-bindings/clock/qcom,ipq9574-nsscc.h
new file mode 100644
index 000000000000..21a16dc0e64c
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq9574-nsscc.h
@@ -0,0 +1,152 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, 2025 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_IPQ_NSSCC_9574_H
+#define _DT_BINDINGS_CLOCK_IPQ_NSSCC_9574_H
+
+#define NSS_CC_CE_APB_CLK					0
+#define NSS_CC_CE_AXI_CLK					1
+#define NSS_CC_CE_CLK_SRC					2
+#define NSS_CC_CFG_CLK_SRC					3
+#define NSS_CC_CLC_AXI_CLK					4
+#define NSS_CC_CLC_CLK_SRC					5
+#define NSS_CC_CRYPTO_CLK					6
+#define NSS_CC_CRYPTO_CLK_SRC					7
+#define NSS_CC_CRYPTO_PPE_CLK					8
+#define NSS_CC_HAQ_AHB_CLK					9
+#define NSS_CC_HAQ_AXI_CLK					10
+#define NSS_CC_HAQ_CLK_SRC					11
+#define NSS_CC_IMEM_AHB_CLK					12
+#define NSS_CC_IMEM_CLK_SRC					13
+#define NSS_CC_IMEM_QSB_CLK					14
+#define NSS_CC_INT_CFG_CLK_SRC					15
+#define NSS_CC_NSS_CSR_CLK					16
+#define NSS_CC_NSSNOC_CE_APB_CLK				17
+#define NSS_CC_NSSNOC_CE_AXI_CLK				18
+#define NSS_CC_NSSNOC_CLC_AXI_CLK				19
+#define NSS_CC_NSSNOC_CRYPTO_CLK				20
+#define NSS_CC_NSSNOC_HAQ_AHB_CLK				21
+#define NSS_CC_NSSNOC_HAQ_AXI_CLK				22
+#define NSS_CC_NSSNOC_IMEM_AHB_CLK				23
+#define NSS_CC_NSSNOC_IMEM_QSB_CLK				24
+#define NSS_CC_NSSNOC_NSS_CSR_CLK				25
+#define NSS_CC_NSSNOC_PPE_CFG_CLK				26
+#define NSS_CC_NSSNOC_PPE_CLK					27
+#define NSS_CC_NSSNOC_UBI32_AHB0_CLK				28
+#define NSS_CC_NSSNOC_UBI32_AXI0_CLK				29
+#define NSS_CC_NSSNOC_UBI32_INT0_AHB_CLK			30
+#define NSS_CC_NSSNOC_UBI32_NC_AXI0_1_CLK			31
+#define NSS_CC_NSSNOC_UBI32_NC_AXI0_CLK				32
+#define NSS_CC_PORT1_MAC_CLK					33
+#define NSS_CC_PORT1_RX_CLK					34
+#define NSS_CC_PORT1_RX_CLK_SRC					35
+#define NSS_CC_PORT1_RX_DIV_CLK_SRC				36
+#define NSS_CC_PORT1_TX_CLK					37
+#define NSS_CC_PORT1_TX_CLK_SRC					38
+#define NSS_CC_PORT1_TX_DIV_CLK_SRC				39
+#define NSS_CC_PORT2_MAC_CLK					40
+#define NSS_CC_PORT2_RX_CLK					41
+#define NSS_CC_PORT2_RX_CLK_SRC					42
+#define NSS_CC_PORT2_RX_DIV_CLK_SRC				43
+#define NSS_CC_PORT2_TX_CLK					44
+#define NSS_CC_PORT2_TX_CLK_SRC					45
+#define NSS_CC_PORT2_TX_DIV_CLK_SRC				46
+#define NSS_CC_PORT3_MAC_CLK					47
+#define NSS_CC_PORT3_RX_CLK					48
+#define NSS_CC_PORT3_RX_CLK_SRC					49
+#define NSS_CC_PORT3_RX_DIV_CLK_SRC				50
+#define NSS_CC_PORT3_TX_CLK					51
+#define NSS_CC_PORT3_TX_CLK_SRC					52
+#define NSS_CC_PORT3_TX_DIV_CLK_SRC				53
+#define NSS_CC_PORT4_MAC_CLK					54
+#define NSS_CC_PORT4_RX_CLK					55
+#define NSS_CC_PORT4_RX_CLK_SRC					56
+#define NSS_CC_PORT4_RX_DIV_CLK_SRC				57
+#define NSS_CC_PORT4_TX_CLK					58
+#define NSS_CC_PORT4_TX_CLK_SRC					59
+#define NSS_CC_PORT4_TX_DIV_CLK_SRC				60
+#define NSS_CC_PORT5_MAC_CLK					61
+#define NSS_CC_PORT5_RX_CLK					62
+#define NSS_CC_PORT5_RX_CLK_SRC					63
+#define NSS_CC_PORT5_RX_DIV_CLK_SRC				64
+#define NSS_CC_PORT5_TX_CLK					65
+#define NSS_CC_PORT5_TX_CLK_SRC					66
+#define NSS_CC_PORT5_TX_DIV_CLK_SRC				67
+#define NSS_CC_PORT6_MAC_CLK					68
+#define NSS_CC_PORT6_RX_CLK					69
+#define NSS_CC_PORT6_RX_CLK_SRC					70
+#define NSS_CC_PORT6_RX_DIV_CLK_SRC				71
+#define NSS_CC_PORT6_TX_CLK					72
+#define NSS_CC_PORT6_TX_CLK_SRC					73
+#define NSS_CC_PORT6_TX_DIV_CLK_SRC				74
+#define NSS_CC_PPE_CLK_SRC					75
+#define NSS_CC_PPE_EDMA_CFG_CLK					76
+#define NSS_CC_PPE_EDMA_CLK					77
+#define NSS_CC_PPE_SWITCH_BTQ_CLK				78
+#define NSS_CC_PPE_SWITCH_CFG_CLK				79
+#define NSS_CC_PPE_SWITCH_CLK					80
+#define NSS_CC_PPE_SWITCH_IPE_CLK				81
+#define NSS_CC_UBI0_CLK_SRC					82
+#define NSS_CC_UBI0_DIV_CLK_SRC					83
+#define NSS_CC_UBI1_CLK_SRC					84
+#define NSS_CC_UBI1_DIV_CLK_SRC					85
+#define NSS_CC_UBI2_CLK_SRC					86
+#define NSS_CC_UBI2_DIV_CLK_SRC					87
+#define NSS_CC_UBI32_AHB0_CLK					88
+#define NSS_CC_UBI32_AHB1_CLK					89
+#define NSS_CC_UBI32_AHB2_CLK					90
+#define NSS_CC_UBI32_AHB3_CLK					91
+#define NSS_CC_UBI32_AXI0_CLK					92
+#define NSS_CC_UBI32_AXI1_CLK					93
+#define NSS_CC_UBI32_AXI2_CLK					94
+#define NSS_CC_UBI32_AXI3_CLK					95
+#define NSS_CC_UBI32_CORE0_CLK					96
+#define NSS_CC_UBI32_CORE1_CLK					97
+#define NSS_CC_UBI32_CORE2_CLK					98
+#define NSS_CC_UBI32_CORE3_CLK					99
+#define NSS_CC_UBI32_INTR0_AHB_CLK				100
+#define NSS_CC_UBI32_INTR1_AHB_CLK				101
+#define NSS_CC_UBI32_INTR2_AHB_CLK				102
+#define NSS_CC_UBI32_INTR3_AHB_CLK				103
+#define NSS_CC_UBI32_NC_AXI0_CLK				104
+#define NSS_CC_UBI32_NC_AXI1_CLK				105
+#define NSS_CC_UBI32_NC_AXI2_CLK				106
+#define NSS_CC_UBI32_NC_AXI3_CLK				107
+#define NSS_CC_UBI32_UTCM0_CLK					108
+#define NSS_CC_UBI32_UTCM1_CLK					109
+#define NSS_CC_UBI32_UTCM2_CLK					110
+#define NSS_CC_UBI32_UTCM3_CLK					111
+#define NSS_CC_UBI3_CLK_SRC					112
+#define NSS_CC_UBI3_DIV_CLK_SRC					113
+#define NSS_CC_UBI_AXI_CLK_SRC					114
+#define NSS_CC_UBI_NC_AXI_BFDCD_CLK_SRC				115
+#define NSS_CC_UNIPHY_PORT1_RX_CLK				116
+#define NSS_CC_UNIPHY_PORT1_TX_CLK				117
+#define NSS_CC_UNIPHY_PORT2_RX_CLK				118
+#define NSS_CC_UNIPHY_PORT2_TX_CLK				119
+#define NSS_CC_UNIPHY_PORT3_RX_CLK				120
+#define NSS_CC_UNIPHY_PORT3_TX_CLK				121
+#define NSS_CC_UNIPHY_PORT4_RX_CLK				122
+#define NSS_CC_UNIPHY_PORT4_TX_CLK				123
+#define NSS_CC_UNIPHY_PORT5_RX_CLK				124
+#define NSS_CC_UNIPHY_PORT5_TX_CLK				125
+#define NSS_CC_UNIPHY_PORT6_RX_CLK				126
+#define NSS_CC_UNIPHY_PORT6_TX_CLK				127
+#define NSS_CC_XGMAC0_PTP_REF_CLK				128
+#define NSS_CC_XGMAC0_PTP_REF_DIV_CLK_SRC			129
+#define NSS_CC_XGMAC1_PTP_REF_CLK				130
+#define NSS_CC_XGMAC1_PTP_REF_DIV_CLK_SRC			131
+#define NSS_CC_XGMAC2_PTP_REF_CLK				132
+#define NSS_CC_XGMAC2_PTP_REF_DIV_CLK_SRC			133
+#define NSS_CC_XGMAC3_PTP_REF_CLK				134
+#define NSS_CC_XGMAC3_PTP_REF_DIV_CLK_SRC			135
+#define NSS_CC_XGMAC4_PTP_REF_CLK				136
+#define NSS_CC_XGMAC4_PTP_REF_DIV_CLK_SRC			137
+#define NSS_CC_XGMAC5_PTP_REF_CLK				138
+#define NSS_CC_XGMAC5_PTP_REF_DIV_CLK_SRC			139
+#define UBI32_PLL						140
+#define UBI32_PLL_MAIN						141
+
+#endif
diff --git a/include/dt-bindings/reset/qcom,ipq9574-nsscc.h b/include/dt-bindings/reset/qcom,ipq9574-nsscc.h
new file mode 100644
index 000000000000..7f152e98b99c
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,ipq9574-nsscc.h
@@ -0,0 +1,134 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, 2025 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_RESET_IPQ_NSSCC_9574_H
+#define _DT_BINDINGS_RESET_IPQ_NSSCC_9574_H
+
+#define EDMA_HW_RESET                   0
+#define NSS_CC_CE_BCR			1
+#define NSS_CC_CLC_BCR			2
+#define NSS_CC_EIP197_BCR		3
+#define NSS_CC_HAQ_BCR			4
+#define NSS_CC_IMEM_BCR			5
+#define NSS_CC_MAC_BCR			6
+#define NSS_CC_PPE_BCR			7
+#define NSS_CC_UBI_BCR			8
+#define NSS_CC_UNIPHY_BCR		9
+#define UBI3_CLKRST_CLAMP_ENABLE	10
+#define UBI3_CORE_CLAMP_ENABLE		11
+#define UBI2_CLKRST_CLAMP_ENABLE	12
+#define UBI2_CORE_CLAMP_ENABLE		13
+#define UBI1_CLKRST_CLAMP_ENABLE	14
+#define UBI1_CORE_CLAMP_ENABLE		15
+#define UBI0_CLKRST_CLAMP_ENABLE	16
+#define UBI0_CORE_CLAMP_ENABLE		17
+#define NSSNOC_NSS_CSR_ARES		18
+#define NSS_CSR_ARES			19
+#define PPE_BTQ_ARES			20
+#define PPE_IPE_ARES			21
+#define PPE_ARES			22
+#define PPE_CFG_ARES			23
+#define PPE_EDMA_ARES			24
+#define PPE_EDMA_CFG_ARES		25
+#define CRY_PPE_ARES			26
+#define NSSNOC_PPE_ARES			27
+#define NSSNOC_PPE_CFG_ARES		28
+#define PORT1_MAC_ARES			29
+#define PORT2_MAC_ARES			30
+#define PORT3_MAC_ARES			31
+#define PORT4_MAC_ARES			32
+#define PORT5_MAC_ARES			33
+#define PORT6_MAC_ARES			34
+#define XGMAC0_PTP_REF_ARES		35
+#define XGMAC1_PTP_REF_ARES		36
+#define XGMAC2_PTP_REF_ARES		37
+#define XGMAC3_PTP_REF_ARES		38
+#define XGMAC4_PTP_REF_ARES		39
+#define XGMAC5_PTP_REF_ARES		40
+#define HAQ_AHB_ARES			41
+#define HAQ_AXI_ARES			42
+#define NSSNOC_HAQ_AHB_ARES		43
+#define NSSNOC_HAQ_AXI_ARES		44
+#define CE_APB_ARES			45
+#define CE_AXI_ARES			46
+#define NSSNOC_CE_APB_ARES		47
+#define NSSNOC_CE_AXI_ARES		48
+#define CRYPTO_ARES			49
+#define NSSNOC_CRYPTO_ARES		50
+#define NSSNOC_NC_AXI0_1_ARES		51
+#define UBI0_CORE_ARES			52
+#define UBI1_CORE_ARES			53
+#define UBI2_CORE_ARES			54
+#define UBI3_CORE_ARES			55
+#define NC_AXI0_ARES			56
+#define UTCM0_ARES			57
+#define NC_AXI1_ARES			58
+#define UTCM1_ARES			59
+#define NC_AXI2_ARES			60
+#define UTCM2_ARES			61
+#define NC_AXI3_ARES			62
+#define UTCM3_ARES			63
+#define NSSNOC_NC_AXI0_ARES		64
+#define AHB0_ARES			65
+#define INTR0_AHB_ARES			66
+#define AHB1_ARES			67
+#define INTR1_AHB_ARES			68
+#define AHB2_ARES			69
+#define INTR2_AHB_ARES			70
+#define AHB3_ARES			71
+#define INTR3_AHB_ARES			72
+#define NSSNOC_AHB0_ARES		73
+#define NSSNOC_INT0_AHB_ARES		74
+#define AXI0_ARES			75
+#define AXI1_ARES			76
+#define AXI2_ARES			77
+#define AXI3_ARES			78
+#define NSSNOC_AXI0_ARES		79
+#define IMEM_QSB_ARES			80
+#define NSSNOC_IMEM_QSB_ARES		81
+#define IMEM_AHB_ARES			82
+#define NSSNOC_IMEM_AHB_ARES		83
+#define UNIPHY_PORT1_RX_ARES		84
+#define UNIPHY_PORT1_TX_ARES		85
+#define UNIPHY_PORT2_RX_ARES		86
+#define UNIPHY_PORT2_TX_ARES		87
+#define UNIPHY_PORT3_RX_ARES		88
+#define UNIPHY_PORT3_TX_ARES		89
+#define UNIPHY_PORT4_RX_ARES		90
+#define UNIPHY_PORT4_TX_ARES		91
+#define UNIPHY_PORT5_RX_ARES		92
+#define UNIPHY_PORT5_TX_ARES		93
+#define UNIPHY_PORT6_RX_ARES		94
+#define UNIPHY_PORT6_TX_ARES		95
+#define PORT1_RX_ARES			96
+#define PORT1_TX_ARES			97
+#define PORT2_RX_ARES			98
+#define PORT2_TX_ARES			99
+#define PORT3_RX_ARES			100
+#define PORT3_TX_ARES			101
+#define PORT4_RX_ARES			102
+#define PORT4_TX_ARES			103
+#define PORT5_RX_ARES			104
+#define PORT5_TX_ARES			105
+#define PORT6_RX_ARES			106
+#define PORT6_TX_ARES			107
+#define PPE_FULL_RESET			108
+#define UNIPHY0_SOFT_RESET		109
+#define UNIPHY1_SOFT_RESET		110
+#define UNIPHY2_SOFT_RESET		111
+#define UNIPHY_PORT1_ARES		112
+#define UNIPHY_PORT2_ARES		113
+#define UNIPHY_PORT3_ARES		114
+#define UNIPHY_PORT4_ARES		115
+#define UNIPHY_PORT5_ARES		116
+#define UNIPHY_PORT6_ARES		117
+#define NSSPORT1_RESET			118
+#define NSSPORT2_RESET			119
+#define NSSPORT3_RESET			120
+#define NSSPORT4_RESET			121
+#define NSSPORT5_RESET			122
+#define NSSPORT6_RESET			123
+
+#endif
-- 
2.34.1


