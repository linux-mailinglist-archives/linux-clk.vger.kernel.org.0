Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 999D6266331
	for <lists+linux-clk@lfdr.de>; Fri, 11 Sep 2020 18:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgIKQLu (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 11 Sep 2020 12:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgIKPhE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Sep 2020 11:37:04 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8175EC06138E
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2020 08:35:46 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id db4so5405295qvb.4
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2020 08:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6daB7Lu2IFMw3oM5jtiscy2M7R7718CdcVF9IqA281w=;
        b=UhAfnFoHmIyybAOFBpKmQ0ErSwEGYcObwmDZ37P35vLDJQEYzD0nVC0pmPNfMgcUbt
         eVWTmW61SoJfXTcsyjWxFL3vE+qRxRLcLFSt1eShq1Be2Hk08SQsCY/drDe2+BdfewFp
         JI4updGnUJkZzCcSfm44FhRj9D6YdkARUf849P2R8cpP/Y29DC731yNcSQIVap7SRBlZ
         D63vPdG4yuRwj/n0JXnwNFVzVspZtb9mTfBR/0OKhdIPVQScdz8HztEu9zZAZQBGHGbj
         o3Hs5cYBJie0J63gnoczLbXgvYkPv164X2YHIg3Ap8uInTmaZi5sam7r/tdqTTlny2u4
         hY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6daB7Lu2IFMw3oM5jtiscy2M7R7718CdcVF9IqA281w=;
        b=NLSe4q2qqYktCr4KMHpp8PEgWtYnBI4i6SpiNTTVczshrYH9dXtJh8c73Ker71NEqF
         tYP1yRH1/idiPRRFN2mIlRs4T1tstFQZwtZOYIzxsKr9zXZVSBIpDHQwj8Vr9figPi8g
         vh9phVv4tbL/18navKL15SDyCrCdIKNFJ7sgKrL+jU6jFYMWRtJRTnYDiZi+Plox7FZO
         //039DMzlnkIEEFC+LQnG6OwMKwHT1oCbsqsNXdIb+WydKt8UQM0WJtCWI3j7vdNIKGI
         kYwSoB9uxrDO/mk8c4al4W3tTKSCLH8XB6nP9qdTp21XPtpE0dozR5V5Few5Rx4CNTFW
         fg3g==
X-Gm-Message-State: AOAM532BCgZbu5M4/d+qSZeKlHjwF4nGbZMs4DfXNnYz5ib5bsGnzr1+
        fZtFtUTYHnnDriEzhA0bI7vEPg==
X-Google-Smtp-Source: ABdhPJzec5OGeg9dBv+Rr4G1o3TRT1LlRpxOm8tFSXn5v2jwNLkcONsninxqQHSnGBIcR461i1MjiQ==
X-Received: by 2002:ad4:56a4:: with SMTP id bd4mr2451600qvb.45.1599838545172;
        Fri, 11 Sep 2020 08:35:45 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id v16sm3001744qkg.37.2020.09.11.08.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 08:35:44 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH v3 7/7] clk: qcom: Add display clock controller driver for SM8250
Date:   Fri, 11 Sep 2020 11:34:07 -0400
Message-Id: <20200911153412.21672-8-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200911153412.21672-1-jonathan@marek.ca>
References: <20200911153412.21672-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for the display clock controller found on SM8250
based devices. This would allow display drivers to probe and
control their clocks.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/Kconfig         |    9 +
 drivers/clk/qcom/Makefile        |    1 +
 drivers/clk/qcom/dispcc-sm8250.c | 1100 ++++++++++++++++++++++++++++++
 3 files changed, 1110 insertions(+)
 create mode 100644 drivers/clk/qcom/dispcc-sm8250.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index c15907842cb3..c81eae64b809 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -422,6 +422,15 @@ config SM_DISPCC_8150
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
+config SM_DISPCC_8250
+	tristate "SM8250 Display Clock Controller"
+	select SM_GCC_8250
+	help
+	  Support for the display clock controller on Qualcomm Technologies, Inc
+	  SM8250 devices.
+	  Say Y if you want to support display devices and functionality such as
+	  splash screen.
+
 config SM_GCC_8150
 	tristate "SM8150 Global Clock Controller"
 	help
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index edea87f1c7e6..8eb395d02a32 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -65,6 +65,7 @@ obj-$(CONFIG_SDM_GPUCC_845) += gpucc-sdm845.o
 obj-$(CONFIG_SDM_LPASSCC_845) += lpasscc-sdm845.o
 obj-$(CONFIG_SDM_VIDEOCC_845) += videocc-sdm845.o
 obj-$(CONFIG_SM_DISPCC_8150) += dispcc-sm8150.o
+obj-$(CONFIG_SM_DISPCC_8250) += dispcc-sm8250.o
 obj-$(CONFIG_SM_GCC_8150) += gcc-sm8150.o
 obj-$(CONFIG_SM_GCC_8250) += gcc-sm8250.o
 obj-$(CONFIG_SM_GPUCC_8150) += gpucc-sm8150.o
diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
new file mode 100644
index 000000000000..7c0f384a3a42
--- /dev/null
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -0,0 +1,1100 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	P_BI_TCXO,
+	P_CHIP_SLEEP_CLK,
+	P_CORE_BI_PLL_TEST_SE,
+	P_DISP_CC_PLL0_OUT_MAIN,
+	P_DISP_CC_PLL1_OUT_EVEN,
+	P_DISP_CC_PLL1_OUT_MAIN,
+	P_DP_PHY_PLL_LINK_CLK,
+	P_DP_PHY_PLL_VCO_DIV_CLK,
+	P_DPTX1_PHY_PLL_LINK_CLK,
+	P_DPTX1_PHY_PLL_VCO_DIV_CLK,
+	P_DPTX2_PHY_PLL_LINK_CLK,
+	P_DPTX2_PHY_PLL_VCO_DIV_CLK,
+	P_DSI0_PHY_PLL_OUT_BYTECLK,
+	P_DSI0_PHY_PLL_OUT_DSICLK,
+	P_DSI1_PHY_PLL_OUT_BYTECLK,
+	P_DSI1_PHY_PLL_OUT_DSICLK,
+	P_EDP_PHY_PLL_LINK_CLK,
+	P_EDP_PHY_PLL_VCO_DIV_CLK,
+};
+
+static struct pll_vco lucid_vco[] = {
+	{ 249600000, 2000000000, 0 },
+};
+
+static const struct alpha_pll_config disp_cc_pll0_config = {
+	.l = 0x47,
+	.alpha = 0xE000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00002261,
+	.config_ctl_hi1_val = 0x329A699C,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000805,
+	.user_ctl_hi1_val = 0x00000000,
+};
+
+static struct clk_alpha_pll disp_cc_pll0 = {
+	.offset = 0x0,
+	.vco_table = lucid_vco,
+	.num_vco = ARRAY_SIZE(lucid_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_pll0",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_ops,
+		},
+	},
+};
+
+static const struct alpha_pll_config disp_cc_pll1_config = {
+	.l = 0x1F,
+	.alpha = 0x4000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00002261,
+	.config_ctl_hi1_val = 0x329A699C,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000805,
+	.user_ctl_hi1_val = 0x00000000,
+};
+
+static struct clk_alpha_pll disp_cc_pll1 = {
+	.offset = 0x1000,
+	.vco_table = lucid_vco,
+	.num_vco = ARRAY_SIZE(lucid_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_pll1",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_ops,
+		},
+	},
+};
+
+static const struct parent_map disp_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP_PHY_PLL_LINK_CLK, 1 },
+	{ P_DP_PHY_PLL_VCO_DIV_CLK, 2 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "dp_phy_pll_link_clk" },
+	{ .fw_name = "dp_phy_pll_vco_div_clk" },
+};
+
+static const struct parent_map disp_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_1[] = {
+	{ .fw_name = "bi_tcxo" },
+};
+
+static const struct parent_map disp_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
+	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 2 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_2[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "dsi0_phy_pll_out_byteclk" },
+	{ .fw_name = "dsi1_phy_pll_out_byteclk" },
+};
+
+static const struct parent_map disp_cc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DISP_CC_PLL1_OUT_MAIN, 4 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_3[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &disp_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map disp_cc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
+	{ P_DISP_CC_PLL1_OUT_MAIN, 4 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_5[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &disp_cc_pll0.clkr.hw },
+	{ .hw = &disp_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map disp_cc_parent_map_6[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_6[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
+	{ .fw_name = "dsi1_phy_pll_out_dsiclk" },
+};
+
+static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(37500000, P_DISP_CC_PLL1_OUT_MAIN, 16, 0, 0),
+	F(75000000, P_DISP_CC_PLL1_OUT_MAIN, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
+	.cmd_rcgr = 0x22bc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_3,
+	.freq_tbl = ftbl_disp_cc_mdss_ahb_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_ahb_clk_src",
+		.parent_data = disp_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_mdss_byte0_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
+	.cmd_rcgr = 0x2110,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_byte0_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_byte1_clk_src = {
+	.cmd_rcgr = 0x212c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_byte1_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dp_aux1_clk_src = {
+	.cmd_rcgr = 0x2240,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_dp_aux1_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
+	.cmd_rcgr = 0x21dc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_dp_aux_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_mdss_dp_link1_clk_src[] = {
+	F(162000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
+	F(270000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
+	F(540000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
+	F(810000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_mdss_dp_link1_clk_src = {
+	.cmd_rcgr = 0x220c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_mdss_dp_link1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_dp_link1_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
+	.cmd_rcgr = 0x2178,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_mdss_dp_link1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_dp_link_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dp_pixel1_clk_src = {
+	.cmd_rcgr = 0x21c4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_dp_pixel1_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dp_pixel2_clk_src = {
+	.cmd_rcgr = 0x21f4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_dp_pixel2_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dp_pixel_clk_src = {
+	.cmd_rcgr = 0x21ac,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_dp_pixel_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
+	.cmd_rcgr = 0x2148,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_esc0_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
+	.cmd_rcgr = 0x2160,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_esc1_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(85714286, P_DISP_CC_PLL1_OUT_MAIN, 7, 0, 0),
+	F(100000000, P_DISP_CC_PLL1_OUT_MAIN, 6, 0, 0),
+	F(150000000, P_DISP_CC_PLL1_OUT_MAIN, 4, 0, 0),
+	F(200000000, P_DISP_CC_PLL1_OUT_MAIN, 3, 0, 0),
+	F(300000000, P_DISP_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(345000000, P_DISP_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	F(460000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
+	.cmd_rcgr = 0x20c8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_5,
+	.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_mdp_clk_src",
+		.parent_data = disp_cc_parent_data_5,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
+	.cmd_rcgr = 0x2098,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_6,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_pclk0_clk_src",
+		.parent_data = disp_cc_parent_data_6,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
+	.cmd_rcgr = 0x20b0,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_6,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_pclk1_clk_src",
+		.parent_data = disp_cc_parent_data_6,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_mdss_rot_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(200000000, P_DISP_CC_PLL1_OUT_MAIN, 3, 0, 0),
+	F(300000000, P_DISP_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(345000000, P_DISP_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	F(460000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
+	.cmd_rcgr = 0x20e0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_5,
+	.freq_tbl = ftbl_disp_cc_mdss_rot_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_rot_clk_src",
+		.parent_data = disp_cc_parent_data_5,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
+	.cmd_rcgr = 0x20f8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_vsync_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
+	.reg = 0x2128,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "disp_cc_mdss_byte0_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &disp_cc_mdss_byte0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+
+static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
+	.reg = 0x2144,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "disp_cc_mdss_byte1_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &disp_cc_mdss_byte1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+
+static struct clk_regmap_div disp_cc_mdss_dp_link1_div_clk_src = {
+	.reg = 0x2224,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "disp_cc_mdss_dp_link1_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &disp_cc_mdss_dp_link1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+
+static struct clk_regmap_div disp_cc_mdss_dp_link_div_clk_src = {
+	.reg = 0x2190,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "disp_cc_mdss_dp_link_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &disp_cc_mdss_dp_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch disp_cc_mdss_ahb_clk = {
+	.halt_reg = 0x2080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2080,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_ahb_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte0_clk = {
+	.halt_reg = 0x2028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_byte0_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_byte0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte0_intf_clk = {
+	.halt_reg = 0x202c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x202c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_byte0_intf_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_byte0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte1_clk = {
+	.halt_reg = 0x2030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2030,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_byte1_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_byte1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte1_intf_clk = {
+	.halt_reg = 0x2034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2034,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_byte1_intf_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_byte1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dp_aux1_clk = {
+	.halt_reg = 0x2068,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2068,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_dp_aux1_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_aux1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dp_aux_clk = {
+	.halt_reg = 0x2054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2054,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_dp_aux_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dp_link1_clk = {
+	.halt_reg = 0x205c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x205c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_dp_link1_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_link1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dp_link1_intf_clk = {
+	.halt_reg = 0x2060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2060,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_dp_link1_intf_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_link1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dp_link_clk = {
+	.halt_reg = 0x2040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_dp_link_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dp_link_intf_clk = {
+	.halt_reg = 0x2044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2044,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_dp_link_intf_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dp_pixel1_clk = {
+	.halt_reg = 0x2050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2050,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_dp_pixel1_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dp_pixel2_clk = {
+	.halt_reg = 0x2058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2058,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_dp_pixel2_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_pixel2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dp_pixel_clk = {
+	.halt_reg = 0x204c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x204c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_dp_pixel_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_pixel_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_esc0_clk = {
+	.halt_reg = 0x2038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2038,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_esc0_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_esc0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_esc1_clk = {
+	.halt_reg = 0x203c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x203c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_esc1_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_esc1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp_clk = {
+	.halt_reg = 0x200c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x200c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_mdp_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
+	.halt_reg = 0x201c,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x201c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_mdp_lut_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_non_gdsc_ahb_clk = {
+	.halt_reg = 0x4004,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x4004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_non_gdsc_ahb_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_ahb_clk_src.clkr.hw,
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
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_pclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_pclk1_clk = {
+	.halt_reg = 0x2008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_pclk1_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_pclk1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_rot_clk = {
+	.halt_reg = 0x2014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_rot_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_rot_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_rscc_ahb_clk = {
+	.halt_reg = 0x400c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x400c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_rscc_ahb_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_rscc_vsync_clk = {
+	.halt_reg = 0x4008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_rscc_vsync_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_vsync_clk = {
+	.halt_reg = 0x2024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_vsync_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
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
+static struct clk_regmap *disp_cc_sm8250_clocks[] = {
+	[DISP_CC_MDSS_AHB_CLK] = &disp_cc_mdss_ahb_clk.clkr,
+	[DISP_CC_MDSS_AHB_CLK_SRC] = &disp_cc_mdss_ahb_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE0_CLK] = &disp_cc_mdss_byte0_clk.clkr,
+	[DISP_CC_MDSS_BYTE0_CLK_SRC] = &disp_cc_mdss_byte0_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE0_DIV_CLK_SRC] = &disp_cc_mdss_byte0_div_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE0_INTF_CLK] = &disp_cc_mdss_byte0_intf_clk.clkr,
+	[DISP_CC_MDSS_BYTE1_CLK] = &disp_cc_mdss_byte1_clk.clkr,
+	[DISP_CC_MDSS_BYTE1_CLK_SRC] = &disp_cc_mdss_byte1_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE1_DIV_CLK_SRC] = &disp_cc_mdss_byte1_div_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE1_INTF_CLK] = &disp_cc_mdss_byte1_intf_clk.clkr,
+	[DISP_CC_MDSS_DP_AUX1_CLK] = &disp_cc_mdss_dp_aux1_clk.clkr,
+	[DISP_CC_MDSS_DP_AUX1_CLK_SRC] = &disp_cc_mdss_dp_aux1_clk_src.clkr,
+	[DISP_CC_MDSS_DP_AUX_CLK] = &disp_cc_mdss_dp_aux_clk.clkr,
+	[DISP_CC_MDSS_DP_AUX_CLK_SRC] = &disp_cc_mdss_dp_aux_clk_src.clkr,
+	[DISP_CC_MDSS_DP_LINK1_CLK] = &disp_cc_mdss_dp_link1_clk.clkr,
+	[DISP_CC_MDSS_DP_LINK1_CLK_SRC] = &disp_cc_mdss_dp_link1_clk_src.clkr,
+	[DISP_CC_MDSS_DP_LINK1_DIV_CLK_SRC] = &disp_cc_mdss_dp_link1_div_clk_src.clkr,
+	[DISP_CC_MDSS_DP_LINK1_INTF_CLK] = &disp_cc_mdss_dp_link1_intf_clk.clkr,
+	[DISP_CC_MDSS_DP_LINK_CLK] = &disp_cc_mdss_dp_link_clk.clkr,
+	[DISP_CC_MDSS_DP_LINK_CLK_SRC] = &disp_cc_mdss_dp_link_clk_src.clkr,
+	[DISP_CC_MDSS_DP_LINK_DIV_CLK_SRC] = &disp_cc_mdss_dp_link_div_clk_src.clkr,
+	[DISP_CC_MDSS_DP_LINK_INTF_CLK] = &disp_cc_mdss_dp_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DP_PIXEL1_CLK] = &disp_cc_mdss_dp_pixel1_clk.clkr,
+	[DISP_CC_MDSS_DP_PIXEL1_CLK_SRC] = &disp_cc_mdss_dp_pixel1_clk_src.clkr,
+	[DISP_CC_MDSS_DP_PIXEL2_CLK] = &disp_cc_mdss_dp_pixel2_clk.clkr,
+	[DISP_CC_MDSS_DP_PIXEL2_CLK_SRC] = &disp_cc_mdss_dp_pixel2_clk_src.clkr,
+	[DISP_CC_MDSS_DP_PIXEL_CLK] = &disp_cc_mdss_dp_pixel_clk.clkr,
+	[DISP_CC_MDSS_DP_PIXEL_CLK_SRC] = &disp_cc_mdss_dp_pixel_clk_src.clkr,
+	[DISP_CC_MDSS_ESC0_CLK] = &disp_cc_mdss_esc0_clk.clkr,
+	[DISP_CC_MDSS_ESC0_CLK_SRC] = &disp_cc_mdss_esc0_clk_src.clkr,
+	[DISP_CC_MDSS_ESC1_CLK] = &disp_cc_mdss_esc1_clk.clkr,
+	[DISP_CC_MDSS_ESC1_CLK_SRC] = &disp_cc_mdss_esc1_clk_src.clkr,
+	[DISP_CC_MDSS_MDP_CLK] = &disp_cc_mdss_mdp_clk.clkr,
+	[DISP_CC_MDSS_MDP_CLK_SRC] = &disp_cc_mdss_mdp_clk_src.clkr,
+	[DISP_CC_MDSS_MDP_LUT_CLK] = &disp_cc_mdss_mdp_lut_clk.clkr,
+	[DISP_CC_MDSS_NON_GDSC_AHB_CLK] = &disp_cc_mdss_non_gdsc_ahb_clk.clkr,
+	[DISP_CC_MDSS_PCLK0_CLK] = &disp_cc_mdss_pclk0_clk.clkr,
+	[DISP_CC_MDSS_PCLK0_CLK_SRC] = &disp_cc_mdss_pclk0_clk_src.clkr,
+	[DISP_CC_MDSS_PCLK1_CLK] = &disp_cc_mdss_pclk1_clk.clkr,
+	[DISP_CC_MDSS_PCLK1_CLK_SRC] = &disp_cc_mdss_pclk1_clk_src.clkr,
+	[DISP_CC_MDSS_ROT_CLK] = &disp_cc_mdss_rot_clk.clkr,
+	[DISP_CC_MDSS_ROT_CLK_SRC] = &disp_cc_mdss_rot_clk_src.clkr,
+	[DISP_CC_MDSS_RSCC_AHB_CLK] = &disp_cc_mdss_rscc_ahb_clk.clkr,
+	[DISP_CC_MDSS_RSCC_VSYNC_CLK] = &disp_cc_mdss_rscc_vsync_clk.clkr,
+	[DISP_CC_MDSS_VSYNC_CLK] = &disp_cc_mdss_vsync_clk.clkr,
+	[DISP_CC_MDSS_VSYNC_CLK_SRC] = &disp_cc_mdss_vsync_clk_src.clkr,
+	[DISP_CC_PLL0] = &disp_cc_pll0.clkr,
+	[DISP_CC_PLL1] = &disp_cc_pll1.clkr,
+};
+
+static const struct qcom_reset_map disp_cc_sm8250_resets[] = {
+	[DISP_CC_MDSS_CORE_BCR] = { 0x2000 },
+	[DISP_CC_MDSS_RSCC_BCR] = { 0x4000 },
+};
+
+static struct gdsc *disp_cc_sm8250_gdscs[] = {
+	[MDSS_GDSC] = &mdss_gdsc,
+};
+
+static const struct regmap_config disp_cc_sm8250_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x10000,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc disp_cc_sm8250_desc = {
+	.config = &disp_cc_sm8250_regmap_config,
+	.clks = disp_cc_sm8250_clocks,
+	.num_clks = ARRAY_SIZE(disp_cc_sm8250_clocks),
+	.resets = disp_cc_sm8250_resets,
+	.num_resets = ARRAY_SIZE(disp_cc_sm8250_resets),
+	.gdscs = disp_cc_sm8250_gdscs,
+	.num_gdscs = ARRAY_SIZE(disp_cc_sm8250_gdscs),
+};
+
+static const struct of_device_id disp_cc_sm8250_match_table[] = {
+	{ .compatible = "qcom,sm8250-dispcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, disp_cc_sm8250_match_table);
+
+static int disp_cc_sm8250_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+
+	regmap = qcom_cc_map(pdev, &disp_cc_sm8250_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
+	clk_lucid_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
+
+	/* Enable clock gating for MDP clocks */
+	regmap_update_bits(regmap, 0x8000, 0x10, 0x10);
+
+	/* DISP_CC_XO_CLK always-on */
+	regmap_update_bits(regmap, 0x605c, BIT(0), BIT(0));
+
+	return qcom_cc_really_probe(pdev, &disp_cc_sm8250_desc, regmap);
+}
+
+static struct platform_driver disp_cc_sm8250_driver = {
+	.probe = disp_cc_sm8250_probe,
+	.driver = {
+		.name = "disp_cc-sm8250",
+		.of_match_table = disp_cc_sm8250_match_table,
+	},
+};
+
+static int __init disp_cc_sm8250_init(void)
+{
+	return platform_driver_register(&disp_cc_sm8250_driver);
+}
+subsys_initcall(disp_cc_sm8250_init);
+
+static void __exit disp_cc_sm8250_exit(void)
+{
+	platform_driver_unregister(&disp_cc_sm8250_driver);
+}
+module_exit(disp_cc_sm8250_exit);
+
+MODULE_DESCRIPTION("QTI DISPCC SM8150 Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.1

