Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B18916F56B5
	for <lists+linux-clk@lfdr.de>; Wed,  3 May 2023 13:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjECLAl (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 3 May 2023 07:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbjECLAj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 May 2023 07:00:39 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A76FE5269;
        Wed,  3 May 2023 04:00:22 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3439rsUk026385;
        Wed, 3 May 2023 11:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=dC/t9uWlz76993M7qhmZii62VQfob9k2/oB+0ygw680=;
 b=omJoA0gv/ntekquUHfaTCJDHZcTGgWySmsOzV5Ycmba/xheyFw87sYZENonLksRwKCzd
 dfoEdtB7S/oukz9J1EFlB8a2wsEwV1s5te/ycyhqBkDakc/WhKZO0AFnLgASBmaRxQt0
 XpYif4hInV/gygLAJ/LTSTKJ7u5PbJe7iul8QhdDjdhbn8t7ZX0uEtbEdM6bOARtc+Kw
 AXYEAW0ZmPt/dIyk69ujQOcuE7TdpygrbL4q59FS5j1D9U1hCp1/lfuFvbviSzUZ1Bp9
 j7iWwxqeLg0BqIjLeO0TCbJbEWu59sEpv79aHOoXbWMBBbE8MYRFOJJPgVJ9qS4jWi2J SQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qb9fahm58-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 03 May 2023 11:00:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 343B0GCA027937
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 3 May 2023 11:00:16 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 3 May 2023 04:00:12 -0700
From:   Taniya Das <quic_tdas@quicinc.com>
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_skakitap@quicinc.com>, <quic_jkona@quicinc.com>
Subject: [PATCH V3 2/3] clk: qcom: videocc-sm8450: Add video clock controller driver for SM8450
Date:   Wed, 3 May 2023 16:29:36 +0530
Message-ID: <20230503105937.24911-3-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230503105937.24911-1-quic_tdas@quicinc.com>
References: <20230503105937.24911-1-quic_tdas@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9Rvj4yITysn9RI4T263PLKn8XH-UH8YO
X-Proofpoint-GUID: 9Rvj4yITysn9RI4T263PLKn8XH-UH8YO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_06,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030091
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for the video clock controller driver for peripheral clock
clients to be able to request for video cc clocks.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Changes since V2:
 - Update the header file name to match the latest upstream header
   files.

Changes since V1:
 - Use DT indices instead of fw_name.
 - Replace pm_runtime_enable with devm_pm_runtime_enable.
 - Change license to GPL from GPL V2.

 drivers/clk/qcom/Kconfig          |   9 +
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/videocc-sm8450.c | 459 ++++++++++++++++++++++++++++++
 3 files changed, 469 insertions(+)
 create mode 100644 drivers/clk/qcom/videocc-sm8450.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 12be3e2371b3..927aa5983464 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -962,4 +962,13 @@ config CLK_GFM_LPASS_SM8250
 	  Support for the Glitch Free Mux (GFM) Low power audio
           subsystem (LPASS) clocks found on SM8250 SoCs.
 
+config SM_VIDEOCC_8450
+	tristate "SM8450 Video Clock Controller"
+	select SM_GCC_8450
+	select QCOM_GDSC
+	help
+	  Support for the video clock controller on Qualcomm Technologies, Inc.
+	  SM8450 devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
 endif
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 9ff4c373ad95..1960ad8e8713 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -127,6 +127,7 @@ obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
 obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
 obj-$(CONFIG_SM_VIDEOCC_8150) += videocc-sm8150.o
 obj-$(CONFIG_SM_VIDEOCC_8250) += videocc-sm8250.o
+obj-$(CONFIG_SM_VIDEOCC_8450) += videocc-sm8450.o
 obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
 obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
 obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
new file mode 100644
index 000000000000..ce0ab764eb35
--- /dev/null
+++ b/drivers/clk/qcom/videocc-sm8450.c
@@ -0,0 +1,459 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sm8450-videocc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+};
+
+enum {
+	P_BI_TCXO,
+	P_VIDEO_CC_PLL0_OUT_MAIN,
+	P_VIDEO_CC_PLL1_OUT_MAIN,
+};
+
+static const struct pll_vco lucid_evo_vco[] = {
+	{ 249600000, 2020000000, 0 },
+};
+
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x1E,
+	.alpha = 0x0,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x32AA299C,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000805,
+};
+
+static struct clk_alpha_pll video_cc_pll0 = {
+	.offset = 0x0,
+	.vco_table = lucid_evo_vco,
+	.num_vco = ARRAY_SIZE(lucid_evo_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct alpha_pll_config video_cc_pll1_config = {
+	.l = 0x2B,
+	.alpha = 0xC000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x32AA299C,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000805,
+};
+
+static struct clk_alpha_pll video_cc_pll1 = {
+	.offset = 0x1000,
+	.vco_table = lucid_evo_vco,
+	.num_vco = ARRAY_SIZE(lucid_evo_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL1_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll1.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(576000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(720000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1014000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1098000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs1_clk_src[] = {
+	F(840000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1050000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1350000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1500000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1650000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs1_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs1_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0_div_clk_src = {
+	.reg = 0x80b8,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0c_div2_div_clk_src = {
+	.reg = 0x806c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0c_div2_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs1_div_clk_src = {
+	.reg = 0x80dc,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs1c_div2_div_clk_src = {
+	.reg = 0x8094,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1c_div2_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x80b0,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x80b0,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80b0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_clk = {
+	.halt_reg = 0x8064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1_clk = {
+	.halt_reg = 0x80d4,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x80d4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1c_clk = {
+	.halt_reg = 0x808c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x808c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs1c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc video_cc_mvs0c_gdsc = {
+	.gdscr = 0x804c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_gdsc = {
+	.gdscr = 0x809c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.flags = RETAIN_FF_ENABLE | HW_CTRL,
+};
+
+static struct gdsc video_cc_mvs1c_gdsc = {
+	.gdscr = 0x8074,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs1c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs1_gdsc = {
+	.gdscr = 0x80c0,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs1c_gdsc.pd,
+	.flags = RETAIN_FF_ENABLE | HW_CTRL,
+};
+
+static struct clk_regmap *video_cc_sm8450_clocks[] = {
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
+	[VIDEO_CC_MVS1_CLK] = &video_cc_mvs1_clk.clkr,
+	[VIDEO_CC_MVS1_CLK_SRC] = &video_cc_mvs1_clk_src.clkr,
+	[VIDEO_CC_MVS1_DIV_CLK_SRC] = &video_cc_mvs1_div_clk_src.clkr,
+	[VIDEO_CC_MVS1C_CLK] = &video_cc_mvs1c_clk.clkr,
+	[VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC] = &video_cc_mvs1c_div2_div_clk_src.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_PLL1] = &video_cc_pll1.clkr,
+};
+
+static struct gdsc *video_cc_sm8450_gdscs[] = {
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS1C_GDSC] = &video_cc_mvs1c_gdsc,
+	[VIDEO_CC_MVS1_GDSC] = &video_cc_mvs1_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_sm8450_resets[] = {
+	[CVP_VIDEO_CC_INTERFACE_BCR] = { 0x80e0 },
+	[CVP_VIDEO_CC_MVS0_BCR] = { 0x8098 },
+	[CVP_VIDEO_CC_MVS0C_BCR] = { 0x8048 },
+	[CVP_VIDEO_CC_MVS1_BCR] = { 0x80bc },
+	[CVP_VIDEO_CC_MVS1C_BCR] = { 0x8070 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x8064, 2 },
+	[VIDEO_CC_MVS1C_CLK_ARES] = { 0x808c, 2 },
+};
+
+static const struct regmap_config video_cc_sm8450_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9f4c,
+	.fast_io = true,
+};
+
+static struct qcom_cc_desc video_cc_sm8450_desc = {
+	.config = &video_cc_sm8450_regmap_config,
+	.clks = video_cc_sm8450_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_sm8450_clocks),
+	.resets = video_cc_sm8450_resets,
+	.num_resets = ARRAY_SIZE(video_cc_sm8450_resets),
+	.gdscs = video_cc_sm8450_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_sm8450_gdscs),
+};
+
+static const struct of_device_id video_cc_sm8450_match_table[] = {
+	{ .compatible = "qcom,sm8450-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_sm8450_match_table);
+
+static int video_cc_sm8450_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	int ret;
+
+	devm_pm_runtime_enable(&pdev->dev);
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
+	regmap = qcom_cc_map(pdev, &video_cc_sm8450_desc);
+	if (IS_ERR(regmap)) {
+		pm_runtime_put(&pdev->dev);
+		return PTR_ERR(regmap);
+	}
+
+	clk_lucid_evo_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
+	clk_lucid_evo_pll_configure(&video_cc_pll1, regmap, &video_cc_pll1_config);
+
+	/*
+	 * Keep clocks always enabled:
+	 *	video_cc_ahb_clk
+	 *	video_cc_sleep_clk
+	 *	video_cc_xo_clk
+	 */
+	regmap_update_bits(regmap, 0x80e4, BIT(0), BIT(0));
+	regmap_update_bits(regmap, 0x8130, BIT(0), BIT(0));
+	regmap_update_bits(regmap, 0x8114, BIT(0), BIT(0));
+
+	ret = qcom_cc_really_probe(pdev, &video_cc_sm8450_desc, regmap);
+
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
+}
+
+static struct platform_driver video_cc_sm8450_driver = {
+	.probe = video_cc_sm8450_probe,
+	.driver = {
+		.name = "video_cc-sm8450",
+		.of_match_table = video_cc_sm8450_match_table,
+	},
+};
+
+static int __init video_cc_sm8450_init(void)
+{
+	return platform_driver_register(&video_cc_sm8450_driver);
+}
+subsys_initcall(video_cc_sm8450_init);
+
+static void __exit video_cc_sm8450_exit(void)
+{
+	platform_driver_unregister(&video_cc_sm8450_driver);
+}
+module_exit(video_cc_sm8450_exit);
+
+MODULE_DESCRIPTION("QTI VIDEO_CC SM8450 Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

