Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF777B5953
	for <lists+linux-clk@lfdr.de>; Wed, 18 Sep 2019 03:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728764AbfIRBfO (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 Sep 2019 21:35:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:48242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728734AbfIRBfO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 17 Sep 2019 21:35:14 -0400
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DEB8E21897;
        Wed, 18 Sep 2019 01:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568770512;
        bh=5FsGSZ3WB9EcqZ8BDrCA4abJhuoYaYDzo/Q6H3pJKOo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sjb698hadsO+ykRMKB56z2TCnT4As7B4LV1loe1Xok9W5uozmCwff20Jfbfwhe6nA
         pQVwyO6nZzfY8XQXW0MHGlR3YpzeuyboenGPmbmy50oRDYjlMeYA5akZquee+eCAaB
         POv4Sg/eBq79bWVzgCM0FOWAQarefrUvRLCaKtLY=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     dinguyen@kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: socfpga: agilex: add clock driver for the Agilex platform
Date:   Tue, 17 Sep 2019 20:34:59 -0500
Message-Id: <20190918013459.15966-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190918013459.15966-1-dinguyen@kernel.org>
References: <20190918013459.15966-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

For the most part the Agilex clock structure is very similar to
Stratix10, so we re-use most of the Stratix10 clock driver.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/clk/Makefile                |   1 +
 drivers/clk/socfpga/Makefile        |   2 +
 drivers/clk/socfpga/clk-agilex.c    | 332 ++++++++++++++++++++++++++++
 drivers/clk/socfpga/clk-pll-s10.c   |  70 ++++++
 drivers/clk/socfpga/stratix10-clk.h |   3 +
 5 files changed, 408 insertions(+)
 create mode 100644 drivers/clk/socfpga/clk-agilex.c

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 0cad76021297..ef2c96c0f1e0 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -18,6 +18,7 @@ endif
 
 # hardware specific clock types
 # please keep this section sorted lexicographically by file path name
+obj-$(CONFIG_ARCH_AGILEX)		+= socfpga/
 obj-$(CONFIG_MACH_ASM9260)		+= clk-asm9260.o
 obj-$(CONFIG_COMMON_CLK_AXI_CLKGEN)	+= clk-axi-clkgen.o
 obj-$(CONFIG_ARCH_AXXIA)		+= clk-axm5516.o
diff --git a/drivers/clk/socfpga/Makefile b/drivers/clk/socfpga/Makefile
index ce5aa7802eb8..bf736f8d201a 100644
--- a/drivers/clk/socfpga/Makefile
+++ b/drivers/clk/socfpga/Makefile
@@ -3,3 +3,5 @@ obj-$(CONFIG_ARCH_SOCFPGA) += clk.o clk-gate.o clk-pll.o clk-periph.o
 obj-$(CONFIG_ARCH_SOCFPGA) += clk-pll-a10.o clk-periph-a10.o clk-gate-a10.o
 obj-$(CONFIG_ARCH_STRATIX10) += clk-s10.o
 obj-$(CONFIG_ARCH_STRATIX10) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
+obj-$(CONFIG_ARCH_AGILEX) += clk-agilex.o
+obj-$(CONFIG_ARCH_AGILEX) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-agilex.c
new file mode 100644
index 000000000000..7d5093f0b2c9
--- /dev/null
+++ b/drivers/clk/socfpga/clk-agilex.c
@@ -0,0 +1,332 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019, Intel Corporation
+ */
+#include <linux/slab.h>
+#include <linux/clk-provider.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/clock/agilex-clock.h>
+
+#include "stratix10-clk.h"
+
+static const char * const pll_mux[] = { "osc1", "cb-intosc-hs-div2-clk",
+					"f2s-free-clk",};
+static const char * const cntr_mux[] = { "main_pll", "periph_pll",
+					 "osc1", "cb-intosc-hs-div2-clk",
+					 "f2s-free-clk"};
+static const char * const boot_mux[] = { "osc1", "cb-intosc-hs-div2-clk",};
+
+static const char * const mpu_free_mux[] = {"main_pll_c0", "peri_pll_c0",
+					    "osc1", "cb-intosc-hs-div2-clk",
+					    "f2s-free-clk"};
+
+static const char * const noc_free_mux[] = {"main_pll_c1", "peri_pll_c1",
+					    "osc1", "cb-intosc-hs-div2-clk",
+					    "f2s-free-clk"};
+
+static const char * const emaca_free_mux[] = {"main_pll_c2", "peri_pll_c2",
+					      "osc1", "cb-intosc-hs-div2-clk",
+					      "f2s-free-clk"};
+static const char * const emacb_free_mux[] = {"main_pll_c3", "peri_pll_c3",
+					      "osc1", "cb-intosc-hs-div2-clk",
+					      "f2s-free-clk"};
+static const char * const emac_ptp_free_mux[] = {"main_pll_c3", "peri_pll_c3",
+					      "osc1", "cb-intosc-hs-div2-clk",
+					      "f2s-free-clk"};
+static const char * const gpio_db_free_mux[] = {"main_pll_c3", "peri_pll_c3",
+					      "osc1", "cb-intosc-hs-div2-clk",
+					      "f2s-free-clk"};
+static const char * const psi_ref_free_mux[] = {"main_pll_c3", "peri_pll_c3",
+					      "osc1", "cb-intosc-hs-div2-clk",
+					      "f2s-free-clk"};
+static const char * const sdmmc_free_mux[] = {"main_pll_c3", "peri_pll_c3",
+					      "osc1", "cb-intosc-hs-div2-clk",
+					      "f2s-free-clk"};
+static const char * const s2f_usr0_free_mux[] = {"main_pll_c2", "peri_pll_c2",
+						 "osc1", "cb-intosc-hs-div2-clk",
+						 "f2s-free-clk"};
+static const char * const s2f_usr1_free_mux[] = {"main_pll_c2", "peri_pll_c2",
+						 "osc1", "cb-intosc-hs-div2-clk",
+						 "f2s-free-clk"};
+static const char * const mpu_mux[] = { "mpu_free_clk", "boot_clk",};
+
+static const char * const s2f_usr0_mux[] = {"f2s-free-clk", "boot_clk"};
+static const char * const emac_mux[] = {"emaca_free_clk", "emacb_free_clk"};
+static const char * const noc_mux[] = {"noc_free_clk", "boot_clk"};
+
+/* clocks in AO (always on) controller */
+static const struct stratix10_pll_clock agilex_pll_clks[] = {
+	{ AGILEX_BOOT_CLK, "boot_clk", boot_mux, ARRAY_SIZE(boot_mux), 0,
+	  0x0},
+	{ AGILEX_MAIN_PLL_CLK, "main_pll", pll_mux, ARRAY_SIZE(pll_mux),
+	  0, 0x48},
+	{ AGILEX_PERIPH_PLL_CLK, "periph_pll", pll_mux, ARRAY_SIZE(pll_mux),
+	  0, 0x9c},
+};
+
+static const struct stratix10_perip_c_clock agilex_main_perip_c_clks[] = {
+	{ AGILEX_MAIN_PLL_C0_CLK, "main_pll_c0", "main_pll", NULL, 1, 0, 0x58},
+	{ AGILEX_MAIN_PLL_C1_CLK, "main_pll_c1", "main_pll", NULL, 1, 0, 0x5C},
+	{ AGILEX_MAIN_PLL_C2_CLK, "main_pll_c2", "main_pll", NULL, 1, 0, 0x64},
+	{ AGILEX_MAIN_PLL_C3_CLK, "main_pll_c3", "main_pll", NULL, 1, 0, 0x68},
+	{ AGILEX_PERIPH_PLL_C0_CLK, "peri_pll_c0", "periph_pll", NULL, 1, 0, 0xAC},
+	{ AGILEX_PERIPH_PLL_C1_CLK, "peri_pll_c1", "periph_pll", NULL, 1, 0, 0xB0},
+	{ AGILEX_PERIPH_PLL_C2_CLK, "peri_pll_c2", "periph_pll", NULL, 1, 0, 0xB8},
+	{ AGILEX_PERIPH_PLL_C3_CLK, "peri_pll_c3", "periph_pll", NULL, 1, 0, 0xBC},
+};
+
+static const struct stratix10_perip_cnt_clock agilex_main_perip_cnt_clks[] = {
+	{ AGILEX_MPU_FREE_CLK, "mpu_free_clk", NULL, mpu_free_mux, ARRAY_SIZE(mpu_free_mux),
+	   0, 0x3C, 0, 0, 0},
+	{ AGILEX_NOC_FREE_CLK, "noc_free_clk", NULL, noc_free_mux, ARRAY_SIZE(noc_free_mux),
+	  0, 0x40, 0, 0, 1},
+	{ AGILEX_L4_SYS_FREE_CLK, "l4_sys_free_clk", "noc_free_clk", NULL, 1, 0,
+	  0, 4, 0, 0},
+	{ AGILEX_NOC_CLK, "noc_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux),
+	  0, 0, 0, 0x30, 1},
+	{ AGILEX_EMAC_A_FREE_CLK, "emaca_free_clk", NULL, emaca_free_mux, ARRAY_SIZE(emaca_free_mux),
+	  0, 0xD4, 0, 0x88, 0},
+	{ AGILEX_EMAC_B_FREE_CLK, "emacb_free_clk", NULL, emacb_free_mux, ARRAY_SIZE(emacb_free_mux),
+	  0, 0xD8, 0, 0x88, 1},
+	{ AGILEX_EMAC_PTP_FREE_CLK, "emac_ptp_free_clk", NULL, emac_ptp_free_mux,
+	  ARRAY_SIZE(emac_ptp_free_mux), 0, 0xDC, 0, 0x88, 2},
+	{ AGILEX_GPIO_DB_FREE_CLK, "gpio_db_free_clk", NULL, gpio_db_free_mux,
+	  ARRAY_SIZE(gpio_db_free_mux), 0, 0xE0, 0, 0x88, 3},
+	{ AGILEX_SDMMC_FREE_CLK, "sdmmc_free_clk", NULL, sdmmc_free_mux,
+	  ARRAY_SIZE(sdmmc_free_mux), 0, 0xE4, 0, 0x88, 4},
+	{ AGILEX_S2F_USER0_FREE_CLK, "s2f_user0_free_clk", NULL, s2f_usr0_free_mux,
+	  ARRAY_SIZE(s2f_usr0_free_mux), 0, 0xE8, 0, 0, 0},
+	{ AGILEX_S2F_USER1_FREE_CLK, "s2f_user1_free_clk", NULL, s2f_usr1_free_mux,
+	  ARRAY_SIZE(s2f_usr1_free_mux), 0, 0xEC, 0, 0x88, 5},
+	{ AGILEX_PSI_REF_FREE_CLK, "psi_ref_free_clk", NULL, psi_ref_free_mux,
+	  ARRAY_SIZE(psi_ref_free_mux), 0, 0xF0, 0, 0x88, 6},
+};
+
+static const struct stratix10_gate_clock agilex_gate_clks[] = {
+	{ AGILEX_MPU_CLK, "mpu_clk", NULL, mpu_mux, ARRAY_SIZE(mpu_mux), 0, 0x24,
+	  0, 0, 0, 0, 0x30, 0, 0},
+	{ AGILEX_MPU_PERIPH_CLK, "mpu_periph_clk", "mpu_clk", NULL, 1, 0, 0x24,
+	  0, 0, 0, 0, 0, 0, 4},
+	{ AGILEX_MPU_L2RAM_CLK, "mpu_l2ram_clk", "mpu_clk", NULL, 1, 0, 0x24,
+	  0, 0, 0, 0, 0, 0, 2},
+	{ AGILEX_L4_MAIN_CLK, "l4_main_clk", "noc_clk", NULL, 1, 0, 0x24,
+	  1, 0x44, 0, 2, 0, 0, 0},
+	{ AGILEX_L4_MP_CLK, "l4_mp_clk", "noc_clk", NULL, 1, 0, 0x24,
+	  2, 0x44, 8, 2, 0, 0, 0},
+	{ AGILEX_L4_SP_CLK, "l4_sp_clk", "noc_clk", NULL, 1, CLK_IS_CRITICAL, 0x24,
+	  3, 0x44, 16, 2, 0, 0, 0},
+	{ AGILEX_CS_AT_CLK, "cs_at_clk", "noc_clk", NULL, 1, 0, 0x24,
+	  4, 0x44, 24, 2, 0, 0, 0},
+	{ AGILEX_CS_TRACE_CLK, "cs_trace_clk", "noc_clk", NULL, 1, 0, 0x24,
+	  4, 0x44, 26, 2, 0, 0, 0},
+	{ AGILEX_CS_PDBG_CLK, "cs_pdbg_clk", "cs_at_clk", NULL, 1, 0, 0x24,
+	  4, 0x44, 28, 1, 0, 0, 0},
+	{ AGILEX_CS_TIMER_CLK, "cs_timer_clk", "noc_clk", NULL, 1, 0, 0x24,
+	  5, 0, 0, 0, 0, 0, 0},
+	{ AGILEX_S2F_USER0_CLK, "s2f_user0_clk", NULL, s2f_usr0_mux, ARRAY_SIZE(s2f_usr0_mux), 0, 0x24,
+	  6, 0, 0, 0, 0, 0, 0},
+	{ AGILEX_EMAC0_CLK, "emac0_clk", NULL, emac_mux, ARRAY_SIZE(emac_mux), 0, 0x7C,
+	  0, 0, 0, 0, 0x94, 26, 0},
+	{ AGILEX_EMAC1_CLK, "emac1_clk", NULL, emac_mux, ARRAY_SIZE(emac_mux), 0, 0x7C,
+	  1, 0, 0, 0, 0x94, 27, 0},
+	{ AGILEX_EMAC2_CLK, "emac2_clk", NULL, emac_mux, ARRAY_SIZE(emac_mux), 0, 0x7C,
+	  2, 0, 0, 0, 0x94, 28, 0},
+	{ AGILEX_EMAC_PTP_CLK, "emac_ptp_clk", "emac_ptp_free_clk", NULL, 1, 0, 0x7C,
+	  3, 0, 0, 0, 0, 0, 0},
+	{ AGILEX_GPIO_DB_CLK, "gpio_db_clk", "gpio_db_free_clk", NULL, 1, 0, 0x7C,
+	  4, 0x98, 0, 16, 0, 0, 0},
+	{ AGILEX_SDMMC_CLK, "sdmmc_clk", "sdmmc_free_clk", NULL, 1, 0, 0x7C,
+	  5, 0, 0, 0, 0, 0, 4},
+	{ AGILEX_S2F_USER1_CLK, "s2f_user1_clk", "s2f_user1_free_clk", NULL, 1, 0, 0x7C,
+	  6, 0, 0, 0, 0, 0, 0},
+	{ AGILEX_PSI_REF_CLK, "psi_ref_clk", "psi_ref_free_clk", NULL, 1, 0, 0x7C,
+	  7, 0, 0, 0, 0, 0, 0},
+	{ AGILEX_USB_CLK, "usb_clk", "l4_mp_clk", NULL, 1, 0, 0x7C,
+	  8, 0, 0, 0, 0, 0, 0},
+	{ AGILEX_SPI_M_CLK, "spi_m_clk", "l4_mp_clk", NULL, 1, 0, 0x7C,
+	  9, 0, 0, 0, 0, 0, 0},
+	{ AGILEX_NAND_CLK, "nand_clk", "l4_main_clk", NULL, 1, 0, 0x7C,
+	  10, 0, 0, 0, 0, 0, 0},
+};
+
+static int agilex_clk_register_c_perip(const struct stratix10_perip_c_clock *clks,
+				       int nums, struct stratix10_clock_data *data)
+{
+	struct clk *clk;
+	void __iomem *base = data->base;
+	int i;
+
+	for (i = 0; i < nums; i++) {
+		clk = s10_register_periph(clks[i].name, clks[i].parent_name,
+					  clks[i].parent_names, clks[i].num_parents,
+					  clks[i].flags, base, clks[i].offset);
+		if (IS_ERR(clk)) {
+			pr_err("%s: failed to register clock %s\n",
+			       __func__, clks[i].name);
+			continue;
+		}
+		data->clk_data.clks[clks[i].id] = clk;
+	}
+	return 0;
+}
+
+static int agilex_clk_register_cnt_perip(const struct stratix10_perip_cnt_clock *clks,
+					 int nums, struct stratix10_clock_data *data)
+{
+	struct clk *clk;
+	void __iomem *base = data->base;
+	int i;
+
+	for (i = 0; i < nums; i++) {
+		clk = s10_register_cnt_periph(clks[i].name, clks[i].parent_name,
+					      clks[i].parent_names,
+					      clks[i].num_parents,
+					      clks[i].flags, base,
+					      clks[i].offset,
+					      clks[i].fixed_divider,
+					      clks[i].bypass_reg,
+					      clks[i].bypass_shift);
+		if (IS_ERR(clk)) {
+			pr_err("%s: failed to register clock %s\n",
+			       __func__, clks[i].name);
+			continue;
+		}
+		data->clk_data.clks[clks[i].id] = clk;
+	}
+
+	return 0;
+}
+
+static int agilex_clk_register_gate(const struct stratix10_gate_clock *clks,					    int nums, struct stratix10_clock_data *data)
+{
+	struct clk *clk;
+	void __iomem *base = data->base;
+	int i;
+
+	for (i = 0; i < nums; i++) {
+		clk = s10_register_gate(clks[i].name, clks[i].parent_name,
+					clks[i].parent_names,
+					clks[i].num_parents,
+					clks[i].flags, base,
+					clks[i].gate_reg,
+					clks[i].gate_idx, clks[i].div_reg,
+					clks[i].div_offset, clks[i].div_width,
+					clks[i].bypass_reg,
+					clks[i].bypass_shift,
+					clks[i].fixed_div);
+		if (IS_ERR(clk)) {
+			pr_err("%s: failed to register clock %s\n",
+			       __func__, clks[i].name);
+			continue;
+		}
+		data->clk_data.clks[clks[i].id] = clk;
+	}
+
+	return 0;
+}
+
+static int agilex_clk_register_pll(const struct stratix10_pll_clock *clks,
+				 int nums, struct stratix10_clock_data *data)
+{
+	struct clk *clk;
+	void __iomem *base = data->base;
+	int i;
+
+	for (i = 0; i < nums; i++) {
+		clk = agilex_register_pll(clks[i].name, clks[i].parent_names,
+				    clks[i].num_parents,
+				    clks[i].flags, base,
+				    clks[i].offset);
+		if (IS_ERR(clk)) {
+			pr_err("%s: failed to register clock %s\n",
+			       __func__, clks[i].name);
+			continue;
+		}
+		data->clk_data.clks[clks[i].id] = clk;
+	}
+
+	return 0;
+}
+
+static struct stratix10_clock_data *__socfpga_agilex_clk_init(struct platform_device *pdev,
+						    int nr_clks)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct stratix10_clock_data *clk_data;
+	struct clk **clk_table;
+	struct resource *res;
+	void __iomem *base;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base)) {
+		pr_err("%s: failed to map clock registers\n", __func__);
+		return ERR_CAST(base);
+	}
+
+	clk_data = devm_kzalloc(dev, sizeof(*clk_data), GFP_KERNEL);
+	if (!clk_data)
+		return ERR_PTR(-ENOMEM);
+
+	clk_data->base = base;
+	clk_table = devm_kcalloc(dev, nr_clks, sizeof(*clk_table), GFP_KERNEL);
+	if (!clk_table)
+		return ERR_PTR(-ENOMEM);
+
+	clk_data->clk_data.clks = clk_table;
+	clk_data->clk_data.clk_num = nr_clks;
+	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data->clk_data);
+	return clk_data;
+}
+
+static int agilex_clkmgr_init(struct platform_device *pdev)
+{
+	struct stratix10_clock_data *clk_data;
+
+	clk_data = __socfpga_agilex_clk_init(pdev, AGILEX_NUM_CLKS);
+	if (IS_ERR(clk_data))
+		return PTR_ERR(clk_data);
+
+	agilex_clk_register_pll(agilex_pll_clks, ARRAY_SIZE(agilex_pll_clks), clk_data);
+
+	agilex_clk_register_c_perip(agilex_main_perip_c_clks,
+				 ARRAY_SIZE(agilex_main_perip_c_clks), clk_data);
+
+	agilex_clk_register_cnt_perip(agilex_main_perip_cnt_clks,
+				   ARRAY_SIZE(agilex_main_perip_cnt_clks),
+				   clk_data);
+
+	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
+			      clk_data);
+	return 0;
+}
+
+static int agilex_clkmgr_probe(struct platform_device *pdev)
+{
+	return	agilex_clkmgr_init(pdev);
+}
+
+static const struct of_device_id agilex_clkmgr_match_table[] = {
+	{ .compatible = "intel,agilex-clkmgr",
+	  .data = agilex_clkmgr_init },
+	{ }
+};
+
+static struct platform_driver agilex_clkmgr_driver = {
+	.probe		= agilex_clkmgr_probe,
+	.driver		= {
+		.name	= "agilex-clkmgr",
+		.suppress_bind_attrs = true,
+		.of_match_table = agilex_clkmgr_match_table,
+	},
+};
+
+static int __init agilex_clk_init(void)
+{
+	return platform_driver_register(&agilex_clkmgr_driver);
+}
+core_initcall(agilex_clk_init);
diff --git a/drivers/clk/socfpga/clk-pll-s10.c b/drivers/clk/socfpga/clk-pll-s10.c
index 4705eb544f01..e6ce0ec39494 100644
--- a/drivers/clk/socfpga/clk-pll-s10.c
+++ b/drivers/clk/socfpga/clk-pll-s10.c
@@ -18,8 +18,12 @@
 #define SOCFPGA_PLL_RESET_MASK		0x2
 #define SOCFPGA_PLL_REFDIV_MASK		0x00003F00
 #define SOCFPGA_PLL_REFDIV_SHIFT	8
+#define SOCFPGA_PLL_AREFDIV_MASK	0x00000F00
+#define SOCFPGA_PLL_DREFDIV_MASK	0x00003000
+#define SOCFPGA_PLL_DREFDIV_SHIFT	12
 #define SOCFPGA_PLL_MDIV_MASK		0xFF000000
 #define SOCFPGA_PLL_MDIV_SHIFT		24
+#define SOCFPGA_AGILEX_PLL_MDIV_MASK	0x000003FF
 #define SWCTRLBTCLKSEL_MASK		0x200
 #define SWCTRLBTCLKSEL_SHIFT		9
 
@@ -27,6 +31,27 @@
 
 #define to_socfpga_clk(p) container_of(p, struct socfpga_pll, hw.hw)
 
+static unsigned long agilex_clk_pll_recalc_rate(struct clk_hw *hwclk,
+						unsigned long parent_rate)
+{
+	struct socfpga_pll *socfpgaclk = to_socfpga_clk(hwclk);
+	unsigned long arefdiv, reg, mdiv;
+	unsigned long long vco_freq;
+
+	/* read VCO1 reg for numerator and denominator */
+	reg = readl(socfpgaclk->hw.reg);
+	arefdiv = (reg & SOCFPGA_PLL_AREFDIV_MASK) >> SOCFPGA_PLL_REFDIV_SHIFT;
+
+	vco_freq = (unsigned long long)parent_rate / arefdiv;
+
+	/* Read mdiv and fdiv from the fdbck register */
+	reg = readl(socfpgaclk->hw.reg + 0x24);
+	mdiv = (reg & SOCFPGA_AGILEX_PLL_MDIV_MASK);
+
+	vco_freq = (unsigned long long)vco_freq * mdiv;
+	return (unsigned long)vco_freq;
+}
+
 static unsigned long clk_pll_recalc_rate(struct clk_hw *hwclk,
 					 unsigned long parent_rate)
 {
@@ -96,6 +121,12 @@ static int clk_pll_prepare(struct clk_hw *hwclk)
 	return 0;
 }
 
+static struct clk_ops agilex_clk_pll_ops = {
+	.recalc_rate = agilex_clk_pll_recalc_rate,
+	.get_parent = clk_pll_get_parent,
+	.prepare = clk_pll_prepare,
+};
+
 static struct clk_ops clk_pll_ops = {
 	.recalc_rate = clk_pll_recalc_rate,
 	.get_parent = clk_pll_get_parent,
@@ -145,3 +176,42 @@ struct clk *s10_register_pll(const char *name, const char * const *parent_names,
 	}
 	return clk;
 }
+
+struct clk *agilex_register_pll(const char *name,
+				const char * const *parent_names,
+				u8 num_parents, unsigned long flags,
+				void __iomem *reg, unsigned long offset)
+{
+	struct clk *clk;
+	struct socfpga_pll *pll_clk;
+	struct clk_init_data init;
+
+	pll_clk = kzalloc(sizeof(*pll_clk), GFP_KERNEL);
+	if (WARN_ON(!pll_clk))
+		return NULL;
+
+	pll_clk->hw.reg = reg + offset;
+
+	if (streq(name, SOCFPGA_BOOT_CLK))
+		init.ops = &clk_boot_ops;
+	else
+		init.ops = &agilex_clk_pll_ops;
+
+	init.name = name;
+	init.flags = flags;
+
+	init.num_parents = num_parents;
+	init.parent_names = parent_names;
+	pll_clk->hw.hw.init = &init;
+
+	pll_clk->hw.bit_idx = SOCFPGA_PLL_POWER;
+	clk_pll_ops.enable = clk_gate_ops.enable;
+	clk_pll_ops.disable = clk_gate_ops.disable;
+
+	clk = clk_register(NULL, &pll_clk->hw.hw);
+	if (WARN_ON(IS_ERR(clk))) {
+		kfree(pll_clk);
+		return NULL;
+	}
+	return clk;
+}
diff --git a/drivers/clk/socfpga/stratix10-clk.h b/drivers/clk/socfpga/stratix10-clk.h
index e8e121907952..af1464bc2fec 100644
--- a/drivers/clk/socfpga/stratix10-clk.h
+++ b/drivers/clk/socfpga/stratix10-clk.h
@@ -63,6 +63,9 @@ struct stratix10_gate_clock {
 struct clk *s10_register_pll(const char *, const char *const *, u8,
 			     unsigned long, void __iomem *, unsigned long);
 
+struct clk *agilex_register_pll(const char *, const char *const *, u8,
+				unsigned long, void __iomem *, unsigned long);
+
 struct clk *s10_register_periph(const char *, const char *,
 				const char * const *, u8, unsigned long,
 				void __iomem *, unsigned long);
-- 
2.20.0

