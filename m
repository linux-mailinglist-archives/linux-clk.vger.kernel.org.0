Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9742D959E
	for <lists+linux-clk@lfdr.de>; Mon, 14 Dec 2020 10:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393955AbgLNJ6m (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 14 Dec 2020 04:58:42 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9602 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727309AbgLNJ62 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Dec 2020 04:58:28 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CvcHV2XcDzM5hv;
        Mon, 14 Dec 2020 17:56:54 +0800 (CST)
Received: from huawei.com (10.151.151.249) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Mon, 14 Dec 2020
 17:57:33 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <vkoul@kernel.org>,
        <dan.j.williams@intel.com>, <p.zabel@pengutronix.de>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <gengdongjiu@huawei.com>
Subject: [PATCH v7 2/4] clk: hisilicon: Add clock driver for hi3559A SoC
Date:   Tue, 15 Dec 2020 11:09:45 +0000
Message-ID: <20201215110947.41268-3-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215110947.41268-1-gengdongjiu@huawei.com>
References: <20201215110947.41268-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.249]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clock drivers for hi3559A SoC, this driver
controls the SoC registers to supply different
clocks to different IPs in the SoC.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 drivers/clk/hisilicon/Kconfig       |   7 +
 drivers/clk/hisilicon/Makefile      |   1 +
 drivers/clk/hisilicon/clk-hi3559a.c | 865 ++++++++++++++++++++++++++++
 3 files changed, 873 insertions(+)
 create mode 100644 drivers/clk/hisilicon/clk-hi3559a.c

diff --git a/drivers/clk/hisilicon/Kconfig b/drivers/clk/hisilicon/Kconfig
index 6a9e93a0bb95..5ecc37aaa118 100644
--- a/drivers/clk/hisilicon/Kconfig
+++ b/drivers/clk/hisilicon/Kconfig
@@ -15,6 +15,13 @@ config COMMON_CLK_HI3519
 	help
 	  Build the clock driver for hi3519.
 
+config COMMON_CLK_HI3559A
+	bool "Hi3559A Clock Driver"
+	depends on ARCH_HISI || COMPILE_TEST
+	default ARCH_HISI
+	help
+	  Build the clock driver for hi3559a.
+
 config COMMON_CLK_HI3660
 	bool "Hi3660 Clock Driver"
 	depends on ARCH_HISI || COMPILE_TEST
diff --git a/drivers/clk/hisilicon/Makefile b/drivers/clk/hisilicon/Makefile
index b2441b99f3d5..bc101833b35e 100644
--- a/drivers/clk/hisilicon/Makefile
+++ b/drivers/clk/hisilicon/Makefile
@@ -17,3 +17,4 @@ obj-$(CONFIG_COMMON_CLK_HI6220)	+= clk-hi6220.o
 obj-$(CONFIG_RESET_HISI)	+= reset.o
 obj-$(CONFIG_STUB_CLK_HI6220)	+= clk-hi6220-stub.o
 obj-$(CONFIG_STUB_CLK_HI3660)	+= clk-hi3660-stub.o
+obj-$(CONFIG_COMMON_CLK_HI3559A)	+= clk-hi3559a.o
diff --git a/drivers/clk/hisilicon/clk-hi3559a.c b/drivers/clk/hisilicon/clk-hi3559a.c
new file mode 100644
index 000000000000..d7693e488006
--- /dev/null
+++ b/drivers/clk/hisilicon/clk-hi3559a.c
@@ -0,0 +1,865 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Hisilicon Hi3559A clock driver
+ *
+ * Copyright (c) 2019-2020, Huawei Tech. Co., Ltd.
+ *
+ * Author: Dongjiu Geng <gengdongjiu@huawei.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/clock/hi3559av100-clock.h>
+
+#include "clk.h"
+#include "crg.h"
+#include "reset.h"
+
+#define CRG_BASE_ADDR  0x18020000
+
+struct hi3559av100_pll_clock {
+	u32	id;
+	const char  *name;
+	const char  *parent_name;
+	u32	ctrl_reg1;
+	u8	frac_shift;
+	u8	frac_width;
+	u8	postdiv1_shift;
+	u8	postdiv1_width;
+	u8	postdiv2_shift;
+	u8	postdiv2_width;
+	u32	ctrl_reg2;
+	u8	fbdiv_shift;
+	u8	fbdiv_width;
+	u8	refdiv_shift;
+	u8	refdiv_width;
+};
+
+struct hi3559av100_clk_pll {
+	struct clk_hw	hw;
+	u32	id;
+	void __iomem	*ctrl_reg1;
+	u8	frac_shift;
+	u8	frac_width;
+	u8	postdiv1_shift;
+	u8	postdiv1_width;
+	u8	postdiv2_shift;
+	u8	postdiv2_width;
+	void __iomem	*ctrl_reg2;
+	u8	fbdiv_shift;
+	u8	fbdiv_width;
+	u8	refdiv_shift;
+	u8	refdiv_width;
+};
+
+/* soc clk config */
+static const struct hisi_fixed_rate_clock hi3559av100_fixed_rate_clks_crg[] = {
+	{ HI3559AV100_FIXED_1188M, "1188m",   NULL, 0, 1188000000, },
+	{ HI3559AV100_FIXED_1000M, "1000m",   NULL, 0, 1000000000, },
+	{ HI3559AV100_FIXED_842M, "842m",    NULL, 0, 842000000, },
+	{ HI3559AV100_FIXED_792M, "792m",    NULL, 0, 792000000, },
+	{ HI3559AV100_FIXED_750M, "750m",    NULL, 0, 750000000, },
+	{ HI3559AV100_FIXED_710M, "710m",    NULL, 0, 710000000, },
+	{ HI3559AV100_FIXED_680M, "680m",    NULL, 0, 680000000, },
+	{ HI3559AV100_FIXED_667M, "667m",    NULL, 0, 667000000, },
+	{ HI3559AV100_FIXED_631M, "631m",    NULL, 0, 631000000, },
+	{ HI3559AV100_FIXED_600M, "600m",    NULL, 0, 600000000, },
+	{ HI3559AV100_FIXED_568M, "568m",    NULL, 0, 568000000, },
+	{ HI3559AV100_FIXED_500M, "500m",    NULL, 0, 500000000, },
+	{ HI3559AV100_FIXED_475M, "475m",    NULL, 0, 475000000, },
+	{ HI3559AV100_FIXED_428M, "428m",    NULL, 0, 428000000, },
+	{ HI3559AV100_FIXED_400M, "400m",    NULL, 0, 400000000, },
+	{ HI3559AV100_FIXED_396M, "396m",    NULL, 0, 396000000, },
+	{ HI3559AV100_FIXED_300M, "300m",    NULL, 0, 300000000, },
+	{ HI3559AV100_FIXED_250M, "250m",    NULL, 0, 250000000, },
+	{ HI3559AV100_FIXED_200M, "200m",    NULL, 0, 200000000, },
+	{ HI3559AV100_FIXED_198M, "198m",    NULL, 0, 198000000, },
+	{ HI3559AV100_FIXED_187p5M, "187p5m",  NULL, 0, 187500000, },
+	{ HI3559AV100_FIXED_150M, "150m",    NULL, 0, 150000000, },
+	{ HI3559AV100_FIXED_148p5M, "148p5m",  NULL, 0, 1485000000, },
+	{ HI3559AV100_FIXED_125M, "125m",    NULL, 0, 125000000, },
+	{ HI3559AV100_FIXED_107M, "107m",    NULL, 0, 107000000, },
+	{ HI3559AV100_FIXED_100M, "100m",    NULL, 0, 100000000, },
+	{ HI3559AV100_FIXED_99M, "99m",     NULL, 0, 99000000, },
+	{ HI3559AV100_FIXED_75M, "75m",  NULL, 0, 75000000, },
+	{ HI3559AV100_FIXED_74p25M, "74p25m",  NULL, 0, 74250000, },
+	{ HI3559AV100_FIXED_72M, "72m",     NULL, 0, 72000000, },
+	{ HI3559AV100_FIXED_60M, "60m",     NULL, 0, 60000000, },
+	{ HI3559AV100_FIXED_54M, "54m",     NULL, 0, 54000000, },
+	{ HI3559AV100_FIXED_50M, "50m",     NULL, 0, 50000000, },
+	{ HI3559AV100_FIXED_49p5M, "49p5m",   NULL, 0, 49500000, },
+	{ HI3559AV100_FIXED_37p125M, "37p125m", NULL, 0, 37125000, },
+	{ HI3559AV100_FIXED_36M, "36m",     NULL, 0, 36000000, },
+	{ HI3559AV100_FIXED_32p4M, "32p4m",   NULL, 0, 32400000, },
+	{ HI3559AV100_FIXED_27M, "27m",     NULL, 0, 27000000, },
+	{ HI3559AV100_FIXED_25M, "25m",     NULL, 0, 25000000, },
+	{ HI3559AV100_FIXED_24M, "24m",     NULL, 0, 24000000, },
+	{ HI3559AV100_FIXED_12M, "12m",     NULL, 0, 12000000, },
+	{ HI3559AV100_FIXED_3M,	 "3m",      NULL, 0, 3000000, },
+	{ HI3559AV100_FIXED_1p6M, "1p6m",    NULL, 0, 1600000, },
+	{ HI3559AV100_FIXED_400K, "400k",    NULL, 0, 400000, },
+	{ HI3559AV100_FIXED_100K, "100k",    NULL, 0, 100000, },
+};
+
+
+static const char *fmc_mux_p[] __initconst = {
+	"24m", "75m", "125m", "150m", "200m", "250m", "300m", "400m"
+};
+static u32 fmc_mux_table[] = {0, 1, 2, 3, 4, 5, 6, 7};
+
+static const char *mmc_mux_p[] __initconst = {
+	"100k", "25m", "49p5m", "99m", "187p5m", "150m", "198m", "400k"
+};
+static u32 mmc_mux_table[] = {0, 1, 2, 3, 4, 5, 6, 7};
+
+static const char *sysapb_mux_p[] __initconst = {
+	"24m", "50m",
+};
+static u32 sysapb_mux_table[] = {0, 1};
+
+static const char *sysbus_mux_p[] __initconst = {
+	"24m", "300m"
+};
+static u32 sysbus_mux_table[] = {0, 1};
+
+static const char *uart_mux_p[] __initconst = {"50m", "24m", "3m"};
+static u32 uart_mux_table[] = {0, 1, 2};
+
+static const char *a73_clksel_mux_p[] __initconst = {
+	"24m", "apll", "1000m"
+};
+static u32 a73_clksel_mux_table[] = {0, 1, 2};
+
+static struct hisi_mux_clock hi3559av100_mux_clks_crg[] __initdata = {
+	{
+		HI3559AV100_FMC_MUX, "fmc_mux", fmc_mux_p, ARRAY_SIZE(fmc_mux_p),
+		CLK_SET_RATE_PARENT, 0x170, 2, 3, 0, fmc_mux_table,
+	},
+	{
+		HI3559AV100_MMC0_MUX, "mmc0_mux", mmc_mux_p, ARRAY_SIZE(mmc_mux_p),
+		CLK_SET_RATE_PARENT, 0x1a8, 24, 3, 0, mmc_mux_table,
+	},
+	{
+		HI3559AV100_MMC1_MUX, "mmc1_mux", mmc_mux_p, ARRAY_SIZE(mmc_mux_p),
+		CLK_SET_RATE_PARENT, 0x1ec, 24, 3, 0, mmc_mux_table,
+	},
+
+	{
+		HI3559AV100_MMC2_MUX, "mmc2_mux", mmc_mux_p, ARRAY_SIZE(mmc_mux_p),
+		CLK_SET_RATE_PARENT, 0x214, 24, 3, 0, mmc_mux_table,
+	},
+
+	{
+		HI3559AV100_MMC3_MUX, "mmc3_mux", mmc_mux_p, ARRAY_SIZE(mmc_mux_p),
+		CLK_SET_RATE_PARENT, 0x23c, 24, 3, 0, mmc_mux_table,
+	},
+
+	{
+		HI3559AV100_SYSAPB_MUX, "sysapb_mux", sysapb_mux_p, ARRAY_SIZE(sysapb_mux_p),
+		CLK_SET_RATE_PARENT, 0xe8, 3, 1, 0, sysapb_mux_table
+	},
+
+	{
+		HI3559AV100_SYSBUS_MUX, "sysbus_mux", sysbus_mux_p, ARRAY_SIZE(sysbus_mux_p),
+		CLK_SET_RATE_PARENT, 0xe8, 0, 1, 0, sysbus_mux_table
+	},
+
+	{
+		HI3559AV100_UART_MUX, "uart_mux", uart_mux_p, ARRAY_SIZE(uart_mux_p),
+		CLK_SET_RATE_PARENT, 0x198, 28, 2, 0, uart_mux_table
+	},
+
+	{
+		HI3559AV100_A73_MUX, "a73_mux", a73_clksel_mux_p, ARRAY_SIZE(a73_clksel_mux_p),
+		CLK_SET_RATE_PARENT, 0xe4, 0, 2, 0, a73_clksel_mux_table
+	},
+};
+
+static struct hisi_fixed_factor_clock hi3559av100_fixed_factor_clks[] __initdata
+	= {
+};
+
+static struct hisi_gate_clock hi3559av100_gate_clks[] __initdata = {
+	{
+		HI3559AV100_FMC_CLK, "clk_fmc", "fmc_mux",
+		CLK_SET_RATE_PARENT, 0x170, 1, 0,
+	},
+	{
+		HI3559AV100_MMC0_CLK, "clk_mmc0", "mmc0_mux",
+		CLK_SET_RATE_PARENT, 0x1a8, 28, 0,
+	},
+	{
+		HI3559AV100_MMC1_CLK, "clk_mmc1", "mmc1_mux",
+		CLK_SET_RATE_PARENT, 0x1ec, 28, 0,
+	},
+	{
+		HI3559AV100_MMC2_CLK, "clk_mmc2", "mmc2_mux",
+		CLK_SET_RATE_PARENT, 0x214, 28, 0,
+	},
+	{
+		HI3559AV100_MMC3_CLK, "clk_mmc3", "mmc3_mux",
+		CLK_SET_RATE_PARENT, 0x23c, 28, 0,
+	},
+	{
+		HI3559AV100_UART0_CLK, "clk_uart0", "uart_mux",
+		CLK_SET_RATE_PARENT, 0x198, 23, 0,
+	},
+	{
+		HI3559AV100_UART1_CLK, "clk_uart1", "uart_mux",
+		CLK_SET_RATE_PARENT, 0x198, 24, 0,
+	},
+	{
+		HI3559AV100_UART2_CLK, "clk_uart2", "uart_mux",
+		CLK_SET_RATE_PARENT, 0x198, 25, 0,
+	},
+	{
+		HI3559AV100_UART3_CLK, "clk_uart3", "uart_mux",
+		CLK_SET_RATE_PARENT, 0x198, 26, 0,
+	},
+	{
+		HI3559AV100_UART4_CLK, "clk_uart4", "uart_mux",
+		CLK_SET_RATE_PARENT, 0x198, 27, 0,
+	},
+	{
+		HI3559AV100_ETH_CLK, "clk_eth", NULL,
+		CLK_SET_RATE_PARENT, 0x0174, 1, 0,
+	},
+	{
+		HI3559AV100_ETH_MACIF_CLK, "clk_eth_macif", NULL,
+		CLK_SET_RATE_PARENT, 0x0174, 5, 0,
+	},
+	{
+		HI3559AV100_ETH1_CLK, "clk_eth1", NULL,
+		CLK_SET_RATE_PARENT, 0x0174, 3, 0,
+	},
+	{
+		HI3559AV100_ETH1_MACIF_CLK, "clk_eth1_macif", NULL,
+		CLK_SET_RATE_PARENT, 0x0174, 7, 0,
+	},
+	{
+		HI3559AV100_I2C0_CLK, "clk_i2c0", "50m",
+		CLK_SET_RATE_PARENT, 0x01a0, 16, 0,
+	},
+	{
+		HI3559AV100_I2C1_CLK, "clk_i2c1", "50m",
+		CLK_SET_RATE_PARENT, 0x01a0, 17, 0,
+	},
+	{
+		HI3559AV100_I2C2_CLK, "clk_i2c2", "50m",
+		CLK_SET_RATE_PARENT, 0x01a0, 18, 0,
+	},
+	{
+		HI3559AV100_I2C3_CLK, "clk_i2c3", "50m",
+		CLK_SET_RATE_PARENT, 0x01a0, 19, 0,
+	},
+	{
+		HI3559AV100_I2C4_CLK, "clk_i2c4", "50m",
+		CLK_SET_RATE_PARENT, 0x01a0, 20, 0,
+	},
+	{
+		HI3559AV100_I2C5_CLK, "clk_i2c5", "50m",
+		CLK_SET_RATE_PARENT, 0x01a0, 21, 0,
+	},
+	{
+		HI3559AV100_I2C6_CLK, "clk_i2c6", "50m",
+		CLK_SET_RATE_PARENT, 0x01a0, 22, 0,
+	},
+	{
+		HI3559AV100_I2C7_CLK, "clk_i2c7", "50m",
+		CLK_SET_RATE_PARENT, 0x01a0, 23, 0,
+	},
+	{
+		HI3559AV100_I2C8_CLK, "clk_i2c8", "50m",
+		CLK_SET_RATE_PARENT, 0x01a0, 24, 0,
+	},
+	{
+		HI3559AV100_I2C9_CLK, "clk_i2c9", "50m",
+		CLK_SET_RATE_PARENT, 0x01a0, 25, 0,
+	},
+	{
+		HI3559AV100_I2C10_CLK, "clk_i2c10", "50m",
+		CLK_SET_RATE_PARENT, 0x01a0, 26, 0,
+	},
+	{
+		HI3559AV100_I2C11_CLK, "clk_i2c11", "50m",
+		CLK_SET_RATE_PARENT, 0x01a0, 27, 0,
+	},
+	{
+		HI3559AV100_SPI0_CLK, "clk_spi0", "100m",
+		CLK_SET_RATE_PARENT, 0x0198, 16, 0,
+	},
+	{
+		HI3559AV100_SPI1_CLK, "clk_spi1", "100m",
+		CLK_SET_RATE_PARENT, 0x0198, 17, 0,
+	},
+	{
+		HI3559AV100_SPI2_CLK, "clk_spi2", "100m",
+		CLK_SET_RATE_PARENT, 0x0198, 18, 0,
+	},
+	{
+		HI3559AV100_SPI3_CLK, "clk_spi3", "100m",
+		CLK_SET_RATE_PARENT, 0x0198, 19, 0,
+	},
+	{
+		HI3559AV100_SPI4_CLK, "clk_spi4", "100m",
+		CLK_SET_RATE_PARENT, 0x0198, 20, 0,
+	},
+	{
+		HI3559AV100_SPI5_CLK, "clk_spi5", "100m",
+		CLK_SET_RATE_PARENT, 0x0198, 21, 0,
+	},
+	{
+		HI3559AV100_SPI6_CLK, "clk_spi6", "100m",
+		CLK_SET_RATE_PARENT, 0x0198, 22, 0,
+	},
+	{
+		HI3559AV100_EDMAC_AXICLK, "axi_clk_edmac", NULL,
+		CLK_SET_RATE_PARENT, 0x16c, 6, 0,
+	},
+	{
+		HI3559AV100_EDMAC_CLK, "clk_edmac", NULL,
+		CLK_SET_RATE_PARENT, 0x16c, 5, 0,
+	},
+	{
+		HI3559AV100_EDMAC1_AXICLK, "axi_clk_edmac1", NULL,
+		CLK_SET_RATE_PARENT, 0x16c, 9, 0,
+	},
+	{
+		HI3559AV100_EDMAC1_CLK, "clk_edmac1", NULL,
+		CLK_SET_RATE_PARENT, 0x16c, 8, 0,
+	},
+	{
+		HI3559AV100_VDMAC_CLK, "clk_vdmac", NULL,
+		CLK_SET_RATE_PARENT, 0x14c, 5, 0,
+	},
+};
+
+static struct hi3559av100_pll_clock hi3559av100_pll_clks[] __initdata = {
+	{
+		HI3559AV100_APLL_CLK, "apll", NULL, 0x0, 0, 24, 24, 3, 28, 3,
+		0x4, 0, 12, 12, 6
+	},
+	{
+		HI3559AV100_GPLL_CLK, "gpll", NULL, 0x20, 0, 24, 24, 3, 28, 3,
+		0x24, 0, 12, 12, 6
+	},
+};
+
+#define to_pll_clk(_hw) container_of(_hw, struct hi3559av100_clk_pll, hw)
+static void hi3559av100_calc_pll(u32 *frac_val, u32 *postdiv1_val,
+				 u32 *postdiv2_val,
+				 u32 *fbdiv_val, u32 *refdiv_val, u64 rate)
+{
+	u64 rem;
+
+	*postdiv1_val = 2;
+	*postdiv2_val = 1;
+
+	rate = rate * ((*postdiv1_val) * (*postdiv2_val));
+
+	*frac_val = 0;
+	rem = do_div(rate, 1000000);
+	rem = do_div(rate, 24);
+	*fbdiv_val = rate;
+	*refdiv_val = 1;
+	rem = rem * (1 << 24);
+	do_div(rem, 24);
+	*frac_val = rem;
+}
+
+static int clk_pll_set_rate(struct clk_hw *hw,
+			    unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct hi3559av100_clk_pll *clk = to_pll_clk(hw);
+	u32 frac_val, postdiv1_val, postdiv2_val, fbdiv_val, refdiv_val;
+	u32 val;
+
+	postdiv1_val = postdiv2_val = 0;
+
+	hi3559av100_calc_pll(&frac_val, &postdiv1_val, &postdiv2_val,
+			     &fbdiv_val, &refdiv_val, (u64)rate);
+
+	val = readl_relaxed(clk->ctrl_reg1);
+	val &= ~(((1 << clk->frac_width) - 1) << clk->frac_shift);
+	val &= ~(((1 << clk->postdiv1_width) - 1) << clk->postdiv1_shift);
+	val &= ~(((1 << clk->postdiv2_width) - 1) << clk->postdiv2_shift);
+
+	val |= frac_val << clk->frac_shift;
+	val |= postdiv1_val << clk->postdiv1_shift;
+	val |= postdiv2_val << clk->postdiv2_shift;
+	writel_relaxed(val, clk->ctrl_reg1);
+
+	val = readl_relaxed(clk->ctrl_reg2);
+	val &= ~(((1 << clk->fbdiv_width) - 1) << clk->fbdiv_shift);
+	val &= ~(((1 << clk->refdiv_width) - 1) << clk->refdiv_shift);
+
+	val |= fbdiv_val << clk->fbdiv_shift;
+	val |= refdiv_val << clk->refdiv_shift;
+	writel_relaxed(val, clk->ctrl_reg2);
+
+	return 0;
+}
+
+static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
+		unsigned long parent_rate)
+{
+	struct hi3559av100_clk_pll *clk = to_pll_clk(hw);
+	u64 frac_val, fbdiv_val, refdiv_val;
+	u32 postdiv1_val, postdiv2_val;
+	u32 val;
+	u64 tmp, rate;
+
+	val = readl_relaxed(clk->ctrl_reg1);
+	val = val >> clk->frac_shift;
+	val &= ((1 << clk->frac_width) - 1);
+	frac_val = val;
+
+	val = readl_relaxed(clk->ctrl_reg1);
+	val = val >> clk->postdiv1_shift;
+	val &= ((1 << clk->postdiv1_width) - 1);
+	postdiv1_val = val;
+
+	val = readl_relaxed(clk->ctrl_reg1);
+	val = val >> clk->postdiv2_shift;
+	val &= ((1 << clk->postdiv2_width) - 1);
+	postdiv2_val = val;
+
+	val = readl_relaxed(clk->ctrl_reg2);
+	val = val >> clk->fbdiv_shift;
+	val &= ((1 << clk->fbdiv_width) - 1);
+	fbdiv_val = val;
+
+	val = readl_relaxed(clk->ctrl_reg2);
+	val = val >> clk->refdiv_shift;
+	val &= ((1 << clk->refdiv_width) - 1);
+	refdiv_val = val;
+
+	/* rate = 24000000 * (fbdiv + frac / (1<<24) ) / refdiv  */
+	rate = 0;
+	tmp = 24000000 * fbdiv_val + (24000000 * frac_val) / (1 << 24);
+	rate += tmp;
+	do_div(rate, refdiv_val);
+	do_div(rate, postdiv1_val * postdiv2_val);
+
+	return rate;
+}
+
+static int clk_pll_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
+{
+	return req->rate;
+}
+
+static const struct clk_ops clk_pll_ops = {
+	.set_rate = clk_pll_set_rate,
+	.determine_rate = clk_pll_determine_rate,
+	.recalc_rate = clk_pll_recalc_rate,
+};
+
+static void hisi_clk_register_pll(struct hi3559av100_pll_clock *clks,
+			   int nums, struct hisi_clock_data *data)
+{
+	void __iomem *base = data->base;
+	int i;
+
+	for (i = 0; i < nums; i++) {
+		struct hi3559av100_clk_pll *p_clk = NULL;
+		struct clk *clk = NULL;
+		struct clk_init_data init;
+
+		p_clk = kzalloc(sizeof(*p_clk), GFP_KERNEL);
+		if (!p_clk)
+			return;
+
+		init.name = clks[i].name;
+		init.flags = 0;
+		init.parent_names =
+			(clks[i].parent_name ? &clks[i].parent_name : NULL);
+		init.num_parents = (clks[i].parent_name ? 1 : 0);
+		init.ops = &clk_pll_ops;
+
+		p_clk->ctrl_reg1 = base + clks[i].ctrl_reg1;
+		p_clk->frac_shift = clks[i].frac_shift;
+		p_clk->frac_width = clks[i].frac_width;
+		p_clk->postdiv1_shift = clks[i].postdiv1_shift;
+		p_clk->postdiv1_width = clks[i].postdiv1_width;
+		p_clk->postdiv2_shift = clks[i].postdiv2_shift;
+		p_clk->postdiv2_width = clks[i].postdiv2_width;
+
+		p_clk->ctrl_reg2 = base + clks[i].ctrl_reg2;
+		p_clk->fbdiv_shift = clks[i].fbdiv_shift;
+		p_clk->fbdiv_width = clks[i].fbdiv_width;
+		p_clk->refdiv_shift = clks[i].refdiv_shift;
+		p_clk->refdiv_width = clks[i].refdiv_width;
+		p_clk->hw.init = &init;
+
+		clk = clk_register(NULL, &p_clk->hw);
+		if (IS_ERR(clk)) {
+			kfree(p_clk);
+			pr_err("%s: failed to register clock %s\n",
+			       __func__, clks[i].name);
+			continue;
+		}
+
+		data->clk_data.clks[clks[i].id] = clk;
+	}
+}
+
+static __init struct hisi_clock_data *hi3559av100_clk_register(
+	struct platform_device *pdev)
+{
+	struct hisi_clock_data *clk_data;
+	int ret;
+
+	clk_data = hisi_clk_alloc(pdev, HI3559AV100_CRG_NR_CLKS);
+	if (!clk_data)
+		return ERR_PTR(-ENOMEM);
+
+	ret = hisi_clk_register_fixed_rate(hi3559av100_fixed_rate_clks_crg,
+					   ARRAY_SIZE(hi3559av100_fixed_rate_clks_crg), clk_data);
+	if (ret)
+		return ERR_PTR(ret);
+
+	hisi_clk_register_pll(hi3559av100_pll_clks,
+			      ARRAY_SIZE(hi3559av100_pll_clks), clk_data);
+
+	ret = hisi_clk_register_mux(hi3559av100_mux_clks_crg,
+				    ARRAY_SIZE(hi3559av100_mux_clks_crg), clk_data);
+	if (ret)
+		goto unregister_fixed_rate;
+
+	ret = hisi_clk_register_fixed_factor(hi3559av100_fixed_factor_clks,
+					     ARRAY_SIZE(hi3559av100_fixed_factor_clks), clk_data);
+	if (ret)
+		goto unregister_mux;
+
+	ret = hisi_clk_register_gate(hi3559av100_gate_clks,
+				     ARRAY_SIZE(hi3559av100_gate_clks), clk_data);
+	if (ret)
+		goto unregister_factor;
+
+	ret = of_clk_add_provider(pdev->dev.of_node,
+				  of_clk_src_onecell_get, &clk_data->clk_data);
+	if (ret)
+		goto unregister_gate;
+
+	return clk_data;
+
+unregister_gate:
+	hisi_clk_unregister_gate(hi3559av100_gate_clks,
+				 ARRAY_SIZE(hi3559av100_gate_clks), clk_data);
+unregister_factor:
+	hisi_clk_unregister_fixed_factor(hi3559av100_fixed_factor_clks,
+					 ARRAY_SIZE(hi3559av100_fixed_factor_clks), clk_data);
+unregister_mux:
+	hisi_clk_unregister_mux(hi3559av100_mux_clks_crg,
+				ARRAY_SIZE(hi3559av100_mux_clks_crg), clk_data);
+unregister_fixed_rate:
+	hisi_clk_unregister_fixed_rate(hi3559av100_fixed_rate_clks_crg,
+				       ARRAY_SIZE(hi3559av100_fixed_rate_clks_crg), clk_data);
+	return ERR_PTR(ret);
+}
+
+static __init void hi3559av100_clk_unregister(struct platform_device *pdev)
+{
+	struct hisi_crg_dev *crg = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+
+	hisi_clk_unregister_gate(hi3559av100_gate_clks,
+				 ARRAY_SIZE(hi3559av100_gate_clks), crg->clk_data);
+	hisi_clk_unregister_mux(hi3559av100_mux_clks_crg,
+				ARRAY_SIZE(hi3559av100_mux_clks_crg), crg->clk_data);
+	hisi_clk_unregister_fixed_factor(hi3559av100_fixed_factor_clks,
+					 ARRAY_SIZE(hi3559av100_fixed_factor_clks), crg->clk_data);
+	hisi_clk_unregister_fixed_rate(hi3559av100_fixed_rate_clks_crg,
+				       ARRAY_SIZE(hi3559av100_fixed_rate_clks_crg), crg->clk_data);
+}
+
+static const struct hisi_crg_funcs hi3559av100_crg_funcs = {
+	.register_clks = hi3559av100_clk_register,
+	.unregister_clks = hi3559av100_clk_unregister,
+};
+
+static struct hisi_fixed_rate_clock hi3559av100_shub_fixed_rate_clks[]
+	__initdata = {
+	{ HI3559AV100_SHUB_SOURCE_SOC_24M, "clk_source_24M", NULL, 0, 24000000UL, },
+	{ HI3559AV100_SHUB_SOURCE_SOC_200M, "clk_source_200M", NULL, 0, 200000000UL, },
+	{ HI3559AV100_SHUB_SOURCE_SOC_300M, "clk_source_300M", NULL, 0, 300000000UL, },
+	{ HI3559AV100_SHUB_SOURCE_PLL, "clk_source_PLL", NULL, 0, 192000000UL, },
+	{ HI3559AV100_SHUB_I2C0_CLK, "clk_shub_i2c0", NULL, 0, 48000000UL, },
+	{ HI3559AV100_SHUB_I2C1_CLK, "clk_shub_i2c1", NULL, 0, 48000000UL, },
+	{ HI3559AV100_SHUB_I2C2_CLK, "clk_shub_i2c2", NULL, 0, 48000000UL, },
+	{ HI3559AV100_SHUB_I2C3_CLK, "clk_shub_i2c3", NULL, 0, 48000000UL, },
+	{ HI3559AV100_SHUB_I2C4_CLK, "clk_shub_i2c4", NULL, 0, 48000000UL, },
+	{ HI3559AV100_SHUB_I2C5_CLK, "clk_shub_i2c5", NULL, 0, 48000000UL, },
+	{ HI3559AV100_SHUB_I2C6_CLK, "clk_shub_i2c6", NULL, 0, 48000000UL, },
+	{ HI3559AV100_SHUB_I2C7_CLK, "clk_shub_i2c7", NULL, 0, 48000000UL, },
+	{ HI3559AV100_SHUB_UART_CLK_32K, "clk_uart_32K", NULL, 0, 32000UL, },
+};
+
+/* shub mux clk */
+static u32 shub_source_clk_mux_table[] = {0, 1, 2, 3};
+static const char *shub_source_clk_mux_p[] __initconst = {
+	"clk_source_24M", "clk_source_200M", "clk_source_300M", "clk_source_PLL"
+};
+
+static u32 shub_uart_source_clk_mux_table[] = {0, 1, 2, 3};
+static const char *shub_uart_source_clk_mux_p[] __initconst = {
+	"clk_uart_32K", "clk_uart_div_clk", "clk_uart_div_clk", "clk_source_24M"
+};
+
+static struct hisi_mux_clock hi3559av100_shub_mux_clks[] __initdata = {
+	{
+		HI3559AV100_SHUB_SOURCE_CLK, "shub_clk", shub_source_clk_mux_p,
+		ARRAY_SIZE(shub_source_clk_mux_p),
+		0, 0x0, 0, 2, 0, shub_source_clk_mux_table,
+	},
+
+	{
+		HI3559AV100_SHUB_UART_SOURCE_CLK, "shub_uart_source_clk",
+		shub_uart_source_clk_mux_p, ARRAY_SIZE(shub_uart_source_clk_mux_p),
+		0, 0x1c, 28, 2, 0, shub_uart_source_clk_mux_table,
+	},
+};
+
+
+/* shub div clk */
+struct clk_div_table shub_spi_clk_table[] = {{0, 8}, {1, 4}, {2, 2}};
+struct clk_div_table shub_spi4_clk_table[] = {{0, 8}, {1, 4}, {2, 2}, {3, 1}};
+struct clk_div_table shub_uart_div_clk_table[] = {{1, 8}, {2, 4}};
+
+struct hisi_divider_clock hi3559av100_shub_div_clks[] __initdata = {
+	{ HI3559AV100_SHUB_SPI_SOURCE_CLK, "clk_spi_clk", "shub_clk", 0, 0x20, 24, 2,
+	  CLK_DIVIDER_ALLOW_ZERO, shub_spi_clk_table,
+	},
+	{ HI3559AV100_SHUB_UART_DIV_CLK, "clk_uart_div_clk", "shub_clk", 0, 0x1c, 28, 2,
+	  CLK_DIVIDER_ALLOW_ZERO, shub_uart_div_clk_table,
+	},
+};
+
+/* shub gate clk */
+static struct hisi_gate_clock hi3559av100_shub_gate_clks[] __initdata = {
+	{
+		HI3559AV100_SHUB_SPI0_CLK, "clk_shub_spi0", "clk_spi_clk",
+		0, 0x20, 1, 0,
+	},
+	{
+		HI3559AV100_SHUB_SPI1_CLK, "clk_shub_spi1", "clk_spi_clk",
+		0, 0x20, 5, 0,
+	},
+	{
+		HI3559AV100_SHUB_SPI2_CLK, "clk_shub_spi2", "clk_spi_clk",
+		0, 0x20, 9, 0,
+	},
+
+	{
+		HI3559AV100_SHUB_UART0_CLK, "clk_shub_uart0", "shub_uart_source_clk",
+		0, 0x1c, 1, 0,
+	},
+	{
+		HI3559AV100_SHUB_UART1_CLK, "clk_shub_uart1", "shub_uart_source_clk",
+		0, 0x1c, 5, 0,
+	},
+	{
+		HI3559AV100_SHUB_UART2_CLK, "clk_shub_uart2", "shub_uart_source_clk",
+		0, 0x1c, 9, 0,
+	},
+	{
+		HI3559AV100_SHUB_UART3_CLK, "clk_shub_uart3", "shub_uart_source_clk",
+		0, 0x1c, 13, 0,
+	},
+	{
+		HI3559AV100_SHUB_UART4_CLK, "clk_shub_uart4", "shub_uart_source_clk",
+		0, 0x1c, 17, 0,
+	},
+	{
+		HI3559AV100_SHUB_UART5_CLK, "clk_shub_uart5", "shub_uart_source_clk",
+		0, 0x1c, 21, 0,
+	},
+	{
+		HI3559AV100_SHUB_UART6_CLK, "clk_shub_uart6", "shub_uart_source_clk",
+		0, 0x1c, 25, 0,
+	},
+
+	{
+		HI3559AV100_SHUB_EDMAC_CLK, "clk_shub_dmac", "shub_clk",
+		0, 0x24, 4, 0,
+	},
+};
+
+static int hi3559av100_shub_default_clk_set(void)
+{
+	void *crg_base;
+	unsigned int val;
+
+	crg_base = ioremap(CRG_BASE_ADDR, SZ_4K);
+
+	/* SSP: 192M/2 */
+	val = readl_relaxed(crg_base + 0x20);
+	val |= (0x2 << 24);
+	writel_relaxed(val, crg_base + 0x20);
+
+	/* UART: 192M/8 */
+	val = readl_relaxed(crg_base + 0x1C);
+	val |= (0x1 << 28);
+	writel_relaxed(val, crg_base + 0x1C);
+
+	iounmap(crg_base);
+	crg_base = NULL;
+
+	return 0;
+}
+
+static __init struct hisi_clock_data *hi3559av100_shub_clk_register(
+	struct platform_device *pdev)
+{
+	struct hisi_clock_data *clk_data = NULL;
+	int ret;
+
+	hi3559av100_shub_default_clk_set();
+
+	clk_data = hisi_clk_alloc(pdev, HI3559AV100_SHUB_NR_CLKS);
+	if (!clk_data)
+		return ERR_PTR(-ENOMEM);
+
+	ret = hisi_clk_register_fixed_rate(hi3559av100_shub_fixed_rate_clks,
+					   ARRAY_SIZE(hi3559av100_shub_fixed_rate_clks), clk_data);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = hisi_clk_register_mux(hi3559av100_shub_mux_clks,
+				    ARRAY_SIZE(hi3559av100_shub_mux_clks), clk_data);
+	if (ret)
+		goto unregister_fixed_rate;
+
+	ret = hisi_clk_register_divider(hi3559av100_shub_div_clks,
+					ARRAY_SIZE(hi3559av100_shub_div_clks), clk_data);
+	if (ret)
+		goto unregister_mux;
+
+	ret = hisi_clk_register_gate(hi3559av100_shub_gate_clks,
+				     ARRAY_SIZE(hi3559av100_shub_gate_clks), clk_data);
+	if (ret)
+		goto unregister_factor;
+
+	ret = of_clk_add_provider(pdev->dev.of_node,
+				  of_clk_src_onecell_get, &clk_data->clk_data);
+	if (ret)
+		goto unregister_gate;
+
+	return clk_data;
+
+unregister_gate:
+	hisi_clk_unregister_gate(hi3559av100_shub_gate_clks,
+				 ARRAY_SIZE(hi3559av100_shub_gate_clks), clk_data);
+unregister_factor:
+	hisi_clk_unregister_divider(hi3559av100_shub_div_clks,
+				    ARRAY_SIZE(hi3559av100_shub_div_clks), clk_data);
+unregister_mux:
+	hisi_clk_unregister_mux(hi3559av100_shub_mux_clks,
+				ARRAY_SIZE(hi3559av100_shub_mux_clks), clk_data);
+unregister_fixed_rate:
+	hisi_clk_unregister_fixed_rate(hi3559av100_shub_fixed_rate_clks,
+				       ARRAY_SIZE(hi3559av100_shub_fixed_rate_clks), clk_data);
+	return ERR_PTR(ret);
+}
+
+static __init void hi3559av100_shub_clk_unregister(struct platform_device *pdev)
+{
+	struct hisi_crg_dev *crg = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+
+	hisi_clk_unregister_gate(hi3559av100_shub_gate_clks,
+				 ARRAY_SIZE(hi3559av100_shub_gate_clks), crg->clk_data);
+	hisi_clk_unregister_divider(hi3559av100_shub_div_clks,
+				    ARRAY_SIZE(hi3559av100_shub_div_clks), crg->clk_data);
+	hisi_clk_unregister_mux(hi3559av100_shub_mux_clks,
+				ARRAY_SIZE(hi3559av100_shub_mux_clks), crg->clk_data);
+	hisi_clk_unregister_fixed_rate(hi3559av100_shub_fixed_rate_clks,
+				       ARRAY_SIZE(hi3559av100_shub_fixed_rate_clks), crg->clk_data);
+}
+
+static const struct hisi_crg_funcs hi3559av100_shub_crg_funcs = {
+	.register_clks = hi3559av100_shub_clk_register,
+	.unregister_clks = hi3559av100_shub_clk_unregister,
+};
+
+static const struct of_device_id hi3559av100_crg_match_table[] = {
+	{
+		.compatible = "hisilicon,hi3559av100-clock",
+		.data = &hi3559av100_crg_funcs
+	},
+	{
+		.compatible = "hisilicon,hi3559av100-shub-clock",
+		.data = &hi3559av100_shub_crg_funcs
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, hi3559av100_crg_match_table);
+
+static int hi3559av100_crg_probe(struct platform_device *pdev)
+{
+	struct hisi_crg_dev *crg;
+
+	crg = devm_kmalloc(&pdev->dev, sizeof(*crg), GFP_KERNEL);
+	if (!crg)
+		return -ENOMEM;
+
+	crg->funcs = of_device_get_match_data(&pdev->dev);
+	if (!crg->funcs)
+		return -ENOENT;
+
+	crg->rstc = hisi_reset_init(pdev);
+	if (!crg->rstc)
+		return -ENOMEM;
+
+	crg->clk_data = crg->funcs->register_clks(pdev);
+	if (IS_ERR(crg->clk_data)) {
+		hisi_reset_exit(crg->rstc);
+		return PTR_ERR(crg->clk_data);
+	}
+
+	platform_set_drvdata(pdev, crg);
+	return 0;
+}
+
+static int hi3559av100_crg_remove(struct platform_device *pdev)
+{
+	struct hisi_crg_dev *crg = platform_get_drvdata(pdev);
+
+	hisi_reset_exit(crg->rstc);
+	crg->funcs->unregister_clks(pdev);
+	return 0;
+}
+
+static struct platform_driver hi3559av100_crg_driver = {
+	.probe		= hi3559av100_crg_probe,
+	.remove     = hi3559av100_crg_remove,
+	.driver		= {
+		.name	= "hi3559av100-clock",
+		.of_match_table = hi3559av100_crg_match_table,
+	},
+};
+
+static int __init hi3559av100_crg_init(void)
+{
+	return platform_driver_register(&hi3559av100_crg_driver);
+}
+core_initcall(hi3559av100_crg_init);
+
+static void __exit hi3559av100_crg_exit(void)
+{
+	platform_driver_unregister(&hi3559av100_crg_driver);
+}
+module_exit(hi3559av100_crg_exit);
+
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("HiSilicon Hi3559AV100 CRG Driver");
-- 
2.17.1

