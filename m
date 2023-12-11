Return-Path: <linux-clk+bounces-1165-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 126E280BFF2
	for <lists+linux-clk@lfdr.de>; Mon, 11 Dec 2023 04:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C26AF280C59
	for <lists+linux-clk@lfdr.de>; Mon, 11 Dec 2023 03:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA1F168A4;
	Mon, 11 Dec 2023 03:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Np8RT4zP"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F182BE9;
	Sun, 10 Dec 2023 19:37:59 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB3QOM0019861;
	Mon, 11 Dec 2023 03:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=2cKw0rXTvX5TcnpJkF6J6clUX6uI+9JYIr/Vx+0x6yo
	=; b=Np8RT4zPPbE8PN1SQ0jjalgG04W08qv5QDo6zGx9/5AsJCBjZQzJn5JaooW
	W8Wfu+wW69FLf+5SQeiukTeW1825zK7uUGRMz5c8g8TJH1BeppJO8YngRSUVpzQM
	BH9DqVRSyzuF19whMMnh+X+aKavGhFvyHSPUWioMqGbykcTH84MgsQEkSAHw/NvH
	eto3UTiseAkwpuayx1t4aokkkdM23m0vUn+IeEcRDXYGWdejmKTDKgqWdRGFGuQz
	I789l32k9bXQoZFMVAiHhvPNke5hnfGSy6dAZP8s8FG41Ikt5AYTmDrzBrgY/gh2
	lDNRWDVpMgU9nFCEBm39tR14Iog==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uvp30a4e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 03:37:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BB3blv1012212
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 03:37:47 GMT
Received: from hu-kathirav-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 10 Dec 2023 19:37:42 -0800
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Date: Mon, 11 Dec 2023 09:07:24 +0530
Subject: [PATCH v3 2/8] clk: qcom: ipq5332: enable few nssnoc clocks in
 driver probe
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231211-ipq5332-nsscc-v3-2-ad13bef9b137@quicinc.com>
References: <20231211-ipq5332-nsscc-v3-0-ad13bef9b137@quicinc.com>
In-Reply-To: <20231211-ipq5332-nsscc-v3-0-ad13bef9b137@quicinc.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        "Kathiravan
 Thirumoorthy" <quic_kathirav@quicinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702265852; l=4381;
 i=quic_kathirav@quicinc.com; s=20230906; h=from:subject:message-id;
 bh=TeJNUOHqEVQ9ZK3Jrj8vY3kVCraoKwelk2CGbMC4Boo=;
 b=3uAbcPugCsWdcHDaZJMj0XRRIxdHluBDNDpmNgWLvij1aGtHauxSUrqWc7yWmS7s/F+jyIs7S
 MF2LFm75i8DDc3BDfQ6IpCUvR6l0w8IbJDkGe9QdJcn06vgc/rnCrDF
X-Developer-Key: i=quic_kathirav@quicinc.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RD150OaFZtCC66Ao2Fa4vAatAYHW32qX
X-Proofpoint-GUID: RD150OaFZtCC66Ao2Fa4vAatAYHW32qX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxlogscore=866 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110028

gcc_snoc_nssnoc_clk, gcc_snoc_nssnoc_1_clk, gcc_nssnoc_nsscc_clk are
enabled by default and it's RCG is properly configured by bootloader.

Some of the NSS clocks needs these clocks to be enabled. To avoid
these clocks being disabled by clock framework, drop these entries
from the clock table and enable it in the driver probe itself.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
---
 drivers/clk/qcom/gcc-ipq5332.c | 70 ++++++++----------------------------------
 1 file changed, 12 insertions(+), 58 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq5332.c b/drivers/clk/qcom/gcc-ipq5332.c
index 66d5399798fe..38a570b68813 100644
--- a/drivers/clk/qcom/gcc-ipq5332.c
+++ b/drivers/clk/qcom/gcc-ipq5332.c
@@ -1672,24 +1672,6 @@ static struct clk_branch gcc_nssnoc_atb_clk = {
 	},
 };
 
-static struct clk_branch gcc_nssnoc_nsscc_clk = {
-	.halt_reg = 0x17030,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x17030,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_nssnoc_nsscc_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_nssnoc_qosgen_ref_clk = {
 	.halt_reg = 0x1701c,
 	.halt_check = BRANCH_HALT,
@@ -2585,42 +2567,6 @@ static struct clk_branch gcc_snoc_lpass_cfg_clk = {
 	},
 };
 
-static struct clk_branch gcc_snoc_nssnoc_1_clk = {
-	.halt_reg = 0x17090,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x17090,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_snoc_nssnoc_1_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&gcc_system_noc_bfdcd_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_snoc_nssnoc_clk = {
-	.halt_reg = 0x17084,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x17084,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_snoc_nssnoc_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&gcc_system_noc_bfdcd_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_snoc_pcie3_1lane_1_m_clk = {
 	.halt_reg = 0x2e050,
 	.halt_check = BRANCH_HALT,
@@ -3330,7 +3276,6 @@ static struct clk_regmap *gcc_ipq5332_clocks[] = {
 	[GCC_NSSCC_CLK] = &gcc_nsscc_clk.clkr,
 	[GCC_NSSCFG_CLK] = &gcc_nsscfg_clk.clkr,
 	[GCC_NSSNOC_ATB_CLK] = &gcc_nssnoc_atb_clk.clkr,
-	[GCC_NSSNOC_NSSCC_CLK] = &gcc_nssnoc_nsscc_clk.clkr,
 	[GCC_NSSNOC_QOSGEN_REF_CLK] = &gcc_nssnoc_qosgen_ref_clk.clkr,
 	[GCC_NSSNOC_SNOC_1_CLK] = &gcc_nssnoc_snoc_1_clk.clkr,
 	[GCC_NSSNOC_SNOC_CLK] = &gcc_nssnoc_snoc_clk.clkr,
@@ -3398,8 +3343,6 @@ static struct clk_regmap *gcc_ipq5332_clocks[] = {
 	[GCC_SDCC1_APPS_CLK_SRC] = &gcc_sdcc1_apps_clk_src.clkr,
 	[GCC_SLEEP_CLK_SRC] = &gcc_sleep_clk_src.clkr,
 	[GCC_SNOC_LPASS_CFG_CLK] = &gcc_snoc_lpass_cfg_clk.clkr,
-	[GCC_SNOC_NSSNOC_1_CLK] = &gcc_snoc_nssnoc_1_clk.clkr,
-	[GCC_SNOC_NSSNOC_CLK] = &gcc_snoc_nssnoc_clk.clkr,
 	[GCC_SNOC_PCIE3_1LANE_1_M_CLK] = &gcc_snoc_pcie3_1lane_1_m_clk.clkr,
 	[GCC_SNOC_PCIE3_1LANE_1_S_CLK] = &gcc_snoc_pcie3_1lane_1_s_clk.clkr,
 	[GCC_SNOC_PCIE3_1LANE_M_CLK] = &gcc_snoc_pcie3_1lane_m_clk.clkr,
@@ -3660,7 +3603,18 @@ static const struct qcom_cc_desc gcc_ipq5332_desc = {
 
 static int gcc_ipq5332_probe(struct platform_device *pdev)
 {
-	return qcom_cc_probe(pdev, &gcc_ipq5332_desc);
+	struct regmap *regmap;
+
+	regmap = qcom_cc_map(pdev, &gcc_ipq5332_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/* Keep the critical clocks always-On */
+	regmap_update_bits(regmap, 0x17030, BIT(0), BIT(0)); /* gcc_nssnoc_nsscc_clk */
+	regmap_update_bits(regmap, 0x17084, BIT(0), BIT(0)); /* gcc_snoc_nssnoc_clk */
+	regmap_update_bits(regmap, 0x17090, BIT(0), BIT(0)); /* gcc_snoc_nssnoc_1_clk */
+
+	return qcom_cc_really_probe(pdev, &gcc_ipq5332_desc, regmap);
 }
 
 static const struct of_device_id gcc_ipq5332_match_table[] = {

-- 
2.34.1


