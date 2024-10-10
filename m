Return-Path: <linux-clk+bounces-13072-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4344999200
	for <lists+linux-clk@lfdr.de>; Thu, 10 Oct 2024 21:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE41BB2F154
	for <lists+linux-clk@lfdr.de>; Thu, 10 Oct 2024 19:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6651E1EF93C;
	Thu, 10 Oct 2024 18:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PpY242a5"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D932D1EF0A2;
	Thu, 10 Oct 2024 18:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728586779; cv=none; b=eo1xt9JeU0rnfdo/W8+lX5Z+zKLSrR9Gh4LR+fx9MKk3WIj1NoNnA/Xv7pQZJj1ug6BmE1HZg9OGN9e9f2+VeIAGKNtb2Nc3/JmvVABi0XfNMuSEZCZcbHffs5IJ0ZbLKMOhrndYwvd/P3Dx3jLR+7uN7iKP/w3iH9GtBIrWtiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728586779; c=relaxed/simple;
	bh=BXoebK9B/5jcKrWoW1Wpv0Gte6Xf/Yb7PW0QPchDH6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=me6VmipWMPH99g8p9g1kYctA3nVlJLCYj8aXelfqm4njNIrbaPxe0htPt6QOK120q+1IcCInuPBJbVVEi0k0hdqfE/6guwHyw7TZEBQYq5+SPlPCA2+6YdkBzv4p8gtA60w/8cupGkSUzUDnYlyXUCLK540xMQDu/5Bz6VpHgzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PpY242a5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AD9AsO027275;
	Thu, 10 Oct 2024 18:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8LIhOYBLALR94a6Gi0BvizrPmfcN78iNZpVjGzRALKk=; b=PpY242a57ROmE0sG
	5UNG2LMFrLeo5fWfyO66+hEgHnBF9J6NK+fu7Vg6bCMIIAQ/VMo0cUriOch1kZQx
	+HnRIElaS6Cs/QmXsFk8Jg3FAYdHQpJ0t6OCpGPDgSFrc5Et73fzHZAW4XTpQFoF
	eFCQZ8vrD7g8Tcj9zi+MlP2f0SSXRgN3AXf/527UTJS57TsNDa9GKUTldYMUo3ww
	/CpeqQ+j2debmMBCWo2LIKTYZHjE9qgUcY+qL73QgDnqbFM5ULiWA5D0mZD5IIiy
	N8jZhxNCvdHMn+OPSY9tjVLi6cl0pNMG36iWo9wsggyhNDd47lnJYlEggaM3MSR8
	CoIcTQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426fj6rwdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:59:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AIxNVQ026383
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:59:23 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 11:59:18 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 11 Oct 2024 00:28:36 +0530
Subject: [PATCH v5 6/8] clk: qcom: Add support for Display clock
 Controllers on SA8775P
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241011-sa8775p-mm-v4-resend-patches-v5-6-4a9f17dc683a@quicinc.com>
References: <20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com>
In-Reply-To: <20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <quic_imrashai@quicinc.com>,
        <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IZCqZEUAfl-5tx4he5YbEbYjtVRDL8uA
X-Proofpoint-ORIG-GUID: IZCqZEUAfl-5tx4he5YbEbYjtVRDL8uA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410100125

Add support for display0 and display1 clock controllers on SA8775P
platform.

Reviewed-by: Jagadeesh Kona <quic_jkona@quicinc.com>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/Kconfig           |   10 +
 drivers/clk/qcom/Makefile          |    1 +
 drivers/clk/qcom/dispcc0-sa8775p.c | 1481 ++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/dispcc1-sa8775p.c | 1481 ++++++++++++++++++++++++++++++++++++
 4 files changed, 2973 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 72a503168612fdf3ce28e0229b3f5670afdd81be..8aa95fc7a45781f792d1db642b47a37e7bd1eaf7 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -507,6 +507,16 @@ config SC_CAMCC_8280XP
 	  Say Y if you want to support camera devices and functionality such as
 	  capturing pictures.
 
+config SA_DISPCC_8775P
+	tristate "SA8775P Display Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select SA_GCC_8775P
+	help
+	  Support for the two display clock controllers on Qualcomm
+	  Technologies, Inc. SA8775P devices.
+	  Say Y if you want to support display devices and functionality such as
+	  splash screen.
+
 config SC_DISPCC_7180
 	tristate "SC7180 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index b4825528e2b7dc6145032d0c11976639c16e651e..fac4b9b61e55e879d8dc73f041a74043ec61aa89 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -81,6 +81,7 @@ obj-$(CONFIG_SC_DISPCC_7180) += dispcc-sc7180.o
 obj-$(CONFIG_SC_DISPCC_7280) += dispcc-sc7280.o
 obj-$(CONFIG_SC_DISPCC_8280XP) += dispcc-sc8280xp.o
 obj-$(CONFIG_SA_CAMCC_8775P) += camcc-sa8775p.o
+obj-$(CONFIG_SA_DISPCC_8775P) += dispcc0-sa8775p.o dispcc1-sa8775p.o
 obj-$(CONFIG_SA_GCC_8775P) += gcc-sa8775p.o
 obj-$(CONFIG_SA_GPUCC_8775P) += gpucc-sa8775p.o
 obj-$(CONFIG_SA_VIDEOCC_8775P) += videocc-sa8775p.o
diff --git a/drivers/clk/qcom/dispcc0-sa8775p.c b/drivers/clk/qcom/dispcc0-sa8775p.c
new file mode 100644
index 0000000000000000000000000000000000000000..6e399b5f138371e81e24500433a36e5f22d93016
--- /dev/null
+++ b/drivers/clk/qcom/dispcc0-sa8775p.c
@@ -0,0 +1,1481 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_IFACE,
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_SLEEP_CLK,
+	DT_DP0_PHY_PLL_LINK_CLK,
+	DT_DP0_PHY_PLL_VCO_DIV_CLK,
+	DT_DP1_PHY_PLL_LINK_CLK,
+	DT_DP1_PHY_PLL_VCO_DIV_CLK,
+	DT_DSI0_PHY_PLL_OUT_BYTECLK,
+	DT_DSI0_PHY_PLL_OUT_DSICLK,
+	DT_DSI1_PHY_PLL_OUT_BYTECLK,
+	DT_DSI1_PHY_PLL_OUT_DSICLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_DP0_PHY_PLL_LINK_CLK,
+	P_DP0_PHY_PLL_VCO_DIV_CLK,
+	P_DP1_PHY_PLL_LINK_CLK,
+	P_DP1_PHY_PLL_VCO_DIV_CLK,
+	P_DSI0_PHY_PLL_OUT_BYTECLK,
+	P_DSI0_PHY_PLL_OUT_DSICLK,
+	P_DSI1_PHY_PLL_OUT_BYTECLK,
+	P_DSI1_PHY_PLL_OUT_DSICLK,
+	P_MDSS_0_DISP_CC_PLL0_OUT_MAIN,
+	P_MDSS_0_DISP_CC_PLL1_OUT_EVEN,
+	P_MDSS_0_DISP_CC_PLL1_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco lucid_evo_vco[] = {
+	{ 249600000, 2020000000, 0 },
+};
+
+static const struct alpha_pll_config mdss_0_disp_cc_pll0_config = {
+	.l = 0x3a,
+	.alpha = 0x9800,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x32aa299c,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400805,
+};
+
+static struct clk_alpha_pll mdss_0_disp_cc_pll0 = {
+	.offset = 0x0,
+	.vco_table = lucid_evo_vco,
+	.num_vco = ARRAY_SIZE(lucid_evo_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct alpha_pll_config mdss_0_disp_cc_pll1_config = {
+	.l = 0x1f,
+	.alpha = 0x4000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x32aa299c,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400805,
+};
+
+static struct clk_alpha_pll mdss_0_disp_cc_pll1 = {
+	.offset = 0x1000,
+	.vco_table = lucid_evo_vco,
+	.num_vco = ARRAY_SIZE(lucid_evo_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct parent_map disp_cc_0_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP0_PHY_PLL_LINK_CLK, 1 },
+	{ P_DP0_PHY_PLL_VCO_DIV_CLK, 2 },
+	{ P_DP1_PHY_PLL_VCO_DIV_CLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP0_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP0_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP1_PHY_PLL_VCO_DIV_CLK },
+};
+
+static const struct parent_map disp_cc_0_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 3 },
+	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
+};
+
+static const struct parent_map disp_cc_0_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_2_ao[] = {
+	{ .index = DT_BI_TCXO_AO },
+};
+
+static const struct parent_map disp_cc_0_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP0_PHY_PLL_LINK_CLK, 1 },
+	{ P_DP1_PHY_PLL_LINK_CLK, 2 },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP0_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP1_PHY_PLL_LINK_CLK },
+};
+
+static const struct parent_map disp_cc_0_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
+	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
+};
+
+static const struct parent_map disp_cc_0_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_MDSS_0_DISP_CC_PLL1_OUT_MAIN, 4 },
+	{ P_MDSS_0_DISP_CC_PLL1_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &mdss_0_disp_cc_pll1.clkr.hw },
+	{ .hw = &mdss_0_disp_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map disp_cc_0_parent_map_6[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_MDSS_0_DISP_CC_PLL0_OUT_MAIN, 1 },
+	{ P_MDSS_0_DISP_CC_PLL1_OUT_MAIN, 4 },
+	{ P_MDSS_0_DISP_CC_PLL1_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_6[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &mdss_0_disp_cc_pll0.clkr.hw },
+	{ .hw = &mdss_0_disp_cc_pll1.clkr.hw },
+	{ .hw = &mdss_0_disp_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map disp_cc_0_parent_map_7[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_7[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_mdss_0_disp_cc_mdss_ahb_clk_src[] = {
+	F(37500000, P_MDSS_0_DISP_CC_PLL1_OUT_MAIN, 16, 0, 0),
+	F(75000000, P_MDSS_0_DISP_CC_PLL1_OUT_MAIN, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_ahb_clk_src = {
+	.cmd_rcgr = 0x824c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_5,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_ahb_clk_src",
+		.parent_data = disp_cc_0_parent_data_5,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_mdss_0_disp_cc_mdss_byte0_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_byte0_clk_src = {
+	.cmd_rcgr = 0x80ec,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_1,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_byte0_clk_src",
+		.parent_data = disp_cc_0_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_byte1_clk_src = {
+	.cmd_rcgr = 0x8108,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_1,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_byte1_clk_src",
+		.parent_data = disp_cc_0_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx0_aux_clk_src = {
+	.cmd_rcgr = 0x81b8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_2,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx0_aux_clk_src",
+		.parent_data = disp_cc_0_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx0_crypto_clk_src = {
+	.cmd_rcgr = 0x8170,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_3,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx0_crypto_clk_src",
+		.parent_data = disp_cc_0_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx0_link_clk_src = {
+	.cmd_rcgr = 0x8154,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_3,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx0_link_clk_src",
+		.parent_data = disp_cc_0_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx0_pixel0_clk_src = {
+	.cmd_rcgr = 0x8188,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_0,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx0_pixel0_clk_src",
+		.parent_data = disp_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx0_pixel1_clk_src = {
+	.cmd_rcgr = 0x81a0,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_0,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx0_pixel1_clk_src",
+		.parent_data = disp_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx0_pixel2_clk_src = {
+	.cmd_rcgr = 0x826c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_0,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx0_pixel2_clk_src",
+		.parent_data = disp_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx0_pixel3_clk_src = {
+	.cmd_rcgr = 0x8284,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_0,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx0_pixel3_clk_src",
+		.parent_data = disp_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx1_aux_clk_src = {
+	.cmd_rcgr = 0x8234,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_2,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx1_aux_clk_src",
+		.parent_data = disp_cc_0_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx1_crypto_clk_src = {
+	.cmd_rcgr = 0x821c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_3,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx1_crypto_clk_src",
+		.parent_data = disp_cc_0_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx1_link_clk_src = {
+	.cmd_rcgr = 0x8200,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_3,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx1_link_clk_src",
+		.parent_data = disp_cc_0_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx1_pixel0_clk_src = {
+	.cmd_rcgr = 0x81d0,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_0,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx1_pixel0_clk_src",
+		.parent_data = disp_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx1_pixel1_clk_src = {
+	.cmd_rcgr = 0x81e8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_0,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx1_pixel1_clk_src",
+		.parent_data = disp_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_esc0_clk_src = {
+	.cmd_rcgr = 0x8124,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_4,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_esc0_clk_src",
+		.parent_data = disp_cc_0_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_esc1_clk_src = {
+	.cmd_rcgr = 0x813c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_4,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_esc1_clk_src",
+		.parent_data = disp_cc_0_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_mdss_0_disp_cc_mdss_mdp_clk_src[] = {
+	F(375000000, P_MDSS_0_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(500000000, P_MDSS_0_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(575000000, P_MDSS_0_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(650000000, P_MDSS_0_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_mdp_clk_src = {
+	.cmd_rcgr = 0x80bc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_6,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_mdp_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_mdp_clk_src",
+		.parent_data = disp_cc_0_parent_data_6,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_6),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_pclk0_clk_src = {
+	.cmd_rcgr = 0x808c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_1,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_pclk0_clk_src",
+		.parent_data = disp_cc_0_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_pclk1_clk_src = {
+	.cmd_rcgr = 0x80a4,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_1,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_pclk1_clk_src",
+		.parent_data = disp_cc_0_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_vsync_clk_src = {
+	.cmd_rcgr = 0x80d4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_2,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_vsync_clk_src",
+		.parent_data = disp_cc_0_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_mdss_0_disp_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_sleep_clk_src = {
+	.cmd_rcgr = 0xc058,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_7,
+	.freq_tbl = ftbl_mdss_0_disp_cc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_sleep_clk_src",
+		.parent_data = disp_cc_0_parent_data_7,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_7),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_xo_clk_src = {
+	.cmd_rcgr = 0xc03c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_2,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_xo_clk_src",
+		.parent_data = disp_cc_0_parent_data_2_ao,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_2_ao),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_0_disp_cc_mdss_byte0_div_clk_src = {
+	.reg = 0x8104,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_byte0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_0_disp_cc_mdss_byte0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_0_disp_cc_mdss_byte1_div_clk_src = {
+	.reg = 0x8120,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_byte1_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_0_disp_cc_mdss_byte1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_0_disp_cc_mdss_dptx0_link_div_clk_src = {
+	.reg = 0x816c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx0_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_0_disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_0_disp_cc_mdss_dptx1_link_div_clk_src = {
+	.reg = 0x8218,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx1_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_0_disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_ahb1_clk = {
+	.halt_reg = 0x8088,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_ahb1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_ahb_clk = {
+	.halt_reg = 0x8084,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8084,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_byte0_clk = {
+	.halt_reg = 0x8034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_byte0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_byte0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_byte0_intf_clk = {
+	.halt_reg = 0x8038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_byte0_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_byte0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_byte1_clk = {
+	.halt_reg = 0x803c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x803c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_byte1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_byte1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_byte1_intf_clk = {
+	.halt_reg = 0x8040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_byte1_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_byte1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx0_aux_clk = {
+	.halt_reg = 0x805c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x805c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx0_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx0_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx0_crypto_clk = {
+	.halt_reg = 0x8058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx0_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx0_crypto_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx0_link_clk = {
+	.halt_reg = 0x804c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x804c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx0_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx0_link_intf_clk = {
+	.halt_reg = 0x8050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8050,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx0_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx0_pixel0_clk = {
+	.halt_reg = 0x8060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx0_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx0_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx0_pixel1_clk = {
+	.halt_reg = 0x8064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx0_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx0_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx0_pixel2_clk = {
+	.halt_reg = 0x8264,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8264,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx0_pixel2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx0_pixel2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx0_pixel3_clk = {
+	.halt_reg = 0x8268,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8268,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx0_pixel3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx0_pixel3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx0_usb_router_link_intf_clk = {
+	.halt_reg = 0x8054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx0_usb_router_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx1_aux_clk = {
+	.halt_reg = 0x8080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8080,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx1_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx1_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx1_crypto_clk = {
+	.halt_reg = 0x807c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x807c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx1_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx1_crypto_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx1_link_clk = {
+	.halt_reg = 0x8070,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx1_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx1_link_intf_clk = {
+	.halt_reg = 0x8074,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8074,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx1_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx1_pixel0_clk = {
+	.halt_reg = 0x8068,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx1_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx1_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx1_pixel1_clk = {
+	.halt_reg = 0x806c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x806c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx1_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx1_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx1_usb_router_link_intf_clk = {
+	.halt_reg = 0x8078,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8078,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx1_usb_router_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_esc0_clk = {
+	.halt_reg = 0x8044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_esc0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_esc0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_esc1_clk = {
+	.halt_reg = 0x8048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_esc1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_esc1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_mdp1_clk = {
+	.halt_reg = 0x8014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_mdp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_mdp_clk = {
+	.halt_reg = 0x800c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x800c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_mdp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_mdp_lut1_clk = {
+	.halt_reg = 0x8024,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_mdp_lut1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_mdp_lut_clk = {
+	.halt_reg = 0x801c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x801c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_mdp_lut_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_non_gdsc_ahb_clk = {
+	.halt_reg = 0xa004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xa004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_non_gdsc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_pclk0_clk = {
+	.halt_reg = 0x8004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_pclk0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_pclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_pclk1_clk = {
+	.halt_reg = 0x8008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_pclk1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_pclk1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_pll_lock_monitor_clk = {
+	.halt_reg = 0xe000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xe000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_pll_lock_monitor_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_rscc_ahb_clk = {
+	.halt_reg = 0xa00c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa00c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_rscc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_rscc_vsync_clk = {
+	.halt_reg = 0xa008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_rscc_vsync_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_vsync1_clk = {
+	.halt_reg = 0x8030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_vsync1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_vsync_clk = {
+	.halt_reg = 0x802c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x802c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_vsync_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_sm_obs_clk = {
+	.halt_reg = 0x11014,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x11014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_sm_obs_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc mdss_0_disp_cc_mdss_core_gdsc = {
+	.gdscr = 0x9000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "mdss_0_disp_cc_mdss_core_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL,
+};
+
+static struct gdsc mdss_0_disp_cc_mdss_core_int2_gdsc = {
+	.gdscr = 0xd000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "mdss_0_disp_cc_mdss_core_int2_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL,
+};
+
+static struct clk_regmap *disp_cc_0_sa8775p_clocks[] = {
+	[MDSS_DISP_CC_MDSS_AHB1_CLK] = &mdss_0_disp_cc_mdss_ahb1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_AHB_CLK] = &mdss_0_disp_cc_mdss_ahb_clk.clkr,
+	[MDSS_DISP_CC_MDSS_AHB_CLK_SRC] = &mdss_0_disp_cc_mdss_ahb_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE0_CLK] = &mdss_0_disp_cc_mdss_byte0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC] = &mdss_0_disp_cc_mdss_byte0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE0_DIV_CLK_SRC] = &mdss_0_disp_cc_mdss_byte0_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK] = &mdss_0_disp_cc_mdss_byte0_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE1_CLK] = &mdss_0_disp_cc_mdss_byte1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE1_CLK_SRC] = &mdss_0_disp_cc_mdss_byte1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE1_DIV_CLK_SRC] = &mdss_0_disp_cc_mdss_byte1_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE1_INTF_CLK] = &mdss_0_disp_cc_mdss_byte1_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK] = &mdss_0_disp_cc_mdss_dptx0_aux_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx0_aux_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_CRYPTO_CLK] = &mdss_0_disp_cc_mdss_dptx0_crypto_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_CRYPTO_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx0_crypto_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK] = &mdss_0_disp_cc_mdss_dptx0_link_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx0_link_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC] =
+	      &mdss_0_disp_cc_mdss_dptx0_link_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK] = &mdss_0_disp_cc_mdss_dptx0_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK] = &mdss_0_disp_cc_mdss_dptx0_pixel0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx0_pixel0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK] = &mdss_0_disp_cc_mdss_dptx0_pixel1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx0_pixel1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK] = &mdss_0_disp_cc_mdss_dptx0_pixel2_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx0_pixel2_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK] = &mdss_0_disp_cc_mdss_dptx0_pixel3_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx0_pixel3_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK] =
+	      &mdss_0_disp_cc_mdss_dptx0_usb_router_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK] = &mdss_0_disp_cc_mdss_dptx1_aux_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx1_aux_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_CRYPTO_CLK] = &mdss_0_disp_cc_mdss_dptx1_crypto_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_CRYPTO_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx1_crypto_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK] = &mdss_0_disp_cc_mdss_dptx1_link_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx1_link_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC] =
+	      &mdss_0_disp_cc_mdss_dptx1_link_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK] = &mdss_0_disp_cc_mdss_dptx1_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK] = &mdss_0_disp_cc_mdss_dptx1_pixel0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx1_pixel0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK] = &mdss_0_disp_cc_mdss_dptx1_pixel1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx1_pixel1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK] =
+	      &mdss_0_disp_cc_mdss_dptx1_usb_router_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_ESC0_CLK] = &mdss_0_disp_cc_mdss_esc0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_ESC0_CLK_SRC] = &mdss_0_disp_cc_mdss_esc0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_ESC1_CLK] = &mdss_0_disp_cc_mdss_esc1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_ESC1_CLK_SRC] = &mdss_0_disp_cc_mdss_esc1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_MDP1_CLK] = &mdss_0_disp_cc_mdss_mdp1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_MDP_CLK] = &mdss_0_disp_cc_mdss_mdp_clk.clkr,
+	[MDSS_DISP_CC_MDSS_MDP_CLK_SRC] = &mdss_0_disp_cc_mdss_mdp_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_MDP_LUT1_CLK] = &mdss_0_disp_cc_mdss_mdp_lut1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_MDP_LUT_CLK] = &mdss_0_disp_cc_mdss_mdp_lut_clk.clkr,
+	[MDSS_DISP_CC_MDSS_NON_GDSC_AHB_CLK] = &mdss_0_disp_cc_mdss_non_gdsc_ahb_clk.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK0_CLK] = &mdss_0_disp_cc_mdss_pclk0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC] = &mdss_0_disp_cc_mdss_pclk0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK1_CLK] = &mdss_0_disp_cc_mdss_pclk1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK1_CLK_SRC] = &mdss_0_disp_cc_mdss_pclk1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_PLL_LOCK_MONITOR_CLK] = &mdss_0_disp_cc_mdss_pll_lock_monitor_clk.clkr,
+	[MDSS_DISP_CC_MDSS_RSCC_AHB_CLK] = &mdss_0_disp_cc_mdss_rscc_ahb_clk.clkr,
+	[MDSS_DISP_CC_MDSS_RSCC_VSYNC_CLK] = &mdss_0_disp_cc_mdss_rscc_vsync_clk.clkr,
+	[MDSS_DISP_CC_MDSS_VSYNC1_CLK] = &mdss_0_disp_cc_mdss_vsync1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_VSYNC_CLK] = &mdss_0_disp_cc_mdss_vsync_clk.clkr,
+	[MDSS_DISP_CC_MDSS_VSYNC_CLK_SRC] = &mdss_0_disp_cc_mdss_vsync_clk_src.clkr,
+	[MDSS_DISP_CC_PLL0] = &mdss_0_disp_cc_pll0.clkr,
+	[MDSS_DISP_CC_PLL1] = &mdss_0_disp_cc_pll1.clkr,
+	[MDSS_DISP_CC_SLEEP_CLK_SRC] = &mdss_0_disp_cc_sleep_clk_src.clkr,
+	[MDSS_DISP_CC_SM_OBS_CLK] = &mdss_0_disp_cc_sm_obs_clk.clkr,
+	[MDSS_DISP_CC_XO_CLK_SRC] = &mdss_0_disp_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *disp_cc_0_sa8775p_gdscs[] = {
+	[MDSS_DISP_CC_MDSS_CORE_GDSC] = &mdss_0_disp_cc_mdss_core_gdsc,
+	[MDSS_DISP_CC_MDSS_CORE_INT2_GDSC] = &mdss_0_disp_cc_mdss_core_int2_gdsc,
+};
+
+static const struct qcom_reset_map disp_cc_0_sa8775p_resets[] = {
+	[MDSS_DISP_CC_MDSS_CORE_BCR] = { 0x8000 },
+	[MDSS_DISP_CC_MDSS_RSCC_BCR] = { 0xa000 },
+};
+
+static const struct regmap_config disp_cc_0_sa8775p_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x12414,
+	.fast_io = true,
+};
+
+static struct qcom_cc_desc disp_cc_0_sa8775p_desc = {
+	.config = &disp_cc_0_sa8775p_regmap_config,
+	.clks = disp_cc_0_sa8775p_clocks,
+	.num_clks = ARRAY_SIZE(disp_cc_0_sa8775p_clocks),
+	.resets = disp_cc_0_sa8775p_resets,
+	.num_resets = ARRAY_SIZE(disp_cc_0_sa8775p_resets),
+	.gdscs = disp_cc_0_sa8775p_gdscs,
+	.num_gdscs = ARRAY_SIZE(disp_cc_0_sa8775p_gdscs),
+};
+
+static const struct of_device_id disp_cc_0_sa8775p_match_table[] = {
+	{ .compatible = "qcom,sa8775p-dispcc0" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, disp_cc_0_sa8775p_match_table);
+
+static int disp_cc_0_sa8775p_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	int ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
+	regmap = qcom_cc_map(pdev, &disp_cc_0_sa8775p_desc);
+	if (IS_ERR(regmap)) {
+		pm_runtime_put(&pdev->dev);
+		return PTR_ERR(regmap);
+	}
+
+	clk_lucid_evo_pll_configure(&mdss_0_disp_cc_pll0, regmap, &mdss_0_disp_cc_pll0_config);
+	clk_lucid_evo_pll_configure(&mdss_0_disp_cc_pll1, regmap, &mdss_0_disp_cc_pll1_config);
+
+	/* Keep some clocks always enabled */
+	qcom_branch_set_clk_en(regmap, 0xc070); /* MDSS_0_DISP_CC_SLEEP_CLK */
+	qcom_branch_set_clk_en(regmap, 0xc054); /* MDSS_0_DISP_CC_XO_CLK */
+
+	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_0_sa8775p_desc, regmap);
+
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
+}
+
+static struct platform_driver disp_cc_0_sa8775p_driver = {
+	.probe = disp_cc_0_sa8775p_probe,
+	.driver = {
+		.name = "dispcc0-sa8775p",
+		.of_match_table = disp_cc_0_sa8775p_match_table,
+	},
+};
+
+module_platform_driver(disp_cc_0_sa8775p_driver);
+
+MODULE_DESCRIPTION("QTI DISPCC0 SA8775P Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/dispcc1-sa8775p.c b/drivers/clk/qcom/dispcc1-sa8775p.c
new file mode 100644
index 0000000000000000000000000000000000000000..30ccea59415a4e1df3e6eafcb1ac37dab0d50be5
--- /dev/null
+++ b/drivers/clk/qcom/dispcc1-sa8775p.c
@@ -0,0 +1,1481 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_IFACE,
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_SLEEP_CLK,
+	DT_DP0_PHY_PLL_LINK_CLK,
+	DT_DP0_PHY_PLL_VCO_DIV_CLK,
+	DT_DP1_PHY_PLL_LINK_CLK,
+	DT_DP1_PHY_PLL_VCO_DIV_CLK,
+	DT_DSI0_PHY_PLL_OUT_BYTECLK,
+	DT_DSI0_PHY_PLL_OUT_DSICLK,
+	DT_DSI1_PHY_PLL_OUT_BYTECLK,
+	DT_DSI1_PHY_PLL_OUT_DSICLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_DP0_PHY_PLL_LINK_CLK,
+	P_DP0_PHY_PLL_VCO_DIV_CLK,
+	P_DP1_PHY_PLL_LINK_CLK,
+	P_DP1_PHY_PLL_VCO_DIV_CLK,
+	P_DSI0_PHY_PLL_OUT_BYTECLK,
+	P_DSI0_PHY_PLL_OUT_DSICLK,
+	P_DSI1_PHY_PLL_OUT_BYTECLK,
+	P_DSI1_PHY_PLL_OUT_DSICLK,
+	P_MDSS_1_DISP_CC_PLL0_OUT_MAIN,
+	P_MDSS_1_DISP_CC_PLL1_OUT_EVEN,
+	P_MDSS_1_DISP_CC_PLL1_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco lucid_evo_vco[] = {
+	{ 249600000, 2020000000, 0 },
+};
+
+static const struct alpha_pll_config mdss_1_disp_cc_pll0_config = {
+	.l = 0x3a,
+	.alpha = 0x9800,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x32aa299c,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400805,
+};
+
+static struct clk_alpha_pll mdss_1_disp_cc_pll0 = {
+	.offset = 0x0,
+	.vco_table = lucid_evo_vco,
+	.num_vco = ARRAY_SIZE(lucid_evo_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct alpha_pll_config mdss_1_disp_cc_pll1_config = {
+	.l = 0x1f,
+	.alpha = 0x4000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x32aa299c,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400805,
+};
+
+static struct clk_alpha_pll mdss_1_disp_cc_pll1 = {
+	.offset = 0x1000,
+	.vco_table = lucid_evo_vco,
+	.num_vco = ARRAY_SIZE(lucid_evo_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct parent_map disp_cc_1_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP0_PHY_PLL_LINK_CLK, 1 },
+	{ P_DP0_PHY_PLL_VCO_DIV_CLK, 2 },
+	{ P_DP1_PHY_PLL_VCO_DIV_CLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP0_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP0_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP1_PHY_PLL_VCO_DIV_CLK },
+};
+
+static const struct parent_map disp_cc_1_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 3 },
+	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
+};
+
+static const struct parent_map disp_cc_1_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_2_ao[] = {
+	{ .index = DT_BI_TCXO_AO },
+};
+
+static const struct parent_map disp_cc_1_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP0_PHY_PLL_LINK_CLK, 1 },
+	{ P_DP1_PHY_PLL_LINK_CLK, 2 },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP0_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP1_PHY_PLL_LINK_CLK },
+};
+
+static const struct parent_map disp_cc_1_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
+	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
+};
+
+static const struct parent_map disp_cc_1_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_MDSS_1_DISP_CC_PLL1_OUT_MAIN, 4 },
+	{ P_MDSS_1_DISP_CC_PLL1_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &mdss_1_disp_cc_pll1.clkr.hw },
+	{ .hw = &mdss_1_disp_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map disp_cc_1_parent_map_6[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_MDSS_1_DISP_CC_PLL0_OUT_MAIN, 1 },
+	{ P_MDSS_1_DISP_CC_PLL1_OUT_MAIN, 4 },
+	{ P_MDSS_1_DISP_CC_PLL1_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_6[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &mdss_1_disp_cc_pll0.clkr.hw },
+	{ .hw = &mdss_1_disp_cc_pll1.clkr.hw },
+	{ .hw = &mdss_1_disp_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map disp_cc_1_parent_map_7[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_7_ao[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_mdss_1_disp_cc_mdss_ahb_clk_src[] = {
+	F(37500000, P_MDSS_1_DISP_CC_PLL1_OUT_MAIN, 16, 0, 0),
+	F(75000000, P_MDSS_1_DISP_CC_PLL1_OUT_MAIN, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_ahb_clk_src = {
+	.cmd_rcgr = 0x824c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_5,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_ahb_clk_src",
+		.parent_data = disp_cc_1_parent_data_5,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_mdss_1_disp_cc_mdss_byte0_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_byte0_clk_src = {
+	.cmd_rcgr = 0x80ec,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_1,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_byte0_clk_src",
+		.parent_data = disp_cc_1_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_byte1_clk_src = {
+	.cmd_rcgr = 0x8108,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_1,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_byte1_clk_src",
+		.parent_data = disp_cc_1_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx0_aux_clk_src = {
+	.cmd_rcgr = 0x81b8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_2,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx0_aux_clk_src",
+		.parent_data = disp_cc_1_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx0_crypto_clk_src = {
+	.cmd_rcgr = 0x8170,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_3,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx0_crypto_clk_src",
+		.parent_data = disp_cc_1_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx0_link_clk_src = {
+	.cmd_rcgr = 0x8154,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_3,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx0_link_clk_src",
+		.parent_data = disp_cc_1_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx0_pixel0_clk_src = {
+	.cmd_rcgr = 0x8188,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_0,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx0_pixel0_clk_src",
+		.parent_data = disp_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx0_pixel1_clk_src = {
+	.cmd_rcgr = 0x81a0,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_0,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx0_pixel1_clk_src",
+		.parent_data = disp_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx0_pixel2_clk_src = {
+	.cmd_rcgr = 0x826c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_0,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx0_pixel2_clk_src",
+		.parent_data = disp_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx0_pixel3_clk_src = {
+	.cmd_rcgr = 0x8284,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_0,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx0_pixel3_clk_src",
+		.parent_data = disp_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx1_aux_clk_src = {
+	.cmd_rcgr = 0x8234,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_2,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx1_aux_clk_src",
+		.parent_data = disp_cc_1_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx1_crypto_clk_src = {
+	.cmd_rcgr = 0x821c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_3,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx1_crypto_clk_src",
+		.parent_data = disp_cc_1_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx1_link_clk_src = {
+	.cmd_rcgr = 0x8200,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_3,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx1_link_clk_src",
+		.parent_data = disp_cc_1_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx1_pixel0_clk_src = {
+	.cmd_rcgr = 0x81d0,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_0,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx1_pixel0_clk_src",
+		.parent_data = disp_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx1_pixel1_clk_src = {
+	.cmd_rcgr = 0x81e8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_0,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx1_pixel1_clk_src",
+		.parent_data = disp_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_esc0_clk_src = {
+	.cmd_rcgr = 0x8124,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_4,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_esc0_clk_src",
+		.parent_data = disp_cc_1_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_esc1_clk_src = {
+	.cmd_rcgr = 0x813c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_4,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_esc1_clk_src",
+		.parent_data = disp_cc_1_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_mdss_1_disp_cc_mdss_mdp_clk_src[] = {
+	F(375000000, P_MDSS_1_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(500000000, P_MDSS_1_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(575000000, P_MDSS_1_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(650000000, P_MDSS_1_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_mdp_clk_src = {
+	.cmd_rcgr = 0x80bc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_6,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_mdp_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_mdp_clk_src",
+		.parent_data = disp_cc_1_parent_data_6,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_6),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_pclk0_clk_src = {
+	.cmd_rcgr = 0x808c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_1,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_pclk0_clk_src",
+		.parent_data = disp_cc_1_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_pclk1_clk_src = {
+	.cmd_rcgr = 0x80a4,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_1,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_pclk1_clk_src",
+		.parent_data = disp_cc_1_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_vsync_clk_src = {
+	.cmd_rcgr = 0x80d4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_2,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_vsync_clk_src",
+		.parent_data = disp_cc_1_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_mdss_1_disp_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_sleep_clk_src = {
+	.cmd_rcgr = 0xc058,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_7,
+	.freq_tbl = ftbl_mdss_1_disp_cc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_sleep_clk_src",
+		.parent_data = disp_cc_1_parent_data_7_ao,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_7_ao),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_xo_clk_src = {
+	.cmd_rcgr = 0xc03c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_2,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_xo_clk_src",
+		.parent_data = disp_cc_1_parent_data_2_ao,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_2_ao),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_1_disp_cc_mdss_byte0_div_clk_src = {
+	.reg = 0x8104,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_byte0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_1_disp_cc_mdss_byte0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_1_disp_cc_mdss_byte1_div_clk_src = {
+	.reg = 0x8120,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_byte1_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_1_disp_cc_mdss_byte1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_1_disp_cc_mdss_dptx0_link_div_clk_src = {
+	.reg = 0x816c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx0_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_1_disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_1_disp_cc_mdss_dptx1_link_div_clk_src = {
+	.reg = 0x8218,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx1_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_1_disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_ahb1_clk = {
+	.halt_reg = 0x8088,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_ahb1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_ahb_clk = {
+	.halt_reg = 0x8084,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8084,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_byte0_clk = {
+	.halt_reg = 0x8034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_byte0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_byte0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_byte0_intf_clk = {
+	.halt_reg = 0x8038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_byte0_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_byte0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_byte1_clk = {
+	.halt_reg = 0x803c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x803c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_byte1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_byte1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_byte1_intf_clk = {
+	.halt_reg = 0x8040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_byte1_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_byte1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx0_aux_clk = {
+	.halt_reg = 0x805c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x805c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx0_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx0_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx0_crypto_clk = {
+	.halt_reg = 0x8058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx0_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx0_crypto_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx0_link_clk = {
+	.halt_reg = 0x804c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x804c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx0_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx0_link_intf_clk = {
+	.halt_reg = 0x8050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8050,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx0_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx0_pixel0_clk = {
+	.halt_reg = 0x8060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx0_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx0_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx0_pixel1_clk = {
+	.halt_reg = 0x8064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx0_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx0_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx0_pixel2_clk = {
+	.halt_reg = 0x8264,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8264,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx0_pixel2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx0_pixel2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx0_pixel3_clk = {
+	.halt_reg = 0x8268,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8268,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx0_pixel3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx0_pixel3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx0_usb_router_link_intf_clk = {
+	.halt_reg = 0x8054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx0_usb_router_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx1_aux_clk = {
+	.halt_reg = 0x8080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8080,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx1_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx1_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx1_crypto_clk = {
+	.halt_reg = 0x807c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x807c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx1_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx1_crypto_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx1_link_clk = {
+	.halt_reg = 0x8070,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx1_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx1_link_intf_clk = {
+	.halt_reg = 0x8074,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8074,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx1_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx1_pixel0_clk = {
+	.halt_reg = 0x8068,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx1_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx1_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx1_pixel1_clk = {
+	.halt_reg = 0x806c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x806c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx1_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx1_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx1_usb_router_link_intf_clk = {
+	.halt_reg = 0x8078,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8078,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx1_usb_router_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_esc0_clk = {
+	.halt_reg = 0x8044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_esc0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_esc0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_esc1_clk = {
+	.halt_reg = 0x8048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_esc1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_esc1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_mdp1_clk = {
+	.halt_reg = 0x8014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_mdp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_mdp_clk = {
+	.halt_reg = 0x800c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x800c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_mdp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_mdp_lut1_clk = {
+	.halt_reg = 0x8024,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_mdp_lut1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_mdp_lut_clk = {
+	.halt_reg = 0x801c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x801c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_mdp_lut_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_non_gdsc_ahb_clk = {
+	.halt_reg = 0xa004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xa004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_non_gdsc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_pclk0_clk = {
+	.halt_reg = 0x8004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_pclk0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_pclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_pclk1_clk = {
+	.halt_reg = 0x8008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_pclk1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_pclk1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_pll_lock_monitor_clk = {
+	.halt_reg = 0xe000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xe000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_pll_lock_monitor_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_rscc_ahb_clk = {
+	.halt_reg = 0xa00c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa00c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_rscc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_rscc_vsync_clk = {
+	.halt_reg = 0xa008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_rscc_vsync_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_vsync1_clk = {
+	.halt_reg = 0x8030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_vsync1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_vsync_clk = {
+	.halt_reg = 0x802c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x802c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_vsync_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_sm_obs_clk = {
+	.halt_reg = 0x11014,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x11014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_sm_obs_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc mdss_1_disp_cc_mdss_core_gdsc = {
+	.gdscr = 0x9000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "mdss_1_disp_cc_mdss_core_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL,
+};
+
+static struct gdsc mdss_1_disp_cc_mdss_core_int2_gdsc = {
+	.gdscr = 0xd000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "mdss_1_disp_cc_mdss_core_int2_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL,
+};
+
+static struct clk_regmap *disp_cc_1_sa8775p_clocks[] = {
+	[MDSS_DISP_CC_MDSS_AHB1_CLK] = &mdss_1_disp_cc_mdss_ahb1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_AHB_CLK] = &mdss_1_disp_cc_mdss_ahb_clk.clkr,
+	[MDSS_DISP_CC_MDSS_AHB_CLK_SRC] = &mdss_1_disp_cc_mdss_ahb_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE0_CLK] = &mdss_1_disp_cc_mdss_byte0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC] = &mdss_1_disp_cc_mdss_byte0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE0_DIV_CLK_SRC] = &mdss_1_disp_cc_mdss_byte0_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK] = &mdss_1_disp_cc_mdss_byte0_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE1_CLK] = &mdss_1_disp_cc_mdss_byte1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE1_CLK_SRC] = &mdss_1_disp_cc_mdss_byte1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE1_DIV_CLK_SRC] = &mdss_1_disp_cc_mdss_byte1_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE1_INTF_CLK] = &mdss_1_disp_cc_mdss_byte1_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK] = &mdss_1_disp_cc_mdss_dptx0_aux_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx0_aux_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_CRYPTO_CLK] = &mdss_1_disp_cc_mdss_dptx0_crypto_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_CRYPTO_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx0_crypto_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK] = &mdss_1_disp_cc_mdss_dptx0_link_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx0_link_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC] =
+	      &mdss_1_disp_cc_mdss_dptx0_link_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK] = &mdss_1_disp_cc_mdss_dptx0_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK] = &mdss_1_disp_cc_mdss_dptx0_pixel0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx0_pixel0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK] = &mdss_1_disp_cc_mdss_dptx0_pixel1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx0_pixel1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK] = &mdss_1_disp_cc_mdss_dptx0_pixel2_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx0_pixel2_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK] = &mdss_1_disp_cc_mdss_dptx0_pixel3_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx0_pixel3_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK] =
+	      &mdss_1_disp_cc_mdss_dptx0_usb_router_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK] = &mdss_1_disp_cc_mdss_dptx1_aux_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx1_aux_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_CRYPTO_CLK] = &mdss_1_disp_cc_mdss_dptx1_crypto_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_CRYPTO_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx1_crypto_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK] = &mdss_1_disp_cc_mdss_dptx1_link_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx1_link_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC] =
+	      &mdss_1_disp_cc_mdss_dptx1_link_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK] = &mdss_1_disp_cc_mdss_dptx1_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK] = &mdss_1_disp_cc_mdss_dptx1_pixel0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx1_pixel0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK] = &mdss_1_disp_cc_mdss_dptx1_pixel1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx1_pixel1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK] =
+	      &mdss_1_disp_cc_mdss_dptx1_usb_router_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_ESC0_CLK] = &mdss_1_disp_cc_mdss_esc0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_ESC0_CLK_SRC] = &mdss_1_disp_cc_mdss_esc0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_ESC1_CLK] = &mdss_1_disp_cc_mdss_esc1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_ESC1_CLK_SRC] = &mdss_1_disp_cc_mdss_esc1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_MDP1_CLK] = &mdss_1_disp_cc_mdss_mdp1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_MDP_CLK] = &mdss_1_disp_cc_mdss_mdp_clk.clkr,
+	[MDSS_DISP_CC_MDSS_MDP_CLK_SRC] = &mdss_1_disp_cc_mdss_mdp_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_MDP_LUT1_CLK] = &mdss_1_disp_cc_mdss_mdp_lut1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_MDP_LUT_CLK] = &mdss_1_disp_cc_mdss_mdp_lut_clk.clkr,
+	[MDSS_DISP_CC_MDSS_NON_GDSC_AHB_CLK] = &mdss_1_disp_cc_mdss_non_gdsc_ahb_clk.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK0_CLK] = &mdss_1_disp_cc_mdss_pclk0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC] = &mdss_1_disp_cc_mdss_pclk0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK1_CLK] = &mdss_1_disp_cc_mdss_pclk1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK1_CLK_SRC] = &mdss_1_disp_cc_mdss_pclk1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_PLL_LOCK_MONITOR_CLK] = &mdss_1_disp_cc_mdss_pll_lock_monitor_clk.clkr,
+	[MDSS_DISP_CC_MDSS_RSCC_AHB_CLK] = &mdss_1_disp_cc_mdss_rscc_ahb_clk.clkr,
+	[MDSS_DISP_CC_MDSS_RSCC_VSYNC_CLK] = &mdss_1_disp_cc_mdss_rscc_vsync_clk.clkr,
+	[MDSS_DISP_CC_MDSS_VSYNC1_CLK] = &mdss_1_disp_cc_mdss_vsync1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_VSYNC_CLK] = &mdss_1_disp_cc_mdss_vsync_clk.clkr,
+	[MDSS_DISP_CC_MDSS_VSYNC_CLK_SRC] = &mdss_1_disp_cc_mdss_vsync_clk_src.clkr,
+	[MDSS_DISP_CC_PLL0] = &mdss_1_disp_cc_pll0.clkr,
+	[MDSS_DISP_CC_PLL1] = &mdss_1_disp_cc_pll1.clkr,
+	[MDSS_DISP_CC_SLEEP_CLK_SRC] = &mdss_1_disp_cc_sleep_clk_src.clkr,
+	[MDSS_DISP_CC_SM_OBS_CLK] = &mdss_1_disp_cc_sm_obs_clk.clkr,
+	[MDSS_DISP_CC_XO_CLK_SRC] = &mdss_1_disp_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *disp_cc_1_sa8775p_gdscs[] = {
+	[MDSS_DISP_CC_MDSS_CORE_GDSC] = &mdss_1_disp_cc_mdss_core_gdsc,
+	[MDSS_DISP_CC_MDSS_CORE_INT2_GDSC] = &mdss_1_disp_cc_mdss_core_int2_gdsc,
+};
+
+static const struct qcom_reset_map disp_cc_1_sa8775p_resets[] = {
+	[MDSS_DISP_CC_MDSS_CORE_BCR] = { 0x8000 },
+	[MDSS_DISP_CC_MDSS_RSCC_BCR] = { 0xa000 },
+};
+
+static const struct regmap_config disp_cc_1_sa8775p_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x12414,
+	.fast_io = true,
+};
+
+static struct qcom_cc_desc disp_cc_1_sa8775p_desc = {
+	.config = &disp_cc_1_sa8775p_regmap_config,
+	.clks = disp_cc_1_sa8775p_clocks,
+	.num_clks = ARRAY_SIZE(disp_cc_1_sa8775p_clocks),
+	.resets = disp_cc_1_sa8775p_resets,
+	.num_resets = ARRAY_SIZE(disp_cc_1_sa8775p_resets),
+	.gdscs = disp_cc_1_sa8775p_gdscs,
+	.num_gdscs = ARRAY_SIZE(disp_cc_1_sa8775p_gdscs),
+};
+
+static const struct of_device_id disp_cc_1_sa8775p_match_table[] = {
+	{ .compatible = "qcom,sa8775p-dispcc1" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, disp_cc_1_sa8775p_match_table);
+
+static int disp_cc_1_sa8775p_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	int ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
+	regmap = qcom_cc_map(pdev, &disp_cc_1_sa8775p_desc);
+	if (IS_ERR(regmap)) {
+		pm_runtime_put(&pdev->dev);
+		return PTR_ERR(regmap);
+	}
+
+	clk_lucid_evo_pll_configure(&mdss_1_disp_cc_pll0, regmap, &mdss_1_disp_cc_pll0_config);
+	clk_lucid_evo_pll_configure(&mdss_1_disp_cc_pll1, regmap, &mdss_1_disp_cc_pll1_config);
+
+	/* Keep some clocks always enabled */
+	qcom_branch_set_clk_en(regmap, 0xc070); /* MDSS_1_DISP_CC_SLEEP_CLK */
+	qcom_branch_set_clk_en(regmap, 0xc054); /* MDSS_1_DISP_CC_XO_CLK */
+
+	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_1_sa8775p_desc, regmap);
+
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
+}
+
+static struct platform_driver disp_cc_1_sa8775p_driver = {
+	.probe = disp_cc_1_sa8775p_probe,
+	.driver = {
+		.name = "dispcc1-sa8775p",
+		.of_match_table = disp_cc_1_sa8775p_match_table,
+	},
+};
+
+module_platform_driver(disp_cc_1_sa8775p_driver);
+
+MODULE_DESCRIPTION("QTI DISPCC1 SA8775P Driver");
+MODULE_LICENSE("GPL");

-- 
2.45.2


