Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9577E456946
	for <lists+linux-clk@lfdr.de>; Fri, 19 Nov 2021 05:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234441AbhKSEjL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 18 Nov 2021 23:39:11 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:57603 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233616AbhKSEjG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Nov 2021 23:39:06 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id 3C0802B0116A;
        Thu, 18 Nov 2021 23:36:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 18 Nov 2021 23:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=LqaqvgQpPtweF
        HVQd3dazqceecIxrVopAAuy10ifbdk=; b=R3yC1xD5vYo0vpDNiBU8ILJ5FslbP
        TjkbO6S+5Oru9i3iZ3XpnlRg/jpv/kOknTJ1bnG91jRpl1RMqZgccmTRp36/AKtp
        NjACy2765zssgA8tplCZNlvAgS03dNbZJji14xc68DHS2K1/4oEuCHwkctOVu5jC
        x8uqDVVgpCP6x0rq3rkRxeOUnvTKf44ksg9NT0hovAlpYCWhUWFDm6XhDiFGT5yK
        7d4pwUpeM/PSAJ5gAuSR7PldxELxgXBqOa1c4MNrg7p+wM7CgXMnuT3cldXgC+GC
        igQRIQGepqHfckJtx49j1O82phSVNXYaAp+ITek7ScwDRHagze/jRBIig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=LqaqvgQpPtweFHVQd3dazqceecIxrVopAAuy10ifbdk=; b=kJMb8u3a
        +jUWloi2ZYF+bnmWlMn9CZBILs4uYkM+n+EE0iUKzZ+S1fEbSuxBdgtFXYoB1trg
        8mBfNYscwqtfjcPNmKlBKH1j6mCiWSEoMKW63ApPtNQg/VslW8szL5ekybh7xM3O
        FnAlfjJ59bJ58VQllacxnouSFyIhGLj6H/idZxEk/+lBHFddcbyywTfd4IXMfUei
        dO+bHn1sxAlAvSFrYCjA220MN3LdWsLRsT4mqsDVAooQqWOIGumfzHmAkz5U3BF1
        t0HsKA9gmrZdZ8eyNot+tnSH8ycBMn7SrosrQAy9C1ptxt8H8u5JVQNPkhgFItI+
        I6q4+UANaNghOQ==
X-ME-Sender: <xms:symXYWZIidZeBcoJWMZyC5QeOUl4trokNizEz3bgGMKTO8H4zAC0yg>
    <xme:symXYZaTfSnBb4veEltPOYuvVJYX_OCi-nBN_Ym4bnDL7cpAPNJ2IdgBFWFm9ZDbn
    iAunJdR4y1JHhGN_w>
X-ME-Received: <xmr:symXYQ_zuJbhhgrl7m1bUubPfbu0V2n0WgNSJeZjKHpxnByIkBudnmtbXeQo4v_3kc2n5eNcnD9nBU01lNjZTHPRMGJt5CJe_TdlKbUY1BHJuQ_m97lc64Or0J7j-t_edaQG8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdejudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepffdtlefgudfghfegteffleevteejjefhkeeljedvvdefteekfeegudei
    feegudejnecuffhomhgrihhnpegtohhmmhhonhdrtghmnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdr
    ohhrgh
X-ME-Proxy: <xmx:symXYYpj1q_tmpMIF32eWnvT25RPUfZH1u6QlTHUWySerEr66LkAjA>
    <xmx:symXYRoiMicZ94nSP0y6bJNdb2c0xeifppHhMlxf7XnBt_p6KGEPfw>
    <xmx:symXYWR92jdDEzBYr8wDRgvsMSLFrHdVrZTgZPfFhf-hAOCiVkVuPg>
    <xmx:symXYehuLRwFxl7rzS4Oaa0NcwzbwVc9BVIm-9F0OFxTfoDtX_ceMSqHvrY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 23:36:03 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-sunxi@lists.linux.dev
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 6/6] clk: sunxi-ng: Add support for the D1 SoC clocks
Date:   Thu, 18 Nov 2021 22:35:44 -0600
Message-Id: <20211119043545.4010-7-samuel@sholland.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211119043545.4010-1-samuel@sholland.org>
References: <20211119043545.4010-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The D1 SoC contains a CCU and a R_CCU (PRCM CCU). Add support for them.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/clk/sunxi-ng/Kconfig           |   10 +
 drivers/clk/sunxi-ng/Makefile          |    4 +
 drivers/clk/sunxi-ng/ccu-sun20i-d1-r.c |  140 +++
 drivers/clk/sunxi-ng/ccu-sun20i-d1-r.h |   17 +
 drivers/clk/sunxi-ng/ccu-sun20i-d1.c   | 1390 ++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun20i-d1.h   |   15 +
 6 files changed, 1576 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun20i-d1-r.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun20i-d1-r.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun20i-d1.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun20i-d1.h

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index 727ff755eca4..68a94e5af8ed 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -12,6 +12,16 @@ config SUNIV_F1C100S_CCU
 	default MACH_SUNIV
 	depends on MACH_SUNIV || COMPILE_TEST
 
+config SUN20I_D1_CCU
+	tristate "Support for the Allwinner D1 CCU"
+	default RISCV && ARCH_SUNXI
+	depends on (RISCV && ARCH_SUNXI) || COMPILE_TEST
+
+config SUN20I_D1_R_CCU
+	tristate "Support for the Allwinner D1 PRCM CCU"
+	default RISCV && ARCH_SUNXI
+	depends on (RISCV && ARCH_SUNXI) || COMPILE_TEST
+
 config SUN50I_A64_CCU
 	tristate "Support for the Allwinner A64 CCU"
 	default ARM64 && ARCH_SUNXI
diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
index 659d55150c32..ec931cb7aa14 100644
--- a/drivers/clk/sunxi-ng/Makefile
+++ b/drivers/clk/sunxi-ng/Makefile
@@ -25,6 +25,8 @@ sunxi-ccu-y			+= ccu_mp.o
 
 # SoC support
 obj-$(CONFIG_SUNIV_F1C100S_CCU)	+= suniv-f1c100s-ccu.o
+obj-$(CONFIG_SUN20I_D1_CCU)	+= sun20i-d1-ccu.o
+obj-$(CONFIG_SUN20I_D1_R_CCU)	+= sun20i-d1-r-ccu.o
 obj-$(CONFIG_SUN50I_A64_CCU)	+= sun50i-a64-ccu.o
 obj-$(CONFIG_SUN50I_A100_CCU)	+= sun50i-a100-ccu.o
 obj-$(CONFIG_SUN50I_A100_R_CCU)	+= sun50i-a100-r-ccu.o
@@ -47,6 +49,8 @@ obj-$(CONFIG_SUN9I_A80_CCU)	+= sun9i-a80-de-ccu.o
 obj-$(CONFIG_SUN9I_A80_CCU)	+= sun9i-a80-usb-ccu.o
 
 suniv-f1c100s-ccu-y		+= ccu-suniv-f1c100s.o
+sun20i-d1-ccu-y			+= ccu-sun20i-d1.o
+sun20i-d1-r-ccu-y		+= ccu-sun20i-d1-r.o
 sun50i-a64-ccu-y		+= ccu-sun50i-a64.o
 sun50i-a100-ccu-y		+= ccu-sun50i-a100.o
 sun50i-a100-r-ccu-y		+= ccu-sun50i-a100-r.o
diff --git a/drivers/clk/sunxi-ng/ccu-sun20i-d1-r.c b/drivers/clk/sunxi-ng/ccu-sun20i-d1-r.c
new file mode 100644
index 000000000000..9d3ffd3fb2c1
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu-sun20i-d1-r.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 huangzhenwei@allwinnertech.com
+ * Copyright (C) 2021 Samuel Holland <samuel@sholland.org>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "ccu_common.h"
+#include "ccu_reset.h"
+
+#include "ccu_gate.h"
+#include "ccu_mp.h"
+
+#include "ccu-sun20i-d1-r.h"
+
+static const struct clk_parent_data r_ahb_apb0_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .fw_name = "losc" },
+	{ .fw_name = "iosc" },
+	{ .fw_name = "pll-periph" },
+};
+static SUNXI_CCU_MP_DATA_WITH_MUX(r_ahb_clk, "r-ahb",
+				  r_ahb_apb0_parents, 0x000,
+				  0, 5,		/* M */
+				  8, 2,		/* P */
+				  24, 3,	/* mux */
+				  0);
+static const struct clk_hw *r_ahb_hw = &r_ahb_clk.common.hw;
+
+static SUNXI_CCU_MP_DATA_WITH_MUX(r_apb0_clk, "r-apb0",
+				  r_ahb_apb0_parents, 0x00c,
+				  0, 5,		/* M */
+				  8, 2,		/* P */
+				  24, 3,	/* mux */
+				  0);
+static const struct clk_hw *r_apb0_hw = &r_apb0_clk.common.hw;
+
+static SUNXI_CCU_GATE_HWS(bus_r_timer_clk,	"bus-r-timer",	&r_apb0_hw,
+			  0x11c, BIT(0), 0);
+static SUNXI_CCU_GATE_HWS(bus_r_twd_clk,	"bus-r-twd",	&r_apb0_hw,
+			  0x12c, BIT(0), 0);
+static SUNXI_CCU_GATE_HWS(bus_r_ppu_clk,	"bus-r-ppu",	&r_apb0_hw,
+			  0x1ac, BIT(0), 0);
+
+static const struct clk_parent_data r_ir_rx_parents[] = {
+	{ .fw_name = "losc" },
+	{ .fw_name = "hosc" },
+};
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(r_ir_rx_clk, "r-ir-rx",
+				       r_ir_rx_parents, 0x1c0,
+				       0, 5,	/* M */
+				       8, 2,	/* P */
+				       24, 2,	/* mux */
+				       BIT(31),	/* gate */
+				       0);
+
+static SUNXI_CCU_GATE_HWS(bus_r_ir_rx_clk,	"bus-r-ir-rx",	&r_apb0_hw,
+			  0x1cc, BIT(0), 0);
+static SUNXI_CCU_GATE_HWS(bus_r_rtc_clk,	"bus-r-rtc",	&r_ahb_hw,
+			  0x20c, BIT(0), 0);
+static SUNXI_CCU_GATE_HWS(bus_r_cpucfg_clk,	"bus-r-cpucfg",	&r_apb0_hw,
+			  0x22c, BIT(0), 0);
+
+static struct ccu_common *sun20i_d1_r_ccu_clks[] = {
+	&r_ahb_clk.common,
+	&r_apb0_clk.common,
+	&bus_r_timer_clk.common,
+	&bus_r_twd_clk.common,
+	&bus_r_ppu_clk.common,
+	&r_ir_rx_clk.common,
+	&bus_r_ir_rx_clk.common,
+	&bus_r_rtc_clk.common,
+	&bus_r_cpucfg_clk.common,
+};
+
+static struct clk_hw_onecell_data sun20i_d1_r_hw_clks = {
+	.num	= CLK_NUMBER,
+	.hws	= {
+		[CLK_R_AHB]		= &r_ahb_clk.common.hw,
+		[CLK_R_APB0]		= &r_apb0_clk.common.hw,
+		[CLK_BUS_R_TIMER]	= &bus_r_timer_clk.common.hw,
+		[CLK_BUS_R_TWD]		= &bus_r_twd_clk.common.hw,
+		[CLK_BUS_R_PPU]		= &bus_r_ppu_clk.common.hw,
+		[CLK_R_IR_RX]		= &r_ir_rx_clk.common.hw,
+		[CLK_BUS_R_IR_RX]	= &bus_r_ir_rx_clk.common.hw,
+		[CLK_BUS_R_RTC]		= &bus_r_rtc_clk.common.hw,
+		[CLK_BUS_R_CPUCFG]	= &bus_r_cpucfg_clk.common.hw,
+	},
+};
+
+static struct ccu_reset_map sun20i_d1_r_ccu_resets[] = {
+	[RST_BUS_R_TIMER]	= { 0x11c, BIT(16) },
+	[RST_BUS_R_TWD]		= { 0x12c, BIT(16) },
+	[RST_BUS_R_PPU]		= { 0x1ac, BIT(16) },
+	[RST_BUS_R_IR_RX]	= { 0x1cc, BIT(16) },
+	[RST_BUS_R_RTC]		= { 0x20c, BIT(16) },
+	[RST_BUS_R_CPUCFG]	= { 0x22c, BIT(16) },
+};
+
+static const struct sunxi_ccu_desc sun20i_d1_r_ccu_desc = {
+	.ccu_clks	= sun20i_d1_r_ccu_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun20i_d1_r_ccu_clks),
+
+	.hw_clks	= &sun20i_d1_r_hw_clks,
+
+	.resets		= sun20i_d1_r_ccu_resets,
+	.num_resets	= ARRAY_SIZE(sun20i_d1_r_ccu_resets),
+};
+
+static int sun20i_d1_r_ccu_probe(struct platform_device *pdev)
+{
+	void __iomem *reg;
+
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
+	return devm_sunxi_ccu_probe(&pdev->dev, reg, &sun20i_d1_r_ccu_desc);
+}
+
+static const struct of_device_id sun20i_d1_r_ccu_ids[] = {
+	{ .compatible = "allwinner,sun20i-d1-r-ccu" },
+	{ }
+};
+
+static struct platform_driver sun20i_d1_r_ccu_driver = {
+	.probe	= sun20i_d1_r_ccu_probe,
+	.driver	= {
+		.name			= "sun20i-d1-r-ccu",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sun20i_d1_r_ccu_ids,
+	},
+};
+module_platform_driver(sun20i_d1_r_ccu_driver);
+
+MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun20i-d1-r.h b/drivers/clk/sunxi-ng/ccu-sun20i-d1-r.h
new file mode 100644
index 000000000000..afd4342209ee
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu-sun20i-d1-r.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 frank@allwinnertech.com
+ * Copyright (C) 2021 Samuel Holland <samuel@sholland.org>
+ */
+
+#ifndef _CCU_SUN20I_D1_R_H
+#define _CCU_SUN20I_D1_R_H
+
+#include <dt-bindings/clock/sun20i-d1-r-ccu.h>
+#include <dt-bindings/reset/sun20i-d1-r-ccu.h>
+
+#define CLK_R_APB0		1
+
+#define CLK_NUMBER		(CLK_BUS_R_CPUCFG + 1)
+
+#endif /* _CCU_SUN20I_D1_R_H */
diff --git a/drivers/clk/sunxi-ng/ccu-sun20i-d1.c b/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
new file mode 100644
index 000000000000..51058ba4db4d
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
@@ -0,0 +1,1390 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 huangzhenwei@allwinnertech.com
+ * Copyright (C) 2021 Samuel Holland <samuel@sholland.org>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "../clk.h"
+
+#include "ccu_common.h"
+#include "ccu_reset.h"
+
+#include "ccu_div.h"
+#include "ccu_gate.h"
+#include "ccu_mp.h"
+#include "ccu_mult.h"
+#include "ccu_nk.h"
+#include "ccu_nkm.h"
+#include "ccu_nkmp.h"
+#include "ccu_nm.h"
+
+#include "ccu-sun20i-d1.h"
+
+static const struct clk_parent_data osc24M[] = {
+	{ .fw_name = "hosc" }
+};
+
+/*
+ * For the CPU PLL, the output divider is described as "only for testing"
+ * in the user manual. So it's not modelled and forced to 0.
+ */
+#define SUN20I_D1_PLL_CPUX_REG		0x000
+static struct ccu_mult pll_cpux_clk = {
+	.enable		= BIT(27),
+	.lock		= BIT(28),
+	.mult		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
+	.common		= {
+		.reg		= 0x000,
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-cpux", osc24M,
+							   &ccu_mult_ops,
+							   CLK_SET_RATE_UNGATE),
+	},
+};
+
+/* Some PLLs are input * N / div1 / P. Model them as NKMP with no K */
+#define SUN20I_D1_PLL_DDR0_REG		0x010
+static struct ccu_nkmp pll_ddr0_clk = {
+	.enable		= BIT(27),
+	.lock		= BIT(28),
+	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
+	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
+	.p		= _SUNXI_CCU_DIV(0, 1), /* output divider */
+	.common		= {
+		.reg		= 0x010,
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-ddr0", osc24M,
+							   &ccu_nkmp_ops,
+							   CLK_SET_RATE_UNGATE),
+	},
+};
+
+#define SUN20I_D1_PLL_PERIPH0_REG	0x020
+static struct ccu_nm pll_periph0_4x_clk = {
+	.enable		= BIT(27),
+	.lock		= BIT(28),
+	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
+	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
+	.common		= {
+		.reg		= 0x020,
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-periph0-4x", osc24M,
+							   &ccu_nm_ops,
+							   CLK_SET_RATE_UNGATE),
+	},
+};
+
+static const struct clk_hw *pll_periph0_4x_hws[] = {
+	&pll_periph0_4x_clk.common.hw
+};
+static SUNXI_CCU_M_HWS(pll_periph0_2x_clk, "pll-periph0-2x",
+		       pll_periph0_4x_hws, 0x020, 16, 3, 0);
+static SUNXI_CCU_M_HWS(pll_periph0_800M_clk, "pll-periph0-800M",
+		       pll_periph0_4x_hws, 0x020, 20, 3, 0);
+
+static const struct clk_hw *pll_periph0_2x_hws[] = {
+	&pll_periph0_2x_clk.common.hw
+};
+static CLK_FIXED_FACTOR_HWS(pll_periph0_clk, "pll-periph0",
+			    pll_periph0_2x_hws, 2, 1, 0);
+
+static const struct clk_hw *pll_periph0_hws[] = { &pll_periph0_clk.hw };
+static CLK_FIXED_FACTOR_HWS(pll_periph0_div3_clk, "pll-periph0-div3",
+			    pll_periph0_2x_hws, 6, 1, 0);
+
+/*
+ * For Video PLLs, the output divider is described as "only for testing"
+ * in the user manual. So it's not modelled and forced to 0.
+ */
+#define SUN20I_D1_PLL_VIDEO0_REG	0x040
+static struct ccu_nm pll_video0_4x_clk = {
+	.enable		= BIT(27),
+	.lock		= BIT(28),
+	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
+	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
+	.common		= {
+		.reg		= 0x040,
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-video0-4x", osc24M,
+							   &ccu_nm_ops,
+							   CLK_SET_RATE_UNGATE),
+	},
+};
+
+static const struct clk_hw *pll_video0_4x_hws[] = {
+	&pll_video0_4x_clk.common.hw
+};
+static CLK_FIXED_FACTOR_HWS(pll_video0_2x_clk, "pll-video0-2x",
+			    pll_video0_4x_hws, 2, 1, CLK_SET_RATE_PARENT);
+static CLK_FIXED_FACTOR_HWS(pll_video0_clk, "pll-video0",
+			    pll_video0_4x_hws, 4, 1, CLK_SET_RATE_PARENT);
+
+#define SUN20I_D1_PLL_VIDEO1_REG	0x048
+static struct ccu_nm pll_video1_4x_clk = {
+	.enable		= BIT(27),
+	.lock		= BIT(28),
+	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
+	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
+	.common		= {
+		.reg		= 0x048,
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-video1-4x", osc24M,
+							   &ccu_nm_ops,
+							   CLK_SET_RATE_UNGATE),
+	},
+};
+
+static const struct clk_hw *pll_video1_4x_hws[] = {
+	&pll_video1_4x_clk.common.hw
+};
+static CLK_FIXED_FACTOR_HWS(pll_video1_2x_clk, "pll-video1-2x",
+			    pll_video1_4x_hws, 2, 1, CLK_SET_RATE_PARENT);
+static CLK_FIXED_FACTOR_HWS(pll_video1_clk, "pll-video1",
+			    pll_video1_4x_hws, 4, 1, CLK_SET_RATE_PARENT);
+
+#define SUN20I_D1_PLL_VE_REG		0x058
+static struct ccu_nkmp pll_ve_clk = {
+	.enable		= BIT(27),
+	.lock		= BIT(28),
+	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
+	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
+	.p		= _SUNXI_CCU_DIV(0, 1), /* output divider */
+	.common		= {
+		.reg		= 0x058,
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-ve", osc24M,
+							   &ccu_nkmp_ops,
+							   CLK_SET_RATE_UNGATE),
+	},
+};
+
+/*
+ * PLL_AUDIO0 has m0, m1 dividers in addition to the usual N, M factors.
+ * Since we only need one frequency from this PLL (22.5792 x 4 == 90.3168 MHz),
+ * ignore them for now. Enforce the default for them, which is m1 = 0, m0 = 0.
+ * The M factor must be an even number to produce a 50% duty cycle output.
+ */
+#define SUN20I_D1_PLL_AUDIO0_REG		0x078
+static struct ccu_sdm_setting pll_audio0_sdm_table[] = {
+	{ .rate = 90316800, .pattern = 0xc001288d, .m = 6, .n = 22 },
+};
+
+static struct ccu_nm pll_audio0_4x_clk = {
+	.enable		= BIT(27),
+	.lock		= BIT(28),
+	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
+	.m		= _SUNXI_CCU_DIV(16, 6),
+	.sdm		= _SUNXI_CCU_SDM(pll_audio0_sdm_table, BIT(24),
+					 0x178, BIT(31)),
+	.common		= {
+		.reg		= 0x078,
+		.features	= CCU_FEATURE_SIGMA_DELTA_MOD,
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-audio0-4x", osc24M,
+							   &ccu_nm_ops,
+							   CLK_SET_RATE_UNGATE),
+	},
+};
+
+static const struct clk_hw *pll_audio0_4x_hws[] = {
+	&pll_audio0_4x_clk.common.hw
+};
+static CLK_FIXED_FACTOR_HWS(pll_audio0_2x_clk, "pll-audio0-2x",
+			    pll_audio0_4x_hws, 2, 1, 0);
+static CLK_FIXED_FACTOR_HWS(pll_audio0_clk, "pll-audio0",
+			    pll_audio0_4x_hws, 4, 1, 0);
+
+/*
+ * PLL_AUDIO1 doesn't need Fractional-N. The output is usually 614.4 MHz for
+ * audio. The ADC or DAC should divide the PLL output further to 24.576 MHz.
+ */
+#define SUN20I_D1_PLL_AUDIO1_REG		0x080
+static struct ccu_nm pll_audio1_clk = {
+	.enable		= BIT(27),
+	.lock		= BIT(28),
+	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
+	.m		= _SUNXI_CCU_DIV(1, 1),
+	.common		= {
+		.reg		= 0x080,
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-audio1", osc24M,
+							   &ccu_nm_ops,
+							   CLK_SET_RATE_UNGATE),
+	},
+};
+
+static const struct clk_hw *pll_audio1_hws[] = {
+	&pll_audio1_clk.common.hw
+};
+static SUNXI_CCU_M_HWS(pll_audio1_div2_clk, "pll-audio1-div2",
+		       pll_audio1_hws, 0x080, 16, 3, 0);
+static SUNXI_CCU_M_HWS(pll_audio1_div5_clk, "pll-audio1-div5",
+		       pll_audio1_hws, 0x080, 20, 3, 0);
+
+/*
+ * The CPUX gate is not modelled - it is in a separate register (0x504)
+ * and has a special key field. The clock does not need to be ungated anyway.
+ */
+static const struct clk_parent_data cpux_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .fw_name = "losc" },
+	{ .fw_name = "iosc" },
+	{ .hw = &pll_cpux_clk.common.hw },
+	{ .hw = &pll_periph0_clk.hw },
+	{ .hw = &pll_periph0_2x_clk.common.hw },
+	{ .hw = &pll_periph0_800M_clk.common.hw },
+};
+static SUNXI_CCU_MUX_DATA(cpux_clk, "cpux", cpux_parents,
+			  0x500, 24, 3, CLK_SET_RATE_PARENT);
+
+static const struct clk_hw *cpux_hws[] = { &cpux_clk.common.hw };
+static SUNXI_CCU_M_HWS(cpux_axi_clk, "cpux-axi",
+		       cpux_hws, 0x500, 0, 2, 0);
+static SUNXI_CCU_M_HWS(cpux_apb_clk, "cpux-apb",
+		       cpux_hws, 0x500, 8, 2, 0);
+
+static const struct clk_parent_data psi_ahb_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .fw_name = "losc" },
+	{ .fw_name = "iosc" },
+	{ .hw = &pll_periph0_clk.hw },
+};
+static SUNXI_CCU_MP_DATA_WITH_MUX(psi_ahb_clk, "psi-ahb", psi_ahb_parents, 0x510,
+				  0, 2,		/* M */
+				  8, 2,		/* P */
+				  24, 2,	/* mux */
+				  0);
+
+static const struct clk_parent_data apb0_apb1_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .fw_name = "losc" },
+	{ .hw = &psi_ahb_clk.common.hw },
+	{ .hw = &pll_periph0_clk.hw },
+};
+static SUNXI_CCU_MP_DATA_WITH_MUX(apb0_clk, "apb0", apb0_apb1_parents, 0x520,
+				  0, 5,		/* M */
+				  8, 2,		/* P */
+				  24, 2,	/* mux */
+				  0);
+
+static SUNXI_CCU_MP_DATA_WITH_MUX(apb1_clk, "apb1", apb0_apb1_parents, 0x524,
+				  0, 5,		/* M */
+				  8, 2,		/* P */
+				  24, 2,	/* mux */
+				  0);
+
+static const struct clk_hw *psi_ahb_hws[] = { &psi_ahb_clk.common.hw };
+static const struct clk_hw *apb0_hws[] = { &apb0_clk.common.hw };
+static const struct clk_hw *apb1_hws[] = { &apb1_clk.common.hw };
+
+static const struct clk_hw *de_di_g2d_parents[] = {
+	&pll_periph0_2x_clk.common.hw,
+	&pll_video0_4x_clk.common.hw,
+	&pll_video1_4x_clk.common.hw,
+	&pll_audio1_div2_clk.common.hw,
+};
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(de_clk, "de", de_di_g2d_parents, 0x600,
+				    0, 5,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    CLK_SET_RATE_PARENT);
+
+static SUNXI_CCU_GATE_HWS(bus_de_clk, "bus-de", psi_ahb_hws,
+			  0x60c, BIT(0), 0);
+
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(di_clk, "di", de_di_g2d_parents, 0x620,
+				    0, 5,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    CLK_SET_RATE_PARENT);
+
+static SUNXI_CCU_GATE_HWS(bus_di_clk, "bus-di", psi_ahb_hws,
+			  0x62c, BIT(0), 0);
+
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(g2d_clk, "g2d", de_di_g2d_parents, 0x630,
+				    0, 5,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    0);
+
+static SUNXI_CCU_GATE_HWS(bus_g2d_clk, "bus-g2d", psi_ahb_hws,
+			  0x63c, BIT(0), 0);
+
+static const struct clk_parent_data ce_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .hw = &pll_periph0_2x_clk.common.hw },
+	{ .hw = &pll_periph0_clk.hw },
+};
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(ce_clk, "ce", ce_parents, 0x680,
+				       0, 4,	/* M */
+				       8, 2,	/* P */
+				       24, 3,	/* mux */
+				       BIT(31),	/* gate */
+				       0);
+
+static SUNXI_CCU_GATE_HWS(bus_ce_clk, "bus-ce", psi_ahb_hws,
+			  0x68c, BIT(0), 0);
+
+static const struct clk_hw *ve_parents[] = {
+	&pll_ve_clk.common.hw,
+	&pll_periph0_2x_clk.common.hw,
+};
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(ve_clk, "ve", ve_parents, 0x690,
+				    0, 5,	/* M */
+				    24, 1,	/* mux */
+				    BIT(31),	/* gate */
+				    CLK_SET_RATE_PARENT);
+
+static SUNXI_CCU_GATE_HWS(bus_ve_clk, "bus-ve", psi_ahb_hws,
+			  0x69c, BIT(0), 0);
+
+static SUNXI_CCU_GATE_HWS(bus_dma_clk, "bus-dma", psi_ahb_hws,
+			  0x70c, BIT(0), 0);
+
+static SUNXI_CCU_GATE_HWS(bus_msgbox0_clk, "bus-msgbox0", psi_ahb_hws,
+			  0x71c, BIT(0), 0);
+static SUNXI_CCU_GATE_HWS(bus_msgbox1_clk, "bus-msgbox1", psi_ahb_hws,
+			  0x71c, BIT(1), 0);
+static SUNXI_CCU_GATE_HWS(bus_msgbox2_clk, "bus-msgbox2", psi_ahb_hws,
+			  0x71c, BIT(2), 0);
+
+static SUNXI_CCU_GATE_HWS(bus_spinlock_clk, "bus-spinlock", psi_ahb_hws,
+			  0x72c, BIT(0), 0);
+
+static SUNXI_CCU_GATE_HWS(bus_hstimer_clk, "bus-hstimer", psi_ahb_hws,
+			  0x73c, BIT(0), 0);
+
+static SUNXI_CCU_GATE_DATA(avs_clk, "avs", osc24M,
+			   0x740, BIT(31), 0);
+
+static SUNXI_CCU_GATE_HWS(bus_dbg_clk, "bus-dbg", psi_ahb_hws,
+			  0x78c, BIT(0), 0);
+
+static SUNXI_CCU_GATE_HWS(bus_pwm_clk, "bus-pwm", apb0_hws,
+			  0x7ac, BIT(0), 0);
+
+static SUNXI_CCU_GATE_HWS(bus_iommu_clk, "bus-iommu", apb0_hws,
+			  0x7bc, BIT(0), 0);
+
+static const struct clk_hw *dram_parents[] = {
+	&pll_ddr0_clk.common.hw,
+	&pll_audio1_div2_clk.common.hw,
+	&pll_periph0_2x_clk.common.hw,
+	&pll_periph0_800M_clk.common.hw,
+};
+static SUNXI_CCU_MP_HW_WITH_MUX_GATE(dram_clk, "dram", dram_parents, 0x800,
+				     0, 2,	/* M */
+				     8, 2,	/* P */
+				     24, 2,	/* mux */
+				     BIT(31), CLK_IS_CRITICAL);
+
+static CLK_FIXED_FACTOR_HW(mbus_clk, "mbus",
+			   &dram_clk.common.hw, 4, 1, 0);
+
+static const struct clk_hw *mbus_hws[] = { &mbus_clk.hw };
+
+static SUNXI_CCU_GATE_HWS(mbus_dma_clk, "mbus-dma", mbus_hws,
+			  0x804, BIT(0), 0);
+static SUNXI_CCU_GATE_HWS(mbus_ve_clk, "mbus-ve", mbus_hws,
+			  0x804, BIT(1), 0);
+static SUNXI_CCU_GATE_HWS(mbus_ce_clk, "mbus-ce", mbus_hws,
+			  0x804, BIT(2), 0);
+static SUNXI_CCU_GATE_HWS(mbus_tvin_clk, "mbus-tvin", mbus_hws,
+			  0x804, BIT(7), 0);
+static SUNXI_CCU_GATE_HWS(mbus_csi_clk, "mbus-csi", mbus_hws,
+			  0x804, BIT(8), 0);
+static SUNXI_CCU_GATE_HWS(mbus_g2d_clk, "mbus-g2d", mbus_hws,
+			  0x804, BIT(10), 0);
+static SUNXI_CCU_GATE_HWS(mbus_riscv_clk, "mbus-riscv", mbus_hws,
+			  0x804, BIT(11), 0);
+
+static SUNXI_CCU_GATE_HWS(bus_dram_clk, "bus-dram", psi_ahb_hws,
+			  0x80c, BIT(0), CLK_IS_CRITICAL);
+
+static const struct clk_parent_data mmc0_mmc1_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .hw = &pll_periph0_clk.hw },
+	{ .hw = &pll_periph0_2x_clk.common.hw },
+	{ .hw = &pll_audio1_div2_clk.common.hw },
+};
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(mmc0_clk, "mmc0", mmc0_mmc1_parents, 0x830,
+				       0, 4,	/* M */
+				       8, 2,	/* P */
+				       24, 3,	/* mux */
+				       BIT(31),	/* gate */
+				       0);
+
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(mmc1_clk, "mmc1", mmc0_mmc1_parents, 0x834,
+				       0, 4,	/* M */
+				       8, 2,	/* P */
+				       24, 3,	/* mux */
+				       BIT(31),	/* gate */
+				       0);
+
+static const struct clk_parent_data mmc2_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .hw = &pll_periph0_clk.hw },
+	{ .hw = &pll_periph0_2x_clk.common.hw },
+	{ .hw = &pll_periph0_800M_clk.common.hw },
+	{ .hw = &pll_audio1_div2_clk.common.hw },
+};
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(mmc2_clk, "mmc2", mmc2_parents, 0x838,
+				       0, 4,	/* M */
+				       8, 2,	/* P */
+				       24, 3,	/* mux */
+				       BIT(31),	/* gate */
+				       0);
+
+static SUNXI_CCU_GATE_HWS(bus_mmc0_clk, "bus-mmc0", psi_ahb_hws,
+			  0x84c, BIT(0), 0);
+static SUNXI_CCU_GATE_HWS(bus_mmc1_clk, "bus-mmc1", psi_ahb_hws,
+			  0x84c, BIT(1), 0);
+static SUNXI_CCU_GATE_HWS(bus_mmc2_clk, "bus-mmc2", psi_ahb_hws,
+			  0x84c, BIT(2), 0);
+
+static SUNXI_CCU_GATE_HWS(bus_uart0_clk, "bus-uart0", apb1_hws,
+			  0x90c, BIT(0), 0);
+static SUNXI_CCU_GATE_HWS(bus_uart1_clk, "bus-uart1", apb1_hws,
+			  0x90c, BIT(1), 0);
+static SUNXI_CCU_GATE_HWS(bus_uart2_clk, "bus-uart2", apb1_hws,
+			  0x90c, BIT(2), 0);
+static SUNXI_CCU_GATE_HWS(bus_uart3_clk, "bus-uart3", apb1_hws,
+			  0x90c, BIT(3), 0);
+static SUNXI_CCU_GATE_HWS(bus_uart4_clk, "bus-uart4", apb1_hws,
+			  0x90c, BIT(4), 0);
+static SUNXI_CCU_GATE_HWS(bus_uart5_clk, "bus-uart5", apb1_hws,
+			  0x90c, BIT(5), 0);
+
+static SUNXI_CCU_GATE_HWS(bus_i2c0_clk, "bus-i2c0", apb1_hws,
+			  0x91c, BIT(0), 0);
+static SUNXI_CCU_GATE_HWS(bus_i2c1_clk, "bus-i2c1", apb1_hws,
+			  0x91c, BIT(1), 0);
+static SUNXI_CCU_GATE_HWS(bus_i2c2_clk, "bus-i2c2", apb1_hws,
+			  0x91c, BIT(2), 0);
+static SUNXI_CCU_GATE_HWS(bus_i2c3_clk, "bus-i2c3", apb1_hws,
+			  0x91c, BIT(3), 0);
+
+static const struct clk_parent_data spi_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .hw = &pll_periph0_clk.hw },
+	{ .hw = &pll_periph0_2x_clk.common.hw },
+	{ .hw = &pll_audio1_div2_clk.common.hw },
+	{ .hw = &pll_audio1_div5_clk.common.hw },
+};
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(spi0_clk, "spi0", spi_parents, 0x940,
+				       0, 4,	/* M */
+				       8, 2,	/* P */
+				       24, 3,	/* mux */
+				       BIT(31),	/* gate */
+				       0);
+
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(spi1_clk, "spi1", spi_parents, 0x944,
+				       0, 4,	/* M */
+				       8, 2,	/* P */
+				       24, 3,	/* mux */
+				       BIT(31),	/* gate */
+				       0);
+
+static SUNXI_CCU_GATE_HWS(bus_spi0_clk, "bus-spi0", psi_ahb_hws,
+			  0x96c, BIT(0), 0);
+static SUNXI_CCU_GATE_HWS(bus_spi1_clk, "bus-spi1", psi_ahb_hws,
+			  0x96c, BIT(1), 0);
+
+static SUNXI_CCU_GATE_HWS_WITH_PREDIV(emac_25M_clk, "emac-25M", pll_periph0_hws,
+				      0x970, BIT(31) | BIT(30), 24, 0);
+
+static SUNXI_CCU_GATE_HWS(bus_emac_clk, "bus-emac", psi_ahb_hws,
+			  0x97c, BIT(0), 0);
+
+static const struct clk_parent_data ir_tx_ledc_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .hw = &pll_periph0_clk.hw },
+};
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(ir_tx_clk, "ir-tx", ir_tx_ledc_parents, 0x9c0,
+				       0, 4,	/* M */
+				       8, 2,	/* P */
+				       24, 3,	/* mux */
+				       BIT(31),	/* gate */
+				       0);
+
+static SUNXI_CCU_GATE_HWS(bus_ir_tx_clk, "bus-ir-tx", apb0_hws,
+			  0x9cc, BIT(0), 0);
+
+static SUNXI_CCU_GATE_HWS(bus_gpadc_clk, "bus-gpadc", apb0_hws,
+			  0x9ec, BIT(0), 0);
+
+static SUNXI_CCU_GATE_HWS(bus_ths_clk, "bus-ths", apb0_hws,
+			  0x9fc, BIT(0), 0);
+
+static const struct clk_hw *i2s_spdif_tx_parents[] = {
+	&pll_audio0_clk.hw,
+	&pll_audio0_4x_clk.common.hw,
+	&pll_audio1_div2_clk.common.hw,
+	&pll_audio1_div5_clk.common.hw,
+};
+static SUNXI_CCU_MP_HW_WITH_MUX_GATE(i2s0_clk, "i2s0", i2s_spdif_tx_parents, 0xa10,
+				     0, 5,	/* M */
+				     8, 2,	/* P */
+				     24, 3,	/* mux */
+				     BIT(31),	/* gate */
+				     0);
+
+static SUNXI_CCU_MP_HW_WITH_MUX_GATE(i2s1_clk, "i2s1", i2s_spdif_tx_parents, 0xa14,
+				     0, 5,	/* M */
+				     8, 2,	/* P */
+				     24, 3,	/* mux */
+				     BIT(31),	/* gate */
+				     0);
+
+static SUNXI_CCU_MP_HW_WITH_MUX_GATE(i2s2_clk, "i2s2", i2s_spdif_tx_parents, 0xa18,
+				     0, 5,	/* M */
+				     8, 2,	/* P */
+				     24, 3,	/* mux */
+				     BIT(31),	/* gate */
+				     0);
+
+static const struct clk_hw *i2s2_asrc_parents[] = {
+	&pll_audio0_4x_clk.common.hw,
+	&pll_periph0_clk.hw,
+	&pll_audio1_div2_clk.common.hw,
+	&pll_audio1_div5_clk.common.hw,
+};
+static SUNXI_CCU_MP_HW_WITH_MUX_GATE(i2s2_asrc_clk, "i2s2-asrc", i2s2_asrc_parents, 0xa1c,
+				     0, 5,	/* M */
+				     8, 2,	/* P */
+				     24, 3,	/* mux */
+				     BIT(31),	/* gate */
+				     0);
+
+static SUNXI_CCU_GATE_HWS(bus_i2s0_clk, "bus-i2s0", apb0_hws,
+			  0xa20, BIT(0), 0);
+static SUNXI_CCU_GATE_HWS(bus_i2s1_clk, "bus-i2s1", apb0_hws,
+			  0xa20, BIT(1), 0);
+static SUNXI_CCU_GATE_HWS(bus_i2s2_clk, "bus-i2s2", apb0_hws,
+			  0xa20, BIT(2), 0);
+
+static SUNXI_CCU_MP_HW_WITH_MUX_GATE(spdif_tx_clk, "spdif-tx", i2s_spdif_tx_parents, 0xa24,
+				     0, 5,	/* M */
+				     8, 2,	/* P */
+				     24, 3,	/* mux */
+				     BIT(31),	/* gate */
+				     0);
+
+static const struct clk_hw *spdif_rx_parents[] = {
+	&pll_periph0_clk.hw,
+	&pll_audio1_div2_clk.common.hw,
+	&pll_audio1_div5_clk.common.hw,
+};
+static SUNXI_CCU_MP_HW_WITH_MUX_GATE(spdif_rx_clk, "spdif-rx", spdif_rx_parents, 0xa28,
+				     0, 5,	/* M */
+				     8, 2,	/* P */
+				     24, 3,	/* mux */
+				     BIT(31),	/* gate */
+				     0);
+
+static SUNXI_CCU_GATE_HWS(bus_spdif_clk, "bus-spdif", apb0_hws,
+			  0xa2c, BIT(0), 0);
+
+static const struct clk_hw *dmic_codec_parents[] = {
+	&pll_audio0_clk.hw,
+	&pll_audio1_div2_clk.common.hw,
+	&pll_audio1_div5_clk.common.hw,
+};
+static SUNXI_CCU_MP_HW_WITH_MUX_GATE(dmic_clk, "dmic", dmic_codec_parents, 0xa40,
+				     0, 5,	/* M */
+				     8, 2,	/* P */
+				     24, 3,	/* mux */
+				     BIT(31),	/* gate */
+				     0);
+
+static SUNXI_CCU_GATE_HWS(bus_dmic_clk, "bus-dmic", apb0_hws,
+			  0xa4c, BIT(0), 0);
+
+static SUNXI_CCU_MP_HW_WITH_MUX_GATE(audio_dac_clk, "audio-dac", dmic_codec_parents, 0xa50,
+				     0, 5,	/* M */
+				     8, 2,	/* P */
+				     24, 3,	/* mux */
+				     BIT(31),	/* gate */
+				     0);
+
+static SUNXI_CCU_MP_HW_WITH_MUX_GATE(audio_adc_clk, "audio-adc", dmic_codec_parents, 0xa54,
+				     0, 5,	/* M */
+				     8, 2,	/* P */
+				     24, 3,	/* mux */
+				     BIT(31),	/* gate */
+				     0);
+
+static SUNXI_CCU_GATE_HWS(bus_audio_clk, "bus-audio", apb0_hws,
+			  0xa5c, BIT(0), 0);
+
+
+/*
+ * The first parent is a 48 MHz input clock divided by 4. That 48 MHz clock is
+ * a 2x multiplier from osc24M synchronized by pll-periph0, and is also used by
+ * the OHCI module.
+ */
+static const struct clk_parent_data usb_ohci_parents[] = {
+	{ .hw = &pll_periph0_clk.hw },
+	{ .fw_name = "hosc" },
+	{ .fw_name = "losc" },
+};
+static const struct ccu_mux_fixed_prediv usb_ohci_predivs[] = {
+	{ .index = 0, .div = 50 },
+	{ .index = 1, .div = 2 },
+};
+
+static struct ccu_mux usb_ohci0_clk = {
+	.enable		= BIT(31),
+	.mux		= {
+		.shift		= 24,
+		.width		= 2,
+		.fixed_predivs	= usb_ohci_predivs,
+		.n_predivs	= ARRAY_SIZE(usb_ohci_predivs),
+	},
+	.common		= {
+		.reg		= 0xa70,
+		.features	= CCU_FEATURE_FIXED_PREDIV,
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("usb-ohci0",
+							   usb_ohci_parents,
+							   &ccu_mux_ops,
+							   0),
+	},
+};
+
+static struct ccu_mux usb_ohci1_clk = {
+	.enable		= BIT(31),
+	.mux		= {
+		.shift		= 24,
+		.width		= 2,
+		.fixed_predivs	= usb_ohci_predivs,
+		.n_predivs	= ARRAY_SIZE(usb_ohci_predivs),
+	},
+	.common		= {
+		.reg		= 0xa74,
+		.features	= CCU_FEATURE_FIXED_PREDIV,
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("usb-ohci1",
+							   usb_ohci_parents,
+							   &ccu_mux_ops,
+							   0),
+	},
+};
+
+static SUNXI_CCU_GATE_HWS(bus_ohci0_clk, "bus-ohci0", psi_ahb_hws,
+			  0xa8c, BIT(0), 0);
+static SUNXI_CCU_GATE_HWS(bus_ohci1_clk, "bus-ohci1", psi_ahb_hws,
+			  0xa8c, BIT(1), 0);
+static SUNXI_CCU_GATE_HWS(bus_ehci0_clk, "bus-ehci0", psi_ahb_hws,
+			  0xa8c, BIT(4), 0);
+static SUNXI_CCU_GATE_HWS(bus_ehci1_clk, "bus-ehci1", psi_ahb_hws,
+			  0xa8c, BIT(5), 0);
+static SUNXI_CCU_GATE_HWS(bus_otg_clk, "bus-otg", psi_ahb_hws,
+			  0xa8c, BIT(8), 0);
+
+static SUNXI_CCU_GATE_HWS(bus_lradc_clk, "bus-lradc", apb0_hws,
+			  0xa9c, BIT(0), 0);
+
+static SUNXI_CCU_GATE_HWS(bus_dpss_top_clk, "bus-dpss-top", psi_ahb_hws,
+			  0xabc, BIT(0), 0);
+
+static SUNXI_CCU_GATE_DATA(hdmi_24M_clk, "hdmi-24M", osc24M,
+			   0xb04, BIT(31), 0);
+
+static SUNXI_CCU_GATE_HWS_WITH_PREDIV(hdmi_cec_32k_clk, "hdmi-cec-32k",
+				      pll_periph0_2x_hws,
+				      0xb10, BIT(30), 36621, 0);
+
+static const struct clk_parent_data hdmi_cec_parents[] = {
+	{ .fw_name = "losc" },
+	{ .hw = &hdmi_cec_32k_clk.common.hw },
+};
+static SUNXI_CCU_MUX_DATA_WITH_GATE(hdmi_cec_clk, "hdmi-cec", hdmi_cec_parents, 0xb10,
+				    24, 1,	/* mux */
+				    BIT(31),	/* gate */
+				    0);
+
+static SUNXI_CCU_GATE_HWS(bus_hdmi_clk, "bus-hdmi", psi_ahb_hws,
+			  0xb1c, BIT(0), 0);
+
+static const struct clk_parent_data mipi_dsi_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .hw = &pll_periph0_clk.hw },
+	{ .hw = &pll_video0_2x_clk.hw },
+	{ .hw = &pll_video1_2x_clk.hw },
+	{ .hw = &pll_audio1_div2_clk.common.hw },
+};
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(mipi_dsi_clk, "mipi-dsi", mipi_dsi_parents, 0xb24,
+				      0, 4,	/* M */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      CLK_SET_RATE_PARENT);
+
+static SUNXI_CCU_GATE_HWS(bus_mipi_dsi_clk, "bus-mipi-dsi", psi_ahb_hws,
+			  0xb4c, BIT(0), 0);
+
+static const struct clk_hw *tcon_tve_parents[] = {
+	&pll_video0_clk.hw,
+	&pll_video0_4x_clk.common.hw,
+	&pll_video1_clk.hw,
+	&pll_video1_4x_clk.common.hw,
+	&pll_periph0_2x_clk.common.hw,
+	&pll_audio1_div2_clk.common.hw,
+};
+static SUNXI_CCU_MP_HW_WITH_MUX_GATE(tcon_lcd0_clk, "tcon-lcd0", tcon_tve_parents, 0xb60,
+				     0, 4,	/* M */
+				     8, 2,	/* P */
+				     24, 3,	/* mux */
+				     BIT(31),	/* gate */
+				     CLK_SET_RATE_PARENT);
+
+static SUNXI_CCU_GATE_HWS(bus_tcon_lcd0_clk, "bus-tcon-lcd0", psi_ahb_hws,
+			  0xb7c, BIT(0), 0);
+
+static SUNXI_CCU_MP_HW_WITH_MUX_GATE(tcon_tv_clk, "tcon-tv", tcon_tve_parents, 0xb80,
+				     0, 4,	/* M */
+				     8, 2,	/* P */
+				     24, 3,	/* mux */
+				     BIT(31),	/* gate */
+				     CLK_SET_RATE_PARENT);
+
+static SUNXI_CCU_GATE_HWS(bus_tcon_tv_clk, "bus-tcon-tv", psi_ahb_hws,
+			  0xb9c, BIT(0), 0);
+
+static SUNXI_CCU_MP_HW_WITH_MUX_GATE(tve_clk, "tve", tcon_tve_parents, 0xbb0,
+				     0, 4,	/* M */
+				     8, 2,	/* P */
+				     24, 3,	/* mux */
+				     BIT(31),	/* gate */
+				     0);
+
+static SUNXI_CCU_GATE_HWS(bus_tve_top_clk, "bus-tve-top", psi_ahb_hws,
+			  0xbbc, BIT(0), 0);
+static SUNXI_CCU_GATE_HWS(bus_tve_clk, "bus-tve", psi_ahb_hws,
+			  0xbbc, BIT(1), 0);
+
+static const struct clk_parent_data tvd_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .hw = &pll_video0_clk.hw },
+	{ .hw = &pll_video1_clk.hw },
+	{ .hw = &pll_periph0_clk.hw },
+};
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(tvd_clk, "tvd", tvd_parents, 0xbc0,
+				      0, 5,	/* M */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+
+static SUNXI_CCU_GATE_HWS(bus_tvd_top_clk, "bus-tvd-top", psi_ahb_hws,
+			  0xbdc, BIT(0), 0);
+static SUNXI_CCU_GATE_HWS(bus_tvd_clk, "bus-tvd", psi_ahb_hws,
+			  0xbdc, BIT(1), 0);
+
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(ledc_clk, "ledc", ir_tx_ledc_parents, 0xbf0,
+				       0, 4,	/* M */
+				       8, 2,	/* P */
+				       24, 1,	/* mux */
+				       BIT(31),	/* gate */
+				       0);
+
+static SUNXI_CCU_GATE_HWS(bus_ledc_clk, "bus-ledc", psi_ahb_hws,
+			  0xbfc, BIT(0), 0);
+
+static const struct clk_hw *csi_top_parents[] = {
+	&pll_periph0_2x_clk.common.hw,
+	&pll_video0_2x_clk.hw,
+	&pll_video1_2x_clk.hw,
+};
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(csi_top_clk, "csi-top", csi_top_parents, 0xc04,
+				    0, 4,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    0);
+
+static const struct clk_parent_data csi_mclk_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .hw = &pll_periph0_clk.hw },
+	{ .hw = &pll_video0_clk.hw },
+	{ .hw = &pll_video1_clk.hw },
+	{ .hw = &pll_audio1_div2_clk.common.hw },
+	{ .hw = &pll_audio1_div5_clk.common.hw },
+};
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(csi_mclk_clk, "csi-mclk", csi_mclk_parents, 0xc08,
+				      0, 5,	/* M */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+
+static SUNXI_CCU_GATE_HWS(bus_csi_clk, "bus-csi", psi_ahb_hws,
+			  0xc1c, BIT(0), 0);
+
+static const struct clk_parent_data tpadc_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .hw = &pll_audio0_clk.hw },
+};
+static SUNXI_CCU_MUX_DATA_WITH_GATE(tpadc_clk, "tpadc", tpadc_parents, 0xc50,
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    0);
+
+static SUNXI_CCU_GATE_HWS(bus_tpadc_clk, "bus-tpadc", apb0_hws,
+			  0xc5c, BIT(0), 0);
+
+static SUNXI_CCU_GATE_HWS(bus_tzma_clk, "bus-tzma", apb0_hws,
+			  0xc6c, BIT(0), 0);
+
+static const struct clk_parent_data dsp_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .fw_name = "losc" },
+	{ .fw_name = "iosc" },
+	{ .hw = &pll_periph0_2x_clk.common.hw },
+	{ .hw = &pll_audio1_div2_clk.common.hw },
+};
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(dsp_clk, "dsp", dsp_parents, 0xc70,
+				      0, 5,	/* M */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+
+static SUNXI_CCU_GATE_HWS(bus_dsp_cfg_clk, "bus-dsp-cfg", psi_ahb_hws,
+			  0xc7c, BIT(1), 0);
+
+/*
+ * The RISC-V gate is not modelled - it is in a separate register (0xd04)
+ * and has a special key field. The clock is critical anyway.
+ */
+static const struct clk_parent_data riscv_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .fw_name = "losc" },
+	{ .fw_name = "iosc" },
+	{ .hw = &pll_periph0_800M_clk.common.hw },
+	{ .hw = &pll_periph0_clk.hw },
+	{ .hw = &pll_cpux_clk.common.hw },
+	{ .hw = &pll_audio1_div2_clk.common.hw },
+};
+static SUNXI_CCU_M_DATA_WITH_MUX(riscv_clk, "riscv", riscv_parents, 0xd00,
+				 0, 5,	/* M */
+				 24, 3,	/* mux */
+				 CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
+
+/* The riscv-axi clk must be divided by at least 2. */
+static struct clk_div_table riscv_axi_table[] = {
+	{ .val = 1, .div = 2 },
+	{ .val = 2, .div = 3 },
+	{ .val = 3, .div = 4 },
+	{ /* Sentinel */ }
+};
+static SUNXI_CCU_DIV_TABLE_HW(riscv_axi_clk, "riscv-axi", &riscv_clk.common.hw,
+			      0xd00, 8, 2, riscv_axi_table, 0);
+
+static SUNXI_CCU_GATE_HWS(bus_riscv_cfg_clk, "bus-riscv-cfg", psi_ahb_hws,
+			  0xd0c, BIT(0), CLK_IS_CRITICAL);
+
+static SUNXI_CCU_GATE_DATA(fanout_24M_clk, "fanout-24M", osc24M,
+			   0xf30, BIT(0), 0);
+static SUNXI_CCU_GATE_DATA_WITH_PREDIV(fanout_12M_clk, "fanout-12M", osc24M,
+				       0xf30, BIT(1), 2, 0);
+static SUNXI_CCU_GATE_HWS_WITH_PREDIV(fanout_16M_clk, "fanout-16M", pll_periph0_2x_hws,
+				      0xf30, BIT(2), 75, 0);
+static SUNXI_CCU_GATE_HWS_WITH_PREDIV(fanout_25M_clk, "fanout-25M", pll_periph0_hws,
+				      0xf30, BIT(3), 24, 0);
+static SUNXI_CCU_GATE_HWS_WITH_PREDIV(fanout_32k_clk, "fanout-32k", pll_periph0_2x_hws,
+				      0xf30, BIT(4), 36621, 0);
+
+/* This clock has a second divider that is not modelled and forced to 0. */
+#define SUN20I_D1_FANOUT_27M_REG	0xf34
+static const struct clk_hw *fanout_27M_parents[] = {
+	&pll_video0_clk.hw,
+	&pll_video1_clk.hw,
+};
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(fanout_27M_clk, "fanout-27M", fanout_27M_parents, 0xf34,
+				    0, 5,	/* M */
+				    24, 2,	/* mux */
+				    BIT(31),	/* gate */
+				    0);
+
+static SUNXI_CCU_M_HWS_WITH_GATE(fanout_pclk_clk, "fanout-pclk", apb0_hws, 0xf38,
+				 0, 5,		/* M */
+				 BIT(31),	/* gate */
+				 0);
+
+static const struct clk_hw *fanout_parents[] = {
+	&fanout_32k_clk.common.hw,
+	&fanout_12M_clk.common.hw,
+	&fanout_16M_clk.common.hw,
+	&fanout_24M_clk.common.hw,
+	&fanout_25M_clk.common.hw,
+	&fanout_27M_clk.common.hw,
+	&fanout_pclk_clk.common.hw,
+};
+static SUNXI_CCU_MUX_HW_WITH_GATE(fanout0_clk, "fanout0", fanout_parents, 0xf3c,
+				  0, 3,		/* mux */
+				  BIT(21),	/* gate */
+				  0);
+static SUNXI_CCU_MUX_HW_WITH_GATE(fanout1_clk, "fanout1", fanout_parents, 0xf3c,
+				  3, 3,		/* mux */
+				  BIT(22),	/* gate */
+				  0);
+static SUNXI_CCU_MUX_HW_WITH_GATE(fanout2_clk, "fanout2", fanout_parents, 0xf3c,
+				  6, 3,		/* mux */
+				  BIT(23),	/* gate */
+				  0);
+
+static struct ccu_common *sun20i_d1_ccu_clks[] = {
+	&pll_cpux_clk.common,
+	&pll_ddr0_clk.common,
+	&pll_periph0_4x_clk.common,
+	&pll_periph0_2x_clk.common,
+	&pll_periph0_800M_clk.common,
+	&pll_video0_4x_clk.common,
+	&pll_video1_4x_clk.common,
+	&pll_ve_clk.common,
+	&pll_audio0_4x_clk.common,
+	&pll_audio1_clk.common,
+	&pll_audio1_div2_clk.common,
+	&pll_audio1_div5_clk.common,
+	&cpux_clk.common,
+	&cpux_axi_clk.common,
+	&cpux_apb_clk.common,
+	&psi_ahb_clk.common,
+	&apb0_clk.common,
+	&apb1_clk.common,
+	&de_clk.common,
+	&bus_de_clk.common,
+	&di_clk.common,
+	&bus_di_clk.common,
+	&g2d_clk.common,
+	&bus_g2d_clk.common,
+	&ce_clk.common,
+	&bus_ce_clk.common,
+	&ve_clk.common,
+	&bus_ve_clk.common,
+	&bus_dma_clk.common,
+	&bus_msgbox0_clk.common,
+	&bus_msgbox1_clk.common,
+	&bus_msgbox2_clk.common,
+	&bus_spinlock_clk.common,
+	&bus_hstimer_clk.common,
+	&avs_clk.common,
+	&bus_dbg_clk.common,
+	&bus_pwm_clk.common,
+	&bus_iommu_clk.common,
+	&dram_clk.common,
+	&mbus_dma_clk.common,
+	&mbus_ve_clk.common,
+	&mbus_ce_clk.common,
+	&mbus_tvin_clk.common,
+	&mbus_csi_clk.common,
+	&mbus_g2d_clk.common,
+	&mbus_riscv_clk.common,
+	&bus_dram_clk.common,
+	&mmc0_clk.common,
+	&mmc1_clk.common,
+	&mmc2_clk.common,
+	&bus_mmc0_clk.common,
+	&bus_mmc1_clk.common,
+	&bus_mmc2_clk.common,
+	&bus_uart0_clk.common,
+	&bus_uart1_clk.common,
+	&bus_uart2_clk.common,
+	&bus_uart3_clk.common,
+	&bus_uart4_clk.common,
+	&bus_uart5_clk.common,
+	&bus_i2c0_clk.common,
+	&bus_i2c1_clk.common,
+	&bus_i2c2_clk.common,
+	&bus_i2c3_clk.common,
+	&spi0_clk.common,
+	&spi1_clk.common,
+	&bus_spi0_clk.common,
+	&bus_spi1_clk.common,
+	&emac_25M_clk.common,
+	&bus_emac_clk.common,
+	&ir_tx_clk.common,
+	&bus_ir_tx_clk.common,
+	&bus_gpadc_clk.common,
+	&bus_ths_clk.common,
+	&i2s0_clk.common,
+	&i2s1_clk.common,
+	&i2s2_clk.common,
+	&i2s2_asrc_clk.common,
+	&bus_i2s0_clk.common,
+	&bus_i2s1_clk.common,
+	&bus_i2s2_clk.common,
+	&spdif_tx_clk.common,
+	&spdif_rx_clk.common,
+	&bus_spdif_clk.common,
+	&dmic_clk.common,
+	&bus_dmic_clk.common,
+	&audio_dac_clk.common,
+	&audio_adc_clk.common,
+	&bus_audio_clk.common,
+	&usb_ohci0_clk.common,
+	&usb_ohci1_clk.common,
+	&bus_ohci0_clk.common,
+	&bus_ohci1_clk.common,
+	&bus_ehci0_clk.common,
+	&bus_ehci1_clk.common,
+	&bus_otg_clk.common,
+	&bus_lradc_clk.common,
+	&bus_dpss_top_clk.common,
+	&hdmi_24M_clk.common,
+	&hdmi_cec_32k_clk.common,
+	&hdmi_cec_clk.common,
+	&bus_hdmi_clk.common,
+	&mipi_dsi_clk.common,
+	&bus_mipi_dsi_clk.common,
+	&tcon_lcd0_clk.common,
+	&bus_tcon_lcd0_clk.common,
+	&tcon_tv_clk.common,
+	&bus_tcon_tv_clk.common,
+	&tve_clk.common,
+	&bus_tve_top_clk.common,
+	&bus_tve_clk.common,
+	&tvd_clk.common,
+	&bus_tvd_top_clk.common,
+	&bus_tvd_clk.common,
+	&ledc_clk.common,
+	&bus_ledc_clk.common,
+	&csi_top_clk.common,
+	&csi_mclk_clk.common,
+	&bus_csi_clk.common,
+	&tpadc_clk.common,
+	&bus_tpadc_clk.common,
+	&bus_tzma_clk.common,
+	&dsp_clk.common,
+	&bus_dsp_cfg_clk.common,
+	&riscv_clk.common,
+	&riscv_axi_clk.common,
+	&bus_riscv_cfg_clk.common,
+	&fanout_24M_clk.common,
+	&fanout_12M_clk.common,
+	&fanout_16M_clk.common,
+	&fanout_25M_clk.common,
+	&fanout_32k_clk.common,
+	&fanout_27M_clk.common,
+	&fanout_pclk_clk.common,
+	&fanout0_clk.common,
+	&fanout1_clk.common,
+	&fanout2_clk.common,
+};
+
+static struct clk_hw_onecell_data sun20i_d1_hw_clks = {
+	.num	= CLK_NUMBER,
+	.hws	= {
+		[CLK_PLL_CPUX]		= &pll_cpux_clk.common.hw,
+		[CLK_PLL_DDR0]		= &pll_ddr0_clk.common.hw,
+		[CLK_PLL_PERIPH0_4X]	= &pll_periph0_4x_clk.common.hw,
+		[CLK_PLL_PERIPH0_2X]	= &pll_periph0_2x_clk.common.hw,
+		[CLK_PLL_PERIPH0_800M]	= &pll_periph0_800M_clk.common.hw,
+		[CLK_PLL_PERIPH0]	= &pll_periph0_clk.hw,
+		[CLK_PLL_PERIPH0_DIV3]	= &pll_periph0_div3_clk.hw,
+		[CLK_PLL_VIDEO0_4X]	= &pll_video0_4x_clk.common.hw,
+		[CLK_PLL_VIDEO0_2X]	= &pll_video0_2x_clk.hw,
+		[CLK_PLL_VIDEO0]	= &pll_video0_clk.hw,
+		[CLK_PLL_VIDEO1_4X]	= &pll_video1_4x_clk.common.hw,
+		[CLK_PLL_VIDEO1_2X]	= &pll_video1_2x_clk.hw,
+		[CLK_PLL_VIDEO1]	= &pll_video1_clk.hw,
+		[CLK_PLL_VE]		= &pll_ve_clk.common.hw,
+		[CLK_PLL_AUDIO0_4X]	= &pll_audio0_4x_clk.common.hw,
+		[CLK_PLL_AUDIO0_2X]	= &pll_audio0_2x_clk.hw,
+		[CLK_PLL_AUDIO0]	= &pll_audio0_clk.hw,
+		[CLK_PLL_AUDIO1]	= &pll_audio1_clk.common.hw,
+		[CLK_PLL_AUDIO1_DIV2]	= &pll_audio1_div2_clk.common.hw,
+		[CLK_PLL_AUDIO1_DIV5]	= &pll_audio1_div5_clk.common.hw,
+		[CLK_CPUX]		= &cpux_clk.common.hw,
+		[CLK_CPUX_AXI]		= &cpux_axi_clk.common.hw,
+		[CLK_CPUX_APB]		= &cpux_apb_clk.common.hw,
+		[CLK_PSI_AHB]		= &psi_ahb_clk.common.hw,
+		[CLK_APB0]		= &apb0_clk.common.hw,
+		[CLK_APB1]		= &apb1_clk.common.hw,
+		[CLK_MBUS]		= &mbus_clk.hw,
+		[CLK_DE]		= &de_clk.common.hw,
+		[CLK_BUS_DE]		= &bus_de_clk.common.hw,
+		[CLK_DI]		= &di_clk.common.hw,
+		[CLK_BUS_DI]		= &bus_di_clk.common.hw,
+		[CLK_G2D]		= &g2d_clk.common.hw,
+		[CLK_BUS_G2D]		= &bus_g2d_clk.common.hw,
+		[CLK_CE]		= &ce_clk.common.hw,
+		[CLK_BUS_CE]		= &bus_ce_clk.common.hw,
+		[CLK_VE]		= &ve_clk.common.hw,
+		[CLK_BUS_VE]		= &bus_ve_clk.common.hw,
+		[CLK_BUS_DMA]		= &bus_dma_clk.common.hw,
+		[CLK_BUS_MSGBOX0]	= &bus_msgbox0_clk.common.hw,
+		[CLK_BUS_MSGBOX1]	= &bus_msgbox1_clk.common.hw,
+		[CLK_BUS_MSGBOX2]	= &bus_msgbox2_clk.common.hw,
+		[CLK_BUS_SPINLOCK]	= &bus_spinlock_clk.common.hw,
+		[CLK_BUS_HSTIMER]	= &bus_hstimer_clk.common.hw,
+		[CLK_AVS]		= &avs_clk.common.hw,
+		[CLK_BUS_DBG]		= &bus_dbg_clk.common.hw,
+		[CLK_BUS_PWM]		= &bus_pwm_clk.common.hw,
+		[CLK_BUS_IOMMU]		= &bus_iommu_clk.common.hw,
+		[CLK_DRAM]		= &dram_clk.common.hw,
+		[CLK_MBUS_DMA]		= &mbus_dma_clk.common.hw,
+		[CLK_MBUS_VE]		= &mbus_ve_clk.common.hw,
+		[CLK_MBUS_CE]		= &mbus_ce_clk.common.hw,
+		[CLK_MBUS_TVIN]		= &mbus_tvin_clk.common.hw,
+		[CLK_MBUS_CSI]		= &mbus_csi_clk.common.hw,
+		[CLK_MBUS_G2D]		= &mbus_g2d_clk.common.hw,
+		[CLK_MBUS_RISCV]	= &mbus_riscv_clk.common.hw,
+		[CLK_BUS_DRAM]		= &bus_dram_clk.common.hw,
+		[CLK_MMC0]		= &mmc0_clk.common.hw,
+		[CLK_MMC1]		= &mmc1_clk.common.hw,
+		[CLK_MMC2]		= &mmc2_clk.common.hw,
+		[CLK_BUS_MMC0]		= &bus_mmc0_clk.common.hw,
+		[CLK_BUS_MMC1]		= &bus_mmc1_clk.common.hw,
+		[CLK_BUS_MMC2]		= &bus_mmc2_clk.common.hw,
+		[CLK_BUS_UART0]		= &bus_uart0_clk.common.hw,
+		[CLK_BUS_UART1]		= &bus_uart1_clk.common.hw,
+		[CLK_BUS_UART2]		= &bus_uart2_clk.common.hw,
+		[CLK_BUS_UART3]		= &bus_uart3_clk.common.hw,
+		[CLK_BUS_UART4]		= &bus_uart4_clk.common.hw,
+		[CLK_BUS_UART5]		= &bus_uart5_clk.common.hw,
+		[CLK_BUS_I2C0]		= &bus_i2c0_clk.common.hw,
+		[CLK_BUS_I2C1]		= &bus_i2c1_clk.common.hw,
+		[CLK_BUS_I2C2]		= &bus_i2c2_clk.common.hw,
+		[CLK_BUS_I2C3]		= &bus_i2c3_clk.common.hw,
+		[CLK_SPI0]		= &spi0_clk.common.hw,
+		[CLK_SPI1]		= &spi1_clk.common.hw,
+		[CLK_BUS_SPI0]		= &bus_spi0_clk.common.hw,
+		[CLK_BUS_SPI1]		= &bus_spi1_clk.common.hw,
+		[CLK_EMAC_25M]		= &emac_25M_clk.common.hw,
+		[CLK_BUS_EMAC]		= &bus_emac_clk.common.hw,
+		[CLK_IR_TX]		= &ir_tx_clk.common.hw,
+		[CLK_BUS_IR_TX]		= &bus_ir_tx_clk.common.hw,
+		[CLK_BUS_GPADC]		= &bus_gpadc_clk.common.hw,
+		[CLK_BUS_THS]		= &bus_ths_clk.common.hw,
+		[CLK_I2S0]		= &i2s0_clk.common.hw,
+		[CLK_I2S1]		= &i2s1_clk.common.hw,
+		[CLK_I2S2]		= &i2s2_clk.common.hw,
+		[CLK_I2S2_ASRC]		= &i2s2_asrc_clk.common.hw,
+		[CLK_BUS_I2S0]		= &bus_i2s0_clk.common.hw,
+		[CLK_BUS_I2S1]		= &bus_i2s1_clk.common.hw,
+		[CLK_BUS_I2S2]		= &bus_i2s2_clk.common.hw,
+		[CLK_SPDIF_TX]		= &spdif_tx_clk.common.hw,
+		[CLK_SPDIF_RX]		= &spdif_rx_clk.common.hw,
+		[CLK_BUS_SPDIF]		= &bus_spdif_clk.common.hw,
+		[CLK_DMIC]		= &dmic_clk.common.hw,
+		[CLK_BUS_DMIC]		= &bus_dmic_clk.common.hw,
+		[CLK_AUDIO_DAC]		= &audio_dac_clk.common.hw,
+		[CLK_AUDIO_ADC]		= &audio_adc_clk.common.hw,
+		[CLK_BUS_AUDIO]		= &bus_audio_clk.common.hw,
+		[CLK_USB_OHCI0]		= &usb_ohci0_clk.common.hw,
+		[CLK_USB_OHCI1]		= &usb_ohci1_clk.common.hw,
+		[CLK_BUS_OHCI0]		= &bus_ohci0_clk.common.hw,
+		[CLK_BUS_OHCI1]		= &bus_ohci1_clk.common.hw,
+		[CLK_BUS_EHCI0]		= &bus_ehci0_clk.common.hw,
+		[CLK_BUS_EHCI1]		= &bus_ehci1_clk.common.hw,
+		[CLK_BUS_OTG]		= &bus_otg_clk.common.hw,
+		[CLK_BUS_LRADC]		= &bus_lradc_clk.common.hw,
+		[CLK_BUS_DPSS_TOP]	= &bus_dpss_top_clk.common.hw,
+		[CLK_HDMI_24M]		= &hdmi_24M_clk.common.hw,
+		[CLK_HDMI_CEC_32K]	= &hdmi_cec_32k_clk.common.hw,
+		[CLK_HDMI_CEC]		= &hdmi_cec_clk.common.hw,
+		[CLK_BUS_HDMI]		= &bus_hdmi_clk.common.hw,
+		[CLK_MIPI_DSI]		= &mipi_dsi_clk.common.hw,
+		[CLK_BUS_MIPI_DSI]	= &bus_mipi_dsi_clk.common.hw,
+		[CLK_TCON_LCD0]		= &tcon_lcd0_clk.common.hw,
+		[CLK_BUS_TCON_LCD0]	= &bus_tcon_lcd0_clk.common.hw,
+		[CLK_TCON_TV]		= &tcon_tv_clk.common.hw,
+		[CLK_BUS_TCON_TV]	= &bus_tcon_tv_clk.common.hw,
+		[CLK_TVE]		= &tve_clk.common.hw,
+		[CLK_BUS_TVE_TOP]	= &bus_tve_top_clk.common.hw,
+		[CLK_BUS_TVE]		= &bus_tve_clk.common.hw,
+		[CLK_TVD]		= &tvd_clk.common.hw,
+		[CLK_BUS_TVD_TOP]	= &bus_tvd_top_clk.common.hw,
+		[CLK_BUS_TVD]		= &bus_tvd_clk.common.hw,
+		[CLK_LEDC]		= &ledc_clk.common.hw,
+		[CLK_BUS_LEDC]		= &bus_ledc_clk.common.hw,
+		[CLK_CSI_TOP]		= &csi_top_clk.common.hw,
+		[CLK_CSI_MCLK]		= &csi_mclk_clk.common.hw,
+		[CLK_BUS_CSI]		= &bus_csi_clk.common.hw,
+		[CLK_TPADC]		= &tpadc_clk.common.hw,
+		[CLK_BUS_TPADC]		= &bus_tpadc_clk.common.hw,
+		[CLK_BUS_TZMA]		= &bus_tzma_clk.common.hw,
+		[CLK_DSP]		= &dsp_clk.common.hw,
+		[CLK_BUS_DSP_CFG]	= &bus_dsp_cfg_clk.common.hw,
+		[CLK_RISCV]		= &riscv_clk.common.hw,
+		[CLK_RISCV_AXI]		= &riscv_axi_clk.common.hw,
+		[CLK_BUS_RISCV_CFG]	= &bus_riscv_cfg_clk.common.hw,
+		[CLK_FANOUT_24M]	= &fanout_24M_clk.common.hw,
+		[CLK_FANOUT_12M]	= &fanout_12M_clk.common.hw,
+		[CLK_FANOUT_16M]	= &fanout_16M_clk.common.hw,
+		[CLK_FANOUT_25M]	= &fanout_25M_clk.common.hw,
+		[CLK_FANOUT_32K]	= &fanout_32k_clk.common.hw,
+		[CLK_FANOUT_27M]	= &fanout_27M_clk.common.hw,
+		[CLK_FANOUT_PCLK]	= &fanout_pclk_clk.common.hw,
+		[CLK_FANOUT0]		= &fanout0_clk.common.hw,
+		[CLK_FANOUT1]		= &fanout1_clk.common.hw,
+		[CLK_FANOUT2]		= &fanout2_clk.common.hw,
+	},
+};
+
+static struct ccu_reset_map sun20i_d1_ccu_resets[] = {
+	[RST_MBUS]		= { 0x540, BIT(30) },
+	[RST_BUS_DE]		= { 0x60c, BIT(16) },
+	[RST_BUS_DI]		= { 0x62c, BIT(16) },
+	[RST_BUS_G2D]		= { 0x63c, BIT(16) },
+	[RST_BUS_CE]		= { 0x68c, BIT(16) },
+	[RST_BUS_VE]		= { 0x69c, BIT(16) },
+	[RST_BUS_DMA]		= { 0x70c, BIT(16) },
+	[RST_BUS_MSGBOX0]	= { 0x71c, BIT(16) },
+	[RST_BUS_MSGBOX1]	= { 0x71c, BIT(17) },
+	[RST_BUS_MSGBOX2]	= { 0x71c, BIT(18) },
+	[RST_BUS_SPINLOCK]	= { 0x72c, BIT(16) },
+	[RST_BUS_HSTIMER]	= { 0x73c, BIT(16) },
+	[RST_BUS_DBG]		= { 0x78c, BIT(16) },
+	[RST_BUS_PWM]		= { 0x7ac, BIT(16) },
+	[RST_BUS_DRAM]		= { 0x80c, BIT(16) },
+	[RST_BUS_MMC0]		= { 0x84c, BIT(16) },
+	[RST_BUS_MMC1]		= { 0x84c, BIT(17) },
+	[RST_BUS_MMC2]		= { 0x84c, BIT(18) },
+	[RST_BUS_UART0]		= { 0x90c, BIT(16) },
+	[RST_BUS_UART1]		= { 0x90c, BIT(17) },
+	[RST_BUS_UART2]		= { 0x90c, BIT(18) },
+	[RST_BUS_UART3]		= { 0x90c, BIT(19) },
+	[RST_BUS_UART4]		= { 0x90c, BIT(20) },
+	[RST_BUS_UART5]		= { 0x90c, BIT(21) },
+	[RST_BUS_I2C0]		= { 0x91c, BIT(16) },
+	[RST_BUS_I2C1]		= { 0x91c, BIT(17) },
+	[RST_BUS_I2C2]		= { 0x91c, BIT(18) },
+	[RST_BUS_I2C3]		= { 0x91c, BIT(19) },
+	[RST_BUS_SPI0]		= { 0x96c, BIT(16) },
+	[RST_BUS_SPI1]		= { 0x96c, BIT(17) },
+	[RST_BUS_EMAC]		= { 0x97c, BIT(16) },
+	[RST_BUS_IR_TX]		= { 0x9cc, BIT(16) },
+	[RST_BUS_GPADC]		= { 0x9ec, BIT(16) },
+	[RST_BUS_THS]		= { 0x9fc, BIT(16) },
+	[RST_BUS_I2S0]		= { 0xa20, BIT(16) },
+	[RST_BUS_I2S1]		= { 0xa20, BIT(17) },
+	[RST_BUS_I2S2]		= { 0xa20, BIT(18) },
+	[RST_BUS_SPDIF]		= { 0xa2c, BIT(16) },
+	[RST_BUS_DMIC]		= { 0xa4c, BIT(16) },
+	[RST_BUS_AUDIO]		= { 0xa5c, BIT(16) },
+	[RST_USB_PHY0]		= { 0xa70, BIT(30) },
+	[RST_USB_PHY1]		= { 0xa74, BIT(30) },
+	[RST_BUS_OHCI0]		= { 0xa8c, BIT(16) },
+	[RST_BUS_OHCI1]		= { 0xa8c, BIT(17) },
+	[RST_BUS_EHCI0]		= { 0xa8c, BIT(20) },
+	[RST_BUS_EHCI1]		= { 0xa8c, BIT(21) },
+	[RST_BUS_OTG]		= { 0xa8c, BIT(24) },
+	[RST_BUS_LRADC]		= { 0xa9c, BIT(16) },
+	[RST_BUS_DPSS_TOP]	= { 0xabc, BIT(16) },
+	[RST_BUS_HDMI_MAIN]	= { 0xb1c, BIT(16) },
+	[RST_BUS_HDMI_SUB]	= { 0xb1c, BIT(17) },
+	[RST_BUS_MIPI_DSI]	= { 0xb4c, BIT(16) },
+	[RST_BUS_TCON_LCD0]	= { 0xb7c, BIT(16) },
+	[RST_BUS_TCON_TV]	= { 0xb9c, BIT(16) },
+	[RST_BUS_LVDS0]		= { 0xbac, BIT(16) },
+	[RST_BUS_TVE_TOP]	= { 0xbbc, BIT(16) },
+	[RST_BUS_TVE]		= { 0xbbc, BIT(17) },
+	[RST_BUS_TVD_TOP]	= { 0xbdc, BIT(16) },
+	[RST_BUS_TVD]		= { 0xbdc, BIT(17) },
+	[RST_BUS_LEDC]		= { 0xbfc, BIT(16) },
+	[RST_BUS_CSI]		= { 0xc1c, BIT(16) },
+	[RST_BUS_TPADC]		= { 0xc5c, BIT(16) },
+	[RST_DSP]		= { 0xc7c, BIT(16) },
+	[RST_BUS_DSP_CFG]	= { 0xc7c, BIT(17) },
+	[RST_BUS_DSP_DBG]	= { 0xc7c, BIT(18) },
+	[RST_BUS_RISCV_CFG]	= { 0xd0c, BIT(16) },
+};
+
+static const struct sunxi_ccu_desc sun20i_d1_ccu_desc = {
+	.ccu_clks	= sun20i_d1_ccu_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun20i_d1_ccu_clks),
+
+	.hw_clks	= &sun20i_d1_hw_clks,
+
+	.resets		= sun20i_d1_ccu_resets,
+	.num_resets	= ARRAY_SIZE(sun20i_d1_ccu_resets),
+};
+
+static const u32 pll_regs[] = {
+	SUN20I_D1_PLL_CPUX_REG,
+	SUN20I_D1_PLL_DDR0_REG,
+	SUN20I_D1_PLL_PERIPH0_REG,
+	SUN20I_D1_PLL_VIDEO0_REG,
+	SUN20I_D1_PLL_VIDEO1_REG,
+	SUN20I_D1_PLL_VE_REG,
+	SUN20I_D1_PLL_AUDIO0_REG,
+	SUN20I_D1_PLL_AUDIO1_REG,
+};
+
+static const u32 pll_video_regs[] = {
+	SUN20I_D1_PLL_VIDEO0_REG,
+	SUN20I_D1_PLL_VIDEO1_REG,
+};
+
+static struct ccu_mux_nb sun20i_d1_riscv_nb = {
+	.common		= &riscv_clk.common,
+	.cm		= &riscv_clk.mux,
+	.delay_us       = 1,
+	.bypass_index   = 4, /* index of pll-periph0 */
+};
+
+static int sun20i_d1_ccu_probe(struct platform_device *pdev)
+{
+	void __iomem *reg;
+	u32 val;
+	int i, ret;
+
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
+	/* Enable the enable, LDO, and lock bits on all PLLs. */
+	for (i = 0; i < ARRAY_SIZE(pll_regs); i++) {
+		val = readl(reg + pll_regs[i]);
+		val |= BIT(31) | BIT(30) | BIT(29);
+		writel(val, reg + pll_regs[i]);
+	}
+
+	/* Force PLL_CPUX factor M to 0. */
+	val = readl(reg + SUN20I_D1_PLL_CPUX_REG);
+	val &= ~GENMASK(1, 0);
+	writel(val, reg + SUN20I_D1_PLL_CPUX_REG);
+
+	/*
+	 * Force the output divider of video PLLs to 0.
+	 *
+	 * See the comment before pll-video0 definition for the reason.
+	 */
+	for (i = 0; i < ARRAY_SIZE(pll_video_regs); i++) {
+		val = readl(reg + pll_video_regs[i]);
+		val &= ~BIT(0);
+		writel(val, reg + pll_video_regs[i]);
+	}
+
+	/* Enforce m1 = 0, m0 = 0 for PLL_AUDIO0 */
+	val = readl(reg + SUN20I_D1_PLL_AUDIO0_REG);
+	val &= ~BIT(1) | BIT(0);
+	writel(val, reg + SUN20I_D1_PLL_AUDIO0_REG);
+
+	/* Force fanout-27M factor N to 0. */
+	val = readl(reg + SUN20I_D1_FANOUT_27M_REG);
+	val &= ~GENMASK(9, 8);
+	writel(val, reg + SUN20I_D1_FANOUT_27M_REG);
+
+	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, &sun20i_d1_ccu_desc);
+	if (ret)
+		return ret;
+
+	/* Reparent CPU during PLL CPUX rate changes */
+	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
+				  &sun20i_d1_riscv_nb);
+
+	return 0;
+}
+
+static const struct of_device_id sun20i_d1_ccu_ids[] = {
+	{ .compatible = "allwinner,sun20i-d1-ccu" },
+	{ }
+};
+
+static struct platform_driver sun20i_d1_ccu_driver = {
+	.probe	= sun20i_d1_ccu_probe,
+	.driver	= {
+		.name			= "sun20i-d1-ccu",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sun20i_d1_ccu_ids,
+	},
+};
+module_platform_driver(sun20i_d1_ccu_driver);
+
+MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun20i-d1.h b/drivers/clk/sunxi-ng/ccu-sun20i-d1.h
new file mode 100644
index 000000000000..e303176f0d4e
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu-sun20i-d1.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 frank@allwinnertech.com
+ * Copyright (C) 2021 Samuel Holland <samuel@sholland.org>
+ */
+
+#ifndef _CCU_SUN20I_D1_H_
+#define _CCU_SUN20I_D1_H_
+
+#include <dt-bindings/clock/sun20i-d1-ccu.h>
+#include <dt-bindings/reset/sun20i-d1-ccu.h>
+
+#define CLK_NUMBER		(CLK_FANOUT2 + 1)
+
+#endif /* _CCU_SUN20I_D1_H_ */
-- 
2.32.0

