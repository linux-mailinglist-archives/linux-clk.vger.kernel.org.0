Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2C56E3EF1
	for <lists+linux-clk@lfdr.de>; Mon, 17 Apr 2023 07:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjDQFes (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 17 Apr 2023 01:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbjDQFep (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Apr 2023 01:34:45 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 282D9358E;
        Sun, 16 Apr 2023 22:34:42 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33H4ivXw031614;
        Mon, 17 Apr 2023 05:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=i6Was/67Lxb0xisdXTD6NDAvgjnWAeWd25RLPdV+T5A=;
 b=AGUhvYSpmiZ6zolhtH9nf/j4BMBQWmobGXgfZJq/y3slD4bdk9uyy3kGtHRKCGsPx7qf
 R25Yfi0jc9Ba7qvUSwpFO0NMiIAbQr5o/c8epojQsWzqkD8k7ZRt5RZJV5pgkvjMc8j3
 Z2pSAHCSXIhCR/Yp5INPeCttyoyXNt81JsAHE6UqE8ItJJG09GQK0tXzuk0Rq2UTH9ai
 85wWsG4MJZ/IIAY0p6DW5vicEu0ES1A/oRpc0Se4J4/+vz1r3jKhAHGkIHLvKtSm5Pm1
 kIXai4YVn7IVzDng3Kzt48r7YC1Fsu4wGjLb3yzqCF/s+ZRkIEAYcteEAj8z7qPs7XDz rw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pyn2x2k4w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Apr 2023 05:34:38 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33H5YbN1001486
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Apr 2023 05:34:37 GMT
Received: from devipriy-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Sun, 16 Apr 2023 22:34:31 -0700
From:   Devi Priya <quic_devipriy@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC:     <quic_srichara@quicinc.com>, <quic_sjaganat@quicinc.com>,
        <quic_kathirav@quicinc.com>, <quic_arajkuma@quicinc.com>,
        <quic_anusha@quicinc.com>, <quic_poovendh@quicinc.com>
Subject: [PATCH V2 3/4] arm64: dts: qcom: ipq9574: Drop bias_pll_ubi_nc_clk & update intc node
Date:   Mon, 17 Apr 2023 11:03:54 +0530
Message-ID: <20230417053355.25691-4-quic_devipriy@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230417053355.25691-1-quic_devipriy@quicinc.com>
References: <20230417053355.25691-1-quic_devipriy@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2ZVQy5cWBdo_hmz77tTVlv-kEjc2OwW5
X-Proofpoint-ORIG-GUID: 2ZVQy5cWBdo_hmz77tTVlv-kEjc2OwW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_02,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=880
 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170050
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop the unused backup source bias_pll_ubi_nc_clk.
Also, update the size of GICC and GICV region to 8kB and add target CPU
encoding.

Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 3bb7435f5e7f..f1f959b43180 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -16,12 +16,6 @@
 	#size-cells = <2>;
 
 	clocks {
-		bias_pll_ubi_nc_clk: bias-pll-ubi-nc-clk {
-			compatible = "fixed-clock";
-			clock-frequency = <353000000>;
-			#clock-cells = <0>;
-		};
-
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -131,7 +125,6 @@
 			reg = <0x01800000 0x80000>;
 			clocks = <&xo_board_clk>,
 				 <&sleep_clk>,
-				 <&bias_pll_ubi_nc_clk>,
 				 <0>,
 				 <0>,
 				 <0>,
@@ -172,14 +165,14 @@
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			reg = <0x0b000000 0x1000>,  /* GICD */
-			      <0x0b002000 0x1000>,  /* GICC */
+			      <0x0b002000 0x2000>,  /* GICC */
 			      <0x0b001000 0x1000>,  /* GICH */
-			      <0x0b004000 0x1000>;  /* GICV */
+			      <0x0b004000 0x2000>;  /* GICV */
 			#address-cells = <1>;
 			#size-cells = <1>;
 			interrupt-controller;
 			#interrupt-cells = <3>;
-			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 			ranges = <0 0x0b00c000 0x3000>;
 
 			v2m0: v2m@0 {
-- 
2.17.1

