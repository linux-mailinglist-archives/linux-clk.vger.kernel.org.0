Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD25B7912BF
	for <lists+linux-clk@lfdr.de>; Mon,  4 Sep 2023 09:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232655AbjIDH5Q (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 4 Sep 2023 03:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242040AbjIDH5O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Sep 2023 03:57:14 -0400
Received: from mail-sh.amlogic.com (mail-sh.amlogic.com [58.32.228.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBDD138;
        Mon,  4 Sep 2023 00:56:21 -0700 (PDT)
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Mon, 4 Sep 2023
 15:56:21 +0800
From:   Yu Tu <yu.tu@amlogic.com>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
        <linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <kelvin.zhang@amlogic.com>, <qi.duan@amlogic.com>,
        Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V11 3/4] clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver
Date:   Mon, 4 Sep 2023 15:55:03 +0800
Message-ID: <20230904075504.23263-4-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20230904075504.23263-1-yu.tu@amlogic.com>
References: <20230904075504.23263-1-yu.tu@amlogic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.18.11.248]
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the S4 PLL clock controller driver in the S4 SoC family.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 drivers/clk/meson/Kconfig  |  12 +
 drivers/clk/meson/Makefile |   1 +
 drivers/clk/meson/s4-pll.c | 867 +++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/s4-pll.h |  38 ++
 4 files changed, 918 insertions(+)
 create mode 100644 drivers/clk/meson/s4-pll.c
 create mode 100644 drivers/clk/meson/s4-pll.h

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 135da8f2d0b1..e90982d77598 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -144,4 +144,16 @@ config COMMON_CLK_G12A
 	help
 	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
 	  devices, aka g12a. Say Y if you want peripherals to work.
+
+config COMMON_CLK_S4_PLL
+	tristate "S4 SoC PLL clock controllers support"
+	depends on ARM64
+	default y
+	select COMMON_CLK_MESON_MPLL
+	select COMMON_CLK_MESON_PLL
+	select COMMON_CLK_MESON_REGMAP
+	help
+	  Support for the PLL clock controller on Amlogic S805X2 and S905Y4 devices,
+	  AKA S4. Say Y if you want the board to work, because PLLs are the parent of
+	  most peripherals.
 endmenu
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index cd961cc4f4db..612cee923890 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -22,3 +22,4 @@ obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
 obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
 obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
 obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
+obj-$(CONFIG_COMMON_CLK_S4_PLL) += s4-pll.o
diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
new file mode 100644
index 000000000000..8dfaeccaadc2
--- /dev/null
+++ b/drivers/clk/meson/s4-pll.c
@@ -0,0 +1,867 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Amlogic S4 PLL Clock Controller Driver
+ *
+ * Copyright (c) 2022-2023 Amlogic, inc. All rights reserved
+ * Author: Yu Tu <yu.tu@amlogic.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-mpll.h"
+#include "clk-pll.h"
+#include "clk-regmap.h"
+#include "s4-pll.h"
+#include "meson-clkc-utils.h"
+#include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
+
+static DEFINE_SPINLOCK(meson_clk_lock);
+
+/*
+ * These clock are a fixed value (fixed_pll is 2GHz) that is initialized by ROMcode.
+ * The chip was changed fixed pll for security reasons. Fixed PLL registers are not writable
+ * in the kernel phase. Write of fixed PLL-related register will cause the system to crash.
+ * Meanwhile, these clock won't ever change at runtime.
+ * For the above reasons, we can only use ro_ops for fixed PLL related clocks.
+ */
+static struct clk_regmap s4_fixed_pll_dco = {
+	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = ANACTRL_FIXPLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = ANACTRL_FIXPLL_CTRL0,
+			.shift   = 0,
+			.width   = 8,
+		},
+		.n = {
+			.reg_off = ANACTRL_FIXPLL_CTRL0,
+			.shift   = 10,
+			.width   = 5,
+		},
+		.l = {
+			.reg_off = ANACTRL_FIXPLL_CTRL0,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = ANACTRL_FIXPLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fixed_pll_dco",
+		.ops = &meson_clk_pll_ro_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal", }
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s4_fixed_pll = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = ANACTRL_FIXPLL_CTRL0,
+		.shift = 16,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fixed_pll",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_fixed_pll_dco.hw
+		},
+		.num_parents = 1,
+		/*
+		 * This clock won't ever change at runtime so
+		 * CLK_SET_RATE_PARENT is not required
+		 */
+	},
+};
+
+static struct clk_fixed_factor s4_fclk_div2_div = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div2_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &s4_fixed_pll.hw },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s4_fclk_div2 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = ANACTRL_FIXPLL_CTRL1,
+		.bit_idx = 24,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div2",
+		.ops = &clk_regmap_gate_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_fclk_div2_div.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor s4_fclk_div3_div = {
+	.mult = 1,
+	.div = 3,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div3_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &s4_fixed_pll.hw },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s4_fclk_div3 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = ANACTRL_FIXPLL_CTRL1,
+		.bit_idx = 20,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div3",
+		.ops = &clk_regmap_gate_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_fclk_div3_div.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor s4_fclk_div4_div = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div4_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &s4_fixed_pll.hw },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s4_fclk_div4 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = ANACTRL_FIXPLL_CTRL1,
+		.bit_idx = 21,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div4",
+		.ops = &clk_regmap_gate_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_fclk_div4_div.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor s4_fclk_div5_div = {
+	.mult = 1,
+	.div = 5,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div5_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &s4_fixed_pll.hw },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s4_fclk_div5 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = ANACTRL_FIXPLL_CTRL1,
+		.bit_idx = 22,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div5",
+		.ops = &clk_regmap_gate_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_fclk_div5_div.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor s4_fclk_div7_div = {
+	.mult = 1,
+	.div = 7,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div7_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &s4_fixed_pll.hw },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s4_fclk_div7 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = ANACTRL_FIXPLL_CTRL1,
+		.bit_idx = 23,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div7",
+		.ops = &clk_regmap_gate_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_fclk_div7_div.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor s4_fclk_div2p5_div = {
+	.mult = 2,
+	.div = 5,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div2p5_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_fixed_pll.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s4_fclk_div2p5 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = ANACTRL_FIXPLL_CTRL1,
+		.bit_idx = 25,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div2p5",
+		.ops = &clk_regmap_gate_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_fclk_div2p5_div.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static const struct pll_mult_range s4_gp0_pll_mult_range = {
+	.min = 125,
+	.max = 250,
+};
+
+/*
+ * Internal gp0 pll emulation configuration parameters
+ */
+static const struct reg_sequence s4_gp0_init_regs[] = {
+	{ .reg = ANACTRL_GP0PLL_CTRL1,	.def = 0x00000000 },
+	{ .reg = ANACTRL_GP0PLL_CTRL2,	.def = 0x00000000 },
+	{ .reg = ANACTRL_GP0PLL_CTRL3,	.def = 0x48681c00 },
+	{ .reg = ANACTRL_GP0PLL_CTRL4,	.def = 0x88770290 },
+	{ .reg = ANACTRL_GP0PLL_CTRL5,	.def = 0x39272000 },
+	{ .reg = ANACTRL_GP0PLL_CTRL6,	.def = 0x56540000 }
+};
+
+static struct clk_regmap s4_gp0_pll_dco = {
+	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = ANACTRL_GP0PLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = ANACTRL_GP0PLL_CTRL0,
+			.shift   = 0,
+			.width   = 8,
+		},
+		.n = {
+			.reg_off = ANACTRL_GP0PLL_CTRL0,
+			.shift   = 10,
+			.width   = 5,
+		},
+		.l = {
+			.reg_off = ANACTRL_GP0PLL_CTRL0,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = ANACTRL_GP0PLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.range = &s4_gp0_pll_mult_range,
+		.init_regs = s4_gp0_init_regs,
+		.init_count = ARRAY_SIZE(s4_gp0_init_regs),
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "gp0_pll_dco",
+		.ops = &meson_clk_pll_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal", }
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s4_gp0_pll = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = ANACTRL_GP0PLL_CTRL0,
+		.shift = 16,
+		.width = 3,
+		.flags = (CLK_DIVIDER_POWER_OF_TWO |
+			  CLK_DIVIDER_ROUND_CLOSEST),
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "gp0_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_gp0_pll_dco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+/*
+ * Internal hifi pll emulation configuration parameters
+ */
+static const struct reg_sequence s4_hifi_init_regs[] = {
+	{ .reg = ANACTRL_HIFIPLL_CTRL1,	.def = 0x00010e56 },
+	{ .reg = ANACTRL_HIFIPLL_CTRL2,	.def = 0x00000000 },
+	{ .reg = ANACTRL_HIFIPLL_CTRL3,	.def = 0x6a285c00 },
+	{ .reg = ANACTRL_HIFIPLL_CTRL4,	.def = 0x65771290 },
+	{ .reg = ANACTRL_HIFIPLL_CTRL5,	.def = 0x39272000 },
+	{ .reg = ANACTRL_HIFIPLL_CTRL6,	.def = 0x56540000 }
+};
+
+static struct clk_regmap s4_hifi_pll_dco = {
+	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = ANACTRL_HIFIPLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = ANACTRL_HIFIPLL_CTRL0,
+			.shift   = 0,
+			.width   = 8,
+		},
+		.n = {
+			.reg_off = ANACTRL_HIFIPLL_CTRL0,
+			.shift   = 10,
+			.width   = 5,
+		},
+		.l = {
+			.reg_off = ANACTRL_HIFIPLL_CTRL0,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = ANACTRL_HIFIPLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.range = &s4_gp0_pll_mult_range,
+		.init_regs = s4_hifi_init_regs,
+		.init_count = ARRAY_SIZE(s4_hifi_init_regs),
+		.flags = CLK_MESON_PLL_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "hifi_pll_dco",
+		.ops = &meson_clk_pll_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal", }
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s4_hifi_pll = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = ANACTRL_HIFIPLL_CTRL0,
+		.shift = 16,
+		.width = 2,
+		.flags = (CLK_DIVIDER_POWER_OF_TWO |
+			  CLK_DIVIDER_ROUND_CLOSEST),
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "hifi_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_hifi_pll_dco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s4_hdmi_pll_dco = {
+	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = ANACTRL_HDMIPLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = ANACTRL_HDMIPLL_CTRL0,
+			.shift   = 0,
+			.width   = 8,
+		},
+		.n = {
+			.reg_off = ANACTRL_HDMIPLL_CTRL0,
+			.shift   = 10,
+			.width   = 5,
+		},
+		.l = {
+			.reg_off = ANACTRL_HDMIPLL_CTRL0,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = ANACTRL_HDMIPLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.range = &s4_gp0_pll_mult_range,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "hdmi_pll_dco",
+		.ops = &meson_clk_pll_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal", }
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s4_hdmi_pll_od = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = ANACTRL_HDMIPLL_CTRL0,
+		.shift = 16,
+		.width = 4,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "hdmi_pll_od",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_hdmi_pll_dco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s4_hdmi_pll = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = ANACTRL_HDMIPLL_CTRL0,
+		.shift = 20,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "hdmi_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_hdmi_pll_od.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s4_mpll_50m_div = {
+	.mult = 1,
+	.div = 80,
+	.hw.init = &(struct clk_init_data){
+		.name = "mpll_50m_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_fixed_pll_dco.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s4_mpll_50m = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = ANACTRL_FIXPLL_CTRL3,
+		.mask = 0x1,
+		.shift = 5,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "mpll_50m",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal", },
+			{ .hw = &s4_mpll_50m_div.hw },
+		},
+		.num_parents = 2,
+	},
+};
+
+static struct clk_fixed_factor s4_mpll_prediv = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "mpll_prediv",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_fixed_pll_dco.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static const struct reg_sequence s4_mpll0_init_regs[] = {
+	{ .reg = ANACTRL_MPLL_CTRL2, .def = 0x40000033 }
+};
+
+static struct clk_regmap s4_mpll0_div = {
+	.data = &(struct meson_clk_mpll_data){
+		.sdm = {
+			.reg_off = ANACTRL_MPLL_CTRL1,
+			.shift   = 0,
+			.width   = 14,
+		},
+		.sdm_en = {
+			.reg_off = ANACTRL_MPLL_CTRL1,
+			.shift   = 30,
+			.width	 = 1,
+		},
+		.n2 = {
+			.reg_off = ANACTRL_MPLL_CTRL1,
+			.shift   = 20,
+			.width   = 9,
+		},
+		.ssen = {
+			.reg_off = ANACTRL_MPLL_CTRL1,
+			.shift   = 29,
+			.width	 = 1,
+		},
+		.lock = &meson_clk_lock,
+		.init_regs = s4_mpll0_init_regs,
+		.init_count = ARRAY_SIZE(s4_mpll0_init_regs),
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "mpll0_div",
+		.ops = &meson_clk_mpll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_mpll_prediv.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s4_mpll0 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = ANACTRL_MPLL_CTRL1,
+		.bit_idx = 31,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "mpll0",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &s4_mpll0_div.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct reg_sequence s4_mpll1_init_regs[] = {
+	{ .reg = ANACTRL_MPLL_CTRL4,	.def = 0x40000033 }
+};
+
+static struct clk_regmap s4_mpll1_div = {
+	.data = &(struct meson_clk_mpll_data){
+		.sdm = {
+			.reg_off = ANACTRL_MPLL_CTRL3,
+			.shift   = 0,
+			.width   = 14,
+		},
+		.sdm_en = {
+			.reg_off = ANACTRL_MPLL_CTRL3,
+			.shift   = 30,
+			.width	 = 1,
+		},
+		.n2 = {
+			.reg_off = ANACTRL_MPLL_CTRL3,
+			.shift   = 20,
+			.width   = 9,
+		},
+		.ssen = {
+			.reg_off = ANACTRL_MPLL_CTRL3,
+			.shift   = 29,
+			.width	 = 1,
+		},
+		.lock = &meson_clk_lock,
+		.init_regs = s4_mpll1_init_regs,
+		.init_count = ARRAY_SIZE(s4_mpll1_init_regs),
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "mpll1_div",
+		.ops = &meson_clk_mpll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_mpll_prediv.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s4_mpll1 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = ANACTRL_MPLL_CTRL3,
+		.bit_idx = 31,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "mpll1",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &s4_mpll1_div.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct reg_sequence s4_mpll2_init_regs[] = {
+	{ .reg = ANACTRL_MPLL_CTRL6, .def = 0x40000033 }
+};
+
+static struct clk_regmap s4_mpll2_div = {
+	.data = &(struct meson_clk_mpll_data){
+		.sdm = {
+			.reg_off = ANACTRL_MPLL_CTRL5,
+			.shift   = 0,
+			.width   = 14,
+		},
+		.sdm_en = {
+			.reg_off = ANACTRL_MPLL_CTRL5,
+			.shift   = 30,
+			.width	 = 1,
+		},
+		.n2 = {
+			.reg_off = ANACTRL_MPLL_CTRL5,
+			.shift   = 20,
+			.width   = 9,
+		},
+		.ssen = {
+			.reg_off = ANACTRL_MPLL_CTRL5,
+			.shift   = 29,
+			.width	 = 1,
+		},
+		.lock = &meson_clk_lock,
+		.init_regs = s4_mpll2_init_regs,
+		.init_count = ARRAY_SIZE(s4_mpll2_init_regs),
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "mpll2_div",
+		.ops = &meson_clk_mpll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_mpll_prediv.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s4_mpll2 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = ANACTRL_MPLL_CTRL5,
+		.bit_idx = 31,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "mpll2",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &s4_mpll2_div.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct reg_sequence s4_mpll3_init_regs[] = {
+	{ .reg = ANACTRL_MPLL_CTRL8, .def = 0x40000033 }
+};
+
+static struct clk_regmap s4_mpll3_div = {
+	.data = &(struct meson_clk_mpll_data){
+		.sdm = {
+			.reg_off = ANACTRL_MPLL_CTRL7,
+			.shift   = 0,
+			.width   = 14,
+		},
+		.sdm_en = {
+			.reg_off = ANACTRL_MPLL_CTRL7,
+			.shift   = 30,
+			.width	 = 1,
+		},
+		.n2 = {
+			.reg_off = ANACTRL_MPLL_CTRL7,
+			.shift   = 20,
+			.width   = 9,
+		},
+		.ssen = {
+			.reg_off = ANACTRL_MPLL_CTRL7,
+			.shift   = 29,
+			.width	 = 1,
+		},
+		.lock = &meson_clk_lock,
+		.init_regs = s4_mpll3_init_regs,
+		.init_count = ARRAY_SIZE(s4_mpll3_init_regs),
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "mpll3_div",
+		.ops = &meson_clk_mpll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_mpll_prediv.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s4_mpll3 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = ANACTRL_MPLL_CTRL7,
+		.bit_idx = 31,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "mpll3",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &s4_mpll3_div.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+/* Array of all clocks provided by this provider */
+static struct clk_hw *s4_pll_hw_clks[] = {
+	[CLKID_FIXED_PLL_DCO]		= &s4_fixed_pll_dco.hw,
+	[CLKID_FIXED_PLL]		= &s4_fixed_pll.hw,
+	[CLKID_FCLK_DIV2_DIV]		= &s4_fclk_div2_div.hw,
+	[CLKID_FCLK_DIV2]		= &s4_fclk_div2.hw,
+	[CLKID_FCLK_DIV3_DIV]		= &s4_fclk_div3_div.hw,
+	[CLKID_FCLK_DIV3]		= &s4_fclk_div3.hw,
+	[CLKID_FCLK_DIV4_DIV]		= &s4_fclk_div4_div.hw,
+	[CLKID_FCLK_DIV4]		= &s4_fclk_div4.hw,
+	[CLKID_FCLK_DIV5_DIV]		= &s4_fclk_div5_div.hw,
+	[CLKID_FCLK_DIV5]		= &s4_fclk_div5.hw,
+	[CLKID_FCLK_DIV7_DIV]		= &s4_fclk_div7_div.hw,
+	[CLKID_FCLK_DIV7]		= &s4_fclk_div7.hw,
+	[CLKID_FCLK_DIV2P5_DIV]		= &s4_fclk_div2p5_div.hw,
+	[CLKID_FCLK_DIV2P5]		= &s4_fclk_div2p5.hw,
+	[CLKID_GP0_PLL_DCO]		= &s4_gp0_pll_dco.hw,
+	[CLKID_GP0_PLL]			= &s4_gp0_pll.hw,
+	[CLKID_HIFI_PLL_DCO]		= &s4_hifi_pll_dco.hw,
+	[CLKID_HIFI_PLL]		= &s4_hifi_pll.hw,
+	[CLKID_HDMI_PLL_DCO]		= &s4_hdmi_pll_dco.hw,
+	[CLKID_HDMI_PLL_OD]		= &s4_hdmi_pll_od.hw,
+	[CLKID_HDMI_PLL]		= &s4_hdmi_pll.hw,
+	[CLKID_MPLL_50M_DIV]		= &s4_mpll_50m_div.hw,
+	[CLKID_MPLL_50M]		= &s4_mpll_50m.hw,
+	[CLKID_MPLL_PREDIV]		= &s4_mpll_prediv.hw,
+	[CLKID_MPLL0_DIV]		= &s4_mpll0_div.hw,
+	[CLKID_MPLL0]			= &s4_mpll0.hw,
+	[CLKID_MPLL1_DIV]		= &s4_mpll1_div.hw,
+	[CLKID_MPLL1]			= &s4_mpll1.hw,
+	[CLKID_MPLL2_DIV]		= &s4_mpll2_div.hw,
+	[CLKID_MPLL2]			= &s4_mpll2.hw,
+	[CLKID_MPLL3_DIV]		= &s4_mpll3_div.hw,
+	[CLKID_MPLL3]			= &s4_mpll3.hw,
+};
+
+static struct clk_regmap *const s4_pll_clk_regmaps[] = {
+	&s4_fixed_pll_dco,
+	&s4_fixed_pll,
+	&s4_fclk_div2,
+	&s4_fclk_div3,
+	&s4_fclk_div4,
+	&s4_fclk_div5,
+	&s4_fclk_div7,
+	&s4_fclk_div2p5,
+	&s4_gp0_pll_dco,
+	&s4_gp0_pll,
+	&s4_hifi_pll_dco,
+	&s4_hifi_pll,
+	&s4_hdmi_pll_dco,
+	&s4_hdmi_pll_od,
+	&s4_hdmi_pll,
+	&s4_mpll_50m,
+	&s4_mpll0_div,
+	&s4_mpll0,
+	&s4_mpll1_div,
+	&s4_mpll1,
+	&s4_mpll2_div,
+	&s4_mpll2,
+	&s4_mpll3_div,
+	&s4_mpll3,
+};
+
+static const struct reg_sequence s4_init_regs[] = {
+	{ .reg = ANACTRL_MPLL_CTRL0,	.def = 0x00000543 },
+};
+
+static struct regmap_config clkc_regmap_config = {
+	.reg_bits       = 32,
+	.val_bits       = 32,
+	.reg_stride     = 4,
+};
+
+static struct meson_clk_hw_data s4_pll_clks = {
+	.hws = s4_pll_hw_clks,
+	.num = ARRAY_SIZE(s4_pll_hw_clks),
+};
+
+static int meson_s4_pll_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	void __iomem *base;
+	int ret, i;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return dev_err_probe(dev, PTR_ERR(base),
+				     "can't ioremap resource\n");
+
+	regmap = devm_regmap_init_mmio(dev, base, &clkc_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "can't init regmap mmio region\n");
+
+	ret = regmap_multi_reg_write(regmap, s4_init_regs, ARRAY_SIZE(s4_init_regs));
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to init registers\n");
+
+	/* Populate regmap for the regmap backed clocks */
+	for (i = 0; i < ARRAY_SIZE(s4_pll_clk_regmaps); i++)
+		s4_pll_clk_regmaps[i]->map = regmap;
+
+	/* Register clocks */
+	for (i = 0; i < s4_pll_clks.num; i++) {
+		/* array might be sparse */
+		if (!s4_pll_clks.hws[i])
+			continue;
+
+		ret = devm_clk_hw_register(dev, s4_pll_clks.hws[i]);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "clock[%d] registration failed\n", i);
+	}
+
+	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get,
+					   &s4_pll_clks);
+}
+
+static const struct of_device_id clkc_match_table[] = {
+	{
+		.compatible = "amlogic,s4-pll-clkc",
+	},
+	{}
+};
+
+static struct platform_driver s4_driver = {
+	.probe		= meson_s4_pll_probe,
+	.driver		= {
+		.name	= "s4-pll-clkc",
+		.of_match_table = clkc_match_table,
+	},
+};
+
+module_platform_driver(s4_driver);
+MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/meson/s4-pll.h b/drivers/clk/meson/s4-pll.h
new file mode 100644
index 000000000000..ff7d58302f2a
--- /dev/null
+++ b/drivers/clk/meson/s4-pll.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2022-2023 Amlogic, inc. All rights reserved
+ * Author: Yu Tu <yu.tu@amlogic.com>
+ */
+
+#ifndef __MESON_S4_PLL_H__
+#define __MESON_S4_PLL_H__
+
+#define ANACTRL_FIXPLL_CTRL0                       0x040
+#define ANACTRL_FIXPLL_CTRL1                       0x044
+#define ANACTRL_FIXPLL_CTRL3                       0x04c
+#define ANACTRL_GP0PLL_CTRL0                       0x080
+#define ANACTRL_GP0PLL_CTRL1                       0x084
+#define ANACTRL_GP0PLL_CTRL2                       0x088
+#define ANACTRL_GP0PLL_CTRL3                       0x08c
+#define ANACTRL_GP0PLL_CTRL4                       0x090
+#define ANACTRL_GP0PLL_CTRL5                       0x094
+#define ANACTRL_GP0PLL_CTRL6                       0x098
+#define ANACTRL_HIFIPLL_CTRL0                      0x100
+#define ANACTRL_HIFIPLL_CTRL1                      0x104
+#define ANACTRL_HIFIPLL_CTRL2                      0x108
+#define ANACTRL_HIFIPLL_CTRL3                      0x10c
+#define ANACTRL_HIFIPLL_CTRL4                      0x110
+#define ANACTRL_HIFIPLL_CTRL5                      0x114
+#define ANACTRL_HIFIPLL_CTRL6                      0x118
+#define ANACTRL_MPLL_CTRL0                         0x180
+#define ANACTRL_MPLL_CTRL1                         0x184
+#define ANACTRL_MPLL_CTRL2                         0x188
+#define ANACTRL_MPLL_CTRL3                         0x18c
+#define ANACTRL_MPLL_CTRL4                         0x190
+#define ANACTRL_MPLL_CTRL5                         0x194
+#define ANACTRL_MPLL_CTRL6                         0x198
+#define ANACTRL_MPLL_CTRL7                         0x19c
+#define ANACTRL_MPLL_CTRL8                         0x1a0
+#define ANACTRL_HDMIPLL_CTRL0                      0x1c0
+
+#endif /* __MESON_S4_PLL_H__ */
-- 
2.33.1

