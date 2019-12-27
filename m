Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE2812B203
	for <lists+linux-clk@lfdr.de>; Fri, 27 Dec 2019 07:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbfL0Gj3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 27 Dec 2019 01:39:29 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:49371 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727166AbfL0Gj3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Dec 2019 01:39:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577428768; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=AZXTG0cslf+YgUMb8uBOFZik8DwvCkPO9lUG4AAn1HM=; b=TD3GkkRl79wSK+aAbTPhmojAGvs6KVlAKssn/hAWaesJQaOliaEtBK2MPhNMZcVwJwButrU+
 iPt66TIEwBB5ieZ1+bjIfrXuWXQIhB8KtkF5ZilUT3fc3YCRcu+Gs2O9n7eiwIVx27vERa/t
 PnEluG+Ckn9FtLD75blFDjA76Io=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e05a71f.7f4b8f6105a8-smtp-out-n03;
 Fri, 27 Dec 2019 06:39:27 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6E450C447A0; Fri, 27 Dec 2019 06:39:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 48ADAC447A4;
        Fri, 27 Dec 2019 06:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 48ADAC447A4
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 6/6] clk: qcom: Add video clock controller driver for SC7180
Date:   Fri, 27 Dec 2019 12:08:34 +0530
Message-Id: <1577428714-17766-7-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577428714-17766-1-git-send-email-tdas@codeaurora.org>
References: <1577428714-17766-1-git-send-email-tdas@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for the video clock controller found on SC7180
based devices. This would allow video drivers to probe
and control their clocks.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/Kconfig          |   8 ++
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/videocc-sc7180.c | 259 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 268 insertions(+)
 create mode 100644 drivers/clk/qcom/videocc-sc7180.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e648a60..cf21d5c 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -253,6 +253,14 @@ config SC_GPUCC_7180
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.

+config SC_VIDEOCC_7180
+	tristate "SC7180 Video Clock Controller"
+	select SC_GCC_7180
+	help
+	  Support for the video clock controller on SC7180 devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode and decode.
+
 config SDM_CAMCC_845
 	tristate "SDM845 Camera Clock Controller"
 	select SDM_GCC_845
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 5477482..4cdd08f 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -47,6 +47,7 @@ obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
 obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
 obj-$(CONFIG_SC_GCC_7180) += gcc-sc7180.o
 obj-$(CONFIG_SC_GPUCC_7180) += gpucc-sc7180.o
+obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
 obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
 obj-$(CONFIG_SDM_DISPCC_845) += dispcc-sdm845.o
 obj-$(CONFIG_SDM_GCC_660) += gcc-sdm660.o
diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
new file mode 100644
index 0000000..76add30
--- /dev/null
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,videocc-sc7180.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "common.h"
+#include "gdsc.h"
+
+enum {
+	P_BI_TCXO,
+	P_CHIP_SLEEP_CLK,
+	P_CORE_BI_PLL_TEST_SE,
+	P_VIDEO_PLL0_OUT_EVEN,
+	P_VIDEO_PLL0_OUT_MAIN,
+	P_VIDEO_PLL0_OUT_ODD,
+};
+
+static const struct pll_vco fabia_vco[] = {
+	{ 249600000, 2000000000, 0 },
+};
+
+static struct clk_alpha_pll video_pll0 = {
+	.offset = 0x42c,
+	.vco_table = fabia_vco,
+	.num_vco = ARRAY_SIZE(fabia_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "video_pll0",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fabia_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &video_pll0.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct freq_tbl ftbl_video_cc_venus_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(150000000, P_VIDEO_PLL0_OUT_MAIN, 4, 0, 0),
+	F(270000000, P_VIDEO_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(340000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
+	F(434000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
+	F(500000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_venus_clk_src = {
+	.cmd_rcgr = 0x7f0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_venus_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "video_cc_venus_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = 3,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_branch video_cc_vcodec0_axi_clk = {
+	.halt_reg = 0x9ec,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9ec,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_vcodec0_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_vcodec0_core_clk = {
+	.halt_reg = 0x890,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x890,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_vcodec0_core_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_venus_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_venus_ahb_clk = {
+	.halt_reg = 0xa4c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa4c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_venus_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_venus_ctl_axi_clk = {
+	.halt_reg = 0x9cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_venus_ctl_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_venus_ctl_core_clk = {
+	.halt_reg = 0x850,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x850,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_venus_ctl_core_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_venus_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc venus_gdsc = {
+	.gdscr = 0x814,
+	.pd = {
+		.name = "venus_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc vcodec0_gdsc = {
+	.gdscr = 0x874,
+	.pd = {
+		.name = "vcodec0_gdsc",
+	},
+	.flags = HW_CTRL,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct clk_regmap *video_cc_sc7180_clocks[] = {
+	[VIDEO_CC_VCODEC0_AXI_CLK] = &video_cc_vcodec0_axi_clk.clkr,
+	[VIDEO_CC_VCODEC0_CORE_CLK] = &video_cc_vcodec0_core_clk.clkr,
+	[VIDEO_CC_VENUS_AHB_CLK] = &video_cc_venus_ahb_clk.clkr,
+	[VIDEO_CC_VENUS_CLK_SRC] = &video_cc_venus_clk_src.clkr,
+	[VIDEO_CC_VENUS_CTL_AXI_CLK] = &video_cc_venus_ctl_axi_clk.clkr,
+	[VIDEO_CC_VENUS_CTL_CORE_CLK] = &video_cc_venus_ctl_core_clk.clkr,
+	[VIDEO_PLL0] = &video_pll0.clkr,
+};
+
+static struct gdsc *video_cc_sc7180_gdscs[] = {
+	[VENUS_GDSC] = &venus_gdsc,
+	[VCODEC0_GDSC] = &vcodec0_gdsc,
+};
+
+static const struct regmap_config video_cc_sc7180_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xb94,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc video_cc_sc7180_desc = {
+	.config = &video_cc_sc7180_regmap_config,
+	.clks = video_cc_sc7180_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_sc7180_clocks),
+	.gdscs = video_cc_sc7180_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_sc7180_gdscs),
+};
+
+static const struct of_device_id video_cc_sc7180_match_table[] = {
+	{ .compatible = "qcom,sc7180-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_sc7180_match_table);
+
+static int video_cc_sc7180_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	struct alpha_pll_config video_pll0_config = {};
+
+	regmap = qcom_cc_map(pdev, &video_cc_sc7180_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	video_pll0_config.l = 0x1f;
+	video_pll0_config.alpha = 0x4000;
+	video_pll0_config.user_ctl_val = 0x00000001;
+	video_pll0_config.user_ctl_hi_val = 0x00004805;
+
+	clk_fabia_pll_configure(&video_pll0, regmap, &video_pll0_config);
+
+	/* Keep VIDEO_CC_XO_CLK ALWAYS-ON */
+	regmap_update_bits(regmap, 0x984, 0x1, 0x1);
+
+	return qcom_cc_really_probe(pdev, &video_cc_sc7180_desc, regmap);
+}
+
+static struct platform_driver video_cc_sc7180_driver = {
+	.probe = video_cc_sc7180_probe,
+	.driver = {
+		.name = "sc7180-videocc",
+		.of_match_table = video_cc_sc7180_match_table,
+	},
+};
+
+static int __init video_cc_sc7180_init(void)
+{
+	return platform_driver_register(&video_cc_sc7180_driver);
+}
+subsys_initcall(video_cc_sc7180_init);
+
+static void __exit video_cc_sc7180_exit(void)
+{
+	platform_driver_unregister(&video_cc_sc7180_driver);
+}
+module_exit(video_cc_sc7180_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("QTI VIDEOCC SC7180 Driver");
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
