Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5931682039
	for <lists+linux-clk@lfdr.de>; Tue, 31 Jan 2023 01:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbjAaAAC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 30 Jan 2023 19:00:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjA3X77 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Jan 2023 18:59:59 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A8E23D90
        for <linux-clk@vger.kernel.org>; Mon, 30 Jan 2023 15:59:51 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id dr8so15319542ejc.12
        for <linux-clk@vger.kernel.org>; Mon, 30 Jan 2023 15:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8yOsvXNT0wYZs16RDglK3sp3e+Qo59M+SSIlkFjXoA=;
        b=ql/ZR4vPxFMeVS/rUDsykCPRShV/75/pAYjGL4rEk7XfCuAof0LCFETFTH6Nl4dltv
         VZzIPZ89S4a0bekKWuQ2O2MNlLmquHDulpjFGGhx69jWPNA1dSM7fml2y++YsvFUFTti
         Xc/QgLIJeYinyXh8qfaquSKxELLs7EqoGy/JIWTxM5EXYWaOfANYRiWhAMpCZZCH5htz
         nmCAix1DSuSHa6vg3t5rk+zTxAA/zw2ioxd2AKP6mikbDsMEe9t9cuwbCM4RfGm9OunF
         I7w6uZvhJQ32yQnjqeqR4eRPxY2gPQGNzGhWPNX8xrcwHUvXilkZrrYESilC32cLXS95
         IYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8yOsvXNT0wYZs16RDglK3sp3e+Qo59M+SSIlkFjXoA=;
        b=rTTRK1aIKPWDJysWBbhWWtq1GcpWEdWKufTvN8PlEt0cZp3P+TdD5/CROSoT/POyDg
         RMDuUYDPUvXxNGxcHsQzRwaU2BHvd+U2VlS3POJ5lmsxTzaHdWDV8lKSpsfIFXdNijsn
         NIIsyvDOsSGuU+ztvD+cs5v336CCXDzyJ5pRnciFn5uwbJNXiKUfH88lS1vx+KuVuOpU
         1M1+RNFiFfpL7OFhOYdTDYzFv7/xEBaBN0qVU+3r4NogoiHve+m0HKjFTiuR5ZKVhIkB
         3boYdGy1T67amRZEXsfiD3wAUJYV0nVlKLOY1z/vDOM7ALDd8vumIIOTY+d1rQ+LqaRy
         9c2w==
X-Gm-Message-State: AO0yUKXtZS5lYHTlspn1BbUHGOhhdhaCmFrNVX4ZxgiaRkjcfiMZzLjK
        A9sjM4RTWXQ1eIItjvw3EVwNqA==
X-Google-Smtp-Source: AK7set8MB13UoNYmmrDBp2zhOshsOqj6063aAB4Sg8cJjaEFZgtJbq3u/K1H5lqhdRWqMyrf8CQZWw==
X-Received: by 2002:a17:906:a411:b0:878:72f7:bd99 with SMTP id l17-20020a170906a41100b0087872f7bd99mr17016784ejz.6.1675123189330;
        Mon, 30 Jan 2023 15:59:49 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id jr23-20020a170906515700b0086f4b8f9e42sm7577751ejc.65.2023.01.30.15.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 15:59:49 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v4 8/8] clk: qcom: Add GPU clock controller driver for SM6115
Date:   Tue, 31 Jan 2023 00:59:26 +0100
Message-Id: <20230130235926.2419776-9-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130235926.2419776-1-konrad.dybcio@linaro.org>
References: <20230130235926.2419776-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for the GPU clock controller found on SM6115.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/Kconfig        |   9 +
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/gpucc-sm6115.c | 512 ++++++++++++++++++++++++++++++++
 3 files changed, 522 insertions(+)
 create mode 100644 drivers/clk/qcom/gpucc-sm6115.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a5995ede04e9..825701084323 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -798,6 +798,15 @@ config SM_GCC_8550
 	  Say Y if you want to use peripheral devices such as UART,
 	  SPI, I2C, USB, SD/UFS, PCIe etc.
 
+config SM_GPUCC_6115
+	tristate "SM6125 Graphics Clock Controller"
+	select SM_GCC_6115
+	depends on ARM64 || COMPILE_TEST
+	help
+	  Support for the graphics clock controller on SM6115 devices.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
 config SM_GPUCC_6125
 	tristate "SM6125 Graphics Clock Controller"
 	select SM_GCC_6125
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 5a1b65b2ac05..9f6b93698ef2 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -112,6 +112,7 @@ obj-$(CONFIG_SM_GCC_8250) += gcc-sm8250.o
 obj-$(CONFIG_SM_GCC_8350) += gcc-sm8350.o
 obj-$(CONFIG_SM_GCC_8450) += gcc-sm8450.o
 obj-$(CONFIG_SM_GCC_8550) += gcc-sm8550.o
+obj-$(CONFIG_SM_GPUCC_6115) += gpucc-sm6115.o
 obj-$(CONFIG_SM_GPUCC_6125) += gpucc-sm6125.o
 obj-$(CONFIG_SM_GPUCC_6350) += gpucc-sm6350.o
 obj-$(CONFIG_SM_GPUCC_6375) += gpucc-sm6375.o
diff --git a/drivers/clk/qcom/gpucc-sm6115.c b/drivers/clk/qcom/gpucc-sm6115.c
new file mode 100644
index 000000000000..2f54298ed255
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-sm6115.c
@@ -0,0 +1,512 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sm6115-gpucc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "clk-regmap-phy-mux.h"
+#include "gdsc.h"
+#include "reset.h"
+
+#define CX_GMU_CBCR_SLEEP_MASK		0xf
+#define CX_GMU_CBCR_SLEEP_SHIFT		4
+#define CX_GMU_CBCR_WAKE_MASK		0xf
+#define CX_GMU_CBCR_WAKE_SHIFT		8
+
+enum {
+	DT_BI_TCXO,
+	DT_GCC_GPU_GPLL0_CLK_SRC,
+	DT_GCC_GPU_GPLL0_DIV_CLK_SRC,
+};
+
+enum {
+	P_BI_TCXO,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_CC_PLL0_OUT_AUX2,
+	P_GPU_CC_PLL0_OUT_MAIN,
+	P_GPU_CC_PLL1_OUT_AUX,
+	P_GPU_CC_PLL1_OUT_MAIN,
+};
+
+static struct pll_vco default_vco[] = {
+	{ 1000000000, 2000000000, 0 },
+};
+
+static struct pll_vco pll1_vco[] = {
+	{ 500000000, 1000000000, 2 },
+};
+
+static const struct alpha_pll_config gpu_cc_pll0_config = {
+	.l = 0x3e,
+	.alpha = 0,
+	.alpha_hi = 0x80,
+	.vco_val = 0x0 << 20,
+	.vco_mask = GENMASK(21, 20),
+	.alpha_en_mask = BIT(24),
+	.main_output_mask = BIT(0),
+	.aux_output_mask = BIT(1),
+	.aux2_output_mask = BIT(2),
+	.config_ctl_val = 0x4001055b,
+	.test_ctl_hi1_val = 0x1,
+};
+
+/* 1200MHz configuration */
+static struct clk_alpha_pll gpu_cc_pll0 = {
+	.offset = 0x0,
+	.vco_table = default_vco,
+	.num_vco = ARRAY_SIZE(default_vco),
+	.flags = SUPPORTS_DYNAMIC_UPDATE,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_pll0",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_gpu_cc_pll0_out_aux2[] = {
+	{ 0x0, 1 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gpu_cc_pll0_out_aux2 = {
+	.offset = 0x0,
+	.post_div_shift = 8,
+	.post_div_table = post_div_table_gpu_cc_pll0_out_aux2,
+	.num_post_div = ARRAY_SIZE(post_div_table_gpu_cc_pll0_out_aux2),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpu_cc_pll0_out_aux2",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpu_cc_pll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_ops,
+	},
+};
+
+/* 640MHz configuration */
+static const struct alpha_pll_config gpu_cc_pll1_config = {
+	.l = 0x21,
+	.alpha = 0x55555555,
+	.alpha_hi = 0x55,
+	.alpha_en_mask = BIT(24),
+	.vco_val = 0x2 << 20,
+	.vco_mask = GENMASK(21, 20),
+	.main_output_mask = BIT(0),
+	.aux_output_mask = BIT(1),
+	.config_ctl_val = 0x4001055b,
+	.test_ctl_hi1_val = 0x1,
+};
+
+static struct clk_alpha_pll gpu_cc_pll1 = {
+	.offset = 0x100,
+	.vco_table = pll1_vco,
+	.num_vco = ARRAY_SIZE(pll1_vco),
+	.flags = SUPPORTS_DYNAMIC_UPDATE,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_pll1",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_gpu_cc_pll1_out_aux[] = {
+	{ 0x0, 1 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gpu_cc_pll1_out_aux = {
+	.offset = 0x100,
+	.post_div_shift = 15,
+	.post_div_table = post_div_table_gpu_cc_pll1_out_aux,
+	.num_post_div = ARRAY_SIZE(post_div_table_gpu_cc_pll1_out_aux),
+	.width = 3,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpu_cc_pll1_out_aux",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpu_cc_pll1.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_ops,
+	},
+};
+
+static const struct parent_map gpu_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL0_OUT_MAIN, 1 },
+	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_0[] = {
+	{ .index = P_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll1.clkr.hw },
+	{ .index = DT_GCC_GPU_GPLL0_CLK_SRC },
+	{ .index = DT_GCC_GPU_GPLL0_DIV_CLK_SRC },
+};
+
+static const struct parent_map gpu_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL0_OUT_AUX2, 2 },
+	{ P_GPU_CC_PLL1_OUT_AUX, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_1[] = {
+	{ .index = P_BI_TCXO },
+	{ .hw = &gpu_cc_pll0_out_aux2.clkr.hw },
+	{ .hw = &gpu_cc_pll1_out_aux.clkr.hw },
+	{ .index = DT_GCC_GPU_GPLL0_CLK_SRC },
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x1120,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_0,
+	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpu_cc_gmu_clk_src",
+		.parent_data = gpu_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src[] = {
+	F(320000000, P_GPU_CC_PLL1_OUT_AUX, 2, 0, 0),
+	F(465000000, P_GPU_CC_PLL1_OUT_AUX, 2, 0, 0),
+	F(600000000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(745000000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(820000000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(900000000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(950000000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(980000000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
+	.cmd_rcgr = 0x101c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_1,
+	.freq_tbl = ftbl_gpu_cc_gx_gfx3d_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpu_cc_gx_gfx3d_clk_src",
+		.parent_data = gpu_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gpu_cc_ahb_clk = {
+	.halt_reg = 0x1078,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1078,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_ahb_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_crc_ahb_clk = {
+	.halt_reg = 0x107c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x107c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_crc_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gfx3d_clk = {
+	.halt_reg = 0x10a4,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_cx_gfx3d_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gpu_cc_gx_gfx3d_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gmu_clk = {
+	.halt_reg = 0x1098,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1098,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_cx_gmu_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_snoc_dvm_clk = {
+	.halt_reg = 0x108c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x108c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_cx_snoc_dvm_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_aon_clk = {
+	.halt_reg = 0x1004,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_cxo_aon_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_clk = {
+	.halt_reg = 0x109c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x109c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_cxo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_cxo_clk = {
+	.halt_reg = 0x1060,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1060,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_gx_cxo_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_gfx3d_clk = {
+	.halt_reg = 0x1054,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x1054,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_gx_gfx3d_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gpu_cc_gx_gfx3d_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_sleep_clk = {
+	.halt_reg = 0x1090,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1090,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
+	.halt_reg = 0x5000,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x5000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			 .name = "gpu_cc_hlos1_vote_gpu_smmu_clk",
+			 .ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gpu_cx_gdsc = {
+	.gdscr = 0x106c,
+	.gds_hw_ctrl = 0x1540,
+	.pd = {
+		.name = "gpu_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc gpu_gx_gdsc = {
+	.gdscr = 0x100c,
+	.clamp_io_ctrl = 0x1508,
+	.resets = (unsigned int []){ GPU_GX_BCR },
+	.reset_count = 1,
+	.pd = {
+		.name = "gpu_gx_gdsc",
+	},
+	.parent = &gpu_cx_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = CLAMP_IO | SW_RESET | VOTABLE,
+};
+
+static struct clk_regmap *gpu_cc_sm6115_clocks[] = {
+	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
+	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
+	[GPU_CC_CX_GFX3D_CLK] = &gpu_cc_cx_gfx3d_clk.clkr,
+	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
+	[GPU_CC_CX_SNOC_DVM_CLK] = &gpu_cc_cx_snoc_dvm_clk.clkr,
+	[GPU_CC_CXO_AON_CLK] = &gpu_cc_cxo_aon_clk.clkr,
+	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
+	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
+	[GPU_CC_GX_CXO_CLK] = &gpu_cc_gx_cxo_clk.clkr,
+	[GPU_CC_GX_GFX3D_CLK] = &gpu_cc_gx_gfx3d_clk.clkr,
+	[GPU_CC_GX_GFX3D_CLK_SRC] = &gpu_cc_gx_gfx3d_clk_src.clkr,
+	[GPU_CC_PLL0] = &gpu_cc_pll0.clkr,
+	[GPU_CC_PLL0_OUT_AUX2] = &gpu_cc_pll0_out_aux2.clkr,
+	[GPU_CC_PLL1] = &gpu_cc_pll1.clkr,
+	[GPU_CC_PLL1_OUT_AUX] = &gpu_cc_pll1_out_aux.clkr,
+	[GPU_CC_SLEEP_CLK] = &gpu_cc_sleep_clk.clkr,
+	[GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK] = &gpu_cc_hlos1_vote_gpu_smmu_clk.clkr,
+};
+
+static const struct qcom_reset_map gpu_cc_sm6115_resets[] = {
+	[GPU_GX_BCR] = { 0x1008 },
+};
+
+static struct gdsc *gpu_cc_sm6115_gdscs[] = {
+	[GPU_CX_GDSC] = &gpu_cx_gdsc,
+	[GPU_GX_GDSC] = &gpu_gx_gdsc,
+};
+
+static const struct regmap_config gpu_cc_sm6115_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9000,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc gpu_cc_sm6115_desc = {
+	.config = &gpu_cc_sm6115_regmap_config,
+	.clks = gpu_cc_sm6115_clocks,
+	.num_clks = ARRAY_SIZE(gpu_cc_sm6115_clocks),
+	.resets = gpu_cc_sm6115_resets,
+	.num_resets = ARRAY_SIZE(gpu_cc_sm6115_resets),
+	.gdscs = gpu_cc_sm6115_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_cc_sm6115_gdscs),
+};
+
+static const struct of_device_id gpu_cc_sm6115_match_table[] = {
+	{ .compatible = "qcom,sm6115-gpucc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_cc_sm6115_match_table);
+
+static int gpu_cc_sm6115_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	unsigned int value, mask;
+
+	regmap = qcom_cc_map(pdev, &gpu_cc_sm6115_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	clk_alpha_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
+	clk_alpha_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
+
+	/* Recommended WAKEUP/SLEEP settings for the gpu_cc_cx_gmu_clk */
+	mask = CX_GMU_CBCR_WAKE_MASK << CX_GMU_CBCR_WAKE_SHIFT;
+	mask |= CX_GMU_CBCR_SLEEP_MASK << CX_GMU_CBCR_SLEEP_SHIFT;
+	value = 0xf << CX_GMU_CBCR_WAKE_SHIFT | 0xf << CX_GMU_CBCR_SLEEP_SHIFT;
+	regmap_update_bits(regmap, gpu_cc_cx_gmu_clk.clkr.enable_reg, mask, value);
+
+	/* Set up PERIPH/MEM retain on the GPU core clock */
+	regmap_update_bits(regmap, gpu_cc_gx_gfx3d_clk.halt_reg,
+			   (BIT(14) | BIT(13)), (BIT(14) | BIT(13)));
+
+	return qcom_cc_really_probe(pdev, &gpu_cc_sm6115_desc, regmap);
+}
+
+static struct platform_driver gpu_cc_sm6115_driver = {
+	.probe = gpu_cc_sm6115_probe,
+	.driver = {
+		.name = "sm6115-gpucc",
+		.of_match_table = gpu_cc_sm6115_match_table,
+	},
+};
+module_platform_driver(gpu_cc_sm6115_driver);
+
+MODULE_DESCRIPTION("QTI GPU_CC SM6115 Driver");
+MODULE_LICENSE("GPL");
-- 
2.39.1

