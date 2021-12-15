Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C27D5475E01
	for <lists+linux-clk@lfdr.de>; Wed, 15 Dec 2021 17:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245079AbhLOQ5j (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Dec 2021 11:57:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245069AbhLOQ5i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 11:57:38 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A84BC061401
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 08:57:37 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id i132-20020a1c3b8a000000b003456cac51c4so130206wma.1
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 08:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sCnVCWyu0SbUOqRDqsyN2xpEEwXtABazO2+r65+zJ7I=;
        b=uptfE3Bp2hHL9B6xtrO+0YWc4C2J+AB86dpuBAkxMlATbXV0qX1ElJHxNyL6stsyyX
         y96GBUVwfzz5t5XYqLNKhjnKd5WIP1S+ATuPqSnUFSCdpUIUXr4j9VBPcpvUm00ZGDBP
         iUpt8thzlXKc+XmJrJi+gyNkemnoTazVWsw0w7GWSKiwfH0lnIntn5/DNoz0BuL+5rbg
         XgLAdrL16EXO+wxuoL6HdlrNtFhKpbX380wr221IJbqLCZXlLMFFfzCTpqCDSozJCT9l
         qYoDNLCaPkU5kgbabpO74BxCTMIfcs46Rcbj2WzeAdHjj1jeWJU7y2SPz23003hEC9WZ
         ofUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sCnVCWyu0SbUOqRDqsyN2xpEEwXtABazO2+r65+zJ7I=;
        b=YFyDJ31XZnVg1tLw764iaV4lIGUQFL5qBQ4MJsixLFXsgKKroqfJGrVXYrNJyIVrKt
         t+XguJqpoHof8tSqfxiUXQ46Gej+ZhlvDegXYUB8YImwO3jC3fG6YjVpcLn35wSqzCj1
         3H7kc182gnieTYk/MNJoyvmN2vrLbOWQ7nGeXtUpz8o5sM4txKgfTcmfxGIXBpcE5K7G
         H5Zss6H0fohDGbQFGYQAV0c5aQei3ggWZ4OoQ3DPXYUFjBPzuvJcWOOvO41bKHDmWTab
         VKAZ5Us3y7bIzjxsHwTgnb1LHj1SH+klOXBxerfKkb4K3zkN0kb8D+eYdU8vdYaHO9qe
         wnBg==
X-Gm-Message-State: AOAM532k5HOkIL2sbvyg1wWo/dCOX29OG4Ha/tR8s8r9EgUidC5bOvX4
        PVMzuPZ4ZevkhzTf9agDtLORLg==
X-Google-Smtp-Source: ABdhPJzIuoasY4ZrMYPG2oZzJLmiUX8Bu9PXaK7oLgnfRNzrBKWBouvxNmRCTaRSbIMcL/8U4YZMlw==
X-Received: by 2002:a05:600c:3506:: with SMTP id h6mr788040wmq.122.1639587455978;
        Wed, 15 Dec 2021 08:57:35 -0800 (PST)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id k7sm2507969wri.110.2021.12.15.08.57.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Dec 2021 08:57:35 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, shawn.guo@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 2/2] clk: qcom: Add display clock controller driver for QCM2290
Date:   Wed, 15 Dec 2021 18:09:40 +0100
Message-Id: <1639588180-32454-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639588180-32454-1-git-send-email-loic.poulain@linaro.org>
References: <1639588180-32454-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for the display clock controller found in QCM2290
based devices. This clock controller feeds the Multimedia Display
SubSystem (MDSS).

It's a porting of dispcc-scuba GPL-2.0 driver from CAF msm-4.19 kernel:
https://source.codeaurora.org/quic/la/kernel/msm-4.19/tree/drivers/clk/qcom/dispcc-scuba.c?h=LE.UM.4.4.1.r3

Global clock name references (parent_names) have been replaced by
parent_data and parent_hws.

Clocks marked enable_safe_config have their clk_rcg2_ops moved to
clk_rcg2_shared_ops.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: Added missing dispcc-qcm2290.h header file
 v3: - Moved dt-bindings header into dt bindings commit
     - clk_rcg2_ops to clk_rcg2_shared_ops for enable_safe_config
       marked clocks.

 drivers/clk/qcom/Kconfig          |   8 +
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/dispcc-qcm2290.c | 602 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 611 insertions(+)
 create mode 100644 drivers/clk/qcom/dispcc-qcm2290.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 74efc82..b136cd2 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -332,6 +332,14 @@ config QCM_GCC_2290
 	  Say Y if you want to use multimedia devices or peripheral
 	  devices such as UART, SPI, I2C, USB, SD/eMMC etc.
 
+config QCM_DISPCC_2290
+	tristate "QCM2290 Display Clock Controller"
+	help
+	  Support for the display clock controller on Qualcomm Technologies, Inc
+	  QCM2290 devices.
+	  Say Y if you want to support display devices and functionality such as
+	  splash screen.
+
 config QCS_GCC_404
 	tristate "QCS404 Global Clock Controller"
 	help
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 1718c34..348d012 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
 obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
 obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
 obj-$(CONFIG_QCM_GCC_2290) += gcc-qcm2290.o
+obj-$(CONFIG_QCM_DISPCC_2290) += dispcc-qcm2290.o
 obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
 obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
 obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
new file mode 100644
index 00000000..6854371
--- /dev/null
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -0,0 +1,602 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Linaro Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "reset.h"
+#include "gdsc.h"
+
+enum {
+	P_BI_TCXO,
+	P_CORE_BI_PLL_TEST_SE,
+	P_DISP_CC_PLL0_OUT_MAIN,
+	P_DSI0_PHY_PLL_OUT_BYTECLK,
+	P_DSI0_PHY_PLL_OUT_DSICLK,
+	P_DSI1_PHY_PLL_OUT_DSICLK,
+	P_GPLL0_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static struct pll_vco spark_vco[] = {
+	{ 500000000, 1000000000, 2 },
+};
+
+/* 768MHz configuration */
+static const struct alpha_pll_config disp_cc_pll0_config = {
+	.l = 0x28,
+	.alpha = 0x0,
+	.alpha_en_mask = BIT(24),
+	.vco_val = 0x2 << 20,
+	.vco_mask = GENMASK(21, 20),
+	.main_output_mask = BIT(0),
+	.config_ctl_val = 0x4001055B,
+};
+
+static struct clk_alpha_pll disp_cc_pll0 = {
+	.offset = 0x0,
+	.vco_table = spark_vco,
+	.num_vco = ARRAY_SIZE(spark_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_pll0",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static const struct parent_map disp_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "dsi0_phy_pll_out_byteclk" },
+	{ .fw_name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map disp_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_1[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "core_bi_pll_test_se" },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_1_ao[] = {
+	{ .fw_name = "bi_tcxo_ao" },
+	{ .fw_name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map disp_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 4 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_2[] = {
+	{ .fw_name = "bi_tcxo_ao" },
+	{ .fw_name = "gcc_disp_gpll0_div_clk_src" },
+	{ .fw_name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map disp_cc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
+	{ P_GPLL0_OUT_MAIN, 4 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_3[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &disp_cc_pll0.clkr.hw },
+	{ .fw_name = "gcc_disp_gpll0_clk_src" },
+	{ .fw_name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map disp_cc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_4[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
+	{ .fw_name = "dsi1_phy_pll_out_dsiclk" },
+	{ .fw_name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map disp_cc_parent_map_5[] = {
+	{ P_SLEEP_CLK, 0 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_5[] = {
+	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
+	{ .fw_name = "core_bi_pll_test_se" },
+};
+
+static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
+	.cmd_rcgr = 0x20a4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_byte0_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
+	.reg = 0x20bc,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "disp_cc_mdss_byte0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&disp_cc_mdss_byte0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(37500000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(75000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
+	.cmd_rcgr = 0x2154,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_mdss_ahb_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_ahb_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_mdss_esc0_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
+	.cmd_rcgr = 0x20c0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_mdss_esc0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_esc0_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(192000000, P_DISP_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	F(256000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(307200000, P_DISP_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(384000000, P_DISP_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
+	.cmd_rcgr = 0x2074,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_3,
+	.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_mdp_clk_src",
+		.parent_data = disp_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
+	.cmd_rcgr = 0x205c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_4,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_pclk0_clk_src",
+		.parent_data = disp_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
+	.cmd_rcgr = 0x208c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_mdss_esc0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_vsync_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_sleep_clk_src[] = {
+	F(32764, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_sleep_clk_src = {
+	.cmd_rcgr = 0x6050,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_5,
+	.freq_tbl = ftbl_disp_cc_sleep_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_sleep_clk_src",
+		.parent_data = disp_cc_parent_data_5,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_xo_clk_src = {
+	.cmd_rcgr = 0x6034,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_mdss_esc0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_xo_clk_src",
+		.parent_data = disp_cc_parent_data_1_ao,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1_ao),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch disp_cc_mdss_ahb_clk = {
+	.halt_reg = 0x2044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2044,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte0_clk = {
+	.halt_reg = 0x201c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x201c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_byte0_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_byte0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte0_intf_clk = {
+	.halt_reg = 0x2020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_byte0_intf_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_byte0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_esc0_clk = {
+	.halt_reg = 0x2024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_esc0_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_esc0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp_clk = {
+	.halt_reg = 0x2008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_mdp_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
+	.halt_reg = 0x2010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x2010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_mdp_lut_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_non_gdsc_ahb_clk = {
+	.halt_reg = 0x4004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_non_gdsc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_pclk0_clk = {
+	.halt_reg = 0x2004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_pclk0_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_pclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_vsync_clk = {
+	.halt_reg = 0x2018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_vsync_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_sleep_clk = {
+	.halt_reg = 0x6068,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6068,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_sleep_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_sleep_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_xo_clk = {
+	.halt_reg = 0x604c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x604c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_xo_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc mdss_gdsc = {
+	.gdscr = 0x3000,
+	.pd = {
+		.name = "mdss_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL,
+};
+
+static struct gdsc *disp_cc_qcm2290_gdscs[] = {
+	[MDSS_GDSC] = &mdss_gdsc,
+};
+
+static struct clk_regmap *disp_cc_qcm2290_clocks[] = {
+	[DISP_CC_MDSS_AHB_CLK] = &disp_cc_mdss_ahb_clk.clkr,
+	[DISP_CC_MDSS_AHB_CLK_SRC] = &disp_cc_mdss_ahb_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE0_CLK] = &disp_cc_mdss_byte0_clk.clkr,
+	[DISP_CC_MDSS_BYTE0_CLK_SRC] = &disp_cc_mdss_byte0_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE0_DIV_CLK_SRC] = &disp_cc_mdss_byte0_div_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE0_INTF_CLK] = &disp_cc_mdss_byte0_intf_clk.clkr,
+	[DISP_CC_MDSS_ESC0_CLK] = &disp_cc_mdss_esc0_clk.clkr,
+	[DISP_CC_MDSS_ESC0_CLK_SRC] = &disp_cc_mdss_esc0_clk_src.clkr,
+	[DISP_CC_MDSS_MDP_CLK] = &disp_cc_mdss_mdp_clk.clkr,
+	[DISP_CC_MDSS_MDP_CLK_SRC] = &disp_cc_mdss_mdp_clk_src.clkr,
+	[DISP_CC_MDSS_MDP_LUT_CLK] = &disp_cc_mdss_mdp_lut_clk.clkr,
+	[DISP_CC_MDSS_NON_GDSC_AHB_CLK] = &disp_cc_mdss_non_gdsc_ahb_clk.clkr,
+	[DISP_CC_MDSS_PCLK0_CLK] = &disp_cc_mdss_pclk0_clk.clkr,
+	[DISP_CC_MDSS_PCLK0_CLK_SRC] = &disp_cc_mdss_pclk0_clk_src.clkr,
+	[DISP_CC_MDSS_VSYNC_CLK] = &disp_cc_mdss_vsync_clk.clkr,
+	[DISP_CC_MDSS_VSYNC_CLK_SRC] = &disp_cc_mdss_vsync_clk_src.clkr,
+	[DISP_CC_PLL0] = &disp_cc_pll0.clkr,
+	[DISP_CC_SLEEP_CLK] = &disp_cc_sleep_clk.clkr,
+	[DISP_CC_SLEEP_CLK_SRC] = &disp_cc_sleep_clk_src.clkr,
+	[DISP_CC_XO_CLK] = &disp_cc_xo_clk.clkr,
+	[DISP_CC_XO_CLK_SRC] = &disp_cc_xo_clk_src.clkr,
+};
+
+static const struct regmap_config disp_cc_qcm2290_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x10000,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
+	.config = &disp_cc_qcm2290_regmap_config,
+	.clks = disp_cc_qcm2290_clocks,
+	.num_clks = ARRAY_SIZE(disp_cc_qcm2290_clocks),
+	.gdscs = disp_cc_qcm2290_gdscs,
+	.num_gdscs = ARRAY_SIZE(disp_cc_qcm2290_gdscs),
+};
+
+static const struct of_device_id disp_cc_qcm2290_match_table[] = {
+	{ .compatible = "qcom,qcm2290-dispcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, disp_cc_qcm2290_match_table);
+
+static int disp_cc_qcm2290_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	int ret;
+
+	regmap = qcom_cc_map(pdev, &disp_cc_qcm2290_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
+
+	ret = qcom_cc_really_probe(pdev, &disp_cc_qcm2290_desc, regmap);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register DISP CC clocks\n");
+		return ret;
+	}
+
+	dev_info(&pdev->dev, "Registered DISP CC clocks\n");
+
+	return ret;
+}
+
+static struct platform_driver disp_cc_qcm2290_driver = {
+	.probe = disp_cc_qcm2290_probe,
+	.driver = {
+		.name = "dispcc-qcm2290",
+		.of_match_table = disp_cc_qcm2290_match_table,
+	},
+};
+
+static int __init disp_cc_qcm2290_init(void)
+{
+	return platform_driver_register(&disp_cc_qcm2290_driver);
+}
+subsys_initcall(disp_cc_qcm2290_init);
+
+static void __exit disp_cc_qcm2290_exit(void)
+{
+	platform_driver_unregister(&disp_cc_qcm2290_driver);
+}
+module_exit(disp_cc_qcm2290_exit);
+
+MODULE_DESCRIPTION("QTI DISP_CC qcm2290 Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

