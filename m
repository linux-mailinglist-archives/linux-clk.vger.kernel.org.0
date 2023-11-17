Return-Path: <linux-clk+bounces-276-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8587EEED0
	for <lists+linux-clk@lfdr.de>; Fri, 17 Nov 2023 10:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B64091C20A32
	for <lists+linux-clk@lfdr.de>; Fri, 17 Nov 2023 09:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335F814F62;
	Fri, 17 Nov 2023 09:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pFxot3H/"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71DFEC4;
	Fri, 17 Nov 2023 01:38:35 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH8h2G5009158;
	Fri, 17 Nov 2023 09:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=AMbbiu9sNr2NWbbmpOhk/Q3RiJu55M9uGg3d6nn2ijk=;
 b=pFxot3H/RmFIQ0TNv4Ozkyk2xe99mVfiYPZNpV2xKp4O0fa+lzHtZ8iTMJMB55YYJb35
 9+6SzrcRRQmSuTxaX9X2vWopgMBUeQ6Z3iD4FGn39ghT4zCAkf4bN9J/TJkLaTwo3Ur+
 LJnCtkJXCIrn9Pamx7UZa9+oR6n/vTo9KC8ZjUhItsm3Krny0nxnF0aewznqtKH7JcJq
 ALxSHf88Iiv8KuyVcfJRu9QZTm1Xwi+LzsjpomChKZ68ZvT2tsO749MIAqh7cP/H1EQS
 gRQc7uBEMESh/HFkSysFvR/WX4WDxBckfDvdL4AXToXXPVVMR8rBFJ0AXHbEL3ur3s6Z bQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udms92aww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 09:38:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AH9cTMR028066
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 09:38:30 GMT
Received: from blr-ubuntu-87.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 17 Nov 2023 01:28:23 -0800
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <agross@kernel.org>, <conor+dt@kernel.org>, <quic_tdas@quicinc.com>,
        <quic_rjendra@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <neil.armstrong@linaro.org>,
        <abel.vesa@linaro.org>, <quic_tsoni@quicinc.com>,
        Sibi Sankar
	<quic_sibis@quicinc.com>
Subject: [PATCH V2 4/4] clk: qcom: rpmh: Add support for X1E80100 rpmh clocks
Date: Fri, 17 Nov 2023 14:57:37 +0530
Message-ID: <20231117092737.28362-5-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231117092737.28362-1-quic_sibis@quicinc.com>
References: <20231117092737.28362-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VVTv3h6XDhFy7KsJyNUPqVPdSfoBGXAy
X-Proofpoint-ORIG-GUID: VVTv3h6XDhFy7KsJyNUPqVPdSfoBGXAy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_07,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170070

From: Rajendra Nayak <quic_rjendra@quicinc.com>

Adds the RPMH clocks present in X1E80100 SoC

Co-developed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---

v2:
* Update the part number from sc8380xp to x1e80100.
* Pick-up Rbs from the list.

 drivers/clk/qcom/clk-rpmh.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 5d853fd43294..ce6f4363d2f7 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -372,6 +372,9 @@ DEFINE_CLK_RPMH_VRM(clk3, _a1, "clka3", 1);
 DEFINE_CLK_RPMH_VRM(clk4, _a1, "clka4", 1);
 DEFINE_CLK_RPMH_VRM(clk5, _a1, "clka5", 1);
 
+DEFINE_CLK_RPMH_VRM(clk3, _a2, "clka3", 2);
+DEFINE_CLK_RPMH_VRM(clk4, _a2, "clka4", 2);
+DEFINE_CLK_RPMH_VRM(clk5, _a2, "clka5", 2);
 DEFINE_CLK_RPMH_VRM(clk6, _a2, "clka6", 2);
 DEFINE_CLK_RPMH_VRM(clk7, _a2, "clka7", 2);
 DEFINE_CLK_RPMH_VRM(clk8, _a2, "clka8", 2);
@@ -737,6 +740,28 @@ static const struct clk_rpmh_desc clk_rpmh_sm4450 = {
 	.num_clks = ARRAY_SIZE(sm4450_rpmh_clocks),
 };
 
+static struct clk_hw *x1e80100_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a2_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a2.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_ao.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_x1e80100 = {
+	.clks = x1e80100_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(x1e80100_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -838,6 +863,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sm8450-rpmh-clk", .data = &clk_rpmh_sm8450},
 	{ .compatible = "qcom,sm8550-rpmh-clk", .data = &clk_rpmh_sm8550},
 	{ .compatible = "qcom,sc7280-rpmh-clk", .data = &clk_rpmh_sc7280},
+	{ .compatible = "qcom,x1e80100-rpmh-clk", .data = &clk_rpmh_x1e80100},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, clk_rpmh_match_table);
-- 
2.17.1


