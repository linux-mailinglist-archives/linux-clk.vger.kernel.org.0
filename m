Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24EA88164E
	for <lists+linux-clk@lfdr.de>; Mon,  5 Aug 2019 12:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728220AbfHEKDW (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 5 Aug 2019 06:03:22 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:55735 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728148AbfHEKDW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Aug 2019 06:03:22 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id CE71C60008;
        Mon,  5 Aug 2019 10:03:17 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     <devicetree@vger.kernel.org>, linux-clk@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Stefan Chulski <stefanc@marvell.com>,
        Yan Markman <ymarkman@marvell.com>,
        Christine Gharzuzi <chrisg@marvell.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 3/8] clk: mvebu: ap806-cpu: prepare mapping of AP807 CPU clock
Date:   Mon,  5 Aug 2019 12:03:05 +0200
Message-Id: <20190805100310.29048-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805100310.29048-1-miquel.raynal@bootlin.com>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Christine Gharzuzi <chrisg@marvell.com>

This patch allows same flow to be executed on chips with different
register mappings like AP806 and, in the future, AP807.

Note: this patch has no functional effect, and only prepares the
driver for additional chips to be supported by retrieving the right
device data depenging on the compatible property.

Signed-off-by: Christine Gharzuzi <chrisg@marvell.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/mvebu/ap-cpu-clk.c | 82 +++++++++++++++++++++++++---------
 1 file changed, 62 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/mvebu/ap-cpu-clk.c b/drivers/clk/mvebu/ap-cpu-clk.c
index e4cecb456884..784104f6793b 100644
--- a/drivers/clk/mvebu/ap-cpu-clk.c
+++ b/drivers/clk/mvebu/ap-cpu-clk.c
@@ -15,6 +15,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include "armada_ap_cp_helper.h"
@@ -29,6 +30,26 @@
 
 #define APN806_MAX_DIVIDER		32
 
+/**
+ * struct cpu_dfs_regs: CPU DFS register mapping
+ * @divider_reg: full integer ratio from PLL frequency to CPU clock frequency
+ * @force_reg: request to force new ratio regardless of relation to other clocks
+ * @ratio_reg: central request to switch ratios
+ */
+struct cpu_dfs_regs {
+	unsigned int divider_reg;
+	unsigned int force_reg;
+	unsigned int ratio_reg;
+	unsigned int ratio_state_reg;
+	unsigned int divider_mask;
+	unsigned int cluster_offset;
+	unsigned int force_mask;
+	int divider_offset;
+	int ratio_offset;
+	int ratio_state_offset;
+	int ratio_state_cluster_offset;
+};
+
 /* AP806 CPU DFS register mapping*/
 #define AP806_CA72MP2_0_PLL_CR_0_REG_OFFSET		0x278
 #define AP806_CA72MP2_0_PLL_CR_1_REG_OFFSET		0x280
@@ -43,6 +64,7 @@
 #define AP806_PLL_CR_0_CPU_CLK_RELOAD_FORCE_MASK \
 			(0x1 << AP806_PLL_CR_0_CPU_CLK_RELOAD_FORCE_OFFSET)
 #define AP806_PLL_CR_0_CPU_CLK_RELOAD_RATIO_OFFSET	16
+#define AP806_CA72MP2_0_PLL_RATIO_STABLE_OFFSET	0
 #define AP806_CA72MP2_0_PLL_RATIO_STATE			11
 
 #define STATUS_POLL_PERIOD_US		1
@@ -50,6 +72,20 @@
 
 #define to_ap_cpu_clk(_hw) container_of(_hw, struct ap_cpu_clk, hw)
 
+static const struct cpu_dfs_regs ap806_dfs_regs = {
+	.divider_reg = AP806_CA72MP2_0_PLL_CR_0_REG_OFFSET,
+	.force_reg = AP806_CA72MP2_0_PLL_CR_1_REG_OFFSET,
+	.ratio_reg = AP806_CA72MP2_0_PLL_CR_2_REG_OFFSET,
+	.ratio_state_reg = AP806_CA72MP2_0_PLL_SR_REG_OFFSET,
+	.divider_mask = AP806_PLL_CR_0_CPU_CLK_DIV_RATIO_MASK,
+	.cluster_offset = AP806_CA72MP2_0_PLL_CR_CLUSTER_OFFSET,
+	.force_mask = AP806_PLL_CR_0_CPU_CLK_RELOAD_FORCE_MASK,
+	.divider_offset = AP806_PLL_CR_0_CPU_CLK_DIV_RATIO_OFFSET,
+	.ratio_offset = AP806_PLL_CR_0_CPU_CLK_RELOAD_RATIO_OFFSET,
+	.ratio_state_offset = AP806_CA72MP2_0_PLL_RATIO_STABLE_OFFSET,
+	.ratio_state_cluster_offset = AP806_CA72MP2_0_PLL_RATIO_STABLE_OFFSET,
+};
+
 /*
  * struct ap806_clk: CPU cluster clock controller instance
  * @cluster: Cluster clock controller index
@@ -64,6 +100,7 @@ struct ap_cpu_clk {
 	struct device *dev;
 	struct clk_hw hw;
 	struct regmap *pll_cr_base;
+	const struct cpu_dfs_regs *pll_regs;
 };
 
 static unsigned long ap_cpu_clk_recalc_rate(struct clk_hw *hw,
@@ -73,11 +110,11 @@ static unsigned long ap_cpu_clk_recalc_rate(struct clk_hw *hw,
 	unsigned int cpu_clkdiv_reg;
 	int cpu_clkdiv_ratio;
 
-	cpu_clkdiv_reg = AP806_CA72MP2_0_PLL_CR_0_REG_OFFSET +
-		(clk->cluster * AP806_CA72MP2_0_PLL_CR_CLUSTER_OFFSET);
+	cpu_clkdiv_reg = clk->pll_regs->divider_reg +
+		(clk->cluster * clk->pll_regs->cluster_offset);
 	regmap_read(clk->pll_cr_base, cpu_clkdiv_reg, &cpu_clkdiv_ratio);
-	cpu_clkdiv_ratio &= AP806_PLL_CR_0_CPU_CLK_DIV_RATIO_MASK;
-	cpu_clkdiv_ratio >>= AP806_PLL_CR_0_CPU_CLK_DIV_RATIO_OFFSET;
+	cpu_clkdiv_ratio &= clk->pll_regs->divider_mask;
+	cpu_clkdiv_ratio >>= clk->pll_regs->divider_offset;
 
 	return parent_rate / cpu_clkdiv_ratio;
 }
@@ -89,35 +126,36 @@ static int ap_cpu_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	int ret, reg, divider = parent_rate / rate;
 	unsigned int cpu_clkdiv_reg, cpu_force_reg, cpu_ratio_reg, stable_bit;
 
-	cpu_clkdiv_reg = AP806_CA72MP2_0_PLL_CR_0_REG_OFFSET +
-		(clk->cluster * AP806_CA72MP2_0_PLL_CR_CLUSTER_OFFSET);
-	cpu_force_reg = AP806_CA72MP2_0_PLL_CR_1_REG_OFFSET +
-		(clk->cluster * AP806_CA72MP2_0_PLL_CR_CLUSTER_OFFSET);
-	cpu_ratio_reg = AP806_CA72MP2_0_PLL_CR_2_REG_OFFSET +
-		(clk->cluster * AP806_CA72MP2_0_PLL_CR_CLUSTER_OFFSET);
+	cpu_clkdiv_reg = clk->pll_regs->divider_reg +
+		(clk->cluster * clk->pll_regs->cluster_offset);
+	cpu_force_reg = clk->pll_regs->force_reg +
+		(clk->cluster * clk->pll_regs->cluster_offset);
+	cpu_ratio_reg = clk->pll_regs->ratio_reg +
+		(clk->cluster * clk->pll_regs->cluster_offset);
 
 	regmap_update_bits(clk->pll_cr_base, cpu_clkdiv_reg,
-			   AP806_PLL_CR_0_CPU_CLK_DIV_RATIO_MASK, divider);
+			   clk->pll_regs->divider_mask, divider);
 
 	regmap_update_bits(clk->pll_cr_base, cpu_force_reg,
-			   AP806_PLL_CR_0_CPU_CLK_RELOAD_FORCE_MASK,
-			   AP806_PLL_CR_0_CPU_CLK_RELOAD_FORCE_MASK);
+			   clk->pll_regs->force_mask,
+			   clk->pll_regs->force_mask);
 
 	regmap_update_bits(clk->pll_cr_base, cpu_ratio_reg,
-			   BIT(AP806_PLL_CR_0_CPU_CLK_RELOAD_RATIO_OFFSET),
-			   BIT(AP806_PLL_CR_0_CPU_CLK_RELOAD_RATIO_OFFSET));
-
-	stable_bit = BIT(clk->cluster * AP806_CA72MP2_0_PLL_RATIO_STATE),
+			   BIT(clk->pll_regs->ratio_offset),
+			   BIT(clk->pll_regs->ratio_offset));
 
+	stable_bit = BIT(clk->pll_regs->ratio_state_offset +
+			 clk->cluster *
+			 clk->pll_regs->ratio_state_cluster_offset),
 	ret = regmap_read_poll_timeout(clk->pll_cr_base,
-				       AP806_CA72MP2_0_PLL_SR_REG_OFFSET, reg,
+				       clk->pll_regs->ratio_state_reg, reg,
 				       reg & stable_bit, STATUS_POLL_PERIOD_US,
 				       STATUS_POLL_TIMEOUT_US);
 	if (ret)
 		return ret;
 
 	regmap_update_bits(clk->pll_cr_base, cpu_ratio_reg,
-			   BIT(AP806_PLL_CR_0_CPU_CLK_RELOAD_RATIO_OFFSET), 0);
+			   BIT(clk->pll_regs->ratio_offset), 0);
 
 	return 0;
 }
@@ -222,6 +260,7 @@ static int ap_cpu_clock_probe(struct platform_device *pdev)
 		ap_cpu_clk[cluster_index].pll_cr_base = regmap;
 		ap_cpu_clk[cluster_index].hw.init = &init;
 		ap_cpu_clk[cluster_index].dev = dev;
+		ap_cpu_clk[cluster_index].pll_regs = of_device_get_match_data(&pdev->dev);
 
 		init.name = ap_cpu_clk[cluster_index].clk_name;
 		init.ops = &ap_cpu_clk_ops;
@@ -244,7 +283,10 @@ static int ap_cpu_clock_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id ap_cpu_clock_of_match[] = {
-	{ .compatible = "marvell,ap806-cpu-clock", },
+	{
+		.compatible = "marvell,ap806-cpu-clock",
+		.data = &ap806_dfs_regs,
+	},
 	{ }
 };
 
-- 
2.20.1

