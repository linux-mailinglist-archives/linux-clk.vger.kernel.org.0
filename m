Return-Path: <linux-clk+bounces-10900-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF14957CF6
	for <lists+linux-clk@lfdr.de>; Tue, 20 Aug 2024 07:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A766B282C92
	for <lists+linux-clk@lfdr.de>; Tue, 20 Aug 2024 05:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C8E14B971;
	Tue, 20 Aug 2024 05:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DQyfhZpm"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ED71474B7;
	Tue, 20 Aug 2024 05:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724133409; cv=none; b=cNrNtnUGMOPpIrRRm6gO3TQ3+JUZD2pAyEHB594ypNKS4pBWGCsaUhJCdtszPw3Q9rDjDPlzrncRuiZFfCtZxhPseebvYkl7qaKexOKdOU7s/A/BQ8gaEJO8cABuO8HanpAtPZnvCz2tX9AR2tfdnrOcwkIy9/s57cTPqta9vTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724133409; c=relaxed/simple;
	bh=JNWA2yw2OEkJEoP54VpctwewdGOndo2iiIXgpgOX+NY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RITY4k9c5iVmSHdckLUk7jxfSpPr8CJE1Dp8VfPoxGHE3BE9nX+dp9HsDihuwmkG5W97yMsE5y7oDSivhY3EEAE4c2BKTnLbU9zn/AUpKuhDp8y4FetW7RAm1b9Fbx62RixkMiC47GyUFUNha+RkPZAoP610Ab6pkNjQsyuezDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DQyfhZpm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K2Bivn011258;
	Tue, 20 Aug 2024 05:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fyRztf4XTQz5kklnLmDsSmaT8v93ZtPIRzfE41mb7iM=; b=DQyfhZpmC1nZKOLH
	/HqM3I1wou9G64XPf2op4fhTiu0E66okqh8S6XnT2d/QlWJhUSOnBDKyDjlerPKW
	rDc0tFKRexb9Duv39rR5znszdlZSX68YfpGq4lEPIx0EPkLnN/lozS7qiwZgjsAb
	/xtbxPSzcFLdrsM4cLeGj5hQFsx8dqsbPpk61XafcqIFHyCVAH5gumtKPCqMWe2s
	Yfg4ufVaBkxLJp+D5MGAMkw0UBmnCTyNmMJzPXe0U7zD5r5sFSPe5CW2fmYrm+2j
	lpldZ1s28vZF2ExQlYKKUJNFPavtTS57n1cVV83qOTLTZ2qCopu8WF2XVD4aHKVy
	A61qFA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414j570ejq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 05:56:43 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47K5ugdF025541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 05:56:42 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 22:56:39 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <andersson@kernel.org>, <sboyd@kernel.org>, <konradybcio@kernel.org>,
        <krzk+dt@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH V7 2/5] clk: qcom: ipq9574: remove q6 bring up clocks
Date: Tue, 20 Aug 2024 11:26:15 +0530
Message-ID: <20240820055618.267554-3-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820055618.267554-1-quic_gokulsri@quicinc.com>
References: <20240820055618.267554-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: d9vGkLhI9Zvh27AlUO6-YkY220594pOe
X-Proofpoint-GUID: d9vGkLhI9Zvh27AlUO6-YkY220594pOe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200044

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Q6 firmware takes care of bringup clocks, so remove them from gcc driver.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
Changes in v7:
	- No changes.
	- Rebased on top of linux-next

Changes in v6:
	- Rebased on linux-next.

Changes in v5:
	- Rebased on linux-next.

Changes in v4:
	- In V3 series this patch is [04/11]. Here it's moved to [03/11]
	  because to compile dt-bindings patches.

Changes in v3:
	- Rebased on linux-next.

 drivers/clk/qcom/gcc-ipq9574.c | 326 ---------------------------------
 1 file changed, 326 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq9574.c b/drivers/clk/qcom/gcc-ipq9574.c
index 80fc94d705a0..ae8af4e7a003 100644
--- a/drivers/clk/qcom/gcc-ipq9574.c
+++ b/drivers/clk/qcom/gcc-ipq9574.c
@@ -2645,24 +2645,6 @@ static struct clk_rcg2 system_noc_bfdcd_clk_src = {
 	},
 };
 
-static struct clk_branch gcc_q6ss_boot_clk = {
-	.halt_reg = 0x25080,
-	.halt_check = BRANCH_HALT_SKIP,
-	.clkr = {
-		.enable_reg = 0x25080,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_q6ss_boot_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&system_noc_bfdcd_clk_src.clkr.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_nssnoc_snoc_clk = {
 	.halt_reg = 0x17028,
 	.clkr = {
@@ -2733,91 +2715,6 @@ static struct clk_rcg2 wcss_ahb_clk_src = {
 	},
 };
 
-static struct clk_branch gcc_q6_ahb_clk = {
-	.halt_reg = 0x25014,
-	.clkr = {
-		.enable_reg = 0x25014,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_q6_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&wcss_ahb_clk_src.clkr.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_q6_ahb_s_clk = {
-	.halt_reg = 0x25018,
-	.clkr = {
-		.enable_reg = 0x25018,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_q6_ahb_s_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&wcss_ahb_clk_src.clkr.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_wcss_ecahb_clk = {
-	.halt_reg = 0x25058,
-	.clkr = {
-		.enable_reg = 0x25058,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_wcss_ecahb_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&wcss_ahb_clk_src.clkr.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_wcss_acmt_clk = {
-	.halt_reg = 0x2505c,
-	.clkr = {
-		.enable_reg = 0x2505c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_wcss_acmt_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&wcss_ahb_clk_src.clkr.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_sys_noc_wcss_ahb_clk = {
-	.halt_reg = 0x2e030,
-	.clkr = {
-		.enable_reg = 0x2e030,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_sys_noc_wcss_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&wcss_ahb_clk_src.clkr.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static const struct freq_tbl ftbl_wcss_axi_m_clk_src[] = {
 	F(24000000, P_XO, 1, 0, 0),
 	F(133333333, P_GPLL0, 6, 0, 0),
@@ -2838,23 +2735,6 @@ static struct clk_rcg2 wcss_axi_m_clk_src = {
 	},
 };
 
-static struct clk_branch gcc_anoc_wcss_axi_m_clk = {
-	.halt_reg = 0x2e0a8,
-	.clkr = {
-		.enable_reg = 0x2e0a8,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_anoc_wcss_axi_m_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&wcss_axi_m_clk_src.clkr.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static const struct freq_tbl ftbl_qdss_at_clk_src[] = {
 	F(240000000, P_GPLL4, 5, 0, 0),
 	{ }
@@ -2873,40 +2753,6 @@ static struct clk_rcg2 qdss_at_clk_src = {
 	},
 };
 
-static struct clk_branch gcc_q6ss_atbm_clk = {
-	.halt_reg = 0x2501c,
-	.clkr = {
-		.enable_reg = 0x2501c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_q6ss_atbm_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&qdss_at_clk_src.clkr.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_wcss_dbg_ifc_atb_clk = {
-	.halt_reg = 0x2503c,
-	.clkr = {
-		.enable_reg = 0x2503c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_wcss_dbg_ifc_atb_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&qdss_at_clk_src.clkr.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_nssnoc_atb_clk = {
 	.halt_reg = 0x17014,
 	.clkr = {
@@ -3143,40 +2989,6 @@ static struct clk_fixed_factor qdss_tsctr_div2_clk_src = {
 	},
 };
 
-static struct clk_branch gcc_q6_tsctr_1to2_clk = {
-	.halt_reg = 0x25020,
-	.clkr = {
-		.enable_reg = 0x25020,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_q6_tsctr_1to2_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&qdss_tsctr_div2_clk_src.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_wcss_dbg_ifc_nts_clk = {
-	.halt_reg = 0x25040,
-	.clkr = {
-		.enable_reg = 0x25040,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_wcss_dbg_ifc_nts_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&qdss_tsctr_div2_clk_src.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_qdss_tsctr_div2_clk = {
 	.halt_reg = 0x2d044,
 	.clkr = {
@@ -3351,74 +3163,6 @@ static struct clk_branch gcc_qdss_tsctr_div16_clk = {
 	},
 };
 
-static struct clk_branch gcc_q6ss_pclkdbg_clk = {
-	.halt_reg = 0x25024,
-	.clkr = {
-		.enable_reg = 0x25024,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_q6ss_pclkdbg_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&qdss_dap_sync_clk_src.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_q6ss_trig_clk = {
-	.halt_reg = 0x25068,
-	.clkr = {
-		.enable_reg = 0x25068,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_q6ss_trig_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&qdss_dap_sync_clk_src.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_wcss_dbg_ifc_apb_clk = {
-	.halt_reg = 0x25038,
-	.clkr = {
-		.enable_reg = 0x25038,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_wcss_dbg_ifc_apb_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&qdss_dap_sync_clk_src.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_wcss_dbg_ifc_dapbus_clk = {
-	.halt_reg = 0x25044,
-	.clkr = {
-		.enable_reg = 0x25044,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_wcss_dbg_ifc_dapbus_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&qdss_dap_sync_clk_src.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_qdss_dap_clk = {
 	.halt_reg = 0x2d058,
 	.clkr = {
@@ -3540,58 +3284,6 @@ static struct clk_rcg2 q6_axi_clk_src = {
 	},
 };
 
-static struct clk_branch gcc_q6_axim_clk = {
-	.halt_reg = 0x2500c,
-	.clkr = {
-		.enable_reg = 0x2500c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_q6_axim_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&q6_axi_clk_src.clkr.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_wcss_q6_tbu_clk = {
-	.halt_reg = 0x12050,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0xb00c,
-		.enable_mask = BIT(6),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_wcss_q6_tbu_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&q6_axi_clk_src.clkr.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_mem_noc_q6_axi_clk = {
-	.halt_reg = 0x19010,
-	.clkr = {
-		.enable_reg = 0x19010,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_mem_noc_q6_axi_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&q6_axi_clk_src.clkr.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static const struct freq_tbl ftbl_q6_axim2_clk_src[] = {
 	F(342857143, P_GPLL4, 3.5, 0, 0),
 	{ }
@@ -4141,16 +3833,8 @@ static struct clk_regmap *gcc_ipq9574_clks[] = {
 	[GCC_NSSNOC_SNOC_1_CLK] = &gcc_nssnoc_snoc_1_clk.clkr,
 	[GCC_QDSS_ETR_USB_CLK] = &gcc_qdss_etr_usb_clk.clkr,
 	[WCSS_AHB_CLK_SRC] = &wcss_ahb_clk_src.clkr,
-	[GCC_Q6_AHB_CLK] = &gcc_q6_ahb_clk.clkr,
-	[GCC_Q6_AHB_S_CLK] = &gcc_q6_ahb_s_clk.clkr,
-	[GCC_WCSS_ECAHB_CLK] = &gcc_wcss_ecahb_clk.clkr,
-	[GCC_WCSS_ACMT_CLK] = &gcc_wcss_acmt_clk.clkr,
-	[GCC_SYS_NOC_WCSS_AHB_CLK] = &gcc_sys_noc_wcss_ahb_clk.clkr,
 	[WCSS_AXI_M_CLK_SRC] = &wcss_axi_m_clk_src.clkr,
-	[GCC_ANOC_WCSS_AXI_M_CLK] = &gcc_anoc_wcss_axi_m_clk.clkr,
 	[QDSS_AT_CLK_SRC] = &qdss_at_clk_src.clkr,
-	[GCC_Q6SS_ATBM_CLK] = &gcc_q6ss_atbm_clk.clkr,
-	[GCC_WCSS_DBG_IFC_ATB_CLK] = &gcc_wcss_dbg_ifc_atb_clk.clkr,
 	[GCC_NSSNOC_ATB_CLK] = &gcc_nssnoc_atb_clk.clkr,
 	[GCC_QDSS_AT_CLK] = &gcc_qdss_at_clk.clkr,
 	[GCC_SYS_NOC_AT_CLK] = &gcc_sys_noc_at_clk.clkr,
@@ -4163,27 +3847,18 @@ static struct clk_regmap *gcc_ipq9574_clks[] = {
 	[QDSS_TRACECLKIN_CLK_SRC] = &qdss_traceclkin_clk_src.clkr,
 	[GCC_QDSS_TRACECLKIN_CLK] = &gcc_qdss_traceclkin_clk.clkr,
 	[QDSS_TSCTR_CLK_SRC] = &qdss_tsctr_clk_src.clkr,
-	[GCC_Q6_TSCTR_1TO2_CLK] = &gcc_q6_tsctr_1to2_clk.clkr,
-	[GCC_WCSS_DBG_IFC_NTS_CLK] = &gcc_wcss_dbg_ifc_nts_clk.clkr,
 	[GCC_QDSS_TSCTR_DIV2_CLK] = &gcc_qdss_tsctr_div2_clk.clkr,
 	[GCC_QDSS_TS_CLK] = &gcc_qdss_ts_clk.clkr,
 	[GCC_QDSS_TSCTR_DIV4_CLK] = &gcc_qdss_tsctr_div4_clk.clkr,
 	[GCC_NSS_TS_CLK] = &gcc_nss_ts_clk.clkr,
 	[GCC_QDSS_TSCTR_DIV8_CLK] = &gcc_qdss_tsctr_div8_clk.clkr,
 	[GCC_QDSS_TSCTR_DIV16_CLK] = &gcc_qdss_tsctr_div16_clk.clkr,
-	[GCC_Q6SS_PCLKDBG_CLK] = &gcc_q6ss_pclkdbg_clk.clkr,
-	[GCC_Q6SS_TRIG_CLK] = &gcc_q6ss_trig_clk.clkr,
-	[GCC_WCSS_DBG_IFC_APB_CLK] = &gcc_wcss_dbg_ifc_apb_clk.clkr,
-	[GCC_WCSS_DBG_IFC_DAPBUS_CLK] = &gcc_wcss_dbg_ifc_dapbus_clk.clkr,
 	[GCC_QDSS_DAP_CLK] = &gcc_qdss_dap_clk.clkr,
 	[GCC_QDSS_APB2JTAG_CLK] = &gcc_qdss_apb2jtag_clk.clkr,
 	[GCC_QDSS_TSCTR_DIV3_CLK] = &gcc_qdss_tsctr_div3_clk.clkr,
 	[QPIC_IO_MACRO_CLK_SRC] = &qpic_io_macro_clk_src.clkr,
 	[GCC_QPIC_IO_MACRO_CLK] = &gcc_qpic_io_macro_clk.clkr,
 	[Q6_AXI_CLK_SRC] = &q6_axi_clk_src.clkr,
-	[GCC_Q6_AXIM_CLK] = &gcc_q6_axim_clk.clkr,
-	[GCC_WCSS_Q6_TBU_CLK] = &gcc_wcss_q6_tbu_clk.clkr,
-	[GCC_MEM_NOC_Q6_AXI_CLK] = &gcc_mem_noc_q6_axi_clk.clkr,
 	[Q6_AXIM2_CLK_SRC] = &q6_axim2_clk_src.clkr,
 	[NSSNOC_MEMNOC_BFDCD_CLK_SRC] = &nssnoc_memnoc_bfdcd_clk_src.clkr,
 	[GCC_NSSNOC_MEMNOC_CLK] = &gcc_nssnoc_memnoc_clk.clkr,
@@ -4207,7 +3882,6 @@ static struct clk_regmap *gcc_ipq9574_clks[] = {
 	[GCC_UNIPHY1_SYS_CLK] = &gcc_uniphy1_sys_clk.clkr,
 	[GCC_UNIPHY2_SYS_CLK] = &gcc_uniphy2_sys_clk.clkr,
 	[GCC_CMN_12GPLL_SYS_CLK] = &gcc_cmn_12gpll_sys_clk.clkr,
-	[GCC_Q6SS_BOOT_CLK] = &gcc_q6ss_boot_clk.clkr,
 	[UNIPHY_SYS_CLK_SRC] = &uniphy_sys_clk_src.clkr,
 	[NSS_TS_CLK_SRC] = &nss_ts_clk_src.clkr,
 	[GCC_ANOC_PCIE0_1LANE_M_CLK] = &gcc_anoc_pcie0_1lane_m_clk.clkr,
-- 
2.34.1


