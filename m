Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97F2B57B51D
	for <lists+linux-clk@lfdr.de>; Wed, 20 Jul 2022 13:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbiGTLMY (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 20 Jul 2022 07:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiGTLMX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jul 2022 07:12:23 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD8F550EA;
        Wed, 20 Jul 2022 04:12:22 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26KAnWoo004348;
        Wed, 20 Jul 2022 11:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=lhEGzYLPp/chQMj3lrjrzc+uTjOMzRX001mk38drLt8=;
 b=Zyb4sR+G7ENEdskRHWq86sGOMCMSPwPBGuX4+9p0R2JlGzRo03PyF+lUSzB8dE2x9Vjo
 zdmLRgM1mV8/TbLFLPCRdamuZB4AhVhSIY7XKVJgLhpscvmo8/D6Pvcm8Htvnb8UBZe8
 kAdEeNjFKSjRKEazL3Wtwn3Bhzn3O7qfUWiS4noRmN2vgHUE8e6swVmaH/viiEpUehnF
 eWhhOrPq+l7DWSdWZgLmYD3NEi4L6ni47H3DstLVyRivjz5/s1K4LGuMQ1/V+Xr+UsT9
 Ld4yzROFc/imKdUgmOthSXpfLBKSez45FSWuUJlW+3Zk6/V+YfGS+hEd49XVtpbbz3jc /Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3heb3x0vy6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Jul 2022 11:12:19 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.47.97.222])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 26KB4F2k002233
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Jul 2022 11:04:15 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 04:04:15 -0700
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 04:04:11 -0700
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-soc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <robh@kernel.org>,
        <robh+dt@kernel.org>, <quic_tdas@quicinc.com>,
        <quic_c_skakit@quicinc.com>
Subject: [PATCH V6 1/5] dt-bindings: clock: Add "qcom,adsp-pil-mode" property
Date:   Wed, 20 Jul 2022 16:33:39 +0530
Message-ID: <1658315023-3336-2-git-send-email-quic_c_skakit@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1658315023-3336-1-git-send-email-quic_c_skakit@quicinc.com>
References: <1658315023-3336-1-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SWDiau57X1B38KO_WvUAjgLOOVM5dAjK
X-Proofpoint-ORIG-GUID: SWDiau57X1B38KO_WvUAjgLOOVM5dAjK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_05,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207200046
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The LPASS Peripheral loader clocks would be used to bring
LPASS out of reset, when this property is present.

This is a cleanup done to handle overlap of regmap of
lpasscc and lpass_aon blocks. As a part of this, remove
the "cc" regmap from lpasscc node.

Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml   | 6 ++----
 .../devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml         | 7 +++++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml
index 47028d7..633887d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml
@@ -36,13 +36,11 @@ properties:
     items:
       - description: LPASS qdsp6ss register
       - description: LPASS top-cc register
-      - description: LPASS cc register
 
   reg-names:
     items:
       - const: qdsp6ss
       - const: top_cc
-      - const: cc
 
 required:
   - compatible
@@ -59,8 +57,8 @@ examples:
     #include <dt-bindings/clock/qcom,lpass-sc7280.h>
     clock-controller@3000000 {
       compatible = "qcom,sc7280-lpasscc";
-      reg = <0x03000000 0x40>, <0x03c04000 0x4>, <0x03389000 0x24>;
-      reg-names = "qdsp6ss", "top_cc", "cc";
+      reg = <0x03000000 0x40>, <0x03c04000 0x4>;
+      reg-names = "qdsp6ss", "top_cc";
       clocks = <&gcc GCC_CFG_NOC_LPASS_CLK>;
       clock-names = "iface";
       #clock-cells = <1>;
diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
index bad9135..5ccfb24 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
@@ -41,6 +41,12 @@ properties:
   reg:
     maxItems: 1
 
+  qcom,adsp-pil-mode:
+    description:
+      Indicates if the LPASS would be brought out of reset using
+      peripheral loader.
+    type: boolean
+
 required:
   - compatible
   - reg
@@ -165,6 +171,7 @@ examples:
       clocks = <&rpmhcc RPMH_CXO_CLK>, <&rpmhcc RPMH_CXO_CLK_A>,
                <&lpasscore LPASS_CORE_CC_CORE_CLK>;
       clock-names = "bi_tcxo", "bi_tcxo_ao","iface";
+      qcom,adsp-pil-mode;
       #clock-cells = <1>;
       #power-domain-cells = <1>;
     };
-- 
2.7.4

