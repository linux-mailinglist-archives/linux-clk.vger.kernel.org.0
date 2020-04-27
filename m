Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C101BA6A9
	for <lists+linux-clk@lfdr.de>; Mon, 27 Apr 2020 16:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727842AbgD0Olc (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 27 Apr 2020 10:41:32 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:9685 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727012AbgD0Olc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Apr 2020 10:41:32 -0400
X-IronPort-AV: E=Sophos;i="5.73,324,1583161200"; 
   d="scan'208";a="45623793"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Apr 2020 23:41:30 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 641C940062DE;
        Mon, 27 Apr 2020 23:41:28 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Lad Prabhakar <prabhakar.csengg@gmail.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] clk: renesas: cpg-mssr: Add R8A7742 support
Date:   Mon, 27 Apr 2020 15:41:00 +0100
Message-Id: <1587998460-7804-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add RZ/G1H (R8A7742) Clock Pulse Generator / Module Standby and Software
Reset support, using the CPG/MSSR driver core and the common R-Car Gen2
(and RZ/G) code.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
Changes for v2:
* Dropped zt* clocks
* lb clock is now a base clock
* Fixed clock-sources for scif2/sdhi1/iic2
* Dropped setting div to 3 for zg clock

 drivers/clk/renesas/Kconfig            |   5 +
 drivers/clk/renesas/Makefile           |   1 +
 drivers/clk/renesas/r8a7742-cpg-mssr.c | 275 +++++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h |   1 +
 5 files changed, 288 insertions(+)
 create mode 100644 drivers/clk/renesas/r8a7742-cpg-mssr.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index ac2dd92ce2ef..149787b0005d 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -8,6 +8,7 @@ config CLK_RENESAS
 	select CLK_R7S9210 if ARCH_R7S9210
 	select CLK_R8A73A4 if ARCH_R8A73A4
 	select CLK_R8A7740 if ARCH_R8A7740
+	select CLK_R8A7742 if ARCH_R8A7742
 	select CLK_R8A7743 if ARCH_R8A7743 || ARCH_R8A7744
 	select CLK_R8A7745 if ARCH_R8A7745
 	select CLK_R8A77470 if ARCH_R8A77470
@@ -55,6 +56,10 @@ config CLK_R8A7740
 	select CLK_RENESAS_CPG_MSTP
 	select CLK_RENESAS_DIV6
 
+config CLK_R8A7742
+	bool "RZ/G1H clock support" if COMPILE_TEST
+	select CLK_RCAR_GEN2_CPG
+
 config CLK_R8A7743
 	bool "RZ/G1M clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN2_CPG
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 4a722bc5aac7..a4066f9b34ef 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_CLK_RZA1)			+= clk-rz.o
 obj-$(CONFIG_CLK_R7S9210)		+= r7s9210-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A73A4)		+= clk-r8a73a4.o
 obj-$(CONFIG_CLK_R8A7740)		+= clk-r8a7740.o
+obj-$(CONFIG_CLK_R8A7742)		+= r8a7742-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7743)		+= r8a7743-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7745)		+= r8a7745-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77470)		+= r8a77470-cpg-mssr.o
diff --git a/drivers/clk/renesas/r8a7742-cpg-mssr.c b/drivers/clk/renesas/r8a7742-cpg-mssr.c
new file mode 100644
index 000000000000..1deb68f30da0
--- /dev/null
+++ b/drivers/clk/renesas/r8a7742-cpg-mssr.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * r8a7742 Clock Pulse Generator / Module Standby and Software Reset
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/soc/renesas/rcar-rst.h>
+
+#include <dt-bindings/clock/r8a7742-cpg-mssr.h>
+
+#include "renesas-cpg-mssr.h"
+#include "rcar-gen2-cpg.h"
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R8A7742_CLK_OSC,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+	CLK_USB_EXTAL,
+
+	/* Internal Core Clocks */
+	CLK_MAIN,
+	CLK_PLL0,
+	CLK_PLL1,
+	CLK_PLL3,
+	CLK_PLL1_DIV2,
+
+	/* Module Clocks */
+	MOD_CLK_BASE
+};
+
+static struct cpg_core_clk r8a7742_core_clks[] __initdata = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal",	CLK_EXTAL),
+	DEF_INPUT("usb_extal",	CLK_USB_EXTAL),
+
+	/* Internal Core Clocks */
+	DEF_BASE(".main",	CLK_MAIN, CLK_TYPE_GEN2_MAIN, CLK_EXTAL),
+	DEF_BASE(".pll0",	CLK_PLL0, CLK_TYPE_GEN2_PLL0, CLK_MAIN),
+	DEF_BASE(".pll1",	CLK_PLL1, CLK_TYPE_GEN2_PLL1, CLK_MAIN),
+	DEF_BASE(".pll3",	CLK_PLL3, CLK_TYPE_GEN2_PLL3, CLK_MAIN),
+
+	DEF_FIXED(".pll1_div2",	CLK_PLL1_DIV2, CLK_PLL1, 2, 1),
+
+	/* Core Clock Outputs */
+	DEF_BASE("z",    R8A7742_CLK_Z,    CLK_TYPE_GEN2_Z,	CLK_PLL0),
+	DEF_BASE("lb",   R8A7742_CLK_LB,   CLK_TYPE_GEN2_LB,	CLK_PLL1),
+	DEF_BASE("sdh",  R8A7742_CLK_SDH,  CLK_TYPE_GEN2_SDH,	CLK_PLL1),
+	DEF_BASE("sd0",  R8A7742_CLK_SD0,  CLK_TYPE_GEN2_SD0,	CLK_PLL1),
+	DEF_BASE("sd1",  R8A7742_CLK_SD1,  CLK_TYPE_GEN2_SD1,	CLK_PLL1),
+	DEF_BASE("qspi", R8A7742_CLK_QSPI, CLK_TYPE_GEN2_QSPI,	CLK_PLL1_DIV2),
+	DEF_BASE("rcan", R8A7742_CLK_RCAN, CLK_TYPE_GEN2_RCAN,	CLK_USB_EXTAL),
+
+	DEF_FIXED("z2",    R8A7742_CLK_Z2,	CLK_PLL1,	    2, 1),
+	DEF_FIXED("zg",    R8A7742_CLK_ZG,	CLK_PLL1,	    3, 1),
+	DEF_FIXED("zx",    R8A7742_CLK_ZX,	CLK_PLL1,	    3, 1),
+	DEF_FIXED("zs",    R8A7742_CLK_ZS,	CLK_PLL1,	    6, 1),
+	DEF_FIXED("hp",    R8A7742_CLK_HP,	CLK_PLL1,	   12, 1),
+	DEF_FIXED("b",     R8A7742_CLK_B,	CLK_PLL1,	   12, 1),
+	DEF_FIXED("p",     R8A7742_CLK_P,	CLK_PLL1,	   24, 1),
+	DEF_FIXED("cl",    R8A7742_CLK_CL,	CLK_PLL1,	   48, 1),
+	DEF_FIXED("m2",    R8A7742_CLK_M2,	CLK_PLL1,	    8, 1),
+	DEF_FIXED("zb3",   R8A7742_CLK_ZB3,	CLK_PLL3,	    4, 1),
+	DEF_FIXED("zb3d2", R8A7742_CLK_ZB3D2,	CLK_PLL3,	    8, 1),
+	DEF_FIXED("ddr",   R8A7742_CLK_DDR,	CLK_PLL3,	    8, 1),
+	DEF_FIXED("mp",    R8A7742_CLK_MP,	CLK_PLL1_DIV2,	   15, 1),
+	DEF_FIXED("cp",    R8A7742_CLK_CP,	CLK_EXTAL,	    2, 1),
+	DEF_FIXED("r",     R8A7742_CLK_R,	CLK_PLL1,	49152, 1),
+	DEF_FIXED("osc",   R8A7742_CLK_OSC,	CLK_PLL1,	12288, 1),
+
+	DEF_DIV6P1("sd2",  R8A7742_CLK_SD2,	CLK_PLL1_DIV2,	0x078),
+	DEF_DIV6P1("sd3",  R8A7742_CLK_SD3,	CLK_PLL1_DIV2,	0x26c),
+	DEF_DIV6P1("mmc0", R8A7742_CLK_MMC0,	CLK_PLL1_DIV2,	0x240),
+	DEF_DIV6P1("mmc1", R8A7742_CLK_MMC1,	CLK_PLL1_DIV2,	0x244),
+};
+
+static const struct mssr_mod_clk r8a7742_mod_clks[] __initconst = {
+	DEF_MOD("msiof0",		   0,	R8A7742_CLK_MP),
+	DEF_MOD("vcp1",			 100,	R8A7742_CLK_ZS),
+	DEF_MOD("vcp0",			 101,	R8A7742_CLK_ZS),
+	DEF_MOD("vpc1",			 102,	R8A7742_CLK_ZS),
+	DEF_MOD("vpc0",			 103,	R8A7742_CLK_ZS),
+	DEF_MOD("tmu1",			 111,	R8A7742_CLK_P),
+	DEF_MOD("3dg",			 112,	R8A7742_CLK_ZG),
+	DEF_MOD("2d-dmac",		 115,	R8A7742_CLK_ZS),
+	DEF_MOD("fdp1-2",		 117,	R8A7742_CLK_ZS),
+	DEF_MOD("fdp1-1",		 118,	R8A7742_CLK_ZS),
+	DEF_MOD("fdp1-0",		 119,	R8A7742_CLK_ZS),
+	DEF_MOD("tmu3",			 121,	R8A7742_CLK_P),
+	DEF_MOD("tmu2",			 122,	R8A7742_CLK_P),
+	DEF_MOD("cmt0",			 124,	R8A7742_CLK_R),
+	DEF_MOD("tmu0",			 125,	R8A7742_CLK_CP),
+	DEF_MOD("vsp1du1",		 127,	R8A7742_CLK_ZS),
+	DEF_MOD("vsp1du0",		 128,	R8A7742_CLK_ZS),
+	DEF_MOD("vsp1-sy",		 131,	R8A7742_CLK_ZS),
+	DEF_MOD("scifa2",		 202,	R8A7742_CLK_MP),
+	DEF_MOD("scifa1",		 203,	R8A7742_CLK_MP),
+	DEF_MOD("scifa0",		 204,	R8A7742_CLK_MP),
+	DEF_MOD("msiof2",		 205,	R8A7742_CLK_MP),
+	DEF_MOD("scifb0",		 206,	R8A7742_CLK_MP),
+	DEF_MOD("scifb1",		 207,	R8A7742_CLK_MP),
+	DEF_MOD("msiof1",		 208,	R8A7742_CLK_MP),
+	DEF_MOD("msiof3",		 215,	R8A7742_CLK_MP),
+	DEF_MOD("scifb2",		 216,	R8A7742_CLK_MP),
+	DEF_MOD("sys-dmac1",		 218,	R8A7742_CLK_ZS),
+	DEF_MOD("sys-dmac0",		 219,	R8A7742_CLK_ZS),
+	DEF_MOD("iic2",			 300,	R8A7742_CLK_HP),
+	DEF_MOD("tpu0",			 304,	R8A7742_CLK_CP),
+	DEF_MOD("mmcif1",		 305,	R8A7742_CLK_MMC1),
+	DEF_MOD("scif2",		 310,	R8A7742_CLK_P),
+	DEF_MOD("sdhi3",		 311,	R8A7742_CLK_SD3),
+	DEF_MOD("sdhi2",		 312,	R8A7742_CLK_SD2),
+	DEF_MOD("sdhi1",		 313,	R8A7742_CLK_SD1),
+	DEF_MOD("sdhi0",		 314,	R8A7742_CLK_SD0),
+	DEF_MOD("mmcif0",		 315,	R8A7742_CLK_MMC0),
+	DEF_MOD("iic0",			 318,	R8A7742_CLK_HP),
+	DEF_MOD("pciec",		 319,	R8A7742_CLK_MP),
+	DEF_MOD("iic1",			 323,	R8A7742_CLK_HP),
+	DEF_MOD("usb3.0",		 328,	R8A7742_CLK_MP),
+	DEF_MOD("cmt1",			 329,	R8A7742_CLK_R),
+	DEF_MOD("usbhs-dmac0",		 330,	R8A7742_CLK_HP),
+	DEF_MOD("usbhs-dmac1",		 331,	R8A7742_CLK_HP),
+	DEF_MOD("rwdt",			 402,	R8A7742_CLK_R),
+	DEF_MOD("irqc",			 407,	R8A7742_CLK_CP),
+	DEF_MOD("intc-sys",		 408,	R8A7742_CLK_ZS),
+	DEF_MOD("audio-dmac1",		 501,	R8A7742_CLK_HP),
+	DEF_MOD("audio-dmac0",		 502,	R8A7742_CLK_HP),
+	DEF_MOD("thermal",		 522,	CLK_EXTAL),
+	DEF_MOD("pwm",			 523,	R8A7742_CLK_P),
+	DEF_MOD("usb-ehci",		 703,	R8A7742_CLK_MP),
+	DEF_MOD("usbhs",		 704,	R8A7742_CLK_HP),
+	DEF_MOD("hscif1",		 716,	R8A7742_CLK_ZS),
+	DEF_MOD("hscif0",		 717,	R8A7742_CLK_ZS),
+	DEF_MOD("scif1",		 720,	R8A7742_CLK_P),
+	DEF_MOD("scif0",		 721,	R8A7742_CLK_P),
+	DEF_MOD("du2",			 722,	R8A7742_CLK_ZX),
+	DEF_MOD("du1",			 723,	R8A7742_CLK_ZX),
+	DEF_MOD("du0",			 724,	R8A7742_CLK_ZX),
+	DEF_MOD("lvds1",		 725,	R8A7742_CLK_ZX),
+	DEF_MOD("lvds0",		 726,	R8A7742_CLK_ZX),
+	DEF_MOD("r-gp2d",		 807,	R8A7742_CLK_ZX),
+	DEF_MOD("vin3",			 808,	R8A7742_CLK_ZG),
+	DEF_MOD("vin2",			 809,	R8A7742_CLK_ZG),
+	DEF_MOD("vin1",			 810,	R8A7742_CLK_ZG),
+	DEF_MOD("vin0",			 811,	R8A7742_CLK_ZG),
+	DEF_MOD("etheravb",		 812,	R8A7742_CLK_HP),
+	DEF_MOD("ether",		 813,	R8A7742_CLK_P),
+	DEF_MOD("sata1",		 814,	R8A7742_CLK_ZS),
+	DEF_MOD("sata0",		 815,	R8A7742_CLK_ZS),
+	DEF_MOD("imr-x2-1",		 820,	R8A7742_CLK_ZG),
+	DEF_MOD("imr-x2-0",		 821,	R8A7742_CLK_HP),
+	DEF_MOD("imr-lsx2-1",		 822,	R8A7742_CLK_P),
+	DEF_MOD("imr-lsx2-0",		 823,	R8A7742_CLK_ZS),
+	DEF_MOD("gpio5",		 907,	R8A7742_CLK_CP),
+	DEF_MOD("gpio4",		 908,	R8A7742_CLK_CP),
+	DEF_MOD("gpio3",		 909,	R8A7742_CLK_CP),
+	DEF_MOD("gpio2",		 910,	R8A7742_CLK_CP),
+	DEF_MOD("gpio1",		 911,	R8A7742_CLK_CP),
+	DEF_MOD("gpio0",		 912,	R8A7742_CLK_CP),
+	DEF_MOD("can1",			 915,	R8A7742_CLK_P),
+	DEF_MOD("can0",			 916,	R8A7742_CLK_P),
+	DEF_MOD("qspi_mod",		 917,	R8A7742_CLK_QSPI),
+	DEF_MOD("iicdvfs",		 926,	R8A7742_CLK_CP),
+	DEF_MOD("i2c3",			 928,	R8A7742_CLK_HP),
+	DEF_MOD("i2c2",			 929,	R8A7742_CLK_HP),
+	DEF_MOD("i2c1",			 930,	R8A7742_CLK_HP),
+	DEF_MOD("i2c0",			 931,	R8A7742_CLK_HP),
+	DEF_MOD("ssi-all",		1005,	R8A7742_CLK_P),
+	DEF_MOD("ssi9",			1006,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi8",			1007,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi7",			1008,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi6",			1009,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi5",			1010,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi4",			1011,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi3",			1012,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi2",			1013,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi1",			1014,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi0",			1015,	MOD_CLK_ID(1005)),
+	DEF_MOD("scu-all",		1017,	R8A7742_CLK_P),
+	DEF_MOD("scu-dvc1",		1018,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-dvc0",		1019,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-ctu1-mix1",	1020,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-ctu0-mix0",	1021,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src9",		1022,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src8",		1023,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src7",		1024,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src6",		1025,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src5",		1026,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src4",		1027,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src3",		1028,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src2",		1029,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src1",		1030,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src0",		1031,	MOD_CLK_ID(1017)),
+};
+
+static const unsigned int r8a7742_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+	MOD_CLK_ID(408),	/* INTC-SYS (GIC) */
+};
+
+/*
+ * CPG Clock Data
+ */
+
+/*
+ *    MD	EXTAL		PLL0	PLL1	PLL3
+ * 14 13 19	(MHz)		*1	*1
+ *---------------------------------------------------
+ * 0  0  0	15		x172/2	x208/2	x106
+ * 0  0  1	15		x172/2	x208/2	x88
+ * 0  1  0	20		x130/2	x156/2	x80
+ * 0  1  1	20		x130/2	x156/2	x66
+ * 1  0  0	26 / 2		x200/2	x240/2	x122
+ * 1  0  1	26 / 2		x200/2	x240/2	x102
+ * 1  1  0	30 / 2		x172/2	x208/2	x106
+ * 1  1  1	30 / 2		x172/2	x208/2	x88
+ *
+ * *1 :	Table 7.5a indicates VCO output (PLLx = VCO/2)
+ */
+#define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 12) | \
+					 (((md) & BIT(13)) >> 12) | \
+					 (((md) & BIT(19)) >> 19))
+
+static const struct rcar_gen2_cpg_pll_config cpg_pll_configs[8] __initconst = {
+	/* EXTAL div	PLL1 mult	PLL3 mult */
+	{ 1,		208,		106,	},
+	{ 1,		208,		88,	},
+	{ 1,		156,		80,	},
+	{ 1,		156,		66,	},
+	{ 2,		240,		122,	},
+	{ 2,		240,		102,	},
+	{ 2,		208,		106,	},
+	{ 2,		208,		88,	},
+};
+
+static int __init r8a7742_cpg_mssr_init(struct device *dev)
+{
+	const struct rcar_gen2_cpg_pll_config *cpg_pll_config;
+	u32 cpg_mode;
+	int error;
+
+	error = rcar_rst_read_mode_pins(&cpg_mode);
+	if (error)
+		return error;
+
+	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
+
+	return rcar_gen2_cpg_init(cpg_pll_config, 2, cpg_mode);
+}
+
+const struct cpg_mssr_info r8a7742_cpg_mssr_info __initconst = {
+	/* Core Clocks */
+	.core_clks = r8a7742_core_clks,
+	.num_core_clks = ARRAY_SIZE(r8a7742_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Module Clocks */
+	.mod_clks = r8a7742_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r8a7742_mod_clks),
+	.num_hw_mod_clks = 12 * 32,
+
+	/* Critical Module Clocks */
+	.crit_mod_clks = r8a7742_crit_mod_clks,
+	.num_crit_mod_clks = ARRAY_SIZE(r8a7742_crit_mod_clks),
+
+	/* Callbacks */
+	.init = r8a7742_cpg_mssr_init,
+	.cpg_clk_register = rcar_gen2_cpg_clk_register,
+};
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index a2663fbbd7a5..8f6dff362869 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -673,6 +673,12 @@ static const struct of_device_id cpg_mssr_match[] = {
 		.data = &r7s9210_cpg_mssr_info,
 	},
 #endif
+#ifdef CONFIG_CLK_R8A7742
+	{
+		.compatible = "renesas,r8a7742-cpg-mssr",
+		.data = &r8a7742_cpg_mssr_info,
+	},
+#endif
 #ifdef CONFIG_CLK_R8A7743
 	{
 		.compatible = "renesas,r8a7743-cpg-mssr",
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 3b852ba0ecec..55a18ef0efaf 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -155,6 +155,7 @@ struct cpg_mssr_info {
 };
 
 extern const struct cpg_mssr_info r7s9210_cpg_mssr_info;
+extern const struct cpg_mssr_info r8a7742_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7743_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7745_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77470_cpg_mssr_info;
-- 
2.17.1

