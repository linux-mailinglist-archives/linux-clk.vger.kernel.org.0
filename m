Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B31779FC90
	for <lists+linux-clk@lfdr.de>; Thu, 14 Sep 2023 09:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233244AbjINHBY (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 14 Sep 2023 03:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235990AbjINHBT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Sep 2023 03:01:19 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 643CCCE5;
        Thu, 14 Sep 2023 00:01:14 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38E6kYP1028472;
        Thu, 14 Sep 2023 07:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=cIekoNZEBqcV+2+/WUQX5RoEjtkal88v8Lj7vPwgbFk=;
 b=HpYXDqBwCUkPKnEXEqopSiQccWAPcLC2UWjri0E0b7GvXF8i/YA29mYhMEfxshyIEifs
 nsl0JbIhHBZNQ17XleZ6u+iSDbktLlbwcUncoz6tKbxwp4l1ZGLCAQSwsU8NrLjq0uI8
 clyZT47xY/s2iciqZ9uxrbYCkW81daDM3yEtssmtiv8jN/ccqjrXbCuOV7IoMGqDiapE
 AGxZuRWX4I+DGJJnLzuTs16bpwf5dYVlmVNtg9FsN4dM9kfBiqBbnLQWwsEsgb/snKZD
 0SB/VIhOnp4/6gV1EGdNOZ1dP/DCX6PWA2jiuh77ivTGRAIFPyHCy6tf2MatOUny0fCQ Dw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t3re30kmw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 14 Sep 2023 07:01:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38E718UZ017943
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 14 Sep 2023 07:01:08 GMT
Received: from hu-kathirav-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Thu, 14 Sep 2023 00:01:03 -0700
From:   Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Date:   Thu, 14 Sep 2023 12:29:59 +0530
Subject: [PATCH v2 09/11] arm64: dts: qcom: ipq6018: include the GPLL0 as
 clock provider for mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230913-gpll_cleanup-v2-9-c8ceb1a37680@quicinc.com>
References: <20230913-gpll_cleanup-v2-0-c8ceb1a37680@quicinc.com>
In-Reply-To: <20230913-gpll_cleanup-v2-0-c8ceb1a37680@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Sricharan Ramabadhran" <quic_srichara@quicinc.com>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Kathiravan Thirumoorthy" <quic_kathirav@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694674810; l=1226;
 i=quic_kathirav@quicinc.com; s=20230906; h=from:subject:message-id;
 bh=0V7ycfieCR7gyMd8CbT+YHreQwaCQ4y1HnsMb/C1JmE=;
 b=F+6GRbFKbSfTRkzD2VAF21Y90M9zygGTvB1ZSbRelL94mZYJc6kHmMZ+d7N8+Q8dpwoODc3al
 vcEz3YbAgexCkjRm43ATwFQ5gVUSSwLOsHokpcEV3s1lgC+DdcL5B2Z
X-Developer-Key: i=quic_kathirav@quicinc.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ixyj2jpdkEpsGemlz3W6YzrpR5cAORsn
X-Proofpoint-ORIG-GUID: ixyj2jpdkEpsGemlz3W6YzrpR5cAORsn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_03,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=845
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=2 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309140062
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

While the kernel is booting up, APSS PLL will be running at 800MHz with
GPLL0 as source. Once the cpufreq driver is available, APSS PLL will be
configured to the rate based on the opp table and the source also will
be changed to APSS_PLL_EARLY. So allow the mailbox to consume the GPLL0,
with this inclusion, CPU Freq correctly reports that CPU is running at
800MHz rather than 24MHz.

Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
---
Changes in V2:
	- Splitted the change into target specific file
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 47b8b1d6730a..a30a5b893762 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -619,8 +619,8 @@ apcs_glb: mailbox@b111000 {
 			compatible = "qcom,ipq6018-apcs-apps-global";
 			reg = <0x0 0x0b111000 0x0 0x1000>;
 			#clock-cells = <1>;
-			clocks = <&a53pll>, <&xo>;
-			clock-names = "pll", "xo";
+			clocks = <&a53pll>, <&xo>, <&gcc GPLL0>;
+			clock-names = "pll", "xo", "gpll0";
 			#mbox-cells = <1>;
 		};
 

-- 
2.34.1

